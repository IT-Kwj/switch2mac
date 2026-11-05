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
    float4 m_67 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_71 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = in.m_46.w;
    float _91 = trunc(_87);
    int _94 = int(_91);
    float _96 = -_89;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _98;
    bool _102 = _94 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_94);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_51.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_114);
        out.gl_Position.z = _1903;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _118 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_89);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_94);
    bool _130 = _98 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    if (_134)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _106;
    if (_134)
    {
        out.m_51.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _116 = as_type<int>(_138);
    }
    int _140 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1958 = as_type<float>(_140);
        out.gl_Position.z = _1958;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_53.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _98 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_55.x;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_55.y;
    float _162 = in.m_46.x;
    float _164 = in.m_46.y;
    float _166 = in.m_46.z;
    float _168 = _146 * _144;
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _172 = _170 * 6.283185482025146484375;
    float _174 = floor(_170);
    float _176 = _172 * 0.15915493667125701904296875;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _176 * 6.283185482025146484375;
    float _184 = cos(_182);
    float _186 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _188 = -_174;
    float _190 = _170 + _188;
    float _192 = _170;
    float _194 = _186;
    if (!_158)
    {
        float _196 = _186 * _186;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    bool _202 = _190 < 0.5;
    float _204 = float(_202);
    float _206 = _200;
    if (!_158)
    {
        float _208 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_158;
    float _214 = _210;
    float _216 = _160;
    float _218 = _148;
    if (!_212)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _186 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _186);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _248;
    }
    float _250 = _214;
    bool _252 = !_158;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _186 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _194 = _272;
    }
    float _274 = _194;
    float _276 = fma(_184, 0.5, 0.5);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = -_190;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = in.m_57.w;
    float _292 = -_276;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _296 = -_204;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _300 = !_280;
    int _302 = _300 ? 0 : 1;
    float _304 = in.m_44.x;
    float _306 = in.m_44.y;
    float _308 = in.m_44.z;
    float _310 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _312 = 1.0 / _128;
    int _314 = abs(_302);
    out.m_59.x = _148;
    float _316 = fma(_274, _162, _310);
    bool _318 = !_284;
    int _320 = _318 ? 0 : 1;
    out.m_59.y = _160;
    bool _322 = !_180;
    int _324 = _322 ? 0 : 1;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_320);
    int _330 = abs(_324);
    float _332 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = float(_314);
    float _336 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_330);
    float _340 = fma(_274, _164, _332);
    float _342 = abs(_288);
    float _344 = _334 * _342;
    float _346 = fma(_274, _166, _336);
    float _348 = fma(_316, _290, _304);
    float _350 = float(_328);
    float _352 = fma(_338, _294, _344);
    float _354 = fma(_340, _290, _306);
    float _356 = fma(_346, _290, _308);
    float _358 = _98 * _312;
    float _360 = abs(_298);
    float _362 = fma(_350, _360, _352);
    bool _364 = !_326;
    float _366 = _358;
    int _368 = as_type<int>(_352);
    bool _370 = false;
    float _372 = as_type<float>(_330);
    if (!_364)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _376 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _366 = _386;
    }
    float _388 = _366;
    float _390 = in.m_53.y;
    float _392 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = in.m_53.z;
    float _396 = in.m_53.w;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    float _402 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _406 = _404 != 0;
    float _408 = in.m_57.x;
    float _410 = in.m_57.y;
    float _412 = in.m_57.z;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _416 = _414 != 0;
    float _418 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _422 = _420 != 0;
    float _424 = in.m_61.x;
    float _426 = in.m_61.y;
    float _428 = in.m_61.z;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _436 = _434 != 0;
    float _438 = -_160;
    float _440 = _438 + 1.0;
    if (_400)
    {
        float _442 = -_148;
        float _444 = _442 + 1.0;
        _368 = as_type<int>(_444);
    }
    int _446 = _368;
    if (_400)
    {
        bool _448 = _142 > 0.5;
        _370 = _448;
    }
    bool _450 = _370;
    if (!_400)
    {
        _372 = _148;
    }
    float _452 = _372;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = _452;
    if (_400)
    {
        float _458 = _450 ? as_type<float>(_446) : _148;
        _456 = _458;
    }
    float _460 = _456;
    float _462 = 0.0;
    if (_416)
    {
        float _464 = in.m_53.z;
        _462 = _464;
    }
    float _466 = _462;
    bool _468 = _390 > 0.5;
    bool _470 = _396 > 0.5;
    int _472 = _468 ? as_type<int>(_440) : as_type<int>(_160);
    float _474 = _408 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _478 = _476 != 0;
    float _480 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = _410 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _480);
    float _490 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _426);
    float _494 = 1.0 / _484;
    float _496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _424);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _502 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _428);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _508 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _518 = -_454;
    float _520 = fma(_502, 2.0, _518);
    float _522 = 1.0 / _512;
    float _524 = _412 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = fma(_508, -2.0, _506);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _532 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
    float _534 = _362 * _474;
    float _536 = _362 * _486;
    float _538 = 1.0 / _500;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _540;
    float _544 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _418);
    float _546 = _362 * _524;
    float _548 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
    float _550 = _542 * _494;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = 1.0 / _516;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _562 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _564 = _406 ? as_type<float>(_472) : _160;
    float _566 = 1.0 / _530;
    float _568 = _554 * _538;
    float _570 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _572 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _570;
    bool _574 = _394 > 0.5;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _584 = 1.0 / _560;
    int _586 = _574 ? as_type<int>(_440) : as_type<int>(_160);
    float _588 = _578 * _522;
    float _590 = _582 * _556;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _592;
    bool _596 = _574;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _600 = _544;
    float _602 = _526;
    if (_416)
    {
        bool _604 = _466 > 0.5;
        _596 = _604;
    }
    bool _606 = _596;
    float _608 = -_98;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _520);
    float _612 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _612;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _618 = _594 * _566;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _624 = _614 * _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _388 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _388 + _630;
    if (_416)
    {
        float _634 = -_148;
        float _636 = _634 + 1.0;
        _598 = as_type<int>(_636);
    }
    int _638 = _598;
    float _640 = fma(_572, _572, _624);
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _644 = fma(_550, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _648 = _388 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _652 = _388 + _650;
    float _654 = _622 * _584;
    float _656 = fma(_568, _632, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _660 = _388 + _658;
    float _662 = fma(_588, _648, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _666 = fma(_590, _652, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _668 = fma(_618, _660, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _670 = _616 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _672 = _652;
    if (!_416)
    {
        _672 = _148;
    }
    float _674 = _672;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _678 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _680 = fma(_670, _460, -0.5);
    float _682 = _432 ? as_type<float>(_586) : _160;
    float _684 = fma(_678, _564, -0.5);
    float _686 = _674;
    float _688 = _676;
    if (_416)
    {
        float _690 = _606 ? as_type<float>(_638) : _148;
        _686 = _690;
    }
    float _692 = _686;
    float _694 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    if (_436)
    {
        float _696 = _470 ? _440 : _160;
        _216 = _696;
    }
    float _698 = _216;
    float _700 = _544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_478)
    {
        _688 = _390;
    }
    float _702 = _688;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _706 = _664 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _708 = -_700;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _712 = _702;
    if (!_478)
    {
        _600 = _702;
    }
    float _714 = _600;
    float _716 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].w, _704);
    bool _718 = _390 > 0.5;
    bool _720 = _718 && _422;
    float _722 = _710 * _710;
    float _724 = _714;
    if (_478)
    {
        _712 = _390;
    }
    float _726 = _712;
    float _728 = fma(_682, _706, -0.5);
    float _730 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _732 = -_562;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = -_730;
    float _740 = _738 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = fma(_734, _734, _722);
    float _744 = _736 * _496;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _748 = fma(_740, _740, _742);
    float _750 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _754 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _756 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _754;
    float _758 = rsqrt(_748);
    float _760 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _746);
    float _762 = _752 * _504;
    bool _764 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _766 = isnan(_388);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_756, _756, _640);
    float _778 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _760);
    float _780 = _750 * _492;
    bool _782 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _784 = isnan(_388);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _796 = _388 + _794;
    float _798 = -_774;
    float _800 = _798 + 1.0;
    float _802 = fma(_778, _680, _610);
    bool _804 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _806 = isnan(_388);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = fma(_654, _796, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _818 = _792 * _800;
    bool _820 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _822 = isnan(_388);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -_792;
    float _834 = _832 + 1.0;
    float _836 = _734 * _758;
    float _838 = _710 * _758;
    float _840 = -_814;
    float _842 = _840 + 1.0;
    float _844 = _740 * _758;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _848 = _836 * _846;
    bool _850 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _852 = isnan(_388);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _830 * _842;
    bool _864 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_388);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _878 = -_848;
    float _880 = fma(_844, _876, _878);
    bool _882 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = isnan(_388);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -_830;
    float _896 = _894 + 1.0;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _900 = _844 * _898;
    float _902 = _814 * _834;
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _906 = _838 * _904;
    float _908 = _880 * _880;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _912 = -_900;
    float _914 = fma(_838, _910, _912);
    float _916 = _892 * _896;
    float _918 = -_892;
    float _920 = _918 + 1.0;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = -_906;
    float _926 = fma(_836, _922, _924);
    float _928 = fma(_914, _914, _908);
    float _930 = -_874;
    float _932 = _930 + 1.0;
    float _934 = _874 * _920;
    float _936 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _938 = fma(_926, _926, _928);
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _942 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _526);
    float _944 = _860 * _932;
    float _946 = _836;
    float _948 = _726;
    if (_478)
    {
        _724 = _142;
    }
    float _950 = _724;
    float _952 = -_942;
    float _954 = fma(_936, _684, _952);
    float _956 = _644 * _944;
    float _958 = rsqrt(_938);
    if (_478)
    {
        _602 = _142;
    }
    float _960 = _602;
    float _962 = _950 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _964 = _960;
    if (!_478)
    {
        _964 = _394;
    }
    float _966 = _964;
    float _968 = 0.0;
    if (!_478)
    {
        _968 = _394;
    }
    float _970 = _968;
    float _972 = sqrt(_776);
    float _974 = _940 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _976 = -_860;
    float _978 = _976 + 1.0;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _982 = fma(_974, _698, -0.5);
    float _984 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[115].x, _956);
    float _986 = _970;
    if (_478)
    {
        _986 = _726;
    }
    float _988 = _986;
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _992 = _914 * _958;
    float _994 = _880 * _958;
    float _996 = _926 * _958;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1000 = _844 * _994;
    float _1002 = _966 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1004 = fma(_972, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1006 = _838 * _992;
    float _1008 = -_1000;
    float _1010 = fma(_838, _996, _1008);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1014 = -_1006;
    float _1016 = fma(_836, _994, _1014);
    float _1018 = _780 * _1010;
    float _1020 = precise::max(_1004, 1.0);
    float _1022 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1024 = _780 * _1016;
    float _1026 = -_980;
    float _1028 = fma(_1002, 2.0, _1026);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1032 = fma(_1022, _692, -0.5);
    float _1034 = fma(_744, _992, _1018);
    float _1036 = fma(_744, _996, _1024);
    float _1038 = precise::min(_1020, 1.89999997615814208984375);
    float _1040 = _836 * _996;
    float _1042 = fma(_762, _836, _1034);
    float _1044 = fma(_762, _844, _1036);
    float _1046 = _1024;
    if (!_422)
    {
        _1046 = _148;
    }
    float _1048 = _1046;
    float _1050 = _1048;
    if (_720)
    {
        float _1052 = -_148;
        float _1054 = _1052 + 1.0;
        _218 = _1054;
    }
    float _1056 = _218;
    float _1058 = fma(_1042, _1038, _562);
    float _1060 = fma(_1044, _1038, _730);
    float _1062 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1012);
    float _1064 = _1060;
    float _1066 = _1058;
    if (!_478)
    {
        _946 = _394;
    }
    float _1068 = _946;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1072 = _1058 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1076 = _1060 + _1074;
    float _1078 = _1068;
    if (_422)
    {
        _1050 = _1056;
    }
    float _1080 = _1050;
    float _1082 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _998);
    float _1084 = _1072 * _1072;
    float _1086 = _1076 * _1076;
    float _1088 = _1084;
    float _1090 = _1086;
    if (_478)
    {
        _1078 = _726;
    }
    float _1092 = _1078;
    float _1094 = -_1040;
    float _1096 = fma(_844, _992, _1094);
    float _1098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1100 = _1084 + _1086;
    float _1102 = -_1030;
    float _1104 = fma(_962, 2.0, _1102);
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1108 = _780 * _1096;
    float _1110 = fma(_656, _934, _984);
    float _1112 = sqrt(_1100);
    float _1114 = fma(_744, _994, _1108);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1118 = fma(_662, _916, _1110);
    float _1120 = fma(_762, _838, _1114);
    float _1122 = _1100;
    if (!_478)
    {
        _948 = _142;
    }
    float _1124 = _948;
    float _1126 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1062);
    float _1128 = -_98;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1104);
    float _1132 = fma(_1120, _1038, _700);
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1136 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1116);
    float _1138 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1140 = fma(_666, _862, _1118);
    float _1142 = fma(_1126, _1032, _1130);
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1146 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = fma(_1106, -2.0, _1134);
    float _1150 = fma(_1138, _1080, -0.5);
    float _1152 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1136);
    float _1154 = -_98;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1028);
    float _1158 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1160 = _1126;
    float _1162 = _1140;
    if (!_1146)
    {
        _1160 = _1132;
    }
    float _1164 = _1160;
    bool _1166 = !_1146;
    float _1168 = _1164;
    if (!_1166)
    {
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1174 = _1112 + _1172;
        float _1176 = rsqrt(_1100);
        float _1178 = _1174 * _1170;
        float _1180 = _1132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = _1178 * 0.15915493667125701904296875;
        float _1184 = _1182 * 6.283185482025146484375;
        float _1186 = sin(_1184);
        float _1188 = _1182 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = fma(_1186, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1194 = _1176 * _1192;
        float _1196 = _1190 + (-1.0);
        float _1198 = fma(_1072, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1200 = fma(_1076, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1202 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1206 = _1198 + _1204;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1210 = _1200 + _1208;
        float _1212 = fma(_1132, _1190, _1202);
        float _1214 = _1206 * _1206;
        float _1216 = _1210 * _1210;
        _1168 = _1212;
        _1088 = _1214;
        _1090 = _1216;
        _1064 = _1200;
        _1066 = _1198;
        _1122 = _1176;
    }
    float _1218 = _1168;
    float _1220 = _1088;
    float _1222 = _1090;
    float _1224 = _1064;
    float _1226 = _1066;
    float _1228 = _1122;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1218 + _1230;
    float _1234 = fma(_1158, -2.0, _1144);
    float _1236 = fma(_668, _902, _1140);
    float _1238 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].w, _716);
    float _1240 = fma(_1232, _1232, _1220);
    float _1242 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1082);
    float _1244 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1148);
    float _1246 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1234);
    float _1248 = _1240 + _1222;
    float _1250 = fma(_816, _818, _1236);
    float _1252 = -_1244;
    float _1254 = fma(_1242, _982, _1252);
    float _1256 = -_1246;
    float _1258 = fma(_1238, _728, _1256);
    float _1260 = fma(_1152, _1150, _1156);
    float _1262 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1250);
    float _1264 = sqrt(_1248);
    float _1266 = _802 + 0.5;
    float _1268 = _1258 + 0.5;
    float _1270 = _954 + 0.5;
    float _1272 = _1260 + 0.5;
    float _1274 = _1142 + 0.5;
    float _1276 = _1254 + 0.5;
    float _1278 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _700 + _1280;
    out.m_63.x = _1272;
    out.m_63.y = _1268;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1286 = _562 + _1284;
    float _1288 = _1282 * _1282;
    out.m_65.x = _1266;
    out.m_65.y = _1270;
    out.m_65.z = _1274;
    out.m_65.w = _1276;
    bool _1290 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1292 = isnan(_1264);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1298 = _1294 || _1296;
    out.m_67.w = _1278;
    float _1300 = fma(_1286, _1286, _1288);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1304 = _730 + _1302;
    float _1306 = fma(_1304, _1304, _1300);
    float _1308 = _1304;
    float _1310 = _1278;
    float _1312 = _1228;
    float _1314 = _1272;
    if (!_1298)
    {
        _1308 = 1.0;
    }
    float _1316 = _1308;
    bool _1318 = !_1298;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1264);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1264 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1264);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1264 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1384 = _1218 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1388 = _1224 + _1386;
    bool _1390 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan(0.5);
    bool _1398 = _1394 || _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1402 = _1226 + _1400;
    float _1404 = fma(_1384, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1406 = fma(_1388, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1408 = fma(_1402, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = _1384;
    if (_1398)
    {
        _1310 = _1408;
    }
    float _1412 = _1310;
    float _1414 = _1412;
    if (_1398)
    {
        _1410 = _1404;
    }
    float _1416 = _1410;
    float _1418 = _1416;
    if (_1398)
    {
        _1312 = _1406;
    }
    float _1420 = _1312;
    float _1422 = _1420;
    if (!_1398)
    {
        float _1424 = sqrt(_1306);
        float _1426 = -_730;
        float _1428 = _1426 + _1406;
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1434 = precise::min(_1424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1438 = _1434 * _1432;
        float _1440 = -_562;
        float _1442 = _1440 + _1408;
        float _1444 = _1436 * _1438;
        float _1446 = -_700;
        float _1448 = _1446 + _1404;
        float _1450 = fma(_1442, _1444, _562);
        float _1452 = fma(_1448, _1444, _700);
        float _1454 = fma(_1428, _1444, _730);
        _1418 = _1452;
        _1414 = _1450;
        _1422 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1414;
    float _1460 = _1422;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1456 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1460 + _1470;
    float _1474 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1476 = _1464 * _1464;
    float _1478 = fma(_1468, _1468, _1476);
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = rsqrt(_1480);
    float _1484 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1486 = _1468 * _1484;
    float _1488 = _1472 * _1484;
    float _1490 = _1486 * _1486;
    float _1492 = _1488 * _1488;
    float _1494 = _1490 + _1492;
    float _1496 = sqrt(_1494);
    bool _1498 = _1496 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1502 = _1496 + _1500;
    float _1504 = _700;
    float _1506 = _1502;
    float _1508 = _1474;
    float _1510 = _1464;
    float _1512 = _1486;
    if (_1498)
    {
        float _1514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1514;
    }
    float _1516 = _1504;
    float _1518 = _1516;
    if (_1498)
    {
        float _1520 = _1502 * _1516;
        _1506 = _1520;
    }
    float _1522 = _1506;
    if (_1498)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _1162 = _1524;
    }
    float _1526 = _1162;
    float _1528 = precise::max(0.0, _1474);
    float _1530 = _1528;
    if (_1498)
    {
        float _1532 = rsqrt(_1494);
        _1508 = _1532;
    }
    float _1534 = _1508;
    float _1536 = -_1484;
    float _1538 = -_1528;
    float _1540 = fma(_1464, _1536, _1538);
    float _1542 = _1534;
    if (_1498)
    {
        float _1544 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1544;
    }
    float _1546 = _1510;
    float _1548 = _1482;
    float _1550 = _1546;
    if (_1498)
    {
        float _1552 = _1526 * 6.283185482025146484375;
        float _1554 = sin(_1552);
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = _1472;
    if (_1498)
    {
        float _1560 = _1526 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = _1556;
    if (_1498)
    {
        float _1568 = fma(_1556, _1546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1566 = _1568;
    }
    float _1570 = _1566;
    float _1572 = sqrt(_1480);
    float _1574 = _1570;
    if (!_1498)
    {
        _1550 = _1490;
    }
    float _1576 = _1550;
    float _1578 = _1576;
    if (_1498)
    {
        float _1580 = _1534 * _1570;
        _1314 = _1580;
    }
    float _1582 = _1314;
    if (!_1498)
    {
        _1574 = _1540;
    }
    float _1584 = _1574;
    float _1586 = _1584;
    if (!_1498)
    {
        _1542 = _1488;
    }
    float _1588 = _1542;
    float _1590 = _1588;
    if (_1498)
    {
        float _1592 = _1564 + (-1.0);
        _1530 = _1592;
    }
    float _1594 = _1530;
    float _1596 = _1594;
    if (_1498)
    {
        float _1598 = _1486 * _1582;
        _1512 = _1598;
    }
    float _1600 = _1512;
    if (_1498)
    {
        float _1602 = _1488 * _1582;
        _1590 = _1602;
    }
    float _1604 = _1590;
    if (_1498)
    {
        float _1606 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1606;
    }
    float _1608 = _1518;
    if (_1498)
    {
        float _1610 = _1600 * _1600;
        _1578 = _1610;
    }
    float _1612 = _1578;
    if (!_1498)
    {
        _1596 = _1492;
    }
    float _1614 = _1596;
    float _1616 = _1614;
    if (_1498)
    {
        float _1618 = _1604 * _1604;
        _1616 = _1618;
    }
    float _1620 = _1616;
    if (_1498)
    {
        float _1622 = fma(_1540, _1564, _1608);
        _1586 = _1622;
    }
    float _1624 = _1586;
    float _1626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1628 = fma(_1624, _1624, _1612);
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1632 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1630);
    float _1634 = precise::clamp(_1632, 0.0, 1.0);
    float _1636 = _1628 + _1620;
    float _1638 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1640 = -_1634;
    float _1642 = _1640 + 1.0;
    float _1644 = rsqrt(_1636);
    float _1646 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1638);
    float _1648 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1652 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1656 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1658 = abs(_1642);
    float _1660 = log2(_1658);
    float _1662 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1664 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1654);
    float _1666 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1656);
    float _1668 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1670 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1672 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1674 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1666);
    float _1676 = _1644 * _1600;
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1680 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1682 = _1644 * _1624;
    float _1684 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1686 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1680);
    float _1690 = _1644 * _1604;
    float _1692 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1694 = -_1684;
    float _1696 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1694);
    float _1698 = -_1686;
    float _1700 = fma(_1698, _1626, 1.0);
    float _1702 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1688);
    float _1706 = exp2(_1692);
    float _1708 = -_1690;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1696);
    float _1712 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1714 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1704);
    float _1716 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = fma(_1710, -0.5, 0.5);
    float _1720 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1712);
    float _1722 = fma(_1710, 0.5, 0.5);
    float _1724 = log2(_1700);
    float _1726 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1728 = _1682 + 1.0;
    float _1730 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1732 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1734 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1736 = 1.0 / _1714;
    float _1738 = -_1682;
    float _1740 = fma(_1706, _1728, _1738);
    float _1742 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1730);
    float _1744 = fma(_1722, _1732, -0.212114393711090087890625);
    float _1746 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1734);
    float _1748 = fma(_1740, 0.5, 0.5);
    float _1750 = fma(_1722, _1744, 1.570728778839111328125);
    float _1752 = sqrt(_1718);
    float _1754 = _1724 * 0.693147182464599609375;
    float _1756 = _1742 * _1736;
    float _1758 = _1746 * _1736;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = fma(_1756, 0.5, 0.5);
    float _1764 = fma(_1758, -0.5, 0.5);
    float _1766 = _1752 * 0.636619746685028076171875;
    float3 _4607 = float3(_1762, _1764, _1760);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).x;
    float3 _4618 = float3(_1762, _1764, _1760);
    float4 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).xyzw;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1771.w;
    float _1781 = -_1750;
    float _1783 = fma(_1766, _1781, 1.0);
    float2 _4640 = float2(_1783, _1748);
    float3 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4640, float2(0.0), isnan(_4640)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4640, float2(0.0), isnan(_4640)), level(0.0)).xyz;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1799 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1797);
    float _1801 = exp2(_1795);
    float _1803 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1799);
    float _1805 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1807 = _1805 + _1714;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1746;
    out.gl_Position.z = _1805;
    out.gl_Position.w = _1714;
    float _1809 = _1807 * 0.5;
    float _1811 = -_1801;
    float _1813 = _1811 + 1.0;
    float _1815 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1817 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1809;
    out.m_69.w = _1714;
    out.m_71.w = _1815;
    out.m_51.x = 1.0;
    float _1819 = _1817 * _1768;
    float _1821 = -_1817;
    float _1823 = _1821 + 1.0;
    float _1825 = _1779 * _1819;
    float _1827 = _1793 * _1819;
    float _1829 = fma(_1789, _1825, _1773);
    float _1831 = fma(_1791, _1825, _1775);
    float _1833 = _1779 * _1823;
    float _1835 = fma(_1779, _1827, _1777);
    out.m_73.x = _1829;
    out.m_73.y = _1831;
    out.m_73.z = _1835;
    out.m_73.w = _1833;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = in.m_46.w;
    float _91 = trunc(_87);
    int _94 = int(_91);
    float _96 = -_89;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _98;
    bool _102 = _94 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_94);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_51.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_114);
        out.gl_Position.z = _1903;
    }
    if (!_102)
    {
        return out;
    }
    bool _118 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_89);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_94);
    bool _130 = _98 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    if (_134)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _106;
    if (_134)
    {
        out.m_51.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _116 = as_type<int>(_138);
    }
    int _140 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1958 = as_type<float>(_140);
        out.gl_Position.z = _1958;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_53.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _98 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_55.x;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_55.y;
    float _162 = in.m_46.x;
    float _164 = in.m_46.y;
    float _166 = in.m_46.z;
    float _168 = _146 * _144;
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _172 = _170 * 6.283185482025146484375;
    float _174 = floor(_170);
    float _176 = _172 * 0.15915493667125701904296875;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _176 * 6.283185482025146484375;
    float _184 = cos(_182);
    float _186 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _188 = -_174;
    float _190 = _170 + _188;
    float _192 = _170;
    float _194 = _186;
    if (!_158)
    {
        float _196 = _186 * _186;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    bool _202 = _190 < 0.5;
    float _204 = float(_202);
    float _206 = _200;
    if (!_158)
    {
        float _208 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_158;
    float _214 = _210;
    float _216 = _160;
    float _218 = _148;
    if (!_212)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _186 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _186);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _248;
    }
    float _250 = _214;
    bool _252 = !_158;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _186 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _194 = _272;
    }
    float _274 = _194;
    float _276 = fma(_184, 0.5, 0.5);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = -_190;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = in.m_57.w;
    float _292 = -_276;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _296 = -_204;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _300 = !_280;
    int _302 = _300 ? 0 : 1;
    float _304 = in.m_44.x;
    float _306 = in.m_44.y;
    float _308 = in.m_44.z;
    float _310 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _312 = 1.0 / _128;
    int _314 = abs(_302);
    out.m_59.x = _148;
    float _316 = fma(_274, _162, _310);
    bool _318 = !_284;
    int _320 = _318 ? 0 : 1;
    out.m_59.y = _160;
    bool _322 = !_180;
    int _324 = _322 ? 0 : 1;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_320);
    int _330 = abs(_324);
    float _332 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = float(_314);
    float _336 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_330);
    float _340 = fma(_274, _164, _332);
    float _342 = abs(_288);
    float _344 = _334 * _342;
    float _346 = fma(_274, _166, _336);
    float _348 = fma(_316, _290, _304);
    float _350 = float(_328);
    float _352 = fma(_338, _294, _344);
    float _354 = fma(_340, _290, _306);
    float _356 = fma(_346, _290, _308);
    float _358 = _98 * _312;
    float _360 = abs(_298);
    float _362 = fma(_350, _360, _352);
    bool _364 = !_326;
    float _366 = _358;
    int _368 = as_type<int>(_352);
    bool _370 = false;
    float _372 = as_type<float>(_330);
    if (!_364)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _376 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _366 = _386;
    }
    float _388 = _366;
    float _390 = in.m_53.y;
    float _392 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = in.m_53.z;
    float _396 = in.m_53.w;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    float _402 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _406 = _404 != 0;
    float _408 = in.m_57.x;
    float _410 = in.m_57.y;
    float _412 = in.m_57.z;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _416 = _414 != 0;
    float _418 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _422 = _420 != 0;
    float _424 = in.m_61.x;
    float _426 = in.m_61.y;
    float _428 = in.m_61.z;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _436 = _434 != 0;
    float _438 = -_160;
    float _440 = _438 + 1.0;
    if (_400)
    {
        float _442 = -_148;
        float _444 = _442 + 1.0;
        _368 = as_type<int>(_444);
    }
    int _446 = _368;
    if (_400)
    {
        bool _448 = _142 > 0.5;
        _370 = _448;
    }
    bool _450 = _370;
    if (!_400)
    {
        _372 = _148;
    }
    float _452 = _372;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = _452;
    if (_400)
    {
        float _458 = _450 ? as_type<float>(_446) : _148;
        _456 = _458;
    }
    float _460 = _456;
    float _462 = 0.0;
    if (_416)
    {
        float _464 = in.m_53.z;
        _462 = _464;
    }
    float _466 = _462;
    bool _468 = _390 > 0.5;
    bool _470 = _396 > 0.5;
    int _472 = _468 ? as_type<int>(_440) : as_type<int>(_160);
    float _474 = _408 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _478 = _476 != 0;
    float _480 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = _410 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _480);
    float _490 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _426);
    float _494 = 1.0 / _484;
    float _496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _424);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _502 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _428);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _508 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _518 = -_454;
    float _520 = fma(_502, 2.0, _518);
    float _522 = 1.0 / _512;
    float _524 = _412 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = fma(_508, -2.0, _506);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _532 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
    float _534 = _362 * _474;
    float _536 = _362 * _486;
    float _538 = 1.0 / _500;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _540;
    float _544 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _418);
    float _546 = _362 * _524;
    float _548 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
    float _550 = _542 * _494;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = 1.0 / _516;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _562 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _564 = _406 ? as_type<float>(_472) : _160;
    float _566 = 1.0 / _530;
    float _568 = _554 * _538;
    float _570 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _572 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _570;
    bool _574 = _394 > 0.5;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _584 = 1.0 / _560;
    int _586 = _574 ? as_type<int>(_440) : as_type<int>(_160);
    float _588 = _578 * _522;
    float _590 = _582 * _556;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _592;
    bool _596 = _574;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _600 = _544;
    float _602 = _526;
    if (_416)
    {
        bool _604 = _466 > 0.5;
        _596 = _604;
    }
    bool _606 = _596;
    float _608 = -_98;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _520);
    float _612 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _612;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _618 = _594 * _566;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _624 = _614 * _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _388 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _388 + _630;
    if (_416)
    {
        float _634 = -_148;
        float _636 = _634 + 1.0;
        _598 = as_type<int>(_636);
    }
    int _638 = _598;
    float _640 = fma(_572, _572, _624);
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _644 = fma(_550, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _648 = _388 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _652 = _388 + _650;
    float _654 = _622 * _584;
    float _656 = fma(_568, _632, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _660 = _388 + _658;
    float _662 = fma(_588, _648, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _666 = fma(_590, _652, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _668 = fma(_618, _660, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _670 = _616 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _672 = _652;
    if (!_416)
    {
        _672 = _148;
    }
    float _674 = _672;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _678 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _680 = fma(_670, _460, -0.5);
    float _682 = _432 ? as_type<float>(_586) : _160;
    float _684 = fma(_678, _564, -0.5);
    float _686 = _674;
    float _688 = _676;
    if (_416)
    {
        float _690 = _606 ? as_type<float>(_638) : _148;
        _686 = _690;
    }
    float _692 = _686;
    float _694 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    if (_436)
    {
        float _696 = _470 ? _440 : _160;
        _216 = _696;
    }
    float _698 = _216;
    float _700 = _544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_478)
    {
        _688 = _390;
    }
    float _702 = _688;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _706 = _664 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _708 = -_700;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _712 = _702;
    if (!_478)
    {
        _600 = _702;
    }
    float _714 = _600;
    float _716 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].w, _704);
    bool _718 = _390 > 0.5;
    bool _720 = _718 && _422;
    float _722 = _710 * _710;
    float _724 = _714;
    if (_478)
    {
        _712 = _390;
    }
    float _726 = _712;
    float _728 = fma(_682, _706, -0.5);
    float _730 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _732 = -_562;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = -_730;
    float _740 = _738 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = fma(_734, _734, _722);
    float _744 = _736 * _496;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _748 = fma(_740, _740, _742);
    float _750 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _754 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _756 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _754;
    float _758 = rsqrt(_748);
    float _760 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _746);
    float _762 = _752 * _504;
    bool _764 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _766 = isnan(_388);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_756, _756, _640);
    float _778 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _760);
    float _780 = _750 * _492;
    bool _782 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _784 = isnan(_388);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _796 = _388 + _794;
    float _798 = -_774;
    float _800 = _798 + 1.0;
    float _802 = fma(_778, _680, _610);
    bool _804 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _806 = isnan(_388);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = fma(_654, _796, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _818 = _792 * _800;
    bool _820 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _822 = isnan(_388);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -_792;
    float _834 = _832 + 1.0;
    float _836 = _734 * _758;
    float _838 = _710 * _758;
    float _840 = -_814;
    float _842 = _840 + 1.0;
    float _844 = _740 * _758;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _848 = _836 * _846;
    bool _850 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _852 = isnan(_388);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _830 * _842;
    bool _864 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_388);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _878 = -_848;
    float _880 = fma(_844, _876, _878);
    bool _882 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = isnan(_388);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -_830;
    float _896 = _894 + 1.0;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _900 = _844 * _898;
    float _902 = _814 * _834;
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _906 = _838 * _904;
    float _908 = _880 * _880;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _912 = -_900;
    float _914 = fma(_838, _910, _912);
    float _916 = _892 * _896;
    float _918 = -_892;
    float _920 = _918 + 1.0;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = -_906;
    float _926 = fma(_836, _922, _924);
    float _928 = fma(_914, _914, _908);
    float _930 = -_874;
    float _932 = _930 + 1.0;
    float _934 = _874 * _920;
    float _936 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _938 = fma(_926, _926, _928);
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _942 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _526);
    float _944 = _860 * _932;
    float _946 = _836;
    float _948 = _726;
    if (_478)
    {
        _724 = _142;
    }
    float _950 = _724;
    float _952 = -_942;
    float _954 = fma(_936, _684, _952);
    float _956 = _644 * _944;
    float _958 = rsqrt(_938);
    if (_478)
    {
        _602 = _142;
    }
    float _960 = _602;
    float _962 = _950 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _964 = _960;
    if (!_478)
    {
        _964 = _394;
    }
    float _966 = _964;
    float _968 = 0.0;
    if (!_478)
    {
        _968 = _394;
    }
    float _970 = _968;
    float _972 = sqrt(_776);
    float _974 = _940 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _976 = -_860;
    float _978 = _976 + 1.0;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _982 = fma(_974, _698, -0.5);
    float _984 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[115].x, _956);
    float _986 = _970;
    if (_478)
    {
        _986 = _726;
    }
    float _988 = _986;
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _992 = _914 * _958;
    float _994 = _880 * _958;
    float _996 = _926 * _958;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1000 = _844 * _994;
    float _1002 = _966 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1004 = fma(_972, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1006 = _838 * _992;
    float _1008 = -_1000;
    float _1010 = fma(_838, _996, _1008);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1014 = -_1006;
    float _1016 = fma(_836, _994, _1014);
    float _1018 = _780 * _1010;
    float _1020 = precise::max(_1004, 1.0);
    float _1022 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1024 = _780 * _1016;
    float _1026 = -_980;
    float _1028 = fma(_1002, 2.0, _1026);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1032 = fma(_1022, _692, -0.5);
    float _1034 = fma(_744, _992, _1018);
    float _1036 = fma(_744, _996, _1024);
    float _1038 = precise::min(_1020, 1.89999997615814208984375);
    float _1040 = _836 * _996;
    float _1042 = fma(_762, _836, _1034);
    float _1044 = fma(_762, _844, _1036);
    float _1046 = _1024;
    if (!_422)
    {
        _1046 = _148;
    }
    float _1048 = _1046;
    float _1050 = _1048;
    if (_720)
    {
        float _1052 = -_148;
        float _1054 = _1052 + 1.0;
        _218 = _1054;
    }
    float _1056 = _218;
    float _1058 = fma(_1042, _1038, _562);
    float _1060 = fma(_1044, _1038, _730);
    float _1062 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1012);
    float _1064 = _1060;
    float _1066 = _1058;
    if (!_478)
    {
        _946 = _394;
    }
    float _1068 = _946;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1072 = _1058 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1076 = _1060 + _1074;
    float _1078 = _1068;
    if (_422)
    {
        _1050 = _1056;
    }
    float _1080 = _1050;
    float _1082 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _998);
    float _1084 = _1072 * _1072;
    float _1086 = _1076 * _1076;
    float _1088 = _1084;
    float _1090 = _1086;
    if (_478)
    {
        _1078 = _726;
    }
    float _1092 = _1078;
    float _1094 = -_1040;
    float _1096 = fma(_844, _992, _1094);
    float _1098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1100 = _1084 + _1086;
    float _1102 = -_1030;
    float _1104 = fma(_962, 2.0, _1102);
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1108 = _780 * _1096;
    float _1110 = fma(_656, _934, _984);
    float _1112 = sqrt(_1100);
    float _1114 = fma(_744, _994, _1108);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1118 = fma(_662, _916, _1110);
    float _1120 = fma(_762, _838, _1114);
    float _1122 = _1100;
    if (!_478)
    {
        _948 = _142;
    }
    float _1124 = _948;
    float _1126 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1062);
    float _1128 = -_98;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1104);
    float _1132 = fma(_1120, _1038, _700);
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1136 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1116);
    float _1138 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1140 = fma(_666, _862, _1118);
    float _1142 = fma(_1126, _1032, _1130);
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1146 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = fma(_1106, -2.0, _1134);
    float _1150 = fma(_1138, _1080, -0.5);
    float _1152 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1136);
    float _1154 = -_98;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1028);
    float _1158 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1160 = _1126;
    float _1162 = _1140;
    if (!_1146)
    {
        _1160 = _1132;
    }
    float _1164 = _1160;
    bool _1166 = !_1146;
    float _1168 = _1164;
    if (!_1166)
    {
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1174 = _1112 + _1172;
        float _1176 = rsqrt(_1100);
        float _1178 = _1174 * _1170;
        float _1180 = _1132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = _1178 * 0.15915493667125701904296875;
        float _1184 = _1182 * 6.283185482025146484375;
        float _1186 = sin(_1184);
        float _1188 = _1182 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = fma(_1186, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1194 = _1176 * _1192;
        float _1196 = _1190 + (-1.0);
        float _1198 = fma(_1072, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1200 = fma(_1076, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1202 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1206 = _1198 + _1204;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1210 = _1200 + _1208;
        float _1212 = fma(_1132, _1190, _1202);
        float _1214 = _1206 * _1206;
        float _1216 = _1210 * _1210;
        _1168 = _1212;
        _1088 = _1214;
        _1090 = _1216;
        _1064 = _1200;
        _1066 = _1198;
        _1122 = _1176;
    }
    float _1218 = _1168;
    float _1220 = _1088;
    float _1222 = _1090;
    float _1224 = _1064;
    float _1226 = _1066;
    float _1228 = _1122;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1218 + _1230;
    float _1234 = fma(_1158, -2.0, _1144);
    float _1236 = fma(_668, _902, _1140);
    float _1238 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].w, _716);
    float _1240 = fma(_1232, _1232, _1220);
    float _1242 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1082);
    float _1244 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1148);
    float _1246 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1234);
    float _1248 = _1240 + _1222;
    float _1250 = fma(_816, _818, _1236);
    float _1252 = -_1244;
    float _1254 = fma(_1242, _982, _1252);
    float _1256 = -_1246;
    float _1258 = fma(_1238, _728, _1256);
    float _1260 = fma(_1152, _1150, _1156);
    float _1262 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1250);
    float _1264 = sqrt(_1248);
    float _1266 = _802 + 0.5;
    float _1268 = _1258 + 0.5;
    float _1270 = _954 + 0.5;
    float _1272 = _1260 + 0.5;
    float _1274 = _1142 + 0.5;
    float _1276 = _1254 + 0.5;
    float _1278 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _700 + _1280;
    out.m_63.x = _1272;
    out.m_63.y = _1268;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1286 = _562 + _1284;
    float _1288 = _1282 * _1282;
    out.m_65.x = _1266;
    out.m_65.y = _1270;
    out.m_65.z = _1274;
    out.m_65.w = _1276;
    bool _1290 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1292 = isnan(_1264);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1298 = _1294 || _1296;
    out.m_67.w = _1278;
    float _1300 = fma(_1286, _1286, _1288);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1304 = _730 + _1302;
    float _1306 = fma(_1304, _1304, _1300);
    float _1308 = _1304;
    float _1310 = _1278;
    float _1312 = _1228;
    float _1314 = _1272;
    if (!_1298)
    {
        _1308 = 1.0;
    }
    float _1316 = _1308;
    bool _1318 = !_1298;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1264);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1264 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1264);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1264 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1384 = _1218 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1388 = _1224 + _1386;
    bool _1390 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan(0.5);
    bool _1398 = _1394 || _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1402 = _1226 + _1400;
    float _1404 = fma(_1384, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1406 = fma(_1388, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1408 = fma(_1402, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = _1384;
    if (_1398)
    {
        _1310 = _1408;
    }
    float _1412 = _1310;
    float _1414 = _1412;
    if (_1398)
    {
        _1410 = _1404;
    }
    float _1416 = _1410;
    float _1418 = _1416;
    if (_1398)
    {
        _1312 = _1406;
    }
    float _1420 = _1312;
    float _1422 = _1420;
    if (!_1398)
    {
        float _1424 = sqrt(_1306);
        float _1426 = -_730;
        float _1428 = _1426 + _1406;
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1434 = precise::min(_1424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1438 = _1434 * _1432;
        float _1440 = -_562;
        float _1442 = _1440 + _1408;
        float _1444 = _1436 * _1438;
        float _1446 = -_700;
        float _1448 = _1446 + _1404;
        float _1450 = fma(_1442, _1444, _562);
        float _1452 = fma(_1448, _1444, _700);
        float _1454 = fma(_1428, _1444, _730);
        _1418 = _1452;
        _1414 = _1450;
        _1422 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1414;
    float _1460 = _1422;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1456 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1460 + _1470;
    float _1474 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1476 = _1464 * _1464;
    float _1478 = fma(_1468, _1468, _1476);
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = rsqrt(_1480);
    float _1484 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1486 = _1468 * _1484;
    float _1488 = _1472 * _1484;
    float _1490 = _1486 * _1486;
    float _1492 = _1488 * _1488;
    float _1494 = _1490 + _1492;
    float _1496 = sqrt(_1494);
    bool _1498 = _1496 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1502 = _1496 + _1500;
    float _1504 = _700;
    float _1506 = _1502;
    float _1508 = _1474;
    float _1510 = _1464;
    float _1512 = _1486;
    if (_1498)
    {
        float _1514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1514;
    }
    float _1516 = _1504;
    float _1518 = _1516;
    if (_1498)
    {
        float _1520 = _1502 * _1516;
        _1506 = _1520;
    }
    float _1522 = _1506;
    if (_1498)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _1162 = _1524;
    }
    float _1526 = _1162;
    float _1528 = precise::max(0.0, _1474);
    float _1530 = _1528;
    if (_1498)
    {
        float _1532 = rsqrt(_1494);
        _1508 = _1532;
    }
    float _1534 = _1508;
    float _1536 = -_1484;
    float _1538 = -_1528;
    float _1540 = fma(_1464, _1536, _1538);
    float _1542 = _1534;
    if (_1498)
    {
        float _1544 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1544;
    }
    float _1546 = _1510;
    float _1548 = _1482;
    float _1550 = _1546;
    if (_1498)
    {
        float _1552 = _1526 * 6.283185482025146484375;
        float _1554 = sin(_1552);
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = _1472;
    if (_1498)
    {
        float _1560 = _1526 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = _1556;
    if (_1498)
    {
        float _1568 = fma(_1556, _1546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1566 = _1568;
    }
    float _1570 = _1566;
    float _1572 = sqrt(_1480);
    float _1574 = _1570;
    if (!_1498)
    {
        _1550 = _1490;
    }
    float _1576 = _1550;
    float _1578 = _1576;
    if (_1498)
    {
        float _1580 = _1534 * _1570;
        _1314 = _1580;
    }
    float _1582 = _1314;
    if (!_1498)
    {
        _1574 = _1540;
    }
    float _1584 = _1574;
    float _1586 = _1584;
    if (!_1498)
    {
        _1542 = _1488;
    }
    float _1588 = _1542;
    float _1590 = _1588;
    if (_1498)
    {
        float _1592 = _1564 + (-1.0);
        _1530 = _1592;
    }
    float _1594 = _1530;
    float _1596 = _1594;
    if (_1498)
    {
        float _1598 = _1486 * _1582;
        _1512 = _1598;
    }
    float _1600 = _1512;
    if (_1498)
    {
        float _1602 = _1488 * _1582;
        _1590 = _1602;
    }
    float _1604 = _1590;
    if (_1498)
    {
        float _1606 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1606;
    }
    float _1608 = _1518;
    if (_1498)
    {
        float _1610 = _1600 * _1600;
        _1578 = _1610;
    }
    float _1612 = _1578;
    if (!_1498)
    {
        _1596 = _1492;
    }
    float _1614 = _1596;
    float _1616 = _1614;
    if (_1498)
    {
        float _1618 = _1604 * _1604;
        _1616 = _1618;
    }
    float _1620 = _1616;
    if (_1498)
    {
        float _1622 = fma(_1540, _1564, _1608);
        _1586 = _1622;
    }
    float _1624 = _1586;
    float _1626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1628 = fma(_1624, _1624, _1612);
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1632 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1630);
    float _1634 = precise::clamp(_1632, 0.0, 1.0);
    float _1636 = _1628 + _1620;
    float _1638 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1640 = -_1634;
    float _1642 = _1640 + 1.0;
    float _1644 = rsqrt(_1636);
    float _1646 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1638);
    float _1648 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1652 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1656 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1658 = abs(_1642);
    float _1660 = log2(_1658);
    float _1662 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1664 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1654);
    float _1666 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1656);
    float _1668 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1670 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1672 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1674 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1666);
    float _1676 = _1644 * _1600;
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1680 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1682 = _1644 * _1624;
    float _1684 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1686 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1680);
    float _1690 = _1644 * _1604;
    float _1692 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1694 = -_1684;
    float _1696 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1694);
    float _1698 = -_1686;
    float _1700 = fma(_1698, _1626, 1.0);
    float _1702 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1688);
    float _1706 = exp2(_1692);
    float _1708 = -_1690;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1696);
    float _1712 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1714 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1704);
    float _1716 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = fma(_1710, -0.5, 0.5);
    float _1720 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1712);
    float _1722 = fma(_1710, 0.5, 0.5);
    float _1724 = log2(_1700);
    float _1726 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1728 = _1682 + 1.0;
    float _1730 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1732 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1734 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1736 = 1.0 / _1714;
    float _1738 = -_1682;
    float _1740 = fma(_1706, _1728, _1738);
    float _1742 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1730);
    float _1744 = fma(_1722, _1732, -0.212114393711090087890625);
    float _1746 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1734);
    float _1748 = fma(_1740, 0.5, 0.5);
    float _1750 = fma(_1722, _1744, 1.570728778839111328125);
    float _1752 = sqrt(_1718);
    float _1754 = _1724 * 0.693147182464599609375;
    float _1756 = _1742 * _1736;
    float _1758 = _1746 * _1736;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = fma(_1756, 0.5, 0.5);
    float _1764 = fma(_1758, -0.5, 0.5);
    float _1766 = _1752 * 0.636619746685028076171875;
    float3 _4607 = float3(_1762, _1764, _1760);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).x;
    float3 _4618 = float3(_1762, _1764, _1760);
    float4 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).xyzw;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1771.w;
    float _1781 = -_1750;
    float _1783 = fma(_1766, _1781, 1.0);
    float2 _4640 = float2(_1783, _1748);
    float3 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4640, float2(0.0), isnan(_4640)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4640, float2(0.0), isnan(_4640)), level(0.0)).xyz;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1799 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1797);
    float _1801 = exp2(_1795);
    float _1803 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1799);
    float _1805 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1807 = _1805 + _1714;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1746;
    out.gl_Position.z = _1805;
    out.gl_Position.w = _1714;
    float _1809 = _1807 * 0.5;
    float _1811 = -_1801;
    float _1813 = _1811 + 1.0;
    float _1815 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1817 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1809;
    out.m_69.w = _1714;
    out.m_71.w = _1815;
    out.m_51.x = 1.0;
    float _1819 = _1817 * _1768;
    float _1821 = -_1817;
    float _1823 = _1821 + 1.0;
    float _1825 = _1779 * _1819;
    float _1827 = _1793 * _1819;
    float _1829 = fma(_1789, _1825, _1773);
    float _1831 = fma(_1791, _1825, _1775);
    float _1833 = _1779 * _1823;
    float _1835 = fma(_1779, _1827, _1777);
    out.m_73.x = _1829;
    out.m_73.y = _1831;
    out.m_73.z = _1835;
    out.m_73.w = _1833;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1350 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_44.w;
    float _89 = in.m_46.w;
    float _91 = trunc(_87);
    int _94 = int(_91);
    float _96 = -_89;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _98;
    bool _102 = _94 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_94);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_51.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1903 = as_type<float>(_114);
        out.gl_Position.z = _1903;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _118 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_89);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_94);
    bool _130 = _98 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    if (_134)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _106;
    if (_134)
    {
        out.m_51.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _116 = as_type<int>(_138);
    }
    int _140 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1958 = as_type<float>(_140);
        out.gl_Position.z = _1958;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_53.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _98 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_55.x;
    bool _150 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _152 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _154 = _150 || _152;
    bool _156 = isnan(1.0);
    bool _158 = _154 || _156;
    float _160 = in.m_55.y;
    float _162 = in.m_46.x;
    float _164 = in.m_46.y;
    float _166 = in.m_46.z;
    float _168 = _146 * _144;
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _172 = _170 * 6.283185482025146484375;
    float _174 = floor(_170);
    float _176 = _172 * 0.15915493667125701904296875;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _176 * 6.283185482025146484375;
    float _184 = cos(_182);
    float _186 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _188 = -_174;
    float _190 = _170 + _188;
    float _192 = _170;
    float _194 = _186;
    if (!_158)
    {
        float _196 = _186 * _186;
        float _198 = _196 * 0.5;
        _192 = _198;
    }
    float _200 = _192;
    bool _202 = _190 < 0.5;
    float _204 = float(_202);
    float _206 = _200;
    if (!_158)
    {
        float _208 = _200 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _208;
    }
    float _210 = _206;
    bool _212 = !_158;
    float _214 = _210;
    float _216 = _160;
    float _218 = _148;
    if (!_212)
    {
        float _220 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _222 = log2(_220);
        float _224 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _226 = _224 + 1.0;
        float _228 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = _186 * _222;
        float _232 = 1.0 / _226;
        float _234 = _228 * 0.693147182464599609375;
        float _236 = exp2(_230);
        float _238 = 1.0 / _234;
        float _240 = _236 + (-1.0);
        float _242 = -_240;
        float _244 = fma(_242, _238, _186);
        float _246 = _244 * _232;
        float _248 = _246 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _214 = _248;
    }
    float _250 = _214;
    bool _252 = !_158;
    if (!_252)
    {
        float _254 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _256 = log2(_254);
        float _258 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _260 = _258 + 1.0;
        float _262 = 1.0 / _260;
        float _264 = _186 * _256;
        float _266 = exp2(_264);
        float _268 = -_266;
        float _270 = _268 + 1.0;
        float _272 = _270 * _262;
        _194 = _272;
    }
    float _274 = _194;
    float _276 = fma(_184, 0.5, 0.5);
    int _278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _280 = _278 != 0;
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _284 = _282 != 0;
    float _286 = -_190;
    float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _290 = in.m_57.w;
    float _292 = -_276;
    float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _296 = -_204;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _300 = !_280;
    int _302 = _300 ? 0 : 1;
    float _304 = in.m_44.x;
    float _306 = in.m_44.y;
    float _308 = in.m_44.z;
    float _310 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _312 = 1.0 / _128;
    int _314 = abs(_302);
    out.m_59.x = _148;
    float _316 = fma(_274, _162, _310);
    bool _318 = !_284;
    int _320 = _318 ? 0 : 1;
    out.m_59.y = _160;
    bool _322 = !_180;
    int _324 = _322 ? 0 : 1;
    bool _326 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    int _328 = abs(_320);
    int _330 = abs(_324);
    float _332 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _334 = float(_314);
    float _336 = _250 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _338 = float(_330);
    float _340 = fma(_274, _164, _332);
    float _342 = abs(_288);
    float _344 = _334 * _342;
    float _346 = fma(_274, _166, _336);
    float _348 = fma(_316, _290, _304);
    float _350 = float(_328);
    float _352 = fma(_338, _294, _344);
    float _354 = fma(_340, _290, _306);
    float _356 = fma(_346, _290, _308);
    float _358 = _98 * _312;
    float _360 = abs(_298);
    float _362 = fma(_350, _360, _352);
    bool _364 = !_326;
    float _366 = _358;
    int _368 = as_type<int>(_352);
    bool _370 = false;
    float _372 = as_type<float>(_330);
    if (!_364)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _376 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[11].y, _98);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _366 = _386;
    }
    float _388 = _366;
    float _390 = in.m_53.y;
    float _392 = _354 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = in.m_53.z;
    float _396 = in.m_53.w;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _400 = _398 != 0;
    float _402 = _354 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _406 = _404 != 0;
    float _408 = in.m_57.x;
    float _410 = in.m_57.y;
    float _412 = in.m_57.z;
    int _414 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _416 = _414 != 0;
    float _418 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _422 = _420 != 0;
    float _424 = in.m_61.x;
    float _426 = in.m_61.y;
    float _428 = in.m_61.z;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _432 = _430 != 0;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _436 = _434 != 0;
    float _438 = -_160;
    float _440 = _438 + 1.0;
    if (_400)
    {
        float _442 = -_148;
        float _444 = _442 + 1.0;
        _368 = as_type<int>(_444);
    }
    int _446 = _368;
    if (_400)
    {
        bool _448 = _142 > 0.5;
        _370 = _448;
    }
    bool _450 = _370;
    if (!_400)
    {
        _372 = _148;
    }
    float _452 = _372;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _456 = _452;
    if (_400)
    {
        float _458 = _450 ? as_type<float>(_446) : _148;
        _456 = _458;
    }
    float _460 = _456;
    float _462 = 0.0;
    if (_416)
    {
        float _464 = in.m_53.z;
        _462 = _464;
    }
    float _466 = _462;
    bool _468 = _390 > 0.5;
    bool _470 = _396 > 0.5;
    int _472 = _468 ? as_type<int>(_440) : as_type<int>(_160);
    float _474 = _408 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    int _476 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _478 = _476 != 0;
    float _480 = _354 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _486 = _410 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _488 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[4].x, _480);
    float _490 = fma(_348, (*spvDescriptorSet0.vp_c10)._m0[6].x, _402);
    float _492 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _426);
    float _494 = 1.0 / _484;
    float _496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _424);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _502 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _504 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _428);
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _508 = _390 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _518 = -_454;
    float _520 = fma(_502, 2.0, _518);
    float _522 = 1.0 / _512;
    float _524 = _412 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _526 = fma(_508, -2.0, _506);
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _530 = _528 + (*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _532 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].z, _488);
    float _534 = _362 * _474;
    float _536 = _362 * _486;
    float _538 = 1.0 / _500;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _540;
    float _544 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].z, _418);
    float _546 = _362 * _524;
    float _548 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].z, _490);
    float _550 = _542 * _494;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _556 = 1.0 / _516;
    float _558 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _560 = _558 + (*spvDescriptorSet0.vp_c9)._m0[121].w;
    float _562 = _532 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _564 = _406 ? as_type<float>(_472) : _160;
    float _566 = 1.0 / _530;
    float _568 = _554 * _538;
    float _570 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _572 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _570;
    bool _574 = _394 > 0.5;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _584 = 1.0 / _560;
    int _586 = _574 ? as_type<int>(_440) : as_type<int>(_160);
    float _588 = _578 * _522;
    float _590 = _582 * _556;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[120].x + _592;
    bool _596 = _574;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _600 = _544;
    float _602 = _526;
    if (_416)
    {
        bool _604 = _466 > 0.5;
        _596 = _604;
    }
    bool _606 = _596;
    float _608 = -_98;
    float _610 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[76].x, _520);
    float _612 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _614 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _612;
    float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _618 = _594 * _566;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[120].x;
    float _622 = _620 + (*spvDescriptorSet0.vp_c9)._m0[121].x;
    float _624 = _614 * _614;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _628 = _388 + _626;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _632 = _388 + _630;
    if (_416)
    {
        float _634 = -_148;
        float _636 = _634 + 1.0;
        _598 = as_type<int>(_636);
    }
    int _638 = _598;
    float _640 = fma(_572, _572, _624);
    float _642 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _644 = fma(_550, _628, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _648 = _388 + _646;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _652 = _388 + _650;
    float _654 = _622 * _584;
    float _656 = fma(_568, _632, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _660 = _388 + _658;
    float _662 = fma(_588, _648, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _666 = fma(_590, _652, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _668 = fma(_618, _660, (*spvDescriptorSet0.vp_c9)._m0[119].x);
    float _670 = _616 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _672 = _652;
    if (!_416)
    {
        _672 = _148;
    }
    float _674 = _672;
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _678 = _642 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _680 = fma(_670, _460, -0.5);
    float _682 = _432 ? as_type<float>(_586) : _160;
    float _684 = fma(_678, _564, -0.5);
    float _686 = _674;
    float _688 = _676;
    if (_416)
    {
        float _690 = _606 ? as_type<float>(_638) : _148;
        _686 = _690;
    }
    float _692 = _686;
    float _694 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[78].w, _676);
    if (_436)
    {
        float _696 = _470 ? _440 : _160;
        _216 = _696;
    }
    float _698 = _216;
    float _700 = _544 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (!_478)
    {
        _688 = _390;
    }
    float _702 = _688;
    float _704 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _706 = _664 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _708 = -_700;
    float _710 = _708 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _712 = _702;
    if (!_478)
    {
        _600 = _702;
    }
    float _714 = _600;
    float _716 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[88].w, _704);
    bool _718 = _390 > 0.5;
    bool _720 = _718 && _422;
    float _722 = _710 * _710;
    float _724 = _714;
    if (_478)
    {
        _712 = _390;
    }
    float _726 = _712;
    float _728 = fma(_682, _706, -0.5);
    float _730 = _548 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _732 = -_562;
    float _734 = _732 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _736 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _738 = -_730;
    float _740 = _738 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = fma(_734, _734, _722);
    float _744 = _736 * _496;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _748 = fma(_740, _740, _742);
    float _750 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _752 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _754 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _756 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _754;
    float _758 = rsqrt(_748);
    float _760 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _746);
    float _762 = _752 * _504;
    bool _764 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[121].w;
    bool _766 = isnan(_388);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c9)._m0[121].w);
    bool _772 = _768 || _770;
    float _774 = float(_772);
    float _776 = fma(_756, _756, _640);
    float _778 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].z, _760);
    float _780 = _750 * _492;
    bool _782 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[120].w;
    bool _784 = isnan(_388);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c9)._m0[120].w);
    bool _790 = _786 || _788;
    float _792 = float(_790);
    float _794 = -(*spvDescriptorSet0.vp_c9)._m0[120].w;
    float _796 = _388 + _794;
    float _798 = -_774;
    float _800 = _798 + 1.0;
    float _802 = fma(_778, _680, _610);
    bool _804 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _806 = isnan(_388);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = fma(_654, _796, (*spvDescriptorSet0.vp_c9)._m0[120].x);
    float _818 = _792 * _800;
    bool _820 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _822 = isnan(_388);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -_792;
    float _834 = _832 + 1.0;
    float _836 = _734 * _758;
    float _838 = _710 * _758;
    float _840 = -_814;
    float _842 = _840 + 1.0;
    float _844 = _740 * _758;
    float _846 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _848 = _836 * _846;
    bool _850 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _852 = isnan(_388);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = _830 * _842;
    bool _864 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _866 = isnan(_388);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _878 = -_848;
    float _880 = fma(_844, _876, _878);
    bool _882 = _388 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _884 = isnan(_388);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -_830;
    float _896 = _894 + 1.0;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _900 = _844 * _898;
    float _902 = _814 * _834;
    float _904 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _906 = _838 * _904;
    float _908 = _880 * _880;
    float _910 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _912 = -_900;
    float _914 = fma(_838, _910, _912);
    float _916 = _892 * _896;
    float _918 = -_892;
    float _920 = _918 + 1.0;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _924 = -_906;
    float _926 = fma(_836, _922, _924);
    float _928 = fma(_914, _914, _908);
    float _930 = -_874;
    float _932 = _930 + 1.0;
    float _934 = _874 * _920;
    float _936 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[77].w, _694);
    float _938 = fma(_926, _926, _928);
    float _940 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _942 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[76].y, _526);
    float _944 = _860 * _932;
    float _946 = _836;
    float _948 = _726;
    if (_478)
    {
        _724 = _142;
    }
    float _950 = _724;
    float _952 = -_942;
    float _954 = fma(_936, _684, _952);
    float _956 = _644 * _944;
    float _958 = rsqrt(_938);
    if (_478)
    {
        _602 = _142;
    }
    float _960 = _602;
    float _962 = _950 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _964 = _960;
    if (!_478)
    {
        _964 = _394;
    }
    float _966 = _964;
    float _968 = 0.0;
    if (!_478)
    {
        _968 = _394;
    }
    float _970 = _968;
    float _972 = sqrt(_776);
    float _974 = _940 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _976 = -_860;
    float _978 = _976 + 1.0;
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _982 = fma(_974, _698, -0.5);
    float _984 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[115].x, _956);
    float _986 = _970;
    if (_478)
    {
        _986 = _726;
    }
    float _988 = _986;
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _992 = _914 * _958;
    float _994 = _880 * _958;
    float _996 = _926 * _958;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1000 = _844 * _994;
    float _1002 = _966 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1004 = fma(_972, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1006 = _838 * _992;
    float _1008 = -_1000;
    float _1010 = fma(_838, _996, _1008);
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1014 = -_1006;
    float _1016 = fma(_836, _994, _1014);
    float _1018 = _780 * _1010;
    float _1020 = precise::max(_1004, 1.0);
    float _1022 = _990 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1024 = _780 * _1016;
    float _1026 = -_980;
    float _1028 = fma(_1002, 2.0, _1026);
    float _1030 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1032 = fma(_1022, _692, -0.5);
    float _1034 = fma(_744, _992, _1018);
    float _1036 = fma(_744, _996, _1024);
    float _1038 = precise::min(_1020, 1.89999997615814208984375);
    float _1040 = _836 * _996;
    float _1042 = fma(_762, _836, _1034);
    float _1044 = fma(_762, _844, _1036);
    float _1046 = _1024;
    if (!_422)
    {
        _1046 = _148;
    }
    float _1048 = _1046;
    float _1050 = _1048;
    if (_720)
    {
        float _1052 = -_148;
        float _1054 = _1052 + 1.0;
        _218 = _1054;
    }
    float _1056 = _218;
    float _1058 = fma(_1042, _1038, _562);
    float _1060 = fma(_1044, _1038, _730);
    float _1062 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1012);
    float _1064 = _1060;
    float _1066 = _1058;
    if (!_478)
    {
        _946 = _394;
    }
    float _1068 = _946;
    float _1070 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1072 = _1058 + _1070;
    float _1074 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1076 = _1060 + _1074;
    float _1078 = _1068;
    if (_422)
    {
        _1050 = _1056;
    }
    float _1080 = _1050;
    float _1082 = fma(_988, (*spvDescriptorSet0.vp_c9)._m0[83].w, _998);
    float _1084 = _1072 * _1072;
    float _1086 = _1076 * _1076;
    float _1088 = _1084;
    float _1090 = _1086;
    if (_478)
    {
        _1078 = _726;
    }
    float _1092 = _1078;
    float _1094 = -_1040;
    float _1096 = fma(_844, _992, _1094);
    float _1098 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1100 = _1084 + _1086;
    float _1102 = -_1030;
    float _1104 = fma(_962, 2.0, _1102);
    float _1106 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1108 = _780 * _1096;
    float _1110 = fma(_656, _934, _984);
    float _1112 = sqrt(_1100);
    float _1114 = fma(_744, _994, _1108);
    float _1116 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1118 = fma(_662, _916, _1110);
    float _1120 = fma(_762, _838, _1114);
    float _1122 = _1100;
    if (!_478)
    {
        _948 = _142;
    }
    float _1124 = _948;
    float _1126 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1062);
    float _1128 = -_98;
    float _1130 = fma(_1128, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1104);
    float _1132 = fma(_1120, _1038, _700);
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1136 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1116);
    float _1138 = _1098 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1140 = fma(_666, _862, _1118);
    float _1142 = fma(_1126, _1032, _1130);
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1146 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1148 = fma(_1106, -2.0, _1134);
    float _1150 = fma(_1138, _1080, -0.5);
    float _1152 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1136);
    float _1154 = -_98;
    float _1156 = fma(_1154, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1028);
    float _1158 = _1124 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1160 = _1126;
    float _1162 = _1140;
    if (!_1146)
    {
        _1160 = _1132;
    }
    float _1164 = _1160;
    bool _1166 = !_1146;
    float _1168 = _1164;
    if (!_1166)
    {
        float _1170 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1172 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1174 = _1112 + _1172;
        float _1176 = rsqrt(_1100);
        float _1178 = _1174 * _1170;
        float _1180 = _1132 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1182 = _1178 * 0.15915493667125701904296875;
        float _1184 = _1182 * 6.283185482025146484375;
        float _1186 = sin(_1184);
        float _1188 = _1182 * 6.283185482025146484375;
        float _1190 = cos(_1188);
        float _1192 = fma(_1186, _1180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1194 = _1176 * _1192;
        float _1196 = _1190 + (-1.0);
        float _1198 = fma(_1072, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1200 = fma(_1076, _1194, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1202 = _1196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1206 = _1198 + _1204;
        float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1210 = _1200 + _1208;
        float _1212 = fma(_1132, _1190, _1202);
        float _1214 = _1206 * _1206;
        float _1216 = _1210 * _1210;
        _1168 = _1212;
        _1088 = _1214;
        _1090 = _1216;
        _1064 = _1200;
        _1066 = _1198;
        _1122 = _1176;
    }
    float _1218 = _1168;
    float _1220 = _1088;
    float _1222 = _1090;
    float _1224 = _1064;
    float _1226 = _1066;
    float _1228 = _1122;
    float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1232 = _1218 + _1230;
    float _1234 = fma(_1158, -2.0, _1144);
    float _1236 = fma(_668, _902, _1140);
    float _1238 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[87].w, _716);
    float _1240 = fma(_1232, _1232, _1220);
    float _1242 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1082);
    float _1244 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1148);
    float _1246 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1234);
    float _1248 = _1240 + _1222;
    float _1250 = fma(_816, _818, _1236);
    float _1252 = -_1244;
    float _1254 = fma(_1242, _982, _1252);
    float _1256 = -_1246;
    float _1258 = fma(_1238, _728, _1256);
    float _1260 = fma(_1152, _1150, _1156);
    float _1262 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[121].x, _1250);
    float _1264 = sqrt(_1248);
    float _1266 = _802 + 0.5;
    float _1268 = _1258 + 0.5;
    float _1270 = _954 + 0.5;
    float _1272 = _1260 + 0.5;
    float _1274 = _1142 + 0.5;
    float _1276 = _1254 + 0.5;
    float _1278 = _1262 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1280 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1282 = _700 + _1280;
    out.m_63.x = _1272;
    out.m_63.y = _1268;
    float _1284 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1286 = _562 + _1284;
    float _1288 = _1282 * _1282;
    out.m_65.x = _1266;
    out.m_65.y = _1270;
    out.m_65.z = _1274;
    out.m_65.w = _1276;
    bool _1290 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1292 = isnan(_1264);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1298 = _1294 || _1296;
    out.m_67.w = _1278;
    float _1300 = fma(_1286, _1286, _1288);
    float _1302 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1304 = _730 + _1302;
    float _1306 = fma(_1304, _1304, _1300);
    float _1308 = _1304;
    float _1310 = _1278;
    float _1312 = _1228;
    float _1314 = _1272;
    if (!_1298)
    {
        _1308 = 1.0;
    }
    float _1316 = _1308;
    bool _1318 = !_1298;
    float _1320 = _1316;
    if (!_1318)
    {
        bool _1322 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1324 = isnan(_1264);
        bool _1326 = _1322 || _1324;
        bool _1328 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1330 = _1326 || _1328;
        if (!_1330)
        {
            float _1332 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1334 = _1264 + _1332;
            float _1336 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1338 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1336;
            float _1340 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1342 = _1340 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1344 = 1.0 / _1338;
            float _1346 = _1334 * _1344;
            float _1348 = fma(_1346, _1342, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1320 = _1348;
            _1350 = true;
        }
        else
        {
            bool _1352 = _1264 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1354 = isnan(_1264);
            bool _1356 = _1352 || _1354;
            bool _1358 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1360 = _1356 || _1358;
            if (!_1360)
            {
                float _1362 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1364 = _1264 + _1362;
                float _1366 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1368 = _1366 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1370 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1372 = _1370 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1374 = 1.0 / _1368;
                float _1376 = _1364 * _1374;
                float _1378 = fma(_1376, _1372, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1320 = _1378;
                _1350 = true;
            }
            else
            {
                _1320 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1350 = false;
    float _1380 = _1320;
    float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1384 = _1218 + _1382;
    float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1388 = _1224 + _1386;
    bool _1390 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1392 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan(0.5);
    bool _1398 = _1394 || _1396;
    float _1400 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1402 = _1226 + _1400;
    float _1404 = fma(_1384, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1406 = fma(_1388, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1408 = fma(_1402, _1380, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1410 = _1384;
    if (_1398)
    {
        _1310 = _1408;
    }
    float _1412 = _1310;
    float _1414 = _1412;
    if (_1398)
    {
        _1410 = _1404;
    }
    float _1416 = _1410;
    float _1418 = _1416;
    if (_1398)
    {
        _1312 = _1406;
    }
    float _1420 = _1312;
    float _1422 = _1420;
    if (!_1398)
    {
        float _1424 = sqrt(_1306);
        float _1426 = -_730;
        float _1428 = _1426 + _1406;
        float _1430 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1434 = precise::min(_1424, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1436 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1438 = _1434 * _1432;
        float _1440 = -_562;
        float _1442 = _1440 + _1408;
        float _1444 = _1436 * _1438;
        float _1446 = -_700;
        float _1448 = _1446 + _1404;
        float _1450 = fma(_1442, _1444, _562);
        float _1452 = fma(_1448, _1444, _700);
        float _1454 = fma(_1428, _1444, _730);
        _1418 = _1452;
        _1414 = _1450;
        _1422 = _1454;
    }
    float _1456 = _1418;
    float _1458 = _1414;
    float _1460 = _1422;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1456 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1460 + _1470;
    float _1474 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1476 = _1464 * _1464;
    float _1478 = fma(_1468, _1468, _1476);
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = rsqrt(_1480);
    float _1484 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1486 = _1468 * _1484;
    float _1488 = _1472 * _1484;
    float _1490 = _1486 * _1486;
    float _1492 = _1488 * _1488;
    float _1494 = _1490 + _1492;
    float _1496 = sqrt(_1494);
    bool _1498 = _1496 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1502 = _1496 + _1500;
    float _1504 = _700;
    float _1506 = _1502;
    float _1508 = _1474;
    float _1510 = _1464;
    float _1512 = _1486;
    if (_1498)
    {
        float _1514 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1514;
    }
    float _1516 = _1504;
    float _1518 = _1516;
    if (_1498)
    {
        float _1520 = _1502 * _1516;
        _1506 = _1520;
    }
    float _1522 = _1506;
    if (_1498)
    {
        float _1524 = _1522 * 0.15915493667125701904296875;
        _1162 = _1524;
    }
    float _1526 = _1162;
    float _1528 = precise::max(0.0, _1474);
    float _1530 = _1528;
    if (_1498)
    {
        float _1532 = rsqrt(_1494);
        _1508 = _1532;
    }
    float _1534 = _1508;
    float _1536 = -_1484;
    float _1538 = -_1528;
    float _1540 = fma(_1464, _1536, _1538);
    float _1542 = _1534;
    if (_1498)
    {
        float _1544 = _1540 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1510 = _1544;
    }
    float _1546 = _1510;
    float _1548 = _1482;
    float _1550 = _1546;
    if (_1498)
    {
        float _1552 = _1526 * 6.283185482025146484375;
        float _1554 = sin(_1552);
        _1548 = _1554;
    }
    float _1556 = _1548;
    float _1558 = _1472;
    if (_1498)
    {
        float _1560 = _1526 * 6.283185482025146484375;
        float _1562 = cos(_1560);
        _1558 = _1562;
    }
    float _1564 = _1558;
    float _1566 = _1556;
    if (_1498)
    {
        float _1568 = fma(_1556, _1546, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1566 = _1568;
    }
    float _1570 = _1566;
    float _1572 = sqrt(_1480);
    float _1574 = _1570;
    if (!_1498)
    {
        _1550 = _1490;
    }
    float _1576 = _1550;
    float _1578 = _1576;
    if (_1498)
    {
        float _1580 = _1534 * _1570;
        _1314 = _1580;
    }
    float _1582 = _1314;
    if (!_1498)
    {
        _1574 = _1540;
    }
    float _1584 = _1574;
    float _1586 = _1584;
    if (!_1498)
    {
        _1542 = _1488;
    }
    float _1588 = _1542;
    float _1590 = _1588;
    if (_1498)
    {
        float _1592 = _1564 + (-1.0);
        _1530 = _1592;
    }
    float _1594 = _1530;
    float _1596 = _1594;
    if (_1498)
    {
        float _1598 = _1486 * _1582;
        _1512 = _1598;
    }
    float _1600 = _1512;
    if (_1498)
    {
        float _1602 = _1488 * _1582;
        _1590 = _1602;
    }
    float _1604 = _1590;
    if (_1498)
    {
        float _1606 = _1594 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1518 = _1606;
    }
    float _1608 = _1518;
    if (_1498)
    {
        float _1610 = _1600 * _1600;
        _1578 = _1610;
    }
    float _1612 = _1578;
    if (!_1498)
    {
        _1596 = _1492;
    }
    float _1614 = _1596;
    float _1616 = _1614;
    if (_1498)
    {
        float _1618 = _1604 * _1604;
        _1616 = _1618;
    }
    float _1620 = _1616;
    if (_1498)
    {
        float _1622 = fma(_1540, _1564, _1608);
        _1586 = _1622;
    }
    float _1624 = _1586;
    float _1626 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1628 = fma(_1624, _1624, _1612);
    float _1630 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1632 = fma(_1572, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1630);
    float _1634 = precise::clamp(_1632, 0.0, 1.0);
    float _1636 = _1628 + _1620;
    float _1638 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1640 = -_1634;
    float _1642 = _1640 + 1.0;
    float _1644 = rsqrt(_1636);
    float _1646 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1638);
    float _1648 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1646);
    float _1652 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1654 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1656 = _1456 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1658 = abs(_1642);
    float _1660 = log2(_1658);
    float _1662 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1652);
    float _1664 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1654);
    float _1666 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1656);
    float _1668 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1670 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1662);
    float _1672 = _1664 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1674 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1666);
    float _1676 = _1644 * _1600;
    float _1678 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1680 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1682 = _1644 * _1624;
    float _1684 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1686 = _1668 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1680);
    float _1690 = _1644 * _1604;
    float _1692 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1694 = -_1684;
    float _1696 = fma(_1682, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1694);
    float _1698 = -_1686;
    float _1700 = fma(_1698, _1626, 1.0);
    float _1702 = _1674 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1704 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1688);
    float _1706 = exp2(_1692);
    float _1708 = -_1690;
    float _1710 = fma(_1708, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1696);
    float _1712 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1714 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1704);
    float _1716 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1718 = fma(_1710, -0.5, 0.5);
    float _1720 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1712);
    float _1722 = fma(_1710, 0.5, 0.5);
    float _1724 = log2(_1700);
    float _1726 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1716);
    float _1728 = _1682 + 1.0;
    float _1730 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1720);
    float _1732 = fma(_1722, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1734 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1726);
    float _1736 = 1.0 / _1714;
    float _1738 = -_1682;
    float _1740 = fma(_1706, _1728, _1738);
    float _1742 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1730);
    float _1744 = fma(_1722, _1732, -0.212114393711090087890625);
    float _1746 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1734);
    float _1748 = fma(_1740, 0.5, 0.5);
    float _1750 = fma(_1722, _1744, 1.570728778839111328125);
    float _1752 = sqrt(_1718);
    float _1754 = _1724 * 0.693147182464599609375;
    float _1756 = _1742 * _1736;
    float _1758 = _1746 * _1736;
    float _1760 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1762 = fma(_1756, 0.5, 0.5);
    float _1764 = fma(_1758, -0.5, 0.5);
    float _1766 = _1752 * 0.636619746685028076171875;
    float3 _4607 = float3(_1762, _1764, _1760);
    float _1768 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4607, float3(0.0), isnan(_4607)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4607, float3(0.0), isnan(_4607)), level(0.0)).x;
    float3 _4618 = float3(_1762, _1764, _1760);
    float4 _1771 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4618, float3(0.0), isnan(_4618)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4618, float3(0.0), isnan(_4618)), level(0.0)).xyzw;
    float _1773 = _1771.x;
    float _1775 = _1771.y;
    float _1777 = _1771.z;
    float _1779 = _1771.w;
    float _1781 = -_1750;
    float _1783 = fma(_1766, _1781, 1.0);
    float2 _4640 = float2(_1783, _1748);
    float3 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4640, float2(0.0), isnan(_4640)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4640, float2(0.0), isnan(_4640)), level(0.0)).xyz;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1660 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1797 = _1672 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1799 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1797);
    float _1801 = exp2(_1795);
    float _1803 = fma(_1668, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1799);
    float _1805 = fma(_1702, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1803);
    float _1807 = _1805 + _1714;
    out.gl_Position.x = _1742;
    out.gl_Position.y = _1746;
    out.gl_Position.z = _1805;
    out.gl_Position.w = _1714;
    float _1809 = _1807 * 0.5;
    float _1811 = -_1801;
    float _1813 = _1811 + 1.0;
    float _1815 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1817 = _1813 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_69.z = _1809;
    out.m_69.w = _1714;
    out.m_71.w = _1815;
    out.m_51.x = 1.0;
    float _1819 = _1817 * _1768;
    float _1821 = -_1817;
    float _1823 = _1821 + 1.0;
    float _1825 = _1779 * _1819;
    float _1827 = _1793 * _1819;
    float _1829 = fma(_1789, _1825, _1773);
    float _1831 = fma(_1791, _1825, _1775);
    float _1833 = _1779 * _1823;
    float _1835 = fma(_1779, _1827, _1777);
    out.m_73.x = _1829;
    out.m_73.y = _1831;
    out.m_73.z = _1835;
    out.m_73.w = _1833;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

