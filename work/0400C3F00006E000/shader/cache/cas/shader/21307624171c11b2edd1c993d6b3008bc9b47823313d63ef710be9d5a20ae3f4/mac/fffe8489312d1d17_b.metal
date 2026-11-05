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
    float4 m_57 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_63 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1124 = false;
    bool _644 = false;
    bool _464 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1612 = as_type<float>(_112);
        out.gl_Position.z = _1612;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_49.w;
    float _118 = in.m_51.z;
    float _120 = in.m_51.w;
    bool _122 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_116);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_116;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.z = _118;
    out.m_53.w = _120;
    if (_130)
    {
        float _136 = float(_96);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _114 = as_type<int>(_150);
    }
    int _152 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1689 = as_type<float>(_152);
        out.gl_Position.z = _1689;
    }
    if (_144)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_55.w;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_51.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_96);
        float _300 = 1.0 / _298;
        float _302 = _134 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _362;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = _324 * _376;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _426 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _428);
    float _436 = fma(_426, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].z, _436);
    bool _444 = !_374;
    float _462;
    if (!_444)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_96);
        float _468 = 1.0 / _466;
        float _470 = _134 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _472 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _484 = isnan(_472);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _502 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = isnan(_472);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _480;
    float _516 = -_492;
    float _518 = _516 + 1.0;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_472);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _512 * _518;
    float _538 = -_512;
    float _540 = _538 + 1.0;
    bool _542 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _544 = 1.0 / _496;
    float _546 = _534 * _540;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / _500;
    float _554 = _522 * _514;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _560 = fma(_554, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = _558 * _544;
    bool _564 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = isnan(_472);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _472 + _580;
    float _584 = _560 * _546;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _472 + _586;
    float _590 = -_574;
    float _592 = _590 + 1.0;
    float _594 = fma(_562, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = _578 * _552;
    float _598 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _584);
    float _600 = _492 * _592;
    float _602 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = fma(_596, _588, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = fma(_594, _536, _598);
    float _608 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = fma(_604, _600, _606);
    float _614 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[118].x, _612);
    float _620 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _610;
    out.m_57.y = _620;
    out.m_57.z = _616;
    out.m_57.w = _622;
    bool _624 = !_542;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_96);
        float _648 = 1.0 / _646;
        float _650 = _134 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = in.m_55.x;
    float _656 = in.m_55.y;
    float _658 = in.m_55.z;
    float _660 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _664 = in.m_59.x;
    float _666 = in.m_59.y;
    float _668 = in.m_59.z;
    float _670 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _680 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _682 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _662);
    float _684 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _670);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _688 = _652 + _686;
    float _690 = 1.0 / _674;
    float _692 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _680);
    float _694 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _696 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _700 = _652 + _698;
    float _702 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _704 = 1.0 / _678;
    float _706 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _708 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _710 = _658 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _712 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _714 = isnan(_652);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _688 * _690;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _728 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _732 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _728 * _726;
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    float _740 = _700 * _704;
    float _742 = _732 * _730;
    float _744 = _736 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _746 = _736 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _748 = _734 * _738;
    bool _750 = _666 != 0.0;
    bool _752 = isnan(_666);
    bool _754 = _750 || _752;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _744);
    float _762 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _746);
    float _764 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[24].z, _760);
    float _770 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[26].z, _762);
    bool _772 = _664 == 0.0;
    bool _774 = !_758;
    bool _776 = _772 && _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _778;
    float _782 = _768 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _784 = _770 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _786 = _668 == 0.0;
    bool _788 = _786 && _776;
    float _790 = in.m_61.x;
    float _792 = in.m_61.y;
    float _794 = in.m_61.z;
    float _796 = _764 + _782;
    float _798 = _766 + _784;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _804;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _810 = _796 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _814 = _798 + _812;
    float _816 = fma(_802, _724, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _822 = _810 * _810;
    float _824 = _814 * _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _830 = _736 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _832 = fma(_806, _724, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _834 = _822 + _824;
    bool _836 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _838 = isnan(_652);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _830);
    bool _850 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_652);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = sqrt(_834);
    float _864 = -_722;
    float _866 = _864 + 1.0;
    float _868 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[25].z, _848);
    float _870 = fma(_780, _724, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    float _880 = _792;
    float _882 = _794;
    float _884 = _790;
    float _886 = _846;
    if (!_788)
    {
        float _888 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _792);
        _880 = _888;
    }
    float _890 = _880;
    if (!_788)
    {
        float _892 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _794);
        _882 = _892;
    }
    float _894 = _882;
    float _896 = _860 * _866;
    float _898 = _868 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _900 = _896;
    float _902 = _898;
    if (!_788)
    {
        float _904 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _790);
        _884 = _904;
    }
    float _906 = _884;
    float _908 = -_860;
    float _910 = _908 + 1.0;
    float _912 = _832 * _896;
    float _914 = _816 * _896;
    float _916 = _870 * _896;
    float _918 = _702 + _898;
    bool _920 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].x, _912);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].y, _914);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].z, _916);
    float _928 = fma(_820, _740, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _930 = fma(_874, _740, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _932 = fma(_828, _740, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _934 = _722 * _878;
    float _936 = _912;
    float _938 = _910;
    float _940 = _914;
    if (!_920)
    {
        _936 = _824;
    }
    float _942 = _936;
    float _944 = _942;
    if (!_920)
    {
        _938 = _822;
    }
    float _946 = _938;
    float _948 = _946;
    if (!_920)
    {
        _900 = _796;
    }
    float _950 = _900;
    float _952 = _950;
    if (!_920)
    {
        _940 = _798;
    }
    float _954 = _940;
    float _956 = _954;
    if (!_920)
    {
        _902 = _918;
    }
    float _958 = _902;
    bool _960 = !_920;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _862 + _966;
        float _970 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_834);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = sin(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = cos(_982);
        float _986 = fma(_980, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _988 = _972 * _986;
        float _990 = _984 + (-1.0);
        float _992 = fma(_810, _988, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _994 = fma(_814, _988, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _996 = _990 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1000 = _992 + _998;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1004 = _994 + _1002;
        float _1006 = fma(_918, _984, _996);
        float _1008 = _1000 * _1000;
        float _1010 = _1004 * _1004;
        _962 = _1006;
        _948 = _1008;
        _944 = _1010;
        _952 = _992;
        _956 = _994;
    }
    float _1012 = _962;
    float _1014 = _948;
    float _1016 = _944;
    float _1018 = _952;
    float _1020 = _956;
    float _1022 = in.m_63.w;
    float _1024 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1026 = _1012 + _1024;
    float _1028 = fma(_928, _934, _922);
    float _1030 = fma(_930, _934, _924);
    float _1032 = fma(_932, _934, _926);
    float _1034 = fma(_1026, _1026, _1014);
    float _1036 = _890 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1038 = _890 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1040 = _890 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1042 = _1034 + _1016;
    float _1044 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1028);
    float _1046 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1030);
    float _1048 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1032);
    float _1050 = sqrt(_1042);
    float _1052 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1036);
    float _1054 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1038);
    float _1056 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1040);
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1062 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1064 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1052);
    float _1066 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1054);
    float _1068 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1056);
    float _1070 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.w = _1022;
    bool _1076 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1078 = isnan(_1050);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1084 = _1080 || _1082;
    out.m_67.x = _1064;
    out.m_67.y = _1066;
    out.m_67.z = _1068;
    out.m_69.x = _1070;
    out.m_69.y = _1072;
    out.m_69.z = _1074;
    float _1086 = _1062;
    float _1088 = _1026;
    if (!_1084)
    {
        _886 = 1.0;
    }
    float _1090 = _886;
    bool _1092 = !_1084;
    float _1094 = _1090;
    if (!_1092)
    {
        bool _1096 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1098 = isnan(_1050);
        bool _1100 = _1096 || _1098;
        bool _1102 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1104 = _1100 || _1102;
        if (!_1104)
        {
            float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1108 = _1050 + _1106;
            float _1110 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1112 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1110;
            float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1116 = _1114 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1118 = 1.0 / _1112;
            float _1120 = _1108 * _1118;
            float _1122 = fma(_1120, _1116, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1094 = _1122;
            _1124 = true;
        }
        else
        {
            bool _1126 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1128 = isnan(_1050);
            bool _1130 = _1126 || _1128;
            bool _1132 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1134 = _1130 || _1132;
            if (!_1134)
            {
                float _1136 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1138 = _1050 + _1136;
                float _1140 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1142 = _1140 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1144 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1146 = _1144 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1148 = 1.0 / _1142;
                float _1150 = _1138 * _1148;
                float _1152 = fma(_1150, _1146, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1094 = _1152;
                _1124 = true;
            }
            else
            {
                _1094 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1124 = false;
    float _1154 = _1094;
    float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1158 = _1012 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1162 = _1018 + _1160;
    float _1164 = fma(_1158, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1168 = _1020 + _1166;
    float _1170 = fma(_1162, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1164 + _1172;
    float _1176 = fma(_1168, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1170 + _1178;
    float _1182 = _1174 * _1174;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1186 = _1176 + _1184;
    float _1188 = fma(_1180, _1180, _1182);
    float _1190 = fma(_1186, _1186, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1180 * _1194;
    float _1198 = _1186 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1186;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1196;
    if (_1208)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1222;
    }
    float _1224 = _1214;
    if (_1208)
    {
        float _1226 = rsqrt(_1204);
        _1216 = _1226;
    }
    float _1228 = _1216;
    float _1230 = _1228;
    if (_1208)
    {
        float _1232 = _1212 * _1224;
        _1218 = _1232;
    }
    float _1234 = _1218;
    if (_1208)
    {
        float _1236 = _1234 * 0.15915493667125701904296875;
        _1086 = _1236;
    }
    float _1238 = _1086;
    float _1240 = _1192;
    float _1242 = _1238;
    if (_1208)
    {
        float _1244 = _1238 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1240 = _1246;
    }
    float _1248 = _1240;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _930;
    float _1256 = _1252;
    float _1258 = _1250;
    if (_1208)
    {
        float _1260 = _1238 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        _1254 = _1262;
    }
    float _1264 = _1254;
    float _1266 = -_1194;
    float _1268 = -_1252;
    float _1270 = fma(_1174, _1266, _1268);
    if (_1208)
    {
        float _1272 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1272;
    }
    float _1274 = _1256;
    float _1276 = sqrt(_1190);
    float _1278 = _1248;
    float _1280 = _1274;
    if (_1208)
    {
        float _1282 = fma(_1248, _1274, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1278 = _1282;
    }
    float _1284 = _1278;
    float _1286 = _1284;
    if (!_1208)
    {
        _1280 = _1198;
    }
    float _1288 = _1280;
    float _1290 = _1288;
    if (_1208)
    {
        float _1292 = _1264 + (-1.0);
        _1258 = _1292;
    }
    float _1294 = _1258;
    float _1296 = _1294;
    if (_1208)
    {
        float _1298 = _1228 * _1284;
        _1088 = _1298;
    }
    float _1300 = _1088;
    if (!_1208)
    {
        _1286 = _1270;
    }
    float _1302 = _1286;
    float _1304 = _1302;
    if (_1208)
    {
        float _1306 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1306;
    }
    float _1308 = _1242;
    if (_1208)
    {
        float _1310 = _1196 * _1300;
        _1220 = _1310;
    }
    float _1312 = _1220;
    if (!_1208)
    {
        _1230 = _1200;
    }
    float _1314 = _1230;
    float _1316 = _1314;
    if (_1208)
    {
        float _1318 = _1198 * _1300;
        _1290 = _1318;
    }
    float _1320 = _1290;
    if (_1208)
    {
        float _1322 = fma(_1270, _1264, _1308);
        _1304 = _1322;
    }
    float _1324 = _1304;
    if (_1208)
    {
        float _1326 = _1312 * _1312;
        _1316 = _1326;
    }
    float _1328 = _1316;
    if (!_1208)
    {
        _1296 = _1202;
    }
    float _1330 = _1296;
    float _1332 = _1330;
    if (_1208)
    {
        float _1334 = _1320 * _1320;
        _1332 = _1334;
    }
    float _1336 = _1332;
    float _1338 = fma(_1324, _1324, _1328);
    float _1340 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1342 = _1338 + _1336;
    float _1344 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1276, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    float _1352 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1340);
    float _1354 = rsqrt(_1342);
    float _1356 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1344);
    float _1358 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1360 = -_1350;
    float _1362 = _1360 + 1.0;
    float _1364 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1366 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1356);
    float _1368 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1358);
    float _1370 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1372 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1364);
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1368);
    float _1378 = abs(_1362);
    float _1380 = log2(_1378);
    float _1382 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1388 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1352);
    float _1390 = _1354 * _1312;
    float _1392 = -_1384;
    float _1394 = fma(_1392, _1370, 1.0);
    float _1396 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1400 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1402 = _1354 * _1324;
    float _1404 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1398);
    float _1408 = _1354 * _1320;
    float _1410 = log2(_1394);
    float _1412 = -_1404;
    float _1414 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1412);
    float _1416 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1418 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1406);
    float _1420 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1422 = -_1408;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1414);
    float _1426 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1428 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1418);
    float _1430 = exp2(_1416);
    float _1432 = fma(_1424, -0.5, 0.5);
    float _1434 = fma(_1424, 0.5, 0.5);
    float _1436 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1426);
    float _1438 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1420);
    float _1440 = _1402 + 1.0;
    float _1442 = fma(_1434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1444 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = 1.0 / _1428;
    float _1448 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1438);
    float _1450 = _1410 * 0.693147182464599609375;
    float _1452 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1454 = sqrt(_1432);
    float _1456 = -_1402;
    float _1458 = fma(_1430, _1440, _1456);
    float _1460 = fma(_1434, _1442, -0.212114393711090087890625);
    float _1462 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1448);
    float _1464 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1466 = fma(_1458, 0.5, 0.5);
    float _1468 = fma(_1434, _1460, 1.570728778839111328125);
    float _1470 = _1452 * _1446;
    float _1472 = _1462 * _1446;
    float _1474 = fma(_1470, 0.5, 0.5);
    float _1476 = fma(_1472, -0.5, 0.5);
    float _1478 = _1454 * 0.636619746685028076171875;
    float3 _3897 = float3(_1474, _1476, _1464);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3897, float3(0.0), isnan(_3897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3897, float3(0.0), isnan(_3897)), level(0.0)).x;
    float3 _3908 = float3(_1474, _1476, _1464);
    float4 _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3908, float3(0.0), isnan(_3908)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3908, float3(0.0), isnan(_3908)), level(0.0)).xyzw;
    float _1485 = _1483.x;
    float _1487 = _1483.y;
    float _1489 = _1483.z;
    float _1491 = _1483.w;
    float _1493 = -_1468;
    float _1495 = fma(_1478, _1493, 1.0);
    float2 _3930 = float2(_1495, _1466);
    float3 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3930, float2(0.0), isnan(_3930)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3930, float2(0.0), isnan(_3930)), level(0.0)).xyz;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1509 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _764;
    out.m_71.y = _702;
    out.m_71.z = _766;
    float _1511 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1509);
    float _1513 = exp2(_1507);
    float _1515 = _1428 * 0.5;
    float _1517 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1511);
    float _1519 = _1452 + _1428;
    out.m_73.x = _1170;
    out.m_73.y = _1164;
    out.m_73.z = _1176;
    float _1521 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1517);
    float _1523 = _1519 * 0.5;
    float _1525 = fma(_1462, -0.5, _1515);
    float _1527 = _1521 + _1428;
    out.gl_Position.x = _1452;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1521;
    out.gl_Position.w = _1428;
    float _1529 = _1527 * 0.5;
    float _1531 = -_1513;
    float _1533 = _1531 + 1.0;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1523;
    out.m_75.y = _1525;
    out.m_75.z = _1529;
    out.m_75.w = _1428;
    float _1539 = -_1535;
    float _1541 = _1539 + 1.0;
    out.m_47.x = _1537;
    float _1543 = _1535 * _1480;
    float _1545 = _1491 * _1541;
    float _1547 = _1491 * _1543;
    float _1549 = _1505 * _1543;
    float _1551 = fma(_1501, _1547, _1485);
    float _1553 = fma(_1503, _1547, _1487);
    float _1555 = fma(_1491, _1549, _1489);
    out.m_77.x = _1551;
    out.m_77.y = _1553;
    out.m_77.z = _1555;
    out.m_77.w = _1545;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1124 = false;
    bool _644 = false;
    bool _464 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1612 = as_type<float>(_112);
        out.gl_Position.z = _1612;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_49.w;
    float _118 = in.m_51.z;
    float _120 = in.m_51.w;
    bool _122 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_116);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_116;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.z = _118;
    out.m_53.w = _120;
    if (_130)
    {
        float _136 = float(_96);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _114 = as_type<int>(_150);
    }
    int _152 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1689 = as_type<float>(_152);
        out.gl_Position.z = _1689;
    }
    if (_144)
    {
        return out;
    }
    float _154 = in.m_55.w;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_51.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_96);
        float _300 = 1.0 / _298;
        float _302 = _134 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _362;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = _324 * _376;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _426 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _428);
    float _436 = fma(_426, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].z, _436);
    bool _444 = !_374;
    float _462;
    if (!_444)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_96);
        float _468 = 1.0 / _466;
        float _470 = _134 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _472 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _484 = isnan(_472);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _502 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = isnan(_472);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _480;
    float _516 = -_492;
    float _518 = _516 + 1.0;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_472);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _512 * _518;
    float _538 = -_512;
    float _540 = _538 + 1.0;
    bool _542 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _544 = 1.0 / _496;
    float _546 = _534 * _540;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / _500;
    float _554 = _522 * _514;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _560 = fma(_554, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = _558 * _544;
    bool _564 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = isnan(_472);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _472 + _580;
    float _584 = _560 * _546;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _472 + _586;
    float _590 = -_574;
    float _592 = _590 + 1.0;
    float _594 = fma(_562, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = _578 * _552;
    float _598 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _584);
    float _600 = _492 * _592;
    float _602 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = fma(_596, _588, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = fma(_594, _536, _598);
    float _608 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = fma(_604, _600, _606);
    float _614 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[118].x, _612);
    float _620 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _610;
    out.m_57.y = _620;
    out.m_57.z = _616;
    out.m_57.w = _622;
    bool _624 = !_542;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_96);
        float _648 = 1.0 / _646;
        float _650 = _134 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = in.m_55.x;
    float _656 = in.m_55.y;
    float _658 = in.m_55.z;
    float _660 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _664 = in.m_59.x;
    float _666 = in.m_59.y;
    float _668 = in.m_59.z;
    float _670 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _680 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _682 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _662);
    float _684 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _670);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _688 = _652 + _686;
    float _690 = 1.0 / _674;
    float _692 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _680);
    float _694 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _696 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _700 = _652 + _698;
    float _702 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _704 = 1.0 / _678;
    float _706 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _708 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _710 = _658 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _712 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _714 = isnan(_652);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _688 * _690;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _728 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _732 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _728 * _726;
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    float _740 = _700 * _704;
    float _742 = _732 * _730;
    float _744 = _736 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _746 = _736 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _748 = _734 * _738;
    bool _750 = _666 != 0.0;
    bool _752 = isnan(_666);
    bool _754 = _750 || _752;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _744);
    float _762 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _746);
    float _764 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[24].z, _760);
    float _770 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[26].z, _762);
    bool _772 = _664 == 0.0;
    bool _774 = !_758;
    bool _776 = _772 && _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _778;
    float _782 = _768 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _784 = _770 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _786 = _668 == 0.0;
    bool _788 = _786 && _776;
    float _790 = in.m_61.x;
    float _792 = in.m_61.y;
    float _794 = in.m_61.z;
    float _796 = _764 + _782;
    float _798 = _766 + _784;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _804;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _810 = _796 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _814 = _798 + _812;
    float _816 = fma(_802, _724, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _822 = _810 * _810;
    float _824 = _814 * _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _830 = _736 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _832 = fma(_806, _724, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _834 = _822 + _824;
    bool _836 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _838 = isnan(_652);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _830);
    bool _850 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_652);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = sqrt(_834);
    float _864 = -_722;
    float _866 = _864 + 1.0;
    float _868 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[25].z, _848);
    float _870 = fma(_780, _724, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    float _880 = _792;
    float _882 = _794;
    float _884 = _790;
    float _886 = _846;
    if (!_788)
    {
        float _888 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _792);
        _880 = _888;
    }
    float _890 = _880;
    if (!_788)
    {
        float _892 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _794);
        _882 = _892;
    }
    float _894 = _882;
    float _896 = _860 * _866;
    float _898 = _868 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _900 = _896;
    float _902 = _898;
    if (!_788)
    {
        float _904 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _790);
        _884 = _904;
    }
    float _906 = _884;
    float _908 = -_860;
    float _910 = _908 + 1.0;
    float _912 = _832 * _896;
    float _914 = _816 * _896;
    float _916 = _870 * _896;
    float _918 = _702 + _898;
    bool _920 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].x, _912);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].y, _914);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].z, _916);
    float _928 = fma(_820, _740, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _930 = fma(_874, _740, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _932 = fma(_828, _740, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _934 = _722 * _878;
    float _936 = _912;
    float _938 = _910;
    float _940 = _914;
    if (!_920)
    {
        _936 = _824;
    }
    float _942 = _936;
    float _944 = _942;
    if (!_920)
    {
        _938 = _822;
    }
    float _946 = _938;
    float _948 = _946;
    if (!_920)
    {
        _900 = _796;
    }
    float _950 = _900;
    float _952 = _950;
    if (!_920)
    {
        _940 = _798;
    }
    float _954 = _940;
    float _956 = _954;
    if (!_920)
    {
        _902 = _918;
    }
    float _958 = _902;
    bool _960 = !_920;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _862 + _966;
        float _970 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_834);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = sin(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = cos(_982);
        float _986 = fma(_980, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _988 = _972 * _986;
        float _990 = _984 + (-1.0);
        float _992 = fma(_810, _988, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _994 = fma(_814, _988, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _996 = _990 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1000 = _992 + _998;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1004 = _994 + _1002;
        float _1006 = fma(_918, _984, _996);
        float _1008 = _1000 * _1000;
        float _1010 = _1004 * _1004;
        _962 = _1006;
        _948 = _1008;
        _944 = _1010;
        _952 = _992;
        _956 = _994;
    }
    float _1012 = _962;
    float _1014 = _948;
    float _1016 = _944;
    float _1018 = _952;
    float _1020 = _956;
    float _1022 = in.m_63.w;
    float _1024 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1026 = _1012 + _1024;
    float _1028 = fma(_928, _934, _922);
    float _1030 = fma(_930, _934, _924);
    float _1032 = fma(_932, _934, _926);
    float _1034 = fma(_1026, _1026, _1014);
    float _1036 = _890 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1038 = _890 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1040 = _890 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1042 = _1034 + _1016;
    float _1044 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1028);
    float _1046 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1030);
    float _1048 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1032);
    float _1050 = sqrt(_1042);
    float _1052 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1036);
    float _1054 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1038);
    float _1056 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1040);
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1062 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1064 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1052);
    float _1066 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1054);
    float _1068 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1056);
    float _1070 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.w = _1022;
    bool _1076 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1078 = isnan(_1050);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1084 = _1080 || _1082;
    out.m_67.x = _1064;
    out.m_67.y = _1066;
    out.m_67.z = _1068;
    out.m_69.x = _1070;
    out.m_69.y = _1072;
    out.m_69.z = _1074;
    float _1086 = _1062;
    float _1088 = _1026;
    if (!_1084)
    {
        _886 = 1.0;
    }
    float _1090 = _886;
    bool _1092 = !_1084;
    float _1094 = _1090;
    if (!_1092)
    {
        bool _1096 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1098 = isnan(_1050);
        bool _1100 = _1096 || _1098;
        bool _1102 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1104 = _1100 || _1102;
        if (!_1104)
        {
            float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1108 = _1050 + _1106;
            float _1110 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1112 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1110;
            float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1116 = _1114 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1118 = 1.0 / _1112;
            float _1120 = _1108 * _1118;
            float _1122 = fma(_1120, _1116, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1094 = _1122;
            _1124 = true;
        }
        else
        {
            bool _1126 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1128 = isnan(_1050);
            bool _1130 = _1126 || _1128;
            bool _1132 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1134 = _1130 || _1132;
            if (!_1134)
            {
                float _1136 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1138 = _1050 + _1136;
                float _1140 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1142 = _1140 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1144 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1146 = _1144 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1148 = 1.0 / _1142;
                float _1150 = _1138 * _1148;
                float _1152 = fma(_1150, _1146, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1094 = _1152;
                _1124 = true;
            }
            else
            {
                _1094 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1124 = false;
    float _1154 = _1094;
    float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1158 = _1012 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1162 = _1018 + _1160;
    float _1164 = fma(_1158, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1168 = _1020 + _1166;
    float _1170 = fma(_1162, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1164 + _1172;
    float _1176 = fma(_1168, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1170 + _1178;
    float _1182 = _1174 * _1174;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1186 = _1176 + _1184;
    float _1188 = fma(_1180, _1180, _1182);
    float _1190 = fma(_1186, _1186, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1180 * _1194;
    float _1198 = _1186 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1186;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1196;
    if (_1208)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1222;
    }
    float _1224 = _1214;
    if (_1208)
    {
        float _1226 = rsqrt(_1204);
        _1216 = _1226;
    }
    float _1228 = _1216;
    float _1230 = _1228;
    if (_1208)
    {
        float _1232 = _1212 * _1224;
        _1218 = _1232;
    }
    float _1234 = _1218;
    if (_1208)
    {
        float _1236 = _1234 * 0.15915493667125701904296875;
        _1086 = _1236;
    }
    float _1238 = _1086;
    float _1240 = _1192;
    float _1242 = _1238;
    if (_1208)
    {
        float _1244 = _1238 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1240 = _1246;
    }
    float _1248 = _1240;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _930;
    float _1256 = _1252;
    float _1258 = _1250;
    if (_1208)
    {
        float _1260 = _1238 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        _1254 = _1262;
    }
    float _1264 = _1254;
    float _1266 = -_1194;
    float _1268 = -_1252;
    float _1270 = fma(_1174, _1266, _1268);
    if (_1208)
    {
        float _1272 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1272;
    }
    float _1274 = _1256;
    float _1276 = sqrt(_1190);
    float _1278 = _1248;
    float _1280 = _1274;
    if (_1208)
    {
        float _1282 = fma(_1248, _1274, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1278 = _1282;
    }
    float _1284 = _1278;
    float _1286 = _1284;
    if (!_1208)
    {
        _1280 = _1198;
    }
    float _1288 = _1280;
    float _1290 = _1288;
    if (_1208)
    {
        float _1292 = _1264 + (-1.0);
        _1258 = _1292;
    }
    float _1294 = _1258;
    float _1296 = _1294;
    if (_1208)
    {
        float _1298 = _1228 * _1284;
        _1088 = _1298;
    }
    float _1300 = _1088;
    if (!_1208)
    {
        _1286 = _1270;
    }
    float _1302 = _1286;
    float _1304 = _1302;
    if (_1208)
    {
        float _1306 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1306;
    }
    float _1308 = _1242;
    if (_1208)
    {
        float _1310 = _1196 * _1300;
        _1220 = _1310;
    }
    float _1312 = _1220;
    if (!_1208)
    {
        _1230 = _1200;
    }
    float _1314 = _1230;
    float _1316 = _1314;
    if (_1208)
    {
        float _1318 = _1198 * _1300;
        _1290 = _1318;
    }
    float _1320 = _1290;
    if (_1208)
    {
        float _1322 = fma(_1270, _1264, _1308);
        _1304 = _1322;
    }
    float _1324 = _1304;
    if (_1208)
    {
        float _1326 = _1312 * _1312;
        _1316 = _1326;
    }
    float _1328 = _1316;
    if (!_1208)
    {
        _1296 = _1202;
    }
    float _1330 = _1296;
    float _1332 = _1330;
    if (_1208)
    {
        float _1334 = _1320 * _1320;
        _1332 = _1334;
    }
    float _1336 = _1332;
    float _1338 = fma(_1324, _1324, _1328);
    float _1340 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1342 = _1338 + _1336;
    float _1344 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1276, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    float _1352 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1340);
    float _1354 = rsqrt(_1342);
    float _1356 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1344);
    float _1358 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1360 = -_1350;
    float _1362 = _1360 + 1.0;
    float _1364 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1366 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1356);
    float _1368 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1358);
    float _1370 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1372 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1364);
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1368);
    float _1378 = abs(_1362);
    float _1380 = log2(_1378);
    float _1382 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1388 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1352);
    float _1390 = _1354 * _1312;
    float _1392 = -_1384;
    float _1394 = fma(_1392, _1370, 1.0);
    float _1396 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1400 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1402 = _1354 * _1324;
    float _1404 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1398);
    float _1408 = _1354 * _1320;
    float _1410 = log2(_1394);
    float _1412 = -_1404;
    float _1414 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1412);
    float _1416 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1418 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1406);
    float _1420 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1422 = -_1408;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1414);
    float _1426 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1428 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1418);
    float _1430 = exp2(_1416);
    float _1432 = fma(_1424, -0.5, 0.5);
    float _1434 = fma(_1424, 0.5, 0.5);
    float _1436 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1426);
    float _1438 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1420);
    float _1440 = _1402 + 1.0;
    float _1442 = fma(_1434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1444 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = 1.0 / _1428;
    float _1448 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1438);
    float _1450 = _1410 * 0.693147182464599609375;
    float _1452 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1454 = sqrt(_1432);
    float _1456 = -_1402;
    float _1458 = fma(_1430, _1440, _1456);
    float _1460 = fma(_1434, _1442, -0.212114393711090087890625);
    float _1462 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1448);
    float _1464 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1466 = fma(_1458, 0.5, 0.5);
    float _1468 = fma(_1434, _1460, 1.570728778839111328125);
    float _1470 = _1452 * _1446;
    float _1472 = _1462 * _1446;
    float _1474 = fma(_1470, 0.5, 0.5);
    float _1476 = fma(_1472, -0.5, 0.5);
    float _1478 = _1454 * 0.636619746685028076171875;
    float3 _3897 = float3(_1474, _1476, _1464);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3897, float3(0.0), isnan(_3897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3897, float3(0.0), isnan(_3897)), level(0.0)).x;
    float3 _3908 = float3(_1474, _1476, _1464);
    float4 _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3908, float3(0.0), isnan(_3908)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3908, float3(0.0), isnan(_3908)), level(0.0)).xyzw;
    float _1485 = _1483.x;
    float _1487 = _1483.y;
    float _1489 = _1483.z;
    float _1491 = _1483.w;
    float _1493 = -_1468;
    float _1495 = fma(_1478, _1493, 1.0);
    float2 _3930 = float2(_1495, _1466);
    float3 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3930, float2(0.0), isnan(_3930)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3930, float2(0.0), isnan(_3930)), level(0.0)).xyz;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1509 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _764;
    out.m_71.y = _702;
    out.m_71.z = _766;
    float _1511 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1509);
    float _1513 = exp2(_1507);
    float _1515 = _1428 * 0.5;
    float _1517 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1511);
    float _1519 = _1452 + _1428;
    out.m_73.x = _1170;
    out.m_73.y = _1164;
    out.m_73.z = _1176;
    float _1521 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1517);
    float _1523 = _1519 * 0.5;
    float _1525 = fma(_1462, -0.5, _1515);
    float _1527 = _1521 + _1428;
    out.gl_Position.x = _1452;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1521;
    out.gl_Position.w = _1428;
    float _1529 = _1527 * 0.5;
    float _1531 = -_1513;
    float _1533 = _1531 + 1.0;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1523;
    out.m_75.y = _1525;
    out.m_75.z = _1529;
    out.m_75.w = _1428;
    float _1539 = -_1535;
    float _1541 = _1539 + 1.0;
    out.m_47.x = _1537;
    float _1543 = _1535 * _1480;
    float _1545 = _1491 * _1541;
    float _1547 = _1491 * _1543;
    float _1549 = _1505 * _1543;
    float _1551 = fma(_1501, _1547, _1485);
    float _1553 = fma(_1503, _1547, _1487);
    float _1555 = fma(_1491, _1549, _1489);
    out.m_77.x = _1551;
    out.m_77.y = _1553;
    out.m_77.z = _1555;
    out.m_77.w = _1545;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1124 = false;
    bool _644 = false;
    bool _464 = false;
    bool _296 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1612 = as_type<float>(_112);
        out.gl_Position.z = _1612;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_49.w;
    float _118 = in.m_51.z;
    float _120 = in.m_51.w;
    bool _122 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_116);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = -_116;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.z = _118;
    out.m_53.w = _120;
    if (_130)
    {
        float _136 = float(_96);
        _106 = _136;
    }
    float _138 = _106;
    bool _140 = _134 >= _138;
    bool _142 = !_130;
    bool _144 = _140 || _142;
    float _146 = _138;
    if (_144)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _148 = _146;
    if (_144)
    {
        out.m_47.x = 0.0;
    }
    if (_144)
    {
        float _150 = _148 * 5.0;
        _114 = as_type<int>(_150);
    }
    int _152 = _114;
    if (_144)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1689 = as_type<float>(_152);
        out.gl_Position.z = _1689;
    }
    if (_144)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_55.w;
    float _156 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_49.x;
    float _170 = in.m_49.y;
    float _172 = in.m_49.z;
    float _174 = in.m_44.x;
    float _176 = in.m_44.y;
    float _178 = in.m_44.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _156);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _294;
    if (!_276)
    {
        float _278 = in.m_51.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].x, _134);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        float _298 = float(_96);
        float _300 = 1.0 / _298;
        float _302 = _134 * _300;
        _294 = _302;
    }
    _296 = false;
    float _304 = _294;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _362;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _400 = _324 * _376;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _426 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _428);
    float _436 = fma(_426, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[109].z, _436);
    bool _444 = !_374;
    float _462;
    if (!_444)
    {
        float _446 = in.m_51.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        float _466 = float(_96);
        float _468 = 1.0 / _466;
        float _470 = _134 * _468;
        _462 = _470;
    }
    _464 = false;
    float _472 = _462;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _472 + _474;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _482 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _484 = isnan(_472);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _502 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _504 = isnan(_472);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _480;
    float _516 = -_492;
    float _518 = _516 + 1.0;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _520;
    bool _524 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _526 = isnan(_472);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = _512 * _518;
    float _538 = -_512;
    float _540 = _538 + 1.0;
    bool _542 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _544 = 1.0 / _496;
    float _546 = _534 * _540;
    float _548 = -_534;
    float _550 = _548 + 1.0;
    float _552 = 1.0 / _500;
    float _554 = _522 * _514;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _560 = fma(_554, _476, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _562 = _558 * _544;
    bool _564 = _472 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = isnan(_472);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _576;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _582 = _472 + _580;
    float _584 = _560 * _546;
    float _586 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _588 = _472 + _586;
    float _590 = -_574;
    float _592 = _590 + 1.0;
    float _594 = fma(_562, _582, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _596 = _578 * _552;
    float _598 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[115].x, _584);
    float _600 = _492 * _592;
    float _602 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = fma(_596, _588, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _606 = fma(_594, _536, _598);
    float _608 = _442 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = fma(_604, _600, _606);
    float _614 = _440 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[118].x, _612);
    float _620 = _614 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _622 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _610;
    out.m_57.y = _620;
    out.m_57.z = _616;
    out.m_57.w = _622;
    bool _624 = !_542;
    float _642;
    if (!_624)
    {
        float _626 = in.m_51.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].z, _134);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_96);
        float _648 = 1.0 / _646;
        float _650 = _134 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = in.m_55.x;
    float _656 = in.m_55.y;
    float _658 = in.m_55.z;
    float _660 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _662 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _664 = in.m_59.x;
    float _666 = in.m_59.y;
    float _668 = in.m_59.z;
    float _670 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _672 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _672;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _678 = _676 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _680 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _660);
    float _682 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _662);
    float _684 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _670);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _688 = _652 + _686;
    float _690 = 1.0 / _674;
    float _692 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _680);
    float _694 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _682);
    float _696 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _684);
    float _698 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _700 = _652 + _698;
    float _702 = _694 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _704 = 1.0 / _678;
    float _706 = _656 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _708 = _654 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _710 = _658 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    bool _712 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _714 = isnan(_652);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _720 = _716 || _718;
    float _722 = float(_720);
    float _724 = _688 * _690;
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _666);
    float _728 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _730 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _664);
    float _732 = _708 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = _710 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _736 = _728 * _726;
    float _738 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _668);
    float _740 = _700 * _704;
    float _742 = _732 * _730;
    float _744 = _736 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _746 = _736 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _748 = _734 * _738;
    bool _750 = _666 != 0.0;
    bool _752 = isnan(_666);
    bool _754 = _750 || _752;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _744);
    float _762 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _746);
    float _764 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _766 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _768 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[24].z, _760);
    float _770 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[26].z, _762);
    bool _772 = _664 == 0.0;
    bool _774 = !_758;
    bool _776 = _772 && _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _778;
    float _782 = _768 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _784 = _770 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    bool _786 = _668 == 0.0;
    bool _788 = _786 && _776;
    float _790 = in.m_61.x;
    float _792 = in.m_61.y;
    float _794 = in.m_61.z;
    float _796 = _764 + _782;
    float _798 = _766 + _784;
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _800;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _804;
    float _808 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _810 = _796 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _814 = _798 + _812;
    float _816 = fma(_802, _724, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _822 = _810 * _810;
    float _824 = _814 * _814;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _828 = _826 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _830 = _736 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _832 = fma(_806, _724, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _834 = _822 + _824;
    bool _836 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _838 = isnan(_652);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _830);
    bool _850 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _852 = isnan(_652);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = sqrt(_834);
    float _864 = -_722;
    float _866 = _864 + 1.0;
    float _868 = fma(_748, (*spvDescriptorSet0.vp_c8)._m0[25].z, _848);
    float _870 = fma(_780, _724, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _876 = -_846;
    float _878 = _876 + 1.0;
    float _880 = _792;
    float _882 = _794;
    float _884 = _790;
    float _886 = _846;
    if (!_788)
    {
        float _888 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[17].y, _792);
        _880 = _888;
    }
    float _890 = _880;
    if (!_788)
    {
        float _892 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[17].y, _794);
        _882 = _892;
    }
    float _894 = _882;
    float _896 = _860 * _866;
    float _898 = _868 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _900 = _896;
    float _902 = _898;
    if (!_788)
    {
        float _904 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[17].y, _790);
        _884 = _904;
    }
    float _906 = _884;
    float _908 = -_860;
    float _910 = _908 + 1.0;
    float _912 = _832 * _896;
    float _914 = _816 * _896;
    float _916 = _870 * _896;
    float _918 = _702 + _898;
    bool _920 = _862 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _922 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].x, _912);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].y, _914);
    float _926 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[123].z, _916);
    float _928 = fma(_820, _740, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _930 = fma(_874, _740, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _932 = fma(_828, _740, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _934 = _722 * _878;
    float _936 = _912;
    float _938 = _910;
    float _940 = _914;
    if (!_920)
    {
        _936 = _824;
    }
    float _942 = _936;
    float _944 = _942;
    if (!_920)
    {
        _938 = _822;
    }
    float _946 = _938;
    float _948 = _946;
    if (!_920)
    {
        _900 = _796;
    }
    float _950 = _900;
    float _952 = _950;
    if (!_920)
    {
        _940 = _798;
    }
    float _954 = _940;
    float _956 = _954;
    if (!_920)
    {
        _902 = _918;
    }
    float _958 = _902;
    bool _960 = !_920;
    float _962 = _958;
    if (!_960)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _966 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _968 = _862 + _966;
        float _970 = _918 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _972 = rsqrt(_834);
        float _974 = _968 * _964;
        float _976 = _974 * 0.15915493667125701904296875;
        float _978 = _976 * 6.283185482025146484375;
        float _980 = sin(_978);
        float _982 = _976 * 6.283185482025146484375;
        float _984 = cos(_982);
        float _986 = fma(_980, _970, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _988 = _972 * _986;
        float _990 = _984 + (-1.0);
        float _992 = fma(_810, _988, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _994 = fma(_814, _988, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _996 = _990 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _998 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1000 = _992 + _998;
        float _1002 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1004 = _994 + _1002;
        float _1006 = fma(_918, _984, _996);
        float _1008 = _1000 * _1000;
        float _1010 = _1004 * _1004;
        _962 = _1006;
        _948 = _1008;
        _944 = _1010;
        _952 = _992;
        _956 = _994;
    }
    float _1012 = _962;
    float _1014 = _948;
    float _1016 = _944;
    float _1018 = _952;
    float _1020 = _956;
    float _1022 = in.m_63.w;
    float _1024 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1026 = _1012 + _1024;
    float _1028 = fma(_928, _934, _922);
    float _1030 = fma(_930, _934, _924);
    float _1032 = fma(_932, _934, _926);
    float _1034 = fma(_1026, _1026, _1014);
    float _1036 = _890 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1038 = _890 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1040 = _890 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1042 = _1034 + _1016;
    float _1044 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1028);
    float _1046 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1030);
    float _1048 = fma(_846, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1032);
    float _1050 = sqrt(_1042);
    float _1052 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1036);
    float _1054 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1038);
    float _1056 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1040);
    float _1058 = _1044 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1060 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1062 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1064 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1052);
    float _1066 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1054);
    float _1068 = fma(_894, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1056);
    float _1070 = _1058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1072 = _1060 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1074 = _1062 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_65.w = _1022;
    bool _1076 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1078 = isnan(_1050);
    bool _1080 = _1076 || _1078;
    bool _1082 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1084 = _1080 || _1082;
    out.m_67.x = _1064;
    out.m_67.y = _1066;
    out.m_67.z = _1068;
    out.m_69.x = _1070;
    out.m_69.y = _1072;
    out.m_69.z = _1074;
    float _1086 = _1062;
    float _1088 = _1026;
    if (!_1084)
    {
        _886 = 1.0;
    }
    float _1090 = _886;
    bool _1092 = !_1084;
    float _1094 = _1090;
    if (!_1092)
    {
        bool _1096 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1098 = isnan(_1050);
        bool _1100 = _1096 || _1098;
        bool _1102 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1104 = _1100 || _1102;
        if (!_1104)
        {
            float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1108 = _1050 + _1106;
            float _1110 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1112 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1110;
            float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1116 = _1114 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1118 = 1.0 / _1112;
            float _1120 = _1108 * _1118;
            float _1122 = fma(_1120, _1116, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1094 = _1122;
            _1124 = true;
        }
        else
        {
            bool _1126 = _1050 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1128 = isnan(_1050);
            bool _1130 = _1126 || _1128;
            bool _1132 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1134 = _1130 || _1132;
            if (!_1134)
            {
                float _1136 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1138 = _1050 + _1136;
                float _1140 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1142 = _1140 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1144 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1146 = _1144 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1148 = 1.0 / _1142;
                float _1150 = _1138 * _1148;
                float _1152 = fma(_1150, _1146, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1094 = _1152;
                _1124 = true;
            }
            else
            {
                _1094 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1124 = false;
    float _1154 = _1094;
    float _1156 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1158 = _1012 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1162 = _1018 + _1160;
    float _1164 = fma(_1158, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1166 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1168 = _1020 + _1166;
    float _1170 = fma(_1162, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1172 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1174 = _1164 + _1172;
    float _1176 = fma(_1168, _1154, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1170 + _1178;
    float _1182 = _1174 * _1174;
    float _1184 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1186 = _1176 + _1184;
    float _1188 = fma(_1180, _1180, _1182);
    float _1190 = fma(_1186, _1186, _1188);
    float _1192 = rsqrt(_1190);
    float _1194 = _1192 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1196 = _1180 * _1194;
    float _1198 = _1186 * _1194;
    float _1200 = _1196 * _1196;
    float _1202 = _1198 * _1198;
    float _1204 = _1200 + _1202;
    float _1206 = sqrt(_1204);
    bool _1208 = _1206 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1212 = _1206 + _1210;
    float _1214 = _1186;
    float _1216 = _1204;
    float _1218 = _1212;
    float _1220 = _1196;
    if (_1208)
    {
        float _1222 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1222;
    }
    float _1224 = _1214;
    if (_1208)
    {
        float _1226 = rsqrt(_1204);
        _1216 = _1226;
    }
    float _1228 = _1216;
    float _1230 = _1228;
    if (_1208)
    {
        float _1232 = _1212 * _1224;
        _1218 = _1232;
    }
    float _1234 = _1218;
    if (_1208)
    {
        float _1236 = _1234 * 0.15915493667125701904296875;
        _1086 = _1236;
    }
    float _1238 = _1086;
    float _1240 = _1192;
    float _1242 = _1238;
    if (_1208)
    {
        float _1244 = _1238 * 6.283185482025146484375;
        float _1246 = sin(_1244);
        _1240 = _1246;
    }
    float _1248 = _1240;
    float _1250 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1252 = precise::max(0.0, _1250);
    float _1254 = _930;
    float _1256 = _1252;
    float _1258 = _1250;
    if (_1208)
    {
        float _1260 = _1238 * 6.283185482025146484375;
        float _1262 = cos(_1260);
        _1254 = _1262;
    }
    float _1264 = _1254;
    float _1266 = -_1194;
    float _1268 = -_1252;
    float _1270 = fma(_1174, _1266, _1268);
    if (_1208)
    {
        float _1272 = _1270 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1256 = _1272;
    }
    float _1274 = _1256;
    float _1276 = sqrt(_1190);
    float _1278 = _1248;
    float _1280 = _1274;
    if (_1208)
    {
        float _1282 = fma(_1248, _1274, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1278 = _1282;
    }
    float _1284 = _1278;
    float _1286 = _1284;
    if (!_1208)
    {
        _1280 = _1198;
    }
    float _1288 = _1280;
    float _1290 = _1288;
    if (_1208)
    {
        float _1292 = _1264 + (-1.0);
        _1258 = _1292;
    }
    float _1294 = _1258;
    float _1296 = _1294;
    if (_1208)
    {
        float _1298 = _1228 * _1284;
        _1088 = _1298;
    }
    float _1300 = _1088;
    if (!_1208)
    {
        _1286 = _1270;
    }
    float _1302 = _1286;
    float _1304 = _1302;
    if (_1208)
    {
        float _1306 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1242 = _1306;
    }
    float _1308 = _1242;
    if (_1208)
    {
        float _1310 = _1196 * _1300;
        _1220 = _1310;
    }
    float _1312 = _1220;
    if (!_1208)
    {
        _1230 = _1200;
    }
    float _1314 = _1230;
    float _1316 = _1314;
    if (_1208)
    {
        float _1318 = _1198 * _1300;
        _1290 = _1318;
    }
    float _1320 = _1290;
    if (_1208)
    {
        float _1322 = fma(_1270, _1264, _1308);
        _1304 = _1322;
    }
    float _1324 = _1304;
    if (_1208)
    {
        float _1326 = _1312 * _1312;
        _1316 = _1326;
    }
    float _1328 = _1316;
    if (!_1208)
    {
        _1296 = _1202;
    }
    float _1330 = _1296;
    float _1332 = _1330;
    if (_1208)
    {
        float _1334 = _1320 * _1320;
        _1332 = _1334;
    }
    float _1336 = _1332;
    float _1338 = fma(_1324, _1324, _1328);
    float _1340 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1342 = _1338 + _1336;
    float _1344 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1346 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1348 = fma(_1276, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1346);
    float _1350 = precise::clamp(_1348, 0.0, 1.0);
    float _1352 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1340);
    float _1354 = rsqrt(_1342);
    float _1356 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1344);
    float _1358 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1360 = -_1350;
    float _1362 = _1360 + 1.0;
    float _1364 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1366 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1356);
    float _1368 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1358);
    float _1370 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1372 = fma(_1170, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1364);
    float _1374 = _1366 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1376 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1368);
    float _1378 = abs(_1362);
    float _1380 = log2(_1378);
    float _1382 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1372);
    float _1384 = _1374 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1386 = _1376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1388 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1352);
    float _1390 = _1354 * _1312;
    float _1392 = -_1384;
    float _1394 = fma(_1392, _1370, 1.0);
    float _1396 = _1382 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1398 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1400 = _1388 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1402 = _1354 * _1324;
    float _1404 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1406 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1398);
    float _1408 = _1354 * _1320;
    float _1410 = log2(_1394);
    float _1412 = -_1404;
    float _1414 = fma(_1402, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1412);
    float _1416 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1418 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1406);
    float _1420 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1422 = -_1408;
    float _1424 = fma(_1422, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1414);
    float _1426 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1428 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1418);
    float _1430 = exp2(_1416);
    float _1432 = fma(_1424, -0.5, 0.5);
    float _1434 = fma(_1424, 0.5, 0.5);
    float _1436 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1426);
    float _1438 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1420);
    float _1440 = _1402 + 1.0;
    float _1442 = fma(_1434, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1444 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1436);
    float _1446 = 1.0 / _1428;
    float _1448 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1438);
    float _1450 = _1410 * 0.693147182464599609375;
    float _1452 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1444);
    float _1454 = sqrt(_1432);
    float _1456 = -_1402;
    float _1458 = fma(_1430, _1440, _1456);
    float _1460 = fma(_1434, _1442, -0.212114393711090087890625);
    float _1462 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1448);
    float _1464 = _1450 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1466 = fma(_1458, 0.5, 0.5);
    float _1468 = fma(_1434, _1460, 1.570728778839111328125);
    float _1470 = _1452 * _1446;
    float _1472 = _1462 * _1446;
    float _1474 = fma(_1470, 0.5, 0.5);
    float _1476 = fma(_1472, -0.5, 0.5);
    float _1478 = _1454 * 0.636619746685028076171875;
    float3 _3897 = float3(_1474, _1476, _1464);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3897, float3(0.0), isnan(_3897)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3897, float3(0.0), isnan(_3897)), level(0.0)).x;
    float3 _3908 = float3(_1474, _1476, _1464);
    float4 _1483 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3908, float3(0.0), isnan(_3908)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3908, float3(0.0), isnan(_3908)), level(0.0)).xyzw;
    float _1485 = _1483.x;
    float _1487 = _1483.y;
    float _1489 = _1483.z;
    float _1491 = _1483.w;
    float _1493 = -_1468;
    float _1495 = fma(_1478, _1493, 1.0);
    float2 _3930 = float2(_1495, _1466);
    float3 _1499 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3930, float2(0.0), isnan(_3930)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3930, float2(0.0), isnan(_3930)), level(0.0)).xyz;
    float _1501 = _1499.x;
    float _1503 = _1499.y;
    float _1505 = _1499.z;
    float _1507 = _1380 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1509 = _1386 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_71.x = _764;
    out.m_71.y = _702;
    out.m_71.z = _766;
    float _1511 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1509);
    float _1513 = exp2(_1507);
    float _1515 = _1428 * 0.5;
    float _1517 = fma(_1374, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1511);
    float _1519 = _1452 + _1428;
    out.m_73.x = _1170;
    out.m_73.y = _1164;
    out.m_73.z = _1176;
    float _1521 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1517);
    float _1523 = _1519 * 0.5;
    float _1525 = fma(_1462, -0.5, _1515);
    float _1527 = _1521 + _1428;
    out.gl_Position.x = _1452;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _1521;
    out.gl_Position.w = _1428;
    float _1529 = _1527 * 0.5;
    float _1531 = -_1513;
    float _1533 = _1531 + 1.0;
    float _1535 = _1533 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1537 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1523;
    out.m_75.y = _1525;
    out.m_75.z = _1529;
    out.m_75.w = _1428;
    float _1539 = -_1535;
    float _1541 = _1539 + 1.0;
    out.m_47.x = _1537;
    float _1543 = _1535 * _1480;
    float _1545 = _1491 * _1541;
    float _1547 = _1491 * _1543;
    float _1549 = _1505 * _1543;
    float _1551 = fma(_1501, _1547, _1485);
    float _1553 = fma(_1503, _1547, _1487);
    float _1555 = fma(_1491, _1549, _1489);
    out.m_77.x = _1551;
    out.m_77.y = _1553;
    out.m_77.z = _1555;
    out.m_77.w = _1545;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

