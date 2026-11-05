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
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_73 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1260 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1947 = as_type<float>(_110);
        out.gl_Position.z = _1947;
    }
    if (!_98)
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
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_94);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _104;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_146);
        out.gl_Position.z = _2015;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_51.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = in.m_53.x;
    float _156 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _152 * _150;
    float _176 = 0.0;
    float _178 = _156;
    if (!_168)
    {
        float _180 = _156 * _156;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _184;
    if (!_168)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = floor(_186);
    float _204 = _200 * 0.15915493667125701904296875;
    float _206 = _204 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = -_202;
    float _212 = _186 + _210;
    bool _214 = !_168;
    float _216 = _198;
    float _218 = _158;
    float _220 = _154;
    if (!_214)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _156 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _156);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _250;
    }
    float _252 = _216;
    bool _254 = !_168;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _156 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _178 = _274;
    }
    float _276 = _178;
    float _278 = in.m_55.w;
    bool _280 = _212 < 0.5;
    float _282 = float(_280);
    float _284 = in.m_44.x;
    float _286 = in.m_44.y;
    float _288 = in.m_44.z;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _296 = _294 != 0;
    float _298 = fma(_208, 0.5, 0.5);
    float _300 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = -_212;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = -_282;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _310 = -_298;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _314 = !_292;
    int _316 = _314 ? 0 : 1;
    float _318 = fma(_276, _188, _300);
    out.m_57.x = _154;
    bool _320 = !_172;
    int _322 = _320 ? 0 : 1;
    int _324 = abs(_316);
    out.m_57.y = _158;
    bool _326 = !_296;
    int _328 = _326 ? 0 : 1;
    int _330 = abs(_322);
    float _332 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _336 = abs(_328);
    float _338 = fma(_276, _190, _332);
    float _340 = float(_324);
    float _342 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = float(_330);
    float _346 = abs(_304);
    float _348 = _340 * _346;
    float _350 = fma(_276, _192, _342);
    float _352 = float(_336);
    float _354 = fma(_344, _312, _348);
    float _356 = fma(_318, _278, _284);
    float _358 = fma(_338, _278, _286);
    float _360 = fma(_350, _278, _288);
    float _362 = abs(_308);
    float _364 = fma(_352, _362, _354);
    bool _366 = !_334;
    float _368 = _342;
    int _370 = as_type<int>(_286);
    bool _372 = _292;
    float _374 = _284;
    bool _376 = false;
    float _392;
    if (!_366)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_94);
        float _398 = 1.0 / _396;
        float _400 = _126 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = in.m_51.z;
    float _406 = in.m_51.w;
    float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _412 = _410 != 0;
    float _414 = in.m_51.y;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _422 = _420 != 0;
    float _424 = in.m_59.w;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _432 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_402);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _288;
    float _446 = _402;
    if (_412)
    {
        float _448 = in.m_51.z;
        _444 = _448;
    }
    float _450 = _444;
    if (!_412)
    {
        _368 = _154;
    }
    float _452 = _368;
    float _454 = _452;
    if (_418)
    {
        float _456 = -_154;
        float _458 = _456 + 1.0;
        _370 = as_type<int>(_458);
    }
    int _460 = _370;
    int _462 = _460;
    if (_418)
    {
        bool _464 = _148 > 0.5;
        _372 = _464;
    }
    bool _466 = _372;
    float _468 = _408 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_418)
    {
        _374 = _154;
    }
    float _470 = _374;
    float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _474 = _470;
    if (_418)
    {
        float _476 = _466 ? as_type<float>(_460) : _154;
        _474 = _476;
    }
    float _478 = _474;
    if (_412)
    {
        float _480 = -_154;
        float _482 = _480 + 1.0;
        _462 = as_type<int>(_482);
    }
    int _484 = _462;
    bool _486 = _406 > 0.5;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _498 = _496 != 0;
    float _500 = _430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _502 = 1.0 / _490;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _506 = _504 != 0;
    out.m_61.w = _424;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _510 = _478 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _512 = 1.0 / _494;
    float _514 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _516 = _404;
    if (_412)
    {
        bool _518 = _450 > 0.5;
        _376 = _518;
    }
    bool _520 = _376;
    float _522 = _472 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_412)
    {
        float _524 = _520 ? as_type<float>(_484) : _154;
        _454 = _524;
    }
    float _526 = _454;
    float _528 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _532 = _530 != 0;
    float _534 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _536 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].x, _514);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _540 = _402 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _544 = _402 + _542;
    float _546 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _548 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].x, _528);
    float _550 = _540 * _502;
    float _552 = -_158;
    float _554 = _552 + 1.0;
    float _556 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _546);
    float _558 = _544 * _512;
    bool _560 = _404 > 0.5;
    float _562 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _564 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _536);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _566;
    float _570 = _560 ? _554 : _158;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _572;
    bool _576 = _414 > 0.5;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _578;
    float _582 = fma(_568, _550, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _588 = _576 ? _554 : _158;
    float _590 = fma(_580, _550, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = fma(_574, _550, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _598 = _422 ? _570 : _158;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _604 = _428 ? _588 : _158;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _608 = _570;
    float _610 = _588;
    float _612 = _592;
    if (_506)
    {
        float _614 = _486 ? _554 : _158;
        _218 = _614;
    }
    float _616 = _218;
    float _618 = fma(_602, _558, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    if (!_532)
    {
        _608 = _414;
    }
    float _620 = _608;
    float _622 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[88].w, _606);
    bool _624 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _626 = isnan(_402);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = fma(_596, _558, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _638 = _620;
    if (!_532)
    {
        _610 = _620;
    }
    float _640 = _610;
    float _642 = fma(_586, _558, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _644 = _414 > 0.5;
    bool _646 = _644 && _498;
    float _648 = fma(_598, _468, -0.5);
    float _650 = _640;
    if (_532)
    {
        _638 = _414;
    }
    float _652 = _638;
    float _654 = -_634;
    float _656 = _654 + 1.0;
    bool _658 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _660 = isnan(_402);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_532)
    {
        _446 = _148;
    }
    float _672 = _446;
    float _674 = _442 * _656;
    float _676 = -_442;
    float _678 = _676 + 1.0;
    float _680 = _672;
    if (!_532)
    {
        _680 = _404;
    }
    float _682 = _680;
    float _684 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_532)
    {
        _650 = _148;
    }
    float _686 = _650;
    float _688 = _668 * _678;
    float _690 = -_668;
    float _692 = _690 + 1.0;
    float _694 = _682 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _696 = fma(_500, _526, -0.5);
    float _698 = _582 * _688;
    float _700 = _590 * _688;
    float _702 = _592 * _688;
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].x, _698);
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].y, _700);
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].z, _702);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_498)
    {
        _612 = _154;
    }
    float _712 = _612;
    float _714 = _712;
    if (_646)
    {
        float _716 = -_154;
        float _718 = _716 + 1.0;
        _220 = _718;
    }
    float _720 = _220;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _724 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].z, _710);
    float _726 = _686 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _728 = -_508;
    float _730 = fma(_694, 2.0, _728);
    float _732 = _720;
    float _734 = _722;
    if (_498)
    {
        _714 = _720;
    }
    float _736 = _714;
    float _738 = -_722;
    float _740 = fma(_726, 2.0, _738);
    if (!_532)
    {
        _732 = _404;
    }
    float _742 = _732;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _746 = _742;
    if (!_532)
    {
        _734 = _404;
    }
    float _748 = _734;
    float _750 = _562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _748;
    if (_532)
    {
        _746 = _652;
    }
    float _754 = _746;
    float _756 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _744);
    if (_532)
    {
        _752 = _652;
    }
    float _758 = _752;
    float _760 = -_126;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[81].x, _740);
    if (_532)
    {
        _516 = _652;
    }
    float _764 = _516;
    float _766 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _768 = _758 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _770 = fma(_522, _736, -0.5);
    float _772 = _764;
    float _774 = _766;
    if (!_532)
    {
        _772 = _148;
    }
    float _776 = _772;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _782 = _750 + _780;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _786 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = fma(_768, -2.0, _778);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _684 + _790;
    float _794 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[83].w, _784);
    float _796 = fma(_618, _674, _704);
    float _798 = fma(_636, _674, _706);
    float _800 = fma(_642, _674, _708);
    float _802 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _724);
    float _804 = _792 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _806 = -_126;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[86].x, _730);
    float _810 = fma(_766, _616, -0.5);
    float _812 = fma(_802, _696, _762);
    float _814 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[28].x, _804);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _818 = _776 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _820 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _756);
    float _822 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _788);
    float _824 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _786 + _826;
    float _830 = fma(_820, _770, _808);
    float _832 = fma(_818, -2.0, _816);
    float _834 = -_822;
    float _836 = fma(_824, _810, _834);
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[28].z, _814);
    float _840 = in.m_55.x;
    float _842 = in.m_55.y;
    float _844 = in.m_55.z;
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _848 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _832);
    float _850 = _792 * _792;
    bool _852 = _838 >= 0.0;
    float _854 = _604 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _856 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _622);
    float _858 = fma(_782, _782, _850);
    float _860 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].x, _796);
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _864 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].y, _798);
    float _866 = fma(_828, _828, _858);
    float _868 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].z, _800);
    float _870 = _830 + 0.5;
    float _872 = _812 + 0.5;
    float _874 = _836 + 0.5;
    float _876 = -_848;
    float _878 = fma(_856, _648, _876);
    float _880 = _820;
    if (_852)
    {
        _880 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _882 = _880;
    float _884 = _510 * _846;
    float _886 = rsqrt(_866);
    int _888 = as_type<int>(_882);
    if (_852)
    {
        float _890 = _882 * 5.0;
        _888 = as_type<int>(_890);
    }
    int _892 = _888;
    float _894 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _896 = _854 * _862;
    if (_852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3250 = as_type<float>(_892);
        out.gl_Position.z = _3250;
    }
    float _898 = _364 * _894;
    float _900 = _878 + 0.5;
    out.m_63.x = _884;
    out.m_63.y = _896;
    out.m_63.z = _872;
    out.m_63.w = _874;
    out.m_65.x = _870;
    out.m_65.y = _900;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _910 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _916 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _920 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _908 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _924 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _922 * _886;
    out.m_67.x = _912;
    out.m_67.y = _920;
    out.m_67.z = _910;
    float _932 = _782 * _930;
    if (_852)
    {
        out.m_47.x = 0.0;
    }
    float _934 = _792 * _930;
    out.m_69.x = _924;
    out.m_69.y = _926;
    out.m_69.z = _928;
    if (_852)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _936 = -_934;
    float _938 = _684 + _936;
    float _940 = _828 * _930;
    float _942 = -_932;
    float _944 = _750 + _942;
    float _946 = -_934;
    float _948 = _792 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _952 = _938 + _950;
    float _954 = -_940;
    float _956 = _786 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _960 = _944 + _958;
    float _962 = _948 * _948;
    float _964 = _952 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _956 + _966;
    float _970 = -_932;
    float _972 = _782 + _970;
    float _974 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[28].x, _964);
    float _976 = fma(_972, _972, _962);
    float _978 = -_940;
    float _980 = _828 + _978;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _974);
    bool _984 = _982 >= 0.0;
    int _986 = as_type<int>(_948);
    float _988 = _952;
    float _990 = _938;
    if (_984)
    {
        _774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _992 = _774;
    if (_984)
    {
        out.m_47.x = 0.0;
    }
    if (_984)
    {
        float _994 = _992 * 5.0;
        _986 = as_type<int>(_994);
    }
    int _996 = _986;
    if (_984)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3461 = as_type<float>(_996);
        out.gl_Position.z = _3461;
    }
    if (_984)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _998 = fma(_980, _980, _976);
    float _1000 = in.m_71.x;
    float _1002 = in.m_71.y;
    float _1004 = in.m_71.z;
    float _1006 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1006;
    float _1010 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1012 = sqrt(_998);
    float _1014 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1016 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1014;
    float _1018 = _1008 * _1008;
    float _1020 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1020;
    float _1024 = _364 * _1010;
    float _1026 = fma(_1016, _1016, _1018);
    float _1028 = _842 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1030 = _1024 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = fma(_1022, _1022, _1026);
    float _1034 = _364 * _1028;
    float _1036 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = sqrt(_1032);
    float _1040 = _886 * _1012;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1002);
    float _1044 = _1040 * _1036;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1048 = _908 * _1040;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1004);
    float _1052 = _1042 * _1044;
    float _1054 = _1046 * _1048;
    float _1056 = _1040 * _1030;
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1062 = fma(_1038, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1064 = _1050 * _1056;
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1060);
    float _1070 = precise::max(_1062, 1.0);
    float _1072 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1068);
    float _1076 = precise::min(_1070, 1.89999997615814208984375);
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1082 = fma(_1078, _1076, _750);
    float _1084 = fma(_1080, _1076, _786);
    float _1086 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1084 + _1092;
    float _1096 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1086);
    float _1098 = _1090 * _1090;
    float _1100 = _1094 * _1094;
    float _1102 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1096);
    float _1104 = _1098 + _1100;
    float _1106 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1108 = sqrt(_1104);
    float _1110 = fma(_1106, _1076, _684);
    bool _1112 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1102;
    float _1116 = _1064;
    float _1118 = _1106;
    float _1120 = _1052;
    float _1122 = _1084;
    if (!_1112)
    {
        _1114 = _1084;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1112)
    {
        _1116 = _1100;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (!_1112)
    {
        _1118 = _1098;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (!_1112)
    {
        _1120 = _1082;
    }
    float _1136 = _1120;
    float _1138 = _1136;
    if (!_1112)
    {
        _1122 = _1110;
    }
    float _1140 = _1122;
    bool _1142 = !_1112;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1108 + _1148;
        float _1152 = rsqrt(_1104);
        float _1154 = _1150 * _1146;
        float _1156 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = _1154 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = fma(_1162, _1156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1152 * _1168;
        float _1172 = _1166 + (-1.0);
        float _1174 = fma(_1090, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1176 = fma(_1094, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1178 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1182 = _1174 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1186 = _1176 + _1184;
        float _1188 = fma(_1110, _1166, _1178);
        float _1190 = _1182 * _1182;
        float _1192 = _1186 * _1186;
        _1144 = _1188;
        _1134 = _1190;
        _1130 = _1192;
        _1126 = _1176;
        _1138 = _1174;
    }
    float _1194 = _1144;
    float _1196 = _1134;
    float _1198 = _1130;
    float _1200 = _1126;
    float _1202 = _1138;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1206 = _1194 + _1204;
    out.m_69.x = _924;
    out.m_69.y = _926;
    out.m_69.z = _928;
    float _1208 = fma(_1206, _1206, _1196);
    out.m_67.x = _912;
    out.m_67.y = _920;
    out.m_67.z = _910;
    float _1210 = _1208 + _1198;
    float _1212 = sqrt(_1210);
    bool _1214 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1216 = isnan(_1212);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1222 = _1218 || _1220;
    float _1224 = _1196;
    if (!_1222)
    {
        _1224 = 1.0;
    }
    float _1226 = _1224;
    bool _1228 = !_1222;
    float _1230 = _1226;
    if (!_1228)
    {
        bool _1232 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1234 = isnan(_1212);
        bool _1236 = _1232 || _1234;
        bool _1238 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1240 = _1236 || _1238;
        if (!_1240)
        {
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1244 = _1212 + _1242;
            float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1248 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1246;
            float _1250 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1252 = _1250 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1254 = 1.0 / _1248;
            float _1256 = _1244 * _1254;
            float _1258 = fma(_1256, _1252, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1230 = _1258;
            _1260 = true;
        }
        else
        {
            bool _1262 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1264 = isnan(_1212);
            bool _1266 = _1262 || _1264;
            bool _1268 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1270 = _1266 || _1268;
            if (!_1270)
            {
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1274 = _1212 + _1272;
                float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1280 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1282 = _1280 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1284 = 1.0 / _1278;
                float _1286 = _1274 * _1284;
                float _1288 = fma(_1286, _1282, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1230 = _1288;
                _1260 = true;
            }
            else
            {
                _1230 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1260 = false;
    float _1290 = _1230;
    float _1292 = _938 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1296 = _1200 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1300 = _1202 + _1298;
    float _1302 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1292);
    float _1304 = _938 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1306 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(0.5);
    bool _1314 = _1310 || _1312;
    float _1316 = fma(_1296, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1318 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1302);
    float _1320 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1322 = fma(_1300, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1326 = _1194 + _1324;
    float _1328 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1320);
    float _1332 = -_932;
    float _1334 = _1332 + _1322;
    float _1336 = 1.0 / _1328;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = fma(_1326, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1342 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.5);
    bool _1350 = _1346 || _1348;
    float _1352 = -_940;
    float _1354 = _1352 + _1316;
    float _1356 = _1338 + _1328;
    float _1358 = -_934;
    float _1360 = _1358 + _1340;
    float _1362 = _1338;
    float _1364 = _1360;
    float _1366 = _1354;
    float _1368 = _1328;
    if (_1314)
    {
        _1362 = _1334;
    }
    float _1370 = _1362;
    float _1372 = _1370;
    if (!_1314)
    {
        float _1374 = _952 * _952;
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1378 = -_786;
        float _1380 = _1378 + _1316;
        float _1382 = fma(_960, _960, _1374);
        float _1384 = fma(_968, _968, _1382);
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1388 = sqrt(_1384);
        float _1390 = 1.0 / _1040;
        float _1392 = precise::min(_1388, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1394 = _1392 * _1376;
        float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1398 = -_684;
        float _1400 = _1398 + _1340;
        float _1402 = _1394 * _1390;
        float _1404 = -_750;
        float _1406 = _1404 + _1322;
        float _1408 = _1396 * _1402;
        float _1410 = _1380 * _1402;
        float _1412 = fma(_1406, _1408, _944);
        float _1414 = fma(_1400, _1408, _938);
        float _1416 = fma(_1396, _1410, _956);
        _1364 = _1414;
        _1372 = _1412;
        _1366 = _1416;
        _1368 = _1402;
        _988 = _1374;
    }
    float _1418 = _1364;
    float _1420 = _1372;
    float _1422 = _1366;
    float _1424 = _1368;
    float _1426 = _988;
    float _1428 = _1424;
    float _1430 = _1426;
    if (_1350)
    {
        _990 = 1.0;
    }
    float _1432 = _990;
    float _1434 = _1356 * _1336;
    float _1436 = _1434 * 0.5;
    float _1438 = _1432;
    float _1440 = _1436;
    if (!_1350)
    {
        float _1442 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1446 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1444);
        float _1448 = _1442 * 0.15915493667125701904296875;
        float _1450 = _1448 * 6.283185482025146484375;
        float _1452 = cos(_1450);
        float _1454 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = _1448 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = 1.0 / _1452;
        float _1464 = _1456 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1460 * _1462;
        float _1470 = 1.0 / _1446;
        float _1472 = _1466 * _1468;
        float _1474 = _1456 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = _1470 * _1482;
        float _1486 = 1.0 / _1472;
        float _1488 = 1.0 / _1480;
        float _1490 = _1476 * _1486;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = fma(_1490, _1484, _1492);
        float _1496 = _1494 * _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        _1428 = _1488;
        _1438 = _1498;
    }
    float _1500 = _1428;
    float _1502 = _1438;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1418 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1420 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1422 + _1512;
    float _1516 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1518 = _1506 * _1506;
    float _1520 = fma(_1510, _1510, _1518);
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = rsqrt(_1522);
    float _1526 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1510 * _1526;
    float _1530 = _1514 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 + _1534;
    float _1538 = sqrt(_1536);
    bool _1540 = _1538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = _1538 + _1542;
    float _1546 = _1524;
    float _1548 = _1500;
    float _1550 = _1544;
    float _1552 = _1506;
    float _1554 = _1528;
    if (_1540)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1556;
    }
    float _1558 = _1546;
    if (_1540)
    {
        float _1560 = rsqrt(_1536);
        _1548 = _1560;
    }
    float _1562 = _1548;
    float _1564 = _1562;
    if (_1540)
    {
        float _1566 = _1544 * _1558;
        _1550 = _1566;
    }
    float _1568 = _1550;
    if (_1540)
    {
        float _1570 = _1568 * 0.15915493667125701904296875;
        _1440 = _1570;
    }
    float _1572 = _1440;
    float _1574 = precise::max(0.0, _1516);
    float _1576 = _1514;
    float _1578 = _1574;
    if (_1540)
    {
        float _1580 = _1572 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = -_1526;
    float _1588 = -_1574;
    float _1590 = fma(_1506, _1586, _1588);
    if (_1540)
    {
        float _1592 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1592;
    }
    float _1594 = _1552;
    float _1596 = _1558;
    float _1598 = _1594;
    if (_1540)
    {
        float _1600 = _1572 * 6.283185482025146484375;
        float _1602 = cos(_1600);
        _1596 = _1602;
    }
    float _1604 = _1596;
    float _1606 = _1584;
    if (_1540)
    {
        float _1608 = fma(_1584, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1598 = _1608;
    }
    float _1610 = _1598;
    float _1612 = sqrt(_1522);
    float _1614 = _1610;
    if (!_1540)
    {
        _1606 = _1530;
    }
    float _1616 = _1606;
    float _1618 = _1616;
    if (_1540)
    {
        float _1620 = _1562 * _1610;
        _1430 = _1620;
    }
    float _1622 = _1430;
    if (!_1540)
    {
        _1564 = _1590;
    }
    float _1624 = _1564;
    float _1626 = _1624;
    if (!_1540)
    {
        _1614 = _1532;
    }
    float _1628 = _1614;
    float _1630 = _1628;
    if (_1540)
    {
        float _1632 = _1604 + (-1.0);
        _1578 = _1632;
    }
    float _1634 = _1578;
    float _1636 = _1634;
    if (_1540)
    {
        float _1638 = _1528 * _1622;
        _1554 = _1638;
    }
    float _1640 = _1554;
    if (_1540)
    {
        float _1642 = _1530 * _1622;
        _1618 = _1642;
    }
    float _1644 = _1618;
    if (_1540)
    {
        float _1646 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1646;
    }
    float _1648 = _1636;
    float _1650 = _1648;
    if (_1540)
    {
        float _1652 = _1640 * _1640;
        _1630 = _1652;
    }
    float _1654 = _1630;
    if (_1540)
    {
        float _1656 = fma(_1590, _1604, _1648);
        _1626 = _1656;
    }
    float _1658 = _1626;
    if (!_1540)
    {
        _1650 = _1534;
    }
    float _1660 = _1650;
    float _1662 = _1660;
    if (_1540)
    {
        float _1664 = _1644 * _1644;
        _1662 = _1664;
    }
    float _1666 = _1662;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1670 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1668);
    float _1672 = precise::clamp(_1670, 0.0, 1.0);
    float _1674 = fma(_1658, _1658, _1654);
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1678 = -_1672;
    float _1680 = _1678 + 1.0;
    float _1682 = _1674 + _1666;
    float _1684 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1686 = rsqrt(_1682);
    float _1688 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1684);
    float _1690 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1692 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1694 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1690);
    float _1698 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1702 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1704 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1706 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1698);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1710 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1702);
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1714 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1716 = -_1708;
    float _1718 = fma(_1716, _1676, 1.0);
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1724 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1726 = _1686 * _1640;
    float _1728 = abs(_1680);
    float _1730 = log2(_1728);
    float _1732 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1722);
    float _1734 = _1686 * _1658;
    float _1736 = _1686 * _1644;
    float _1738 = log2(_1718);
    float _1740 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1744 = -_1740;
    float _1746 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1744);
    float _1748 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1750 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1752 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = -_1736;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1746);
    float _1758 = 1.0 / _1748;
    float _1760 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1762 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1750);
    float _1764 = fma(_1756, -0.5, 0.5);
    float _1766 = fma(_1756, 0.5, 0.5);
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1770 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1762);
    float _1772 = _1738 * 0.693147182464599609375;
    float _1774 = exp2(_1752);
    float _1776 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1768);
    float _1778 = fma(_1766, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1770);
    float _1782 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1786 = fma(_1766, _1778, -0.212114393711090087890625);
    float _1788 = sqrt(_1764);
    float _1790 = _1734 + 1.0;
    float _1792 = _1780 * _1758;
    float _1794 = _1784 * _1758;
    float _1796 = fma(_1766, _1786, 1.570728778839111328125);
    float _1798 = fma(_1792, 0.5, 0.5);
    float _1800 = fma(_1794, -0.5, 0.5);
    float _1802 = -_1734;
    float _1804 = fma(_1774, _1790, _1802);
    float _1806 = fma(_1804, 0.5, 0.5);
    float _1808 = _1788 * 0.636619746685028076171875;
    float3 _4783 = float3(_1798, _1800, _1782);
    float _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4783, float3(0.0), isnan(_4783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4783, float3(0.0), isnan(_4783)), level(0.0)).x;
    float3 _4794 = float3(_1798, _1800, _1782);
    float4 _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4794, float3(0.0), isnan(_4794)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4794, float3(0.0), isnan(_4794)), level(0.0)).xyzw;
    float _1815 = _1813.x;
    float _1817 = _1813.y;
    float _1819 = _1813.z;
    float _1821 = _1813.w;
    float _1823 = -_1796;
    float _1825 = fma(_1808, _1823, 1.0);
    float2 _4816 = float2(_1825, _1806);
    float3 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4816, float2(0.0), isnan(_4816)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4816, float2(0.0), isnan(_4816)), level(0.0)).xyz;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1839 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1841 = _1502 > 0.0;
    bool _1843 = isnan(_1502);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    float _1851 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1853 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1839);
    float _1855 = exp2(_1837);
    float _1857 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1853);
    float _1859 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1857);
    float _1861 = _1859 + _1748;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1784;
    out.gl_Position.z = _1859;
    out.gl_Position.w = _1748;
    float _1863 = _1861 * 0.5;
    float _1865 = -_1855;
    float _1867 = _1865 + 1.0;
    float _1869 = _1851 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _1863;
    out.m_73.w = _1748;
    out.m_47.x = _1869;
    float _1873 = _1871 * _1810;
    float _1875 = -_1871;
    float _1877 = _1875 + 1.0;
    float _1879 = _1821 * _1873;
    float _1881 = _1821 * _1877;
    float _1883 = _1835 * _1873;
    float _1885 = fma(_1831, _1879, _1815);
    float _1887 = fma(_1833, _1879, _1817);
    float _1889 = fma(_1821, _1883, _1819);
    out.m_75.x = _1885;
    out.m_75.y = _1887;
    out.m_75.z = _1889;
    out.m_75.w = _1881;
    if (_1849)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1891;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1260 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1947 = as_type<float>(_110);
        out.gl_Position.z = _1947;
    }
    if (!_98)
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
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_94);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _104;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_146);
        out.gl_Position.z = _2015;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_51.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = in.m_53.x;
    float _156 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _152 * _150;
    float _176 = 0.0;
    float _178 = _156;
    if (!_168)
    {
        float _180 = _156 * _156;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _184;
    if (!_168)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = floor(_186);
    float _204 = _200 * 0.15915493667125701904296875;
    float _206 = _204 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = -_202;
    float _212 = _186 + _210;
    bool _214 = !_168;
    float _216 = _198;
    float _218 = _158;
    float _220 = _154;
    if (!_214)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _156 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _156);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _250;
    }
    float _252 = _216;
    bool _254 = !_168;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _156 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _178 = _274;
    }
    float _276 = _178;
    float _278 = in.m_55.w;
    bool _280 = _212 < 0.5;
    float _282 = float(_280);
    float _284 = in.m_44.x;
    float _286 = in.m_44.y;
    float _288 = in.m_44.z;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _296 = _294 != 0;
    float _298 = fma(_208, 0.5, 0.5);
    float _300 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = -_212;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = -_282;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _310 = -_298;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _314 = !_292;
    int _316 = _314 ? 0 : 1;
    float _318 = fma(_276, _188, _300);
    out.m_57.x = _154;
    bool _320 = !_172;
    int _322 = _320 ? 0 : 1;
    int _324 = abs(_316);
    out.m_57.y = _158;
    bool _326 = !_296;
    int _328 = _326 ? 0 : 1;
    int _330 = abs(_322);
    float _332 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _336 = abs(_328);
    float _338 = fma(_276, _190, _332);
    float _340 = float(_324);
    float _342 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = float(_330);
    float _346 = abs(_304);
    float _348 = _340 * _346;
    float _350 = fma(_276, _192, _342);
    float _352 = float(_336);
    float _354 = fma(_344, _312, _348);
    float _356 = fma(_318, _278, _284);
    float _358 = fma(_338, _278, _286);
    float _360 = fma(_350, _278, _288);
    float _362 = abs(_308);
    float _364 = fma(_352, _362, _354);
    bool _366 = !_334;
    float _368 = _342;
    int _370 = as_type<int>(_286);
    bool _372 = _292;
    float _374 = _284;
    bool _376 = false;
    float _392;
    if (!_366)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_94);
        float _398 = 1.0 / _396;
        float _400 = _126 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = in.m_51.z;
    float _406 = in.m_51.w;
    float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _412 = _410 != 0;
    float _414 = in.m_51.y;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _422 = _420 != 0;
    float _424 = in.m_59.w;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _432 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_402);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _288;
    float _446 = _402;
    if (_412)
    {
        float _448 = in.m_51.z;
        _444 = _448;
    }
    float _450 = _444;
    if (!_412)
    {
        _368 = _154;
    }
    float _452 = _368;
    float _454 = _452;
    if (_418)
    {
        float _456 = -_154;
        float _458 = _456 + 1.0;
        _370 = as_type<int>(_458);
    }
    int _460 = _370;
    int _462 = _460;
    if (_418)
    {
        bool _464 = _148 > 0.5;
        _372 = _464;
    }
    bool _466 = _372;
    float _468 = _408 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_418)
    {
        _374 = _154;
    }
    float _470 = _374;
    float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _474 = _470;
    if (_418)
    {
        float _476 = _466 ? as_type<float>(_460) : _154;
        _474 = _476;
    }
    float _478 = _474;
    if (_412)
    {
        float _480 = -_154;
        float _482 = _480 + 1.0;
        _462 = as_type<int>(_482);
    }
    int _484 = _462;
    bool _486 = _406 > 0.5;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _498 = _496 != 0;
    float _500 = _430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _502 = 1.0 / _490;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _506 = _504 != 0;
    out.m_61.w = _424;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _510 = _478 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _512 = 1.0 / _494;
    float _514 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _516 = _404;
    if (_412)
    {
        bool _518 = _450 > 0.5;
        _376 = _518;
    }
    bool _520 = _376;
    float _522 = _472 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_412)
    {
        float _524 = _520 ? as_type<float>(_484) : _154;
        _454 = _524;
    }
    float _526 = _454;
    float _528 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _532 = _530 != 0;
    float _534 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _536 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].x, _514);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _540 = _402 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _544 = _402 + _542;
    float _546 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _548 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].x, _528);
    float _550 = _540 * _502;
    float _552 = -_158;
    float _554 = _552 + 1.0;
    float _556 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _546);
    float _558 = _544 * _512;
    bool _560 = _404 > 0.5;
    float _562 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _564 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _536);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _566;
    float _570 = _560 ? _554 : _158;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _572;
    bool _576 = _414 > 0.5;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _578;
    float _582 = fma(_568, _550, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _588 = _576 ? _554 : _158;
    float _590 = fma(_580, _550, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = fma(_574, _550, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _598 = _422 ? _570 : _158;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _604 = _428 ? _588 : _158;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _608 = _570;
    float _610 = _588;
    float _612 = _592;
    if (_506)
    {
        float _614 = _486 ? _554 : _158;
        _218 = _614;
    }
    float _616 = _218;
    float _618 = fma(_602, _558, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    if (!_532)
    {
        _608 = _414;
    }
    float _620 = _608;
    float _622 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[88].w, _606);
    bool _624 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _626 = isnan(_402);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = fma(_596, _558, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _638 = _620;
    if (!_532)
    {
        _610 = _620;
    }
    float _640 = _610;
    float _642 = fma(_586, _558, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _644 = _414 > 0.5;
    bool _646 = _644 && _498;
    float _648 = fma(_598, _468, -0.5);
    float _650 = _640;
    if (_532)
    {
        _638 = _414;
    }
    float _652 = _638;
    float _654 = -_634;
    float _656 = _654 + 1.0;
    bool _658 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _660 = isnan(_402);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_532)
    {
        _446 = _148;
    }
    float _672 = _446;
    float _674 = _442 * _656;
    float _676 = -_442;
    float _678 = _676 + 1.0;
    float _680 = _672;
    if (!_532)
    {
        _680 = _404;
    }
    float _682 = _680;
    float _684 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_532)
    {
        _650 = _148;
    }
    float _686 = _650;
    float _688 = _668 * _678;
    float _690 = -_668;
    float _692 = _690 + 1.0;
    float _694 = _682 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _696 = fma(_500, _526, -0.5);
    float _698 = _582 * _688;
    float _700 = _590 * _688;
    float _702 = _592 * _688;
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].x, _698);
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].y, _700);
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].z, _702);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_498)
    {
        _612 = _154;
    }
    float _712 = _612;
    float _714 = _712;
    if (_646)
    {
        float _716 = -_154;
        float _718 = _716 + 1.0;
        _220 = _718;
    }
    float _720 = _220;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _724 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].z, _710);
    float _726 = _686 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _728 = -_508;
    float _730 = fma(_694, 2.0, _728);
    float _732 = _720;
    float _734 = _722;
    if (_498)
    {
        _714 = _720;
    }
    float _736 = _714;
    float _738 = -_722;
    float _740 = fma(_726, 2.0, _738);
    if (!_532)
    {
        _732 = _404;
    }
    float _742 = _732;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _746 = _742;
    if (!_532)
    {
        _734 = _404;
    }
    float _748 = _734;
    float _750 = _562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _748;
    if (_532)
    {
        _746 = _652;
    }
    float _754 = _746;
    float _756 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _744);
    if (_532)
    {
        _752 = _652;
    }
    float _758 = _752;
    float _760 = -_126;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[81].x, _740);
    if (_532)
    {
        _516 = _652;
    }
    float _764 = _516;
    float _766 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _768 = _758 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _770 = fma(_522, _736, -0.5);
    float _772 = _764;
    float _774 = _766;
    if (!_532)
    {
        _772 = _148;
    }
    float _776 = _772;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _782 = _750 + _780;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _786 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = fma(_768, -2.0, _778);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _684 + _790;
    float _794 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[83].w, _784);
    float _796 = fma(_618, _674, _704);
    float _798 = fma(_636, _674, _706);
    float _800 = fma(_642, _674, _708);
    float _802 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _724);
    float _804 = _792 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _806 = -_126;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[86].x, _730);
    float _810 = fma(_766, _616, -0.5);
    float _812 = fma(_802, _696, _762);
    float _814 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[28].x, _804);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _818 = _776 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _820 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _756);
    float _822 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _788);
    float _824 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _786 + _826;
    float _830 = fma(_820, _770, _808);
    float _832 = fma(_818, -2.0, _816);
    float _834 = -_822;
    float _836 = fma(_824, _810, _834);
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[28].z, _814);
    float _840 = in.m_55.x;
    float _842 = in.m_55.y;
    float _844 = in.m_55.z;
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _848 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _832);
    float _850 = _792 * _792;
    bool _852 = _838 >= 0.0;
    float _854 = _604 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _856 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _622);
    float _858 = fma(_782, _782, _850);
    float _860 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].x, _796);
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _864 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].y, _798);
    float _866 = fma(_828, _828, _858);
    float _868 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].z, _800);
    float _870 = _830 + 0.5;
    float _872 = _812 + 0.5;
    float _874 = _836 + 0.5;
    float _876 = -_848;
    float _878 = fma(_856, _648, _876);
    float _880 = _820;
    if (_852)
    {
        _880 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _882 = _880;
    float _884 = _510 * _846;
    float _886 = rsqrt(_866);
    int _888 = as_type<int>(_882);
    if (_852)
    {
        float _890 = _882 * 5.0;
        _888 = as_type<int>(_890);
    }
    int _892 = _888;
    float _894 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _896 = _854 * _862;
    if (_852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3250 = as_type<float>(_892);
        out.gl_Position.z = _3250;
    }
    float _898 = _364 * _894;
    float _900 = _878 + 0.5;
    out.m_63.x = _884;
    out.m_63.y = _896;
    out.m_63.z = _872;
    out.m_63.w = _874;
    out.m_65.x = _870;
    out.m_65.y = _900;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _910 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _916 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _920 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _908 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _924 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _922 * _886;
    out.m_67.x = _912;
    out.m_67.y = _920;
    out.m_67.z = _910;
    float _932 = _782 * _930;
    if (_852)
    {
        out.m_47.x = 0.0;
    }
    float _934 = _792 * _930;
    out.m_69.x = _924;
    out.m_69.y = _926;
    out.m_69.z = _928;
    if (_852)
    {
        return out;
    }
    float _936 = -_934;
    float _938 = _684 + _936;
    float _940 = _828 * _930;
    float _942 = -_932;
    float _944 = _750 + _942;
    float _946 = -_934;
    float _948 = _792 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _952 = _938 + _950;
    float _954 = -_940;
    float _956 = _786 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _960 = _944 + _958;
    float _962 = _948 * _948;
    float _964 = _952 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _956 + _966;
    float _970 = -_932;
    float _972 = _782 + _970;
    float _974 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[28].x, _964);
    float _976 = fma(_972, _972, _962);
    float _978 = -_940;
    float _980 = _828 + _978;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _974);
    bool _984 = _982 >= 0.0;
    int _986 = as_type<int>(_948);
    float _988 = _952;
    float _990 = _938;
    if (_984)
    {
        _774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _992 = _774;
    if (_984)
    {
        out.m_47.x = 0.0;
    }
    if (_984)
    {
        float _994 = _992 * 5.0;
        _986 = as_type<int>(_994);
    }
    int _996 = _986;
    if (_984)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3461 = as_type<float>(_996);
        out.gl_Position.z = _3461;
    }
    if (_984)
    {
        return out;
    }
    float _998 = fma(_980, _980, _976);
    float _1000 = in.m_71.x;
    float _1002 = in.m_71.y;
    float _1004 = in.m_71.z;
    float _1006 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1006;
    float _1010 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1012 = sqrt(_998);
    float _1014 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1016 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1014;
    float _1018 = _1008 * _1008;
    float _1020 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1020;
    float _1024 = _364 * _1010;
    float _1026 = fma(_1016, _1016, _1018);
    float _1028 = _842 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1030 = _1024 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = fma(_1022, _1022, _1026);
    float _1034 = _364 * _1028;
    float _1036 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = sqrt(_1032);
    float _1040 = _886 * _1012;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1002);
    float _1044 = _1040 * _1036;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1048 = _908 * _1040;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1004);
    float _1052 = _1042 * _1044;
    float _1054 = _1046 * _1048;
    float _1056 = _1040 * _1030;
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1062 = fma(_1038, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1064 = _1050 * _1056;
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1060);
    float _1070 = precise::max(_1062, 1.0);
    float _1072 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1068);
    float _1076 = precise::min(_1070, 1.89999997615814208984375);
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1082 = fma(_1078, _1076, _750);
    float _1084 = fma(_1080, _1076, _786);
    float _1086 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1084 + _1092;
    float _1096 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1086);
    float _1098 = _1090 * _1090;
    float _1100 = _1094 * _1094;
    float _1102 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1096);
    float _1104 = _1098 + _1100;
    float _1106 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1108 = sqrt(_1104);
    float _1110 = fma(_1106, _1076, _684);
    bool _1112 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1102;
    float _1116 = _1064;
    float _1118 = _1106;
    float _1120 = _1052;
    float _1122 = _1084;
    if (!_1112)
    {
        _1114 = _1084;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1112)
    {
        _1116 = _1100;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (!_1112)
    {
        _1118 = _1098;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (!_1112)
    {
        _1120 = _1082;
    }
    float _1136 = _1120;
    float _1138 = _1136;
    if (!_1112)
    {
        _1122 = _1110;
    }
    float _1140 = _1122;
    bool _1142 = !_1112;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1108 + _1148;
        float _1152 = rsqrt(_1104);
        float _1154 = _1150 * _1146;
        float _1156 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = _1154 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = fma(_1162, _1156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1152 * _1168;
        float _1172 = _1166 + (-1.0);
        float _1174 = fma(_1090, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1176 = fma(_1094, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1178 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1182 = _1174 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1186 = _1176 + _1184;
        float _1188 = fma(_1110, _1166, _1178);
        float _1190 = _1182 * _1182;
        float _1192 = _1186 * _1186;
        _1144 = _1188;
        _1134 = _1190;
        _1130 = _1192;
        _1126 = _1176;
        _1138 = _1174;
    }
    float _1194 = _1144;
    float _1196 = _1134;
    float _1198 = _1130;
    float _1200 = _1126;
    float _1202 = _1138;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1206 = _1194 + _1204;
    out.m_69.x = _924;
    out.m_69.y = _926;
    out.m_69.z = _928;
    float _1208 = fma(_1206, _1206, _1196);
    out.m_67.x = _912;
    out.m_67.y = _920;
    out.m_67.z = _910;
    float _1210 = _1208 + _1198;
    float _1212 = sqrt(_1210);
    bool _1214 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1216 = isnan(_1212);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1222 = _1218 || _1220;
    float _1224 = _1196;
    if (!_1222)
    {
        _1224 = 1.0;
    }
    float _1226 = _1224;
    bool _1228 = !_1222;
    float _1230 = _1226;
    if (!_1228)
    {
        bool _1232 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1234 = isnan(_1212);
        bool _1236 = _1232 || _1234;
        bool _1238 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1240 = _1236 || _1238;
        if (!_1240)
        {
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1244 = _1212 + _1242;
            float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1248 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1246;
            float _1250 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1252 = _1250 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1254 = 1.0 / _1248;
            float _1256 = _1244 * _1254;
            float _1258 = fma(_1256, _1252, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1230 = _1258;
            _1260 = true;
        }
        else
        {
            bool _1262 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1264 = isnan(_1212);
            bool _1266 = _1262 || _1264;
            bool _1268 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1270 = _1266 || _1268;
            if (!_1270)
            {
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1274 = _1212 + _1272;
                float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1280 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1282 = _1280 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1284 = 1.0 / _1278;
                float _1286 = _1274 * _1284;
                float _1288 = fma(_1286, _1282, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1230 = _1288;
                _1260 = true;
            }
            else
            {
                _1230 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1260 = false;
    float _1290 = _1230;
    float _1292 = _938 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1296 = _1200 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1300 = _1202 + _1298;
    float _1302 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1292);
    float _1304 = _938 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1306 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(0.5);
    bool _1314 = _1310 || _1312;
    float _1316 = fma(_1296, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1318 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1302);
    float _1320 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1322 = fma(_1300, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1326 = _1194 + _1324;
    float _1328 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1320);
    float _1332 = -_932;
    float _1334 = _1332 + _1322;
    float _1336 = 1.0 / _1328;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = fma(_1326, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1342 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.5);
    bool _1350 = _1346 || _1348;
    float _1352 = -_940;
    float _1354 = _1352 + _1316;
    float _1356 = _1338 + _1328;
    float _1358 = -_934;
    float _1360 = _1358 + _1340;
    float _1362 = _1338;
    float _1364 = _1360;
    float _1366 = _1354;
    float _1368 = _1328;
    if (_1314)
    {
        _1362 = _1334;
    }
    float _1370 = _1362;
    float _1372 = _1370;
    if (!_1314)
    {
        float _1374 = _952 * _952;
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1378 = -_786;
        float _1380 = _1378 + _1316;
        float _1382 = fma(_960, _960, _1374);
        float _1384 = fma(_968, _968, _1382);
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1388 = sqrt(_1384);
        float _1390 = 1.0 / _1040;
        float _1392 = precise::min(_1388, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1394 = _1392 * _1376;
        float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1398 = -_684;
        float _1400 = _1398 + _1340;
        float _1402 = _1394 * _1390;
        float _1404 = -_750;
        float _1406 = _1404 + _1322;
        float _1408 = _1396 * _1402;
        float _1410 = _1380 * _1402;
        float _1412 = fma(_1406, _1408, _944);
        float _1414 = fma(_1400, _1408, _938);
        float _1416 = fma(_1396, _1410, _956);
        _1364 = _1414;
        _1372 = _1412;
        _1366 = _1416;
        _1368 = _1402;
        _988 = _1374;
    }
    float _1418 = _1364;
    float _1420 = _1372;
    float _1422 = _1366;
    float _1424 = _1368;
    float _1426 = _988;
    float _1428 = _1424;
    float _1430 = _1426;
    if (_1350)
    {
        _990 = 1.0;
    }
    float _1432 = _990;
    float _1434 = _1356 * _1336;
    float _1436 = _1434 * 0.5;
    float _1438 = _1432;
    float _1440 = _1436;
    if (!_1350)
    {
        float _1442 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1446 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1444);
        float _1448 = _1442 * 0.15915493667125701904296875;
        float _1450 = _1448 * 6.283185482025146484375;
        float _1452 = cos(_1450);
        float _1454 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = _1448 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = 1.0 / _1452;
        float _1464 = _1456 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1460 * _1462;
        float _1470 = 1.0 / _1446;
        float _1472 = _1466 * _1468;
        float _1474 = _1456 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = _1470 * _1482;
        float _1486 = 1.0 / _1472;
        float _1488 = 1.0 / _1480;
        float _1490 = _1476 * _1486;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = fma(_1490, _1484, _1492);
        float _1496 = _1494 * _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        _1428 = _1488;
        _1438 = _1498;
    }
    float _1500 = _1428;
    float _1502 = _1438;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1418 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1420 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1422 + _1512;
    float _1516 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1518 = _1506 * _1506;
    float _1520 = fma(_1510, _1510, _1518);
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = rsqrt(_1522);
    float _1526 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1510 * _1526;
    float _1530 = _1514 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 + _1534;
    float _1538 = sqrt(_1536);
    bool _1540 = _1538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = _1538 + _1542;
    float _1546 = _1524;
    float _1548 = _1500;
    float _1550 = _1544;
    float _1552 = _1506;
    float _1554 = _1528;
    if (_1540)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1556;
    }
    float _1558 = _1546;
    if (_1540)
    {
        float _1560 = rsqrt(_1536);
        _1548 = _1560;
    }
    float _1562 = _1548;
    float _1564 = _1562;
    if (_1540)
    {
        float _1566 = _1544 * _1558;
        _1550 = _1566;
    }
    float _1568 = _1550;
    if (_1540)
    {
        float _1570 = _1568 * 0.15915493667125701904296875;
        _1440 = _1570;
    }
    float _1572 = _1440;
    float _1574 = precise::max(0.0, _1516);
    float _1576 = _1514;
    float _1578 = _1574;
    if (_1540)
    {
        float _1580 = _1572 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = -_1526;
    float _1588 = -_1574;
    float _1590 = fma(_1506, _1586, _1588);
    if (_1540)
    {
        float _1592 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1592;
    }
    float _1594 = _1552;
    float _1596 = _1558;
    float _1598 = _1594;
    if (_1540)
    {
        float _1600 = _1572 * 6.283185482025146484375;
        float _1602 = cos(_1600);
        _1596 = _1602;
    }
    float _1604 = _1596;
    float _1606 = _1584;
    if (_1540)
    {
        float _1608 = fma(_1584, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1598 = _1608;
    }
    float _1610 = _1598;
    float _1612 = sqrt(_1522);
    float _1614 = _1610;
    if (!_1540)
    {
        _1606 = _1530;
    }
    float _1616 = _1606;
    float _1618 = _1616;
    if (_1540)
    {
        float _1620 = _1562 * _1610;
        _1430 = _1620;
    }
    float _1622 = _1430;
    if (!_1540)
    {
        _1564 = _1590;
    }
    float _1624 = _1564;
    float _1626 = _1624;
    if (!_1540)
    {
        _1614 = _1532;
    }
    float _1628 = _1614;
    float _1630 = _1628;
    if (_1540)
    {
        float _1632 = _1604 + (-1.0);
        _1578 = _1632;
    }
    float _1634 = _1578;
    float _1636 = _1634;
    if (_1540)
    {
        float _1638 = _1528 * _1622;
        _1554 = _1638;
    }
    float _1640 = _1554;
    if (_1540)
    {
        float _1642 = _1530 * _1622;
        _1618 = _1642;
    }
    float _1644 = _1618;
    if (_1540)
    {
        float _1646 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1646;
    }
    float _1648 = _1636;
    float _1650 = _1648;
    if (_1540)
    {
        float _1652 = _1640 * _1640;
        _1630 = _1652;
    }
    float _1654 = _1630;
    if (_1540)
    {
        float _1656 = fma(_1590, _1604, _1648);
        _1626 = _1656;
    }
    float _1658 = _1626;
    if (!_1540)
    {
        _1650 = _1534;
    }
    float _1660 = _1650;
    float _1662 = _1660;
    if (_1540)
    {
        float _1664 = _1644 * _1644;
        _1662 = _1664;
    }
    float _1666 = _1662;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1670 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1668);
    float _1672 = precise::clamp(_1670, 0.0, 1.0);
    float _1674 = fma(_1658, _1658, _1654);
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1678 = -_1672;
    float _1680 = _1678 + 1.0;
    float _1682 = _1674 + _1666;
    float _1684 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1686 = rsqrt(_1682);
    float _1688 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1684);
    float _1690 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1692 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1694 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1690);
    float _1698 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1702 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1704 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1706 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1698);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1710 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1702);
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1714 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1716 = -_1708;
    float _1718 = fma(_1716, _1676, 1.0);
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1724 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1726 = _1686 * _1640;
    float _1728 = abs(_1680);
    float _1730 = log2(_1728);
    float _1732 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1722);
    float _1734 = _1686 * _1658;
    float _1736 = _1686 * _1644;
    float _1738 = log2(_1718);
    float _1740 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1744 = -_1740;
    float _1746 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1744);
    float _1748 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1750 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1752 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = -_1736;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1746);
    float _1758 = 1.0 / _1748;
    float _1760 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1762 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1750);
    float _1764 = fma(_1756, -0.5, 0.5);
    float _1766 = fma(_1756, 0.5, 0.5);
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1770 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1762);
    float _1772 = _1738 * 0.693147182464599609375;
    float _1774 = exp2(_1752);
    float _1776 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1768);
    float _1778 = fma(_1766, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1770);
    float _1782 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1786 = fma(_1766, _1778, -0.212114393711090087890625);
    float _1788 = sqrt(_1764);
    float _1790 = _1734 + 1.0;
    float _1792 = _1780 * _1758;
    float _1794 = _1784 * _1758;
    float _1796 = fma(_1766, _1786, 1.570728778839111328125);
    float _1798 = fma(_1792, 0.5, 0.5);
    float _1800 = fma(_1794, -0.5, 0.5);
    float _1802 = -_1734;
    float _1804 = fma(_1774, _1790, _1802);
    float _1806 = fma(_1804, 0.5, 0.5);
    float _1808 = _1788 * 0.636619746685028076171875;
    float3 _4783 = float3(_1798, _1800, _1782);
    float _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4783, float3(0.0), isnan(_4783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4783, float3(0.0), isnan(_4783)), level(0.0)).x;
    float3 _4794 = float3(_1798, _1800, _1782);
    float4 _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4794, float3(0.0), isnan(_4794)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4794, float3(0.0), isnan(_4794)), level(0.0)).xyzw;
    float _1815 = _1813.x;
    float _1817 = _1813.y;
    float _1819 = _1813.z;
    float _1821 = _1813.w;
    float _1823 = -_1796;
    float _1825 = fma(_1808, _1823, 1.0);
    float2 _4816 = float2(_1825, _1806);
    float3 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4816, float2(0.0), isnan(_4816)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4816, float2(0.0), isnan(_4816)), level(0.0)).xyz;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1839 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1841 = _1502 > 0.0;
    bool _1843 = isnan(_1502);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    float _1851 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1853 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1839);
    float _1855 = exp2(_1837);
    float _1857 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1853);
    float _1859 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1857);
    float _1861 = _1859 + _1748;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1784;
    out.gl_Position.z = _1859;
    out.gl_Position.w = _1748;
    float _1863 = _1861 * 0.5;
    float _1865 = -_1855;
    float _1867 = _1865 + 1.0;
    float _1869 = _1851 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _1863;
    out.m_73.w = _1748;
    out.m_47.x = _1869;
    float _1873 = _1871 * _1810;
    float _1875 = -_1871;
    float _1877 = _1875 + 1.0;
    float _1879 = _1821 * _1873;
    float _1881 = _1821 * _1877;
    float _1883 = _1835 * _1873;
    float _1885 = fma(_1831, _1879, _1815);
    float _1887 = fma(_1833, _1879, _1817);
    float _1889 = fma(_1821, _1883, _1819);
    out.m_75.x = _1885;
    out.m_75.y = _1887;
    out.m_75.z = _1889;
    out.m_75.w = _1881;
    if (_1849)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1891;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1260 = false;
    bool _394 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_44.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_47.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1947 = as_type<float>(_110);
        out.gl_Position.z = _1947;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_49.w;
    bool _114 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _122 = _118 || _120;
    float _124 = -_112;
    float _126 = _124 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _128 = 0.0;
    if (_122)
    {
        float _130 = float(_94);
        _128 = _130;
    }
    float _132 = _128;
    bool _134 = _126 >= _132;
    bool _136 = !_122;
    bool _138 = _134 || _136;
    if (_138)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _104;
    if (_138)
    {
        out.m_47.x = 0.0;
    }
    int _142 = 0;
    if (_138)
    {
        float _144 = _140 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2015 = as_type<float>(_146);
        out.gl_Position.z = _2015;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_51.x;
    float _150 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _152 = _126 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _154 = in.m_53.x;
    float _156 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _158 = in.m_53.y;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _172 = _170 != 0;
    float _174 = _152 * _150;
    float _176 = 0.0;
    float _178 = _156;
    if (!_168)
    {
        float _180 = _156 * _156;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[20].x, _174);
    float _188 = in.m_49.x;
    float _190 = in.m_49.y;
    float _192 = in.m_49.z;
    float _194 = _184;
    if (!_168)
    {
        float _196 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = _186 * 6.283185482025146484375;
    float _202 = floor(_186);
    float _204 = _200 * 0.15915493667125701904296875;
    float _206 = _204 * 6.283185482025146484375;
    float _208 = cos(_206);
    float _210 = -_202;
    float _212 = _186 + _210;
    bool _214 = !_168;
    float _216 = _198;
    float _218 = _158;
    float _220 = _154;
    if (!_214)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = _156 * _224;
        float _234 = 1.0 / _228;
        float _236 = _230 * 0.693147182464599609375;
        float _238 = exp2(_232);
        float _240 = 1.0 / _236;
        float _242 = _238 + (-1.0);
        float _244 = -_242;
        float _246 = fma(_244, _240, _156);
        float _248 = _246 * _234;
        float _250 = _248 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _216 = _250;
    }
    float _252 = _216;
    bool _254 = !_168;
    if (!_254)
    {
        float _256 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _258 = log2(_256);
        float _260 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _262 = _260 + 1.0;
        float _264 = 1.0 / _262;
        float _266 = _156 * _258;
        float _268 = exp2(_266);
        float _270 = -_268;
        float _272 = _270 + 1.0;
        float _274 = _272 * _264;
        _178 = _274;
    }
    float _276 = _178;
    float _278 = in.m_55.w;
    bool _280 = _212 < 0.5;
    float _282 = float(_280);
    float _284 = in.m_44.x;
    float _286 = in.m_44.y;
    float _288 = in.m_44.z;
    int _290 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _292 = _290 != 0;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _296 = _294 != 0;
    float _298 = fma(_208, 0.5, 0.5);
    float _300 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = -_212;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _306 = -_282;
    float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _310 = -_298;
    float _312 = fma(_310, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _314 = !_292;
    int _316 = _314 ? 0 : 1;
    float _318 = fma(_276, _188, _300);
    out.m_57.x = _154;
    bool _320 = !_172;
    int _322 = _320 ? 0 : 1;
    int _324 = abs(_316);
    out.m_57.y = _158;
    bool _326 = !_296;
    int _328 = _326 ? 0 : 1;
    int _330 = abs(_322);
    float _332 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    int _336 = abs(_328);
    float _338 = fma(_276, _190, _332);
    float _340 = float(_324);
    float _342 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _344 = float(_330);
    float _346 = abs(_304);
    float _348 = _340 * _346;
    float _350 = fma(_276, _192, _342);
    float _352 = float(_336);
    float _354 = fma(_344, _312, _348);
    float _356 = fma(_318, _278, _284);
    float _358 = fma(_338, _278, _286);
    float _360 = fma(_350, _278, _288);
    float _362 = abs(_308);
    float _364 = fma(_352, _362, _354);
    bool _366 = !_334;
    float _368 = _342;
    int _370 = as_type<int>(_286);
    bool _372 = _292;
    float _374 = _284;
    bool _376 = false;
    float _392;
    if (!_366)
    {
        float _378 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _380 = _148 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _382 = fma(_380, (*spvDescriptorSet0.vp_c9)._m0[11].x, _126);
        float _384 = _382 * _378;
        float _386 = floor(_384);
        float _388 = -_386;
        float _390 = _384 + _388;
        _392 = _390;
        _394 = true;
    }
    else
    {
        float _396 = float(_94);
        float _398 = 1.0 / _396;
        float _400 = _126 * _398;
        _392 = _400;
    }
    _394 = false;
    float _402 = _392;
    float _404 = in.m_51.z;
    float _406 = in.m_51.w;
    float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _410 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _412 = _410 != 0;
    float _414 = in.m_51.y;
    int _416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _418 = _416 != 0;
    int _420 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _422 = _420 != 0;
    float _424 = in.m_59.w;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _428 = _426 != 0;
    float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _432 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _434 = isnan(_402);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _288;
    float _446 = _402;
    if (_412)
    {
        float _448 = in.m_51.z;
        _444 = _448;
    }
    float _450 = _444;
    if (!_412)
    {
        _368 = _154;
    }
    float _452 = _368;
    float _454 = _452;
    if (_418)
    {
        float _456 = -_154;
        float _458 = _456 + 1.0;
        _370 = as_type<int>(_458);
    }
    int _460 = _370;
    int _462 = _460;
    if (_418)
    {
        bool _464 = _148 > 0.5;
        _372 = _464;
    }
    bool _466 = _372;
    float _468 = _408 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_418)
    {
        _374 = _154;
    }
    float _470 = _374;
    float _472 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _474 = _470;
    if (_418)
    {
        float _476 = _466 ? as_type<float>(_460) : _154;
        _474 = _476;
    }
    float _478 = _474;
    if (_412)
    {
        float _480 = -_154;
        float _482 = _480 + 1.0;
        _462 = as_type<int>(_482);
    }
    int _484 = _462;
    bool _486 = _406 > 0.5;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    int _496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _498 = _496 != 0;
    float _500 = _430 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _502 = 1.0 / _490;
    int _504 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _506 = _504 != 0;
    out.m_61.w = _424;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _510 = _478 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _512 = 1.0 / _494;
    float _514 = _358 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _516 = _404;
    if (_412)
    {
        bool _518 = _450 > 0.5;
        _376 = _518;
    }
    bool _520 = _376;
    float _522 = _472 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_412)
    {
        float _524 = _520 ? as_type<float>(_484) : _154;
        _454 = _524;
    }
    float _526 = _454;
    float _528 = _358 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _530 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _532 = _530 != 0;
    float _534 = _358 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _536 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[5].x, _514);
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _540 = _402 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _544 = _402 + _542;
    float _546 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[6].x, _534);
    float _548 = fma(_356, (*spvDescriptorSet0.vp_c10)._m0[4].x, _528);
    float _550 = _540 * _502;
    float _552 = -_158;
    float _554 = _552 + 1.0;
    float _556 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[6].z, _546);
    float _558 = _544 * _512;
    bool _560 = _404 > 0.5;
    float _562 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[4].z, _548);
    float _564 = fma(_360, (*spvDescriptorSet0.vp_c10)._m0[5].z, _536);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _566;
    float _570 = _560 ? _554 : _158;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _572;
    bool _576 = _414 > 0.5;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _578;
    float _582 = fma(_568, _550, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _588 = _576 ? _554 : _158;
    float _590 = fma(_580, _550, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _592 = fma(_574, _550, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _598 = _422 ? _570 : _158;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _604 = _428 ? _588 : _158;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _608 = _570;
    float _610 = _588;
    float _612 = _592;
    if (_506)
    {
        float _614 = _486 ? _554 : _158;
        _218 = _614;
    }
    float _616 = _218;
    float _618 = fma(_602, _558, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    if (!_532)
    {
        _608 = _414;
    }
    float _620 = _608;
    float _622 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[88].w, _606);
    bool _624 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _626 = isnan(_402);
    bool _628 = _624 || _626;
    bool _630 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _632 = _628 || _630;
    float _634 = float(_632);
    float _636 = fma(_596, _558, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _638 = _620;
    if (!_532)
    {
        _610 = _620;
    }
    float _640 = _610;
    float _642 = fma(_586, _558, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    bool _644 = _414 > 0.5;
    bool _646 = _644 && _498;
    float _648 = fma(_598, _468, -0.5);
    float _650 = _640;
    if (_532)
    {
        _638 = _414;
    }
    float _652 = _638;
    float _654 = -_634;
    float _656 = _654 + 1.0;
    bool _658 = _402 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _660 = isnan(_402);
    bool _662 = _658 || _660;
    bool _664 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _666 = _662 || _664;
    float _668 = float(_666);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_532)
    {
        _446 = _148;
    }
    float _672 = _446;
    float _674 = _442 * _656;
    float _676 = -_442;
    float _678 = _676 + 1.0;
    float _680 = _672;
    if (!_532)
    {
        _680 = _404;
    }
    float _682 = _680;
    float _684 = _564 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_532)
    {
        _650 = _148;
    }
    float _686 = _650;
    float _688 = _668 * _678;
    float _690 = -_668;
    float _692 = _690 + 1.0;
    float _694 = _682 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _696 = fma(_500, _526, -0.5);
    float _698 = _582 * _688;
    float _700 = _590 * _688;
    float _702 = _592 * _688;
    float _704 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].x, _698);
    float _706 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].y, _700);
    float _708 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[107].z, _702);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    if (!_498)
    {
        _612 = _154;
    }
    float _712 = _612;
    float _714 = _712;
    if (_646)
    {
        float _716 = -_154;
        float _718 = _716 + 1.0;
        _220 = _718;
    }
    float _720 = _220;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _724 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[83].z, _710);
    float _726 = _686 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _728 = -_508;
    float _730 = fma(_694, 2.0, _728);
    float _732 = _720;
    float _734 = _722;
    if (_498)
    {
        _714 = _720;
    }
    float _736 = _714;
    float _738 = -_722;
    float _740 = fma(_726, 2.0, _738);
    if (!_532)
    {
        _732 = _404;
    }
    float _742 = _732;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _746 = _742;
    if (!_532)
    {
        _734 = _404;
    }
    float _748 = _734;
    float _750 = _562 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _752 = _748;
    if (_532)
    {
        _746 = _652;
    }
    float _754 = _746;
    float _756 = fma(_148, (*spvDescriptorSet0.vp_c9)._m0[88].z, _744);
    if (_532)
    {
        _752 = _652;
    }
    float _758 = _752;
    float _760 = -_126;
    float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[81].x, _740);
    if (_532)
    {
        _516 = _652;
    }
    float _764 = _516;
    float _766 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _768 = _758 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _770 = fma(_522, _736, -0.5);
    float _772 = _764;
    float _774 = _766;
    if (!_532)
    {
        _772 = _148;
    }
    float _776 = _772;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _782 = _750 + _780;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _786 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _788 = fma(_768, -2.0, _778);
    float _790 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _792 = _684 + _790;
    float _794 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[83].w, _784);
    float _796 = fma(_618, _674, _704);
    float _798 = fma(_636, _674, _706);
    float _800 = fma(_642, _674, _708);
    float _802 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].z, _724);
    float _804 = _792 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _806 = -_126;
    float _808 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[86].x, _730);
    float _810 = fma(_766, _616, -0.5);
    float _812 = fma(_802, _696, _762);
    float _814 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[28].x, _804);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _818 = _776 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _820 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].z, _756);
    float _822 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[81].y, _788);
    float _824 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[82].w, _794);
    float _826 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _828 = _786 + _826;
    float _830 = fma(_820, _770, _808);
    float _832 = fma(_818, -2.0, _816);
    float _834 = -_822;
    float _836 = fma(_824, _810, _834);
    float _838 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[28].z, _814);
    float _840 = in.m_55.x;
    float _842 = in.m_55.y;
    float _844 = in.m_55.z;
    float _846 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _848 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[86].y, _832);
    float _850 = _792 * _792;
    bool _852 = _838 >= 0.0;
    float _854 = _604 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _856 = fma(_126, (*spvDescriptorSet0.vp_c9)._m0[87].w, _622);
    float _858 = fma(_782, _782, _850);
    float _860 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].x, _796);
    float _862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _864 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].y, _798);
    float _866 = fma(_828, _828, _858);
    float _868 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[109].z, _800);
    float _870 = _830 + 0.5;
    float _872 = _812 + 0.5;
    float _874 = _836 + 0.5;
    float _876 = -_848;
    float _878 = fma(_856, _648, _876);
    float _880 = _820;
    if (_852)
    {
        _880 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _882 = _880;
    float _884 = _510 * _846;
    float _886 = rsqrt(_866);
    int _888 = as_type<int>(_882);
    if (_852)
    {
        float _890 = _882 * 5.0;
        _888 = as_type<int>(_890);
    }
    int _892 = _888;
    float _894 = _840 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _896 = _854 * _862;
    if (_852)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3250 = as_type<float>(_892);
        out.gl_Position.z = _3250;
    }
    float _898 = _364 * _894;
    float _900 = _878 + 0.5;
    out.m_63.x = _884;
    out.m_63.y = _896;
    out.m_63.z = _872;
    out.m_63.w = _874;
    out.m_65.x = _870;
    out.m_65.y = _900;
    float _902 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _904 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _906 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _908 = _898 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _910 = _902 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _912 = _904 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _914 = _860 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _916 = _864 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _918 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _920 = _906 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _922 = _908 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _924 = _914 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _926 = _916 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _928 = _918 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _930 = _922 * _886;
    out.m_67.x = _912;
    out.m_67.y = _920;
    out.m_67.z = _910;
    float _932 = _782 * _930;
    if (_852)
    {
        out.m_47.x = 0.0;
    }
    float _934 = _792 * _930;
    out.m_69.x = _924;
    out.m_69.y = _926;
    out.m_69.z = _928;
    if (_852)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _936 = -_934;
    float _938 = _684 + _936;
    float _940 = _828 * _930;
    float _942 = -_932;
    float _944 = _750 + _942;
    float _946 = -_934;
    float _948 = _792 + _946;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _952 = _938 + _950;
    float _954 = -_940;
    float _956 = _786 + _954;
    float _958 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _960 = _944 + _958;
    float _962 = _948 * _948;
    float _964 = _952 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _956 + _966;
    float _970 = -_932;
    float _972 = _782 + _970;
    float _974 = fma(_960, (*spvDescriptorSet0.vp_c8)._m0[28].x, _964);
    float _976 = fma(_972, _972, _962);
    float _978 = -_940;
    float _980 = _828 + _978;
    float _982 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _974);
    bool _984 = _982 >= 0.0;
    int _986 = as_type<int>(_948);
    float _988 = _952;
    float _990 = _938;
    if (_984)
    {
        _774 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _992 = _774;
    if (_984)
    {
        out.m_47.x = 0.0;
    }
    if (_984)
    {
        float _994 = _992 * 5.0;
        _986 = as_type<int>(_994);
    }
    int _996 = _986;
    if (_984)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3461 = as_type<float>(_996);
        out.gl_Position.z = _3461;
    }
    if (_984)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _998 = fma(_980, _980, _976);
    float _1000 = in.m_71.x;
    float _1002 = in.m_71.y;
    float _1004 = in.m_71.z;
    float _1006 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1008 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _1006;
    float _1010 = _844 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _1012 = sqrt(_998);
    float _1014 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1016 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _1014;
    float _1018 = _1008 * _1008;
    float _1020 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1022 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _1020;
    float _1024 = _364 * _1010;
    float _1026 = fma(_1016, _1016, _1018);
    float _1028 = _842 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1030 = _1024 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = fma(_1022, _1022, _1026);
    float _1034 = _364 * _1028;
    float _1036 = _1034 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1038 = sqrt(_1032);
    float _1040 = _886 * _1012;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1002);
    float _1044 = _1040 * _1036;
    float _1046 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1048 = _908 * _1040;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1004);
    float _1052 = _1042 * _1044;
    float _1054 = _1046 * _1048;
    float _1056 = _1040 * _1030;
    float _1058 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1060 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1062 = fma(_1038, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _1064 = _1050 * _1056;
    float _1066 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1058);
    float _1068 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1060);
    float _1070 = precise::max(_1062, 1.0);
    float _1072 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1066);
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1068);
    float _1076 = precise::min(_1070, 1.89999997615814208984375);
    float _1078 = _1072 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1080 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1082 = fma(_1078, _1076, _750);
    float _1084 = fma(_1080, _1076, _786);
    float _1086 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1090 = _1082 + _1088;
    float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1094 = _1084 + _1092;
    float _1096 = fma(_1054, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1086);
    float _1098 = _1090 * _1090;
    float _1100 = _1094 * _1094;
    float _1102 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1096);
    float _1104 = _1098 + _1100;
    float _1106 = _1102 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1108 = sqrt(_1104);
    float _1110 = fma(_1106, _1076, _684);
    bool _1112 = _1108 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1114 = _1102;
    float _1116 = _1064;
    float _1118 = _1106;
    float _1120 = _1052;
    float _1122 = _1084;
    if (!_1112)
    {
        _1114 = _1084;
    }
    float _1124 = _1114;
    float _1126 = _1124;
    if (!_1112)
    {
        _1116 = _1100;
    }
    float _1128 = _1116;
    float _1130 = _1128;
    if (!_1112)
    {
        _1118 = _1098;
    }
    float _1132 = _1118;
    float _1134 = _1132;
    if (!_1112)
    {
        _1120 = _1082;
    }
    float _1136 = _1120;
    float _1138 = _1136;
    if (!_1112)
    {
        _1122 = _1110;
    }
    float _1140 = _1122;
    bool _1142 = !_1112;
    float _1144 = _1140;
    if (!_1142)
    {
        float _1146 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1150 = _1108 + _1148;
        float _1152 = rsqrt(_1104);
        float _1154 = _1150 * _1146;
        float _1156 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1158 = _1154 * 0.15915493667125701904296875;
        float _1160 = _1158 * 6.283185482025146484375;
        float _1162 = sin(_1160);
        float _1164 = _1158 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = fma(_1162, _1156, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1170 = _1152 * _1168;
        float _1172 = _1166 + (-1.0);
        float _1174 = fma(_1090, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1176 = fma(_1094, _1170, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1178 = _1172 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1182 = _1174 + _1180;
        float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1186 = _1176 + _1184;
        float _1188 = fma(_1110, _1166, _1178);
        float _1190 = _1182 * _1182;
        float _1192 = _1186 * _1186;
        _1144 = _1188;
        _1134 = _1190;
        _1130 = _1192;
        _1126 = _1176;
        _1138 = _1174;
    }
    float _1194 = _1144;
    float _1196 = _1134;
    float _1198 = _1130;
    float _1200 = _1126;
    float _1202 = _1138;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1206 = _1194 + _1204;
    out.m_69.x = _924;
    out.m_69.y = _926;
    out.m_69.z = _928;
    float _1208 = fma(_1206, _1206, _1196);
    out.m_67.x = _912;
    out.m_67.y = _920;
    out.m_67.z = _910;
    float _1210 = _1208 + _1198;
    float _1212 = sqrt(_1210);
    bool _1214 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1216 = isnan(_1212);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1222 = _1218 || _1220;
    float _1224 = _1196;
    if (!_1222)
    {
        _1224 = 1.0;
    }
    float _1226 = _1224;
    bool _1228 = !_1222;
    float _1230 = _1226;
    if (!_1228)
    {
        bool _1232 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1234 = isnan(_1212);
        bool _1236 = _1232 || _1234;
        bool _1238 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1240 = _1236 || _1238;
        if (!_1240)
        {
            float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1244 = _1212 + _1242;
            float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1248 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1246;
            float _1250 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1252 = _1250 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1254 = 1.0 / _1248;
            float _1256 = _1244 * _1254;
            float _1258 = fma(_1256, _1252, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1230 = _1258;
            _1260 = true;
        }
        else
        {
            bool _1262 = _1212 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1264 = isnan(_1212);
            bool _1266 = _1262 || _1264;
            bool _1268 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1270 = _1266 || _1268;
            if (!_1270)
            {
                float _1272 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1274 = _1212 + _1272;
                float _1276 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1278 = _1276 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1280 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1282 = _1280 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1284 = 1.0 / _1278;
                float _1286 = _1274 * _1284;
                float _1288 = fma(_1286, _1282, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1230 = _1288;
                _1260 = true;
            }
            else
            {
                _1230 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1260 = false;
    float _1290 = _1230;
    float _1292 = _938 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1294 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1296 = _1200 + _1294;
    float _1298 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1300 = _1202 + _1298;
    float _1302 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1292);
    float _1304 = _938 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1306 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1308 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1310 = _1306 || _1308;
    bool _1312 = isnan(0.5);
    bool _1314 = _1310 || _1312;
    float _1316 = fma(_1296, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1318 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1302);
    float _1320 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1304);
    float _1322 = fma(_1300, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1324 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1326 = _1194 + _1324;
    float _1328 = _1318 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1330 = fma(_956, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1320);
    float _1332 = -_932;
    float _1334 = _1332 + _1322;
    float _1336 = 1.0 / _1328;
    float _1338 = _1330 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1340 = fma(_1326, _1290, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    bool _1342 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1344 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1346 = _1342 || _1344;
    bool _1348 = isnan(0.5);
    bool _1350 = _1346 || _1348;
    float _1352 = -_940;
    float _1354 = _1352 + _1316;
    float _1356 = _1338 + _1328;
    float _1358 = -_934;
    float _1360 = _1358 + _1340;
    float _1362 = _1338;
    float _1364 = _1360;
    float _1366 = _1354;
    float _1368 = _1328;
    if (_1314)
    {
        _1362 = _1334;
    }
    float _1370 = _1362;
    float _1372 = _1370;
    if (!_1314)
    {
        float _1374 = _952 * _952;
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1378 = -_786;
        float _1380 = _1378 + _1316;
        float _1382 = fma(_960, _960, _1374);
        float _1384 = fma(_968, _968, _1382);
        float _1386 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1388 = sqrt(_1384);
        float _1390 = 1.0 / _1040;
        float _1392 = precise::min(_1388, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1394 = _1392 * _1376;
        float _1396 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1398 = -_684;
        float _1400 = _1398 + _1340;
        float _1402 = _1394 * _1390;
        float _1404 = -_750;
        float _1406 = _1404 + _1322;
        float _1408 = _1396 * _1402;
        float _1410 = _1380 * _1402;
        float _1412 = fma(_1406, _1408, _944);
        float _1414 = fma(_1400, _1408, _938);
        float _1416 = fma(_1396, _1410, _956);
        _1364 = _1414;
        _1372 = _1412;
        _1366 = _1416;
        _1368 = _1402;
        _988 = _1374;
    }
    float _1418 = _1364;
    float _1420 = _1372;
    float _1422 = _1366;
    float _1424 = _1368;
    float _1426 = _988;
    float _1428 = _1424;
    float _1430 = _1426;
    if (_1350)
    {
        _990 = 1.0;
    }
    float _1432 = _990;
    float _1434 = _1356 * _1336;
    float _1436 = _1434 * 0.5;
    float _1438 = _1432;
    float _1440 = _1436;
    if (!_1350)
    {
        float _1442 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1444 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1446 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1444);
        float _1448 = _1442 * 0.15915493667125701904296875;
        float _1450 = _1448 * 6.283185482025146484375;
        float _1452 = cos(_1450);
        float _1454 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1456 = _1454 * 0.15915493667125701904296875;
        float _1458 = _1448 * 6.283185482025146484375;
        float _1460 = sin(_1458);
        float _1462 = 1.0 / _1452;
        float _1464 = _1456 * 6.283185482025146484375;
        float _1466 = cos(_1464);
        float _1468 = _1460 * _1462;
        float _1470 = 1.0 / _1446;
        float _1472 = _1466 * _1468;
        float _1474 = _1456 * 6.283185482025146484375;
        float _1476 = sin(_1474);
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1478;
        float _1482 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1484 = _1470 * _1482;
        float _1486 = 1.0 / _1472;
        float _1488 = 1.0 / _1480;
        float _1490 = _1476 * _1486;
        float _1492 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1494 = fma(_1490, _1484, _1492);
        float _1496 = _1494 * _1488;
        float _1498 = precise::clamp(_1496, 0.0, 1.0);
        _1428 = _1488;
        _1438 = _1498;
    }
    float _1500 = _1428;
    float _1502 = _1438;
    float _1504 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1506 = _1418 + _1504;
    float _1508 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1510 = _1420 + _1508;
    float _1512 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1514 = _1422 + _1512;
    float _1516 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1518 = _1506 * _1506;
    float _1520 = fma(_1510, _1510, _1518);
    float _1522 = fma(_1514, _1514, _1520);
    float _1524 = rsqrt(_1522);
    float _1526 = _1524 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1528 = _1510 * _1526;
    float _1530 = _1514 * _1526;
    float _1532 = _1528 * _1528;
    float _1534 = _1530 * _1530;
    float _1536 = _1532 + _1534;
    float _1538 = sqrt(_1536);
    bool _1540 = _1538 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1542 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1544 = _1538 + _1542;
    float _1546 = _1524;
    float _1548 = _1500;
    float _1550 = _1544;
    float _1552 = _1506;
    float _1554 = _1528;
    if (_1540)
    {
        float _1556 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1546 = _1556;
    }
    float _1558 = _1546;
    if (_1540)
    {
        float _1560 = rsqrt(_1536);
        _1548 = _1560;
    }
    float _1562 = _1548;
    float _1564 = _1562;
    if (_1540)
    {
        float _1566 = _1544 * _1558;
        _1550 = _1566;
    }
    float _1568 = _1550;
    if (_1540)
    {
        float _1570 = _1568 * 0.15915493667125701904296875;
        _1440 = _1570;
    }
    float _1572 = _1440;
    float _1574 = precise::max(0.0, _1516);
    float _1576 = _1514;
    float _1578 = _1574;
    if (_1540)
    {
        float _1580 = _1572 * 6.283185482025146484375;
        float _1582 = sin(_1580);
        _1576 = _1582;
    }
    float _1584 = _1576;
    float _1586 = -_1526;
    float _1588 = -_1574;
    float _1590 = fma(_1506, _1586, _1588);
    if (_1540)
    {
        float _1592 = _1590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1552 = _1592;
    }
    float _1594 = _1552;
    float _1596 = _1558;
    float _1598 = _1594;
    if (_1540)
    {
        float _1600 = _1572 * 6.283185482025146484375;
        float _1602 = cos(_1600);
        _1596 = _1602;
    }
    float _1604 = _1596;
    float _1606 = _1584;
    if (_1540)
    {
        float _1608 = fma(_1584, _1594, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1598 = _1608;
    }
    float _1610 = _1598;
    float _1612 = sqrt(_1522);
    float _1614 = _1610;
    if (!_1540)
    {
        _1606 = _1530;
    }
    float _1616 = _1606;
    float _1618 = _1616;
    if (_1540)
    {
        float _1620 = _1562 * _1610;
        _1430 = _1620;
    }
    float _1622 = _1430;
    if (!_1540)
    {
        _1564 = _1590;
    }
    float _1624 = _1564;
    float _1626 = _1624;
    if (!_1540)
    {
        _1614 = _1532;
    }
    float _1628 = _1614;
    float _1630 = _1628;
    if (_1540)
    {
        float _1632 = _1604 + (-1.0);
        _1578 = _1632;
    }
    float _1634 = _1578;
    float _1636 = _1634;
    if (_1540)
    {
        float _1638 = _1528 * _1622;
        _1554 = _1638;
    }
    float _1640 = _1554;
    if (_1540)
    {
        float _1642 = _1530 * _1622;
        _1618 = _1642;
    }
    float _1644 = _1618;
    if (_1540)
    {
        float _1646 = _1634 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1636 = _1646;
    }
    float _1648 = _1636;
    float _1650 = _1648;
    if (_1540)
    {
        float _1652 = _1640 * _1640;
        _1630 = _1652;
    }
    float _1654 = _1630;
    if (_1540)
    {
        float _1656 = fma(_1590, _1604, _1648);
        _1626 = _1656;
    }
    float _1658 = _1626;
    if (!_1540)
    {
        _1650 = _1534;
    }
    float _1660 = _1650;
    float _1662 = _1660;
    if (_1540)
    {
        float _1664 = _1644 * _1644;
        _1662 = _1664;
    }
    float _1666 = _1662;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1670 = fma(_1612, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1668);
    float _1672 = precise::clamp(_1670, 0.0, 1.0);
    float _1674 = fma(_1658, _1658, _1654);
    float _1676 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1678 = -_1672;
    float _1680 = _1678 + 1.0;
    float _1682 = _1674 + _1666;
    float _1684 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1686 = rsqrt(_1682);
    float _1688 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1684);
    float _1690 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1692 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1688);
    float _1694 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1696 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1690);
    float _1698 = _1418 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1700 = _1692 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1702 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1694);
    float _1704 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1696);
    float _1706 = fma(_1420, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1698);
    float _1708 = _1700 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1710 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1702);
    float _1712 = _1704 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1714 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1706);
    float _1716 = -_1708;
    float _1718 = fma(_1716, _1676, 1.0);
    float _1720 = _1710 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1722 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1724 = _1714 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1726 = _1686 * _1640;
    float _1728 = abs(_1680);
    float _1730 = log2(_1728);
    float _1732 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1722);
    float _1734 = _1686 * _1658;
    float _1736 = _1686 * _1644;
    float _1738 = log2(_1718);
    float _1740 = _1726 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1742 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1732);
    float _1744 = -_1740;
    float _1746 = fma(_1734, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1744);
    float _1748 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1742);
    float _1750 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1752 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1754 = -_1736;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1746);
    float _1758 = 1.0 / _1748;
    float _1760 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1762 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1750);
    float _1764 = fma(_1756, -0.5, 0.5);
    float _1766 = fma(_1756, 0.5, 0.5);
    float _1768 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1760);
    float _1770 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1762);
    float _1772 = _1738 * 0.693147182464599609375;
    float _1774 = exp2(_1752);
    float _1776 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1768);
    float _1778 = fma(_1766, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1780 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1770);
    float _1782 = _1772 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1784 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1776);
    float _1786 = fma(_1766, _1778, -0.212114393711090087890625);
    float _1788 = sqrt(_1764);
    float _1790 = _1734 + 1.0;
    float _1792 = _1780 * _1758;
    float _1794 = _1784 * _1758;
    float _1796 = fma(_1766, _1786, 1.570728778839111328125);
    float _1798 = fma(_1792, 0.5, 0.5);
    float _1800 = fma(_1794, -0.5, 0.5);
    float _1802 = -_1734;
    float _1804 = fma(_1774, _1790, _1802);
    float _1806 = fma(_1804, 0.5, 0.5);
    float _1808 = _1788 * 0.636619746685028076171875;
    float3 _4783 = float3(_1798, _1800, _1782);
    float _1810 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4783, float3(0.0), isnan(_4783)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4783, float3(0.0), isnan(_4783)), level(0.0)).x;
    float3 _4794 = float3(_1798, _1800, _1782);
    float4 _1813 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4794, float3(0.0), isnan(_4794)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4794, float3(0.0), isnan(_4794)), level(0.0)).xyzw;
    float _1815 = _1813.x;
    float _1817 = _1813.y;
    float _1819 = _1813.z;
    float _1821 = _1813.w;
    float _1823 = -_1796;
    float _1825 = fma(_1808, _1823, 1.0);
    float2 _4816 = float2(_1825, _1806);
    float3 _1829 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4816, float2(0.0), isnan(_4816)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4816, float2(0.0), isnan(_4816)), level(0.0)).xyz;
    float _1831 = _1829.x;
    float _1833 = _1829.y;
    float _1835 = _1829.z;
    float _1837 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1839 = _1712 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1841 = _1502 > 0.0;
    bool _1843 = isnan(_1502);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(0.0);
    bool _1849 = _1845 || _1847;
    float _1851 = _1502 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1853 = fma(_1720, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1839);
    float _1855 = exp2(_1837);
    float _1857 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1853);
    float _1859 = fma(_1724, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1857);
    float _1861 = _1859 + _1748;
    out.gl_Position.x = _1780;
    out.gl_Position.y = _1784;
    out.gl_Position.z = _1859;
    out.gl_Position.w = _1748;
    float _1863 = _1861 * 0.5;
    float _1865 = -_1855;
    float _1867 = _1865 + 1.0;
    float _1869 = _1851 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1871 = _1867 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.z = _1863;
    out.m_73.w = _1748;
    out.m_47.x = _1869;
    float _1873 = _1871 * _1810;
    float _1875 = -_1871;
    float _1877 = _1875 + 1.0;
    float _1879 = _1821 * _1873;
    float _1881 = _1821 * _1877;
    float _1883 = _1835 * _1873;
    float _1885 = fma(_1831, _1879, _1815);
    float _1887 = fma(_1833, _1879, _1817);
    float _1889 = fma(_1821, _1883, _1819);
    out.m_75.x = _1885;
    out.m_75.y = _1887;
    out.m_75.z = _1889;
    out.m_75.w = _1881;
    if (_1849)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1891 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1891;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

