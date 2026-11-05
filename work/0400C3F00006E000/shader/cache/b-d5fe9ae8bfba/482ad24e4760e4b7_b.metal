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
    float4 m_67 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_69 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_57 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_73 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
    float4 m_53 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1954 = false;
    bool _610 = false;
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2512 = as_type<float>(_120);
        out.gl_Position.z = _2512;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2581 = as_type<float>(_158);
        out.gl_Position.z = _2581;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = 0.0;
    float _186 = _166;
    if (!_176)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _196 = _192;
    if (!_176)
    {
        float _198 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_49.x;
    float _204 = in.m_49.y;
    float _206 = in.m_49.z;
    float _208 = _194 * 6.283185482025146484375;
    float _210 = floor(_194);
    float _212 = _208 * 0.15915493667125701904296875;
    float _214 = _212 * 6.283185482025146484375;
    float _216 = cos(_214);
    float _218 = -_210;
    float _220 = _194 + _218;
    bool _222 = !_176;
    float _224 = _200;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _166 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _166);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_176;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _166 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _186 = _278;
    }
    float _280 = _186;
    float _282 = in.m_53.w;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _290 = _288 != 0;
    float _292 = in.m_44.x;
    float _294 = in.m_44.y;
    float _296 = in.m_44.z;
    float _298 = -_220;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _302 = _220 < 0.5;
    float _304 = float(_302);
    bool _306 = !_286;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_216, 0.5, 0.5);
    bool _312 = !_180;
    int _314 = _312 ? 0 : 1;
    float _316 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = -_304;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _322 = abs(_308);
    float _324 = -_310;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = fma(_280, _202, _316);
    int _330 = abs(_314);
    float _332 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = !_290;
    int _336 = _334 ? 0 : 1;
    float _338 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = fma(_280, _204, _332);
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _344 = fma(_280, _206, _338);
    int _346 = abs(_336);
    float _348 = float(_322);
    float _350 = fma(_328, _282, _292);
    float _352 = float(_330);
    float _354 = fma(_340, _282, _294);
    float _356 = abs(_300);
    float _358 = _348 * _356;
    float _360 = fma(_344, _282, _296);
    float _362 = float(_346);
    float _364 = fma(_352, _326, _358);
    float _366 = abs(_320);
    float _368 = fma(_362, _366, _364);
    bool _370 = !_342;
    bool _372 = _286;
    float _388;
    if (!_370)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _376 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_104);
        float _394 = 1.0 / _392;
        float _396 = _138 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = _398 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _406 = _398 + _404;
    bool _408 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_398);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _426 = _398 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = 1.0 / _422;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _434;
    float _442 = 1.0 / _430;
    float _444 = _402 * _436;
    bool _446 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_398);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -_418;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _462;
    float _466 = _456 * _460;
    float _468 = _406 * _440;
    bool _470 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_398);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_456;
    float _484 = _482 + 1.0;
    bool _486 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_398);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = -_480;
    float _504 = _502 + 1.0;
    float _506 = _480 * _484;
    float _508 = _426 * _442;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _514;
    float _518 = _496 * _504;
    float _520 = fma(_464, _508, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _522 = fma(_512, _508, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = fma(_516, _508, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _530 = -_496;
    float _532 = _530 + 1.0;
    float _534 = _522 * _518;
    float _536 = _524 * _518;
    float _538 = _520 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _544 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _546 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = fma(_542, _468, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _556;
    float _560 = fma(_528, _468, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _564;
    float _568 = fma(_546, _506, _550);
    float _570 = fma(_554, _444, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_558, _444, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _574 = fma(_548, _506, _544);
    float _576 = fma(_566, _444, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _578 = fma(_560, _506, _562);
    float _580 = fma(_570, _466, _568);
    float _582 = fma(_572, _466, _574);
    float _584 = fma(_576, _466, _578);
    float _586 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].x, _580);
    float _588 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].y, _582);
    float _590 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].z, _584);
    bool _592 = !_438;
    float _608;
    if (!_592)
    {
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _596 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_104);
        float _614 = 1.0 / _612;
        float _616 = _138 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_55.x;
    float _622 = in.m_55.y;
    float _624 = in.m_55.z;
    float _626 = in.m_55.w;
    float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _630 = in.m_57.x;
    float _632 = in.m_57.y;
    float _634 = in.m_57.z;
    float _636 = in.m_57.w;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _644 = _642 != 0;
    float _646 = in.m_59.x;
    float _648 = in.m_59.y;
    float _650 = in.m_59.z;
    float _652 = in.m_59.w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = in.m_61.x;
    float _664 = in.m_61.y;
    float _666 = in.m_63.x;
    if (_640)
    {
        bool _668 = _160 > 0.5;
        _372 = _668;
    }
    bool _670 = _372;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _674 = in.m_51.w;
    float _676 = _354 * _622;
    float _678 = 0.0;
    if (_644)
    {
        float _680 = in.m_51.z;
        _678 = _680;
    }
    float _682 = _678;
    float _684 = _354 * _632;
    float _686 = fma(_350, _620, _676);
    float _688 = _354 * _648;
    float _690 = fma(_350, _630, _684);
    float _692 = _160 * 2.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _696 = abs(_662);
    float _698 = abs(_664);
    float _700 = precise::max(_696, _698);
    float _702 = fma(_350, _646, _688);
    float _704 = in.m_63.y;
    bool _706 = _700 >= 16.0;
    int _708 = as_type<int>(_632);
    float _710 = _674;
    float _712 = _666;
    if (_640)
    {
        float _714 = -_666;
        float _716 = _714 + 1.0;
        _708 = as_type<int>(_716);
    }
    int _718 = _708;
    float _720 = floor(_692);
    bool _722 = _674 > 0.5;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _726 = _722;
    if (!_640)
    {
        _710 = _666;
    }
    float _728 = _710;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _728;
    if (_640)
    {
        float _736 = _670 ? as_type<float>(_718) : _666;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = fma(_360, _624, _686);
    float _742 = in.m_51.y;
    float _744 = 1.0 / _732;
    float _746 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _752 = _740 + _626;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _756 = _720 > 0.0;
    float _758 = fma(_360, _634, _690);
    bool _760 = _720 >= 0.0;
    bool _762 = isnan(_720);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _770;
    float _774 = fma(_360, _650, _702);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _618 + _776;
    bool _780 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = isnan(_618);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _772 * _744;
    bool _796 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _798 = isnan(_618);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _810 = -_704;
    float _812 = _810 + 1.0;
    float _814 = fma(_794, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _816 = -_790;
    float _818 = _816 + 1.0;
    out.m_65.x = _746;
    out.m_65.y = _748;
    out.m_65.z = _792;
    out.m_65.w = _672;
    float _820 = _742 * 2.0;
    float _822 = _160 + _742;
    float _824 = _822 + (-1.0);
    float _826 = floor(_820);
    int _828 = _722 ? as_type<int>(_812) : as_type<int>(_704);
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].x);
    float _832 = _704;
    if (_644)
    {
        bool _834 = _682 > 0.5;
        _726 = _834;
    }
    bool _836 = _726;
    float _838 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _840 = _656 ? as_type<float>(_828) : _704;
    bool _842 = _836;
    if (_644)
    {
        float _844 = -_666;
        float _846 = _844 + 1.0;
        _830 = as_type<int>(_846);
    }
    int _848 = _830;
    float _850 = _806 * _818;
    bool _852 = _742 > 0.5;
    float _854 = in.m_51.z;
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_644)
    {
        float _858 = _836 ? as_type<float>(_848) : _666;
        _712 = _858;
    }
    float _860 = _712;
    float _862 = _814 * _850;
    if (_660)
    {
        float _864 = _852 ? _812 : _704;
        _832 = _864;
    }
    float _866 = _832;
    float _868 = -_806;
    float _870 = _868 + 1.0;
    bool _872 = _826 > 0.0;
    float _874 = _774 + _652;
    bool _876 = _826 >= 0.0;
    bool _878 = isnan(_826);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _750 * _808;
    float _888 = _664 * 0.0625;
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[115].x, _862);
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _894 = _662 * 0.0625;
    float _896 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _898 = _706 ? _888 : _664;
    float _900 = _866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _902 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[116].x, _890);
    float _904 = _706 ? _894 : _662;
    float _906 = _896 * _856;
    float _908 = abs(_898);
    bool _910 = _908 != 0.0;
    bool _912 = isnan(_908);
    bool _914 = _910 || _912;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    float _920 = _860 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _924 = _874 + _922;
    float _926 = _854 * 2.0;
    float _928 = _900 * _628;
    float _930 = floor(_926);
    float _932 = abs(_904);
    bool _934 = _932 == 0.0;
    bool _936 = !_918;
    bool _938 = _934 && _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = _920 * _892;
    float _948 = _758 + _636;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _752 + _950;
    float _954 = _924 * _924;
    float _956 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _902 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _964 = _768 ? 0 : 1;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _948 + _966;
    float _970 = fma(_952, _952, _954);
    bool _972 = _930 >= 0.0;
    bool _974 = isnan(_930);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.0);
    bool _980 = _976 || _978;
    float _982 = _924 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _984 = as_type<int>(_982);
    int _986 = _918 ? (-1) : 0;
    float _988 = _904;
    if (_938)
    {
        bool _990 = as_type<int>(_904) >= 0;
        _842 = _990;
    }
    bool _992 = _842;
    float _994 = _742 + _854;
    out.m_67.x = _956;
    out.m_67.y = _958;
    out.m_67.z = _960;
    out.m_67.w = _962;
    float _996 = fma(_968, _968, _970);
    float _998 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[28].x, _982);
    if (_938)
    {
        int _1000 = _992 ? 0 : 1078530011;
        _984 = _1000;
    }
    int _1002 = _984;
    out.m_69.x = _886;
    out.m_69.y = _928;
    out.m_69.z = _946;
    out.m_69.w = _906;
    bool _1004 = _930 > 0.0;
    float _1006 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _998);
    int _1008 = _980 ? 0 : 1;
    float _1010 = _994 + (-1.0);
    float _1012 = abs(_904);
    bool _1014 = _1012 == 0.0;
    float _1016 = rsqrt(_996);
    int _1018 = _884 ? 0 : 1;
    int _1020 = ~_1018;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = ~_964;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1034 = ~_1008;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    int _1040 = _1024;
    int _1042 = _1030;
    int _1044 = _1038;
    int _1046 = _1018;
    if (!_872)
    {
        int _1048 = ~_1018;
        int _1050 = _1048 + 1;
        _1040 = _1050;
    }
    int _1052 = _1040;
    bool _1054 = _1006 >= 0.0;
    if (!_756)
    {
        int _1056 = ~_964;
        int _1058 = _1056 + 1;
        _1042 = _1058;
    }
    int _1060 = _1042;
    if (!_1004)
    {
        int _1062 = ~_1008;
        int _1064 = _1062 + 1;
        _1044 = _1064;
    }
    int _1066 = _1044;
    if (_938)
    {
        int _1068 = int(0x80000000) & as_type<int>(_898);
        int _1070 = _1002 | _1068;
        _1046 = _1070;
    }
    int _1072 = _1046;
    bool _1074 = !_918;
    bool _1076 = _1074 && _1014;
    int _1078 = _1072;
    float _1080 = as_type<float>(_1072);
    if (!_1076)
    {
        float _1082 = abs(_898);
        bool _1084 = _1082 != as_type<float>(0x7f800000u /* inf */);
        bool _1086 = isnan(_1082);
        bool _1088 = _1084 || _1086;
        bool _1090 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1092 = _1088 || _1090;
        float _1094 = abs(_904);
        bool _1096 = _1094 == as_type<float>(0x7f800000u /* inf */);
        float _1098 = abs(_904);
        bool _1100 = _1098 == as_type<float>(0x7f800000u /* inf */);
        bool _1102 = !_1092;
        bool _1104 = _1100 && _1102;
        if (_1104)
        {
            bool _1106 = as_type<int>(_904) >= 0;
            _986 = _1106 ? (-1) : 0;
        }
        int _1108 = _986;
        if (_1104)
        {
            _1078 = 1075235812;
        }
        int _1110 = _1078;
        int _1112 = _1110;
        if (_1104)
        {
            int _1114 = ~_1108;
            int _1116 = (_1114 != 0) ? _1110 : 1061752795;
            _1112 = _1116;
        }
        int _1118 = _1112;
        float _1120 = as_type<float>(_1118);
        if (_1104)
        {
            int _1122 = int(0x80000000) & as_type<int>(_898);
            int _1124 = _1118 | _1122;
            _1120 = as_type<float>(_1124);
        }
        float _1126 = _1120;
        bool _1128 = !_1092;
        bool _1130 = _1128 && _1096;
        _1080 = _1126;
        if (!_1130)
        {
            float _1132 = abs(_898);
            float _1134 = abs(_904);
            float _1136 = precise::max(_1132, _1134);
            float _1138 = abs(_898);
            float _1140 = abs(_904);
            float _1142 = precise::min(_1138, _1140);
            float _1144 = 1.0 / _1136;
            float _1146 = abs(_898);
            float _1148 = abs(_904);
            bool _1150 = _1146 > _1148;
            bool _1152 = as_type<int>(_904) >= 0;
            float _1154 = _1142 * _1144;
            float _1156 = _1154 * _1154;
            float _1158 = _1156 + 11.33538818359375;
            float _1160 = fma(_1156, _1158, 28.84246826171875);
            float _1162 = fma(_1156, _1160, 19.6966705322265625);
            float _1164 = fma(_1156, -0.82336294651031494140625, -5.674867153167724609375);
            float _1166 = fma(_1156, _1164, -6.565555095672607421875);
            float _1168 = 1.0 / _1162;
            float _1170 = _1156 * _1166;
            float _1172 = abs(_898);
            float _1174 = abs(_904);
            float _1176 = _1172 + _1174;
            int _1178 = as_type<int>(_898) & int(0x80000000);
            float _1180 = _1154 * _1170;
            bool _1182 = _1176 > as_type<float>(0x7f800000u /* inf */);
            bool _1184 = isnan(_1176);
            bool _1186 = _1182 || _1184;
            bool _1188 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1190 = _1186 || _1188;
            float _1192 = fma(_1180, _1168, _1154);
            float _1194 = _1192;
            _1080 = _1176;
            if (_1150)
            {
                float _1196 = -_1192;
                float _1198 = _1196 + 1.57079637050628662109375;
                _1194 = _1198;
            }
            float _1200 = _1194;
            int _1202 = as_type<int>(_1200);
            if (!_1152)
            {
                float _1204 = -_1200;
                float _1206 = _1204 + 3.1415927410125732421875;
                _1202 = as_type<int>(_1206);
            }
            int _1208 = _1202;
            if (!_1190)
            {
                int _1210 = _1178 | _1208;
                _1080 = as_type<float>(_1210);
            }
        }
    }
    float _1212 = _1080;
    float _1214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1216 = log2(_1214);
    float _1218 = _924 * _1016;
    float _1220 = _952 * _1016;
    if (_1054)
    {
        _988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1222 = _988;
    float _1224 = -_1218;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1228 = -_1220;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>(_1222);
    if (_1054)
    {
        float _1246 = _1222 * 5.0;
        _1244 = as_type<int>(_1246);
    }
    int _1248 = _1244;
    float _1250 = _1226 * _1226;
    float _1252 = _968 * _1016;
    float _1254 = precise::max(_1212, -3.1415927410125732421875);
    if (_1054)
    {
        out.m_47.x = 0.0;
    }
    float _1256 = fma(_1230, _1230, _1250);
    float _1258 = -_1252;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1262 = _1216 * _138;
    float _1264 = precise::min(_1254, 3.1415927410125732421875);
    float _1266 = fma(_1260, _1260, _1256);
    if (_1054)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4303 = as_type<float>(_1248);
        out.gl_Position.z = _4303;
    }
    bool _1268 = !_1234;
    int _1270 = _1268 ? 0 : 1;
    float _1272 = fma(_1264, 0.15915493667125701904296875, 0.5);
    float _1274 = in.m_71.x;
    float _1276 = in.m_71.y;
    float _1278 = in.m_71.z;
    float _1280 = exp2(_1262);
    bool _1282 = !_1238;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = fma(_138, 0.06666667759418487548828125, _1272);
    int _1288 = abs(_1270);
    float _1290 = _1286 * 6.283185482025146484375;
    bool _1292 = !_1242;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = sqrt(_1266);
    int _1298 = abs(_1284);
    bool _1300 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1302 = isnan(1.0);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1308 = _1304 || _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1312 = 1.0 + _1310;
    float _1314 = float(_1066);
    float _1316 = 1.0 / _1312;
    int _1318 = abs(_1294);
    float _1320 = -_1280;
    float _1322 = _1320 + 1.0;
    float _1324 = float(_1288);
    float _1326 = float(_1060);
    float _1328 = _1324 * _1314;
    float _1330 = float(_1298);
    float _1332 = float(_1052);
    float _1334 = _1328 * (-2.0);
    float _1336 = float(_1318);
    float _1338 = _1330 * _1326;
    bool _1340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1334, _1274, _1274);
    float _1352 = fma(_838, _1334, _838);
    float _1354 = _1336 * _1332;
    float _1356 = _1348 ? _1322 : 0.0;
    float _1358 = _1338 * (-2.0);
    float _1360 = _160 + (-0.5);
    if (_1308)
    {
        float _1362 = _1356 * _1316;
        _142 = _1362;
    }
    float _1364 = _142;
    float _1366 = fma(_1032, _1358, _1032);
    float _1368 = fma(_1358, _1276, _1276);
    float _1370 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1350);
    if (_1054)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1372 = -_1218;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _1376 = -_1220;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _1380 = fma(_1352, _1364, _1370);
    float _1382 = -_1252;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _948);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1388 = _1374 + _1386;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1392 = _1378 + _1390;
    float _1394 = _742 + (-0.5);
    float _1396 = _1290 * 0.15915493667125701904296875;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1400 = _1380 * 0.15915493667125701904296875;
    float _1402 = _160 + _854;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1406 = _1384 + _1404;
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1398);
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1368);
    float _1412 = _1402 + (-1.0);
    float _1414 = _1354 * (-2.0);
    float _1416 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1408);
    float _1418 = fma(_1366, _1364, _1410);
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1422 = fma(_1414, _1278, _1278);
    float _1424 = _854 + (-0.5);
    bool _1426 = _1416 >= 0.0;
    float _1428 = fma(_1420, _1414, _1420);
    float _1430 = _1418 * 0.15915493667125701904296875;
    float _1432 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1422);
    float _1434 = in.m_53.x;
    float _1436 = in.m_53.y;
    float _1438 = in.m_53.z;
    float _1440 = _1400 * 6.283185482025146484375;
    float _1442 = sin(_1440);
    float _1444 = fma(_1428, _1364, _1432);
    float _1446 = in.m_61.z;
    float _1448 = _1444 * 0.15915493667125701904296875;
    float _1450 = _1400 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = _1418;
    if (_1426)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    int _1458 = as_type<int>(_1456);
    if (_1426)
    {
        out.m_47.x = 0.0;
    }
    if (_1426)
    {
        float _1460 = _1456 * 5.0;
        _1458 = as_type<int>(_1460);
    }
    int _1462 = _1458;
    float _1464 = _1396 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    if (_1426)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4600 = as_type<float>(_1462);
        out.gl_Position.z = _4600;
    }
    float _1468 = _1430 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    float _1472 = _1430 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1448 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    if (_1426)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1480 = _1448 * 6.283185482025146484375;
    float _1482 = cos(_1480);
    float _1484 = _588 * _1436;
    float _1486 = _586 * _1434;
    float _1488 = fma(_1466, 0.5, 1.5);
    float _1490 = _590 * _1438;
    float _1492 = _1016 * _1296;
    float _1494 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1496 = _1488 * _662;
    float _1498 = _1488 * _664;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1502 = _1488 * _1446;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1496);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1498);
    float _1510 = _1492 * _1494;
    float _1512 = _1492 * _1500;
    float _1514 = _1452 * _1482;
    float _1516 = _1492 * _1504;
    float _1518 = _1442 * _1470;
    float _1520 = _1452 * _1474;
    float _1522 = _1452 * _1470;
    float _1524 = _1442 * _1474;
    float _1526 = _1506 * _1510;
    float _1528 = _1508 * _1512;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1532 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1534 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1536 = fma(_1478, _1520, _1518);
    float _1538 = -_1522;
    float _1540 = fma(_1478, _1524, _1538);
    float _1542 = fma(_1478, _1518, _1520);
    float _1544 = -_1524;
    float _1546 = fma(_1478, _1522, _1544);
    float _1548 = -_1478;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1530);
    float _1552 = -_1478;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1532);
    float _1556 = -_1478;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1534);
    float _1560 = _1474 * _1482;
    float _1562 = -_1528;
    float _1564 = _1478 * _1562;
    float _1566 = _1442 * _1482;
    float _1568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1502);
    float _1570 = _1514 * _1528;
    float _1572 = _1470 * _1482;
    float _1574 = fma(_1560, _1526, _1564);
    float _1576 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1578 = _1566 * _1528;
    float _1580 = _1568 * _1516;
    float _1582 = fma(_1536, _1526, _1570);
    float _1584 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1576);
    float _1586 = fma(_1540, _1526, _1578);
    float _1588 = fma(_1572, _1580, _1574);
    float _1590 = fma(_1546, _1580, _1582);
    float _1592 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1584);
    float _1594 = fma(_1542, _1580, _1586);
    float _1596 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1600 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1610 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1612 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1598);
    float _1614 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1616 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1618 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    float _1620 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1608);
    float _1622 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1614);
    float _1624 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1626 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1618);
    float _1628 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1620);
    float _1630 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1550);
    float _1632 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1554);
    float _1634 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1558);
    float _1636 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1638 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1640 = in.m_73.x;
    float _1642 = in.m_73.y;
    float _1644 = in.m_73.z;
    bool _1646 = _1498 != 0.0;
    bool _1648 = isnan(_1498);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    float _1656 = _752 + _1636;
    float _1658 = _948 + _1638;
    float _1660 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1600);
    bool _1662 = _1496 == 0.0;
    bool _1664 = !_1654;
    bool _1666 = _1662 && _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1656 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1674 = _1658 + _1672;
    float _1676 = in.m_75.x;
    float _1678 = in.m_75.y;
    float _1680 = in.m_75.z;
    float _1682 = in.m_75.w;
    bool _1684 = _1502 == 0.0;
    bool _1686 = _1684 && _1666;
    float _1688 = _1670 * _1670;
    float _1690 = _1674 * _1674;
    float _1692 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1694 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1612);
    float _1696 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1660);
    float _1698 = _1688 + _1690;
    float _1700 = sqrt(_1698);
    float _1702 = _1636;
    float _1704 = _1506;
    float _1706 = _1624;
    float _1708 = _1688;
    float _1710 = _1690;
    float _1712 = _1656;
    float _1714 = _1658;
    float _1716 = _1592;
    if (_1686)
    {
        _1702 = _1644;
    }
    float _1718 = _1702;
    float _1720 = _1718;
    if (!_1686)
    {
        float _1722 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1720 = _1722;
    }
    float _1724 = _1720;
    float _1726 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1686)
    {
        _1704 = _1640;
    }
    float _1728 = _1704;
    float _1730 = _1728;
    if (!_1686)
    {
        float _1732 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1640);
        _1730 = _1732;
    }
    float _1734 = _1730;
    if (_1686)
    {
        _1706 = _1642;
    }
    float _1736 = _1706;
    float _1738 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1726);
    float _1740 = _1736;
    if (!_1686)
    {
        float _1742 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1642);
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = _1630 * _1678;
    float _1748 = _1632 * _1678;
    float _1750 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1738);
    bool _1752 = _1700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1634 * _1678;
    float _1756 = fma(_1626, _1676, _1746);
    float _1758 = _1680 * _1640;
    float _1760 = _1676 * _1642;
    float _1762 = _1678 * _1644;
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1766 = fma(_1592, _1676, _1748);
    float _1768 = fma(_1628, _1676, _1754);
    float _1770 = -_1758;
    float _1772 = fma(_1676, _1644, _1770);
    float _1774 = -_1760;
    float _1776 = fma(_1678, _1640, _1774);
    float _1778 = -_1762;
    float _1780 = fma(_1680, _1642, _1778);
    float _1782 = _874 + _1764;
    float _1784 = _1772 * _1682;
    float _1786 = _1776 * _1682;
    float _1788 = _1780 * _1682;
    float _1790 = fma(_1692, _1680, _1756);
    float _1792 = fma(_1694, _1680, _1766);
    float _1794 = fma(_1696, _1680, _1768);
    float _1796 = _1682;
    if (!_1752)
    {
        _1796 = _1782;
    }
    float _1798 = _1796;
    bool _1800 = !_1752;
    float _1802 = _1798;
    if (!_1800)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1808 = _1700 + _1806;
        float _1810 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = rsqrt(_1698);
        float _1814 = _1808 * _1804;
        float _1816 = _1814 * 0.15915493667125701904296875;
        float _1818 = _1816 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = fma(_1820, _1810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1828 = _1812 * _1826;
        float _1830 = fma(_1670, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1832 = _1824 + (-1.0);
        float _1834 = fma(_1674, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1838 = _1830 + _1836;
        float _1840 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1844 = _1834 + _1842;
        float _1846 = _1838 * _1838;
        float _1848 = fma(_1782, _1824, _1840);
        float _1850 = _1844 * _1844;
        _1802 = _1848;
        _1708 = _1846;
        _1710 = _1850;
        _1712 = _1830;
        _1714 = _1834;
    }
    float _1852 = _1802;
    float _1854 = _1708;
    float _1856 = _1710;
    float _1858 = _1712;
    float _1860 = _1714;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1864 = _1852 + _1862;
    float _1866 = _1630 * _1744;
    float _1868 = _1632 * _1744;
    float _1870 = _1634 * _1744;
    float _1872 = fma(_1864, _1864, _1854);
    float _1874 = _1784 * _1630;
    float _1876 = _1784 * _1632;
    float _1878 = _1784 * _1634;
    float _1880 = _1872 + _1856;
    float _1882 = fma(_1626, _1734, _1866);
    float _1884 = fma(_1592, _1734, _1868);
    float _1886 = fma(_1628, _1734, _1870);
    float _1888 = fma(_1788, _1626, _1874);
    float _1890 = fma(_1788, _1592, _1876);
    float _1892 = sqrt(_1880);
    float _1894 = fma(_1788, _1628, _1878);
    float _1896 = fma(_1692, _1724, _1882);
    float _1898 = fma(_1694, _1724, _1884);
    float _1900 = fma(_1696, _1724, _1886);
    float _1902 = fma(_1786, _1692, _1888);
    float _1904 = fma(_1786, _1694, _1890);
    float _1906 = fma(_1786, _1696, _1894);
    out.m_77.x = _1790;
    out.m_77.y = _1792;
    out.m_77.z = _1794;
    out.m_79.x = _1896;
    out.m_79.y = _1898;
    out.m_79.z = _1900;
    out.m_81.x = _1902;
    out.m_81.y = _1904;
    out.m_81.z = _1906;
    bool _1908 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1910 = isnan(_1892);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1916 = _1912 || _1914;
    float _1918 = _1904;
    if (!_1916)
    {
        _1716 = 1.0;
    }
    float _1920 = _1716;
    bool _1922 = !_1916;
    float _1924 = _1920;
    if (!_1922)
    {
        bool _1926 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1928 = isnan(_1892);
        bool _1930 = _1926 || _1928;
        bool _1932 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1934 = _1930 || _1932;
        if (!_1934)
        {
            float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1938 = _1892 + _1936;
            float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1942 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1940;
            float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1946 = _1944 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1948 = 1.0 / _1942;
            float _1950 = _1938 * _1948;
            float _1952 = fma(_1950, _1946, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1924 = _1952;
            _1954 = true;
        }
        else
        {
            bool _1956 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1958 = isnan(_1892);
            bool _1960 = _1956 || _1958;
            bool _1962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1964 = _1960 || _1962;
            if (!_1964)
            {
                float _1966 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1968 = _1892 + _1966;
                float _1970 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1972 = _1970 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1974 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1976 = _1974 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1978 = 1.0 / _1972;
                float _1980 = _1968 * _1978;
                float _1982 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1924 = _1982;
                _1954 = true;
            }
            else
            {
                _1924 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1954 = false;
    float _1984 = _1924;
    float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1988 = _1858 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1992 = _1852 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1996 = _1860 + _1994;
    bool _1998 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan(0.5);
    bool _2006 = _2002 || _2004;
    float _2008 = fma(_1988, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2010 = fma(_1992, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2012 = fma(_1996, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2014 = -_1220;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2008);
    float _2018 = -_1218;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2010);
    float _2022 = -_1252;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2012);
    float _2026 = _2020;
    float _2028 = _2016;
    float _2030 = _2024;
    if (!_2006)
    {
        float _2032 = _1388 * _1388;
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2036 = -_752;
        float _2038 = _2036 + _2008;
        float _2040 = -_948;
        float _2042 = _2040 + _2012;
        float _2044 = fma(_1392, _1392, _2032);
        float _2046 = fma(_1406, _1406, _2044);
        float _2048 = 1.0 / _1492;
        float _2050 = sqrt(_2046);
        float _2052 = precise::min(_2050, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2054 = _2052 * _2034;
        float _2056 = -_874;
        float _2058 = _2056 + _2010;
        float _2060 = _2054 * _2048;
        float _2062 = fma(_2038, _2060, _1378);
        float _2064 = fma(_2058, _2060, _1374);
        float _2066 = fma(_2042, _2060, _1384);
        _2026 = _2064;
        _2028 = _2062;
        _2030 = _2066;
    }
    float _2068 = _2026;
    float _2070 = _2028;
    float _2072 = _2030;
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2076 = _2068 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _2070 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _2072 + _2082;
    float _2086 = _2076 * _2076;
    float _2088 = fma(_2080, _2080, _2086);
    float _2090 = fma(_2084, _2084, _2088);
    float _2092 = rsqrt(_2090);
    float _2094 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2096 = _2080 * _2094;
    float _2098 = _2084 * _2094;
    float _2100 = _2096 * _2096;
    float _2102 = _2098 * _2098;
    float _2104 = _2100 + _2102;
    float _2106 = sqrt(_2104);
    bool _2108 = _2106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2112 = _2106 + _2110;
    float _2114 = _2092;
    float _2116 = _2104;
    float _2118 = _2112;
    float _2120 = _2076;
    float _2122 = _2094;
    float _2124 = _2096;
    if (_2108)
    {
        float _2126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2126;
    }
    float _2128 = _2114;
    if (_2108)
    {
        float _2130 = rsqrt(_2104);
        _2116 = _2130;
    }
    float _2132 = _2116;
    if (_2108)
    {
        float _2134 = _2112 * _2128;
        _2118 = _2134;
    }
    float _2136 = _2118;
    if (_2108)
    {
        float _2138 = _2136 * 0.15915493667125701904296875;
        _1918 = _2138;
    }
    float _2140 = _1918;
    float _2142 = _2128;
    float _2144 = _2140;
    if (_2108)
    {
        float _2146 = _2140 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2154 = precise::max(0.0, _2152);
    float _2156 = _2084;
    float _2158 = _2154;
    if (_2108)
    {
        float _2160 = _2140 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = -_2094;
    float _2168 = -_2154;
    float _2170 = fma(_2076, _2166, _2168);
    float _2172 = _2170;
    if (!_2108)
    {
        _2120 = _2100;
    }
    float _2174 = _2120;
    float _2176 = _2174;
    if (_2108)
    {
        float _2178 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2158 = _2178;
    }
    float _2180 = _2158;
    float _2182 = _2150;
    float _2184 = _2180;
    if (_2108)
    {
        float _2186 = fma(_2150, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2192 = _2188;
    if (_2108)
    {
        float _2194 = _2164 + (-1.0);
        _2184 = _2194;
    }
    float _2196 = _2184;
    float _2198 = _2196;
    if (_2108)
    {
        float _2200 = _2132 * _2188;
        _2122 = _2200;
    }
    float _2202 = _2122;
    if (!_2108)
    {
        _2192 = _2098;
    }
    float _2204 = _2192;
    float _2206 = sqrt(_2090);
    float _2208 = _2204;
    if (_2108)
    {
        float _2210 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2210;
    }
    float _2212 = _2144;
    if (_2108)
    {
        float _2214 = _2096 * _2202;
        _2124 = _2214;
    }
    float _2216 = _2124;
    if (_2108)
    {
        float _2218 = _2098 * _2202;
        _2208 = _2218;
    }
    float _2220 = _2208;
    if (!_2108)
    {
        _2198 = _2102;
    }
    float _2222 = _2198;
    float _2224 = _2222;
    if (_2108)
    {
        float _2226 = fma(_2170, _2164, _2212);
        _2172 = _2226;
    }
    float _2228 = _2172;
    if (_2108)
    {
        float _2230 = _2216 * _2216;
        _2176 = _2230;
    }
    float _2232 = _2176;
    if (_2108)
    {
        float _2234 = _2220 * _2220;
        _2224 = _2234;
    }
    float _2236 = _2224;
    float _2238 = fma(_2228, _2228, _2232);
    float _2240 = _2238 + _2236;
    float _2242 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2246 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2244);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = rsqrt(_2240);
    float _2252 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2242);
    float _2254 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2256 = -_2248;
    float _2258 = _2256 + 1.0;
    float _2260 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2252);
    float _2262 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2264 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2254);
    float _2266 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2270 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2262);
    float _2272 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2264);
    float _2274 = abs(_2258);
    float _2276 = log2(_2274);
    float _2278 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2266);
    float _2280 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2270);
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2278);
    float _2288 = _2250 * _2216;
    float _2290 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2294 = -_2284;
    float _2296 = fma(_2294, _2190, 1.0);
    float _2298 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2300 = _2250 * _2228;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2304 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2292);
    float _2306 = _2250 * _2220;
    float _2308 = log2(_2296);
    float _2310 = -_2302;
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2310);
    float _2314 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2304);
    float _2316 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2318 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2320 = -_2306;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2312);
    float _2324 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2314);
    float _2326 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2328 = exp2(_2316);
    float _2330 = fma(_2322, -0.5, 0.5);
    float _2332 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2318);
    float _2334 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2326);
    float _2336 = _2300 + 1.0;
    float _2338 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2332);
    float _2340 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2334);
    float _2342 = 1.0 / _2324;
    float _2344 = fma(_2322, 0.5, 0.5);
    float _2346 = _2308 * 0.693147182464599609375;
    float _2348 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2340);
    float _2350 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2338);
    float _2352 = fma(_2344, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2354 = sqrt(_2330);
    float _2356 = -_2300;
    float _2358 = fma(_2328, _2336, _2356);
    float _2360 = fma(_2344, _2352, -0.212114393711090087890625);
    float _2362 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2364 = fma(_2344, _2360, 1.570728778839111328125);
    float _2366 = _2348 * _2342;
    float _2368 = _2350 * _2342;
    float _2370 = fma(_2366, 0.5, 0.5);
    float _2372 = fma(_2368, -0.5, 0.5);
    float _2374 = fma(_2358, 0.5, 0.5);
    float _2376 = _2354 * 0.636619746685028076171875;
    float3 _6128 = float3(_2370, _2372, _2362);
    float _2378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6128, float3(0.0), isnan(_6128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6128, float3(0.0), isnan(_6128)), level(0.0)).x;
    float3 _6139 = float3(_2370, _2372, _2362);
    float4 _2381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6139, float3(0.0), isnan(_6139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6139, float3(0.0), isnan(_6139)), level(0.0)).xyzw;
    float _2383 = _2381.x;
    float _2385 = _2381.y;
    float _2387 = _2381.z;
    float _2389 = _2381.w;
    float _2391 = -_2364;
    float _2393 = fma(_2376, _2391, 1.0);
    float2 _6161 = float2(_2393, _2374);
    float3 _2397 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6161, float2(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6161, float2(0.0), isnan(_6161)), level(0.0)).xyz;
    float _2399 = _2397.x;
    float _2401 = _2397.y;
    float _2403 = _2397.z;
    float _2405 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2407 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2409 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2411 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2407);
    float _2413 = exp2(_2405);
    float _2415 = _2409 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2411);
    float _2419 = _2348 + _2324;
    float _2421 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2417);
    float _2423 = _2419 * 0.5;
    float _2425 = _2324 * 0.5;
    out.m_47.x = _2415;
    float _2427 = _2421 + _2324;
    out.gl_Position.x = _2348;
    out.gl_Position.y = _2350;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _2324;
    float _2429 = _2427 * 0.5;
    float _2431 = -_2413;
    float _2433 = _2431 + 1.0;
    float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2437 = fma(_2350, -0.5, _2425);
    out.m_83.x = _2423;
    out.m_83.y = _2437;
    out.m_83.z = _2429;
    out.m_83.w = _2324;
    float _2439 = _2435 * _2378;
    float _2441 = -_2435;
    float _2443 = _2441 + 1.0;
    float _2445 = _2389 * _2439;
    float _2447 = _2403 * _2439;
    float _2449 = fma(_2399, _2445, _2383);
    float _2451 = fma(_2401, _2445, _2385);
    float _2453 = _2389 * _2443;
    float _2455 = fma(_2389, _2447, _2387);
    out.m_85.x = _2449;
    out.m_85.y = _2451;
    out.m_85.z = _2455;
    out.m_85.w = _2453;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1954 = false;
    bool _610 = false;
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2512 = as_type<float>(_120);
        out.gl_Position.z = _2512;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2581 = as_type<float>(_158);
        out.gl_Position.z = _2581;
    }
    if (_152)
    {
        return out;
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = 0.0;
    float _186 = _166;
    if (!_176)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _196 = _192;
    if (!_176)
    {
        float _198 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_49.x;
    float _204 = in.m_49.y;
    float _206 = in.m_49.z;
    float _208 = _194 * 6.283185482025146484375;
    float _210 = floor(_194);
    float _212 = _208 * 0.15915493667125701904296875;
    float _214 = _212 * 6.283185482025146484375;
    float _216 = cos(_214);
    float _218 = -_210;
    float _220 = _194 + _218;
    bool _222 = !_176;
    float _224 = _200;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _166 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _166);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_176;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _166 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _186 = _278;
    }
    float _280 = _186;
    float _282 = in.m_53.w;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _290 = _288 != 0;
    float _292 = in.m_44.x;
    float _294 = in.m_44.y;
    float _296 = in.m_44.z;
    float _298 = -_220;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _302 = _220 < 0.5;
    float _304 = float(_302);
    bool _306 = !_286;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_216, 0.5, 0.5);
    bool _312 = !_180;
    int _314 = _312 ? 0 : 1;
    float _316 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = -_304;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _322 = abs(_308);
    float _324 = -_310;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = fma(_280, _202, _316);
    int _330 = abs(_314);
    float _332 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = !_290;
    int _336 = _334 ? 0 : 1;
    float _338 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = fma(_280, _204, _332);
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _344 = fma(_280, _206, _338);
    int _346 = abs(_336);
    float _348 = float(_322);
    float _350 = fma(_328, _282, _292);
    float _352 = float(_330);
    float _354 = fma(_340, _282, _294);
    float _356 = abs(_300);
    float _358 = _348 * _356;
    float _360 = fma(_344, _282, _296);
    float _362 = float(_346);
    float _364 = fma(_352, _326, _358);
    float _366 = abs(_320);
    float _368 = fma(_362, _366, _364);
    bool _370 = !_342;
    bool _372 = _286;
    float _388;
    if (!_370)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _376 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_104);
        float _394 = 1.0 / _392;
        float _396 = _138 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = _398 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _406 = _398 + _404;
    bool _408 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_398);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _426 = _398 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = 1.0 / _422;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _434;
    float _442 = 1.0 / _430;
    float _444 = _402 * _436;
    bool _446 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_398);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -_418;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _462;
    float _466 = _456 * _460;
    float _468 = _406 * _440;
    bool _470 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_398);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_456;
    float _484 = _482 + 1.0;
    bool _486 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_398);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = -_480;
    float _504 = _502 + 1.0;
    float _506 = _480 * _484;
    float _508 = _426 * _442;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _514;
    float _518 = _496 * _504;
    float _520 = fma(_464, _508, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _522 = fma(_512, _508, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = fma(_516, _508, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _530 = -_496;
    float _532 = _530 + 1.0;
    float _534 = _522 * _518;
    float _536 = _524 * _518;
    float _538 = _520 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _544 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _546 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = fma(_542, _468, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _556;
    float _560 = fma(_528, _468, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _564;
    float _568 = fma(_546, _506, _550);
    float _570 = fma(_554, _444, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_558, _444, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _574 = fma(_548, _506, _544);
    float _576 = fma(_566, _444, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _578 = fma(_560, _506, _562);
    float _580 = fma(_570, _466, _568);
    float _582 = fma(_572, _466, _574);
    float _584 = fma(_576, _466, _578);
    float _586 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].x, _580);
    float _588 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].y, _582);
    float _590 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].z, _584);
    bool _592 = !_438;
    float _608;
    if (!_592)
    {
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _596 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_104);
        float _614 = 1.0 / _612;
        float _616 = _138 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_55.x;
    float _622 = in.m_55.y;
    float _624 = in.m_55.z;
    float _626 = in.m_55.w;
    float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _630 = in.m_57.x;
    float _632 = in.m_57.y;
    float _634 = in.m_57.z;
    float _636 = in.m_57.w;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _644 = _642 != 0;
    float _646 = in.m_59.x;
    float _648 = in.m_59.y;
    float _650 = in.m_59.z;
    float _652 = in.m_59.w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = in.m_61.x;
    float _664 = in.m_61.y;
    float _666 = in.m_63.x;
    if (_640)
    {
        bool _668 = _160 > 0.5;
        _372 = _668;
    }
    bool _670 = _372;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _674 = in.m_51.w;
    float _676 = _354 * _622;
    float _678 = 0.0;
    if (_644)
    {
        float _680 = in.m_51.z;
        _678 = _680;
    }
    float _682 = _678;
    float _684 = _354 * _632;
    float _686 = fma(_350, _620, _676);
    float _688 = _354 * _648;
    float _690 = fma(_350, _630, _684);
    float _692 = _160 * 2.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _696 = abs(_662);
    float _698 = abs(_664);
    float _700 = precise::max(_696, _698);
    float _702 = fma(_350, _646, _688);
    float _704 = in.m_63.y;
    bool _706 = _700 >= 16.0;
    int _708 = as_type<int>(_632);
    float _710 = _674;
    float _712 = _666;
    if (_640)
    {
        float _714 = -_666;
        float _716 = _714 + 1.0;
        _708 = as_type<int>(_716);
    }
    int _718 = _708;
    float _720 = floor(_692);
    bool _722 = _674 > 0.5;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _726 = _722;
    if (!_640)
    {
        _710 = _666;
    }
    float _728 = _710;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _728;
    if (_640)
    {
        float _736 = _670 ? as_type<float>(_718) : _666;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = fma(_360, _624, _686);
    float _742 = in.m_51.y;
    float _744 = 1.0 / _732;
    float _746 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _752 = _740 + _626;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _756 = _720 > 0.0;
    float _758 = fma(_360, _634, _690);
    bool _760 = _720 >= 0.0;
    bool _762 = isnan(_720);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _770;
    float _774 = fma(_360, _650, _702);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _618 + _776;
    bool _780 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = isnan(_618);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _772 * _744;
    bool _796 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _798 = isnan(_618);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _810 = -_704;
    float _812 = _810 + 1.0;
    float _814 = fma(_794, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _816 = -_790;
    float _818 = _816 + 1.0;
    out.m_65.x = _746;
    out.m_65.y = _748;
    out.m_65.z = _792;
    out.m_65.w = _672;
    float _820 = _742 * 2.0;
    float _822 = _160 + _742;
    float _824 = _822 + (-1.0);
    float _826 = floor(_820);
    int _828 = _722 ? as_type<int>(_812) : as_type<int>(_704);
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].x);
    float _832 = _704;
    if (_644)
    {
        bool _834 = _682 > 0.5;
        _726 = _834;
    }
    bool _836 = _726;
    float _838 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _840 = _656 ? as_type<float>(_828) : _704;
    bool _842 = _836;
    if (_644)
    {
        float _844 = -_666;
        float _846 = _844 + 1.0;
        _830 = as_type<int>(_846);
    }
    int _848 = _830;
    float _850 = _806 * _818;
    bool _852 = _742 > 0.5;
    float _854 = in.m_51.z;
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_644)
    {
        float _858 = _836 ? as_type<float>(_848) : _666;
        _712 = _858;
    }
    float _860 = _712;
    float _862 = _814 * _850;
    if (_660)
    {
        float _864 = _852 ? _812 : _704;
        _832 = _864;
    }
    float _866 = _832;
    float _868 = -_806;
    float _870 = _868 + 1.0;
    bool _872 = _826 > 0.0;
    float _874 = _774 + _652;
    bool _876 = _826 >= 0.0;
    bool _878 = isnan(_826);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _750 * _808;
    float _888 = _664 * 0.0625;
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[115].x, _862);
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _894 = _662 * 0.0625;
    float _896 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _898 = _706 ? _888 : _664;
    float _900 = _866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _902 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[116].x, _890);
    float _904 = _706 ? _894 : _662;
    float _906 = _896 * _856;
    float _908 = abs(_898);
    bool _910 = _908 != 0.0;
    bool _912 = isnan(_908);
    bool _914 = _910 || _912;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    float _920 = _860 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _924 = _874 + _922;
    float _926 = _854 * 2.0;
    float _928 = _900 * _628;
    float _930 = floor(_926);
    float _932 = abs(_904);
    bool _934 = _932 == 0.0;
    bool _936 = !_918;
    bool _938 = _934 && _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = _920 * _892;
    float _948 = _758 + _636;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _752 + _950;
    float _954 = _924 * _924;
    float _956 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _902 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _964 = _768 ? 0 : 1;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _948 + _966;
    float _970 = fma(_952, _952, _954);
    bool _972 = _930 >= 0.0;
    bool _974 = isnan(_930);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.0);
    bool _980 = _976 || _978;
    float _982 = _924 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _984 = as_type<int>(_982);
    int _986 = _918 ? (-1) : 0;
    float _988 = _904;
    if (_938)
    {
        bool _990 = as_type<int>(_904) >= 0;
        _842 = _990;
    }
    bool _992 = _842;
    float _994 = _742 + _854;
    out.m_67.x = _956;
    out.m_67.y = _958;
    out.m_67.z = _960;
    out.m_67.w = _962;
    float _996 = fma(_968, _968, _970);
    float _998 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[28].x, _982);
    if (_938)
    {
        int _1000 = _992 ? 0 : 1078530011;
        _984 = _1000;
    }
    int _1002 = _984;
    out.m_69.x = _886;
    out.m_69.y = _928;
    out.m_69.z = _946;
    out.m_69.w = _906;
    bool _1004 = _930 > 0.0;
    float _1006 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _998);
    int _1008 = _980 ? 0 : 1;
    float _1010 = _994 + (-1.0);
    float _1012 = abs(_904);
    bool _1014 = _1012 == 0.0;
    float _1016 = rsqrt(_996);
    int _1018 = _884 ? 0 : 1;
    int _1020 = ~_1018;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = ~_964;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1034 = ~_1008;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    int _1040 = _1024;
    int _1042 = _1030;
    int _1044 = _1038;
    int _1046 = _1018;
    if (!_872)
    {
        int _1048 = ~_1018;
        int _1050 = _1048 + 1;
        _1040 = _1050;
    }
    int _1052 = _1040;
    bool _1054 = _1006 >= 0.0;
    if (!_756)
    {
        int _1056 = ~_964;
        int _1058 = _1056 + 1;
        _1042 = _1058;
    }
    int _1060 = _1042;
    if (!_1004)
    {
        int _1062 = ~_1008;
        int _1064 = _1062 + 1;
        _1044 = _1064;
    }
    int _1066 = _1044;
    if (_938)
    {
        int _1068 = int(0x80000000) & as_type<int>(_898);
        int _1070 = _1002 | _1068;
        _1046 = _1070;
    }
    int _1072 = _1046;
    bool _1074 = !_918;
    bool _1076 = _1074 && _1014;
    int _1078 = _1072;
    float _1080 = as_type<float>(_1072);
    if (!_1076)
    {
        float _1082 = abs(_898);
        bool _1084 = _1082 != as_type<float>(0x7f800000u /* inf */);
        bool _1086 = isnan(_1082);
        bool _1088 = _1084 || _1086;
        bool _1090 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1092 = _1088 || _1090;
        float _1094 = abs(_904);
        bool _1096 = _1094 == as_type<float>(0x7f800000u /* inf */);
        float _1098 = abs(_904);
        bool _1100 = _1098 == as_type<float>(0x7f800000u /* inf */);
        bool _1102 = !_1092;
        bool _1104 = _1100 && _1102;
        if (_1104)
        {
            bool _1106 = as_type<int>(_904) >= 0;
            _986 = _1106 ? (-1) : 0;
        }
        int _1108 = _986;
        if (_1104)
        {
            _1078 = 1075235812;
        }
        int _1110 = _1078;
        int _1112 = _1110;
        if (_1104)
        {
            int _1114 = ~_1108;
            int _1116 = (_1114 != 0) ? _1110 : 1061752795;
            _1112 = _1116;
        }
        int _1118 = _1112;
        float _1120 = as_type<float>(_1118);
        if (_1104)
        {
            int _1122 = int(0x80000000) & as_type<int>(_898);
            int _1124 = _1118 | _1122;
            _1120 = as_type<float>(_1124);
        }
        float _1126 = _1120;
        bool _1128 = !_1092;
        bool _1130 = _1128 && _1096;
        _1080 = _1126;
        if (!_1130)
        {
            float _1132 = abs(_898);
            float _1134 = abs(_904);
            float _1136 = precise::max(_1132, _1134);
            float _1138 = abs(_898);
            float _1140 = abs(_904);
            float _1142 = precise::min(_1138, _1140);
            float _1144 = 1.0 / _1136;
            float _1146 = abs(_898);
            float _1148 = abs(_904);
            bool _1150 = _1146 > _1148;
            bool _1152 = as_type<int>(_904) >= 0;
            float _1154 = _1142 * _1144;
            float _1156 = _1154 * _1154;
            float _1158 = _1156 + 11.33538818359375;
            float _1160 = fma(_1156, _1158, 28.84246826171875);
            float _1162 = fma(_1156, _1160, 19.6966705322265625);
            float _1164 = fma(_1156, -0.82336294651031494140625, -5.674867153167724609375);
            float _1166 = fma(_1156, _1164, -6.565555095672607421875);
            float _1168 = 1.0 / _1162;
            float _1170 = _1156 * _1166;
            float _1172 = abs(_898);
            float _1174 = abs(_904);
            float _1176 = _1172 + _1174;
            int _1178 = as_type<int>(_898) & int(0x80000000);
            float _1180 = _1154 * _1170;
            bool _1182 = _1176 > as_type<float>(0x7f800000u /* inf */);
            bool _1184 = isnan(_1176);
            bool _1186 = _1182 || _1184;
            bool _1188 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1190 = _1186 || _1188;
            float _1192 = fma(_1180, _1168, _1154);
            float _1194 = _1192;
            _1080 = _1176;
            if (_1150)
            {
                float _1196 = -_1192;
                float _1198 = _1196 + 1.57079637050628662109375;
                _1194 = _1198;
            }
            float _1200 = _1194;
            int _1202 = as_type<int>(_1200);
            if (!_1152)
            {
                float _1204 = -_1200;
                float _1206 = _1204 + 3.1415927410125732421875;
                _1202 = as_type<int>(_1206);
            }
            int _1208 = _1202;
            if (!_1190)
            {
                int _1210 = _1178 | _1208;
                _1080 = as_type<float>(_1210);
            }
        }
    }
    float _1212 = _1080;
    float _1214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1216 = log2(_1214);
    float _1218 = _924 * _1016;
    float _1220 = _952 * _1016;
    if (_1054)
    {
        _988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1222 = _988;
    float _1224 = -_1218;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1228 = -_1220;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>(_1222);
    if (_1054)
    {
        float _1246 = _1222 * 5.0;
        _1244 = as_type<int>(_1246);
    }
    int _1248 = _1244;
    float _1250 = _1226 * _1226;
    float _1252 = _968 * _1016;
    float _1254 = precise::max(_1212, -3.1415927410125732421875);
    if (_1054)
    {
        out.m_47.x = 0.0;
    }
    float _1256 = fma(_1230, _1230, _1250);
    float _1258 = -_1252;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1262 = _1216 * _138;
    float _1264 = precise::min(_1254, 3.1415927410125732421875);
    float _1266 = fma(_1260, _1260, _1256);
    if (_1054)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4303 = as_type<float>(_1248);
        out.gl_Position.z = _4303;
    }
    bool _1268 = !_1234;
    int _1270 = _1268 ? 0 : 1;
    float _1272 = fma(_1264, 0.15915493667125701904296875, 0.5);
    float _1274 = in.m_71.x;
    float _1276 = in.m_71.y;
    float _1278 = in.m_71.z;
    float _1280 = exp2(_1262);
    bool _1282 = !_1238;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = fma(_138, 0.06666667759418487548828125, _1272);
    int _1288 = abs(_1270);
    float _1290 = _1286 * 6.283185482025146484375;
    bool _1292 = !_1242;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = sqrt(_1266);
    int _1298 = abs(_1284);
    bool _1300 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1302 = isnan(1.0);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1308 = _1304 || _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1312 = 1.0 + _1310;
    float _1314 = float(_1066);
    float _1316 = 1.0 / _1312;
    int _1318 = abs(_1294);
    float _1320 = -_1280;
    float _1322 = _1320 + 1.0;
    float _1324 = float(_1288);
    float _1326 = float(_1060);
    float _1328 = _1324 * _1314;
    float _1330 = float(_1298);
    float _1332 = float(_1052);
    float _1334 = _1328 * (-2.0);
    float _1336 = float(_1318);
    float _1338 = _1330 * _1326;
    bool _1340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1334, _1274, _1274);
    float _1352 = fma(_838, _1334, _838);
    float _1354 = _1336 * _1332;
    float _1356 = _1348 ? _1322 : 0.0;
    float _1358 = _1338 * (-2.0);
    float _1360 = _160 + (-0.5);
    if (_1308)
    {
        float _1362 = _1356 * _1316;
        _142 = _1362;
    }
    float _1364 = _142;
    float _1366 = fma(_1032, _1358, _1032);
    float _1368 = fma(_1358, _1276, _1276);
    float _1370 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1350);
    if (_1054)
    {
        return out;
    }
    float _1372 = -_1218;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _1376 = -_1220;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _1380 = fma(_1352, _1364, _1370);
    float _1382 = -_1252;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _948);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1388 = _1374 + _1386;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1392 = _1378 + _1390;
    float _1394 = _742 + (-0.5);
    float _1396 = _1290 * 0.15915493667125701904296875;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1400 = _1380 * 0.15915493667125701904296875;
    float _1402 = _160 + _854;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1406 = _1384 + _1404;
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1398);
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1368);
    float _1412 = _1402 + (-1.0);
    float _1414 = _1354 * (-2.0);
    float _1416 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1408);
    float _1418 = fma(_1366, _1364, _1410);
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1422 = fma(_1414, _1278, _1278);
    float _1424 = _854 + (-0.5);
    bool _1426 = _1416 >= 0.0;
    float _1428 = fma(_1420, _1414, _1420);
    float _1430 = _1418 * 0.15915493667125701904296875;
    float _1432 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1422);
    float _1434 = in.m_53.x;
    float _1436 = in.m_53.y;
    float _1438 = in.m_53.z;
    float _1440 = _1400 * 6.283185482025146484375;
    float _1442 = sin(_1440);
    float _1444 = fma(_1428, _1364, _1432);
    float _1446 = in.m_61.z;
    float _1448 = _1444 * 0.15915493667125701904296875;
    float _1450 = _1400 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = _1418;
    if (_1426)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    int _1458 = as_type<int>(_1456);
    if (_1426)
    {
        out.m_47.x = 0.0;
    }
    if (_1426)
    {
        float _1460 = _1456 * 5.0;
        _1458 = as_type<int>(_1460);
    }
    int _1462 = _1458;
    float _1464 = _1396 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    if (_1426)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4600 = as_type<float>(_1462);
        out.gl_Position.z = _4600;
    }
    float _1468 = _1430 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    float _1472 = _1430 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1448 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    if (_1426)
    {
        return out;
    }
    float _1480 = _1448 * 6.283185482025146484375;
    float _1482 = cos(_1480);
    float _1484 = _588 * _1436;
    float _1486 = _586 * _1434;
    float _1488 = fma(_1466, 0.5, 1.5);
    float _1490 = _590 * _1438;
    float _1492 = _1016 * _1296;
    float _1494 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1496 = _1488 * _662;
    float _1498 = _1488 * _664;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1502 = _1488 * _1446;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1496);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1498);
    float _1510 = _1492 * _1494;
    float _1512 = _1492 * _1500;
    float _1514 = _1452 * _1482;
    float _1516 = _1492 * _1504;
    float _1518 = _1442 * _1470;
    float _1520 = _1452 * _1474;
    float _1522 = _1452 * _1470;
    float _1524 = _1442 * _1474;
    float _1526 = _1506 * _1510;
    float _1528 = _1508 * _1512;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1532 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1534 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1536 = fma(_1478, _1520, _1518);
    float _1538 = -_1522;
    float _1540 = fma(_1478, _1524, _1538);
    float _1542 = fma(_1478, _1518, _1520);
    float _1544 = -_1524;
    float _1546 = fma(_1478, _1522, _1544);
    float _1548 = -_1478;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1530);
    float _1552 = -_1478;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1532);
    float _1556 = -_1478;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1534);
    float _1560 = _1474 * _1482;
    float _1562 = -_1528;
    float _1564 = _1478 * _1562;
    float _1566 = _1442 * _1482;
    float _1568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1502);
    float _1570 = _1514 * _1528;
    float _1572 = _1470 * _1482;
    float _1574 = fma(_1560, _1526, _1564);
    float _1576 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1578 = _1566 * _1528;
    float _1580 = _1568 * _1516;
    float _1582 = fma(_1536, _1526, _1570);
    float _1584 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1576);
    float _1586 = fma(_1540, _1526, _1578);
    float _1588 = fma(_1572, _1580, _1574);
    float _1590 = fma(_1546, _1580, _1582);
    float _1592 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1584);
    float _1594 = fma(_1542, _1580, _1586);
    float _1596 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1600 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1610 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1612 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1598);
    float _1614 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1616 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1618 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    float _1620 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1608);
    float _1622 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1614);
    float _1624 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1626 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1618);
    float _1628 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1620);
    float _1630 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1550);
    float _1632 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1554);
    float _1634 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1558);
    float _1636 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1638 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1640 = in.m_73.x;
    float _1642 = in.m_73.y;
    float _1644 = in.m_73.z;
    bool _1646 = _1498 != 0.0;
    bool _1648 = isnan(_1498);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    float _1656 = _752 + _1636;
    float _1658 = _948 + _1638;
    float _1660 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1600);
    bool _1662 = _1496 == 0.0;
    bool _1664 = !_1654;
    bool _1666 = _1662 && _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1656 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1674 = _1658 + _1672;
    float _1676 = in.m_75.x;
    float _1678 = in.m_75.y;
    float _1680 = in.m_75.z;
    float _1682 = in.m_75.w;
    bool _1684 = _1502 == 0.0;
    bool _1686 = _1684 && _1666;
    float _1688 = _1670 * _1670;
    float _1690 = _1674 * _1674;
    float _1692 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1694 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1612);
    float _1696 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1660);
    float _1698 = _1688 + _1690;
    float _1700 = sqrt(_1698);
    float _1702 = _1636;
    float _1704 = _1506;
    float _1706 = _1624;
    float _1708 = _1688;
    float _1710 = _1690;
    float _1712 = _1656;
    float _1714 = _1658;
    float _1716 = _1592;
    if (_1686)
    {
        _1702 = _1644;
    }
    float _1718 = _1702;
    float _1720 = _1718;
    if (!_1686)
    {
        float _1722 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1720 = _1722;
    }
    float _1724 = _1720;
    float _1726 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1686)
    {
        _1704 = _1640;
    }
    float _1728 = _1704;
    float _1730 = _1728;
    if (!_1686)
    {
        float _1732 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1640);
        _1730 = _1732;
    }
    float _1734 = _1730;
    if (_1686)
    {
        _1706 = _1642;
    }
    float _1736 = _1706;
    float _1738 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1726);
    float _1740 = _1736;
    if (!_1686)
    {
        float _1742 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1642);
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = _1630 * _1678;
    float _1748 = _1632 * _1678;
    float _1750 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1738);
    bool _1752 = _1700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1634 * _1678;
    float _1756 = fma(_1626, _1676, _1746);
    float _1758 = _1680 * _1640;
    float _1760 = _1676 * _1642;
    float _1762 = _1678 * _1644;
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1766 = fma(_1592, _1676, _1748);
    float _1768 = fma(_1628, _1676, _1754);
    float _1770 = -_1758;
    float _1772 = fma(_1676, _1644, _1770);
    float _1774 = -_1760;
    float _1776 = fma(_1678, _1640, _1774);
    float _1778 = -_1762;
    float _1780 = fma(_1680, _1642, _1778);
    float _1782 = _874 + _1764;
    float _1784 = _1772 * _1682;
    float _1786 = _1776 * _1682;
    float _1788 = _1780 * _1682;
    float _1790 = fma(_1692, _1680, _1756);
    float _1792 = fma(_1694, _1680, _1766);
    float _1794 = fma(_1696, _1680, _1768);
    float _1796 = _1682;
    if (!_1752)
    {
        _1796 = _1782;
    }
    float _1798 = _1796;
    bool _1800 = !_1752;
    float _1802 = _1798;
    if (!_1800)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1808 = _1700 + _1806;
        float _1810 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = rsqrt(_1698);
        float _1814 = _1808 * _1804;
        float _1816 = _1814 * 0.15915493667125701904296875;
        float _1818 = _1816 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = fma(_1820, _1810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1828 = _1812 * _1826;
        float _1830 = fma(_1670, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1832 = _1824 + (-1.0);
        float _1834 = fma(_1674, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1838 = _1830 + _1836;
        float _1840 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1844 = _1834 + _1842;
        float _1846 = _1838 * _1838;
        float _1848 = fma(_1782, _1824, _1840);
        float _1850 = _1844 * _1844;
        _1802 = _1848;
        _1708 = _1846;
        _1710 = _1850;
        _1712 = _1830;
        _1714 = _1834;
    }
    float _1852 = _1802;
    float _1854 = _1708;
    float _1856 = _1710;
    float _1858 = _1712;
    float _1860 = _1714;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1864 = _1852 + _1862;
    float _1866 = _1630 * _1744;
    float _1868 = _1632 * _1744;
    float _1870 = _1634 * _1744;
    float _1872 = fma(_1864, _1864, _1854);
    float _1874 = _1784 * _1630;
    float _1876 = _1784 * _1632;
    float _1878 = _1784 * _1634;
    float _1880 = _1872 + _1856;
    float _1882 = fma(_1626, _1734, _1866);
    float _1884 = fma(_1592, _1734, _1868);
    float _1886 = fma(_1628, _1734, _1870);
    float _1888 = fma(_1788, _1626, _1874);
    float _1890 = fma(_1788, _1592, _1876);
    float _1892 = sqrt(_1880);
    float _1894 = fma(_1788, _1628, _1878);
    float _1896 = fma(_1692, _1724, _1882);
    float _1898 = fma(_1694, _1724, _1884);
    float _1900 = fma(_1696, _1724, _1886);
    float _1902 = fma(_1786, _1692, _1888);
    float _1904 = fma(_1786, _1694, _1890);
    float _1906 = fma(_1786, _1696, _1894);
    out.m_77.x = _1790;
    out.m_77.y = _1792;
    out.m_77.z = _1794;
    out.m_79.x = _1896;
    out.m_79.y = _1898;
    out.m_79.z = _1900;
    out.m_81.x = _1902;
    out.m_81.y = _1904;
    out.m_81.z = _1906;
    bool _1908 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1910 = isnan(_1892);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1916 = _1912 || _1914;
    float _1918 = _1904;
    if (!_1916)
    {
        _1716 = 1.0;
    }
    float _1920 = _1716;
    bool _1922 = !_1916;
    float _1924 = _1920;
    if (!_1922)
    {
        bool _1926 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1928 = isnan(_1892);
        bool _1930 = _1926 || _1928;
        bool _1932 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1934 = _1930 || _1932;
        if (!_1934)
        {
            float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1938 = _1892 + _1936;
            float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1942 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1940;
            float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1946 = _1944 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1948 = 1.0 / _1942;
            float _1950 = _1938 * _1948;
            float _1952 = fma(_1950, _1946, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1924 = _1952;
            _1954 = true;
        }
        else
        {
            bool _1956 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1958 = isnan(_1892);
            bool _1960 = _1956 || _1958;
            bool _1962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1964 = _1960 || _1962;
            if (!_1964)
            {
                float _1966 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1968 = _1892 + _1966;
                float _1970 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1972 = _1970 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1974 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1976 = _1974 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1978 = 1.0 / _1972;
                float _1980 = _1968 * _1978;
                float _1982 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1924 = _1982;
                _1954 = true;
            }
            else
            {
                _1924 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1954 = false;
    float _1984 = _1924;
    float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1988 = _1858 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1992 = _1852 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1996 = _1860 + _1994;
    bool _1998 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan(0.5);
    bool _2006 = _2002 || _2004;
    float _2008 = fma(_1988, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2010 = fma(_1992, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2012 = fma(_1996, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2014 = -_1220;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2008);
    float _2018 = -_1218;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2010);
    float _2022 = -_1252;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2012);
    float _2026 = _2020;
    float _2028 = _2016;
    float _2030 = _2024;
    if (!_2006)
    {
        float _2032 = _1388 * _1388;
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2036 = -_752;
        float _2038 = _2036 + _2008;
        float _2040 = -_948;
        float _2042 = _2040 + _2012;
        float _2044 = fma(_1392, _1392, _2032);
        float _2046 = fma(_1406, _1406, _2044);
        float _2048 = 1.0 / _1492;
        float _2050 = sqrt(_2046);
        float _2052 = precise::min(_2050, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2054 = _2052 * _2034;
        float _2056 = -_874;
        float _2058 = _2056 + _2010;
        float _2060 = _2054 * _2048;
        float _2062 = fma(_2038, _2060, _1378);
        float _2064 = fma(_2058, _2060, _1374);
        float _2066 = fma(_2042, _2060, _1384);
        _2026 = _2064;
        _2028 = _2062;
        _2030 = _2066;
    }
    float _2068 = _2026;
    float _2070 = _2028;
    float _2072 = _2030;
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2076 = _2068 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _2070 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _2072 + _2082;
    float _2086 = _2076 * _2076;
    float _2088 = fma(_2080, _2080, _2086);
    float _2090 = fma(_2084, _2084, _2088);
    float _2092 = rsqrt(_2090);
    float _2094 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2096 = _2080 * _2094;
    float _2098 = _2084 * _2094;
    float _2100 = _2096 * _2096;
    float _2102 = _2098 * _2098;
    float _2104 = _2100 + _2102;
    float _2106 = sqrt(_2104);
    bool _2108 = _2106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2112 = _2106 + _2110;
    float _2114 = _2092;
    float _2116 = _2104;
    float _2118 = _2112;
    float _2120 = _2076;
    float _2122 = _2094;
    float _2124 = _2096;
    if (_2108)
    {
        float _2126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2126;
    }
    float _2128 = _2114;
    if (_2108)
    {
        float _2130 = rsqrt(_2104);
        _2116 = _2130;
    }
    float _2132 = _2116;
    if (_2108)
    {
        float _2134 = _2112 * _2128;
        _2118 = _2134;
    }
    float _2136 = _2118;
    if (_2108)
    {
        float _2138 = _2136 * 0.15915493667125701904296875;
        _1918 = _2138;
    }
    float _2140 = _1918;
    float _2142 = _2128;
    float _2144 = _2140;
    if (_2108)
    {
        float _2146 = _2140 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2154 = precise::max(0.0, _2152);
    float _2156 = _2084;
    float _2158 = _2154;
    if (_2108)
    {
        float _2160 = _2140 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = -_2094;
    float _2168 = -_2154;
    float _2170 = fma(_2076, _2166, _2168);
    float _2172 = _2170;
    if (!_2108)
    {
        _2120 = _2100;
    }
    float _2174 = _2120;
    float _2176 = _2174;
    if (_2108)
    {
        float _2178 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2158 = _2178;
    }
    float _2180 = _2158;
    float _2182 = _2150;
    float _2184 = _2180;
    if (_2108)
    {
        float _2186 = fma(_2150, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2192 = _2188;
    if (_2108)
    {
        float _2194 = _2164 + (-1.0);
        _2184 = _2194;
    }
    float _2196 = _2184;
    float _2198 = _2196;
    if (_2108)
    {
        float _2200 = _2132 * _2188;
        _2122 = _2200;
    }
    float _2202 = _2122;
    if (!_2108)
    {
        _2192 = _2098;
    }
    float _2204 = _2192;
    float _2206 = sqrt(_2090);
    float _2208 = _2204;
    if (_2108)
    {
        float _2210 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2210;
    }
    float _2212 = _2144;
    if (_2108)
    {
        float _2214 = _2096 * _2202;
        _2124 = _2214;
    }
    float _2216 = _2124;
    if (_2108)
    {
        float _2218 = _2098 * _2202;
        _2208 = _2218;
    }
    float _2220 = _2208;
    if (!_2108)
    {
        _2198 = _2102;
    }
    float _2222 = _2198;
    float _2224 = _2222;
    if (_2108)
    {
        float _2226 = fma(_2170, _2164, _2212);
        _2172 = _2226;
    }
    float _2228 = _2172;
    if (_2108)
    {
        float _2230 = _2216 * _2216;
        _2176 = _2230;
    }
    float _2232 = _2176;
    if (_2108)
    {
        float _2234 = _2220 * _2220;
        _2224 = _2234;
    }
    float _2236 = _2224;
    float _2238 = fma(_2228, _2228, _2232);
    float _2240 = _2238 + _2236;
    float _2242 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2246 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2244);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = rsqrt(_2240);
    float _2252 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2242);
    float _2254 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2256 = -_2248;
    float _2258 = _2256 + 1.0;
    float _2260 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2252);
    float _2262 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2264 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2254);
    float _2266 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2270 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2262);
    float _2272 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2264);
    float _2274 = abs(_2258);
    float _2276 = log2(_2274);
    float _2278 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2266);
    float _2280 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2270);
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2278);
    float _2288 = _2250 * _2216;
    float _2290 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2294 = -_2284;
    float _2296 = fma(_2294, _2190, 1.0);
    float _2298 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2300 = _2250 * _2228;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2304 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2292);
    float _2306 = _2250 * _2220;
    float _2308 = log2(_2296);
    float _2310 = -_2302;
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2310);
    float _2314 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2304);
    float _2316 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2318 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2320 = -_2306;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2312);
    float _2324 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2314);
    float _2326 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2328 = exp2(_2316);
    float _2330 = fma(_2322, -0.5, 0.5);
    float _2332 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2318);
    float _2334 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2326);
    float _2336 = _2300 + 1.0;
    float _2338 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2332);
    float _2340 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2334);
    float _2342 = 1.0 / _2324;
    float _2344 = fma(_2322, 0.5, 0.5);
    float _2346 = _2308 * 0.693147182464599609375;
    float _2348 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2340);
    float _2350 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2338);
    float _2352 = fma(_2344, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2354 = sqrt(_2330);
    float _2356 = -_2300;
    float _2358 = fma(_2328, _2336, _2356);
    float _2360 = fma(_2344, _2352, -0.212114393711090087890625);
    float _2362 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2364 = fma(_2344, _2360, 1.570728778839111328125);
    float _2366 = _2348 * _2342;
    float _2368 = _2350 * _2342;
    float _2370 = fma(_2366, 0.5, 0.5);
    float _2372 = fma(_2368, -0.5, 0.5);
    float _2374 = fma(_2358, 0.5, 0.5);
    float _2376 = _2354 * 0.636619746685028076171875;
    float3 _6128 = float3(_2370, _2372, _2362);
    float _2378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6128, float3(0.0), isnan(_6128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6128, float3(0.0), isnan(_6128)), level(0.0)).x;
    float3 _6139 = float3(_2370, _2372, _2362);
    float4 _2381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6139, float3(0.0), isnan(_6139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6139, float3(0.0), isnan(_6139)), level(0.0)).xyzw;
    float _2383 = _2381.x;
    float _2385 = _2381.y;
    float _2387 = _2381.z;
    float _2389 = _2381.w;
    float _2391 = -_2364;
    float _2393 = fma(_2376, _2391, 1.0);
    float2 _6161 = float2(_2393, _2374);
    float3 _2397 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6161, float2(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6161, float2(0.0), isnan(_6161)), level(0.0)).xyz;
    float _2399 = _2397.x;
    float _2401 = _2397.y;
    float _2403 = _2397.z;
    float _2405 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2407 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2409 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2411 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2407);
    float _2413 = exp2(_2405);
    float _2415 = _2409 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2411);
    float _2419 = _2348 + _2324;
    float _2421 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2417);
    float _2423 = _2419 * 0.5;
    float _2425 = _2324 * 0.5;
    out.m_47.x = _2415;
    float _2427 = _2421 + _2324;
    out.gl_Position.x = _2348;
    out.gl_Position.y = _2350;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _2324;
    float _2429 = _2427 * 0.5;
    float _2431 = -_2413;
    float _2433 = _2431 + 1.0;
    float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2437 = fma(_2350, -0.5, _2425);
    out.m_83.x = _2423;
    out.m_83.y = _2437;
    out.m_83.z = _2429;
    out.m_83.w = _2324;
    float _2439 = _2435 * _2378;
    float _2441 = -_2435;
    float _2443 = _2441 + 1.0;
    float _2445 = _2389 * _2439;
    float _2447 = _2403 * _2439;
    float _2449 = fma(_2399, _2445, _2383);
    float _2451 = fma(_2401, _2445, _2385);
    float _2453 = _2389 * _2443;
    float _2455 = fma(_2389, _2447, _2387);
    out.m_85.x = _2449;
    out.m_85.y = _2451;
    out.m_85.z = _2455;
    out.m_85.w = _2453;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1954 = false;
    bool _610 = false;
    bool _390 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_44.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _110;
    float _114 = _112;
    if (!_108)
    {
        out.m_47.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _112 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2512 = as_type<float>(_120);
        out.gl_Position.z = _2512;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_49.w;
    bool _126 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_124);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    float _136 = -_124;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _140 = 0.0;
    float _142 = _138;
    if (_134)
    {
        float _144 = float(_104);
        _140 = _144;
    }
    float _146 = _140;
    bool _148 = _138 >= _146;
    bool _150 = !_134;
    bool _152 = _148 || _150;
    if (_152)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _114;
    if (_152)
    {
        out.m_47.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _122 = as_type<int>(_156);
    }
    int _158 = _122;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2581 = as_type<float>(_158);
        out.gl_Position.z = _2581;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = in.m_51.x;
    float _162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _164 = _138 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _166 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _168 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _170 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    int _178 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _180 = _178 != 0;
    float _182 = _164 * _162;
    float _184 = 0.0;
    float _186 = _166;
    if (!_176)
    {
        float _188 = _166 * _166;
        float _190 = _188 * 0.5;
        _184 = _190;
    }
    float _192 = _184;
    float _194 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[20].x, _182);
    float _196 = _192;
    if (!_176)
    {
        float _198 = _192 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    float _202 = in.m_49.x;
    float _204 = in.m_49.y;
    float _206 = in.m_49.z;
    float _208 = _194 * 6.283185482025146484375;
    float _210 = floor(_194);
    float _212 = _208 * 0.15915493667125701904296875;
    float _214 = _212 * 6.283185482025146484375;
    float _216 = cos(_214);
    float _218 = -_210;
    float _220 = _194 + _218;
    bool _222 = !_176;
    float _224 = _200;
    if (!_222)
    {
        float _226 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _228 = log2(_226);
        float _230 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _232 = _230 + 1.0;
        float _234 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = _166 * _228;
        float _238 = 1.0 / _232;
        float _240 = _234 * 0.693147182464599609375;
        float _242 = exp2(_236);
        float _244 = 1.0 / _240;
        float _246 = _242 + (-1.0);
        float _248 = -_246;
        float _250 = fma(_248, _244, _166);
        float _252 = _250 * _238;
        float _254 = _252 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _224 = _254;
    }
    float _256 = _224;
    bool _258 = !_176;
    if (!_258)
    {
        float _260 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _262 = log2(_260);
        float _264 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _266 = _264 + 1.0;
        float _268 = 1.0 / _266;
        float _270 = _166 * _262;
        float _272 = exp2(_270);
        float _274 = -_272;
        float _276 = _274 + 1.0;
        float _278 = _276 * _268;
        _186 = _278;
    }
    float _280 = _186;
    float _282 = in.m_53.w;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _290 = _288 != 0;
    float _292 = in.m_44.x;
    float _294 = in.m_44.y;
    float _296 = in.m_44.z;
    float _298 = -_220;
    float _300 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _302 = _220 < 0.5;
    float _304 = float(_302);
    bool _306 = !_286;
    int _308 = _306 ? 0 : 1;
    float _310 = fma(_216, 0.5, 0.5);
    bool _312 = !_180;
    int _314 = _312 ? 0 : 1;
    float _316 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _318 = -_304;
    float _320 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _322 = abs(_308);
    float _324 = -_310;
    float _326 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _328 = fma(_280, _202, _316);
    int _330 = abs(_314);
    float _332 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _334 = !_290;
    int _336 = _334 ? 0 : 1;
    float _338 = _256 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _340 = fma(_280, _204, _332);
    bool _342 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _344 = fma(_280, _206, _338);
    int _346 = abs(_336);
    float _348 = float(_322);
    float _350 = fma(_328, _282, _292);
    float _352 = float(_330);
    float _354 = fma(_340, _282, _294);
    float _356 = abs(_300);
    float _358 = _348 * _356;
    float _360 = fma(_344, _282, _296);
    float _362 = float(_346);
    float _364 = fma(_352, _326, _358);
    float _366 = abs(_320);
    float _368 = fma(_362, _366, _364);
    bool _370 = !_342;
    bool _372 = _286;
    float _388;
    if (!_370)
    {
        float _374 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _376 = _160 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _378 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _380 = _378 * _374;
        float _382 = floor(_380);
        float _384 = -_382;
        float _386 = _380 + _384;
        _388 = _386;
        _390 = true;
    }
    else
    {
        float _392 = float(_104);
        float _394 = 1.0 / _392;
        float _396 = _138 * _394;
        _388 = _396;
    }
    _390 = false;
    float _398 = _388;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _402 = _398 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _406 = _398 + _404;
    bool _408 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_398);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _426 = _398 + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _428;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _436 = 1.0 / _422;
    bool _438 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _440 = 1.0 / _434;
    float _442 = 1.0 / _430;
    float _444 = _402 * _436;
    bool _446 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _448 = isnan(_398);
    bool _450 = _446 || _448;
    bool _452 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _454 = _450 || _452;
    float _456 = float(_454);
    float _458 = -_418;
    float _460 = _458 + 1.0;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _462;
    float _466 = _456 * _460;
    float _468 = _406 * _440;
    bool _470 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _472 = isnan(_398);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -_456;
    float _484 = _482 + 1.0;
    bool _486 = _398 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_398);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _502 = -_480;
    float _504 = _502 + 1.0;
    float _506 = _480 * _484;
    float _508 = _426 * _442;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _512 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _510;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _516 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _514;
    float _518 = _496 * _504;
    float _520 = fma(_464, _508, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _522 = fma(_512, _508, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = fma(_516, _508, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _530 = -_496;
    float _532 = _530 + 1.0;
    float _534 = _522 * _518;
    float _536 = _524 * _518;
    float _538 = _520 * _518;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _544 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].y, _536);
    float _546 = fma(_500, _468, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _548 = fma(_542, _468, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _550 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].x, _534);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _552;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _558 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _556;
    float _560 = fma(_528, _468, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _562 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[143].z, _538);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _564;
    float _568 = fma(_546, _506, _550);
    float _570 = fma(_554, _444, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _572 = fma(_558, _444, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _574 = fma(_548, _506, _544);
    float _576 = fma(_566, _444, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _578 = fma(_560, _506, _562);
    float _580 = fma(_570, _466, _568);
    float _582 = fma(_572, _466, _574);
    float _584 = fma(_576, _466, _578);
    float _586 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].x, _580);
    float _588 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].y, _582);
    float _590 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[146].z, _584);
    bool _592 = !_438;
    float _608;
    if (!_592)
    {
        float _594 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _596 = _160 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _598 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _600 = _598 * _594;
        float _602 = floor(_600);
        float _604 = -_602;
        float _606 = _600 + _604;
        _608 = _606;
        _610 = true;
    }
    else
    {
        float _612 = float(_104);
        float _614 = 1.0 / _612;
        float _616 = _138 * _614;
        _608 = _616;
    }
    _610 = false;
    float _618 = _608;
    float _620 = in.m_55.x;
    float _622 = in.m_55.y;
    float _624 = in.m_55.z;
    float _626 = in.m_55.w;
    float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _630 = in.m_57.x;
    float _632 = in.m_57.y;
    float _634 = in.m_57.z;
    float _636 = in.m_57.w;
    int _638 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _640 = _638 != 0;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _644 = _642 != 0;
    float _646 = in.m_59.x;
    float _648 = in.m_59.y;
    float _650 = in.m_59.z;
    float _652 = in.m_59.w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _660 = _658 != 0;
    float _662 = in.m_61.x;
    float _664 = in.m_61.y;
    float _666 = in.m_63.x;
    if (_640)
    {
        bool _668 = _160 > 0.5;
        _372 = _668;
    }
    bool _670 = _372;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _674 = in.m_51.w;
    float _676 = _354 * _622;
    float _678 = 0.0;
    if (_644)
    {
        float _680 = in.m_51.z;
        _678 = _680;
    }
    float _682 = _678;
    float _684 = _354 * _632;
    float _686 = fma(_350, _620, _676);
    float _688 = _354 * _648;
    float _690 = fma(_350, _630, _684);
    float _692 = _160 * 2.0;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _696 = abs(_662);
    float _698 = abs(_664);
    float _700 = precise::max(_696, _698);
    float _702 = fma(_350, _646, _688);
    float _704 = in.m_63.y;
    bool _706 = _700 >= 16.0;
    int _708 = as_type<int>(_632);
    float _710 = _674;
    float _712 = _666;
    if (_640)
    {
        float _714 = -_666;
        float _716 = _714 + 1.0;
        _708 = as_type<int>(_716);
    }
    int _718 = _708;
    float _720 = floor(_692);
    bool _722 = _674 > 0.5;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _726 = _722;
    if (!_640)
    {
        _710 = _666;
    }
    float _728 = _710;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _732 = _730 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _734 = _728;
    if (_640)
    {
        float _736 = _670 ? as_type<float>(_718) : _666;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = fma(_360, _624, _686);
    float _742 = in.m_51.y;
    float _744 = 1.0 / _732;
    float _746 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _752 = _740 + _626;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _756 = _720 > 0.0;
    float _758 = fma(_360, _634, _690);
    bool _760 = _720 >= 0.0;
    bool _762 = isnan(_720);
    bool _764 = _760 || _762;
    bool _766 = isnan(0.0);
    bool _768 = _764 || _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _772 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _770;
    float _774 = fma(_360, _650, _702);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _778 = _618 + _776;
    bool _780 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _782 = isnan(_618);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _754 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _794 = _772 * _744;
    bool _796 = _618 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _798 = isnan(_618);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _810 = -_704;
    float _812 = _810 + 1.0;
    float _814 = fma(_794, _778, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _816 = -_790;
    float _818 = _816 + 1.0;
    out.m_65.x = _746;
    out.m_65.y = _748;
    out.m_65.z = _792;
    out.m_65.w = _672;
    float _820 = _742 * 2.0;
    float _822 = _160 + _742;
    float _824 = _822 + (-1.0);
    float _826 = floor(_820);
    int _828 = _722 ? as_type<int>(_812) : as_type<int>(_704);
    int _830 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[198].x);
    float _832 = _704;
    if (_644)
    {
        bool _834 = _682 > 0.5;
        _726 = _834;
    }
    bool _836 = _726;
    float _838 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _840 = _656 ? as_type<float>(_828) : _704;
    bool _842 = _836;
    if (_644)
    {
        float _844 = -_666;
        float _846 = _844 + 1.0;
        _830 = as_type<int>(_846);
    }
    int _848 = _830;
    float _850 = _806 * _818;
    bool _852 = _742 > 0.5;
    float _854 = in.m_51.z;
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    if (_644)
    {
        float _858 = _836 ? as_type<float>(_848) : _666;
        _712 = _858;
    }
    float _860 = _712;
    float _862 = _814 * _850;
    if (_660)
    {
        float _864 = _852 ? _812 : _704;
        _832 = _864;
    }
    float _866 = _832;
    float _868 = -_806;
    float _870 = _868 + 1.0;
    bool _872 = _826 > 0.0;
    float _874 = _774 + _652;
    bool _876 = _826 >= 0.0;
    bool _878 = isnan(_826);
    bool _880 = _876 || _878;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    float _886 = _750 * _808;
    float _888 = _664 * 0.0625;
    float _890 = fma(_870, (*spvDescriptorSet0.vp_c9)._m0[115].x, _862);
    float _892 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _894 = _662 * 0.0625;
    float _896 = _840 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _898 = _706 ? _888 : _664;
    float _900 = _866 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _902 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[116].x, _890);
    float _904 = _706 ? _894 : _662;
    float _906 = _896 * _856;
    float _908 = abs(_898);
    bool _910 = _908 != 0.0;
    bool _912 = isnan(_908);
    bool _914 = _910 || _912;
    bool _916 = isnan(0.0);
    bool _918 = _914 || _916;
    float _920 = _860 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _922 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _924 = _874 + _922;
    float _926 = _854 * 2.0;
    float _928 = _900 * _628;
    float _930 = floor(_926);
    float _932 = abs(_904);
    bool _934 = _932 == 0.0;
    bool _936 = !_918;
    bool _938 = _934 && _936;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _944 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _946 = _920 * _892;
    float _948 = _758 + _636;
    float _950 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _952 = _752 + _950;
    float _954 = _924 * _924;
    float _956 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _962 = _902 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _964 = _768 ? 0 : 1;
    float _966 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _968 = _948 + _966;
    float _970 = fma(_952, _952, _954);
    bool _972 = _930 >= 0.0;
    bool _974 = isnan(_930);
    bool _976 = _972 || _974;
    bool _978 = isnan(0.0);
    bool _980 = _976 || _978;
    float _982 = _924 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _984 = as_type<int>(_982);
    int _986 = _918 ? (-1) : 0;
    float _988 = _904;
    if (_938)
    {
        bool _990 = as_type<int>(_904) >= 0;
        _842 = _990;
    }
    bool _992 = _842;
    float _994 = _742 + _854;
    out.m_67.x = _956;
    out.m_67.y = _958;
    out.m_67.z = _960;
    out.m_67.w = _962;
    float _996 = fma(_968, _968, _970);
    float _998 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[28].x, _982);
    if (_938)
    {
        int _1000 = _992 ? 0 : 1078530011;
        _984 = _1000;
    }
    int _1002 = _984;
    out.m_69.x = _886;
    out.m_69.y = _928;
    out.m_69.z = _946;
    out.m_69.w = _906;
    bool _1004 = _930 > 0.0;
    float _1006 = fma(_968, (*spvDescriptorSet0.vp_c8)._m0[28].z, _998);
    int _1008 = _980 ? 0 : 1;
    float _1010 = _994 + (-1.0);
    float _1012 = abs(_904);
    bool _1014 = _1012 == 0.0;
    float _1016 = rsqrt(_996);
    int _1018 = _884 ? 0 : 1;
    int _1020 = ~_1018;
    int _1022 = _1020 + 1;
    int _1024 = _1022 + 1;
    int _1026 = ~_964;
    int _1028 = _1026 + 1;
    int _1030 = _1028 + 1;
    float _1032 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1034 = ~_1008;
    int _1036 = _1034 + 1;
    int _1038 = _1036 + 1;
    int _1040 = _1024;
    int _1042 = _1030;
    int _1044 = _1038;
    int _1046 = _1018;
    if (!_872)
    {
        int _1048 = ~_1018;
        int _1050 = _1048 + 1;
        _1040 = _1050;
    }
    int _1052 = _1040;
    bool _1054 = _1006 >= 0.0;
    if (!_756)
    {
        int _1056 = ~_964;
        int _1058 = _1056 + 1;
        _1042 = _1058;
    }
    int _1060 = _1042;
    if (!_1004)
    {
        int _1062 = ~_1008;
        int _1064 = _1062 + 1;
        _1044 = _1064;
    }
    int _1066 = _1044;
    if (_938)
    {
        int _1068 = int(0x80000000) & as_type<int>(_898);
        int _1070 = _1002 | _1068;
        _1046 = _1070;
    }
    int _1072 = _1046;
    bool _1074 = !_918;
    bool _1076 = _1074 && _1014;
    int _1078 = _1072;
    float _1080 = as_type<float>(_1072);
    if (!_1076)
    {
        float _1082 = abs(_898);
        bool _1084 = _1082 != as_type<float>(0x7f800000u /* inf */);
        bool _1086 = isnan(_1082);
        bool _1088 = _1084 || _1086;
        bool _1090 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1092 = _1088 || _1090;
        float _1094 = abs(_904);
        bool _1096 = _1094 == as_type<float>(0x7f800000u /* inf */);
        float _1098 = abs(_904);
        bool _1100 = _1098 == as_type<float>(0x7f800000u /* inf */);
        bool _1102 = !_1092;
        bool _1104 = _1100 && _1102;
        if (_1104)
        {
            bool _1106 = as_type<int>(_904) >= 0;
            _986 = _1106 ? (-1) : 0;
        }
        int _1108 = _986;
        if (_1104)
        {
            _1078 = 1075235812;
        }
        int _1110 = _1078;
        int _1112 = _1110;
        if (_1104)
        {
            int _1114 = ~_1108;
            int _1116 = (_1114 != 0) ? _1110 : 1061752795;
            _1112 = _1116;
        }
        int _1118 = _1112;
        float _1120 = as_type<float>(_1118);
        if (_1104)
        {
            int _1122 = int(0x80000000) & as_type<int>(_898);
            int _1124 = _1118 | _1122;
            _1120 = as_type<float>(_1124);
        }
        float _1126 = _1120;
        bool _1128 = !_1092;
        bool _1130 = _1128 && _1096;
        _1080 = _1126;
        if (!_1130)
        {
            float _1132 = abs(_898);
            float _1134 = abs(_904);
            float _1136 = precise::max(_1132, _1134);
            float _1138 = abs(_898);
            float _1140 = abs(_904);
            float _1142 = precise::min(_1138, _1140);
            float _1144 = 1.0 / _1136;
            float _1146 = abs(_898);
            float _1148 = abs(_904);
            bool _1150 = _1146 > _1148;
            bool _1152 = as_type<int>(_904) >= 0;
            float _1154 = _1142 * _1144;
            float _1156 = _1154 * _1154;
            float _1158 = _1156 + 11.33538818359375;
            float _1160 = fma(_1156, _1158, 28.84246826171875);
            float _1162 = fma(_1156, _1160, 19.6966705322265625);
            float _1164 = fma(_1156, -0.82336294651031494140625, -5.674867153167724609375);
            float _1166 = fma(_1156, _1164, -6.565555095672607421875);
            float _1168 = 1.0 / _1162;
            float _1170 = _1156 * _1166;
            float _1172 = abs(_898);
            float _1174 = abs(_904);
            float _1176 = _1172 + _1174;
            int _1178 = as_type<int>(_898) & int(0x80000000);
            float _1180 = _1154 * _1170;
            bool _1182 = _1176 > as_type<float>(0x7f800000u /* inf */);
            bool _1184 = isnan(_1176);
            bool _1186 = _1182 || _1184;
            bool _1188 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1190 = _1186 || _1188;
            float _1192 = fma(_1180, _1168, _1154);
            float _1194 = _1192;
            _1080 = _1176;
            if (_1150)
            {
                float _1196 = -_1192;
                float _1198 = _1196 + 1.57079637050628662109375;
                _1194 = _1198;
            }
            float _1200 = _1194;
            int _1202 = as_type<int>(_1200);
            if (!_1152)
            {
                float _1204 = -_1200;
                float _1206 = _1204 + 3.1415927410125732421875;
                _1202 = as_type<int>(_1206);
            }
            int _1208 = _1202;
            if (!_1190)
            {
                int _1210 = _1178 | _1208;
                _1080 = as_type<float>(_1210);
            }
        }
    }
    float _1212 = _1080;
    float _1214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1216 = log2(_1214);
    float _1218 = _924 * _1016;
    float _1220 = _952 * _1016;
    if (_1054)
    {
        _988 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1222 = _988;
    float _1224 = -_1218;
    float _1226 = fma(_1224, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _1228 = -_1220;
    float _1230 = fma(_1228, (*spvDescriptorSet0.vp_c9)._m0[18].w, _952);
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1234 = _1232 != 0;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1242 = _1240 != 0;
    int _1244 = as_type<int>(_1222);
    if (_1054)
    {
        float _1246 = _1222 * 5.0;
        _1244 = as_type<int>(_1246);
    }
    int _1248 = _1244;
    float _1250 = _1226 * _1226;
    float _1252 = _968 * _1016;
    float _1254 = precise::max(_1212, -3.1415927410125732421875);
    if (_1054)
    {
        out.m_47.x = 0.0;
    }
    float _1256 = fma(_1230, _1230, _1250);
    float _1258 = -_1252;
    float _1260 = fma(_1258, (*spvDescriptorSet0.vp_c9)._m0[18].w, _968);
    float _1262 = _1216 * _138;
    float _1264 = precise::min(_1254, 3.1415927410125732421875);
    float _1266 = fma(_1260, _1260, _1256);
    if (_1054)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4303 = as_type<float>(_1248);
        out.gl_Position.z = _4303;
    }
    bool _1268 = !_1234;
    int _1270 = _1268 ? 0 : 1;
    float _1272 = fma(_1264, 0.15915493667125701904296875, 0.5);
    float _1274 = in.m_71.x;
    float _1276 = in.m_71.y;
    float _1278 = in.m_71.z;
    float _1280 = exp2(_1262);
    bool _1282 = !_1238;
    int _1284 = _1282 ? 0 : 1;
    float _1286 = fma(_138, 0.06666667759418487548828125, _1272);
    int _1288 = abs(_1270);
    float _1290 = _1286 * 6.283185482025146484375;
    bool _1292 = !_1242;
    int _1294 = _1292 ? 0 : 1;
    float _1296 = sqrt(_1266);
    int _1298 = abs(_1284);
    bool _1300 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1302 = isnan(1.0);
    bool _1304 = _1300 || _1302;
    bool _1306 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1308 = _1304 || _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1312 = 1.0 + _1310;
    float _1314 = float(_1066);
    float _1316 = 1.0 / _1312;
    int _1318 = abs(_1294);
    float _1320 = -_1280;
    float _1322 = _1320 + 1.0;
    float _1324 = float(_1288);
    float _1326 = float(_1060);
    float _1328 = _1324 * _1314;
    float _1330 = float(_1298);
    float _1332 = float(_1052);
    float _1334 = _1328 * (-2.0);
    float _1336 = float(_1318);
    float _1338 = _1330 * _1326;
    bool _1340 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1342 = isnan(0.0);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1348 = _1344 || _1346;
    float _1350 = fma(_1334, _1274, _1274);
    float _1352 = fma(_838, _1334, _838);
    float _1354 = _1336 * _1332;
    float _1356 = _1348 ? _1322 : 0.0;
    float _1358 = _1338 * (-2.0);
    float _1360 = _160 + (-0.5);
    if (_1308)
    {
        float _1362 = _1356 * _1316;
        _142 = _1362;
    }
    float _1364 = _142;
    float _1366 = fma(_1032, _1358, _1032);
    float _1368 = fma(_1358, _1276, _1276);
    float _1370 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1350);
    if (_1054)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1372 = -_1218;
    float _1374 = fma(_1372, (*spvDescriptorSet0.vp_c9)._m0[18].w, _874);
    float _1376 = -_1220;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _1380 = fma(_1352, _1364, _1370);
    float _1382 = -_1252;
    float _1384 = fma(_1382, (*spvDescriptorSet0.vp_c9)._m0[18].w, _948);
    float _1386 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1388 = _1374 + _1386;
    float _1390 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1392 = _1378 + _1390;
    float _1394 = _742 + (-0.5);
    float _1396 = _1290 * 0.15915493667125701904296875;
    float _1398 = _1388 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1400 = _1380 * 0.15915493667125701904296875;
    float _1402 = _160 + _854;
    float _1404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1406 = _1384 + _1404;
    float _1408 = fma(_1392, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1398);
    float _1410 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1368);
    float _1412 = _1402 + (-1.0);
    float _1414 = _1354 * (-2.0);
    float _1416 = fma(_1406, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1408);
    float _1418 = fma(_1366, _1364, _1410);
    float _1420 = fma(_1412, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1422 = fma(_1414, _1278, _1278);
    float _1424 = _854 + (-0.5);
    bool _1426 = _1416 >= 0.0;
    float _1428 = fma(_1420, _1414, _1420);
    float _1430 = _1418 * 0.15915493667125701904296875;
    float _1432 = fma(_1424, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1422);
    float _1434 = in.m_53.x;
    float _1436 = in.m_53.y;
    float _1438 = in.m_53.z;
    float _1440 = _1400 * 6.283185482025146484375;
    float _1442 = sin(_1440);
    float _1444 = fma(_1428, _1364, _1432);
    float _1446 = in.m_61.z;
    float _1448 = _1444 * 0.15915493667125701904296875;
    float _1450 = _1400 * 6.283185482025146484375;
    float _1452 = cos(_1450);
    float _1454 = _1418;
    if (_1426)
    {
        _1454 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1456 = _1454;
    int _1458 = as_type<int>(_1456);
    if (_1426)
    {
        out.m_47.x = 0.0;
    }
    if (_1426)
    {
        float _1460 = _1456 * 5.0;
        _1458 = as_type<int>(_1460);
    }
    int _1462 = _1458;
    float _1464 = _1396 * 6.283185482025146484375;
    float _1466 = sin(_1464);
    if (_1426)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4600 = as_type<float>(_1462);
        out.gl_Position.z = _4600;
    }
    float _1468 = _1430 * 6.283185482025146484375;
    float _1470 = sin(_1468);
    float _1472 = _1430 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1448 * 6.283185482025146484375;
    float _1478 = sin(_1476);
    if (_1426)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1480 = _1448 * 6.283185482025146484375;
    float _1482 = cos(_1480);
    float _1484 = _588 * _1436;
    float _1486 = _586 * _1434;
    float _1488 = fma(_1466, 0.5, 1.5);
    float _1490 = _590 * _1438;
    float _1492 = _1016 * _1296;
    float _1494 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1496 = _1488 * _662;
    float _1498 = _1488 * _664;
    float _1500 = _1484 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1502 = _1488 * _1446;
    float _1504 = _1490 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1506 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1496);
    float _1508 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1498);
    float _1510 = _1492 * _1494;
    float _1512 = _1492 * _1500;
    float _1514 = _1452 * _1482;
    float _1516 = _1492 * _1504;
    float _1518 = _1442 * _1470;
    float _1520 = _1452 * _1474;
    float _1522 = _1452 * _1470;
    float _1524 = _1442 * _1474;
    float _1526 = _1506 * _1510;
    float _1528 = _1508 * _1512;
    float _1530 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1532 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1534 = _1514 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1536 = fma(_1478, _1520, _1518);
    float _1538 = -_1522;
    float _1540 = fma(_1478, _1524, _1538);
    float _1542 = fma(_1478, _1518, _1520);
    float _1544 = -_1524;
    float _1546 = fma(_1478, _1522, _1544);
    float _1548 = -_1478;
    float _1550 = fma(_1548, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1530);
    float _1552 = -_1478;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1532);
    float _1556 = -_1478;
    float _1558 = fma(_1556, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1534);
    float _1560 = _1474 * _1482;
    float _1562 = -_1528;
    float _1564 = _1478 * _1562;
    float _1566 = _1442 * _1482;
    float _1568 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1502);
    float _1570 = _1514 * _1528;
    float _1572 = _1470 * _1482;
    float _1574 = fma(_1560, _1526, _1564);
    float _1576 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1578 = _1566 * _1528;
    float _1580 = _1568 * _1516;
    float _1582 = fma(_1536, _1526, _1570);
    float _1584 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1576);
    float _1586 = fma(_1540, _1526, _1578);
    float _1588 = fma(_1572, _1580, _1574);
    float _1590 = fma(_1546, _1580, _1582);
    float _1592 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1584);
    float _1594 = fma(_1542, _1580, _1586);
    float _1596 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1600 = _1546 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1602 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1604 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1606 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1608 = _1536 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1610 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1612 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1598);
    float _1614 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1602);
    float _1616 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1604);
    float _1618 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1606);
    float _1620 = fma(_1560, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1608);
    float _1622 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1614);
    float _1624 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1616);
    float _1626 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1618);
    float _1628 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1620);
    float _1630 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1550);
    float _1632 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1554);
    float _1634 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1558);
    float _1636 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1638 = _1624 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1640 = in.m_73.x;
    float _1642 = in.m_73.y;
    float _1644 = in.m_73.z;
    bool _1646 = _1498 != 0.0;
    bool _1648 = isnan(_1498);
    bool _1650 = _1646 || _1648;
    bool _1652 = isnan(0.0);
    bool _1654 = _1650 || _1652;
    float _1656 = _752 + _1636;
    float _1658 = _948 + _1638;
    float _1660 = fma(_1572, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1600);
    bool _1662 = _1496 == 0.0;
    bool _1664 = !_1654;
    bool _1666 = _1662 && _1664;
    float _1668 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1670 = _1656 + _1668;
    float _1672 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1674 = _1658 + _1672;
    float _1676 = in.m_75.x;
    float _1678 = in.m_75.y;
    float _1680 = in.m_75.z;
    float _1682 = in.m_75.w;
    bool _1684 = _1502 == 0.0;
    bool _1686 = _1684 && _1666;
    float _1688 = _1670 * _1670;
    float _1690 = _1674 * _1674;
    float _1692 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1610);
    float _1694 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1612);
    float _1696 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1660);
    float _1698 = _1688 + _1690;
    float _1700 = sqrt(_1698);
    float _1702 = _1636;
    float _1704 = _1506;
    float _1706 = _1624;
    float _1708 = _1688;
    float _1710 = _1690;
    float _1712 = _1656;
    float _1714 = _1658;
    float _1716 = _1592;
    if (_1686)
    {
        _1702 = _1644;
    }
    float _1718 = _1702;
    float _1720 = _1718;
    if (!_1686)
    {
        float _1722 = fma(_1502, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1644);
        _1720 = _1722;
    }
    float _1724 = _1720;
    float _1726 = _1590 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    if (_1686)
    {
        _1704 = _1640;
    }
    float _1728 = _1704;
    float _1730 = _1728;
    if (!_1686)
    {
        float _1732 = fma(_1496, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1640);
        _1730 = _1732;
    }
    float _1734 = _1730;
    if (_1686)
    {
        _1706 = _1642;
    }
    float _1736 = _1706;
    float _1738 = fma(_1588, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1726);
    float _1740 = _1736;
    if (!_1686)
    {
        float _1742 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1642);
        _1740 = _1742;
    }
    float _1744 = _1740;
    float _1746 = _1630 * _1678;
    float _1748 = _1632 * _1678;
    float _1750 = fma(_1594, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1738);
    bool _1752 = _1700 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1754 = _1634 * _1678;
    float _1756 = fma(_1626, _1676, _1746);
    float _1758 = _1680 * _1640;
    float _1760 = _1676 * _1642;
    float _1762 = _1678 * _1644;
    float _1764 = _1750 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1766 = fma(_1592, _1676, _1748);
    float _1768 = fma(_1628, _1676, _1754);
    float _1770 = -_1758;
    float _1772 = fma(_1676, _1644, _1770);
    float _1774 = -_1760;
    float _1776 = fma(_1678, _1640, _1774);
    float _1778 = -_1762;
    float _1780 = fma(_1680, _1642, _1778);
    float _1782 = _874 + _1764;
    float _1784 = _1772 * _1682;
    float _1786 = _1776 * _1682;
    float _1788 = _1780 * _1682;
    float _1790 = fma(_1692, _1680, _1756);
    float _1792 = fma(_1694, _1680, _1766);
    float _1794 = fma(_1696, _1680, _1768);
    float _1796 = _1682;
    if (!_1752)
    {
        _1796 = _1782;
    }
    float _1798 = _1796;
    bool _1800 = !_1752;
    float _1802 = _1798;
    if (!_1800)
    {
        float _1804 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1806 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1808 = _1700 + _1806;
        float _1810 = _1782 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1812 = rsqrt(_1698);
        float _1814 = _1808 * _1804;
        float _1816 = _1814 * 0.15915493667125701904296875;
        float _1818 = _1816 * 6.283185482025146484375;
        float _1820 = sin(_1818);
        float _1822 = _1816 * 6.283185482025146484375;
        float _1824 = cos(_1822);
        float _1826 = fma(_1820, _1810, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1828 = _1812 * _1826;
        float _1830 = fma(_1670, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1832 = _1824 + (-1.0);
        float _1834 = fma(_1674, _1828, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1836 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1838 = _1830 + _1836;
        float _1840 = _1832 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1844 = _1834 + _1842;
        float _1846 = _1838 * _1838;
        float _1848 = fma(_1782, _1824, _1840);
        float _1850 = _1844 * _1844;
        _1802 = _1848;
        _1708 = _1846;
        _1710 = _1850;
        _1712 = _1830;
        _1714 = _1834;
    }
    float _1852 = _1802;
    float _1854 = _1708;
    float _1856 = _1710;
    float _1858 = _1712;
    float _1860 = _1714;
    float _1862 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1864 = _1852 + _1862;
    float _1866 = _1630 * _1744;
    float _1868 = _1632 * _1744;
    float _1870 = _1634 * _1744;
    float _1872 = fma(_1864, _1864, _1854);
    float _1874 = _1784 * _1630;
    float _1876 = _1784 * _1632;
    float _1878 = _1784 * _1634;
    float _1880 = _1872 + _1856;
    float _1882 = fma(_1626, _1734, _1866);
    float _1884 = fma(_1592, _1734, _1868);
    float _1886 = fma(_1628, _1734, _1870);
    float _1888 = fma(_1788, _1626, _1874);
    float _1890 = fma(_1788, _1592, _1876);
    float _1892 = sqrt(_1880);
    float _1894 = fma(_1788, _1628, _1878);
    float _1896 = fma(_1692, _1724, _1882);
    float _1898 = fma(_1694, _1724, _1884);
    float _1900 = fma(_1696, _1724, _1886);
    float _1902 = fma(_1786, _1692, _1888);
    float _1904 = fma(_1786, _1694, _1890);
    float _1906 = fma(_1786, _1696, _1894);
    out.m_77.x = _1790;
    out.m_77.y = _1792;
    out.m_77.z = _1794;
    out.m_79.x = _1896;
    out.m_79.y = _1898;
    out.m_79.z = _1900;
    out.m_81.x = _1902;
    out.m_81.y = _1904;
    out.m_81.z = _1906;
    bool _1908 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1910 = isnan(_1892);
    bool _1912 = _1908 || _1910;
    bool _1914 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1916 = _1912 || _1914;
    float _1918 = _1904;
    if (!_1916)
    {
        _1716 = 1.0;
    }
    float _1920 = _1716;
    bool _1922 = !_1916;
    float _1924 = _1920;
    if (!_1922)
    {
        bool _1926 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1928 = isnan(_1892);
        bool _1930 = _1926 || _1928;
        bool _1932 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1934 = _1930 || _1932;
        if (!_1934)
        {
            float _1936 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1938 = _1892 + _1936;
            float _1940 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1942 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1940;
            float _1944 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1946 = _1944 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1948 = 1.0 / _1942;
            float _1950 = _1938 * _1948;
            float _1952 = fma(_1950, _1946, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1924 = _1952;
            _1954 = true;
        }
        else
        {
            bool _1956 = _1892 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1958 = isnan(_1892);
            bool _1960 = _1956 || _1958;
            bool _1962 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1964 = _1960 || _1962;
            if (!_1964)
            {
                float _1966 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1968 = _1892 + _1966;
                float _1970 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1972 = _1970 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1974 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1976 = _1974 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1978 = 1.0 / _1972;
                float _1980 = _1968 * _1978;
                float _1982 = fma(_1980, _1976, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1924 = _1982;
                _1954 = true;
            }
            else
            {
                _1924 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1954 = false;
    float _1984 = _1924;
    float _1986 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1988 = _1858 + _1986;
    float _1990 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1992 = _1852 + _1990;
    float _1994 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1996 = _1860 + _1994;
    bool _1998 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2000 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2002 = _1998 || _2000;
    bool _2004 = isnan(0.5);
    bool _2006 = _2002 || _2004;
    float _2008 = fma(_1988, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2010 = fma(_1992, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2012 = fma(_1996, _1984, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2014 = -_1220;
    float _2016 = fma(_2014, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2008);
    float _2018 = -_1218;
    float _2020 = fma(_2018, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2010);
    float _2022 = -_1252;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2012);
    float _2026 = _2020;
    float _2028 = _2016;
    float _2030 = _2024;
    if (!_2006)
    {
        float _2032 = _1388 * _1388;
        float _2034 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2036 = -_752;
        float _2038 = _2036 + _2008;
        float _2040 = -_948;
        float _2042 = _2040 + _2012;
        float _2044 = fma(_1392, _1392, _2032);
        float _2046 = fma(_1406, _1406, _2044);
        float _2048 = 1.0 / _1492;
        float _2050 = sqrt(_2046);
        float _2052 = precise::min(_2050, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2054 = _2052 * _2034;
        float _2056 = -_874;
        float _2058 = _2056 + _2010;
        float _2060 = _2054 * _2048;
        float _2062 = fma(_2038, _2060, _1378);
        float _2064 = fma(_2058, _2060, _1374);
        float _2066 = fma(_2042, _2060, _1384);
        _2026 = _2064;
        _2028 = _2062;
        _2030 = _2066;
    }
    float _2068 = _2026;
    float _2070 = _2028;
    float _2072 = _2030;
    float _2074 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2076 = _2068 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2080 = _2070 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2084 = _2072 + _2082;
    float _2086 = _2076 * _2076;
    float _2088 = fma(_2080, _2080, _2086);
    float _2090 = fma(_2084, _2084, _2088);
    float _2092 = rsqrt(_2090);
    float _2094 = _2092 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2096 = _2080 * _2094;
    float _2098 = _2084 * _2094;
    float _2100 = _2096 * _2096;
    float _2102 = _2098 * _2098;
    float _2104 = _2100 + _2102;
    float _2106 = sqrt(_2104);
    bool _2108 = _2106 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2110 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2112 = _2106 + _2110;
    float _2114 = _2092;
    float _2116 = _2104;
    float _2118 = _2112;
    float _2120 = _2076;
    float _2122 = _2094;
    float _2124 = _2096;
    if (_2108)
    {
        float _2126 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2114 = _2126;
    }
    float _2128 = _2114;
    if (_2108)
    {
        float _2130 = rsqrt(_2104);
        _2116 = _2130;
    }
    float _2132 = _2116;
    if (_2108)
    {
        float _2134 = _2112 * _2128;
        _2118 = _2134;
    }
    float _2136 = _2118;
    if (_2108)
    {
        float _2138 = _2136 * 0.15915493667125701904296875;
        _1918 = _2138;
    }
    float _2140 = _1918;
    float _2142 = _2128;
    float _2144 = _2140;
    if (_2108)
    {
        float _2146 = _2140 * 6.283185482025146484375;
        float _2148 = sin(_2146);
        _2142 = _2148;
    }
    float _2150 = _2142;
    float _2152 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2154 = precise::max(0.0, _2152);
    float _2156 = _2084;
    float _2158 = _2154;
    if (_2108)
    {
        float _2160 = _2140 * 6.283185482025146484375;
        float _2162 = cos(_2160);
        _2156 = _2162;
    }
    float _2164 = _2156;
    float _2166 = -_2094;
    float _2168 = -_2154;
    float _2170 = fma(_2076, _2166, _2168);
    float _2172 = _2170;
    if (!_2108)
    {
        _2120 = _2100;
    }
    float _2174 = _2120;
    float _2176 = _2174;
    if (_2108)
    {
        float _2178 = _2170 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2158 = _2178;
    }
    float _2180 = _2158;
    float _2182 = _2150;
    float _2184 = _2180;
    if (_2108)
    {
        float _2186 = fma(_2150, _2180, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2182 = _2186;
    }
    float _2188 = _2182;
    float _2190 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2192 = _2188;
    if (_2108)
    {
        float _2194 = _2164 + (-1.0);
        _2184 = _2194;
    }
    float _2196 = _2184;
    float _2198 = _2196;
    if (_2108)
    {
        float _2200 = _2132 * _2188;
        _2122 = _2200;
    }
    float _2202 = _2122;
    if (!_2108)
    {
        _2192 = _2098;
    }
    float _2204 = _2192;
    float _2206 = sqrt(_2090);
    float _2208 = _2204;
    if (_2108)
    {
        float _2210 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2144 = _2210;
    }
    float _2212 = _2144;
    if (_2108)
    {
        float _2214 = _2096 * _2202;
        _2124 = _2214;
    }
    float _2216 = _2124;
    if (_2108)
    {
        float _2218 = _2098 * _2202;
        _2208 = _2218;
    }
    float _2220 = _2208;
    if (!_2108)
    {
        _2198 = _2102;
    }
    float _2222 = _2198;
    float _2224 = _2222;
    if (_2108)
    {
        float _2226 = fma(_2170, _2164, _2212);
        _2172 = _2226;
    }
    float _2228 = _2172;
    if (_2108)
    {
        float _2230 = _2216 * _2216;
        _2176 = _2230;
    }
    float _2232 = _2176;
    if (_2108)
    {
        float _2234 = _2220 * _2220;
        _2224 = _2234;
    }
    float _2236 = _2224;
    float _2238 = fma(_2228, _2228, _2232);
    float _2240 = _2238 + _2236;
    float _2242 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2244 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2246 = fma(_2206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2244);
    float _2248 = precise::clamp(_2246, 0.0, 1.0);
    float _2250 = rsqrt(_2240);
    float _2252 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2242);
    float _2254 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2256 = -_2248;
    float _2258 = _2256 + 1.0;
    float _2260 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2252);
    float _2262 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2264 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2254);
    float _2266 = _2068 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2268 = _2260 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2270 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2262);
    float _2272 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2264);
    float _2274 = abs(_2258);
    float _2276 = log2(_2274);
    float _2278 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2266);
    float _2280 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2270);
    float _2282 = _2272 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2284 = _2268 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2286 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2278);
    float _2288 = _2250 * _2216;
    float _2290 = _2280 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2292 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2294 = -_2284;
    float _2296 = fma(_2294, _2190, 1.0);
    float _2298 = _2286 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2300 = _2250 * _2228;
    float _2302 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2304 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2292);
    float _2306 = _2250 * _2220;
    float _2308 = log2(_2296);
    float _2310 = -_2302;
    float _2312 = fma(_2300, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2310);
    float _2314 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2304);
    float _2316 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2318 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2320 = -_2306;
    float _2322 = fma(_2320, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2312);
    float _2324 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2314);
    float _2326 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2328 = exp2(_2316);
    float _2330 = fma(_2322, -0.5, 0.5);
    float _2332 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2318);
    float _2334 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2326);
    float _2336 = _2300 + 1.0;
    float _2338 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2332);
    float _2340 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2334);
    float _2342 = 1.0 / _2324;
    float _2344 = fma(_2322, 0.5, 0.5);
    float _2346 = _2308 * 0.693147182464599609375;
    float _2348 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2340);
    float _2350 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2338);
    float _2352 = fma(_2344, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2354 = sqrt(_2330);
    float _2356 = -_2300;
    float _2358 = fma(_2328, _2336, _2356);
    float _2360 = fma(_2344, _2352, -0.212114393711090087890625);
    float _2362 = _2346 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2364 = fma(_2344, _2360, 1.570728778839111328125);
    float _2366 = _2348 * _2342;
    float _2368 = _2350 * _2342;
    float _2370 = fma(_2366, 0.5, 0.5);
    float _2372 = fma(_2368, -0.5, 0.5);
    float _2374 = fma(_2358, 0.5, 0.5);
    float _2376 = _2354 * 0.636619746685028076171875;
    float3 _6128 = float3(_2370, _2372, _2362);
    float _2378 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6128, float3(0.0), isnan(_6128)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6128, float3(0.0), isnan(_6128)), level(0.0)).x;
    float3 _6139 = float3(_2370, _2372, _2362);
    float4 _2381 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6139, float3(0.0), isnan(_6139)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6139, float3(0.0), isnan(_6139)), level(0.0)).xyzw;
    float _2383 = _2381.x;
    float _2385 = _2381.y;
    float _2387 = _2381.z;
    float _2389 = _2381.w;
    float _2391 = -_2364;
    float _2393 = fma(_2376, _2391, 1.0);
    float2 _6161 = float2(_2393, _2374);
    float3 _2397 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6161, float2(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6161, float2(0.0), isnan(_6161)), level(0.0)).xyz;
    float _2399 = _2397.x;
    float _2401 = _2397.y;
    float _2403 = _2397.z;
    float _2405 = _2276 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2407 = _2282 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2409 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2411 = fma(_2290, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2407);
    float _2413 = exp2(_2405);
    float _2415 = _2409 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2417 = fma(_2268, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2411);
    float _2419 = _2348 + _2324;
    float _2421 = fma(_2298, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2417);
    float _2423 = _2419 * 0.5;
    float _2425 = _2324 * 0.5;
    out.m_47.x = _2415;
    float _2427 = _2421 + _2324;
    out.gl_Position.x = _2348;
    out.gl_Position.y = _2350;
    out.gl_Position.z = _2421;
    out.gl_Position.w = _2324;
    float _2429 = _2427 * 0.5;
    float _2431 = -_2413;
    float _2433 = _2431 + 1.0;
    float _2435 = _2433 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2437 = fma(_2350, -0.5, _2425);
    out.m_83.x = _2423;
    out.m_83.y = _2437;
    out.m_83.z = _2429;
    out.m_83.w = _2324;
    float _2439 = _2435 * _2378;
    float _2441 = -_2435;
    float _2443 = _2441 + 1.0;
    float _2445 = _2389 * _2439;
    float _2447 = _2403 * _2439;
    float _2449 = fma(_2399, _2445, _2383);
    float _2451 = fma(_2401, _2445, _2385);
    float _2453 = _2389 * _2443;
    float _2455 = fma(_2389, _2447, _2387);
    out.m_85.x = _2449;
    out.m_85.y = _2451;
    out.m_85.z = _2455;
    out.m_85.w = _2453;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

