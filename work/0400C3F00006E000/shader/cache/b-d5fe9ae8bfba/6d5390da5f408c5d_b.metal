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
    float4 m_77 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_87 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_97 [[user(locn9)]];
    float4 m_93 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_81 [[attribute(8)]];
    float4 m_79 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_83 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _354 = false;
    bool _240 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2646 = as_type<float>(_134);
        out.gl_Position.z = _2646;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2715 = as_type<float>(_172);
        out.gl_Position.z = _2715;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = _176 * _184;
    float _202 = _176 * _190;
    float _204 = fma(_174, _182, _200);
    float _206 = _176 * _196;
    float _208 = fma(_174, _188, _202);
    float _210 = fma(_178, _186, _204);
    float _212 = fma(_174, _194, _206);
    float _214 = fma(_178, _192, _208);
    float _216 = fma(_178, _198, _212);
    bool _218 = !_180;
    float _220 = _192;
    float _238;
    if (!_218)
    {
        float _222 = in.m_63.x;
        float _224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _228 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _230 = _228 * _224;
        float _232 = floor(_230);
        float _234 = -_232;
        float _236 = _230 + _234;
        _238 = _236;
        _240 = true;
    }
    else
    {
        float _242 = float(_118);
        float _244 = 1.0 / _242;
        float _246 = _152 * _244;
        _238 = _246;
    }
    _240 = false;
    float _248 = _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _248 + _250;
    bool _254 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_248);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = 1.0 / _268;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _252 * _272;
    bool _284 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_248);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = fma(_280, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = _294 * _276;
    float _308 = fma(_298, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_304, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = -_294;
    float _314 = _312 + 1.0;
    float _316 = _300 * _306;
    float _318 = _308 * _306;
    float _320 = _310 * _306;
    float _322 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _316);
    float _324 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _318);
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _320);
    float _328 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].x, _324);
    float _330 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].y, _326);
    float _332 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].z, _322);
    bool _334 = !_270;
    float _352;
    if (!_334)
    {
        float _336 = in.m_63.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_118);
        float _358 = 1.0 / _356;
        float _360 = _152 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = in.m_65.x;
    float _366 = in.m_65.y;
    float _368 = in.m_65.z;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_48.x;
    float _376 = in.m_48.y;
    float _378 = in.m_48.z;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _382 = _380 != 0;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _386 = _384 != 0;
    float _388 = in.m_67.y;
    float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = in.m_63.z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _408 = in.m_63.y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _412 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = in.m_69.x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _372 * _152;
    float _422 = in.m_63.x;
    float _424 = _328 * _364;
    float _426 = _190 * _376;
    float _428 = _196 * _376;
    float _430 = in.m_69.y;
    float _432 = exp2(_420);
    float _434 = _376 + _388;
    float _436 = fma(_188, _374, _426);
    float _438 = fma(_194, _374, _428);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _444 = fma(_192, _378, _436);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _448 = _408 + _404;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _454 = fma(_198, _378, _438);
    float _456 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = 1.0 / _442;
    float _460 = _404 * 2.0;
    bool _462 = false;
    float _464 = _452;
    int _466 = as_type<int>(_438);
    if (!_382)
    {
        _220 = _414;
    }
    float _468 = _220;
    out.m_71.x = _456;
    out.m_71.y = _412;
    out.m_71.z = _418;
    out.m_71.w = _416;
    bool _470 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(1.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _482 = 1.0 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _484;
    float _488 = 1.0 / _452;
    float _490 = _468;
    if (_382)
    {
        bool _492 = _422 > 0.5;
        _462 = _492;
    }
    bool _494 = _462;
    float _496 = 1.0 / _482;
    if (!_382)
    {
        _464 = _468;
    }
    float _498 = _464;
    float _500 = _448 + (-1.0);
    float _502 = _486 * _458;
    float _504 = _498;
    if (_382)
    {
        _490 = _414;
    }
    float _506 = _490;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _514 = _422 * 2.0;
    float _516 = floor(_460);
    int _518 = as_type<int>(_512);
    if (_382)
    {
        float _520 = -_506;
        float _522 = _520 + 1.0;
        _466 = as_type<int>(_522);
    }
    int _524 = _466;
    float _526 = _510 * _488;
    float _528 = -_430;
    float _530 = _528 + 1.0;
    float _532 = in.m_61.w;
    float _534 = _408 * 2.0;
    if (_382)
    {
        float _536 = _494 ? as_type<float>(_524) : _506;
        _504 = _536;
    }
    float _538 = _504;
    float _540 = -_432;
    float _542 = _540 + 1.0;
    float _544 = floor(_514);
    float _546 = _422 + _408;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = in.m_59.w;
    bool _560 = _408 > 0.5;
    float _562 = _546 + (-1.0);
    float _564 = _556 ? _542 : 0.0;
    int _566 = _560 ? as_type<int>(_530) : as_type<int>(_430);
    float _568 = floor(_534);
    bool _570 = _516 >= 0.0;
    bool _572 = isnan(_516);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    if (_478)
    {
        float _580 = _564 * _496;
        _156 = _580;
    }
    float _582 = _156;
    bool _584 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = isnan(_362);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    bool _596 = _516 > 0.0;
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _600 = _578 ? 0 : 1;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _362 + _602;
    bool _606 = _544 > 0.0;
    bool _608 = _544 >= 0.0;
    bool _610 = isnan(_544);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = -_594;
    float _620 = _618 + 1.0;
    bool _622 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _624 = isnan(_362);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = fma(_502, _604, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _636 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _638 = isnan(_362);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _362 + _648;
    int _652 = ~_600;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = _632 * _620;
    float _660 = -_632;
    float _662 = _660 + 1.0;
    int _664 = _656;
    if (!_596)
    {
        int _666 = ~_600;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = fma(_526, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _674 = _616 ? 0 : 1;
    float _676 = _646 * _662;
    float _678 = _454 + _532;
    bool _680 = _568 > 0.0;
    float _682 = _444 + _558;
    float _684 = _634 * _676;
    float _686 = -_646;
    float _688 = _686 + 1.0;
    bool _690 = _568 >= 0.0;
    bool _692 = isnan(_568);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _434 + _700;
    bool _704 = !_394;
    int _706 = _704 ? 0 : 1;
    float _708 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _682 + _710;
    int _714 = ~_674;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _722 = fma(_672, _658, _708);
    int _724 = abs(_706);
    float _726 = _702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _728 = _718;
    if (!_606)
    {
        int _730 = ~_674;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = _702 * _702;
    float _738 = _386 ? as_type<float>(_566) : _430;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _678 + _740;
    float _744 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[28].x, _726);
    float _746 = float(_724);
    int _748 = _698 ? 0 : 1;
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].z, _744);
    float _752 = float(_670);
    float _754 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _756 = ~_748;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    float _762 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[117].x, _722);
    bool _764 = _750 >= 0.0;
    float _766 = _746 * _752;
    bool _768 = !_398;
    int _770 = _768 ? 0 : 1;
    float _772 = _754 * _390;
    int _774 = _760;
    if (!_680)
    {
        int _776 = ~_748;
        int _778 = _776 + 1;
        _774 = _778;
    }
    int _780 = _774;
    float _782 = _538 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _784 = in.m_73.x;
    float _786 = in.m_73.y;
    float _788 = in.m_73.z;
    int _790 = abs(_770);
    float _792 = _782 * _720;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _802 = float(_790);
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = float(_734);
    float _808 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _766 * (-2.0);
    out.m_75.x = _792;
    out.m_75.y = _772;
    out.m_75.z = _506;
    out.m_75.w = _430;
    float _814 = _802 * _806;
    float _816 = fma(_712, _712, _736);
    float _818 = 0.0;
    if (_764)
    {
        _818 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _820 = _818;
    out.m_77.x = _804;
    out.m_77.y = _808;
    out.m_77.z = _810;
    out.m_77.w = _798;
    float _822 = _814 * (-2.0);
    float _824 = fma(_742, _742, _816);
    float _826 = fma(_598, _812, _598);
    if (_764)
    {
        out.m_51.x = 0.0;
    }
    float _828 = fma(_812, _784, _784);
    float _830 = _422 + (-0.5);
    float _832 = rsqrt(_824);
    float _834 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _836 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _828);
    bool _838 = !_402;
    int _840 = _838 ? 0 : 1;
    float _842 = fma(_822, _786, _786);
    float _844 = fma(_512, _822, _512);
    float _846 = _788;
    if (_764)
    {
        float _848 = _820 * 5.0;
        _518 = as_type<int>(_848);
    }
    int _850 = _518;
    float _852 = _834 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _854 = abs(_840);
    float _856 = fma(_826, _582, _836);
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3783 = as_type<float>(_850);
        out.gl_Position.z = _3783;
    }
    float _858 = float(_854);
    float _860 = _852 * _832;
    float _862 = _408 + (-0.5);
    float _864 = _712 * _860;
    float _866 = _702 * _860;
    float _868 = _866;
    if (_764)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _870 = -_866;
    float _872 = _434 + _870;
    float _874 = _742 * _860;
    float _876 = -_864;
    float _878 = _682 + _876;
    float _880 = float(_780);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _872 + _882;
    float _886 = -_874;
    float _888 = _678 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _878 + _890;
    float _894 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _900 = _888 + _898;
    float _902 = _422 + _404;
    float _904 = _858 * _880;
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    float _908 = fma(_844, _582, _894);
    float _910 = -_866;
    float _912 = _702 + _910;
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[28].z, _906);
    float _916 = _902 + (-1.0);
    float _918 = _904 * (-2.0);
    float _920 = _908 * 0.15915493667125701904296875;
    float _922 = -_864;
    float _924 = _712 + _922;
    bool _926 = _914 >= 0.0;
    float _928 = _912 * _912;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _932 = fma(_918, _788, _788);
    float _934 = _404 + (-0.5);
    float _936 = fma(_924, _924, _928);
    float _938 = -_874;
    float _940 = _742 + _938;
    float _942 = fma(_930, _918, _930);
    float _944 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].z, _932);
    float _946 = _856 * 0.15915493667125701904296875;
    float _948 = fma(_940, _940, _936);
    float _950 = _920 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = fma(_942, _582, _944);
    float _956 = _874;
    if (_926)
    {
        _846 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _958 = _846;
    int _960 = as_type<int>(_958);
    if (_926)
    {
        out.m_51.x = 0.0;
    }
    float _962 = _954 * 0.15915493667125701904296875;
    if (_926)
    {
        float _964 = _958 * 5.0;
        _960 = as_type<int>(_964);
    }
    int _966 = _960;
    float _968 = _946 * 6.283185482025146484375;
    float _970 = sin(_968);
    if (_926)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3969 = as_type<float>(_966);
        out.gl_Position.z = _3969;
    }
    float _972 = _946 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _920 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = sqrt(_948);
    if (_926)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _982 = in.m_79.x;
    float _984 = in.m_79.y;
    float _986 = in.m_79.z;
    float _988 = _962 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _330 * _366;
    float _994 = _832 * _980;
    float _996 = _332 * _368;
    float _998 = _974 * _978;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1002 = _974 * _952;
    float _1004 = _962 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _996 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1010 = _834 * _994;
    float _1012 = _970 * _952;
    float _1014 = _970 * _978;
    float _1016 = _974 * _990;
    float _1018 = _994 * _1000;
    float _1020 = _978 * _990;
    float _1022 = _970 * _990;
    float _1024 = _952 * _990;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _984);
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _982);
    float _1030 = -_1014;
    float _1032 = fma(_1006, _1002, _1030);
    float _1034 = fma(_1006, _1012, _998);
    float _1036 = _1026 * _1018;
    float _1038 = _1028 * _1010;
    float _1040 = _994 * _1008;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _986);
    float _1044 = fma(_1006, _998, _1012);
    float _1046 = _1016 * _1036;
    float _1048 = -_1036;
    float _1050 = _1006 * _1048;
    float _1052 = _1042 * _1040;
    float _1054 = -_1002;
    float _1056 = fma(_1006, _1014, _1054);
    float _1058 = fma(_1044, _1038, _1046);
    float _1060 = _1022 * _1036;
    float _1062 = fma(_1020, _1038, _1050);
    float _1064 = fma(_1032, _1052, _1058);
    float _1066 = fma(_1056, _1038, _1060);
    float _1068 = fma(_1024, _1052, _1062);
    float _1070 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1072 = fma(_1034, _1052, _1066);
    float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1076 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1070);
    float _1078 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1074);
    float _1080 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1076);
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1078);
    float _1084 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1086 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1088 = _678 + _1084;
    float _1090 = _682 + _1086;
    float _1092 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1096 = _1088 + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1100 = _1090 + _1098;
    float _1102 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1092);
    float _1104 = _1096 * _1096;
    float _1106 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1102);
    float _1108 = fma(_1100, _1100, _1104);
    float _1110 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1112 = sqrt(_1108);
    float _1114 = _434 + _1110;
    bool _1116 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = _1072;
    float _1120 = _1064;
    float _1122 = _1090;
    if (!_1116)
    {
        _1118 = _1088;
    }
    float _1124 = _1118;
    float _1126 = _1124;
    if (!_1116)
    {
        _1120 = _1114;
    }
    float _1128 = _1120;
    bool _1130 = !_1116;
    float _1132 = _1128;
    if (!_1130)
    {
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1138 = _1112 + _1136;
        float _1140 = rsqrt(_1108);
        float _1142 = _1138 * _1134;
        float _1144 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = _1142 * 0.15915493667125701904296875;
        float _1148 = _1146 * 6.283185482025146484375;
        float _1150 = cos(_1148);
        float _1152 = _1146 * 6.283185482025146484375;
        float _1154 = sin(_1152);
        float _1156 = _1150 + (-1.0);
        float _1158 = fma(_1154, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1160 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1140 * _1158;
        float _1164 = fma(_1114, _1150, _1160);
        float _1166 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1168 = fma(_1096, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1126 = _1168;
        _1122 = _1166;
        _1132 = _1164;
    }
    float _1170 = _1126;
    float _1172 = _1122;
    float _1174 = _1132;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1178 = _1170 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1182 = _1172 + _1180;
    float _1184 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1186 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4325 = float2(_1186, _1184);
    float _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4325, float2(0.0), isnan(_4325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4325, float2(0.0), isnan(_4325)), level(0.0)).x;
    float _1190 = -_434;
    float _1192 = _1190 + _1174;
    float _1194 = -_682;
    float _1196 = _1194 + _1172;
    float _1198 = -_678;
    float _1200 = _1198 + _1170;
    bool _1202 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1204 = isnan(0.5);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1210 = _1206 || _1208;
    bool _1212 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1214 = isnan(0.5);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_1188, 100.0, _434);
    float _1224 = _1192 * _1192;
    float _1226 = fma(_1188, 100.0, _1174);
    float _1228 = -_866;
    float _1230 = _1228 + _1222;
    float _1232 = fma(_1196, _1196, _1224);
    float _1234 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = fma(_1200, _1200, _1232);
    float _1240 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1234);
    float _1242 = sqrt(_1238);
    float _1244 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1240);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1248 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1250 = 1.0 / _1246;
    float _1252 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1248);
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1256 = _1242 > 0.0;
    float _1258 = _1254 + _1246;
    float _1260 = _1258 * _1250;
    float _1262 = _1260 * 0.5;
    float _1264 = _1242;
    float _1266 = _1262;
    float _1268 = _1170;
    float _1270 = _1172;
    float _1272 = _1222;
    if (!_1256)
    {
        _1264 = _1172;
    }
    float _1274 = _1264;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1276);
    float _1280 = _1274;
    if (!_1256)
    {
        _1266 = _1226;
    }
    float _1282 = _1266;
    float _1284 = 1.0 / _1278;
    bool _1286 = !_1256;
    float _1288 = _1282;
    float _1290 = _1282;
    if (!_1286)
    {
        float _1292 = _210 * _210;
        float _1294 = fma(_214, _214, _1292);
        float _1296 = fma(_216, _216, _1294);
        float _1298 = rsqrt(_1238);
        float _1300 = sqrt(_1296);
        float _1302 = _1196 * _1298;
        float _1304 = _1192 * _1298;
        float _1306 = _1200 * _1298;
        bool _1308 = _1300 > 0.0;
        float _1310 = _1298;
        if (!_1308)
        {
            _1310 = _1172;
        }
        float _1312 = _1310;
        _1280 = _1312;
        if (!_1308)
        {
            _1288 = _1226;
        }
        float _1314 = _1288;
        bool _1316 = !_1308;
        _1290 = _1314;
        if (!_1316)
        {
            float _1318 = rsqrt(_1296);
            float _1320 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1322 = _210 * _1318;
            float _1324 = _214 * _1318;
            float _1326 = _1304 * _1322;
            float _1328 = _216 * _1318;
            float _1330 = fma(_1302, _1324, _1326);
            float _1332 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1334 = fma(_1306, _1328, _1330);
            float _1336 = _1334 * _1332;
            float _1338 = fma(_214, _1336, _1172);
            float _1340 = fma(_210, _1336, _1226);
            float _1342 = fma(_216, _1336, _1170);
            _1280 = _1338;
            _1268 = _1342;
            _1290 = _1340;
        }
    }
    float _1344 = _1280;
    float _1346 = _1268;
    float _1348 = _1290;
    float _1350 = -_864;
    float _1352 = _1350 + _1344;
    float _1354 = -_874;
    float _1356 = _1354 + _1346;
    float _1358 = -_866;
    float _1360 = _1358 + _1348;
    float _1362 = _1360;
    float _1364 = _1352;
    float _1366 = _1356;
    if (_1220)
    {
        _1270 = 1.0;
    }
    float _1368 = _1270;
    float _1370 = _1368;
    if (!_1210)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1374 = _1230 + _1372;
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1378 = -_678;
        float _1380 = _1378 + _1346;
        float _1382 = -_1222;
        float _1384 = _1382 + _1348;
        float _1386 = _1374 * _1374;
        float _1388 = -_682;
        float _1390 = _1388 + _1344;
        float _1392 = fma(_892, _892, _1386);
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1396 = fma(_900, _900, _1392);
        float _1398 = 1.0 / _994;
        float _1400 = sqrt(_1396);
        float _1402 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1404 = precise::min(_1400, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1406 = _1404 * _1376;
        float _1408 = _1406 * _1398;
        float _1410 = _1402 * _1408;
        float _1412 = _1380 * _1408;
        float _1414 = fma(_1384, _1410, _1230);
        float _1416 = fma(_1390, _1410, _878);
        float _1418 = fma(_1402, _1412, _888);
        _956 = _1402;
        _1362 = _1414;
        _1364 = _1416;
        _1366 = _1418;
    }
    float _1420 = _956;
    float _1422 = _1362;
    float _1424 = _1364;
    float _1426 = _1366;
    float _1428 = _1420;
    if (_1220)
    {
        _868 = 1.0;
    }
    float _1430 = _868;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1434 = _1284 * _1432;
    float _1436 = _1430;
    if (!_1220)
    {
        float _1438 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1440 = _1438 * 0.15915493667125701904296875;
        float _1442 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1444;
        float _1448 = _1440 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1442 * 0.15915493667125701904296875;
        float _1454 = _1440 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = 1.0 / _1450;
        float _1460 = _1452 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        float _1464 = _1456 * _1458;
        float _1466 = _1452 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1462 * _1464;
        float _1472 = 1.0 / _1446;
        float _1474 = 1.0 / _1470;
        float _1476 = _1468 * _1474;
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = fma(_1434, _1476, _1478);
        float _1482 = _1480 * _1472;
        float _1484 = precise::clamp(_1482, 0.0, 1.0);
        _1428 = _1472;
        _1370 = _1484;
    }
    float _1486 = _1428;
    float _1488 = _1370;
    float _1490 = _1486;
    if (!_1220)
    {
        float _1492 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = _1494 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = _1496 * 0.15915493667125701904296875;
        float _1504 = _1494 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        float _1508 = 1.0 / _1500;
        float _1510 = _1502 * 6.283185482025146484375;
        float _1512 = cos(_1510);
        float _1514 = _1506 * _1508;
        float _1516 = _1502 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        float _1520 = _1512 * _1514;
        float _1522 = 1.0 / _1520;
        float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1526 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1524;
        float _1528 = 1.0 / _1526;
        float _1530 = _1518 * _1522;
        float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1534 = fma(_1434, _1530, _1532);
        float _1536 = _1534 * _1528;
        float _1538 = precise::clamp(_1536, 0.0, 1.0);
        float _1540 = -_1538;
        float _1542 = _1540 + 1.0;
        _1490 = _1508;
        _1436 = _1542;
    }
    float _1544 = _1490;
    float _1546 = _1436;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1550 = _1422 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1554 = _1424 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1426 + _1556;
    float _1560 = _1550 * _1550;
    float _1562 = fma(_1554, _1554, _1560);
    float _1564 = fma(_1558, _1558, _1562);
    float _1566 = rsqrt(_1564);
    float _1568 = sqrt(_1564);
    float _1570 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1572 = _1554 * _1570;
    float _1574 = _1558 * _1570;
    float _1576 = _1572 * _1572;
    float _1578 = _1574 * _1574;
    float _1580 = _1576 + _1578;
    float _1582 = sqrt(_1580);
    bool _1584 = _1582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1588 = _1582 + _1586;
    float _1590 = _1558;
    float _1592 = _1560;
    float _1594 = _1588;
    float _1596 = _1544;
    float _1598 = _1576;
    if (_1584)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1590 = _1600;
    }
    float _1602 = _1590;
    if (_1584)
    {
        float _1604 = rsqrt(_1580);
        _1592 = _1604;
    }
    float _1606 = _1592;
    float _1608 = _1606;
    if (_1584)
    {
        float _1610 = _1588 * _1602;
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1584)
    {
        float _1616 = _1612 * 0.15915493667125701904296875;
        _1596 = _1616;
    }
    float _1618 = _1596;
    float _1620 = _1602;
    if (_1584)
    {
        float _1622 = _1618 * 6.283185482025146484375;
        float _1624 = sin(_1622);
        _1620 = _1624;
    }
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1630 = precise::max(0.0, _1628);
    float _1632 = _1566;
    float _1634 = _1630;
    if (_1584)
    {
        float _1636 = _1618 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        _1632 = _1638;
    }
    float _1640 = _1632;
    float _1642 = -_1570;
    float _1644 = -_1630;
    float _1646 = fma(_1550, _1642, _1644);
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1584)
    {
        float _1650 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1650;
    }
    float _1652 = _1634;
    float _1654 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1656 = _1652;
    float _1658 = _1626;
    if (_1584)
    {
        float _1660 = fma(_1626, _1652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1656 = _1660;
    }
    float _1662 = _1656;
    float _1664 = _1662;
    if (!_1584)
    {
        _1658 = _1574;
    }
    float _1666 = _1658;
    float _1668 = _1666;
    float _1670 = _1640;
    if (_1584)
    {
        float _1672 = _1640 + (-1.0);
        _1648 = _1672;
    }
    float _1674 = _1648;
    float _1676 = _1674;
    if (_1584)
    {
        float _1678 = _1606 * _1662;
        _1272 = _1678;
    }
    float _1680 = _1272;
    if (!_1584)
    {
        _1608 = _1572;
    }
    float _1682 = _1608;
    float _1684 = _1682;
    if (_1584)
    {
        float _1686 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1686;
    }
    float _1688 = _1676;
    if (_1584)
    {
        float _1690 = _1572 * _1680;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1584)
    {
        _1664 = _1646;
    }
    float _1694 = _1664;
    float _1696 = _1694;
    if (_1584)
    {
        float _1698 = _1574 * _1680;
        _1668 = _1698;
    }
    float _1700 = _1668;
    if (_1584)
    {
        float _1702 = fma(_1646, _1640, _1688);
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (_1584)
    {
        float _1706 = _1692 * _1692;
        _1598 = _1706;
    }
    float _1708 = _1598;
    if (!_1584)
    {
        _1670 = _1578;
    }
    float _1710 = _1670;
    float _1712 = _1710;
    if (_1584)
    {
        float _1714 = _1700 * _1700;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1704, _1704, _1708);
    float _1720 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = floor(_1654);
    float _1724 = _1718 + _1716;
    float _1726 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1736 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    float _1738 = -_1732;
    float _1740 = _1738 + 1.0;
    float _1742 = rsqrt(_1724);
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1614);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1752 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1754 = abs(_1740);
    float _1756 = log2(_1754);
    float _1758 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1760 = -_1750;
    float _1762 = fma(_1760, _1744, 1.0);
    float _1764 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1768 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1758);
    float _1770 = _1742 * _1692;
    float _1772 = _1742 * _1704;
    float _1774 = _1742 * _1700;
    float _1776 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1764);
    float _1778 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1768);
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = floor(_1734);
    float _1784 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1776);
    float _1786 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1788 = -_1780;
    float _1790 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1788);
    float _1792 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1794 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1796 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1798 = -_1774;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1790);
    float _1802 = exp2(_1792);
    float _1804 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1796);
    float _1806 = fma(_1800, -0.5, 0.5);
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1804);
    float _1812 = _1772 + 1.0;
    float _1814 = log2(_1762);
    float _1816 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1818 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1810);
    float _1820 = -_1782;
    float _1822 = _1734 + _1820;
    float _1824 = fma(_1808, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1826 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1816);
    float _1828 = 1.0 / _1818;
    float _1830 = -_1722;
    float _1832 = _1654 + _1830;
    float _1834 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1826);
    float _1838 = -_1772;
    float _1840 = fma(_1802, _1812, _1838);
    float _1842 = fma(_1808, _1824, -0.212114393711090087890625);
    float _1844 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1834);
    float _1846 = sqrt(_1806);
    float2 _5350 = float2(_1832, _1822);
    float _1848 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5350, float2(0.0), isnan(_5350)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5350, float2(0.0), isnan(_5350)), level(0.0)).x;
    float _1850 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1852 = _1814 * 0.693147182464599609375;
    float _1854 = fma(_1808, _1842, 1.570728778839111328125);
    float _1856 = fma(_1840, 0.5, 0.5);
    float _1858 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1860 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1836);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1864 = _1858 * _1828;
    float _1866 = _1860 * _1828;
    float _1868 = fma(_1864, 0.5, 0.5);
    float _1870 = fma(_1866, -0.5, 0.5);
    float _1872 = _1846 * 0.636619746685028076171875;
    float _1874 = -_1854;
    float _1876 = fma(_1872, _1874, 1.0);
    float3 _5405 = float3(_1868, _1870, _1862);
    float _1878 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5405, float3(0.0), isnan(_5405)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5405, float3(0.0), isnan(_5405)), level(0.0)).x;
    float3 _5416 = float3(_1868, _1870, _1862);
    float4 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5416, float3(0.0), isnan(_5416)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5416, float3(0.0), isnan(_5416)), level(0.0)).xyzw;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = _1881.w;
    float2 _5432 = float2(_1876, _1856);
    float3 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5432, float2(0.0), isnan(_5432)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5432, float2(0.0), isnan(_5432)), level(0.0)).xyz;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1905 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1907 = _984 != 0.0;
    bool _1909 = isnan(_984);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan(0.0);
    bool _1915 = _1911 || _1913;
    float _1917 = in.m_81.x;
    float _1919 = in.m_81.y;
    float _1921 = in.m_81.z;
    float _1923 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1925 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1903);
    float _1927 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    bool _1929 = _982 == 0.0;
    bool _1931 = !_1915;
    bool _1933 = _1929 && _1931;
    float _1935 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1923);
    float _1937 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1925);
    float _1939 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1927);
    bool _1941 = _986 == 0.0;
    bool _1943 = _1941 && _1933;
    float _1945 = in.m_83.x;
    float _1947 = in.m_83.y;
    float _1949 = in.m_83.z;
    float _1951 = in.m_83.w;
    float _1953 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1955 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1959 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1961 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1963 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1965 = -_1006;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1953);
    float _1969 = -_1006;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1973 = -_1006;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1957);
    float _1977 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1959);
    float _1979 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1961);
    float _1981 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1963);
    float _1983 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1985 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1971);
    float _1987 = _1963;
    float _1989 = _1981;
    float _1991 = _1975;
    float _1993 = _1959;
    if (_1943)
    {
        _1987 = _1921;
    }
    float _1995 = _1987;
    float _1997 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1975);
    float _1999 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2001 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1979);
    float _2003 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1981);
    float _2005 = _1995;
    if (_1943)
    {
        _1989 = _1995;
    }
    float _2007 = _1989;
    float _2009 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2011 = _2007;
    if (!_1943)
    {
        _2005 = _1921;
    }
    float _2013 = _2005;
    float _2015 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1943)
    {
        _1991 = _1917;
    }
    float _2017 = _1991;
    float _2019 = _2017;
    if (!_1943)
    {
        float _2021 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1917);
        _2019 = _2021;
    }
    float _2023 = _2019;
    float _2025 = _1983 * _1947;
    if (!_1943)
    {
        float _2027 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2013);
        _2011 = _2027;
    }
    float _2029 = _2011;
    float _2031 = _1997 * _1947;
    float _2033 = _1949 * _1917;
    if (_1943)
    {
        _1993 = _1919;
    }
    float _2035 = _1993;
    float _2037 = fma(_1935, _1945, _2025);
    float _2039 = _2035;
    if (!_1943)
    {
        float _2041 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1919);
        _2039 = _2041;
    }
    float _2043 = _2039;
    float _2045 = _1945 * _1919;
    float _2047 = _1947 * _2013;
    float _2049 = fma(_1939, _1945, _2031);
    float _2051 = -_2033;
    float _2053 = fma(_1945, _2013, _2051);
    float _2055 = -_2045;
    float _2057 = fma(_1947, _1917, _2055);
    float _2059 = -_2047;
    float _2061 = fma(_1949, _1919, _2059);
    float _2063 = _1985 * _1947;
    float _2065 = _2053 * _1951;
    float _2067 = exp2(_2009);
    float _2069 = _2061 * _1951;
    float _2071 = fma(_1937, _1945, _2063);
    float _2073 = _2065 * _1983;
    float _2075 = _2065 * _1985;
    float _2077 = fma(_1999, _1949, _2037);
    float _2079 = fma(_2001, _1949, _2071);
    float _2081 = _2057 * _1951;
    float _2083 = fma(_2069, _1935, _2073);
    float _2085 = _2065 * _1997;
    float _2087 = fma(_2069, _1937, _2075);
    float _2089 = _1983 * _2043;
    float _2091 = _1985 * _2043;
    float _2093 = _1997 * _2043;
    float _2095 = fma(_2081, _1999, _2083);
    float _2097 = fma(_2069, _1939, _2085);
    float _2099 = fma(_2081, _2001, _2087);
    float _2101 = fma(_1935, _2023, _2089);
    float _2103 = fma(_1937, _2023, _2091);
    float _2105 = fma(_1939, _2023, _2093);
    float _2107 = fma(_2003, _1949, _2049);
    float _2109 = abs(_1434);
    float _2111 = log2(_2109);
    float _2113 = fma(_2001, _2029, _2103);
    float _2115 = fma(_2081, _2003, _2097);
    out.m_85.x = _2077;
    out.m_85.y = _2079;
    out.m_85.z = _2107;
    float _2117 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2015);
    float _2119 = -_2067;
    float _2121 = _2119 + 1.0;
    float _2123 = fma(_1999, _2029, _2101);
    out.m_87.x = _2095;
    out.m_87.y = _2099;
    out.m_87.z = _2115;
    bool _2125 = _1434 <= 8000.0;
    bool _2127 = isnan(_1434);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan(8000.0);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2117);
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2141 = in.m_67.x;
    float _2143 = fma(_2003, _2029, _2105);
    bool _2145 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2147 = isnan(_1568);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2153 = _2149 || _2151;
    float _2155 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_89.x = _2123;
    out.m_89.y = _2113;
    out.m_89.z = _2143;
    float _2157 = exp2(_2155);
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2137);
    float _2165 = fma(_2161, -2.0, 3.0);
    float _2167 = _2161 * _2161;
    float _2169 = _2163 + _1818;
    out.gl_Position.x = _1858;
    out.gl_Position.y = _1860;
    out.gl_Position.z = _2163;
    out.gl_Position.w = _1818;
    float _2171 = _2167 * _2165;
    float _2173 = _1818 * 0.5;
    float _2175 = _2169 * 0.5;
    float _2177 = -_2171;
    float _2179 = _2177 + 1.0;
    float _2181 = fma(_1860, -0.5, _2173);
    float _2183 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2171);
    float _2185 = _1858 + _1818;
    float _2187 = _2135 * _2183;
    float _2189 = _2185 * 0.5;
    float _2191 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _2189;
    out.m_91.y = _2181;
    out.m_91.z = _2175;
    out.m_91.w = _1818;
    float _2193 = _1488 * _1546;
    float _2195 = _1818;
    float _2197 = _2175;
    float _2199 = _2181;
    float _2201 = _2193;
    if (!_2153)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2203 = _2195;
    float _2205 = _2203;
    float _2207 = _2203;
    if (!_2153)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2209 = _2197;
    float _2211 = _2209;
    float _2213 = _2209;
    if (!_2153)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2215 = _2199;
    float _2217 = -_1848;
    float _2219 = _2217 + 1.0;
    float _2221 = _2219 * _2191;
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -_2223;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2229 = _2227 * _2141;
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2233 = _2229;
    float _2235 = _2215;
    float _2237 = _2215;
    if (!_2153)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2239 = _2201;
    float _2241 = _2229 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2243 = _2239;
    float _2245 = _2239;
    if (!_2153)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _2233;
    float _2249 = _2139 * _1878;
    float _2251 = -_2139;
    float _2253 = _2251 + 1.0;
    out.m_93.x = _2241;
    float _2255 = _1889 * _2249;
    float _2257 = _1899 * _2249;
    float _2259 = _1889 * _2253;
    float _2261 = fma(_1895, _2255, _1883);
    float _2263 = fma(_1897, _2255, _1885);
    float _2265 = fma(_1889, _2257, _1887);
    float _2267 = _2255;
    float _2269 = _2247;
    float _2271 = _2247;
    if (!_2153)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _2267;
    out.m_95.x = _2261;
    out.m_95.y = _2263;
    out.m_95.z = _2265;
    out.m_95.w = _2259;
    bool _2275 = !_2153;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2275)
    {
        bool _2281 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1568);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1568 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2307 = 1.0 / _2297;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2307;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2329 = fma(_2323, _2301, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2331 = fma(_2323, _2305, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2333 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2335 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2271 = _2333;
            _2237 = _2329;
            _2279 = _2331;
            _2213 = _2337;
            _2207 = _2335;
            _2245 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1568);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2277;
            _2279 = _2353;
            if (!_2351)
            {
                _2269 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2269;
            _2271 = _2355;
            if (!_2351)
            {
                _2205 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2205;
            _2207 = _2357;
            if (!_2351)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2211;
            _2213 = _2359;
            if (!_2351)
            {
                _2235 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2235;
            _2237 = _2361;
            if (!_2351)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2243;
            bool _2365 = !_2351;
            _2245 = _2363;
            if (!_2365)
            {
                bool _2367 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1568);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1568 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2393 = 1.0 / _2383;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2393;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2415 = fma(_2409, _2387, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2417 = fma(_2409, _2391, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2419 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2421 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2271 = _2419;
                    _2237 = _2415;
                    _2279 = _2417;
                    _2213 = _2423;
                    _2207 = _2421;
                    _2245 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2271 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2237 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2207 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2271;
    float _2429 = _2237;
    float _2431 = _2279;
    float _2433 = _2213;
    float _2435 = _2207;
    float _2437 = _2245;
    float _2439 = fma(_2113, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    out.m_97.x = 0.0;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    float _2455 = fma(_2441, _2445, _2427);
    float _2457 = fma(_2441, _2449, _2431);
    bool _2459 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2461 = _2455 * 0.586610972881317138671875;
    float _2463 = fma(_2441, _2453, _2435);
    float _2465 = _2231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2467 = fma(_2457, 0.298911988735198974609375, _2461);
    bool _2469 = _1488 > 0.0;
    bool _2471 = isnan(_1488);
    bool _2473 = _2469 || _2471;
    bool _2475 = isnan(0.0);
    bool _2477 = _2473 || _2475;
    float _2479 = fma(_2463, 0.114477999508380889892578125, _2467);
    out.m_51.x = _2465;
    bool _2481 = _1546 <= 0.0;
    bool _2483 = !_2477;
    bool _2485 = _2481 || _2483;
    float _2487 = -_2479;
    float _2489 = _2457 + _2487;
    float _2491 = -_2479;
    float _2493 = _2463 + _2491;
    float _2495 = fma(_2489, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    float _2497 = -_2479;
    float _2499 = _2455 + _2497;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    float _2503 = fma(_2493, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    bool _2505 = !_2459;
    if (!_2505)
    {
        float _2507 = -_1422;
        float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2511 = -_1424;
        float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2515 = -_1426;
        float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2519 = _2509 * _2509;
        float _2521 = fma(_2513, _2513, _2519);
        float _2523 = fma(_2517, _2517, _2521);
        float _2525 = sqrt(_2523);
        float _2527 = rsqrt(_2523);
        float _2529 = -_2525;
        float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2533 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2535 = precise::clamp(_2533, 0.0, 1.0);
        float _2537 = _2513 * _2527;
        float _2539 = _2509 * _2527;
        float _2541 = abs(_2535);
        float _2543 = log2(_2541);
        float _2545 = _2517 * _2527;
        float _2547 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2549 = _2113 * _2539;
        float _2551 = -_2539;
        float _2553 = -_2547;
        float _2555 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2553);
        float _2557 = fma(_2123, _2537, _2549);
        float _2559 = -_2545;
        float _2561 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2555);
        float _2563 = fma(_2143, _2545, _2557);
        float _2565 = precise::clamp(_2563, 0.0, 1.0);
        float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2569 = _2561 + _2567;
        float _2571 = _2543 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2573 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2575 = precise::clamp(_2573, 0.0, 1.0);
        float _2577 = exp2(_2571);
        float _2579 = _2577 * _2575;
        float _2581 = _2565 * _2579;
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2585 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2587 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2583;
        out.m_97.y = _2585;
        out.m_97.z = _2587;
    }
    out.m_99.x = _2495;
    out.m_99.y = _2501;
    out.m_99.z = _2503;
    if (!_2485)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2589 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2589;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _354 = false;
    bool _240 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2646 = as_type<float>(_134);
        out.gl_Position.z = _2646;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2715 = as_type<float>(_172);
        out.gl_Position.z = _2715;
    }
    if (_166)
    {
        return out;
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = _176 * _184;
    float _202 = _176 * _190;
    float _204 = fma(_174, _182, _200);
    float _206 = _176 * _196;
    float _208 = fma(_174, _188, _202);
    float _210 = fma(_178, _186, _204);
    float _212 = fma(_174, _194, _206);
    float _214 = fma(_178, _192, _208);
    float _216 = fma(_178, _198, _212);
    bool _218 = !_180;
    float _220 = _192;
    float _238;
    if (!_218)
    {
        float _222 = in.m_63.x;
        float _224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _228 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _230 = _228 * _224;
        float _232 = floor(_230);
        float _234 = -_232;
        float _236 = _230 + _234;
        _238 = _236;
        _240 = true;
    }
    else
    {
        float _242 = float(_118);
        float _244 = 1.0 / _242;
        float _246 = _152 * _244;
        _238 = _246;
    }
    _240 = false;
    float _248 = _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _248 + _250;
    bool _254 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_248);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = 1.0 / _268;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _252 * _272;
    bool _284 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_248);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = fma(_280, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = _294 * _276;
    float _308 = fma(_298, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_304, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = -_294;
    float _314 = _312 + 1.0;
    float _316 = _300 * _306;
    float _318 = _308 * _306;
    float _320 = _310 * _306;
    float _322 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _316);
    float _324 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _318);
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _320);
    float _328 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].x, _324);
    float _330 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].y, _326);
    float _332 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].z, _322);
    bool _334 = !_270;
    float _352;
    if (!_334)
    {
        float _336 = in.m_63.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_118);
        float _358 = 1.0 / _356;
        float _360 = _152 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = in.m_65.x;
    float _366 = in.m_65.y;
    float _368 = in.m_65.z;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_48.x;
    float _376 = in.m_48.y;
    float _378 = in.m_48.z;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _382 = _380 != 0;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _386 = _384 != 0;
    float _388 = in.m_67.y;
    float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = in.m_63.z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _408 = in.m_63.y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _412 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = in.m_69.x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _372 * _152;
    float _422 = in.m_63.x;
    float _424 = _328 * _364;
    float _426 = _190 * _376;
    float _428 = _196 * _376;
    float _430 = in.m_69.y;
    float _432 = exp2(_420);
    float _434 = _376 + _388;
    float _436 = fma(_188, _374, _426);
    float _438 = fma(_194, _374, _428);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _444 = fma(_192, _378, _436);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _448 = _408 + _404;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _454 = fma(_198, _378, _438);
    float _456 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = 1.0 / _442;
    float _460 = _404 * 2.0;
    bool _462 = false;
    float _464 = _452;
    int _466 = as_type<int>(_438);
    if (!_382)
    {
        _220 = _414;
    }
    float _468 = _220;
    out.m_71.x = _456;
    out.m_71.y = _412;
    out.m_71.z = _418;
    out.m_71.w = _416;
    bool _470 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(1.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _482 = 1.0 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _484;
    float _488 = 1.0 / _452;
    float _490 = _468;
    if (_382)
    {
        bool _492 = _422 > 0.5;
        _462 = _492;
    }
    bool _494 = _462;
    float _496 = 1.0 / _482;
    if (!_382)
    {
        _464 = _468;
    }
    float _498 = _464;
    float _500 = _448 + (-1.0);
    float _502 = _486 * _458;
    float _504 = _498;
    if (_382)
    {
        _490 = _414;
    }
    float _506 = _490;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _514 = _422 * 2.0;
    float _516 = floor(_460);
    int _518 = as_type<int>(_512);
    if (_382)
    {
        float _520 = -_506;
        float _522 = _520 + 1.0;
        _466 = as_type<int>(_522);
    }
    int _524 = _466;
    float _526 = _510 * _488;
    float _528 = -_430;
    float _530 = _528 + 1.0;
    float _532 = in.m_61.w;
    float _534 = _408 * 2.0;
    if (_382)
    {
        float _536 = _494 ? as_type<float>(_524) : _506;
        _504 = _536;
    }
    float _538 = _504;
    float _540 = -_432;
    float _542 = _540 + 1.0;
    float _544 = floor(_514);
    float _546 = _422 + _408;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = in.m_59.w;
    bool _560 = _408 > 0.5;
    float _562 = _546 + (-1.0);
    float _564 = _556 ? _542 : 0.0;
    int _566 = _560 ? as_type<int>(_530) : as_type<int>(_430);
    float _568 = floor(_534);
    bool _570 = _516 >= 0.0;
    bool _572 = isnan(_516);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    if (_478)
    {
        float _580 = _564 * _496;
        _156 = _580;
    }
    float _582 = _156;
    bool _584 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = isnan(_362);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    bool _596 = _516 > 0.0;
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _600 = _578 ? 0 : 1;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _362 + _602;
    bool _606 = _544 > 0.0;
    bool _608 = _544 >= 0.0;
    bool _610 = isnan(_544);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = -_594;
    float _620 = _618 + 1.0;
    bool _622 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _624 = isnan(_362);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = fma(_502, _604, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _636 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _638 = isnan(_362);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _362 + _648;
    int _652 = ~_600;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = _632 * _620;
    float _660 = -_632;
    float _662 = _660 + 1.0;
    int _664 = _656;
    if (!_596)
    {
        int _666 = ~_600;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = fma(_526, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _674 = _616 ? 0 : 1;
    float _676 = _646 * _662;
    float _678 = _454 + _532;
    bool _680 = _568 > 0.0;
    float _682 = _444 + _558;
    float _684 = _634 * _676;
    float _686 = -_646;
    float _688 = _686 + 1.0;
    bool _690 = _568 >= 0.0;
    bool _692 = isnan(_568);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _434 + _700;
    bool _704 = !_394;
    int _706 = _704 ? 0 : 1;
    float _708 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _682 + _710;
    int _714 = ~_674;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _722 = fma(_672, _658, _708);
    int _724 = abs(_706);
    float _726 = _702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _728 = _718;
    if (!_606)
    {
        int _730 = ~_674;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = _702 * _702;
    float _738 = _386 ? as_type<float>(_566) : _430;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _678 + _740;
    float _744 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[28].x, _726);
    float _746 = float(_724);
    int _748 = _698 ? 0 : 1;
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].z, _744);
    float _752 = float(_670);
    float _754 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _756 = ~_748;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    float _762 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[117].x, _722);
    bool _764 = _750 >= 0.0;
    float _766 = _746 * _752;
    bool _768 = !_398;
    int _770 = _768 ? 0 : 1;
    float _772 = _754 * _390;
    int _774 = _760;
    if (!_680)
    {
        int _776 = ~_748;
        int _778 = _776 + 1;
        _774 = _778;
    }
    int _780 = _774;
    float _782 = _538 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _784 = in.m_73.x;
    float _786 = in.m_73.y;
    float _788 = in.m_73.z;
    int _790 = abs(_770);
    float _792 = _782 * _720;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _802 = float(_790);
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = float(_734);
    float _808 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _766 * (-2.0);
    out.m_75.x = _792;
    out.m_75.y = _772;
    out.m_75.z = _506;
    out.m_75.w = _430;
    float _814 = _802 * _806;
    float _816 = fma(_712, _712, _736);
    float _818 = 0.0;
    if (_764)
    {
        _818 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _820 = _818;
    out.m_77.x = _804;
    out.m_77.y = _808;
    out.m_77.z = _810;
    out.m_77.w = _798;
    float _822 = _814 * (-2.0);
    float _824 = fma(_742, _742, _816);
    float _826 = fma(_598, _812, _598);
    if (_764)
    {
        out.m_51.x = 0.0;
    }
    float _828 = fma(_812, _784, _784);
    float _830 = _422 + (-0.5);
    float _832 = rsqrt(_824);
    float _834 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _836 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _828);
    bool _838 = !_402;
    int _840 = _838 ? 0 : 1;
    float _842 = fma(_822, _786, _786);
    float _844 = fma(_512, _822, _512);
    float _846 = _788;
    if (_764)
    {
        float _848 = _820 * 5.0;
        _518 = as_type<int>(_848);
    }
    int _850 = _518;
    float _852 = _834 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _854 = abs(_840);
    float _856 = fma(_826, _582, _836);
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3783 = as_type<float>(_850);
        out.gl_Position.z = _3783;
    }
    float _858 = float(_854);
    float _860 = _852 * _832;
    float _862 = _408 + (-0.5);
    float _864 = _712 * _860;
    float _866 = _702 * _860;
    float _868 = _866;
    if (_764)
    {
        return out;
    }
    float _870 = -_866;
    float _872 = _434 + _870;
    float _874 = _742 * _860;
    float _876 = -_864;
    float _878 = _682 + _876;
    float _880 = float(_780);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _872 + _882;
    float _886 = -_874;
    float _888 = _678 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _878 + _890;
    float _894 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _900 = _888 + _898;
    float _902 = _422 + _404;
    float _904 = _858 * _880;
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    float _908 = fma(_844, _582, _894);
    float _910 = -_866;
    float _912 = _702 + _910;
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[28].z, _906);
    float _916 = _902 + (-1.0);
    float _918 = _904 * (-2.0);
    float _920 = _908 * 0.15915493667125701904296875;
    float _922 = -_864;
    float _924 = _712 + _922;
    bool _926 = _914 >= 0.0;
    float _928 = _912 * _912;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _932 = fma(_918, _788, _788);
    float _934 = _404 + (-0.5);
    float _936 = fma(_924, _924, _928);
    float _938 = -_874;
    float _940 = _742 + _938;
    float _942 = fma(_930, _918, _930);
    float _944 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].z, _932);
    float _946 = _856 * 0.15915493667125701904296875;
    float _948 = fma(_940, _940, _936);
    float _950 = _920 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = fma(_942, _582, _944);
    float _956 = _874;
    if (_926)
    {
        _846 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _958 = _846;
    int _960 = as_type<int>(_958);
    if (_926)
    {
        out.m_51.x = 0.0;
    }
    float _962 = _954 * 0.15915493667125701904296875;
    if (_926)
    {
        float _964 = _958 * 5.0;
        _960 = as_type<int>(_964);
    }
    int _966 = _960;
    float _968 = _946 * 6.283185482025146484375;
    float _970 = sin(_968);
    if (_926)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3969 = as_type<float>(_966);
        out.gl_Position.z = _3969;
    }
    float _972 = _946 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _920 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = sqrt(_948);
    if (_926)
    {
        return out;
    }
    float _982 = in.m_79.x;
    float _984 = in.m_79.y;
    float _986 = in.m_79.z;
    float _988 = _962 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _330 * _366;
    float _994 = _832 * _980;
    float _996 = _332 * _368;
    float _998 = _974 * _978;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1002 = _974 * _952;
    float _1004 = _962 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _996 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1010 = _834 * _994;
    float _1012 = _970 * _952;
    float _1014 = _970 * _978;
    float _1016 = _974 * _990;
    float _1018 = _994 * _1000;
    float _1020 = _978 * _990;
    float _1022 = _970 * _990;
    float _1024 = _952 * _990;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _984);
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _982);
    float _1030 = -_1014;
    float _1032 = fma(_1006, _1002, _1030);
    float _1034 = fma(_1006, _1012, _998);
    float _1036 = _1026 * _1018;
    float _1038 = _1028 * _1010;
    float _1040 = _994 * _1008;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _986);
    float _1044 = fma(_1006, _998, _1012);
    float _1046 = _1016 * _1036;
    float _1048 = -_1036;
    float _1050 = _1006 * _1048;
    float _1052 = _1042 * _1040;
    float _1054 = -_1002;
    float _1056 = fma(_1006, _1014, _1054);
    float _1058 = fma(_1044, _1038, _1046);
    float _1060 = _1022 * _1036;
    float _1062 = fma(_1020, _1038, _1050);
    float _1064 = fma(_1032, _1052, _1058);
    float _1066 = fma(_1056, _1038, _1060);
    float _1068 = fma(_1024, _1052, _1062);
    float _1070 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1072 = fma(_1034, _1052, _1066);
    float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1076 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1070);
    float _1078 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1074);
    float _1080 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1076);
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1078);
    float _1084 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1086 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1088 = _678 + _1084;
    float _1090 = _682 + _1086;
    float _1092 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1096 = _1088 + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1100 = _1090 + _1098;
    float _1102 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1092);
    float _1104 = _1096 * _1096;
    float _1106 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1102);
    float _1108 = fma(_1100, _1100, _1104);
    float _1110 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1112 = sqrt(_1108);
    float _1114 = _434 + _1110;
    bool _1116 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = _1072;
    float _1120 = _1064;
    float _1122 = _1090;
    if (!_1116)
    {
        _1118 = _1088;
    }
    float _1124 = _1118;
    float _1126 = _1124;
    if (!_1116)
    {
        _1120 = _1114;
    }
    float _1128 = _1120;
    bool _1130 = !_1116;
    float _1132 = _1128;
    if (!_1130)
    {
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1138 = _1112 + _1136;
        float _1140 = rsqrt(_1108);
        float _1142 = _1138 * _1134;
        float _1144 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = _1142 * 0.15915493667125701904296875;
        float _1148 = _1146 * 6.283185482025146484375;
        float _1150 = cos(_1148);
        float _1152 = _1146 * 6.283185482025146484375;
        float _1154 = sin(_1152);
        float _1156 = _1150 + (-1.0);
        float _1158 = fma(_1154, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1160 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1140 * _1158;
        float _1164 = fma(_1114, _1150, _1160);
        float _1166 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1168 = fma(_1096, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1126 = _1168;
        _1122 = _1166;
        _1132 = _1164;
    }
    float _1170 = _1126;
    float _1172 = _1122;
    float _1174 = _1132;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1178 = _1170 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1182 = _1172 + _1180;
    float _1184 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1186 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4325 = float2(_1186, _1184);
    float _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4325, float2(0.0), isnan(_4325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4325, float2(0.0), isnan(_4325)), level(0.0)).x;
    float _1190 = -_434;
    float _1192 = _1190 + _1174;
    float _1194 = -_682;
    float _1196 = _1194 + _1172;
    float _1198 = -_678;
    float _1200 = _1198 + _1170;
    bool _1202 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1204 = isnan(0.5);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1210 = _1206 || _1208;
    bool _1212 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1214 = isnan(0.5);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_1188, 100.0, _434);
    float _1224 = _1192 * _1192;
    float _1226 = fma(_1188, 100.0, _1174);
    float _1228 = -_866;
    float _1230 = _1228 + _1222;
    float _1232 = fma(_1196, _1196, _1224);
    float _1234 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = fma(_1200, _1200, _1232);
    float _1240 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1234);
    float _1242 = sqrt(_1238);
    float _1244 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1240);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1248 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1250 = 1.0 / _1246;
    float _1252 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1248);
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1256 = _1242 > 0.0;
    float _1258 = _1254 + _1246;
    float _1260 = _1258 * _1250;
    float _1262 = _1260 * 0.5;
    float _1264 = _1242;
    float _1266 = _1262;
    float _1268 = _1170;
    float _1270 = _1172;
    float _1272 = _1222;
    if (!_1256)
    {
        _1264 = _1172;
    }
    float _1274 = _1264;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1276);
    float _1280 = _1274;
    if (!_1256)
    {
        _1266 = _1226;
    }
    float _1282 = _1266;
    float _1284 = 1.0 / _1278;
    bool _1286 = !_1256;
    float _1288 = _1282;
    float _1290 = _1282;
    if (!_1286)
    {
        float _1292 = _210 * _210;
        float _1294 = fma(_214, _214, _1292);
        float _1296 = fma(_216, _216, _1294);
        float _1298 = rsqrt(_1238);
        float _1300 = sqrt(_1296);
        float _1302 = _1196 * _1298;
        float _1304 = _1192 * _1298;
        float _1306 = _1200 * _1298;
        bool _1308 = _1300 > 0.0;
        float _1310 = _1298;
        if (!_1308)
        {
            _1310 = _1172;
        }
        float _1312 = _1310;
        _1280 = _1312;
        if (!_1308)
        {
            _1288 = _1226;
        }
        float _1314 = _1288;
        bool _1316 = !_1308;
        _1290 = _1314;
        if (!_1316)
        {
            float _1318 = rsqrt(_1296);
            float _1320 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1322 = _210 * _1318;
            float _1324 = _214 * _1318;
            float _1326 = _1304 * _1322;
            float _1328 = _216 * _1318;
            float _1330 = fma(_1302, _1324, _1326);
            float _1332 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1334 = fma(_1306, _1328, _1330);
            float _1336 = _1334 * _1332;
            float _1338 = fma(_214, _1336, _1172);
            float _1340 = fma(_210, _1336, _1226);
            float _1342 = fma(_216, _1336, _1170);
            _1280 = _1338;
            _1268 = _1342;
            _1290 = _1340;
        }
    }
    float _1344 = _1280;
    float _1346 = _1268;
    float _1348 = _1290;
    float _1350 = -_864;
    float _1352 = _1350 + _1344;
    float _1354 = -_874;
    float _1356 = _1354 + _1346;
    float _1358 = -_866;
    float _1360 = _1358 + _1348;
    float _1362 = _1360;
    float _1364 = _1352;
    float _1366 = _1356;
    if (_1220)
    {
        _1270 = 1.0;
    }
    float _1368 = _1270;
    float _1370 = _1368;
    if (!_1210)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1374 = _1230 + _1372;
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1378 = -_678;
        float _1380 = _1378 + _1346;
        float _1382 = -_1222;
        float _1384 = _1382 + _1348;
        float _1386 = _1374 * _1374;
        float _1388 = -_682;
        float _1390 = _1388 + _1344;
        float _1392 = fma(_892, _892, _1386);
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1396 = fma(_900, _900, _1392);
        float _1398 = 1.0 / _994;
        float _1400 = sqrt(_1396);
        float _1402 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1404 = precise::min(_1400, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1406 = _1404 * _1376;
        float _1408 = _1406 * _1398;
        float _1410 = _1402 * _1408;
        float _1412 = _1380 * _1408;
        float _1414 = fma(_1384, _1410, _1230);
        float _1416 = fma(_1390, _1410, _878);
        float _1418 = fma(_1402, _1412, _888);
        _956 = _1402;
        _1362 = _1414;
        _1364 = _1416;
        _1366 = _1418;
    }
    float _1420 = _956;
    float _1422 = _1362;
    float _1424 = _1364;
    float _1426 = _1366;
    float _1428 = _1420;
    if (_1220)
    {
        _868 = 1.0;
    }
    float _1430 = _868;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1434 = _1284 * _1432;
    float _1436 = _1430;
    if (!_1220)
    {
        float _1438 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1440 = _1438 * 0.15915493667125701904296875;
        float _1442 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1444;
        float _1448 = _1440 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1442 * 0.15915493667125701904296875;
        float _1454 = _1440 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = 1.0 / _1450;
        float _1460 = _1452 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        float _1464 = _1456 * _1458;
        float _1466 = _1452 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1462 * _1464;
        float _1472 = 1.0 / _1446;
        float _1474 = 1.0 / _1470;
        float _1476 = _1468 * _1474;
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = fma(_1434, _1476, _1478);
        float _1482 = _1480 * _1472;
        float _1484 = precise::clamp(_1482, 0.0, 1.0);
        _1428 = _1472;
        _1370 = _1484;
    }
    float _1486 = _1428;
    float _1488 = _1370;
    float _1490 = _1486;
    if (!_1220)
    {
        float _1492 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = _1494 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = _1496 * 0.15915493667125701904296875;
        float _1504 = _1494 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        float _1508 = 1.0 / _1500;
        float _1510 = _1502 * 6.283185482025146484375;
        float _1512 = cos(_1510);
        float _1514 = _1506 * _1508;
        float _1516 = _1502 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        float _1520 = _1512 * _1514;
        float _1522 = 1.0 / _1520;
        float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1526 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1524;
        float _1528 = 1.0 / _1526;
        float _1530 = _1518 * _1522;
        float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1534 = fma(_1434, _1530, _1532);
        float _1536 = _1534 * _1528;
        float _1538 = precise::clamp(_1536, 0.0, 1.0);
        float _1540 = -_1538;
        float _1542 = _1540 + 1.0;
        _1490 = _1508;
        _1436 = _1542;
    }
    float _1544 = _1490;
    float _1546 = _1436;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1550 = _1422 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1554 = _1424 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1426 + _1556;
    float _1560 = _1550 * _1550;
    float _1562 = fma(_1554, _1554, _1560);
    float _1564 = fma(_1558, _1558, _1562);
    float _1566 = rsqrt(_1564);
    float _1568 = sqrt(_1564);
    float _1570 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1572 = _1554 * _1570;
    float _1574 = _1558 * _1570;
    float _1576 = _1572 * _1572;
    float _1578 = _1574 * _1574;
    float _1580 = _1576 + _1578;
    float _1582 = sqrt(_1580);
    bool _1584 = _1582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1588 = _1582 + _1586;
    float _1590 = _1558;
    float _1592 = _1560;
    float _1594 = _1588;
    float _1596 = _1544;
    float _1598 = _1576;
    if (_1584)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1590 = _1600;
    }
    float _1602 = _1590;
    if (_1584)
    {
        float _1604 = rsqrt(_1580);
        _1592 = _1604;
    }
    float _1606 = _1592;
    float _1608 = _1606;
    if (_1584)
    {
        float _1610 = _1588 * _1602;
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1584)
    {
        float _1616 = _1612 * 0.15915493667125701904296875;
        _1596 = _1616;
    }
    float _1618 = _1596;
    float _1620 = _1602;
    if (_1584)
    {
        float _1622 = _1618 * 6.283185482025146484375;
        float _1624 = sin(_1622);
        _1620 = _1624;
    }
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1630 = precise::max(0.0, _1628);
    float _1632 = _1566;
    float _1634 = _1630;
    if (_1584)
    {
        float _1636 = _1618 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        _1632 = _1638;
    }
    float _1640 = _1632;
    float _1642 = -_1570;
    float _1644 = -_1630;
    float _1646 = fma(_1550, _1642, _1644);
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1584)
    {
        float _1650 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1650;
    }
    float _1652 = _1634;
    float _1654 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1656 = _1652;
    float _1658 = _1626;
    if (_1584)
    {
        float _1660 = fma(_1626, _1652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1656 = _1660;
    }
    float _1662 = _1656;
    float _1664 = _1662;
    if (!_1584)
    {
        _1658 = _1574;
    }
    float _1666 = _1658;
    float _1668 = _1666;
    float _1670 = _1640;
    if (_1584)
    {
        float _1672 = _1640 + (-1.0);
        _1648 = _1672;
    }
    float _1674 = _1648;
    float _1676 = _1674;
    if (_1584)
    {
        float _1678 = _1606 * _1662;
        _1272 = _1678;
    }
    float _1680 = _1272;
    if (!_1584)
    {
        _1608 = _1572;
    }
    float _1682 = _1608;
    float _1684 = _1682;
    if (_1584)
    {
        float _1686 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1686;
    }
    float _1688 = _1676;
    if (_1584)
    {
        float _1690 = _1572 * _1680;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1584)
    {
        _1664 = _1646;
    }
    float _1694 = _1664;
    float _1696 = _1694;
    if (_1584)
    {
        float _1698 = _1574 * _1680;
        _1668 = _1698;
    }
    float _1700 = _1668;
    if (_1584)
    {
        float _1702 = fma(_1646, _1640, _1688);
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (_1584)
    {
        float _1706 = _1692 * _1692;
        _1598 = _1706;
    }
    float _1708 = _1598;
    if (!_1584)
    {
        _1670 = _1578;
    }
    float _1710 = _1670;
    float _1712 = _1710;
    if (_1584)
    {
        float _1714 = _1700 * _1700;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1704, _1704, _1708);
    float _1720 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = floor(_1654);
    float _1724 = _1718 + _1716;
    float _1726 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1736 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    float _1738 = -_1732;
    float _1740 = _1738 + 1.0;
    float _1742 = rsqrt(_1724);
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1614);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1752 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1754 = abs(_1740);
    float _1756 = log2(_1754);
    float _1758 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1760 = -_1750;
    float _1762 = fma(_1760, _1744, 1.0);
    float _1764 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1768 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1758);
    float _1770 = _1742 * _1692;
    float _1772 = _1742 * _1704;
    float _1774 = _1742 * _1700;
    float _1776 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1764);
    float _1778 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1768);
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = floor(_1734);
    float _1784 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1776);
    float _1786 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1788 = -_1780;
    float _1790 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1788);
    float _1792 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1794 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1796 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1798 = -_1774;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1790);
    float _1802 = exp2(_1792);
    float _1804 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1796);
    float _1806 = fma(_1800, -0.5, 0.5);
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1804);
    float _1812 = _1772 + 1.0;
    float _1814 = log2(_1762);
    float _1816 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1818 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1810);
    float _1820 = -_1782;
    float _1822 = _1734 + _1820;
    float _1824 = fma(_1808, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1826 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1816);
    float _1828 = 1.0 / _1818;
    float _1830 = -_1722;
    float _1832 = _1654 + _1830;
    float _1834 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1826);
    float _1838 = -_1772;
    float _1840 = fma(_1802, _1812, _1838);
    float _1842 = fma(_1808, _1824, -0.212114393711090087890625);
    float _1844 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1834);
    float _1846 = sqrt(_1806);
    float2 _5350 = float2(_1832, _1822);
    float _1848 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5350, float2(0.0), isnan(_5350)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5350, float2(0.0), isnan(_5350)), level(0.0)).x;
    float _1850 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1852 = _1814 * 0.693147182464599609375;
    float _1854 = fma(_1808, _1842, 1.570728778839111328125);
    float _1856 = fma(_1840, 0.5, 0.5);
    float _1858 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1860 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1836);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1864 = _1858 * _1828;
    float _1866 = _1860 * _1828;
    float _1868 = fma(_1864, 0.5, 0.5);
    float _1870 = fma(_1866, -0.5, 0.5);
    float _1872 = _1846 * 0.636619746685028076171875;
    float _1874 = -_1854;
    float _1876 = fma(_1872, _1874, 1.0);
    float3 _5405 = float3(_1868, _1870, _1862);
    float _1878 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5405, float3(0.0), isnan(_5405)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5405, float3(0.0), isnan(_5405)), level(0.0)).x;
    float3 _5416 = float3(_1868, _1870, _1862);
    float4 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5416, float3(0.0), isnan(_5416)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5416, float3(0.0), isnan(_5416)), level(0.0)).xyzw;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = _1881.w;
    float2 _5432 = float2(_1876, _1856);
    float3 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5432, float2(0.0), isnan(_5432)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5432, float2(0.0), isnan(_5432)), level(0.0)).xyz;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1905 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1907 = _984 != 0.0;
    bool _1909 = isnan(_984);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan(0.0);
    bool _1915 = _1911 || _1913;
    float _1917 = in.m_81.x;
    float _1919 = in.m_81.y;
    float _1921 = in.m_81.z;
    float _1923 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1925 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1903);
    float _1927 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    bool _1929 = _982 == 0.0;
    bool _1931 = !_1915;
    bool _1933 = _1929 && _1931;
    float _1935 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1923);
    float _1937 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1925);
    float _1939 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1927);
    bool _1941 = _986 == 0.0;
    bool _1943 = _1941 && _1933;
    float _1945 = in.m_83.x;
    float _1947 = in.m_83.y;
    float _1949 = in.m_83.z;
    float _1951 = in.m_83.w;
    float _1953 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1955 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1959 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1961 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1963 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1965 = -_1006;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1953);
    float _1969 = -_1006;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1973 = -_1006;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1957);
    float _1977 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1959);
    float _1979 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1961);
    float _1981 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1963);
    float _1983 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1985 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1971);
    float _1987 = _1963;
    float _1989 = _1981;
    float _1991 = _1975;
    float _1993 = _1959;
    if (_1943)
    {
        _1987 = _1921;
    }
    float _1995 = _1987;
    float _1997 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1975);
    float _1999 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2001 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1979);
    float _2003 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1981);
    float _2005 = _1995;
    if (_1943)
    {
        _1989 = _1995;
    }
    float _2007 = _1989;
    float _2009 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2011 = _2007;
    if (!_1943)
    {
        _2005 = _1921;
    }
    float _2013 = _2005;
    float _2015 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1943)
    {
        _1991 = _1917;
    }
    float _2017 = _1991;
    float _2019 = _2017;
    if (!_1943)
    {
        float _2021 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1917);
        _2019 = _2021;
    }
    float _2023 = _2019;
    float _2025 = _1983 * _1947;
    if (!_1943)
    {
        float _2027 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2013);
        _2011 = _2027;
    }
    float _2029 = _2011;
    float _2031 = _1997 * _1947;
    float _2033 = _1949 * _1917;
    if (_1943)
    {
        _1993 = _1919;
    }
    float _2035 = _1993;
    float _2037 = fma(_1935, _1945, _2025);
    float _2039 = _2035;
    if (!_1943)
    {
        float _2041 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1919);
        _2039 = _2041;
    }
    float _2043 = _2039;
    float _2045 = _1945 * _1919;
    float _2047 = _1947 * _2013;
    float _2049 = fma(_1939, _1945, _2031);
    float _2051 = -_2033;
    float _2053 = fma(_1945, _2013, _2051);
    float _2055 = -_2045;
    float _2057 = fma(_1947, _1917, _2055);
    float _2059 = -_2047;
    float _2061 = fma(_1949, _1919, _2059);
    float _2063 = _1985 * _1947;
    float _2065 = _2053 * _1951;
    float _2067 = exp2(_2009);
    float _2069 = _2061 * _1951;
    float _2071 = fma(_1937, _1945, _2063);
    float _2073 = _2065 * _1983;
    float _2075 = _2065 * _1985;
    float _2077 = fma(_1999, _1949, _2037);
    float _2079 = fma(_2001, _1949, _2071);
    float _2081 = _2057 * _1951;
    float _2083 = fma(_2069, _1935, _2073);
    float _2085 = _2065 * _1997;
    float _2087 = fma(_2069, _1937, _2075);
    float _2089 = _1983 * _2043;
    float _2091 = _1985 * _2043;
    float _2093 = _1997 * _2043;
    float _2095 = fma(_2081, _1999, _2083);
    float _2097 = fma(_2069, _1939, _2085);
    float _2099 = fma(_2081, _2001, _2087);
    float _2101 = fma(_1935, _2023, _2089);
    float _2103 = fma(_1937, _2023, _2091);
    float _2105 = fma(_1939, _2023, _2093);
    float _2107 = fma(_2003, _1949, _2049);
    float _2109 = abs(_1434);
    float _2111 = log2(_2109);
    float _2113 = fma(_2001, _2029, _2103);
    float _2115 = fma(_2081, _2003, _2097);
    out.m_85.x = _2077;
    out.m_85.y = _2079;
    out.m_85.z = _2107;
    float _2117 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2015);
    float _2119 = -_2067;
    float _2121 = _2119 + 1.0;
    float _2123 = fma(_1999, _2029, _2101);
    out.m_87.x = _2095;
    out.m_87.y = _2099;
    out.m_87.z = _2115;
    bool _2125 = _1434 <= 8000.0;
    bool _2127 = isnan(_1434);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan(8000.0);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2117);
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2141 = in.m_67.x;
    float _2143 = fma(_2003, _2029, _2105);
    bool _2145 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2147 = isnan(_1568);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2153 = _2149 || _2151;
    float _2155 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_89.x = _2123;
    out.m_89.y = _2113;
    out.m_89.z = _2143;
    float _2157 = exp2(_2155);
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2137);
    float _2165 = fma(_2161, -2.0, 3.0);
    float _2167 = _2161 * _2161;
    float _2169 = _2163 + _1818;
    out.gl_Position.x = _1858;
    out.gl_Position.y = _1860;
    out.gl_Position.z = _2163;
    out.gl_Position.w = _1818;
    float _2171 = _2167 * _2165;
    float _2173 = _1818 * 0.5;
    float _2175 = _2169 * 0.5;
    float _2177 = -_2171;
    float _2179 = _2177 + 1.0;
    float _2181 = fma(_1860, -0.5, _2173);
    float _2183 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2171);
    float _2185 = _1858 + _1818;
    float _2187 = _2135 * _2183;
    float _2189 = _2185 * 0.5;
    float _2191 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _2189;
    out.m_91.y = _2181;
    out.m_91.z = _2175;
    out.m_91.w = _1818;
    float _2193 = _1488 * _1546;
    float _2195 = _1818;
    float _2197 = _2175;
    float _2199 = _2181;
    float _2201 = _2193;
    if (!_2153)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2203 = _2195;
    float _2205 = _2203;
    float _2207 = _2203;
    if (!_2153)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2209 = _2197;
    float _2211 = _2209;
    float _2213 = _2209;
    if (!_2153)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2215 = _2199;
    float _2217 = -_1848;
    float _2219 = _2217 + 1.0;
    float _2221 = _2219 * _2191;
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -_2223;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2229 = _2227 * _2141;
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2233 = _2229;
    float _2235 = _2215;
    float _2237 = _2215;
    if (!_2153)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2239 = _2201;
    float _2241 = _2229 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2243 = _2239;
    float _2245 = _2239;
    if (!_2153)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _2233;
    float _2249 = _2139 * _1878;
    float _2251 = -_2139;
    float _2253 = _2251 + 1.0;
    out.m_93.x = _2241;
    float _2255 = _1889 * _2249;
    float _2257 = _1899 * _2249;
    float _2259 = _1889 * _2253;
    float _2261 = fma(_1895, _2255, _1883);
    float _2263 = fma(_1897, _2255, _1885);
    float _2265 = fma(_1889, _2257, _1887);
    float _2267 = _2255;
    float _2269 = _2247;
    float _2271 = _2247;
    if (!_2153)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _2267;
    out.m_95.x = _2261;
    out.m_95.y = _2263;
    out.m_95.z = _2265;
    out.m_95.w = _2259;
    bool _2275 = !_2153;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2275)
    {
        bool _2281 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1568);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1568 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2307 = 1.0 / _2297;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2307;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2329 = fma(_2323, _2301, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2331 = fma(_2323, _2305, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2333 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2335 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2271 = _2333;
            _2237 = _2329;
            _2279 = _2331;
            _2213 = _2337;
            _2207 = _2335;
            _2245 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1568);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2277;
            _2279 = _2353;
            if (!_2351)
            {
                _2269 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2269;
            _2271 = _2355;
            if (!_2351)
            {
                _2205 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2205;
            _2207 = _2357;
            if (!_2351)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2211;
            _2213 = _2359;
            if (!_2351)
            {
                _2235 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2235;
            _2237 = _2361;
            if (!_2351)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2243;
            bool _2365 = !_2351;
            _2245 = _2363;
            if (!_2365)
            {
                bool _2367 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1568);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1568 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2393 = 1.0 / _2383;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2393;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2415 = fma(_2409, _2387, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2417 = fma(_2409, _2391, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2419 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2421 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2271 = _2419;
                    _2237 = _2415;
                    _2279 = _2417;
                    _2213 = _2423;
                    _2207 = _2421;
                    _2245 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2271 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2237 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2207 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2271;
    float _2429 = _2237;
    float _2431 = _2279;
    float _2433 = _2213;
    float _2435 = _2207;
    float _2437 = _2245;
    float _2439 = fma(_2113, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    out.m_97.x = 0.0;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    float _2455 = fma(_2441, _2445, _2427);
    float _2457 = fma(_2441, _2449, _2431);
    bool _2459 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2461 = _2455 * 0.586610972881317138671875;
    float _2463 = fma(_2441, _2453, _2435);
    float _2465 = _2231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2467 = fma(_2457, 0.298911988735198974609375, _2461);
    bool _2469 = _1488 > 0.0;
    bool _2471 = isnan(_1488);
    bool _2473 = _2469 || _2471;
    bool _2475 = isnan(0.0);
    bool _2477 = _2473 || _2475;
    float _2479 = fma(_2463, 0.114477999508380889892578125, _2467);
    out.m_51.x = _2465;
    bool _2481 = _1546 <= 0.0;
    bool _2483 = !_2477;
    bool _2485 = _2481 || _2483;
    float _2487 = -_2479;
    float _2489 = _2457 + _2487;
    float _2491 = -_2479;
    float _2493 = _2463 + _2491;
    float _2495 = fma(_2489, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    float _2497 = -_2479;
    float _2499 = _2455 + _2497;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    float _2503 = fma(_2493, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    bool _2505 = !_2459;
    if (!_2505)
    {
        float _2507 = -_1422;
        float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2511 = -_1424;
        float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2515 = -_1426;
        float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2519 = _2509 * _2509;
        float _2521 = fma(_2513, _2513, _2519);
        float _2523 = fma(_2517, _2517, _2521);
        float _2525 = sqrt(_2523);
        float _2527 = rsqrt(_2523);
        float _2529 = -_2525;
        float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2533 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2535 = precise::clamp(_2533, 0.0, 1.0);
        float _2537 = _2513 * _2527;
        float _2539 = _2509 * _2527;
        float _2541 = abs(_2535);
        float _2543 = log2(_2541);
        float _2545 = _2517 * _2527;
        float _2547 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2549 = _2113 * _2539;
        float _2551 = -_2539;
        float _2553 = -_2547;
        float _2555 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2553);
        float _2557 = fma(_2123, _2537, _2549);
        float _2559 = -_2545;
        float _2561 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2555);
        float _2563 = fma(_2143, _2545, _2557);
        float _2565 = precise::clamp(_2563, 0.0, 1.0);
        float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2569 = _2561 + _2567;
        float _2571 = _2543 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2573 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2575 = precise::clamp(_2573, 0.0, 1.0);
        float _2577 = exp2(_2571);
        float _2579 = _2577 * _2575;
        float _2581 = _2565 * _2579;
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2585 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2587 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2583;
        out.m_97.y = _2585;
        out.m_97.z = _2587;
    }
    out.m_99.x = _2495;
    out.m_99.y = _2501;
    out.m_99.z = _2503;
    if (!_2485)
    {
        return out;
    }
    float _2589 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2589;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2341 = false;
    bool _354 = false;
    bool _240 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2646 = as_type<float>(_134);
        out.gl_Position.z = _2646;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_53.w;
    bool _140 = _138 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _142 = isnan(_138);
    bool _144 = _140 || _142;
    bool _146 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _148 = _144 || _146;
    float _150 = -_138;
    float _152 = _150 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _154 = 0.0;
    float _156 = _152;
    if (_148)
    {
        float _158 = float(_118);
        _154 = _158;
    }
    float _160 = _154;
    bool _162 = _152 >= _160;
    bool _164 = !_148;
    bool _166 = _162 || _164;
    if (_166)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _128;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _170 = _168 * 5.0;
        _136 = as_type<int>(_170);
    }
    int _172 = _136;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2715 = as_type<float>(_172);
        out.gl_Position.z = _2715;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_55.x;
    float _176 = in.m_55.y;
    float _178 = in.m_55.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = in.m_61.x;
    float _196 = in.m_61.y;
    float _198 = in.m_61.z;
    float _200 = _176 * _184;
    float _202 = _176 * _190;
    float _204 = fma(_174, _182, _200);
    float _206 = _176 * _196;
    float _208 = fma(_174, _188, _202);
    float _210 = fma(_178, _186, _204);
    float _212 = fma(_174, _194, _206);
    float _214 = fma(_178, _192, _208);
    float _216 = fma(_178, _198, _212);
    bool _218 = !_180;
    float _220 = _192;
    float _238;
    if (!_218)
    {
        float _222 = in.m_63.x;
        float _224 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _226 = _222 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _228 = fma(_226, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _230 = _228 * _224;
        float _232 = floor(_230);
        float _234 = -_232;
        float _236 = _230 + _234;
        _238 = _236;
        _240 = true;
    }
    else
    {
        float _242 = float(_118);
        float _244 = 1.0 / _242;
        float _246 = _152 * _244;
        _238 = _246;
    }
    _240 = false;
    float _248 = _238;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _252 = _248 + _250;
    bool _254 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _256 = isnan(_248);
    bool _258 = _254 || _256;
    bool _260 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _262 = _258 || _260;
    float _264 = float(_262);
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    bool _270 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _272 = 1.0 / _268;
    float _274 = -_264;
    float _276 = _274 + 1.0;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _278;
    float _282 = _252 * _272;
    bool _284 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_248);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = fma(_280, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _304 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _302;
    float _306 = _294 * _276;
    float _308 = fma(_298, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _310 = fma(_304, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _312 = -_294;
    float _314 = _312 + 1.0;
    float _316 = _300 * _306;
    float _318 = _308 * _306;
    float _320 = _310 * _306;
    float _322 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].z, _316);
    float _324 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].x, _318);
    float _326 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[143].y, _320);
    float _328 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].x, _324);
    float _330 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].y, _326);
    float _332 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].z, _322);
    bool _334 = !_270;
    float _352;
    if (!_334)
    {
        float _336 = in.m_63.x;
        float _338 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _340 = _336 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _342 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[11].y, _152);
        float _344 = _342 * _338;
        float _346 = floor(_344);
        float _348 = -_346;
        float _350 = _344 + _348;
        _352 = _350;
        _354 = true;
    }
    else
    {
        float _356 = float(_118);
        float _358 = 1.0 / _356;
        float _360 = _152 * _358;
        _352 = _360;
    }
    _354 = false;
    float _362 = _352;
    float _364 = in.m_65.x;
    float _366 = in.m_65.y;
    float _368 = in.m_65.z;
    float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _372 = log2(_370);
    float _374 = in.m_48.x;
    float _376 = in.m_48.y;
    float _378 = in.m_48.z;
    int _380 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _382 = _380 != 0;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _386 = _384 != 0;
    float _388 = in.m_67.y;
    float _390 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _394 = _392 != 0;
    int _396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _398 = _396 != 0;
    int _400 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _402 = _400 != 0;
    float _404 = in.m_63.z;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _408 = in.m_63.y;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _412 = _406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _414 = in.m_69.x;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _418 = _410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _420 = _372 * _152;
    float _422 = in.m_63.x;
    float _424 = _328 * _364;
    float _426 = _190 * _376;
    float _428 = _196 * _376;
    float _430 = in.m_69.y;
    float _432 = exp2(_420);
    float _434 = _376 + _388;
    float _436 = fma(_188, _374, _426);
    float _438 = fma(_194, _374, _428);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _444 = fma(_192, _378, _436);
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _448 = _408 + _404;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _454 = fma(_198, _378, _438);
    float _456 = _446 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _458 = 1.0 / _442;
    float _460 = _404 * 2.0;
    bool _462 = false;
    float _464 = _452;
    int _466 = as_type<int>(_438);
    if (!_382)
    {
        _220 = _414;
    }
    float _468 = _220;
    out.m_71.x = _456;
    out.m_71.y = _412;
    out.m_71.z = _418;
    out.m_71.w = _416;
    bool _470 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _472 = isnan(1.0);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _478 = _474 || _476;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _482 = 1.0 + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _484;
    float _488 = 1.0 / _452;
    float _490 = _468;
    if (_382)
    {
        bool _492 = _422 > 0.5;
        _462 = _492;
    }
    bool _494 = _462;
    float _496 = 1.0 / _482;
    if (!_382)
    {
        _464 = _468;
    }
    float _498 = _464;
    float _500 = _448 + (-1.0);
    float _502 = _486 * _458;
    float _504 = _498;
    if (_382)
    {
        _490 = _414;
    }
    float _506 = _490;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _514 = _422 * 2.0;
    float _516 = floor(_460);
    int _518 = as_type<int>(_512);
    if (_382)
    {
        float _520 = -_506;
        float _522 = _520 + 1.0;
        _466 = as_type<int>(_522);
    }
    int _524 = _466;
    float _526 = _510 * _488;
    float _528 = -_430;
    float _530 = _528 + 1.0;
    float _532 = in.m_61.w;
    float _534 = _408 * 2.0;
    if (_382)
    {
        float _536 = _494 ? as_type<float>(_524) : _506;
        _504 = _536;
    }
    float _538 = _504;
    float _540 = -_432;
    float _542 = _540 + 1.0;
    float _544 = floor(_514);
    float _546 = _422 + _408;
    bool _548 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _550 = isnan(0.0);
    bool _552 = _548 || _550;
    bool _554 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _556 = _552 || _554;
    float _558 = in.m_59.w;
    bool _560 = _408 > 0.5;
    float _562 = _546 + (-1.0);
    float _564 = _556 ? _542 : 0.0;
    int _566 = _560 ? as_type<int>(_530) : as_type<int>(_430);
    float _568 = floor(_534);
    bool _570 = _516 >= 0.0;
    bool _572 = isnan(_516);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    if (_478)
    {
        float _580 = _564 * _496;
        _156 = _580;
    }
    float _582 = _156;
    bool _584 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = isnan(_362);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    bool _596 = _516 > 0.0;
    float _598 = fma(_562, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _600 = _578 ? 0 : 1;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _362 + _602;
    bool _606 = _544 > 0.0;
    bool _608 = _544 >= 0.0;
    bool _610 = isnan(_544);
    bool _612 = _608 || _610;
    bool _614 = isnan(0.0);
    bool _616 = _612 || _614;
    float _618 = -_594;
    float _620 = _618 + 1.0;
    bool _622 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _624 = isnan(_362);
    bool _626 = _622 || _624;
    bool _628 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _630 = _626 || _628;
    float _632 = float(_630);
    float _634 = fma(_502, _604, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _636 = _362 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _638 = isnan(_362);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _650 = _362 + _648;
    int _652 = ~_600;
    int _654 = _652 + 1;
    int _656 = _654 + 1;
    float _658 = _632 * _620;
    float _660 = -_632;
    float _662 = _660 + 1.0;
    int _664 = _656;
    if (!_596)
    {
        int _666 = ~_600;
        int _668 = _666 + 1;
        _664 = _668;
    }
    int _670 = _664;
    float _672 = fma(_526, _650, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    int _674 = _616 ? 0 : 1;
    float _676 = _646 * _662;
    float _678 = _454 + _532;
    bool _680 = _568 > 0.0;
    float _682 = _444 + _558;
    float _684 = _634 * _676;
    float _686 = -_646;
    float _688 = _686 + 1.0;
    bool _690 = _568 >= 0.0;
    bool _692 = isnan(_568);
    bool _694 = _690 || _692;
    bool _696 = isnan(0.0);
    bool _698 = _694 || _696;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _434 + _700;
    bool _704 = !_394;
    int _706 = _704 ? 0 : 1;
    float _708 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[115].x, _684);
    float _710 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _712 = _682 + _710;
    int _714 = ~_674;
    int _716 = _714 + 1;
    int _718 = _716 + 1;
    float _720 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _722 = fma(_672, _658, _708);
    int _724 = abs(_706);
    float _726 = _702 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _728 = _718;
    if (!_606)
    {
        int _730 = ~_674;
        int _732 = _730 + 1;
        _728 = _732;
    }
    int _734 = _728;
    float _736 = _702 * _702;
    float _738 = _386 ? as_type<float>(_566) : _430;
    float _740 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _742 = _678 + _740;
    float _744 = fma(_712, (*spvDescriptorSet0.vp_c8)._m0[28].x, _726);
    float _746 = float(_724);
    int _748 = _698 ? 0 : 1;
    float _750 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[28].z, _744);
    float _752 = float(_670);
    float _754 = _738 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _756 = ~_748;
    int _758 = _756 + 1;
    int _760 = _758 + 1;
    float _762 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[117].x, _722);
    bool _764 = _750 >= 0.0;
    float _766 = _746 * _752;
    bool _768 = !_398;
    int _770 = _768 ? 0 : 1;
    float _772 = _754 * _390;
    int _774 = _760;
    if (!_680)
    {
        int _776 = ~_748;
        int _778 = _776 + 1;
        _774 = _778;
    }
    int _780 = _774;
    float _782 = _538 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _784 = in.m_73.x;
    float _786 = in.m_73.y;
    float _788 = in.m_73.z;
    int _790 = abs(_770);
    float _792 = _782 * _720;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _798 = _762 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _802 = float(_790);
    float _804 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = float(_734);
    float _808 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _766 * (-2.0);
    out.m_75.x = _792;
    out.m_75.y = _772;
    out.m_75.z = _506;
    out.m_75.w = _430;
    float _814 = _802 * _806;
    float _816 = fma(_712, _712, _736);
    float _818 = 0.0;
    if (_764)
    {
        _818 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _820 = _818;
    out.m_77.x = _804;
    out.m_77.y = _808;
    out.m_77.z = _810;
    out.m_77.w = _798;
    float _822 = _814 * (-2.0);
    float _824 = fma(_742, _742, _816);
    float _826 = fma(_598, _812, _598);
    if (_764)
    {
        out.m_51.x = 0.0;
    }
    float _828 = fma(_812, _784, _784);
    float _830 = _422 + (-0.5);
    float _832 = rsqrt(_824);
    float _834 = _424 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _836 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[196].x, _828);
    bool _838 = !_402;
    int _840 = _838 ? 0 : 1;
    float _842 = fma(_822, _786, _786);
    float _844 = fma(_512, _822, _512);
    float _846 = _788;
    if (_764)
    {
        float _848 = _820 * 5.0;
        _518 = as_type<int>(_848);
    }
    int _850 = _518;
    float _852 = _834 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _854 = abs(_840);
    float _856 = fma(_826, _582, _836);
    if (_764)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3783 = as_type<float>(_850);
        out.gl_Position.z = _3783;
    }
    float _858 = float(_854);
    float _860 = _852 * _832;
    float _862 = _408 + (-0.5);
    float _864 = _712 * _860;
    float _866 = _702 * _860;
    float _868 = _866;
    if (_764)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _870 = -_866;
    float _872 = _434 + _870;
    float _874 = _742 * _860;
    float _876 = -_864;
    float _878 = _682 + _876;
    float _880 = float(_780);
    float _882 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _884 = _872 + _882;
    float _886 = -_874;
    float _888 = _678 + _886;
    float _890 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _892 = _878 + _890;
    float _894 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[196].y, _842);
    float _896 = _884 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _898 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _900 = _888 + _898;
    float _902 = _422 + _404;
    float _904 = _858 * _880;
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[28].x, _896);
    float _908 = fma(_844, _582, _894);
    float _910 = -_866;
    float _912 = _702 + _910;
    float _914 = fma(_900, (*spvDescriptorSet0.vp_c8)._m0[28].z, _906);
    float _916 = _902 + (-1.0);
    float _918 = _904 * (-2.0);
    float _920 = _908 * 0.15915493667125701904296875;
    float _922 = -_864;
    float _924 = _712 + _922;
    bool _926 = _914 >= 0.0;
    float _928 = _912 * _912;
    float _930 = fma(_916, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _932 = fma(_918, _788, _788);
    float _934 = _404 + (-0.5);
    float _936 = fma(_924, _924, _928);
    float _938 = -_874;
    float _940 = _742 + _938;
    float _942 = fma(_930, _918, _930);
    float _944 = fma(_934, (*spvDescriptorSet0.vp_c9)._m0[196].z, _932);
    float _946 = _856 * 0.15915493667125701904296875;
    float _948 = fma(_940, _940, _936);
    float _950 = _920 * 6.283185482025146484375;
    float _952 = sin(_950);
    float _954 = fma(_942, _582, _944);
    float _956 = _874;
    if (_926)
    {
        _846 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _958 = _846;
    int _960 = as_type<int>(_958);
    if (_926)
    {
        out.m_51.x = 0.0;
    }
    float _962 = _954 * 0.15915493667125701904296875;
    if (_926)
    {
        float _964 = _958 * 5.0;
        _960 = as_type<int>(_964);
    }
    int _966 = _960;
    float _968 = _946 * 6.283185482025146484375;
    float _970 = sin(_968);
    if (_926)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3969 = as_type<float>(_966);
        out.gl_Position.z = _3969;
    }
    float _972 = _946 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _920 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = sqrt(_948);
    if (_926)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _982 = in.m_79.x;
    float _984 = in.m_79.y;
    float _986 = in.m_79.z;
    float _988 = _962 * 6.283185482025146484375;
    float _990 = cos(_988);
    float _992 = _330 * _366;
    float _994 = _832 * _980;
    float _996 = _332 * _368;
    float _998 = _974 * _978;
    float _1000 = _992 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1002 = _974 * _952;
    float _1004 = _962 * 6.283185482025146484375;
    float _1006 = sin(_1004);
    float _1008 = _996 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1010 = _834 * _994;
    float _1012 = _970 * _952;
    float _1014 = _970 * _978;
    float _1016 = _974 * _990;
    float _1018 = _994 * _1000;
    float _1020 = _978 * _990;
    float _1022 = _970 * _990;
    float _1024 = _952 * _990;
    float _1026 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _984);
    float _1028 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _982);
    float _1030 = -_1014;
    float _1032 = fma(_1006, _1002, _1030);
    float _1034 = fma(_1006, _1012, _998);
    float _1036 = _1026 * _1018;
    float _1038 = _1028 * _1010;
    float _1040 = _994 * _1008;
    float _1042 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _986);
    float _1044 = fma(_1006, _998, _1012);
    float _1046 = _1016 * _1036;
    float _1048 = -_1036;
    float _1050 = _1006 * _1048;
    float _1052 = _1042 * _1040;
    float _1054 = -_1002;
    float _1056 = fma(_1006, _1014, _1054);
    float _1058 = fma(_1044, _1038, _1046);
    float _1060 = _1022 * _1036;
    float _1062 = fma(_1020, _1038, _1050);
    float _1064 = fma(_1032, _1052, _1058);
    float _1066 = fma(_1056, _1038, _1060);
    float _1068 = fma(_1024, _1052, _1062);
    float _1070 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1072 = fma(_1034, _1052, _1066);
    float _1074 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1076 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1070);
    float _1078 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1074);
    float _1080 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1076);
    float _1082 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1078);
    float _1084 = _1080 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1086 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1088 = _678 + _1084;
    float _1090 = _682 + _1086;
    float _1092 = _1064 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1096 = _1088 + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1100 = _1090 + _1098;
    float _1102 = fma(_1068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1092);
    float _1104 = _1096 * _1096;
    float _1106 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1102);
    float _1108 = fma(_1100, _1100, _1104);
    float _1110 = _1106 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1112 = sqrt(_1108);
    float _1114 = _434 + _1110;
    bool _1116 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = _1072;
    float _1120 = _1064;
    float _1122 = _1090;
    if (!_1116)
    {
        _1118 = _1088;
    }
    float _1124 = _1118;
    float _1126 = _1124;
    if (!_1116)
    {
        _1120 = _1114;
    }
    float _1128 = _1120;
    bool _1130 = !_1116;
    float _1132 = _1128;
    if (!_1130)
    {
        float _1134 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1136 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1138 = _1112 + _1136;
        float _1140 = rsqrt(_1108);
        float _1142 = _1138 * _1134;
        float _1144 = _1114 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1146 = _1142 * 0.15915493667125701904296875;
        float _1148 = _1146 * 6.283185482025146484375;
        float _1150 = cos(_1148);
        float _1152 = _1146 * 6.283185482025146484375;
        float _1154 = sin(_1152);
        float _1156 = _1150 + (-1.0);
        float _1158 = fma(_1154, _1144, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1160 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1162 = _1140 * _1158;
        float _1164 = fma(_1114, _1150, _1160);
        float _1166 = fma(_1100, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1168 = fma(_1096, _1162, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1126 = _1168;
        _1122 = _1166;
        _1132 = _1164;
    }
    float _1170 = _1126;
    float _1172 = _1122;
    float _1174 = _1132;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1178 = _1170 + _1176;
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1182 = _1172 + _1180;
    float _1184 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1186 = fma(_1182, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4325 = float2(_1186, _1184);
    float _1188 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4325, float2(0.0), isnan(_4325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4325, float2(0.0), isnan(_4325)), level(0.0)).x;
    float _1190 = -_434;
    float _1192 = _1190 + _1174;
    float _1194 = -_682;
    float _1196 = _1194 + _1172;
    float _1198 = -_678;
    float _1200 = _1198 + _1170;
    bool _1202 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1204 = isnan(0.5);
    bool _1206 = _1202 || _1204;
    bool _1208 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1210 = _1206 || _1208;
    bool _1212 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1214 = isnan(0.5);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1220 = _1216 || _1218;
    float _1222 = fma(_1188, 100.0, _434);
    float _1224 = _1192 * _1192;
    float _1226 = fma(_1188, 100.0, _1174);
    float _1228 = -_866;
    float _1230 = _1228 + _1222;
    float _1232 = fma(_1196, _1196, _1224);
    float _1234 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1236 = _1230 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1238 = fma(_1200, _1200, _1232);
    float _1240 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1234);
    float _1242 = sqrt(_1238);
    float _1244 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1240);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1248 = fma(_878, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1236);
    float _1250 = 1.0 / _1246;
    float _1252 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1248);
    float _1254 = _1252 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1256 = _1242 > 0.0;
    float _1258 = _1254 + _1246;
    float _1260 = _1258 * _1250;
    float _1262 = _1260 * 0.5;
    float _1264 = _1242;
    float _1266 = _1262;
    float _1268 = _1170;
    float _1270 = _1172;
    float _1272 = _1222;
    if (!_1256)
    {
        _1264 = _1172;
    }
    float _1274 = _1264;
    float _1276 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1278 = fma(_1262, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1276);
    float _1280 = _1274;
    if (!_1256)
    {
        _1266 = _1226;
    }
    float _1282 = _1266;
    float _1284 = 1.0 / _1278;
    bool _1286 = !_1256;
    float _1288 = _1282;
    float _1290 = _1282;
    if (!_1286)
    {
        float _1292 = _210 * _210;
        float _1294 = fma(_214, _214, _1292);
        float _1296 = fma(_216, _216, _1294);
        float _1298 = rsqrt(_1238);
        float _1300 = sqrt(_1296);
        float _1302 = _1196 * _1298;
        float _1304 = _1192 * _1298;
        float _1306 = _1200 * _1298;
        bool _1308 = _1300 > 0.0;
        float _1310 = _1298;
        if (!_1308)
        {
            _1310 = _1172;
        }
        float _1312 = _1310;
        _1280 = _1312;
        if (!_1308)
        {
            _1288 = _1226;
        }
        float _1314 = _1288;
        bool _1316 = !_1308;
        _1290 = _1314;
        if (!_1316)
        {
            float _1318 = rsqrt(_1296);
            float _1320 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1322 = _210 * _1318;
            float _1324 = _214 * _1318;
            float _1326 = _1304 * _1322;
            float _1328 = _216 * _1318;
            float _1330 = fma(_1302, _1324, _1326);
            float _1332 = _1320 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1334 = fma(_1306, _1328, _1330);
            float _1336 = _1334 * _1332;
            float _1338 = fma(_214, _1336, _1172);
            float _1340 = fma(_210, _1336, _1226);
            float _1342 = fma(_216, _1336, _1170);
            _1280 = _1338;
            _1268 = _1342;
            _1290 = _1340;
        }
    }
    float _1344 = _1280;
    float _1346 = _1268;
    float _1348 = _1290;
    float _1350 = -_864;
    float _1352 = _1350 + _1344;
    float _1354 = -_874;
    float _1356 = _1354 + _1346;
    float _1358 = -_866;
    float _1360 = _1358 + _1348;
    float _1362 = _1360;
    float _1364 = _1352;
    float _1366 = _1356;
    if (_1220)
    {
        _1270 = 1.0;
    }
    float _1368 = _1270;
    float _1370 = _1368;
    if (!_1210)
    {
        float _1372 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1374 = _1230 + _1372;
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1378 = -_678;
        float _1380 = _1378 + _1346;
        float _1382 = -_1222;
        float _1384 = _1382 + _1348;
        float _1386 = _1374 * _1374;
        float _1388 = -_682;
        float _1390 = _1388 + _1344;
        float _1392 = fma(_892, _892, _1386);
        float _1394 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1396 = fma(_900, _900, _1392);
        float _1398 = 1.0 / _994;
        float _1400 = sqrt(_1396);
        float _1402 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1404 = precise::min(_1400, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1406 = _1404 * _1376;
        float _1408 = _1406 * _1398;
        float _1410 = _1402 * _1408;
        float _1412 = _1380 * _1408;
        float _1414 = fma(_1384, _1410, _1230);
        float _1416 = fma(_1390, _1410, _878);
        float _1418 = fma(_1402, _1412, _888);
        _956 = _1402;
        _1362 = _1414;
        _1364 = _1416;
        _1366 = _1418;
    }
    float _1420 = _956;
    float _1422 = _1362;
    float _1424 = _1364;
    float _1426 = _1366;
    float _1428 = _1420;
    if (_1220)
    {
        _868 = 1.0;
    }
    float _1430 = _868;
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1434 = _1284 * _1432;
    float _1436 = _1430;
    if (!_1220)
    {
        float _1438 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1440 = _1438 * 0.15915493667125701904296875;
        float _1442 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1444;
        float _1448 = _1440 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1442 * 0.15915493667125701904296875;
        float _1454 = _1440 * 6.283185482025146484375;
        float _1456 = sin(_1454);
        float _1458 = 1.0 / _1450;
        float _1460 = _1452 * 6.283185482025146484375;
        float _1462 = cos(_1460);
        float _1464 = _1456 * _1458;
        float _1466 = _1452 * 6.283185482025146484375;
        float _1468 = sin(_1466);
        float _1470 = _1462 * _1464;
        float _1472 = 1.0 / _1446;
        float _1474 = 1.0 / _1470;
        float _1476 = _1468 * _1474;
        float _1478 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1480 = fma(_1434, _1476, _1478);
        float _1482 = _1480 * _1472;
        float _1484 = precise::clamp(_1482, 0.0, 1.0);
        _1428 = _1472;
        _1370 = _1484;
    }
    float _1486 = _1428;
    float _1488 = _1370;
    float _1490 = _1486;
    if (!_1220)
    {
        float _1492 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1494 = _1492 * 0.15915493667125701904296875;
        float _1496 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1498 = _1494 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        float _1502 = _1496 * 0.15915493667125701904296875;
        float _1504 = _1494 * 6.283185482025146484375;
        float _1506 = sin(_1504);
        float _1508 = 1.0 / _1500;
        float _1510 = _1502 * 6.283185482025146484375;
        float _1512 = cos(_1510);
        float _1514 = _1506 * _1508;
        float _1516 = _1502 * 6.283185482025146484375;
        float _1518 = sin(_1516);
        float _1520 = _1512 * _1514;
        float _1522 = 1.0 / _1520;
        float _1524 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1526 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1524;
        float _1528 = 1.0 / _1526;
        float _1530 = _1518 * _1522;
        float _1532 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1534 = fma(_1434, _1530, _1532);
        float _1536 = _1534 * _1528;
        float _1538 = precise::clamp(_1536, 0.0, 1.0);
        float _1540 = -_1538;
        float _1542 = _1540 + 1.0;
        _1490 = _1508;
        _1436 = _1542;
    }
    float _1544 = _1490;
    float _1546 = _1436;
    float _1548 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1550 = _1422 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1554 = _1424 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1558 = _1426 + _1556;
    float _1560 = _1550 * _1550;
    float _1562 = fma(_1554, _1554, _1560);
    float _1564 = fma(_1558, _1558, _1562);
    float _1566 = rsqrt(_1564);
    float _1568 = sqrt(_1564);
    float _1570 = _1566 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1572 = _1554 * _1570;
    float _1574 = _1558 * _1570;
    float _1576 = _1572 * _1572;
    float _1578 = _1574 * _1574;
    float _1580 = _1576 + _1578;
    float _1582 = sqrt(_1580);
    bool _1584 = _1582 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1586 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1588 = _1582 + _1586;
    float _1590 = _1558;
    float _1592 = _1560;
    float _1594 = _1588;
    float _1596 = _1544;
    float _1598 = _1576;
    if (_1584)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1590 = _1600;
    }
    float _1602 = _1590;
    if (_1584)
    {
        float _1604 = rsqrt(_1580);
        _1592 = _1604;
    }
    float _1606 = _1592;
    float _1608 = _1606;
    if (_1584)
    {
        float _1610 = _1588 * _1602;
        _1594 = _1610;
    }
    float _1612 = _1594;
    float _1614 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1584)
    {
        float _1616 = _1612 * 0.15915493667125701904296875;
        _1596 = _1616;
    }
    float _1618 = _1596;
    float _1620 = _1602;
    if (_1584)
    {
        float _1622 = _1618 * 6.283185482025146484375;
        float _1624 = sin(_1622);
        _1620 = _1624;
    }
    float _1626 = _1620;
    float _1628 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1630 = precise::max(0.0, _1628);
    float _1632 = _1566;
    float _1634 = _1630;
    if (_1584)
    {
        float _1636 = _1618 * 6.283185482025146484375;
        float _1638 = cos(_1636);
        _1632 = _1638;
    }
    float _1640 = _1632;
    float _1642 = -_1570;
    float _1644 = -_1630;
    float _1646 = fma(_1550, _1642, _1644);
    float _1648 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1584)
    {
        float _1650 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1634 = _1650;
    }
    float _1652 = _1634;
    float _1654 = fma(_878, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1656 = _1652;
    float _1658 = _1626;
    if (_1584)
    {
        float _1660 = fma(_1626, _1652, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1656 = _1660;
    }
    float _1662 = _1656;
    float _1664 = _1662;
    if (!_1584)
    {
        _1658 = _1574;
    }
    float _1666 = _1658;
    float _1668 = _1666;
    float _1670 = _1640;
    if (_1584)
    {
        float _1672 = _1640 + (-1.0);
        _1648 = _1672;
    }
    float _1674 = _1648;
    float _1676 = _1674;
    if (_1584)
    {
        float _1678 = _1606 * _1662;
        _1272 = _1678;
    }
    float _1680 = _1272;
    if (!_1584)
    {
        _1608 = _1572;
    }
    float _1682 = _1608;
    float _1684 = _1682;
    if (_1584)
    {
        float _1686 = _1674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1676 = _1686;
    }
    float _1688 = _1676;
    if (_1584)
    {
        float _1690 = _1572 * _1680;
        _1684 = _1690;
    }
    float _1692 = _1684;
    if (!_1584)
    {
        _1664 = _1646;
    }
    float _1694 = _1664;
    float _1696 = _1694;
    if (_1584)
    {
        float _1698 = _1574 * _1680;
        _1668 = _1698;
    }
    float _1700 = _1668;
    if (_1584)
    {
        float _1702 = fma(_1646, _1640, _1688);
        _1696 = _1702;
    }
    float _1704 = _1696;
    if (_1584)
    {
        float _1706 = _1692 * _1692;
        _1598 = _1706;
    }
    float _1708 = _1598;
    if (!_1584)
    {
        _1670 = _1578;
    }
    float _1710 = _1670;
    float _1712 = _1710;
    if (_1584)
    {
        float _1714 = _1700 * _1700;
        _1712 = _1714;
    }
    float _1716 = _1712;
    float _1718 = fma(_1704, _1704, _1708);
    float _1720 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1722 = floor(_1654);
    float _1724 = _1718 + _1716;
    float _1726 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1720);
    float _1728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1730 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1728);
    float _1732 = precise::clamp(_1730, 0.0, 1.0);
    float _1734 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1736 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1726);
    float _1738 = -_1732;
    float _1740 = _1738 + 1.0;
    float _1742 = rsqrt(_1724);
    float _1744 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1746 = _1736 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1748 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1614);
    float _1750 = _1746 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1752 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1754 = abs(_1740);
    float _1756 = log2(_1754);
    float _1758 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1760 = -_1750;
    float _1762 = fma(_1760, _1744, 1.0);
    float _1764 = _1422 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1766 = _1752 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1768 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1758);
    float _1770 = _1742 * _1692;
    float _1772 = _1742 * _1704;
    float _1774 = _1742 * _1700;
    float _1776 = fma(_1424, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1764);
    float _1778 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1768);
    float _1780 = _1770 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1782 = floor(_1734);
    float _1784 = fma(_1426, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1776);
    float _1786 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1788 = -_1780;
    float _1790 = fma(_1772, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1788);
    float _1792 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1794 = _1784 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1796 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1798 = -_1774;
    float _1800 = fma(_1798, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1790);
    float _1802 = exp2(_1792);
    float _1804 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1796);
    float _1806 = fma(_1800, -0.5, 0.5);
    float _1808 = fma(_1800, 0.5, 0.5);
    float _1810 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1804);
    float _1812 = _1772 + 1.0;
    float _1814 = log2(_1762);
    float _1816 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1818 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1810);
    float _1820 = -_1782;
    float _1822 = _1734 + _1820;
    float _1824 = fma(_1808, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1826 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1816);
    float _1828 = 1.0 / _1818;
    float _1830 = -_1722;
    float _1832 = _1654 + _1830;
    float _1834 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1836 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1826);
    float _1838 = -_1772;
    float _1840 = fma(_1802, _1812, _1838);
    float _1842 = fma(_1808, _1824, -0.212114393711090087890625);
    float _1844 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1834);
    float _1846 = sqrt(_1806);
    float2 _5350 = float2(_1832, _1822);
    float _1848 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5350, float2(0.0), isnan(_5350)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5350, float2(0.0), isnan(_5350)), level(0.0)).x;
    float _1850 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1844);
    float _1852 = _1814 * 0.693147182464599609375;
    float _1854 = fma(_1808, _1842, 1.570728778839111328125);
    float _1856 = fma(_1840, 0.5, 0.5);
    float _1858 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1850);
    float _1860 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1836);
    float _1862 = _1852 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1864 = _1858 * _1828;
    float _1866 = _1860 * _1828;
    float _1868 = fma(_1864, 0.5, 0.5);
    float _1870 = fma(_1866, -0.5, 0.5);
    float _1872 = _1846 * 0.636619746685028076171875;
    float _1874 = -_1854;
    float _1876 = fma(_1872, _1874, 1.0);
    float3 _5405 = float3(_1868, _1870, _1862);
    float _1878 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5405, float3(0.0), isnan(_5405)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5405, float3(0.0), isnan(_5405)), level(0.0)).x;
    float3 _5416 = float3(_1868, _1870, _1862);
    float4 _1881 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5416, float3(0.0), isnan(_5416)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5416, float3(0.0), isnan(_5416)), level(0.0)).xyzw;
    float _1883 = _1881.x;
    float _1885 = _1881.y;
    float _1887 = _1881.z;
    float _1889 = _1881.w;
    float2 _5432 = float2(_1876, _1856);
    float3 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5432, float2(0.0), isnan(_5432)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5432, float2(0.0), isnan(_5432)), level(0.0)).xyz;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1903 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1905 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1907 = _984 != 0.0;
    bool _1909 = isnan(_984);
    bool _1911 = _1907 || _1909;
    bool _1913 = isnan(0.0);
    bool _1915 = _1911 || _1913;
    float _1917 = in.m_81.x;
    float _1919 = in.m_81.y;
    float _1921 = in.m_81.z;
    float _1923 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1901);
    float _1925 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1903);
    float _1927 = fma(_1020, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1905);
    bool _1929 = _982 == 0.0;
    bool _1931 = !_1915;
    bool _1933 = _1929 && _1931;
    float _1935 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1923);
    float _1937 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1925);
    float _1939 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1927);
    bool _1941 = _986 == 0.0;
    bool _1943 = _1941 && _1933;
    float _1945 = in.m_83.x;
    float _1947 = in.m_83.y;
    float _1949 = in.m_83.z;
    float _1951 = in.m_83.w;
    float _1953 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1955 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1957 = _1016 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1959 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1961 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1963 = _1032 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1965 = -_1006;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1953);
    float _1969 = -_1006;
    float _1971 = fma(_1969, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1955);
    float _1973 = -_1006;
    float _1975 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1957);
    float _1977 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1959);
    float _1979 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1961);
    float _1981 = fma(_1024, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1963);
    float _1983 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1967);
    float _1985 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1971);
    float _1987 = _1963;
    float _1989 = _1981;
    float _1991 = _1975;
    float _1993 = _1959;
    if (_1943)
    {
        _1987 = _1921;
    }
    float _1995 = _1987;
    float _1997 = fma(_1022, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1975);
    float _1999 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1977);
    float _2001 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1979);
    float _2003 = fma(_1034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1981);
    float _2005 = _1995;
    if (_1943)
    {
        _1989 = _1995;
    }
    float _2007 = _1989;
    float _2009 = _1756 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2011 = _2007;
    if (!_1943)
    {
        _2005 = _1921;
    }
    float _2013 = _2005;
    float _2015 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1943)
    {
        _1991 = _1917;
    }
    float _2017 = _1991;
    float _2019 = _2017;
    if (!_1943)
    {
        float _2021 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1917);
        _2019 = _2021;
    }
    float _2023 = _2019;
    float _2025 = _1983 * _1947;
    if (!_1943)
    {
        float _2027 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2013);
        _2011 = _2027;
    }
    float _2029 = _2011;
    float _2031 = _1997 * _1947;
    float _2033 = _1949 * _1917;
    if (_1943)
    {
        _1993 = _1919;
    }
    float _2035 = _1993;
    float _2037 = fma(_1935, _1945, _2025);
    float _2039 = _2035;
    if (!_1943)
    {
        float _2041 = fma(_984, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1919);
        _2039 = _2041;
    }
    float _2043 = _2039;
    float _2045 = _1945 * _1919;
    float _2047 = _1947 * _2013;
    float _2049 = fma(_1939, _1945, _2031);
    float _2051 = -_2033;
    float _2053 = fma(_1945, _2013, _2051);
    float _2055 = -_2045;
    float _2057 = fma(_1947, _1917, _2055);
    float _2059 = -_2047;
    float _2061 = fma(_1949, _1919, _2059);
    float _2063 = _1985 * _1947;
    float _2065 = _2053 * _1951;
    float _2067 = exp2(_2009);
    float _2069 = _2061 * _1951;
    float _2071 = fma(_1937, _1945, _2063);
    float _2073 = _2065 * _1983;
    float _2075 = _2065 * _1985;
    float _2077 = fma(_1999, _1949, _2037);
    float _2079 = fma(_2001, _1949, _2071);
    float _2081 = _2057 * _1951;
    float _2083 = fma(_2069, _1935, _2073);
    float _2085 = _2065 * _1997;
    float _2087 = fma(_2069, _1937, _2075);
    float _2089 = _1983 * _2043;
    float _2091 = _1985 * _2043;
    float _2093 = _1997 * _2043;
    float _2095 = fma(_2081, _1999, _2083);
    float _2097 = fma(_2069, _1939, _2085);
    float _2099 = fma(_2081, _2001, _2087);
    float _2101 = fma(_1935, _2023, _2089);
    float _2103 = fma(_1937, _2023, _2091);
    float _2105 = fma(_1939, _2023, _2093);
    float _2107 = fma(_2003, _1949, _2049);
    float _2109 = abs(_1434);
    float _2111 = log2(_2109);
    float _2113 = fma(_2001, _2029, _2103);
    float _2115 = fma(_2081, _2003, _2097);
    out.m_85.x = _2077;
    out.m_85.y = _2079;
    out.m_85.z = _2107;
    float _2117 = fma(_1794, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2015);
    float _2119 = -_2067;
    float _2121 = _2119 + 1.0;
    float _2123 = fma(_1999, _2029, _2101);
    out.m_87.x = _2095;
    out.m_87.y = _2099;
    out.m_87.z = _2115;
    bool _2125 = _1434 <= 8000.0;
    bool _2127 = isnan(_1434);
    bool _2129 = _2125 || _2127;
    bool _2131 = isnan(8000.0);
    bool _2133 = _2129 || _2131;
    float _2135 = float(_2133);
    float _2137 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2117);
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2141 = in.m_67.x;
    float _2143 = fma(_2003, _2029, _2105);
    bool _2145 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2147 = isnan(_1568);
    bool _2149 = _2145 || _2147;
    bool _2151 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2153 = _2149 || _2151;
    float _2155 = _2111 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_89.x = _2123;
    out.m_89.y = _2113;
    out.m_89.z = _2143;
    float _2157 = exp2(_2155);
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2161 = precise::clamp(_2159, 0.0, 1.0);
    float _2163 = fma(_1766, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2137);
    float _2165 = fma(_2161, -2.0, 3.0);
    float _2167 = _2161 * _2161;
    float _2169 = _2163 + _1818;
    out.gl_Position.x = _1858;
    out.gl_Position.y = _1860;
    out.gl_Position.z = _2163;
    out.gl_Position.w = _1818;
    float _2171 = _2167 * _2165;
    float _2173 = _1818 * 0.5;
    float _2175 = _2169 * 0.5;
    float _2177 = -_2171;
    float _2179 = _2177 + 1.0;
    float _2181 = fma(_1860, -0.5, _2173);
    float _2183 = fma(_2179, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2171);
    float _2185 = _1858 + _1818;
    float _2187 = _2135 * _2183;
    float _2189 = _2185 * 0.5;
    float _2191 = _2187 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_91.x = _2189;
    out.m_91.y = _2181;
    out.m_91.z = _2175;
    out.m_91.w = _1818;
    float _2193 = _1488 * _1546;
    float _2195 = _1818;
    float _2197 = _2175;
    float _2199 = _2181;
    float _2201 = _2193;
    if (!_2153)
    {
        _2195 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2203 = _2195;
    float _2205 = _2203;
    float _2207 = _2203;
    if (!_2153)
    {
        _2197 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2209 = _2197;
    float _2211 = _2209;
    float _2213 = _2209;
    if (!_2153)
    {
        _2199 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2215 = _2199;
    float _2217 = -_1848;
    float _2219 = _2217 + 1.0;
    float _2221 = _2219 * _2191;
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -_2223;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2229 = _2227 * _2141;
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2233 = _2229;
    float _2235 = _2215;
    float _2237 = _2215;
    if (!_2153)
    {
        _2201 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2239 = _2201;
    float _2241 = _2229 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2243 = _2239;
    float _2245 = _2239;
    if (!_2153)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2247 = _2233;
    float _2249 = _2139 * _1878;
    float _2251 = -_2139;
    float _2253 = _2251 + 1.0;
    out.m_93.x = _2241;
    float _2255 = _1889 * _2249;
    float _2257 = _1899 * _2249;
    float _2259 = _1889 * _2253;
    float _2261 = fma(_1895, _2255, _1883);
    float _2263 = fma(_1897, _2255, _1885);
    float _2265 = fma(_1889, _2257, _1887);
    float _2267 = _2255;
    float _2269 = _2247;
    float _2271 = _2247;
    if (!_2153)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _2267;
    out.m_95.x = _2261;
    out.m_95.y = _2263;
    out.m_95.z = _2265;
    out.m_95.w = _2259;
    bool _2275 = !_2153;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2275)
    {
        bool _2281 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2283 = isnan(_1568);
        bool _2285 = _2281 || _2283;
        bool _2287 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2289 = _2285 || _2287;
        if (!_2289)
        {
            float _2291 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2293 = _1568 + _2291;
            float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2297 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2295;
            float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2307 = 1.0 / _2297;
            float _2309 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2311 = _2309 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2313 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2315 = _2313 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2317 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2319 = _2317 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2321 = _2293 * _2307;
            float _2323 = precise::clamp(_2321, 0.0, 1.0);
            float _2325 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2327 = _2325 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2329 = fma(_2323, _2301, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2331 = fma(_2323, _2305, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2333 = fma(_2323, _2311, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2335 = fma(_2323, _2327, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2337 = fma(_2323, _2315, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2339 = fma(_2323, _2319, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2271 = _2333;
            _2237 = _2329;
            _2279 = _2331;
            _2213 = _2337;
            _2207 = _2335;
            _2245 = _2339;
            _2341 = true;
        }
        else
        {
            bool _2343 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2345 = isnan(_1568);
            bool _2347 = _2343 || _2345;
            bool _2349 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2351 = _2347 || _2349;
            if (!_2351)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2353 = _2277;
            _2279 = _2353;
            if (!_2351)
            {
                _2269 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2355 = _2269;
            _2271 = _2355;
            if (!_2351)
            {
                _2205 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2357 = _2205;
            _2207 = _2357;
            if (!_2351)
            {
                _2211 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2359 = _2211;
            _2213 = _2359;
            if (!_2351)
            {
                _2235 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2361 = _2235;
            _2237 = _2361;
            if (!_2351)
            {
                _2243 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2363 = _2243;
            bool _2365 = !_2351;
            _2245 = _2363;
            if (!_2365)
            {
                bool _2367 = _1568 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2369 = isnan(_1568);
                bool _2371 = _2367 || _2369;
                bool _2373 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2375 = _2371 || _2373;
                if (!_2375)
                {
                    float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2379 = _1568 + _2377;
                    float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2383 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2381;
                    float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2389 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2393 = 1.0 / _2383;
                    float _2395 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2397 = _2395 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2399 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2401 = _2399 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2403 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2405 = _2403 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2407 = _2379 * _2393;
                    float _2409 = precise::clamp(_2407, 0.0, 1.0);
                    float _2411 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2413 = _2411 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2415 = fma(_2409, _2387, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2417 = fma(_2409, _2391, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2419 = fma(_2409, _2397, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2421 = fma(_2409, _2413, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2423 = fma(_2409, _2401, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2425 = fma(_2409, _2405, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2271 = _2419;
                    _2237 = _2415;
                    _2279 = _2417;
                    _2213 = _2423;
                    _2207 = _2421;
                    _2245 = _2425;
                    _2341 = true;
                }
                else
                {
                    _2271 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2237 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2213 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2207 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2245 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2341 = false;
    float _2427 = _2271;
    float _2429 = _2237;
    float _2431 = _2279;
    float _2433 = _2213;
    float _2435 = _2207;
    float _2437 = _2245;
    float _2439 = fma(_2113, -0.5, 0.5);
    float _2441 = precise::clamp(_2439, 0.0, 1.0);
    float _2443 = -_2427;
    float _2445 = _2443 + _2429;
    float _2447 = -_2431;
    float _2449 = _2447 + _2433;
    out.m_97.x = 0.0;
    float _2451 = -_2435;
    float _2453 = _2451 + _2437;
    float _2455 = fma(_2441, _2445, _2427);
    float _2457 = fma(_2441, _2449, _2431);
    bool _2459 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2461 = _2455 * 0.586610972881317138671875;
    float _2463 = fma(_2441, _2453, _2435);
    float _2465 = _2231 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2467 = fma(_2457, 0.298911988735198974609375, _2461);
    bool _2469 = _1488 > 0.0;
    bool _2471 = isnan(_1488);
    bool _2473 = _2469 || _2471;
    bool _2475 = isnan(0.0);
    bool _2477 = _2473 || _2475;
    float _2479 = fma(_2463, 0.114477999508380889892578125, _2467);
    out.m_51.x = _2465;
    bool _2481 = _1546 <= 0.0;
    bool _2483 = !_2477;
    bool _2485 = _2481 || _2483;
    float _2487 = -_2479;
    float _2489 = _2457 + _2487;
    float _2491 = -_2479;
    float _2493 = _2463 + _2491;
    float _2495 = fma(_2489, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    float _2497 = -_2479;
    float _2499 = _2455 + _2497;
    float _2501 = fma(_2499, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    float _2503 = fma(_2493, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2479);
    bool _2505 = !_2459;
    if (!_2505)
    {
        float _2507 = -_1422;
        float _2509 = _2507 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2511 = -_1424;
        float _2513 = _2511 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2515 = -_1426;
        float _2517 = _2515 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2519 = _2509 * _2509;
        float _2521 = fma(_2513, _2513, _2519);
        float _2523 = fma(_2517, _2517, _2521);
        float _2525 = sqrt(_2523);
        float _2527 = rsqrt(_2523);
        float _2529 = -_2525;
        float _2531 = _2529 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2533 = _2531 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2535 = precise::clamp(_2533, 0.0, 1.0);
        float _2537 = _2513 * _2527;
        float _2539 = _2509 * _2527;
        float _2541 = abs(_2535);
        float _2543 = log2(_2541);
        float _2545 = _2517 * _2527;
        float _2547 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2549 = _2113 * _2539;
        float _2551 = -_2539;
        float _2553 = -_2547;
        float _2555 = fma(_2551, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2553);
        float _2557 = fma(_2123, _2537, _2549);
        float _2559 = -_2545;
        float _2561 = fma(_2559, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2555);
        float _2563 = fma(_2143, _2545, _2557);
        float _2565 = precise::clamp(_2563, 0.0, 1.0);
        float _2567 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2569 = _2561 + _2567;
        float _2571 = _2543 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2573 = _2569 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2575 = precise::clamp(_2573, 0.0, 1.0);
        float _2577 = exp2(_2571);
        float _2579 = _2577 * _2575;
        float _2581 = _2565 * _2579;
        float _2583 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2585 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2587 = _2581 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _2583;
        out.m_97.y = _2585;
        out.m_97.z = _2587;
    }
    out.m_99.x = _2495;
    out.m_99.y = _2501;
    out.m_99.z = _2503;
    if (!_2485)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2589 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2589;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

