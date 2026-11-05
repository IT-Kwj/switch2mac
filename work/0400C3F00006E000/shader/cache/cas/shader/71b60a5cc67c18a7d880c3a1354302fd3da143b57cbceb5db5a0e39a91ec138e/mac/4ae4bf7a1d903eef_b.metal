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
    float4 m_75 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_71 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1696 = false;
    bool _472 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2182 = as_type<float>(_118);
        out.gl_Position.z = _2182;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_156);
        out.gl_Position.z = _2252;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _158 = in.m_51.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _174, _264);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    float _278 = fma(_272, _158, _182);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_53.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_102);
        float _304 = 1.0 / _302;
        float _306 = _136 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _308 + _310;
    bool _314 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_308);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _308 + _326;
    bool _330 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_308);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _348;
    float _364 = -_360;
    float _366 = _364 + 1.0;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = _340 * _366;
    float _372 = -_340;
    float _374 = _372 + 1.0;
    float _376 = 1.0 / _344;
    float _378 = _328 * _362;
    float _380 = _312 * _376;
    float _382 = -_324;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _360 * _384;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = fma(_394, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = fma(_398, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = _400 * _370;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = _402 * _370;
    float _414 = _404 * _370;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = fma(_410, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _428 = fma(_418, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_422, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _406);
    float _434 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _436 = fma(_428, _390, _426);
    float _438 = fma(_424, _390, _432);
    float _440 = fma(_430, _390, _434);
    float _442 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].y, _438);
    float _446 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].z, _440);
    bool _448 = !_368;
    float _450 = _412;
    int _468;
    float _470;
    if (!_448)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = as_type<int>(_460);
        _470 = _466;
        _472 = true;
    }
    else
    {
        float _474 = float(_102);
        float _476 = 1.0 / _474;
        float _478 = _136 * _476;
        _468 = as_type<int>(_476);
        _470 = _478;
    }
    _472 = false;
    int _480 = _468;
    float _482 = _470;
    float _484 = in.m_55.x;
    float _486 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _490 = _488 != 0;
    float _492 = in.m_53.w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _502 = _500 != 0;
    float _504 = in.m_55.y;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _508 = _506 != 0;
    float _510 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _514 = _512 != 0;
    float _516 = in.m_53.z;
    float _518 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _520 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    int _522 = _480;
    if (_490)
    {
        float _524 = in.m_53.x;
        _522 = as_type<int>(_524);
    }
    int _526 = _522;
    float _528 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _518);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = in.m_53.x;
    float _536 = in.m_53.y;
    float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _540 = in.m_51.x;
    float _542 = in.m_51.y;
    float _544 = in.m_51.z;
    float _546 = _484;
    if (!_490)
    {
        _450 = _484;
    }
    float _548 = _450;
    int _550 = 0;
    float _552 = _548;
    if (_496)
    {
        float _554 = -_484;
        float _556 = _554 + 1.0;
        _550 = as_type<int>(_556);
    }
    int _558 = _550;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _492 > 0.5;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = 1.0 / _532;
    float _570 = -_504;
    float _572 = _570 + 1.0;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _576 = in.m_57.x;
    float _578 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _580 = log2(_578);
    bool _582 = false;
    int _584 = _526;
    float _586 = _504;
    if (_490)
    {
        bool _588 = as_type<float>(_526) > 0.5;
        _582 = _588;
    }
    bool _590 = _582;
    bool _592 = _590;
    if (_490)
    {
        float _594 = -_484;
        float _596 = _594 + 1.0;
        _584 = as_type<int>(_596);
    }
    int _598 = _584;
    float _600 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _602 = 0.0;
    if (!_502)
    {
        _602 = _536;
    }
    float _604 = _602;
    float _606 = _604;
    if (_490)
    {
        float _608 = _590 ? as_type<float>(_598) : _484;
        _552 = _608;
    }
    float _610 = _552;
    float _612 = _442 * _540;
    float _614 = in.m_57.w;
    if (_496)
    {
        bool _616 = _516 > 0.5;
        _592 = _616;
    }
    bool _618 = _592;
    float _620 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _622 = _536 > 0.5;
    float _624 = -_566;
    float _626 = fma(_600, 2.0, _624);
    if (_496)
    {
        float _628 = _618 ? as_type<float>(_558) : _484;
        _546 = _628;
    }
    float _630 = _546;
    float _632 = fma(_620, -2.0, _574);
    int _634 = _622 ? as_type<int>(_572) : as_type<int>(_504);
    float _636 = _444 * _542;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = _446 * _544;
    float _652 = _516 * 2.0;
    float _654 = 1.0 / _562;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _662 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = floor(_652);
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _670 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    out.m_59.w = _614;
    float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _636;
    if (_502)
    {
        _606 = _534;
    }
    float _676 = _606;
    float _678 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _632);
    float _680 = 1.0 / _660;
    float _682 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _520);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _684;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
    float _700 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _696 * _654;
    float _704 = _508 ? as_type<float>(_634) : _504;
    float _706 = _692 * _568;
    bool _708 = _666 >= 0.0;
    bool _710 = isnan(_666);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    out.m_61.x = _664;
    out.m_61.y = _672;
    out.m_61.z = _700;
    float _718 = _536 + _516;
    float _720 = _536 + _534;
    float _722 = _686 * _680;
    float _724 = _716 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _726 = in.m_63.x;
    float _728 = in.m_63.y;
    float _730 = in.m_63.z;
    bool _732 = _666 > 0.0;
    float _734 = _534 + _516;
    float _736 = _534 * 2.0;
    float _738 = _718 + (-1.0);
    float _740 = _734 + (-1.0);
    float _742 = _720 + (-1.0);
    float _744 = _536 * 2.0;
    float _746 = floor(_736);
    float _748 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _750 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _752 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _754 = _724;
    float _756 = _744;
    if (_514)
    {
        float _758 = _564 ? _572 : _504;
        _586 = _758;
    }
    float _760 = _586;
    float _762 = _580 * _136;
    float _764 = floor(_744);
    int _766 = ~as_type<int>(_724);
    int _768 = _766 + 1;
    int _770 = _768 + 1;
    int _772 = _770;
    if (!_732)
    {
        int _774 = ~as_type<int>(_724);
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    if (!_502)
    {
        _754 = _516;
    }
    float _780 = _754;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _730);
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _786 = _746 > 0.0;
    bool _788 = _746 >= 0.0;
    bool _790 = isnan(_746);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _482 + _798;
    float _802 = _780;
    if (!_502)
    {
        _756 = _516;
    }
    float _804 = _756;
    float _806 = _516 + (-0.5);
    float _808 = _804;
    if (_502)
    {
        _802 = _536;
    }
    float _810 = _802;
    float _812 = exp2(_762);
    if (_502)
    {
        _808 = _536;
    }
    float _814 = _808;
    bool _816 = _764 > 0.0;
    bool _818 = _764 >= 0.0;
    bool _820 = isnan(_764);
    bool _822 = _818 || _820;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    float _828 = _782 * _662;
    float _830 = fma(_706, _800, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _482 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _838 = _482 + _836;
    float _840 = _784 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _842 = fma(_702, _834, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _844 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _846 = isnan(_482);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = fma(_722, _838, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _860 = fma(_840, _704, -0.5);
    bool _862 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _864 = isnan(_482);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_854;
    float _876 = _874 + 1.0;
    bool _878 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _880 = isnan(_482);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _892 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _858);
    float _894 = -_872;
    float _896 = _894 + 1.0;
    float _898 = _872 * _876;
    bool _900 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _902 = isnan(_482);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _890);
    float _914 = _888 * _896;
    float _916 = -_888;
    float _918 = _916 + 1.0;
    float _920 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _912);
    float _922 = _910 * _918;
    float _924 = -_910;
    float _926 = _924 + 1.0;
    float _928 = -_678;
    float _930 = fma(_920, _860, _928);
    float _932 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _934 = _830 * _922;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _942 = _538 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _944 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[83].z, _936);
    float _946 = _676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _948 = fma(_932, -2.0, _938);
    int _950 = _826 ? 0 : 1;
    float _952 = fma(_942, _760, -0.5);
    float _954 = -_940;
    float _956 = fma(_946, 2.0, _954);
    float _958 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[115].x, _934);
    int _960 = ~_950;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = -_812;
    float _968 = _966 + 1.0;
    int _970 = _964;
    if (!_816)
    {
        int _972 = ~_950;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    float _978 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[191].x, _534);
    int _980 = _796 ? 0 : 1;
    float _982 = fma(_842, _914, _958);
    float _984 = _978 + _730;
    int _986 = ~_980;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    float _992 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _892);
    int _994 = _990;
    if (!_786)
    {
        int _996 = ~_980;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    float _1002 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _948);
    float _1004 = _984 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _1006 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1008 = isnan(1.0);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1014 = _1010 || _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1018 = 1.0 + _1016;
    float _1020 = -_1002;
    float _1022 = fma(_992, _952, _1020);
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1026 = _1004 * 0.15915493667125701904296875;
    float _1028 = 1.0 / _1018;
    bool _1030 = !_644;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1024);
    bool _1036 = !_640;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = -_136;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[76].x, _626);
    int _1044 = abs(_1032);
    float _1046 = -_136;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[81].x, _956);
    int _1050 = abs(_1038);
    float _1052 = _1026 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = in.m_65.x;
    float _1058 = in.m_65.y;
    float _1060 = in.m_65.z;
    bool _1062 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1070 = _1066 || _1068;
    float _1072 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1034);
    float _1074 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _944);
    float _1076 = _1070 ? _968 : 0.0;
    float _1078 = _576 * _576;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1082 = float(_1044);
    float _1084 = _536 + (-0.5);
    float _1086 = float(_1000);
    float _1088 = _1042;
    float _1090 = _1048;
    if (_1014)
    {
        float _1092 = _1076 * _1028;
        _138 = _1092;
    }
    float _1094 = _138;
    bool _1096 = !_648;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = fma(_856, _898, _982);
    float _1102 = float(_1050);
    float _1104 = _1082 * _1086;
    float _1106 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1108 = float(_778);
    float _1110 = _1104 * (-2.0);
    int _1112 = abs(_1098);
    float _1114 = fma(_1106, _1078, _728);
    float _1116 = _1102 * _1108;
    float _1118 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1120 = fma(_1110, _1058, _1058);
    float _1122 = fma(_748, _1110, _748);
    float _1124 = fma(_1118, _610, -0.5);
    float _1126 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1128 = float(_1112);
    float _1130 = _1116 * (-2.0);
    float _1132 = float(_976);
    float _1134 = fma(_1106, 0.20000000298023223876953125, _726);
    float _1136 = fma(_1122, _1094, _1126);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1140 = fma(_752, _1130, _752);
    float _1142 = _1128 * _1132;
    float _1144 = fma(_1130, _1056, _1056);
    float _1146 = _534 + (-0.5);
    bool _1148 = _1114 != 0.0;
    bool _1150 = isnan(_1114);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = in.m_67.x;
    float _1160 = in.m_67.y;
    float _1162 = in.m_67.z;
    float _1164 = _1142 * (-2.0);
    float _1166 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1144);
    bool _1168 = _1134 == 0.0;
    bool _1170 = !_1156;
    bool _1172 = _1168 && _1170;
    float _1174 = fma(_1072, _1124, _1042);
    float _1176 = fma(_1164, _1060, _1060);
    float _1178 = fma(_750, _1164, _750);
    bool _1180 = _730 == 0.0;
    bool _1182 = _1180 && _1172;
    float _1184 = fma(_1140, _1094, _1166);
    float _1186 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1188 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1190 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1194 = fma(_1178, _1094, _1186);
    float _1196 = fma(_1188, _630, -0.5);
    float _1198 = in.m_69.x;
    float _1200 = in.m_69.y;
    float _1202 = in.m_69.z;
    float _1204 = in.m_69.w;
    float _1206 = _1136 * 0.15915493667125701904296875;
    float _1208 = _1184 * 0.15915493667125701904296875;
    float _1210 = fma(_1074, _1196, _1048);
    float _1212 = _1194 * 0.15915493667125701904296875;
    float _1214 = _1192 * _1190;
    float _1216 = _1206 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1100);
    float _1222 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1224 = _1138;
    float _1226 = _1192;
    float _1228 = _1158;
    float _1230 = _1174;
    if (_1182)
    {
        _1088 = _1158;
    }
    float _1232 = _1088;
    float _1234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1114);
    float _1236 = _1232;
    if (_1182)
    {
        _1224 = _1162;
    }
    float _1238 = _1224;
    float _1240 = _1238;
    if (_1182)
    {
        _1226 = _1232;
    }
    float _1242 = _1226;
    float _1244 = _1206 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1242;
    if (!_1182)
    {
        _1236 = _1158;
    }
    float _1250 = _1236;
    float _1252 = _1234 * _1222;
    if (_1182)
    {
        _1228 = _1238;
    }
    float _1254 = _1228;
    float _1256 = _1254;
    if (!_1182)
    {
        _1240 = _1162;
    }
    float _1258 = _1240;
    if (!_1182)
    {
        float _1260 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1248 = _1260;
    }
    float _1262 = _1248;
    if (_1182)
    {
        _1090 = _1160;
    }
    float _1264 = _1090;
    float _1266 = _1208 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1264;
    if (!_1182)
    {
        float _1272 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1258);
        _1256 = _1272;
    }
    float _1274 = _1256;
    if (_1182)
    {
        _674 = _1264;
    }
    float _1276 = _674;
    float _1278 = _1200 * _1258;
    float _1280 = _1276;
    if (!_1182)
    {
        _1270 = _1160;
    }
    float _1282 = _1270;
    float _1284 = _1202 * _1250;
    float _1286 = _1212 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    if (!_1182)
    {
        float _1290 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1280 = _1290;
    }
    float _1292 = _1280;
    float _1294 = -_1278;
    float _1296 = fma(_1202, _1282, _1294);
    float _1298 = _1198 * _1282;
    float _1300 = _1208 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = _1268 * _1246;
    float _1306 = -_1298;
    float _1308 = fma(_1200, _1250, _1306);
    float _1310 = _698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1312 = _1212 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1268 * _1288;
    float _1318 = _1268 * _1218;
    float _1320 = _1246 * _1288;
    float _1322 = _1316 * _1252;
    float _1324 = _1316 * _1292;
    float _1326 = _1302 * _1218;
    float _1328 = _1302 * _1246;
    float _1330 = _1302 * _1288;
    float _1332 = _1218 * _1288;
    float _1334 = -_1284;
    float _1336 = fma(_1198, _1258, _1334);
    float _1338 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1340 = fma(_1314, _1304, _1326);
    float _1342 = fma(_1314, _1326, _1304);
    float _1344 = -_1252;
    float _1346 = _1314 * _1344;
    float _1348 = _1330 * _1252;
    float _1350 = -_1318;
    float _1352 = fma(_1314, _1328, _1350);
    float _1354 = -_1328;
    float _1356 = fma(_1314, _1318, _1354);
    float _1358 = fma(_1340, _1214, _1322);
    float _1360 = fma(_1320, _1214, _1346);
    float _1362 = fma(_1352, _1214, _1348);
    float _1364 = _1336 * _1204;
    float _1366 = fma(_1356, _828, _1358);
    float _1368 = _1296 * _1204;
    float _1370 = _1308 * _1204;
    float _1372 = fma(_1332, _828, _1360);
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1376 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1378 = fma(_1342, _828, _1362);
    float _1380 = -_1292;
    float _1382 = _1314 * _1380;
    float _1384 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1374);
    float _1386 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1376);
    float _1388 = _1330 * _1292;
    float _1390 = fma(_1320, _1262, _1382);
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1384);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1386);
    float _1396 = fma(_1340, _1262, _1324);
    float _1398 = fma(_1352, _1262, _1388);
    float _1400 = _1392 + _1338;
    float _1402 = _1394 + _1310;
    float _1404 = -_1200;
    float _1406 = _1314 * _1404;
    float _1408 = _1316 * _1200;
    float _1410 = _1330 * _1200;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1414 = _1400 + _1412;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1402 + _1416;
    float _1420 = fma(_1320, _1198, _1406);
    float _1422 = fma(_1340, _1198, _1408);
    float _1424 = _1414 * _1414;
    float _1426 = _1418 * _1418;
    float _1428 = -_1364;
    float _1430 = _1314 * _1428;
    float _1432 = _1316 * _1364;
    float _1434 = fma(_1352, _1198, _1410);
    float _1436 = _1424 + _1426;
    float _1438 = fma(_1320, _1368, _1430);
    float _1440 = _1330 * _1364;
    float _1442 = fma(_1340, _1368, _1432);
    float _1444 = sqrt(_1436);
    float _1446 = fma(_1356, _1202, _1422);
    float _1448 = fma(_1332, _1274, _1390);
    float _1450 = fma(_1356, _1274, _1396);
    float _1452 = fma(_1342, _1274, _1398);
    float _1454 = fma(_1332, _1202, _1420);
    float _1456 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1458 = fma(_1352, _1368, _1440);
    float _1460 = fma(_1342, _1202, _1434);
    float _1462 = fma(_1332, _1370, _1438);
    float _1464 = fma(_1356, _1370, _1442);
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1468 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1470 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1472 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1456);
    float _1474 = fma(_1342, _1370, _1458);
    bool _1476 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1466);
    float _1480 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1468);
    float _1482 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1470);
    float _1484 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1488 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1472);
    float _1490 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1492 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1494 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1486);
    float _1496 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1498 = _1488 + _1490;
    float _1500 = _1488;
    float _1502 = _1490;
    float _1504 = _1424;
    float _1506 = _1426;
    float _1508 = _1402;
    if (!_1476)
    {
        _1500 = _1424;
    }
    float _1510 = _1500;
    float _1512 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1496);
    float _1514 = _1510;
    if (!_1476)
    {
        _1502 = _1400;
    }
    float _1516 = _1502;
    float _1518 = _1516;
    if (!_1476)
    {
        _1504 = _1498;
    }
    float _1520 = _1504;
    bool _1522 = !_1476;
    float _1524 = _1520;
    if (!_1522)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1444 + _1528;
        float _1532 = rsqrt(_1436);
        float _1534 = _1530 * _1526;
        float _1536 = _1498 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1538 = _1534 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = cos(_1544);
        float _1548 = fma(_1542, _1536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1550 = _1532 * _1548;
        float _1552 = _1546 + (-1.0);
        float _1554 = fma(_1414, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = fma(_1418, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1558 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1562 = _1554 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1566 = _1556 + _1564;
        float _1568 = fma(_1498, _1546, _1558);
        float _1570 = _1562 * _1562;
        float _1572 = _1566 * _1566;
        _1524 = _1568;
        _1514 = _1570;
        _1506 = _1572;
        _1518 = _1554;
        _1508 = _1556;
    }
    float _1574 = _1524;
    float _1576 = _1514;
    float _1578 = _1506;
    float _1580 = _1518;
    float _1582 = _1508;
    float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1586 = _1574 + _1584;
    float _1588 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1590 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1592 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1594 = fma(_1586, _1586, _1576);
    float _1596 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1588);
    float _1598 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1590);
    float _1600 = _1594 + _1578;
    float _1602 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1478);
    float _1604 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1592);
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1608 = sqrt(_1600);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1614 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1596);
    float _1616 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1480);
    float _1618 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1512);
    float _1620 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1492);
    float _1622 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1494);
    float _1624 = _930 + 0.5;
    float _1626 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1598);
    float _1628 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1482);
    float _1630 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1632 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = _1022 + 0.5;
    float _1638 = _1174 + 0.5;
    float _1640 = _1210 + 0.5;
    float _1642 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1644 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1604);
    out.m_71.x = _1602;
    out.m_71.y = _1616;
    out.m_71.z = _1628;
    bool _1646 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1648 = isnan(_1608);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1654 = _1650 || _1652;
    out.m_73.x = _1638;
    out.m_73.y = _1624;
    out.m_73.z = _1640;
    out.m_73.w = _1636;
    out.m_75.x = _1630;
    out.m_75.y = _1632;
    out.m_75.z = _1634;
    out.m_75.w = _1642;
    out.m_77.x = _1618;
    out.m_77.y = _1620;
    out.m_77.z = _1622;
    float _1656 = _1616;
    float _1658 = _1618;
    float _1660 = _1582;
    if (!_1654)
    {
        _1230 = 1.0;
    }
    float _1662 = _1230;
    out.m_79.x = _1614;
    out.m_79.y = _1626;
    out.m_79.z = _1644;
    bool _1664 = !_1654;
    float _1666 = _1662;
    if (!_1664)
    {
        bool _1668 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1670 = isnan(_1608);
        bool _1672 = _1668 || _1670;
        bool _1674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1676 = _1672 || _1674;
        if (!_1676)
        {
            float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1680 = _1608 + _1678;
            float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1684 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1682;
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1688 = _1686 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1690 = 1.0 / _1684;
            float _1692 = _1680 * _1690;
            float _1694 = fma(_1692, _1688, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1666 = _1694;
            _1696 = true;
        }
        else
        {
            bool _1698 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1700 = isnan(_1608);
            bool _1702 = _1698 || _1700;
            bool _1704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1706 = _1702 || _1704;
            if (!_1706)
            {
                float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1710 = _1608 + _1708;
                float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1714 = _1712 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1718 = _1716 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1720 = 1.0 / _1714;
                float _1722 = _1710 * _1720;
                float _1724 = fma(_1722, _1718, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1666 = _1724;
                _1696 = true;
            }
            else
            {
                _1666 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1696 = false;
    float _1726 = _1666;
    float _1728 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1730 = _1574 + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1734 = _1580 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1738 = _1582 + _1736;
    float _1740 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1742 = fma(_1734, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1744 = fma(_1738, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1748 = _1740 + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1752 = _1742 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1744 + _1754;
    float _1758 = _1748 * _1748;
    float _1760 = fma(_1752, _1752, _1758);
    float _1762 = fma(_1756, _1756, _1760);
    float _1764 = rsqrt(_1762);
    float _1766 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1768 = _1752 * _1766;
    float _1770 = _1756 * _1766;
    float _1772 = _1768 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 + _1774;
    float _1778 = sqrt(_1776);
    bool _1780 = _1778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = _1778 + _1782;
    float _1786 = _1764;
    float _1788 = _1784;
    float _1790 = _1748;
    float _1792 = _1768;
    if (_1780)
    {
        float _1794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1794;
    }
    float _1796 = _1786;
    if (_1780)
    {
        float _1798 = rsqrt(_1776);
        _1656 = _1798;
    }
    float _1800 = _1656;
    float _1802 = _1800;
    if (_1780)
    {
        float _1804 = _1784 * _1796;
        _1788 = _1804;
    }
    float _1806 = _1788;
    if (_1780)
    {
        float _1808 = _1806 * 0.15915493667125701904296875;
        _1658 = _1808;
    }
    float _1810 = _1658;
    float _1812 = _1756;
    if (_1780)
    {
        float _1814 = _1810 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        _1812 = _1816;
    }
    float _1818 = _1812;
    float _1820 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1822 = precise::max(0.0, _1820);
    float _1824 = _1796;
    float _1826 = _1822;
    if (_1780)
    {
        float _1828 = _1810 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        _1824 = _1830;
    }
    float _1832 = _1824;
    float _1834 = -_1766;
    float _1836 = -_1822;
    float _1838 = fma(_1748, _1834, _1836);
    if (_1780)
    {
        float _1840 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1790 = _1840;
    }
    float _1842 = _1790;
    float _1844 = sqrt(_1762);
    float _1846 = _1842;
    float _1848 = _1818;
    if (_1780)
    {
        float _1850 = fma(_1818, _1842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1852;
    if (!_1780)
    {
        _1848 = _1838;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    float _1860 = _1832;
    if (_1780)
    {
        float _1862 = _1832 + (-1.0);
        _1826 = _1862;
    }
    float _1864 = _1826;
    float _1866 = _1864;
    if (_1780)
    {
        float _1868 = _1800 * _1852;
        _1660 = _1868;
    }
    float _1870 = _1660;
    if (!_1780)
    {
        _1854 = _1772;
    }
    float _1872 = _1854;
    float _1874 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1876 = _1872;
    if (_1780)
    {
        float _1878 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1802 = _1878;
    }
    float _1880 = _1802;
    if (_1780)
    {
        float _1882 = _1768 * _1870;
        _1792 = _1882;
    }
    float _1884 = _1792;
    if (!_1780)
    {
        _1866 = _1770;
    }
    float _1886 = _1866;
    float _1888 = _1886;
    if (_1780)
    {
        float _1890 = _1770 * _1870;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1780)
    {
        float _1894 = fma(_1838, _1832, _1880);
        _1858 = _1894;
    }
    float _1896 = _1858;
    if (_1780)
    {
        float _1898 = _1884 * _1884;
        _1876 = _1898;
    }
    float _1900 = _1876;
    if (!_1780)
    {
        _1860 = _1774;
    }
    float _1902 = _1860;
    float _1904 = _1902;
    if (_1780)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1914 = _1910 + _1908;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1912);
    float _1924 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1926 = rsqrt(_1914);
    float _1928 = -_1920;
    float _1930 = _1928 + 1.0;
    float _1932 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1922);
    float _1934 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1936 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1924);
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1934);
    float _1944 = abs(_1930);
    float _1946 = log2(_1944);
    float _1948 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1950 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1874);
    float _1952 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1942);
    float _1954 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1956 = _1948 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1958 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1950);
    float _1960 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1962 = _1926 * _1884;
    float _1964 = -_1954;
    float _1966 = fma(_1964, _1938, 1.0);
    float _1968 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1970 = _1926 * _1896;
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1976 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1968);
    float _1978 = _1926 * _1892;
    float _1980 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1982 = -_1972;
    float _1984 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1982);
    float _1986 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1976);
    float _1988 = log2(_1966);
    float _1990 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1992 = -_1978;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1984);
    float _1996 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1986);
    float _1998 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1990);
    float _2002 = fma(_1994, -0.5, 0.5);
    float _2004 = fma(_1994, 0.5, 0.5);
    float _2006 = exp2(_1980);
    float _2008 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2010 = _1970 + 1.0;
    float _2012 = fma(_2004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2014 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2016 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2008);
    float _2018 = 1.0 / _1996;
    float _2020 = _1988 * 0.693147182464599609375;
    float _2022 = sqrt(_2002);
    float _2024 = -_1970;
    float _2026 = fma(_2006, _2010, _2024);
    float _2028 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2016);
    float _2030 = fma(_2004, _2012, -0.212114393711090087890625);
    float _2032 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2014);
    float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2036 = fma(_2004, _2030, 1.570728778839111328125);
    float _2038 = _2028 * _2018;
    float _2040 = _2032 * _2018;
    float _2042 = fma(_2026, 0.5, 0.5);
    float _2044 = fma(_2038, 0.5, 0.5);
    float _2046 = fma(_2040, -0.5, 0.5);
    float _2048 = _2022 * 0.636619746685028076171875;
    float3 _5357 = float3(_2044, _2046, _2034);
    float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5357, float3(0.0), isnan(_5357)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5357, float3(0.0), isnan(_5357)), level(0.0)).x;
    float _2052 = -_2036;
    float _2054 = fma(_2048, _2052, 1.0);
    float3 _5373 = float3(_2044, _2046, _2034);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5373, float3(0.0), isnan(_5373)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5373, float3(0.0), isnan(_5373)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _5390 = float2(_2054, _2042);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5390, float2(0.0), isnan(_5390)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5390, float2(0.0), isnan(_5390)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2079 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2081 = _2028 + _1996;
    float _2083 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2077);
    float _2085 = _2081 * 0.5;
    float _2087 = exp2(_2079);
    float _2089 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2083);
    float _2091 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2093 = _1996 * 0.5;
    float _2095 = _2091 + _1996;
    float _2097 = -_2087;
    float _2099 = _2097 + 1.0;
    float _2101 = fma(_2032, -0.5, _2093);
    float _2103 = _2095 * 0.5;
    float _2105 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2028;
    out.gl_Position.y = _2032;
    out.gl_Position.z = _2091;
    out.gl_Position.w = _1996;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = _2085;
    out.m_81.y = _2101;
    out.m_81.z = _2103;
    out.m_81.w = _1996;
    out.m_47.x = _2107;
    float _2109 = _2105 * _2050;
    float _2111 = -_2105;
    float _2113 = _2111 + 1.0;
    float _2115 = _2065 * _2109;
    float _2117 = _2075 * _2109;
    float _2119 = fma(_2071, _2115, _2059);
    float _2121 = fma(_2073, _2115, _2061);
    float _2123 = _2065 * _2113;
    float _2125 = fma(_2065, _2117, _2063);
    out.m_83.x = _2119;
    out.m_83.y = _2121;
    out.m_83.z = _2125;
    out.m_83.w = _2123;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1696 = false;
    bool _472 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2182 = as_type<float>(_118);
        out.gl_Position.z = _2182;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_156);
        out.gl_Position.z = _2252;
    }
    if (_148)
    {
        return out;
    }
    float _158 = in.m_51.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _174, _264);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    float _278 = fma(_272, _158, _182);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_53.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_102);
        float _304 = 1.0 / _302;
        float _306 = _136 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _308 + _310;
    bool _314 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_308);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _308 + _326;
    bool _330 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_308);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _348;
    float _364 = -_360;
    float _366 = _364 + 1.0;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = _340 * _366;
    float _372 = -_340;
    float _374 = _372 + 1.0;
    float _376 = 1.0 / _344;
    float _378 = _328 * _362;
    float _380 = _312 * _376;
    float _382 = -_324;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _360 * _384;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = fma(_394, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = fma(_398, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = _400 * _370;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = _402 * _370;
    float _414 = _404 * _370;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = fma(_410, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _428 = fma(_418, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_422, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _406);
    float _434 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _436 = fma(_428, _390, _426);
    float _438 = fma(_424, _390, _432);
    float _440 = fma(_430, _390, _434);
    float _442 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].y, _438);
    float _446 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].z, _440);
    bool _448 = !_368;
    float _450 = _412;
    int _468;
    float _470;
    if (!_448)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = as_type<int>(_460);
        _470 = _466;
        _472 = true;
    }
    else
    {
        float _474 = float(_102);
        float _476 = 1.0 / _474;
        float _478 = _136 * _476;
        _468 = as_type<int>(_476);
        _470 = _478;
    }
    _472 = false;
    int _480 = _468;
    float _482 = _470;
    float _484 = in.m_55.x;
    float _486 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _490 = _488 != 0;
    float _492 = in.m_53.w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _502 = _500 != 0;
    float _504 = in.m_55.y;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _508 = _506 != 0;
    float _510 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _514 = _512 != 0;
    float _516 = in.m_53.z;
    float _518 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _520 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    int _522 = _480;
    if (_490)
    {
        float _524 = in.m_53.x;
        _522 = as_type<int>(_524);
    }
    int _526 = _522;
    float _528 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _518);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = in.m_53.x;
    float _536 = in.m_53.y;
    float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _540 = in.m_51.x;
    float _542 = in.m_51.y;
    float _544 = in.m_51.z;
    float _546 = _484;
    if (!_490)
    {
        _450 = _484;
    }
    float _548 = _450;
    int _550 = 0;
    float _552 = _548;
    if (_496)
    {
        float _554 = -_484;
        float _556 = _554 + 1.0;
        _550 = as_type<int>(_556);
    }
    int _558 = _550;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _492 > 0.5;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = 1.0 / _532;
    float _570 = -_504;
    float _572 = _570 + 1.0;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _576 = in.m_57.x;
    float _578 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _580 = log2(_578);
    bool _582 = false;
    int _584 = _526;
    float _586 = _504;
    if (_490)
    {
        bool _588 = as_type<float>(_526) > 0.5;
        _582 = _588;
    }
    bool _590 = _582;
    bool _592 = _590;
    if (_490)
    {
        float _594 = -_484;
        float _596 = _594 + 1.0;
        _584 = as_type<int>(_596);
    }
    int _598 = _584;
    float _600 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _602 = 0.0;
    if (!_502)
    {
        _602 = _536;
    }
    float _604 = _602;
    float _606 = _604;
    if (_490)
    {
        float _608 = _590 ? as_type<float>(_598) : _484;
        _552 = _608;
    }
    float _610 = _552;
    float _612 = _442 * _540;
    float _614 = in.m_57.w;
    if (_496)
    {
        bool _616 = _516 > 0.5;
        _592 = _616;
    }
    bool _618 = _592;
    float _620 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _622 = _536 > 0.5;
    float _624 = -_566;
    float _626 = fma(_600, 2.0, _624);
    if (_496)
    {
        float _628 = _618 ? as_type<float>(_558) : _484;
        _546 = _628;
    }
    float _630 = _546;
    float _632 = fma(_620, -2.0, _574);
    int _634 = _622 ? as_type<int>(_572) : as_type<int>(_504);
    float _636 = _444 * _542;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = _446 * _544;
    float _652 = _516 * 2.0;
    float _654 = 1.0 / _562;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _662 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = floor(_652);
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _670 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    out.m_59.w = _614;
    float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _636;
    if (_502)
    {
        _606 = _534;
    }
    float _676 = _606;
    float _678 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _632);
    float _680 = 1.0 / _660;
    float _682 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _520);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _684;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
    float _700 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _696 * _654;
    float _704 = _508 ? as_type<float>(_634) : _504;
    float _706 = _692 * _568;
    bool _708 = _666 >= 0.0;
    bool _710 = isnan(_666);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    out.m_61.x = _664;
    out.m_61.y = _672;
    out.m_61.z = _700;
    float _718 = _536 + _516;
    float _720 = _536 + _534;
    float _722 = _686 * _680;
    float _724 = _716 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _726 = in.m_63.x;
    float _728 = in.m_63.y;
    float _730 = in.m_63.z;
    bool _732 = _666 > 0.0;
    float _734 = _534 + _516;
    float _736 = _534 * 2.0;
    float _738 = _718 + (-1.0);
    float _740 = _734 + (-1.0);
    float _742 = _720 + (-1.0);
    float _744 = _536 * 2.0;
    float _746 = floor(_736);
    float _748 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _750 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _752 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _754 = _724;
    float _756 = _744;
    if (_514)
    {
        float _758 = _564 ? _572 : _504;
        _586 = _758;
    }
    float _760 = _586;
    float _762 = _580 * _136;
    float _764 = floor(_744);
    int _766 = ~as_type<int>(_724);
    int _768 = _766 + 1;
    int _770 = _768 + 1;
    int _772 = _770;
    if (!_732)
    {
        int _774 = ~as_type<int>(_724);
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    if (!_502)
    {
        _754 = _516;
    }
    float _780 = _754;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _730);
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _786 = _746 > 0.0;
    bool _788 = _746 >= 0.0;
    bool _790 = isnan(_746);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _482 + _798;
    float _802 = _780;
    if (!_502)
    {
        _756 = _516;
    }
    float _804 = _756;
    float _806 = _516 + (-0.5);
    float _808 = _804;
    if (_502)
    {
        _802 = _536;
    }
    float _810 = _802;
    float _812 = exp2(_762);
    if (_502)
    {
        _808 = _536;
    }
    float _814 = _808;
    bool _816 = _764 > 0.0;
    bool _818 = _764 >= 0.0;
    bool _820 = isnan(_764);
    bool _822 = _818 || _820;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    float _828 = _782 * _662;
    float _830 = fma(_706, _800, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _482 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _838 = _482 + _836;
    float _840 = _784 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _842 = fma(_702, _834, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _844 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _846 = isnan(_482);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = fma(_722, _838, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _860 = fma(_840, _704, -0.5);
    bool _862 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _864 = isnan(_482);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_854;
    float _876 = _874 + 1.0;
    bool _878 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _880 = isnan(_482);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _892 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _858);
    float _894 = -_872;
    float _896 = _894 + 1.0;
    float _898 = _872 * _876;
    bool _900 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _902 = isnan(_482);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _890);
    float _914 = _888 * _896;
    float _916 = -_888;
    float _918 = _916 + 1.0;
    float _920 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _912);
    float _922 = _910 * _918;
    float _924 = -_910;
    float _926 = _924 + 1.0;
    float _928 = -_678;
    float _930 = fma(_920, _860, _928);
    float _932 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _934 = _830 * _922;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _942 = _538 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _944 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[83].z, _936);
    float _946 = _676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _948 = fma(_932, -2.0, _938);
    int _950 = _826 ? 0 : 1;
    float _952 = fma(_942, _760, -0.5);
    float _954 = -_940;
    float _956 = fma(_946, 2.0, _954);
    float _958 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[115].x, _934);
    int _960 = ~_950;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = -_812;
    float _968 = _966 + 1.0;
    int _970 = _964;
    if (!_816)
    {
        int _972 = ~_950;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    float _978 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[191].x, _534);
    int _980 = _796 ? 0 : 1;
    float _982 = fma(_842, _914, _958);
    float _984 = _978 + _730;
    int _986 = ~_980;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    float _992 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _892);
    int _994 = _990;
    if (!_786)
    {
        int _996 = ~_980;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    float _1002 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _948);
    float _1004 = _984 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _1006 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1008 = isnan(1.0);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1014 = _1010 || _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1018 = 1.0 + _1016;
    float _1020 = -_1002;
    float _1022 = fma(_992, _952, _1020);
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1026 = _1004 * 0.15915493667125701904296875;
    float _1028 = 1.0 / _1018;
    bool _1030 = !_644;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1024);
    bool _1036 = !_640;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = -_136;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[76].x, _626);
    int _1044 = abs(_1032);
    float _1046 = -_136;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[81].x, _956);
    int _1050 = abs(_1038);
    float _1052 = _1026 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = in.m_65.x;
    float _1058 = in.m_65.y;
    float _1060 = in.m_65.z;
    bool _1062 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1070 = _1066 || _1068;
    float _1072 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1034);
    float _1074 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _944);
    float _1076 = _1070 ? _968 : 0.0;
    float _1078 = _576 * _576;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1082 = float(_1044);
    float _1084 = _536 + (-0.5);
    float _1086 = float(_1000);
    float _1088 = _1042;
    float _1090 = _1048;
    if (_1014)
    {
        float _1092 = _1076 * _1028;
        _138 = _1092;
    }
    float _1094 = _138;
    bool _1096 = !_648;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = fma(_856, _898, _982);
    float _1102 = float(_1050);
    float _1104 = _1082 * _1086;
    float _1106 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1108 = float(_778);
    float _1110 = _1104 * (-2.0);
    int _1112 = abs(_1098);
    float _1114 = fma(_1106, _1078, _728);
    float _1116 = _1102 * _1108;
    float _1118 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1120 = fma(_1110, _1058, _1058);
    float _1122 = fma(_748, _1110, _748);
    float _1124 = fma(_1118, _610, -0.5);
    float _1126 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1128 = float(_1112);
    float _1130 = _1116 * (-2.0);
    float _1132 = float(_976);
    float _1134 = fma(_1106, 0.20000000298023223876953125, _726);
    float _1136 = fma(_1122, _1094, _1126);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1140 = fma(_752, _1130, _752);
    float _1142 = _1128 * _1132;
    float _1144 = fma(_1130, _1056, _1056);
    float _1146 = _534 + (-0.5);
    bool _1148 = _1114 != 0.0;
    bool _1150 = isnan(_1114);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = in.m_67.x;
    float _1160 = in.m_67.y;
    float _1162 = in.m_67.z;
    float _1164 = _1142 * (-2.0);
    float _1166 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1144);
    bool _1168 = _1134 == 0.0;
    bool _1170 = !_1156;
    bool _1172 = _1168 && _1170;
    float _1174 = fma(_1072, _1124, _1042);
    float _1176 = fma(_1164, _1060, _1060);
    float _1178 = fma(_750, _1164, _750);
    bool _1180 = _730 == 0.0;
    bool _1182 = _1180 && _1172;
    float _1184 = fma(_1140, _1094, _1166);
    float _1186 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1188 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1190 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1194 = fma(_1178, _1094, _1186);
    float _1196 = fma(_1188, _630, -0.5);
    float _1198 = in.m_69.x;
    float _1200 = in.m_69.y;
    float _1202 = in.m_69.z;
    float _1204 = in.m_69.w;
    float _1206 = _1136 * 0.15915493667125701904296875;
    float _1208 = _1184 * 0.15915493667125701904296875;
    float _1210 = fma(_1074, _1196, _1048);
    float _1212 = _1194 * 0.15915493667125701904296875;
    float _1214 = _1192 * _1190;
    float _1216 = _1206 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1100);
    float _1222 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1224 = _1138;
    float _1226 = _1192;
    float _1228 = _1158;
    float _1230 = _1174;
    if (_1182)
    {
        _1088 = _1158;
    }
    float _1232 = _1088;
    float _1234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1114);
    float _1236 = _1232;
    if (_1182)
    {
        _1224 = _1162;
    }
    float _1238 = _1224;
    float _1240 = _1238;
    if (_1182)
    {
        _1226 = _1232;
    }
    float _1242 = _1226;
    float _1244 = _1206 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1242;
    if (!_1182)
    {
        _1236 = _1158;
    }
    float _1250 = _1236;
    float _1252 = _1234 * _1222;
    if (_1182)
    {
        _1228 = _1238;
    }
    float _1254 = _1228;
    float _1256 = _1254;
    if (!_1182)
    {
        _1240 = _1162;
    }
    float _1258 = _1240;
    if (!_1182)
    {
        float _1260 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1248 = _1260;
    }
    float _1262 = _1248;
    if (_1182)
    {
        _1090 = _1160;
    }
    float _1264 = _1090;
    float _1266 = _1208 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1264;
    if (!_1182)
    {
        float _1272 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1258);
        _1256 = _1272;
    }
    float _1274 = _1256;
    if (_1182)
    {
        _674 = _1264;
    }
    float _1276 = _674;
    float _1278 = _1200 * _1258;
    float _1280 = _1276;
    if (!_1182)
    {
        _1270 = _1160;
    }
    float _1282 = _1270;
    float _1284 = _1202 * _1250;
    float _1286 = _1212 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    if (!_1182)
    {
        float _1290 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1280 = _1290;
    }
    float _1292 = _1280;
    float _1294 = -_1278;
    float _1296 = fma(_1202, _1282, _1294);
    float _1298 = _1198 * _1282;
    float _1300 = _1208 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = _1268 * _1246;
    float _1306 = -_1298;
    float _1308 = fma(_1200, _1250, _1306);
    float _1310 = _698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1312 = _1212 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1268 * _1288;
    float _1318 = _1268 * _1218;
    float _1320 = _1246 * _1288;
    float _1322 = _1316 * _1252;
    float _1324 = _1316 * _1292;
    float _1326 = _1302 * _1218;
    float _1328 = _1302 * _1246;
    float _1330 = _1302 * _1288;
    float _1332 = _1218 * _1288;
    float _1334 = -_1284;
    float _1336 = fma(_1198, _1258, _1334);
    float _1338 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1340 = fma(_1314, _1304, _1326);
    float _1342 = fma(_1314, _1326, _1304);
    float _1344 = -_1252;
    float _1346 = _1314 * _1344;
    float _1348 = _1330 * _1252;
    float _1350 = -_1318;
    float _1352 = fma(_1314, _1328, _1350);
    float _1354 = -_1328;
    float _1356 = fma(_1314, _1318, _1354);
    float _1358 = fma(_1340, _1214, _1322);
    float _1360 = fma(_1320, _1214, _1346);
    float _1362 = fma(_1352, _1214, _1348);
    float _1364 = _1336 * _1204;
    float _1366 = fma(_1356, _828, _1358);
    float _1368 = _1296 * _1204;
    float _1370 = _1308 * _1204;
    float _1372 = fma(_1332, _828, _1360);
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1376 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1378 = fma(_1342, _828, _1362);
    float _1380 = -_1292;
    float _1382 = _1314 * _1380;
    float _1384 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1374);
    float _1386 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1376);
    float _1388 = _1330 * _1292;
    float _1390 = fma(_1320, _1262, _1382);
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1384);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1386);
    float _1396 = fma(_1340, _1262, _1324);
    float _1398 = fma(_1352, _1262, _1388);
    float _1400 = _1392 + _1338;
    float _1402 = _1394 + _1310;
    float _1404 = -_1200;
    float _1406 = _1314 * _1404;
    float _1408 = _1316 * _1200;
    float _1410 = _1330 * _1200;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1414 = _1400 + _1412;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1402 + _1416;
    float _1420 = fma(_1320, _1198, _1406);
    float _1422 = fma(_1340, _1198, _1408);
    float _1424 = _1414 * _1414;
    float _1426 = _1418 * _1418;
    float _1428 = -_1364;
    float _1430 = _1314 * _1428;
    float _1432 = _1316 * _1364;
    float _1434 = fma(_1352, _1198, _1410);
    float _1436 = _1424 + _1426;
    float _1438 = fma(_1320, _1368, _1430);
    float _1440 = _1330 * _1364;
    float _1442 = fma(_1340, _1368, _1432);
    float _1444 = sqrt(_1436);
    float _1446 = fma(_1356, _1202, _1422);
    float _1448 = fma(_1332, _1274, _1390);
    float _1450 = fma(_1356, _1274, _1396);
    float _1452 = fma(_1342, _1274, _1398);
    float _1454 = fma(_1332, _1202, _1420);
    float _1456 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1458 = fma(_1352, _1368, _1440);
    float _1460 = fma(_1342, _1202, _1434);
    float _1462 = fma(_1332, _1370, _1438);
    float _1464 = fma(_1356, _1370, _1442);
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1468 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1470 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1472 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1456);
    float _1474 = fma(_1342, _1370, _1458);
    bool _1476 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1466);
    float _1480 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1468);
    float _1482 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1470);
    float _1484 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1488 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1472);
    float _1490 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1492 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1494 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1486);
    float _1496 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1498 = _1488 + _1490;
    float _1500 = _1488;
    float _1502 = _1490;
    float _1504 = _1424;
    float _1506 = _1426;
    float _1508 = _1402;
    if (!_1476)
    {
        _1500 = _1424;
    }
    float _1510 = _1500;
    float _1512 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1496);
    float _1514 = _1510;
    if (!_1476)
    {
        _1502 = _1400;
    }
    float _1516 = _1502;
    float _1518 = _1516;
    if (!_1476)
    {
        _1504 = _1498;
    }
    float _1520 = _1504;
    bool _1522 = !_1476;
    float _1524 = _1520;
    if (!_1522)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1444 + _1528;
        float _1532 = rsqrt(_1436);
        float _1534 = _1530 * _1526;
        float _1536 = _1498 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1538 = _1534 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = cos(_1544);
        float _1548 = fma(_1542, _1536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1550 = _1532 * _1548;
        float _1552 = _1546 + (-1.0);
        float _1554 = fma(_1414, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = fma(_1418, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1558 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1562 = _1554 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1566 = _1556 + _1564;
        float _1568 = fma(_1498, _1546, _1558);
        float _1570 = _1562 * _1562;
        float _1572 = _1566 * _1566;
        _1524 = _1568;
        _1514 = _1570;
        _1506 = _1572;
        _1518 = _1554;
        _1508 = _1556;
    }
    float _1574 = _1524;
    float _1576 = _1514;
    float _1578 = _1506;
    float _1580 = _1518;
    float _1582 = _1508;
    float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1586 = _1574 + _1584;
    float _1588 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1590 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1592 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1594 = fma(_1586, _1586, _1576);
    float _1596 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1588);
    float _1598 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1590);
    float _1600 = _1594 + _1578;
    float _1602 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1478);
    float _1604 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1592);
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1608 = sqrt(_1600);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1614 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1596);
    float _1616 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1480);
    float _1618 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1512);
    float _1620 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1492);
    float _1622 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1494);
    float _1624 = _930 + 0.5;
    float _1626 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1598);
    float _1628 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1482);
    float _1630 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1632 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = _1022 + 0.5;
    float _1638 = _1174 + 0.5;
    float _1640 = _1210 + 0.5;
    float _1642 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1644 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1604);
    out.m_71.x = _1602;
    out.m_71.y = _1616;
    out.m_71.z = _1628;
    bool _1646 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1648 = isnan(_1608);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1654 = _1650 || _1652;
    out.m_73.x = _1638;
    out.m_73.y = _1624;
    out.m_73.z = _1640;
    out.m_73.w = _1636;
    out.m_75.x = _1630;
    out.m_75.y = _1632;
    out.m_75.z = _1634;
    out.m_75.w = _1642;
    out.m_77.x = _1618;
    out.m_77.y = _1620;
    out.m_77.z = _1622;
    float _1656 = _1616;
    float _1658 = _1618;
    float _1660 = _1582;
    if (!_1654)
    {
        _1230 = 1.0;
    }
    float _1662 = _1230;
    out.m_79.x = _1614;
    out.m_79.y = _1626;
    out.m_79.z = _1644;
    bool _1664 = !_1654;
    float _1666 = _1662;
    if (!_1664)
    {
        bool _1668 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1670 = isnan(_1608);
        bool _1672 = _1668 || _1670;
        bool _1674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1676 = _1672 || _1674;
        if (!_1676)
        {
            float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1680 = _1608 + _1678;
            float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1684 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1682;
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1688 = _1686 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1690 = 1.0 / _1684;
            float _1692 = _1680 * _1690;
            float _1694 = fma(_1692, _1688, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1666 = _1694;
            _1696 = true;
        }
        else
        {
            bool _1698 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1700 = isnan(_1608);
            bool _1702 = _1698 || _1700;
            bool _1704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1706 = _1702 || _1704;
            if (!_1706)
            {
                float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1710 = _1608 + _1708;
                float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1714 = _1712 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1718 = _1716 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1720 = 1.0 / _1714;
                float _1722 = _1710 * _1720;
                float _1724 = fma(_1722, _1718, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1666 = _1724;
                _1696 = true;
            }
            else
            {
                _1666 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1696 = false;
    float _1726 = _1666;
    float _1728 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1730 = _1574 + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1734 = _1580 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1738 = _1582 + _1736;
    float _1740 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1742 = fma(_1734, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1744 = fma(_1738, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1748 = _1740 + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1752 = _1742 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1744 + _1754;
    float _1758 = _1748 * _1748;
    float _1760 = fma(_1752, _1752, _1758);
    float _1762 = fma(_1756, _1756, _1760);
    float _1764 = rsqrt(_1762);
    float _1766 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1768 = _1752 * _1766;
    float _1770 = _1756 * _1766;
    float _1772 = _1768 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 + _1774;
    float _1778 = sqrt(_1776);
    bool _1780 = _1778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = _1778 + _1782;
    float _1786 = _1764;
    float _1788 = _1784;
    float _1790 = _1748;
    float _1792 = _1768;
    if (_1780)
    {
        float _1794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1794;
    }
    float _1796 = _1786;
    if (_1780)
    {
        float _1798 = rsqrt(_1776);
        _1656 = _1798;
    }
    float _1800 = _1656;
    float _1802 = _1800;
    if (_1780)
    {
        float _1804 = _1784 * _1796;
        _1788 = _1804;
    }
    float _1806 = _1788;
    if (_1780)
    {
        float _1808 = _1806 * 0.15915493667125701904296875;
        _1658 = _1808;
    }
    float _1810 = _1658;
    float _1812 = _1756;
    if (_1780)
    {
        float _1814 = _1810 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        _1812 = _1816;
    }
    float _1818 = _1812;
    float _1820 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1822 = precise::max(0.0, _1820);
    float _1824 = _1796;
    float _1826 = _1822;
    if (_1780)
    {
        float _1828 = _1810 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        _1824 = _1830;
    }
    float _1832 = _1824;
    float _1834 = -_1766;
    float _1836 = -_1822;
    float _1838 = fma(_1748, _1834, _1836);
    if (_1780)
    {
        float _1840 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1790 = _1840;
    }
    float _1842 = _1790;
    float _1844 = sqrt(_1762);
    float _1846 = _1842;
    float _1848 = _1818;
    if (_1780)
    {
        float _1850 = fma(_1818, _1842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1852;
    if (!_1780)
    {
        _1848 = _1838;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    float _1860 = _1832;
    if (_1780)
    {
        float _1862 = _1832 + (-1.0);
        _1826 = _1862;
    }
    float _1864 = _1826;
    float _1866 = _1864;
    if (_1780)
    {
        float _1868 = _1800 * _1852;
        _1660 = _1868;
    }
    float _1870 = _1660;
    if (!_1780)
    {
        _1854 = _1772;
    }
    float _1872 = _1854;
    float _1874 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1876 = _1872;
    if (_1780)
    {
        float _1878 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1802 = _1878;
    }
    float _1880 = _1802;
    if (_1780)
    {
        float _1882 = _1768 * _1870;
        _1792 = _1882;
    }
    float _1884 = _1792;
    if (!_1780)
    {
        _1866 = _1770;
    }
    float _1886 = _1866;
    float _1888 = _1886;
    if (_1780)
    {
        float _1890 = _1770 * _1870;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1780)
    {
        float _1894 = fma(_1838, _1832, _1880);
        _1858 = _1894;
    }
    float _1896 = _1858;
    if (_1780)
    {
        float _1898 = _1884 * _1884;
        _1876 = _1898;
    }
    float _1900 = _1876;
    if (!_1780)
    {
        _1860 = _1774;
    }
    float _1902 = _1860;
    float _1904 = _1902;
    if (_1780)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1914 = _1910 + _1908;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1912);
    float _1924 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1926 = rsqrt(_1914);
    float _1928 = -_1920;
    float _1930 = _1928 + 1.0;
    float _1932 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1922);
    float _1934 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1936 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1924);
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1934);
    float _1944 = abs(_1930);
    float _1946 = log2(_1944);
    float _1948 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1950 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1874);
    float _1952 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1942);
    float _1954 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1956 = _1948 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1958 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1950);
    float _1960 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1962 = _1926 * _1884;
    float _1964 = -_1954;
    float _1966 = fma(_1964, _1938, 1.0);
    float _1968 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1970 = _1926 * _1896;
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1976 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1968);
    float _1978 = _1926 * _1892;
    float _1980 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1982 = -_1972;
    float _1984 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1982);
    float _1986 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1976);
    float _1988 = log2(_1966);
    float _1990 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1992 = -_1978;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1984);
    float _1996 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1986);
    float _1998 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1990);
    float _2002 = fma(_1994, -0.5, 0.5);
    float _2004 = fma(_1994, 0.5, 0.5);
    float _2006 = exp2(_1980);
    float _2008 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2010 = _1970 + 1.0;
    float _2012 = fma(_2004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2014 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2016 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2008);
    float _2018 = 1.0 / _1996;
    float _2020 = _1988 * 0.693147182464599609375;
    float _2022 = sqrt(_2002);
    float _2024 = -_1970;
    float _2026 = fma(_2006, _2010, _2024);
    float _2028 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2016);
    float _2030 = fma(_2004, _2012, -0.212114393711090087890625);
    float _2032 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2014);
    float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2036 = fma(_2004, _2030, 1.570728778839111328125);
    float _2038 = _2028 * _2018;
    float _2040 = _2032 * _2018;
    float _2042 = fma(_2026, 0.5, 0.5);
    float _2044 = fma(_2038, 0.5, 0.5);
    float _2046 = fma(_2040, -0.5, 0.5);
    float _2048 = _2022 * 0.636619746685028076171875;
    float3 _5357 = float3(_2044, _2046, _2034);
    float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5357, float3(0.0), isnan(_5357)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5357, float3(0.0), isnan(_5357)), level(0.0)).x;
    float _2052 = -_2036;
    float _2054 = fma(_2048, _2052, 1.0);
    float3 _5373 = float3(_2044, _2046, _2034);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5373, float3(0.0), isnan(_5373)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5373, float3(0.0), isnan(_5373)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _5390 = float2(_2054, _2042);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5390, float2(0.0), isnan(_5390)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5390, float2(0.0), isnan(_5390)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2079 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2081 = _2028 + _1996;
    float _2083 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2077);
    float _2085 = _2081 * 0.5;
    float _2087 = exp2(_2079);
    float _2089 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2083);
    float _2091 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2093 = _1996 * 0.5;
    float _2095 = _2091 + _1996;
    float _2097 = -_2087;
    float _2099 = _2097 + 1.0;
    float _2101 = fma(_2032, -0.5, _2093);
    float _2103 = _2095 * 0.5;
    float _2105 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2028;
    out.gl_Position.y = _2032;
    out.gl_Position.z = _2091;
    out.gl_Position.w = _1996;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = _2085;
    out.m_81.y = _2101;
    out.m_81.z = _2103;
    out.m_81.w = _1996;
    out.m_47.x = _2107;
    float _2109 = _2105 * _2050;
    float _2111 = -_2105;
    float _2113 = _2111 + 1.0;
    float _2115 = _2065 * _2109;
    float _2117 = _2075 * _2109;
    float _2119 = fma(_2071, _2115, _2059);
    float _2121 = fma(_2073, _2115, _2061);
    float _2123 = _2065 * _2113;
    float _2125 = fma(_2065, _2117, _2063);
    out.m_83.x = _2119;
    out.m_83.y = _2121;
    out.m_83.z = _2125;
    out.m_83.w = _2123;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1696 = false;
    bool _472 = false;
    bool _300 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2182 = as_type<float>(_118);
        out.gl_Position.z = _2182;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_49.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = _136;
    if (_132)
    {
        float _140 = float(_102);
        _112 = _140;
    }
    float _142 = _112;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    float _150 = _142;
    if (_148)
    {
        _150 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _152 = _150;
    if (_148)
    {
        out.m_47.x = 0.0;
    }
    if (_148)
    {
        float _154 = _152 * 5.0;
        _120 = as_type<int>(_154);
    }
    int _156 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2252 = as_type<float>(_156);
        out.gl_Position.z = _2252;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _158 = in.m_51.w;
    float _160 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_49.x;
    float _174 = in.m_49.y;
    float _176 = in.m_49.z;
    float _178 = in.m_44.x;
    float _180 = in.m_44.y;
    float _182 = in.m_44.z;
    float _184 = 0.0;
    float _186 = _160;
    if (!_170)
    {
        float _188 = _160 * _160;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = _192;
    if (!_170)
    {
        float _196 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    bool _200 = !_170;
    float _202 = _198;
    if (!_200)
    {
        float _204 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = log2(_204);
        float _208 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _210 = _208 + 1.0;
        float _212 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _214 = _160 * _206;
        float _216 = 1.0 / _210;
        float _218 = _212 * 0.693147182464599609375;
        float _220 = exp2(_214);
        float _222 = 1.0 / _218;
        float _224 = _220 + (-1.0);
        float _226 = -_224;
        float _228 = fma(_226, _222, _160);
        float _230 = _228 * _216;
        float _232 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _202 = _232;
    }
    float _234 = _202;
    bool _236 = !_170;
    if (!_236)
    {
        float _238 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _240 = log2(_238);
        float _242 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _244 = _242 + 1.0;
        float _246 = 1.0 / _244;
        float _248 = _160 * _240;
        float _250 = exp2(_248);
        float _252 = -_250;
        float _254 = _252 + 1.0;
        float _256 = _254 * _246;
        _186 = _256;
    }
    float _258 = _186;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _262 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _264 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _266 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _268 = fma(_258, _172, _262);
    float _270 = fma(_258, _174, _264);
    float _272 = fma(_258, _176, _266);
    float _274 = fma(_268, _158, _178);
    float _276 = fma(_270, _158, _180);
    float _278 = fma(_272, _158, _182);
    bool _280 = !_260;
    float _298;
    if (!_280)
    {
        float _282 = in.m_53.x;
        float _284 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _286 = _282 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _288 = fma(_286, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _290 = _288 * _284;
        float _292 = floor(_290);
        float _294 = -_292;
        float _296 = _290 + _294;
        _298 = _296;
        _300 = true;
    }
    else
    {
        float _302 = float(_102);
        float _304 = 1.0 / _302;
        float _306 = _136 * _304;
        _298 = _306;
    }
    _300 = false;
    float _308 = _298;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = _308 + _310;
    bool _314 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _316 = isnan(_308);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _328 = _308 + _326;
    bool _330 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _332 = isnan(_308);
    bool _334 = _330 || _332;
    bool _336 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _338 = _334 || _336;
    float _340 = float(_338);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _348 = _346 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _350 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _352 = isnan(_308);
    bool _354 = _350 || _352;
    bool _356 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _358 = _354 || _356;
    float _360 = float(_358);
    float _362 = 1.0 / _348;
    float _364 = -_360;
    float _366 = _364 + 1.0;
    bool _368 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _370 = _340 * _366;
    float _372 = -_340;
    float _374 = _372 + 1.0;
    float _376 = 1.0 / _344;
    float _378 = _328 * _362;
    float _380 = _312 * _376;
    float _382 = -_324;
    float _384 = _382 + 1.0;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _360 * _384;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _392;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _396;
    float _400 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _402 = fma(_394, _380, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _404 = fma(_398, _380, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _406 = _400 * _370;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = _402 * _370;
    float _414 = _404 * _370;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = fma(_410, _378, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _412);
    float _428 = fma(_418, _378, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _430 = fma(_422, _378, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _406);
    float _434 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _414);
    float _436 = fma(_428, _390, _426);
    float _438 = fma(_424, _390, _432);
    float _440 = fma(_430, _390, _434);
    float _442 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].x, _436);
    float _444 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].y, _438);
    float _446 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[145].z, _440);
    bool _448 = !_368;
    float _450 = _412;
    int _468;
    float _470;
    if (!_448)
    {
        float _452 = in.m_53.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _136);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _468 = as_type<int>(_460);
        _470 = _466;
        _472 = true;
    }
    else
    {
        float _474 = float(_102);
        float _476 = 1.0 / _474;
        float _478 = _136 * _476;
        _468 = as_type<int>(_476);
        _470 = _478;
    }
    _472 = false;
    int _480 = _468;
    float _482 = _470;
    float _484 = in.m_55.x;
    float _486 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _490 = _488 != 0;
    float _492 = in.m_53.w;
    int _494 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _496 = _494 != 0;
    float _498 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _486);
    int _500 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _502 = _500 != 0;
    float _504 = in.m_55.y;
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _508 = _506 != 0;
    float _510 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _512 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _514 = _512 != 0;
    float _516 = in.m_53.z;
    float _518 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _520 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _510);
    int _522 = _480;
    if (_490)
    {
        float _524 = in.m_53.x;
        _522 = as_type<int>(_524);
    }
    int _526 = _522;
    float _528 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _518);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _530 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _534 = in.m_53.x;
    float _536 = in.m_53.y;
    float _538 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _540 = in.m_51.x;
    float _542 = in.m_51.y;
    float _544 = in.m_51.z;
    float _546 = _484;
    if (!_490)
    {
        _450 = _484;
    }
    float _548 = _450;
    int _550 = 0;
    float _552 = _548;
    if (_496)
    {
        float _554 = -_484;
        float _556 = _554 + 1.0;
        _550 = as_type<int>(_556);
    }
    int _558 = _550;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _560 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _564 = _492 > 0.5;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _568 = 1.0 / _532;
    float _570 = -_504;
    float _572 = _570 + 1.0;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _576 = in.m_57.x;
    float _578 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _580 = log2(_578);
    bool _582 = false;
    int _584 = _526;
    float _586 = _504;
    if (_490)
    {
        bool _588 = as_type<float>(_526) > 0.5;
        _582 = _588;
    }
    bool _590 = _582;
    bool _592 = _590;
    if (_490)
    {
        float _594 = -_484;
        float _596 = _594 + 1.0;
        _584 = as_type<int>(_596);
    }
    int _598 = _584;
    float _600 = _534 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _602 = 0.0;
    if (!_502)
    {
        _602 = _536;
    }
    float _604 = _602;
    float _606 = _604;
    if (_490)
    {
        float _608 = _590 ? as_type<float>(_598) : _484;
        _552 = _608;
    }
    float _610 = _552;
    float _612 = _442 * _540;
    float _614 = in.m_57.w;
    if (_496)
    {
        bool _616 = _516 > 0.5;
        _592 = _616;
    }
    bool _618 = _592;
    float _620 = _536 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _622 = _536 > 0.5;
    float _624 = -_566;
    float _626 = fma(_600, 2.0, _624);
    if (_496)
    {
        float _628 = _618 ? as_type<float>(_558) : _484;
        _546 = _628;
    }
    float _630 = _546;
    float _632 = fma(_620, -2.0, _574);
    int _634 = _622 ? as_type<int>(_572) : as_type<int>(_504);
    float _636 = _444 * _542;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _644 = _642 != 0;
    int _646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _648 = _646 != 0;
    float _650 = _446 * _544;
    float _652 = _516 * 2.0;
    float _654 = 1.0 / _562;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _662 = _650 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _664 = _656 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = floor(_652);
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _670 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _498);
    out.m_59.w = _614;
    float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _636;
    if (_502)
    {
        _606 = _534;
    }
    float _676 = _606;
    float _678 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[76].y, _632);
    float _680 = 1.0 / _660;
    float _682 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _520);
    float _684 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _684;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _698 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _528);
    float _700 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _702 = _696 * _654;
    float _704 = _508 ? as_type<float>(_634) : _504;
    float _706 = _692 * _568;
    bool _708 = _666 >= 0.0;
    bool _710 = isnan(_666);
    bool _712 = _708 || _710;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    out.m_61.x = _664;
    out.m_61.y = _672;
    out.m_61.z = _700;
    float _718 = _536 + _516;
    float _720 = _536 + _534;
    float _722 = _686 * _680;
    float _724 = _716 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _726 = in.m_63.x;
    float _728 = in.m_63.y;
    float _730 = in.m_63.z;
    bool _732 = _666 > 0.0;
    float _734 = _534 + _516;
    float _736 = _534 * 2.0;
    float _738 = _718 + (-1.0);
    float _740 = _734 + (-1.0);
    float _742 = _720 + (-1.0);
    float _744 = _536 * 2.0;
    float _746 = floor(_736);
    float _748 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _750 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _752 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _754 = _724;
    float _756 = _744;
    if (_514)
    {
        float _758 = _564 ? _572 : _504;
        _586 = _758;
    }
    float _760 = _586;
    float _762 = _580 * _136;
    float _764 = floor(_744);
    int _766 = ~as_type<int>(_724);
    int _768 = _766 + 1;
    int _770 = _768 + 1;
    int _772 = _770;
    if (!_732)
    {
        int _774 = ~as_type<int>(_724);
        int _776 = _774 + 1;
        _772 = _776;
    }
    int _778 = _772;
    if (!_502)
    {
        _754 = _516;
    }
    float _780 = _754;
    float _782 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _730);
    float _784 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _786 = _746 > 0.0;
    bool _788 = _746 >= 0.0;
    bool _790 = isnan(_746);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _800 = _482 + _798;
    float _802 = _780;
    if (!_502)
    {
        _756 = _516;
    }
    float _804 = _756;
    float _806 = _516 + (-0.5);
    float _808 = _804;
    if (_502)
    {
        _802 = _536;
    }
    float _810 = _802;
    float _812 = exp2(_762);
    if (_502)
    {
        _808 = _536;
    }
    float _814 = _808;
    bool _816 = _764 > 0.0;
    bool _818 = _764 >= 0.0;
    bool _820 = isnan(_764);
    bool _822 = _818 || _820;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    float _828 = _782 * _662;
    float _830 = fma(_706, _800, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _834 = _482 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _838 = _482 + _836;
    float _840 = _784 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _842 = fma(_702, _834, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _844 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _846 = isnan(_482);
    bool _848 = _844 || _846;
    bool _850 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _852 = _848 || _850;
    float _854 = float(_852);
    float _856 = fma(_722, _838, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _858 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _860 = fma(_840, _704, -0.5);
    bool _862 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _864 = isnan(_482);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_854;
    float _876 = _874 + 1.0;
    bool _878 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _880 = isnan(_482);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _892 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[83].w, _858);
    float _894 = -_872;
    float _896 = _894 + 1.0;
    float _898 = _872 * _876;
    bool _900 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _902 = isnan(_482);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    float _912 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[78].w, _890);
    float _914 = _888 * _896;
    float _916 = -_888;
    float _918 = _916 + 1.0;
    float _920 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].w, _912);
    float _922 = _910 * _918;
    float _924 = -_910;
    float _926 = _924 + 1.0;
    float _928 = -_678;
    float _930 = fma(_920, _860, _928);
    float _932 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _934 = _830 * _922;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _942 = _538 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _944 = fma(_676, (*spvDescriptorSet0.vp_c9)._m0[83].z, _936);
    float _946 = _676 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _948 = fma(_932, -2.0, _938);
    int _950 = _826 ? 0 : 1;
    float _952 = fma(_942, _760, -0.5);
    float _954 = -_940;
    float _956 = fma(_946, 2.0, _954);
    float _958 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[115].x, _934);
    int _960 = ~_950;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = -_812;
    float _968 = _966 + 1.0;
    int _970 = _964;
    if (!_816)
    {
        int _972 = ~_950;
        int _974 = _972 + 1;
        _970 = _974;
    }
    int _976 = _970;
    float _978 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[191].x, _534);
    int _980 = _796 ? 0 : 1;
    float _982 = fma(_842, _914, _958);
    float _984 = _978 + _730;
    int _986 = ~_980;
    int _988 = _986 + 1;
    int _990 = _988 + 1;
    float _992 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].w, _892);
    int _994 = _990;
    if (!_786)
    {
        int _996 = ~_980;
        int _998 = _996 + 1;
        _994 = _998;
    }
    int _1000 = _994;
    float _1002 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[81].y, _948);
    float _1004 = _984 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    bool _1006 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1008 = isnan(1.0);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1014 = _1010 || _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1018 = 1.0 + _1016;
    float _1020 = -_1002;
    float _1022 = fma(_992, _952, _1020);
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1026 = _1004 * 0.15915493667125701904296875;
    float _1028 = 1.0 / _1018;
    bool _1030 = !_644;
    int _1032 = _1030 ? 0 : 1;
    float _1034 = fma(_534, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1024);
    bool _1036 = !_640;
    int _1038 = _1036 ? 0 : 1;
    float _1040 = -_136;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[76].x, _626);
    int _1044 = abs(_1032);
    float _1046 = -_136;
    float _1048 = fma(_1046, (*spvDescriptorSet0.vp_c9)._m0[81].x, _956);
    int _1050 = abs(_1038);
    float _1052 = _1026 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = in.m_65.x;
    float _1058 = in.m_65.y;
    float _1060 = in.m_65.z;
    bool _1062 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1064 = isnan(0.0);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1070 = _1066 || _1068;
    float _1072 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1034);
    float _1074 = fma(_136, (*spvDescriptorSet0.vp_c9)._m0[82].z, _944);
    float _1076 = _1070 ? _968 : 0.0;
    float _1078 = _576 * _576;
    float _1080 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1082 = float(_1044);
    float _1084 = _536 + (-0.5);
    float _1086 = float(_1000);
    float _1088 = _1042;
    float _1090 = _1048;
    if (_1014)
    {
        float _1092 = _1076 * _1028;
        _138 = _1092;
    }
    float _1094 = _138;
    bool _1096 = !_648;
    int _1098 = _1096 ? 0 : 1;
    float _1100 = fma(_856, _898, _982);
    float _1102 = float(_1050);
    float _1104 = _1082 * _1086;
    float _1106 = _1054 * (*spvDescriptorSet0.vp_c9)._m0[191].z;
    float _1108 = float(_778);
    float _1110 = _1104 * (-2.0);
    int _1112 = abs(_1098);
    float _1114 = fma(_1106, _1078, _728);
    float _1116 = _1102 * _1108;
    float _1118 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1120 = fma(_1110, _1058, _1058);
    float _1122 = fma(_748, _1110, _748);
    float _1124 = fma(_1118, _610, -0.5);
    float _1126 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1120);
    float _1128 = float(_1112);
    float _1130 = _1116 * (-2.0);
    float _1132 = float(_976);
    float _1134 = fma(_1106, 0.20000000298023223876953125, _726);
    float _1136 = fma(_1122, _1094, _1126);
    float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1140 = fma(_752, _1130, _752);
    float _1142 = _1128 * _1132;
    float _1144 = fma(_1130, _1056, _1056);
    float _1146 = _534 + (-0.5);
    bool _1148 = _1114 != 0.0;
    bool _1150 = isnan(_1114);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan(0.0);
    bool _1156 = _1152 || _1154;
    float _1158 = in.m_67.x;
    float _1160 = in.m_67.y;
    float _1162 = in.m_67.z;
    float _1164 = _1142 * (-2.0);
    float _1166 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1144);
    bool _1168 = _1134 == 0.0;
    bool _1170 = !_1156;
    bool _1172 = _1168 && _1170;
    float _1174 = fma(_1072, _1124, _1042);
    float _1176 = fma(_1164, _1060, _1060);
    float _1178 = fma(_750, _1164, _750);
    bool _1180 = _730 == 0.0;
    bool _1182 = _1180 && _1172;
    float _1184 = fma(_1140, _1094, _1166);
    float _1186 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1176);
    float _1188 = _1138 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1190 = _612 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1134);
    float _1194 = fma(_1178, _1094, _1186);
    float _1196 = fma(_1188, _630, -0.5);
    float _1198 = in.m_69.x;
    float _1200 = in.m_69.y;
    float _1202 = in.m_69.z;
    float _1204 = in.m_69.w;
    float _1206 = _1136 * 0.15915493667125701904296875;
    float _1208 = _1184 * 0.15915493667125701904296875;
    float _1210 = fma(_1074, _1196, _1048);
    float _1212 = _1194 * 0.15915493667125701904296875;
    float _1214 = _1192 * _1190;
    float _1216 = _1206 * 6.283185482025146484375;
    float _1218 = sin(_1216);
    float _1220 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1100);
    float _1222 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1224 = _1138;
    float _1226 = _1192;
    float _1228 = _1158;
    float _1230 = _1174;
    if (_1182)
    {
        _1088 = _1158;
    }
    float _1232 = _1088;
    float _1234 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1114);
    float _1236 = _1232;
    if (_1182)
    {
        _1224 = _1162;
    }
    float _1238 = _1224;
    float _1240 = _1238;
    if (_1182)
    {
        _1226 = _1232;
    }
    float _1242 = _1226;
    float _1244 = _1206 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1242;
    if (!_1182)
    {
        _1236 = _1158;
    }
    float _1250 = _1236;
    float _1252 = _1234 * _1222;
    if (_1182)
    {
        _1228 = _1238;
    }
    float _1254 = _1228;
    float _1256 = _1254;
    if (!_1182)
    {
        _1240 = _1162;
    }
    float _1258 = _1240;
    if (!_1182)
    {
        float _1260 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1248 = _1260;
    }
    float _1262 = _1248;
    if (_1182)
    {
        _1090 = _1160;
    }
    float _1264 = _1090;
    float _1266 = _1208 * 6.283185482025146484375;
    float _1268 = cos(_1266);
    float _1270 = _1264;
    if (!_1182)
    {
        float _1272 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1258);
        _1256 = _1272;
    }
    float _1274 = _1256;
    if (_1182)
    {
        _674 = _1264;
    }
    float _1276 = _674;
    float _1278 = _1200 * _1258;
    float _1280 = _1276;
    if (!_1182)
    {
        _1270 = _1160;
    }
    float _1282 = _1270;
    float _1284 = _1202 * _1250;
    float _1286 = _1212 * 6.283185482025146484375;
    float _1288 = cos(_1286);
    if (!_1182)
    {
        float _1290 = fma(_1114, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1282);
        _1280 = _1290;
    }
    float _1292 = _1280;
    float _1294 = -_1278;
    float _1296 = fma(_1202, _1282, _1294);
    float _1298 = _1198 * _1282;
    float _1300 = _1208 * 6.283185482025146484375;
    float _1302 = sin(_1300);
    float _1304 = _1268 * _1246;
    float _1306 = -_1298;
    float _1308 = fma(_1200, _1250, _1306);
    float _1310 = _698 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1312 = _1212 * 6.283185482025146484375;
    float _1314 = sin(_1312);
    float _1316 = _1268 * _1288;
    float _1318 = _1268 * _1218;
    float _1320 = _1246 * _1288;
    float _1322 = _1316 * _1252;
    float _1324 = _1316 * _1292;
    float _1326 = _1302 * _1218;
    float _1328 = _1302 * _1246;
    float _1330 = _1302 * _1288;
    float _1332 = _1218 * _1288;
    float _1334 = -_1284;
    float _1336 = fma(_1198, _1258, _1334);
    float _1338 = _682 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1340 = fma(_1314, _1304, _1326);
    float _1342 = fma(_1314, _1326, _1304);
    float _1344 = -_1252;
    float _1346 = _1314 * _1344;
    float _1348 = _1330 * _1252;
    float _1350 = -_1318;
    float _1352 = fma(_1314, _1328, _1350);
    float _1354 = -_1328;
    float _1356 = fma(_1314, _1318, _1354);
    float _1358 = fma(_1340, _1214, _1322);
    float _1360 = fma(_1320, _1214, _1346);
    float _1362 = fma(_1352, _1214, _1348);
    float _1364 = _1336 * _1204;
    float _1366 = fma(_1356, _828, _1358);
    float _1368 = _1296 * _1204;
    float _1370 = _1308 * _1204;
    float _1372 = fma(_1332, _828, _1360);
    float _1374 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1376 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1378 = fma(_1342, _828, _1362);
    float _1380 = -_1292;
    float _1382 = _1314 * _1380;
    float _1384 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1374);
    float _1386 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1376);
    float _1388 = _1330 * _1292;
    float _1390 = fma(_1320, _1262, _1382);
    float _1392 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1384);
    float _1394 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1386);
    float _1396 = fma(_1340, _1262, _1324);
    float _1398 = fma(_1352, _1262, _1388);
    float _1400 = _1392 + _1338;
    float _1402 = _1394 + _1310;
    float _1404 = -_1200;
    float _1406 = _1314 * _1404;
    float _1408 = _1316 * _1200;
    float _1410 = _1330 * _1200;
    float _1412 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1414 = _1400 + _1412;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1418 = _1402 + _1416;
    float _1420 = fma(_1320, _1198, _1406);
    float _1422 = fma(_1340, _1198, _1408);
    float _1424 = _1414 * _1414;
    float _1426 = _1418 * _1418;
    float _1428 = -_1364;
    float _1430 = _1314 * _1428;
    float _1432 = _1316 * _1364;
    float _1434 = fma(_1352, _1198, _1410);
    float _1436 = _1424 + _1426;
    float _1438 = fma(_1320, _1368, _1430);
    float _1440 = _1330 * _1364;
    float _1442 = fma(_1340, _1368, _1432);
    float _1444 = sqrt(_1436);
    float _1446 = fma(_1356, _1202, _1422);
    float _1448 = fma(_1332, _1274, _1390);
    float _1450 = fma(_1356, _1274, _1396);
    float _1452 = fma(_1342, _1274, _1398);
    float _1454 = fma(_1332, _1202, _1420);
    float _1456 = _1366 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1458 = fma(_1352, _1368, _1440);
    float _1460 = fma(_1342, _1202, _1434);
    float _1462 = fma(_1332, _1370, _1438);
    float _1464 = fma(_1356, _1370, _1442);
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1468 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1470 = _1446 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1472 = fma(_1372, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1456);
    float _1474 = fma(_1342, _1370, _1458);
    bool _1476 = _1444 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1478 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1466);
    float _1480 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1468);
    float _1482 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1470);
    float _1484 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1486 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1488 = fma(_1378, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1472);
    float _1490 = _670 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1492 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1484);
    float _1494 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1486);
    float _1496 = _1450 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1498 = _1488 + _1490;
    float _1500 = _1488;
    float _1502 = _1490;
    float _1504 = _1424;
    float _1506 = _1426;
    float _1508 = _1402;
    if (!_1476)
    {
        _1500 = _1424;
    }
    float _1510 = _1500;
    float _1512 = fma(_1448, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1496);
    float _1514 = _1510;
    if (!_1476)
    {
        _1502 = _1400;
    }
    float _1516 = _1502;
    float _1518 = _1516;
    if (!_1476)
    {
        _1504 = _1498;
    }
    float _1520 = _1504;
    bool _1522 = !_1476;
    float _1524 = _1520;
    if (!_1522)
    {
        float _1526 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1528 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1530 = _1444 + _1528;
        float _1532 = rsqrt(_1436);
        float _1534 = _1530 * _1526;
        float _1536 = _1498 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1538 = _1534 * 0.15915493667125701904296875;
        float _1540 = _1538 * 6.283185482025146484375;
        float _1542 = sin(_1540);
        float _1544 = _1538 * 6.283185482025146484375;
        float _1546 = cos(_1544);
        float _1548 = fma(_1542, _1536, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1550 = _1532 * _1548;
        float _1552 = _1546 + (-1.0);
        float _1554 = fma(_1414, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1556 = fma(_1418, _1550, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1558 = _1552 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1560 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1562 = _1554 + _1560;
        float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1566 = _1556 + _1564;
        float _1568 = fma(_1498, _1546, _1558);
        float _1570 = _1562 * _1562;
        float _1572 = _1566 * _1566;
        _1524 = _1568;
        _1514 = _1570;
        _1506 = _1572;
        _1518 = _1554;
        _1508 = _1556;
    }
    float _1574 = _1524;
    float _1576 = _1514;
    float _1578 = _1506;
    float _1580 = _1518;
    float _1582 = _1508;
    float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1586 = _1574 + _1584;
    float _1588 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1590 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1592 = _1464 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1594 = fma(_1586, _1586, _1576);
    float _1596 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1588);
    float _1598 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1590);
    float _1600 = _1594 + _1578;
    float _1602 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1478);
    float _1604 = fma(_1462, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1592);
    float _1606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1608 = sqrt(_1600);
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1614 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1596);
    float _1616 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1480);
    float _1618 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1512);
    float _1620 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1492);
    float _1622 = fma(_1452, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1494);
    float _1624 = _930 + 0.5;
    float _1626 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1598);
    float _1628 = fma(_1460, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1482);
    float _1630 = _1606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1632 = _1610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1634 = _1612 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1636 = _1022 + 0.5;
    float _1638 = _1174 + 0.5;
    float _1640 = _1210 + 0.5;
    float _1642 = _1220 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1644 = fma(_1474, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1604);
    out.m_71.x = _1602;
    out.m_71.y = _1616;
    out.m_71.z = _1628;
    bool _1646 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1648 = isnan(_1608);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1654 = _1650 || _1652;
    out.m_73.x = _1638;
    out.m_73.y = _1624;
    out.m_73.z = _1640;
    out.m_73.w = _1636;
    out.m_75.x = _1630;
    out.m_75.y = _1632;
    out.m_75.z = _1634;
    out.m_75.w = _1642;
    out.m_77.x = _1618;
    out.m_77.y = _1620;
    out.m_77.z = _1622;
    float _1656 = _1616;
    float _1658 = _1618;
    float _1660 = _1582;
    if (!_1654)
    {
        _1230 = 1.0;
    }
    float _1662 = _1230;
    out.m_79.x = _1614;
    out.m_79.y = _1626;
    out.m_79.z = _1644;
    bool _1664 = !_1654;
    float _1666 = _1662;
    if (!_1664)
    {
        bool _1668 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1670 = isnan(_1608);
        bool _1672 = _1668 || _1670;
        bool _1674 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1676 = _1672 || _1674;
        if (!_1676)
        {
            float _1678 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1680 = _1608 + _1678;
            float _1682 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1684 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1682;
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1688 = _1686 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1690 = 1.0 / _1684;
            float _1692 = _1680 * _1690;
            float _1694 = fma(_1692, _1688, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1666 = _1694;
            _1696 = true;
        }
        else
        {
            bool _1698 = _1608 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1700 = isnan(_1608);
            bool _1702 = _1698 || _1700;
            bool _1704 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1706 = _1702 || _1704;
            if (!_1706)
            {
                float _1708 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1710 = _1608 + _1708;
                float _1712 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1714 = _1712 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1718 = _1716 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1720 = 1.0 / _1714;
                float _1722 = _1710 * _1720;
                float _1724 = fma(_1722, _1718, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1666 = _1724;
                _1696 = true;
            }
            else
            {
                _1666 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1696 = false;
    float _1726 = _1666;
    float _1728 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1730 = _1574 + _1728;
    float _1732 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1734 = _1580 + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1738 = _1582 + _1736;
    float _1740 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1742 = fma(_1734, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1744 = fma(_1738, _1726, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1746 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1748 = _1740 + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1752 = _1742 + _1750;
    float _1754 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1756 = _1744 + _1754;
    float _1758 = _1748 * _1748;
    float _1760 = fma(_1752, _1752, _1758);
    float _1762 = fma(_1756, _1756, _1760);
    float _1764 = rsqrt(_1762);
    float _1766 = _1764 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1768 = _1752 * _1766;
    float _1770 = _1756 * _1766;
    float _1772 = _1768 * _1768;
    float _1774 = _1770 * _1770;
    float _1776 = _1772 + _1774;
    float _1778 = sqrt(_1776);
    bool _1780 = _1778 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1784 = _1778 + _1782;
    float _1786 = _1764;
    float _1788 = _1784;
    float _1790 = _1748;
    float _1792 = _1768;
    if (_1780)
    {
        float _1794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1786 = _1794;
    }
    float _1796 = _1786;
    if (_1780)
    {
        float _1798 = rsqrt(_1776);
        _1656 = _1798;
    }
    float _1800 = _1656;
    float _1802 = _1800;
    if (_1780)
    {
        float _1804 = _1784 * _1796;
        _1788 = _1804;
    }
    float _1806 = _1788;
    if (_1780)
    {
        float _1808 = _1806 * 0.15915493667125701904296875;
        _1658 = _1808;
    }
    float _1810 = _1658;
    float _1812 = _1756;
    if (_1780)
    {
        float _1814 = _1810 * 6.283185482025146484375;
        float _1816 = sin(_1814);
        _1812 = _1816;
    }
    float _1818 = _1812;
    float _1820 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1822 = precise::max(0.0, _1820);
    float _1824 = _1796;
    float _1826 = _1822;
    if (_1780)
    {
        float _1828 = _1810 * 6.283185482025146484375;
        float _1830 = cos(_1828);
        _1824 = _1830;
    }
    float _1832 = _1824;
    float _1834 = -_1766;
    float _1836 = -_1822;
    float _1838 = fma(_1748, _1834, _1836);
    if (_1780)
    {
        float _1840 = _1838 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1790 = _1840;
    }
    float _1842 = _1790;
    float _1844 = sqrt(_1762);
    float _1846 = _1842;
    float _1848 = _1818;
    if (_1780)
    {
        float _1850 = fma(_1818, _1842, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1846 = _1850;
    }
    float _1852 = _1846;
    float _1854 = _1852;
    if (!_1780)
    {
        _1848 = _1838;
    }
    float _1856 = _1848;
    float _1858 = _1856;
    float _1860 = _1832;
    if (_1780)
    {
        float _1862 = _1832 + (-1.0);
        _1826 = _1862;
    }
    float _1864 = _1826;
    float _1866 = _1864;
    if (_1780)
    {
        float _1868 = _1800 * _1852;
        _1660 = _1868;
    }
    float _1870 = _1660;
    if (!_1780)
    {
        _1854 = _1772;
    }
    float _1872 = _1854;
    float _1874 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1876 = _1872;
    if (_1780)
    {
        float _1878 = _1864 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1802 = _1878;
    }
    float _1880 = _1802;
    if (_1780)
    {
        float _1882 = _1768 * _1870;
        _1792 = _1882;
    }
    float _1884 = _1792;
    if (!_1780)
    {
        _1866 = _1770;
    }
    float _1886 = _1866;
    float _1888 = _1886;
    if (_1780)
    {
        float _1890 = _1770 * _1870;
        _1888 = _1890;
    }
    float _1892 = _1888;
    if (_1780)
    {
        float _1894 = fma(_1838, _1832, _1880);
        _1858 = _1894;
    }
    float _1896 = _1858;
    if (_1780)
    {
        float _1898 = _1884 * _1884;
        _1876 = _1898;
    }
    float _1900 = _1876;
    if (!_1780)
    {
        _1860 = _1774;
    }
    float _1902 = _1860;
    float _1904 = _1902;
    if (_1780)
    {
        float _1906 = _1892 * _1892;
        _1904 = _1906;
    }
    float _1908 = _1904;
    float _1910 = fma(_1896, _1896, _1900);
    float _1912 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1914 = _1910 + _1908;
    float _1916 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1918 = fma(_1844, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1916);
    float _1920 = precise::clamp(_1918, 0.0, 1.0);
    float _1922 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1912);
    float _1924 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1926 = rsqrt(_1914);
    float _1928 = -_1920;
    float _1930 = _1928 + 1.0;
    float _1932 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1922);
    float _1934 = _1740 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1936 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1924);
    float _1938 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1940 = _1932 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1942 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1934);
    float _1944 = abs(_1930);
    float _1946 = log2(_1944);
    float _1948 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1936);
    float _1950 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1874);
    float _1952 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1942);
    float _1954 = _1940 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1956 = _1948 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1958 = fma(_1744, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1950);
    float _1960 = _1952 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1962 = _1926 * _1884;
    float _1964 = -_1954;
    float _1966 = fma(_1964, _1938, 1.0);
    float _1968 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1970 = _1926 * _1896;
    float _1972 = _1962 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1974 = _1958 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1976 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1968);
    float _1978 = _1926 * _1892;
    float _1980 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1982 = -_1972;
    float _1984 = fma(_1970, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1982);
    float _1986 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1976);
    float _1988 = log2(_1966);
    float _1990 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1992 = -_1978;
    float _1994 = fma(_1992, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1984);
    float _1996 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1986);
    float _1998 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2000 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1990);
    float _2002 = fma(_1994, -0.5, 0.5);
    float _2004 = fma(_1994, 0.5, 0.5);
    float _2006 = exp2(_1980);
    float _2008 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1998);
    float _2010 = _1970 + 1.0;
    float _2012 = fma(_2004, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2014 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2000);
    float _2016 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2008);
    float _2018 = 1.0 / _1996;
    float _2020 = _1988 * 0.693147182464599609375;
    float _2022 = sqrt(_2002);
    float _2024 = -_1970;
    float _2026 = fma(_2006, _2010, _2024);
    float _2028 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2016);
    float _2030 = fma(_2004, _2012, -0.212114393711090087890625);
    float _2032 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2014);
    float _2034 = _2020 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2036 = fma(_2004, _2030, 1.570728778839111328125);
    float _2038 = _2028 * _2018;
    float _2040 = _2032 * _2018;
    float _2042 = fma(_2026, 0.5, 0.5);
    float _2044 = fma(_2038, 0.5, 0.5);
    float _2046 = fma(_2040, -0.5, 0.5);
    float _2048 = _2022 * 0.636619746685028076171875;
    float3 _5357 = float3(_2044, _2046, _2034);
    float _2050 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5357, float3(0.0), isnan(_5357)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5357, float3(0.0), isnan(_5357)), level(0.0)).x;
    float _2052 = -_2036;
    float _2054 = fma(_2048, _2052, 1.0);
    float3 _5373 = float3(_2044, _2046, _2034);
    float4 _2057 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5373, float3(0.0), isnan(_5373)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5373, float3(0.0), isnan(_5373)), level(0.0)).xyzw;
    float _2059 = _2057.x;
    float _2061 = _2057.y;
    float _2063 = _2057.z;
    float _2065 = _2057.w;
    float2 _5390 = float2(_2054, _2042);
    float3 _2069 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5390, float2(0.0), isnan(_5390)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5390, float2(0.0), isnan(_5390)), level(0.0)).xyz;
    float _2071 = _2069.x;
    float _2073 = _2069.y;
    float _2075 = _2069.z;
    float _2077 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2079 = _1946 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2081 = _2028 + _1996;
    float _2083 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2077);
    float _2085 = _2081 * 0.5;
    float _2087 = exp2(_2079);
    float _2089 = fma(_1940, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2083);
    float _2091 = fma(_1974, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2093 = _1996 * 0.5;
    float _2095 = _2091 + _1996;
    float _2097 = -_2087;
    float _2099 = _2097 + 1.0;
    float _2101 = fma(_2032, -0.5, _2093);
    float _2103 = _2095 * 0.5;
    float _2105 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _2028;
    out.gl_Position.y = _2032;
    out.gl_Position.z = _2091;
    out.gl_Position.w = _1996;
    float _2107 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_81.x = _2085;
    out.m_81.y = _2101;
    out.m_81.z = _2103;
    out.m_81.w = _1996;
    out.m_47.x = _2107;
    float _2109 = _2105 * _2050;
    float _2111 = -_2105;
    float _2113 = _2111 + 1.0;
    float _2115 = _2065 * _2109;
    float _2117 = _2075 * _2109;
    float _2119 = fma(_2071, _2115, _2059);
    float _2121 = fma(_2073, _2115, _2061);
    float _2123 = _2065 * _2113;
    float _2125 = fma(_2065, _2117, _2063);
    out.m_83.x = _2119;
    out.m_83.y = _2121;
    out.m_83.z = _2125;
    out.m_83.w = _2123;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

