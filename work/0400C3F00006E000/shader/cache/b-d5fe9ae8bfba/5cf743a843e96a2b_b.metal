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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_75 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 m_91 [[user(locn14)]];
    float4 m_95 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad4 [[user(locn4)]];
};

struct main0_in
{
    float4 m_89 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_65 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2291 = false;
    bool _1538 = false;
    bool _404 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2576 = as_type<float>(_134);
        out.gl_Position.z = _2576;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_55.w;
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
        out.m_53.x = 0.0;
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
        float _2645 = as_type<float>(_172);
        out.gl_Position.z = _2645;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _196;
    float _220;
    if (!_200)
    {
        float _204 = in.m_59.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _152 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _238 = 1.0 / _234;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _244 = _236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _230 + _252;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _258 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _262 = isnan(_230);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = 1.0 / _248;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _230 + _274;
    out.m_61.x = _250;
    out.m_61.y = _244;
    out.m_61.z = _258;
    out.m_61.w = _256;
    float _278 = -_270;
    float _280 = _278 + 1.0;
    float _282 = _254 * _238;
    bool _284 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_230);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_230);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _310 = _276 * _272;
    float _312 = _306 * _280;
    float _314 = -_306;
    float _316 = _314 + 1.0;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _326;
    float _330 = _294 * _316;
    float _332 = fma(_320, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_324, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = fma(_328, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = _336 * _330;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _362 = fma(_350, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_354, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _368 = fma(_358, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _372 = fma(_362, _312, _360);
    float _374 = fma(_364, _312, _366);
    float _376 = fma(_368, _312, _370);
    float _378 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].x, _372);
    float _380 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].y, _374);
    float _382 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].z, _376);
    bool _384 = !_308;
    float _402;
    if (!_384)
    {
        float _386 = in.m_59.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_118);
        float _408 = 1.0 / _406;
        float _410 = _152 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_59.z;
    float _416 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _418 = log2(_416);
    float _420 = in.m_59.x;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _432 = _430 != 0;
    float _434 = in.m_59.y;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _448 = 1.0 + _446;
    bool _450 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _458 = _454 || _456;
    float _460 = _418 * _152;
    float _462 = 1.0 / _448;
    float _464 = _414 * 2.0;
    float _466 = _420 * 2.0;
    float _468 = exp2(_460);
    float _470 = _434 * 2.0;
    float _472 = floor(_464);
    float _474 = _420 + _434;
    float _476 = _474 + (-1.0);
    float _478 = floor(_466);
    float _480 = -_468;
    float _482 = _480 + 1.0;
    float _484 = _458 ? _482 : 0.0;
    bool _486 = _472 > 0.0;
    float _488 = floor(_470);
    bool _490 = _472 >= 0.0;
    bool _492 = isnan(_472);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = _434 + _414;
    if (_444)
    {
        float _502 = _484 * _462;
        _156 = _502;
    }
    float _504 = _156;
    bool _506 = !_432;
    int _508 = _506 ? 0 : 1;
    float _510 = _500 + (-1.0);
    int _512 = _498 ? 0 : 1;
    bool _514 = _478 > 0.0;
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _518 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _520 = !_424;
    int _522 = _520 ? 0 : 1;
    bool _524 = _478 >= 0.0;
    bool _526 = isnan(_478);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = in.m_63.x;
    float _536 = in.m_63.y;
    float _538 = in.m_63.z;
    int _540 = ~_512;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    int _546 = _544;
    if (!_486)
    {
        int _548 = ~_512;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    int _554 = abs(_522);
    float _556 = float(_552);
    float _558 = float(_554);
    int _560 = _532 ? 0 : 1;
    bool _562 = !_428;
    int _564 = _562 ? 0 : 1;
    float _566 = _558 * _556;
    int _568 = ~_560;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = _420 + (-0.5);
    int _576 = abs(_564);
    int _578 = _572;
    if (!_514)
    {
        int _580 = ~_560;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = _488 > 0.0;
    bool _588 = _488 >= 0.0;
    bool _590 = isnan(_488);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _566 * (-2.0);
    float _600 = float(_576);
    float _602 = float(_584);
    float _604 = fma(_598, _534, _534);
    int _606 = _596 ? 0 : 1;
    float _608 = fma(_518, _598, _518);
    int _610 = abs(_508);
    float _612 = _600 * _602;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[196].x, _604);
    int _622 = _618;
    if (!_586)
    {
        int _624 = ~_606;
        int _626 = _624 + 1;
        _622 = _626;
    }
    int _628 = _622;
    float _630 = _612 * (-2.0);
    float _632 = _434 + (-0.5);
    float _634 = float(_610);
    float _636 = fma(_608, _504, _620);
    float _638 = fma(_630, _536, _536);
    float _640 = float(_628);
    float _642 = fma(_516, _630, _516);
    float _644 = _420 + _414;
    float _646 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _638);
    float _648 = _636 * 0.15915493667125701904296875;
    float _650 = _634 * _640;
    float _652 = _644 + (-1.0);
    float _654 = fma(_642, _504, _646);
    float _656 = in.m_65.x;
    float _658 = in.m_65.y;
    float _660 = in.m_65.z;
    float _662 = _650 * (-2.0);
    float _664 = _654 * 0.15915493667125701904296875;
    float _666 = _648 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = in.m_67.x;
    float _672 = in.m_67.y;
    float _674 = in.m_67.z;
    float _676 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _678 = fma(_662, _538, _538);
    float _680 = _414 + (-0.5);
    float _682 = fma(_676, _662, _676);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _686 = _648 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = fma(_682, _504, _684);
    float _692 = _690 * 0.15915493667125701904296875;
    float _694 = _664 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _382 * _660;
    float _700 = _380 * _658;
    float _702 = _378 * _656;
    float _704 = _664 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _672);
    float _712 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _720 = _710 * _712;
    float _722 = _692 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = _708 * _714;
    float _728 = _718 * _716;
    float _730 = in.m_50.x;
    float _732 = in.m_50.y;
    float _734 = in.m_50.z;
    float _736 = _668 * _696;
    float _738 = _688 * _696;
    float _740 = _692 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _688 * _706;
    float _746 = _688 * _724;
    float _748 = _668 * _706;
    float _750 = _668 * _724;
    float _752 = _706 * _724;
    float _754 = _746 * _720;
    float _756 = _696 * _724;
    float _758 = fma(_742, _744, _736);
    float _760 = -_720;
    float _762 = _742 * _760;
    float _764 = _750 * _720;
    float _766 = -_738;
    float _768 = fma(_742, _748, _766);
    float _770 = -_748;
    float _772 = fma(_742, _738, _770);
    float _774 = fma(_758, _726, _754);
    float _776 = fma(_742, _736, _744);
    float _778 = fma(_752, _726, _762);
    float _780 = fma(_768, _726, _764);
    float _782 = fma(_772, _728, _774);
    float _784 = _732 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _786 = fma(_756, _728, _778);
    float _788 = fma(_776, _728, _780);
    float _790 = _732 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[6].x, _784);
    float _798 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    float _804 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _806 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[24].z, _800);
    float _810 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[26].z, _802);
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _818 = _810 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _820 = _732 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _822 = _814 + _816;
    float _824 = _812 + _818;
    float _826 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[5].x, _820);
    float _828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _830 = _822 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _824 + _832;
    float _836 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[5].z, _826);
    float _838 = _830 * _830;
    float _840 = _834 * _834;
    float _842 = _836 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = _838 + _840;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = 0.0;
    float _856 = _782;
    float _858 = _836;
    float _860 = _822;
    float _862 = _824;
    float _864 = _838;
    float _866 = _840;
    if (_848)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _868;
    }
    float _870 = _854;
    float _872 = _870;
    if (_848)
    {
        float _874 = _852 * _870;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _880 = _876;
    if (_848)
    {
        float _882 = rsqrt(_844);
        _856 = _882;
    }
    float _884 = _856;
    if (_848)
    {
        float _886 = _876 * 0.15915493667125701904296875;
        _880 = _886;
    }
    float _888 = _880;
    float _890 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _878);
    float _892 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _894 = _730;
    if (_848)
    {
        float _896 = _888 * 6.283185482025146484375;
        float _898 = sin(_896);
        _894 = _898;
    }
    float _900 = _894;
    float _902 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _904 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _906 = _842 + _904;
    float _908 = floor(_902);
    float _910 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _912 = _906;
    if (_848)
    {
        float _914 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _858 = _914;
    }
    float _916 = _858;
    float _918 = _916;
    if (_848)
    {
        float _920 = fma(_900, _916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _918 = _920;
    }
    float _922 = _918;
    float _924 = floor(_910);
    float _926 = _922;
    if (_848)
    {
        float _928 = _884 * _922;
        _926 = _928;
    }
    float _930 = _926;
    if (_848)
    {
        float _932 = fma(_830, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _860 = _932;
    }
    float _934 = _860;
    if (_848)
    {
        float _936 = fma(_834, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _862 = _936;
    }
    float _938 = _862;
    float _940 = -_908;
    float _942 = _902 + _940;
    float _944 = fma(_934, 6.2500002968590706586837768554688e-05, 0.5);
    float _946 = fma(_938, 6.2500002968590706586837768554688e-05, 0.5);
    float _948 = -_924;
    float _950 = _910 + _948;
    float2 _3870 = float2(_944, _946);
    float3 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3870, float2(0.0), isnan(_3870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3870, float2(0.0), isnan(_3870)), level(0.0)).xyz;
    float _956 = _954.x;
    float _958 = _954.y;
    float _960 = _954.z;
    float2 _3886 = float2(_942, _950);
    float _962 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3886, float2(0.0), isnan(_3886)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3886, float2(0.0), isnan(_3886)), level(0.0)).x;
    float _964 = in.m_69.y;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _968 = in.m_59.w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _976 = _974 != 0;
    float _978 = in.m_69.x;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _982 = _980 != 0;
    float _984 = 1.0 / _972;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    bool _994 = _434 > 0.5;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1000 = 1.0 / _988;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1004 = _1002 != 0;
    float _1006 = -_964;
    float _1008 = _1006 + 1.0;
    float _1010 = 1.0 / _998;
    bool _1012 = _968 > 0.5;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1014;
    bool _1018 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1020 = isnan(_412);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    int _1030 = _1012 ? as_type<int>(_1008) : as_type<int>(_964);
    int _1032 = 0;
    bool _1034 = _1012;
    bool _1036 = _1004;
    float _1038 = _964;
    float _1040 = _978;
    if (_982)
    {
        float _1042 = -_978;
        float _1044 = _1042 + 1.0;
        _1032 = as_type<int>(_1044);
    }
    int _1046 = _1032;
    if (_976)
    {
        bool _1048 = _420 > 0.5;
        _1034 = _1048;
    }
    bool _1050 = _1034;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1052;
    float _1056 = _1004 ? as_type<float>(_1030) : _964;
    float _1058 = _1016 * _1000;
    if (_982)
    {
        bool _1060 = _414 > 0.5;
        _1036 = _1060;
    }
    bool _1062 = _1036;
    float _1064 = _1054 * _984;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1068 = _412 + _1066;
    if (_992)
    {
        float _1070 = _994 ? _1008 : _964;
        _1038 = _1070;
    }
    float _1072 = _1038;
    float _1074 = -_1028;
    float _1076 = _1074 + 1.0;
    bool _1078 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1080 = isnan(_412);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = fma(_1064, _1068, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1092 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1094 = isnan(_412);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = in.m_71.x;
    float _1106 = in.m_71.y;
    float _1108 = in.m_71.z;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1114 = _1088 * _1076;
    float _1116 = -_1088;
    float _1118 = _1116 + 1.0;
    bool _1120 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1122 = isnan(_412);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = -_1102;
    float _1134 = _1132 + 1.0;
    bool _1136 = _672 != 0.0;
    bool _1138 = isnan(_672);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = _1102 * _1118;
    float _1148 = _1112 * _1010;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1152 = _412 + _1150;
    float _1154 = _1130 * _1134;
    bool _1156 = _670 == 0.0;
    bool _1158 = !_1144;
    bool _1160 = _1156 && _1158;
    float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1164 = fma(_1148, _1152, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1166 = _1090 * _1154;
    bool _1168 = _674 == 0.0;
    bool _1170 = _1168 && _1160;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1174 = _412 + _1172;
    int _1176 = as_type<int>(_1148);
    float _1178 = _1166;
    if (_976)
    {
        float _1180 = -_978;
        float _1182 = _1180 + 1.0;
        _1176 = as_type<int>(_1182);
    }
    int _1184 = _1176;
    float _1186 = 0.0;
    if (!_976)
    {
        _1186 = _978;
    }
    float _1188 = _1186;
    float _1190 = -_1130;
    float _1192 = _1190 + 1.0;
    float _1194 = fma(_1058, _1174, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1198 = _1188;
    float _1200 = _1192;
    if (_976)
    {
        float _1202 = _1050 ? as_type<float>(_1184) : _978;
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1166);
    float _1208 = in.m_73.x;
    float _1210 = in.m_73.y;
    float _1212 = in.m_73.z;
    float _1214 = in.m_73.w;
    if (_982)
    {
        float _1216 = _1062 ? as_type<float>(_1046) : _978;
        _1040 = _1216;
    }
    float _1218 = _1040;
    float _1220 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1222 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1224 = 0.0;
    float _1226 = _1104;
    if (_1170)
    {
        _1224 = _1104;
    }
    float _1228 = _1224;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1234 = _1228;
    if (_1170)
    {
        _1200 = _1108;
    }
    float _1236 = _1200;
    float _1238 = fma(_1164, _1146, _1206);
    float _1240 = _1236;
    if (_1170)
    {
        _1178 = _1228;
    }
    float _1242 = _1178;
    float _1244 = _1242;
    if (!_1170)
    {
        float _1246 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1108);
        _1240 = _1246;
    }
    float _1248 = _1240;
    if (!_1170)
    {
        _1234 = _1104;
    }
    float _1250 = _1234;
    float _1252 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1170)
    {
        _1226 = _1106;
    }
    float _1254 = _1226;
    float _1256 = _1254;
    if (!_1170)
    {
        float _1258 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = fma(_1194, _1114, _1238);
    if (!_1170)
    {
        float _1264 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1244 = _1264;
    }
    float _1266 = _1244;
    float _1268 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1270 = _1220 * _966;
    float _1272 = _888;
    if (_848)
    {
        float _1274 = _888 * 6.283185482025146484375;
        float _1276 = cos(_1274);
        _1272 = _1276;
    }
    float _1278 = _1272;
    float _1280 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1262);
    float _1282 = _1268 * _1162;
    float _1284 = _1222 * _1196;
    float _1286 = _1232 * _1230;
    float _1288 = _1212 * _1250;
    float _1290 = _1210 * _1108;
    float _1292 = _1208 * _1106;
    float _1294 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1296 = -_1288;
    float _1298 = fma(_1208, _1108, _1296);
    float _1300 = -_1290;
    float _1302 = fma(_1212, _1106, _1300);
    float _1304 = -_1292;
    float _1306 = fma(_1210, _1250, _1304);
    out.m_75.x = _1284;
    out.m_75.y = _1282;
    out.m_75.z = _1286;
    out.m_75.w = _1270;
    float _1308 = _1298 * _1214;
    float _1310 = _1302 * _1214;
    float _1312 = _1306 * _1214;
    float _1314 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1316 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1318 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1320 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1322 = -_742;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1294);
    float _1326 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1314);
    float _1328 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1316);
    float _1330 = -_742;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1318);
    float _1334 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1320);
    float _1336 = _772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = -_742;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1252);
    float _1342 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1324);
    float _1344 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1326);
    float _1346 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1348 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1340);
    float _1350 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1328);
    float _1352 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1334);
    float _1354 = _1342 * _1210;
    float _1356 = _1348 * _1260;
    float _1358 = _1342 * _1260;
    float _1360 = _1308 * _1342;
    float _1362 = _772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = fma(_1344, _1266, _1356);
    float _1366 = _1356;
    float _1368 = _1358;
    float _1370 = _1208;
    float _1372 = _1312;
    if (_848)
    {
        float _1374 = _1278 + (-1.0);
        _1366 = _1374;
    }
    float _1376 = _1366;
    float _1378 = _772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1380 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1382 = _1348 * _1210;
    float _1384 = _1376;
    if (_848)
    {
        float _1386 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1346 * _1210;
    float _1392 = _1308 * _1348;
    float _1394 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1396 = fma(_1350, _1266, _1358);
    if (_848)
    {
        float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1400 = _934 + _1398;
        _1368 = _1400;
    }
    float _1402 = _1368;
    if (_848)
    {
        float _1404 = fma(_906, _1278, _1388);
        _912 = _1404;
    }
    float _1406 = _912;
    float _1408 = _1346 * _1260;
    float _1410 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1378);
    float _1412 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1380);
    float _1414 = fma(_1344, _1208, _1382);
    float _1416 = fma(_1310, _1344, _1392);
    float _1418 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1394);
    float _1420 = fma(_1350, _1208, _1354);
    float _1422 = fma(_1352, _1208, _1390);
    if (_848)
    {
        float _1424 = _1402 * _1402;
        _864 = _1424;
    }
    float _1426 = _864;
    if (_848)
    {
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1430 = _938 + _1428;
        _1370 = _1430;
    }
    float _1432 = _1370;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1436 = _1406 + _1434;
    float _1438 = _1308 * _1346;
    float _1440 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1410);
    if (_848)
    {
        float _1442 = _1432 * _1432;
        _866 = _1442;
    }
    float _1444 = _866;
    float _1446 = fma(_1436, _1436, _1426);
    float _1448 = fma(_1310, _1350, _1360);
    float _1450 = fma(_1310, _1352, _1438);
    float _1452 = _1446 + _1444;
    float _1454 = fma(_1412, _1212, _1414);
    float _1456 = fma(_1418, _1212, _1420);
    float _1458 = fma(_1440, _1212, _1422);
    float _1460 = sqrt(_1452);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1464 = fma(_1352, _1266, _1408);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1470 = fma(_1412, _1248, _1364);
    float _1472 = fma(_1312, _1412, _1416);
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1482 = fma(_1312, _1418, _1448);
    float _1484 = fma(_1312, _1440, _1450);
    float _1486 = fma(_1418, _1248, _1396);
    float _1488 = fma(_1440, _1248, _1464);
    out.m_77.x = _1474;
    out.m_77.y = _1476;
    out.m_77.z = _1478;
    out.m_77.w = _1480;
    bool _1490 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1492 = isnan(_1460);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1498 = _1494 || _1496;
    out.m_79.x = _1454;
    out.m_79.y = _1456;
    out.m_79.z = _1458;
    out.m_81.x = _1472;
    out.m_81.y = _1482;
    out.m_81.z = _1484;
    out.m_83.x = _1470;
    out.m_83.y = _1486;
    out.m_83.z = _1488;
    if (!_1498)
    {
        _1372 = 1.0;
    }
    float _1500 = _1372;
    out.m_85.x = _956;
    out.m_85.y = _958;
    out.m_85.z = _960;
    bool _1502 = !_1498;
    float _1504 = _1500;
    float _1506 = _958;
    float _1508 = _960;
    if (!_1502)
    {
        bool _1510 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1512 = isnan(_1460);
        bool _1514 = _1510 || _1512;
        bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1518 = _1514 || _1516;
        if (!_1518)
        {
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = _1460 + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1532 = 1.0 / _1526;
            float _1534 = _1522 * _1532;
            float _1536 = fma(_1534, _1530, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1536;
            _1506 = _1532;
            _1538 = true;
        }
        else
        {
            bool _1540 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1542 = isnan(_1460);
            bool _1544 = _1540 || _1542;
            bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1548 = _1544 || _1546;
            if (!_1548)
            {
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1460 + _1550;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1562 = 1.0 / _1556;
                float _1564 = _1552 * _1562;
                float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1566;
                _1506 = _1562;
                _1538 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1538 = false;
    float _1568 = _1504;
    float _1570 = _1506;
    float _1572 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1574 = _1406 + _1572;
    float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1578 = _934 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1582 = _938 + _1580;
    float _1584 = fma(_1574, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1586 = fma(_1578, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1588 = fma(_1582, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1590 = -_842;
    float _1592 = _1590 + _1584;
    float _1594 = -_814;
    float _1596 = _1594 + _1586;
    float _1598 = -_812;
    float _1600 = _1598 + _1588;
    float _1602 = _1592 * _1592;
    float _1604 = fma(_1596, _1596, _1602);
    float _1606 = fma(_1600, _1600, _1604);
    float _1608 = sqrt(_1606);
    bool _1610 = _1608 > 0.0;
    float _1612 = _1608;
    float _1614 = _1570;
    float _1616 = _1592;
    if (!_1610)
    {
        _1612 = _1586;
    }
    float _1618 = _1612;
    float _1620 = _1618;
    if (!_1610)
    {
        _1614 = _1584;
    }
    float _1622 = _1614;
    float _1624 = _1622;
    if (!_1610)
    {
        _1508 = _1588;
    }
    float _1626 = _1508;
    bool _1628 = !_1610;
    float _1630 = _1626;
    float _1632 = _1626;
    if (!_1628)
    {
        float _1634 = _196 * _196;
        float _1636 = fma(_194, _194, _1634);
        float _1638 = fma(_198, _198, _1636);
        float _1640 = rsqrt(_1606);
        float _1642 = sqrt(_1638);
        float _1644 = _1596 * _1640;
        float _1646 = _1592 * _1640;
        float _1648 = _1600 * _1640;
        bool _1650 = _1642 > 0.0;
        float _1652 = _1640;
        float _1654 = _1642;
        _1616 = _1646;
        if (!_1650)
        {
            _1652 = _1586;
        }
        float _1656 = _1652;
        _1620 = _1656;
        if (!_1650)
        {
            _1654 = _1584;
        }
        float _1658 = _1654;
        _1624 = _1658;
        if (!_1650)
        {
            _1630 = _1588;
        }
        float _1660 = _1630;
        bool _1662 = !_1650;
        _1632 = _1660;
        if (!_1662)
        {
            float _1664 = rsqrt(_1638);
            float _1666 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1668 = _196 * _1664;
            float _1670 = _194 * _1664;
            float _1672 = _198 * _1664;
            float _1674 = _1646 * _1668;
            float _1676 = fma(_1644, _1670, _1674);
            float _1678 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1680 = fma(_1648, _1672, _1676);
            float _1682 = _1680 * _1678;
            float _1684 = fma(_194, _1682, _1586);
            float _1686 = fma(_196, _1682, _1584);
            float _1688 = fma(_198, _1682, _1588);
            _1624 = _1686;
            _1620 = _1684;
            _1632 = _1688;
        }
    }
    float _1690 = _1624;
    float _1692 = _1620;
    float _1694 = _1632;
    float _1696 = _1616;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1690 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1692 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1694 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1716 = fma(_1708, _1708, _1712);
    float _1718 = rsqrt(_1716);
    float _1720 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1474;
    float _1742 = _1730;
    float _1744 = _1738;
    float _1746 = _1696;
    float _1748 = _1700;
    float _1750 = _1722;
    if (_1734)
    {
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1752;
    }
    float _1754 = _1740;
    if (_1734)
    {
        float _1756 = rsqrt(_1730);
        _1742 = _1756;
    }
    float _1758 = _1742;
    float _1760 = _1758;
    if (_1734)
    {
        float _1762 = _1738 * _1754;
        _1744 = _1762;
    }
    float _1764 = _1744;
    if (_1734)
    {
        float _1766 = _1764 * 0.15915493667125701904296875;
        _1746 = _1766;
    }
    float _1768 = _1746;
    float _1770 = _1708;
    float _1772 = _1768;
    if (_1734)
    {
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1782 = precise::max(0.0, _1780);
    float _1784 = _1754;
    float _1786 = _1782;
    if (_1734)
    {
        float _1788 = _1768 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        _1784 = _1790;
    }
    float _1792 = _1784;
    float _1794 = -_1720;
    float _1796 = -_1782;
    float _1798 = fma(_1700, _1794, _1796);
    if (_1734)
    {
        float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1748 = _1800;
    }
    float _1802 = _1748;
    float _1804 = _1778;
    float _1806 = _1802;
    if (_1734)
    {
        float _1808 = fma(_1778, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1810;
    if (!_1734)
    {
        _1806 = _1724;
    }
    float _1814 = _1806;
    float _1816 = _1814;
    float _1818 = _1792;
    if (_1734)
    {
        float _1820 = _1792 + (-1.0);
        _1786 = _1820;
    }
    float _1822 = _1786;
    if (_1734)
    {
        float _1824 = _1758 * _1810;
        _202 = _1824;
    }
    float _1826 = _202;
    if (!_1734)
    {
        _1812 = _1798;
    }
    float _1828 = _1812;
    float _1830 = _1828;
    if (_1734)
    {
        float _1832 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1832;
    }
    float _1834 = _1772;
    if (_1734)
    {
        float _1836 = _1722 * _1826;
        _1750 = _1836;
    }
    float _1838 = _1750;
    float _1840 = sqrt(_1716);
    if (!_1734)
    {
        _1760 = _1726;
    }
    float _1842 = _1760;
    float _1844 = _1842;
    if (_1734)
    {
        float _1846 = fma(_1798, _1792, _1834);
        _1830 = _1846;
    }
    float _1848 = _1830;
    if (_1734)
    {
        float _1850 = _1724 * _1826;
        _1816 = _1850;
    }
    float _1852 = _1816;
    if (_1734)
    {
        float _1854 = _1838 * _1838;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (!_1734)
    {
        _1818 = _1728;
    }
    float _1858 = _1818;
    float _1860 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1862 = _1858;
    if (_1734)
    {
        float _1864 = _1852 * _1852;
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = fma(_1848, _1848, _1856);
    float _1870 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1860);
    float _1872 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = _1868 + _1866;
    float _1876 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = rsqrt(_1874);
    float _1888 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1890 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1894 = -_1884;
    float _1896 = _1894 + 1.0;
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1902 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1904 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1878);
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1908 = abs(_1896);
    float _1910 = log2(_1908);
    float _1912 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1900);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1916 = -_1906;
    float _1918 = fma(_1916, _1714, 1.0);
    float _1920 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1922 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1886 * _1838;
    float _1928 = _1886 * _1848;
    float _1930 = _1886 * _1852;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1936 = log2(_1918);
    float _1938 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1940 = -_1934;
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1940);
    float _1944 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1948 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1938);
    float _1950 = -_1930;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1942);
    float _1954 = exp2(_1944);
    float _1956 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1958 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1946);
    float _1960 = fma(_1952, -0.5, 0.5);
    float _1962 = fma(_1952, 0.5, 0.5);
    float _1964 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1956);
    float _1966 = _1928 + 1.0;
    float _1968 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1958);
    float _1970 = 1.0 / _1948;
    float _1972 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1964);
    float _1974 = fma(_1962, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1976 = fma(_1962, _1974, -0.212114393711090087890625);
    float _1978 = sqrt(_1960);
    float _1980 = -_1928;
    float _1982 = fma(_1954, _1966, _1980);
    float _1984 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1986 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1988 = _1936 * 0.693147182464599609375;
    float _1990 = fma(_1962, _1976, 1.570728778839111328125);
    float _1992 = fma(_1982, 0.5, 0.5);
    float _1994 = _1984 * _1970;
    float _1996 = _1986 * _1970;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_1996, -0.5, 0.5);
    float _2004 = _1978 * 0.636619746685028076171875;
    float _2006 = -_1990;
    float _2008 = fma(_2004, _2006, 1.0);
    float3 _5662 = float3(_2000, _2002, _1998);
    float _2010 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5662, float3(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5662, float3(0.0), isnan(_5662)), level(0.0)).x;
    float3 _5673 = float3(_2000, _2002, _1998);
    float4 _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5673, float3(0.0), isnan(_5673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5673, float3(0.0), isnan(_5673)), level(0.0)).xyzw;
    float _2015 = _2013.x;
    float _2017 = _2013.y;
    float _2019 = _2013.z;
    float _2021 = _2013.w;
    float2 _5689 = float2(_2008, _1992);
    float3 _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5689, float2(0.0), isnan(_5689)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5689, float2(0.0), isnan(_5689)), level(0.0)).xyz;
    float _2025 = _2023.x;
    float _2027 = _2023.y;
    float _2029 = _2023.z;
    float _2031 = _842 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2033 = -_962;
    float _2035 = _2033 + 1.0;
    out.m_87.x = _1692;
    out.m_87.y = _1690;
    out.m_87.z = _1694;
    bool _2037 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2039 = isnan(_1840);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2045 = _2041 || _2043;
    float _2047 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2031);
    float _2049 = _842 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2051 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2047);
    float _2053 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2049);
    float _2055 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2057 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2053);
    float _2059 = 1.0 / _2055;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2063 = _2061 + _2055;
    float _2065 = _2063 * _2059;
    float _2067 = _2065 * 0.5;
    float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2071 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2069);
    float _2073 = 1.0 / _2071;
    float _2075 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2077 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2079 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2075);
    float _2081 = _1984 + _1948;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2085 = _2073 * _2083;
    float _2087 = exp2(_2077);
    float _2089 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2079);
    float _2091 = _2081 * 0.5;
    float _2093 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2095 = abs(_2085);
    float _2097 = log2(_2095);
    float _2099 = _2093 + _1948;
    out.gl_Position.x = _1984;
    out.gl_Position.y = _1986;
    out.gl_Position.z = _2093;
    out.gl_Position.w = _1948;
    float _2101 = _2099 * 0.5;
    bool _2103 = _2085 <= 8000.0;
    bool _2105 = isnan(_2085);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan(8000.0);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2117 = _2093;
    float _2119 = _1984;
    float _2121 = _1948;
    float _2123 = _1986;
    float _2125 = _2021;
    float _2127 = _2019;
    if (!_2045)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2129 = _2117;
    float _2131 = _2129;
    float _2133 = _2129;
    if (!_2045)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2135 = _2119;
    float _2137 = exp2(_2115);
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2141 = precise::clamp(_2139, 0.0, 1.0);
    float _2143 = -_2087;
    float _2145 = _2143 + 1.0;
    float _2147 = fma(_2141, -2.0, 3.0);
    float _2149 = _2141 * _2141;
    float _2151 = in.m_89.x;
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2155 = _2149 * _2147;
    float _2157 = -_2155;
    float _2159 = _2157 + 1.0;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2155);
    float _2163 = _2113 * _2161;
    float _2165 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2167 = _2035 * _2165;
    float _2169 = precise::clamp(_2167, 0.0, 1.0);
    float _2171 = -_2169;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2175 = _2173 * _2151;
    float _2177 = _1948 * 0.5;
    float _2179 = _2135;
    float _2181 = _2135;
    if (!_2045)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2183 = _2121;
    float _2185 = _2175 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2187 = fma(_1986, -0.5, _2177);
    float _2189 = _2183;
    float _2191 = _2183;
    if (!_2045)
    {
        _2123 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2193 = _2123;
    out.m_91.x = _2185;
    out.m_93.x = _2091;
    out.m_93.y = _2187;
    out.m_93.z = _2101;
    out.m_93.w = _1948;
    float _2195 = _2153 * _2010;
    float _2197 = -_2153;
    float _2199 = _2197 + 1.0;
    float _2201 = _2021 * _2195;
    float _2203 = _2029 * _2195;
    float _2205 = _2021 * _2199;
    float _2207 = fma(_2025, _2201, _2015);
    float _2209 = fma(_2027, _2201, _2017);
    float _2211 = fma(_2021, _2203, _2019);
    float _2213 = _2193;
    float _2215 = _2193;
    if (!_2045)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2217 = _2125;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2045)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2223 = _2127;
    out.m_95.x = _2207;
    out.m_95.y = _2209;
    out.m_95.z = _2211;
    out.m_95.w = _2205;
    bool _2225 = !_2045;
    float _2227 = _2223;
    float _2229 = _2223;
    if (!_2225)
    {
        bool _2231 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2233 = isnan(_1840);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2243 = _1840 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2247 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2245;
            float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2253 = 1.0 / _2247;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2271 = _2243 * _2253;
            float _2273 = precise::clamp(_2271, 0.0, 1.0);
            float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2279 = fma(_2273, _2251, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2281 = fma(_2273, _2277, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2283 = fma(_2273, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2285 = fma(_2273, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2287 = fma(_2273, _2265, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2289 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2229 = _2283;
            _2215 = _2287;
            _2221 = _2279;
            _2133 = _2285;
            _2191 = _2281;
            _2181 = _2289;
            _2291 = true;
        }
        else
        {
            bool _2293 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2295 = isnan(_1840);
            bool _2297 = _2293 || _2295;
            bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2301 = _2297 || _2299;
            if (!_2301)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2303 = _2219;
            _2221 = _2303;
            if (!_2301)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2305 = _2227;
            _2229 = _2305;
            if (!_2301)
            {
                _2189 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2307 = _2189;
            _2191 = _2307;
            if (!_2301)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2309 = _2131;
            _2133 = _2309;
            if (!_2301)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2311 = _2213;
            _2215 = _2311;
            if (!_2301)
            {
                _2179 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2313 = _2179;
            bool _2315 = !_2301;
            _2181 = _2313;
            if (!_2315)
            {
                bool _2317 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1840);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1840 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2339 = 1.0 / _2333;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2357 = _2329 * _2339;
                    float _2359 = precise::clamp(_2357, 0.0, 1.0);
                    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2365 = fma(_2359, _2337, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2229 = _2369;
                    _2215 = _2373;
                    _2221 = _2365;
                    _2133 = _2371;
                    _2191 = _2367;
                    _2181 = _2375;
                    _2291 = true;
                }
                else
                {
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2191 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2181 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2291 = false;
    float _2377 = _2229;
    float _2379 = _2215;
    float _2381 = _2221;
    float _2383 = _2133;
    float _2385 = _2191;
    float _2387 = _2181;
    float _2389 = fma(_1486, -0.5, 0.5);
    float _2391 = precise::clamp(_2389, 0.0, 1.0);
    float _2393 = -_2377;
    float _2395 = _2393 + _2379;
    float _2397 = -_2381;
    float _2399 = _2397 + _2383;
    float _2401 = -_2385;
    float _2403 = _2401 + _2387;
    bool _2405 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2407 = fma(_2391, _2395, _2377);
    float _2409 = fma(_2391, _2399, _2381);
    float _2411 = fma(_2391, _2403, _2385);
    float _2413 = _2407 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2415 = fma(_2409, 0.298911988735198974609375, _2413);
    float _2417 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2419 = fma(_2411, 0.114477999508380889892578125, _2415);
    out.m_53.x = _2417;
    float _2421 = -_2419;
    float _2423 = _2409 + _2421;
    float _2425 = -_2419;
    float _2427 = _2407 + _2425;
    float _2429 = -_2419;
    float _2431 = _2411 + _2429;
    float _2433 = fma(_2423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    float _2435 = fma(_2427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    float _2437 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    out.m_99.x = _2433;
    out.m_99.y = _2435;
    out.m_99.z = _2437;
    if (!_2405)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2439 = -_1690;
    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2443 = -_1692;
    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2447 = -_1694;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2451 = _2441 * _2441;
    float _2453 = fma(_2445, _2445, _2451);
    float _2455 = fma(_2449, _2449, _2453);
    float _2457 = sqrt(_2455);
    float _2459 = rsqrt(_2455);
    float _2461 = -_2457;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2465 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2467 = precise::clamp(_2465, 0.0, 1.0);
    float _2469 = _2445 * _2459;
    float _2471 = _2441 * _2459;
    float _2473 = abs(_2467);
    float _2475 = log2(_2473);
    float _2477 = _2449 * _2459;
    float _2479 = _2469 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2481 = _1486 * _2471;
    float _2483 = -_2471;
    float _2485 = -_2479;
    float _2487 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2485);
    float _2489 = fma(_1470, _2469, _2481);
    float _2491 = -_2477;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2487);
    float _2495 = fma(_1488, _2477, _2489);
    float _2497 = precise::clamp(_2495, 0.0, 1.0);
    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2501 = _2493 + _2499;
    float _2503 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2505 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = exp2(_2503);
    float _2511 = _2509 * _2507;
    float _2513 = _2497 * _2511;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2517 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2519 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2515;
    out.m_97.y = _2517;
    out.m_97.z = _2519;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2291 = false;
    bool _1538 = false;
    bool _404 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2576 = as_type<float>(_134);
        out.gl_Position.z = _2576;
    }
    if (!_122)
    {
        return out;
    }
    float _138 = in.m_55.w;
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
        out.m_53.x = 0.0;
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
        float _2645 = as_type<float>(_172);
        out.gl_Position.z = _2645;
    }
    if (_166)
    {
        return out;
    }
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _196;
    float _220;
    if (!_200)
    {
        float _204 = in.m_59.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _152 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _238 = 1.0 / _234;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _244 = _236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _230 + _252;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _258 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _262 = isnan(_230);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = 1.0 / _248;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _230 + _274;
    out.m_61.x = _250;
    out.m_61.y = _244;
    out.m_61.z = _258;
    out.m_61.w = _256;
    float _278 = -_270;
    float _280 = _278 + 1.0;
    float _282 = _254 * _238;
    bool _284 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_230);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_230);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _310 = _276 * _272;
    float _312 = _306 * _280;
    float _314 = -_306;
    float _316 = _314 + 1.0;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _326;
    float _330 = _294 * _316;
    float _332 = fma(_320, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_324, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = fma(_328, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = _336 * _330;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _362 = fma(_350, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_354, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _368 = fma(_358, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _372 = fma(_362, _312, _360);
    float _374 = fma(_364, _312, _366);
    float _376 = fma(_368, _312, _370);
    float _378 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].x, _372);
    float _380 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].y, _374);
    float _382 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].z, _376);
    bool _384 = !_308;
    float _402;
    if (!_384)
    {
        float _386 = in.m_59.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_118);
        float _408 = 1.0 / _406;
        float _410 = _152 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_59.z;
    float _416 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _418 = log2(_416);
    float _420 = in.m_59.x;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _432 = _430 != 0;
    float _434 = in.m_59.y;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _448 = 1.0 + _446;
    bool _450 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _458 = _454 || _456;
    float _460 = _418 * _152;
    float _462 = 1.0 / _448;
    float _464 = _414 * 2.0;
    float _466 = _420 * 2.0;
    float _468 = exp2(_460);
    float _470 = _434 * 2.0;
    float _472 = floor(_464);
    float _474 = _420 + _434;
    float _476 = _474 + (-1.0);
    float _478 = floor(_466);
    float _480 = -_468;
    float _482 = _480 + 1.0;
    float _484 = _458 ? _482 : 0.0;
    bool _486 = _472 > 0.0;
    float _488 = floor(_470);
    bool _490 = _472 >= 0.0;
    bool _492 = isnan(_472);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = _434 + _414;
    if (_444)
    {
        float _502 = _484 * _462;
        _156 = _502;
    }
    float _504 = _156;
    bool _506 = !_432;
    int _508 = _506 ? 0 : 1;
    float _510 = _500 + (-1.0);
    int _512 = _498 ? 0 : 1;
    bool _514 = _478 > 0.0;
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _518 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _520 = !_424;
    int _522 = _520 ? 0 : 1;
    bool _524 = _478 >= 0.0;
    bool _526 = isnan(_478);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = in.m_63.x;
    float _536 = in.m_63.y;
    float _538 = in.m_63.z;
    int _540 = ~_512;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    int _546 = _544;
    if (!_486)
    {
        int _548 = ~_512;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    int _554 = abs(_522);
    float _556 = float(_552);
    float _558 = float(_554);
    int _560 = _532 ? 0 : 1;
    bool _562 = !_428;
    int _564 = _562 ? 0 : 1;
    float _566 = _558 * _556;
    int _568 = ~_560;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = _420 + (-0.5);
    int _576 = abs(_564);
    int _578 = _572;
    if (!_514)
    {
        int _580 = ~_560;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = _488 > 0.0;
    bool _588 = _488 >= 0.0;
    bool _590 = isnan(_488);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _566 * (-2.0);
    float _600 = float(_576);
    float _602 = float(_584);
    float _604 = fma(_598, _534, _534);
    int _606 = _596 ? 0 : 1;
    float _608 = fma(_518, _598, _518);
    int _610 = abs(_508);
    float _612 = _600 * _602;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[196].x, _604);
    int _622 = _618;
    if (!_586)
    {
        int _624 = ~_606;
        int _626 = _624 + 1;
        _622 = _626;
    }
    int _628 = _622;
    float _630 = _612 * (-2.0);
    float _632 = _434 + (-0.5);
    float _634 = float(_610);
    float _636 = fma(_608, _504, _620);
    float _638 = fma(_630, _536, _536);
    float _640 = float(_628);
    float _642 = fma(_516, _630, _516);
    float _644 = _420 + _414;
    float _646 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _638);
    float _648 = _636 * 0.15915493667125701904296875;
    float _650 = _634 * _640;
    float _652 = _644 + (-1.0);
    float _654 = fma(_642, _504, _646);
    float _656 = in.m_65.x;
    float _658 = in.m_65.y;
    float _660 = in.m_65.z;
    float _662 = _650 * (-2.0);
    float _664 = _654 * 0.15915493667125701904296875;
    float _666 = _648 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = in.m_67.x;
    float _672 = in.m_67.y;
    float _674 = in.m_67.z;
    float _676 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _678 = fma(_662, _538, _538);
    float _680 = _414 + (-0.5);
    float _682 = fma(_676, _662, _676);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _686 = _648 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = fma(_682, _504, _684);
    float _692 = _690 * 0.15915493667125701904296875;
    float _694 = _664 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _382 * _660;
    float _700 = _380 * _658;
    float _702 = _378 * _656;
    float _704 = _664 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _672);
    float _712 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _720 = _710 * _712;
    float _722 = _692 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = _708 * _714;
    float _728 = _718 * _716;
    float _730 = in.m_50.x;
    float _732 = in.m_50.y;
    float _734 = in.m_50.z;
    float _736 = _668 * _696;
    float _738 = _688 * _696;
    float _740 = _692 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _688 * _706;
    float _746 = _688 * _724;
    float _748 = _668 * _706;
    float _750 = _668 * _724;
    float _752 = _706 * _724;
    float _754 = _746 * _720;
    float _756 = _696 * _724;
    float _758 = fma(_742, _744, _736);
    float _760 = -_720;
    float _762 = _742 * _760;
    float _764 = _750 * _720;
    float _766 = -_738;
    float _768 = fma(_742, _748, _766);
    float _770 = -_748;
    float _772 = fma(_742, _738, _770);
    float _774 = fma(_758, _726, _754);
    float _776 = fma(_742, _736, _744);
    float _778 = fma(_752, _726, _762);
    float _780 = fma(_768, _726, _764);
    float _782 = fma(_772, _728, _774);
    float _784 = _732 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _786 = fma(_756, _728, _778);
    float _788 = fma(_776, _728, _780);
    float _790 = _732 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[6].x, _784);
    float _798 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    float _804 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _806 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[24].z, _800);
    float _810 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[26].z, _802);
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _818 = _810 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _820 = _732 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _822 = _814 + _816;
    float _824 = _812 + _818;
    float _826 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[5].x, _820);
    float _828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _830 = _822 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _824 + _832;
    float _836 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[5].z, _826);
    float _838 = _830 * _830;
    float _840 = _834 * _834;
    float _842 = _836 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = _838 + _840;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = 0.0;
    float _856 = _782;
    float _858 = _836;
    float _860 = _822;
    float _862 = _824;
    float _864 = _838;
    float _866 = _840;
    if (_848)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _868;
    }
    float _870 = _854;
    float _872 = _870;
    if (_848)
    {
        float _874 = _852 * _870;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _880 = _876;
    if (_848)
    {
        float _882 = rsqrt(_844);
        _856 = _882;
    }
    float _884 = _856;
    if (_848)
    {
        float _886 = _876 * 0.15915493667125701904296875;
        _880 = _886;
    }
    float _888 = _880;
    float _890 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _878);
    float _892 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _894 = _730;
    if (_848)
    {
        float _896 = _888 * 6.283185482025146484375;
        float _898 = sin(_896);
        _894 = _898;
    }
    float _900 = _894;
    float _902 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _904 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _906 = _842 + _904;
    float _908 = floor(_902);
    float _910 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _912 = _906;
    if (_848)
    {
        float _914 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _858 = _914;
    }
    float _916 = _858;
    float _918 = _916;
    if (_848)
    {
        float _920 = fma(_900, _916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _918 = _920;
    }
    float _922 = _918;
    float _924 = floor(_910);
    float _926 = _922;
    if (_848)
    {
        float _928 = _884 * _922;
        _926 = _928;
    }
    float _930 = _926;
    if (_848)
    {
        float _932 = fma(_830, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _860 = _932;
    }
    float _934 = _860;
    if (_848)
    {
        float _936 = fma(_834, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _862 = _936;
    }
    float _938 = _862;
    float _940 = -_908;
    float _942 = _902 + _940;
    float _944 = fma(_934, 6.2500002968590706586837768554688e-05, 0.5);
    float _946 = fma(_938, 6.2500002968590706586837768554688e-05, 0.5);
    float _948 = -_924;
    float _950 = _910 + _948;
    float2 _3870 = float2(_944, _946);
    float3 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3870, float2(0.0), isnan(_3870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3870, float2(0.0), isnan(_3870)), level(0.0)).xyz;
    float _956 = _954.x;
    float _958 = _954.y;
    float _960 = _954.z;
    float2 _3886 = float2(_942, _950);
    float _962 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3886, float2(0.0), isnan(_3886)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3886, float2(0.0), isnan(_3886)), level(0.0)).x;
    float _964 = in.m_69.y;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _968 = in.m_59.w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _976 = _974 != 0;
    float _978 = in.m_69.x;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _982 = _980 != 0;
    float _984 = 1.0 / _972;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    bool _994 = _434 > 0.5;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1000 = 1.0 / _988;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1004 = _1002 != 0;
    float _1006 = -_964;
    float _1008 = _1006 + 1.0;
    float _1010 = 1.0 / _998;
    bool _1012 = _968 > 0.5;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1014;
    bool _1018 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1020 = isnan(_412);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    int _1030 = _1012 ? as_type<int>(_1008) : as_type<int>(_964);
    int _1032 = 0;
    bool _1034 = _1012;
    bool _1036 = _1004;
    float _1038 = _964;
    float _1040 = _978;
    if (_982)
    {
        float _1042 = -_978;
        float _1044 = _1042 + 1.0;
        _1032 = as_type<int>(_1044);
    }
    int _1046 = _1032;
    if (_976)
    {
        bool _1048 = _420 > 0.5;
        _1034 = _1048;
    }
    bool _1050 = _1034;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1052;
    float _1056 = _1004 ? as_type<float>(_1030) : _964;
    float _1058 = _1016 * _1000;
    if (_982)
    {
        bool _1060 = _414 > 0.5;
        _1036 = _1060;
    }
    bool _1062 = _1036;
    float _1064 = _1054 * _984;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1068 = _412 + _1066;
    if (_992)
    {
        float _1070 = _994 ? _1008 : _964;
        _1038 = _1070;
    }
    float _1072 = _1038;
    float _1074 = -_1028;
    float _1076 = _1074 + 1.0;
    bool _1078 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1080 = isnan(_412);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = fma(_1064, _1068, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1092 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1094 = isnan(_412);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = in.m_71.x;
    float _1106 = in.m_71.y;
    float _1108 = in.m_71.z;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1114 = _1088 * _1076;
    float _1116 = -_1088;
    float _1118 = _1116 + 1.0;
    bool _1120 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1122 = isnan(_412);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = -_1102;
    float _1134 = _1132 + 1.0;
    bool _1136 = _672 != 0.0;
    bool _1138 = isnan(_672);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = _1102 * _1118;
    float _1148 = _1112 * _1010;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1152 = _412 + _1150;
    float _1154 = _1130 * _1134;
    bool _1156 = _670 == 0.0;
    bool _1158 = !_1144;
    bool _1160 = _1156 && _1158;
    float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1164 = fma(_1148, _1152, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1166 = _1090 * _1154;
    bool _1168 = _674 == 0.0;
    bool _1170 = _1168 && _1160;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1174 = _412 + _1172;
    int _1176 = as_type<int>(_1148);
    float _1178 = _1166;
    if (_976)
    {
        float _1180 = -_978;
        float _1182 = _1180 + 1.0;
        _1176 = as_type<int>(_1182);
    }
    int _1184 = _1176;
    float _1186 = 0.0;
    if (!_976)
    {
        _1186 = _978;
    }
    float _1188 = _1186;
    float _1190 = -_1130;
    float _1192 = _1190 + 1.0;
    float _1194 = fma(_1058, _1174, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1198 = _1188;
    float _1200 = _1192;
    if (_976)
    {
        float _1202 = _1050 ? as_type<float>(_1184) : _978;
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1166);
    float _1208 = in.m_73.x;
    float _1210 = in.m_73.y;
    float _1212 = in.m_73.z;
    float _1214 = in.m_73.w;
    if (_982)
    {
        float _1216 = _1062 ? as_type<float>(_1046) : _978;
        _1040 = _1216;
    }
    float _1218 = _1040;
    float _1220 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1222 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1224 = 0.0;
    float _1226 = _1104;
    if (_1170)
    {
        _1224 = _1104;
    }
    float _1228 = _1224;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1234 = _1228;
    if (_1170)
    {
        _1200 = _1108;
    }
    float _1236 = _1200;
    float _1238 = fma(_1164, _1146, _1206);
    float _1240 = _1236;
    if (_1170)
    {
        _1178 = _1228;
    }
    float _1242 = _1178;
    float _1244 = _1242;
    if (!_1170)
    {
        float _1246 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1108);
        _1240 = _1246;
    }
    float _1248 = _1240;
    if (!_1170)
    {
        _1234 = _1104;
    }
    float _1250 = _1234;
    float _1252 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1170)
    {
        _1226 = _1106;
    }
    float _1254 = _1226;
    float _1256 = _1254;
    if (!_1170)
    {
        float _1258 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = fma(_1194, _1114, _1238);
    if (!_1170)
    {
        float _1264 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1244 = _1264;
    }
    float _1266 = _1244;
    float _1268 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1270 = _1220 * _966;
    float _1272 = _888;
    if (_848)
    {
        float _1274 = _888 * 6.283185482025146484375;
        float _1276 = cos(_1274);
        _1272 = _1276;
    }
    float _1278 = _1272;
    float _1280 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1262);
    float _1282 = _1268 * _1162;
    float _1284 = _1222 * _1196;
    float _1286 = _1232 * _1230;
    float _1288 = _1212 * _1250;
    float _1290 = _1210 * _1108;
    float _1292 = _1208 * _1106;
    float _1294 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1296 = -_1288;
    float _1298 = fma(_1208, _1108, _1296);
    float _1300 = -_1290;
    float _1302 = fma(_1212, _1106, _1300);
    float _1304 = -_1292;
    float _1306 = fma(_1210, _1250, _1304);
    out.m_75.x = _1284;
    out.m_75.y = _1282;
    out.m_75.z = _1286;
    out.m_75.w = _1270;
    float _1308 = _1298 * _1214;
    float _1310 = _1302 * _1214;
    float _1312 = _1306 * _1214;
    float _1314 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1316 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1318 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1320 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1322 = -_742;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1294);
    float _1326 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1314);
    float _1328 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1316);
    float _1330 = -_742;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1318);
    float _1334 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1320);
    float _1336 = _772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = -_742;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1252);
    float _1342 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1324);
    float _1344 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1326);
    float _1346 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1348 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1340);
    float _1350 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1328);
    float _1352 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1334);
    float _1354 = _1342 * _1210;
    float _1356 = _1348 * _1260;
    float _1358 = _1342 * _1260;
    float _1360 = _1308 * _1342;
    float _1362 = _772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = fma(_1344, _1266, _1356);
    float _1366 = _1356;
    float _1368 = _1358;
    float _1370 = _1208;
    float _1372 = _1312;
    if (_848)
    {
        float _1374 = _1278 + (-1.0);
        _1366 = _1374;
    }
    float _1376 = _1366;
    float _1378 = _772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1380 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1382 = _1348 * _1210;
    float _1384 = _1376;
    if (_848)
    {
        float _1386 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1346 * _1210;
    float _1392 = _1308 * _1348;
    float _1394 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1396 = fma(_1350, _1266, _1358);
    if (_848)
    {
        float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1400 = _934 + _1398;
        _1368 = _1400;
    }
    float _1402 = _1368;
    if (_848)
    {
        float _1404 = fma(_906, _1278, _1388);
        _912 = _1404;
    }
    float _1406 = _912;
    float _1408 = _1346 * _1260;
    float _1410 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1378);
    float _1412 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1380);
    float _1414 = fma(_1344, _1208, _1382);
    float _1416 = fma(_1310, _1344, _1392);
    float _1418 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1394);
    float _1420 = fma(_1350, _1208, _1354);
    float _1422 = fma(_1352, _1208, _1390);
    if (_848)
    {
        float _1424 = _1402 * _1402;
        _864 = _1424;
    }
    float _1426 = _864;
    if (_848)
    {
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1430 = _938 + _1428;
        _1370 = _1430;
    }
    float _1432 = _1370;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1436 = _1406 + _1434;
    float _1438 = _1308 * _1346;
    float _1440 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1410);
    if (_848)
    {
        float _1442 = _1432 * _1432;
        _866 = _1442;
    }
    float _1444 = _866;
    float _1446 = fma(_1436, _1436, _1426);
    float _1448 = fma(_1310, _1350, _1360);
    float _1450 = fma(_1310, _1352, _1438);
    float _1452 = _1446 + _1444;
    float _1454 = fma(_1412, _1212, _1414);
    float _1456 = fma(_1418, _1212, _1420);
    float _1458 = fma(_1440, _1212, _1422);
    float _1460 = sqrt(_1452);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1464 = fma(_1352, _1266, _1408);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1470 = fma(_1412, _1248, _1364);
    float _1472 = fma(_1312, _1412, _1416);
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1482 = fma(_1312, _1418, _1448);
    float _1484 = fma(_1312, _1440, _1450);
    float _1486 = fma(_1418, _1248, _1396);
    float _1488 = fma(_1440, _1248, _1464);
    out.m_77.x = _1474;
    out.m_77.y = _1476;
    out.m_77.z = _1478;
    out.m_77.w = _1480;
    bool _1490 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1492 = isnan(_1460);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1498 = _1494 || _1496;
    out.m_79.x = _1454;
    out.m_79.y = _1456;
    out.m_79.z = _1458;
    out.m_81.x = _1472;
    out.m_81.y = _1482;
    out.m_81.z = _1484;
    out.m_83.x = _1470;
    out.m_83.y = _1486;
    out.m_83.z = _1488;
    if (!_1498)
    {
        _1372 = 1.0;
    }
    float _1500 = _1372;
    out.m_85.x = _956;
    out.m_85.y = _958;
    out.m_85.z = _960;
    bool _1502 = !_1498;
    float _1504 = _1500;
    float _1506 = _958;
    float _1508 = _960;
    if (!_1502)
    {
        bool _1510 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1512 = isnan(_1460);
        bool _1514 = _1510 || _1512;
        bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1518 = _1514 || _1516;
        if (!_1518)
        {
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = _1460 + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1532 = 1.0 / _1526;
            float _1534 = _1522 * _1532;
            float _1536 = fma(_1534, _1530, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1536;
            _1506 = _1532;
            _1538 = true;
        }
        else
        {
            bool _1540 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1542 = isnan(_1460);
            bool _1544 = _1540 || _1542;
            bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1548 = _1544 || _1546;
            if (!_1548)
            {
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1460 + _1550;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1562 = 1.0 / _1556;
                float _1564 = _1552 * _1562;
                float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1566;
                _1506 = _1562;
                _1538 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1538 = false;
    float _1568 = _1504;
    float _1570 = _1506;
    float _1572 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1574 = _1406 + _1572;
    float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1578 = _934 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1582 = _938 + _1580;
    float _1584 = fma(_1574, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1586 = fma(_1578, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1588 = fma(_1582, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1590 = -_842;
    float _1592 = _1590 + _1584;
    float _1594 = -_814;
    float _1596 = _1594 + _1586;
    float _1598 = -_812;
    float _1600 = _1598 + _1588;
    float _1602 = _1592 * _1592;
    float _1604 = fma(_1596, _1596, _1602);
    float _1606 = fma(_1600, _1600, _1604);
    float _1608 = sqrt(_1606);
    bool _1610 = _1608 > 0.0;
    float _1612 = _1608;
    float _1614 = _1570;
    float _1616 = _1592;
    if (!_1610)
    {
        _1612 = _1586;
    }
    float _1618 = _1612;
    float _1620 = _1618;
    if (!_1610)
    {
        _1614 = _1584;
    }
    float _1622 = _1614;
    float _1624 = _1622;
    if (!_1610)
    {
        _1508 = _1588;
    }
    float _1626 = _1508;
    bool _1628 = !_1610;
    float _1630 = _1626;
    float _1632 = _1626;
    if (!_1628)
    {
        float _1634 = _196 * _196;
        float _1636 = fma(_194, _194, _1634);
        float _1638 = fma(_198, _198, _1636);
        float _1640 = rsqrt(_1606);
        float _1642 = sqrt(_1638);
        float _1644 = _1596 * _1640;
        float _1646 = _1592 * _1640;
        float _1648 = _1600 * _1640;
        bool _1650 = _1642 > 0.0;
        float _1652 = _1640;
        float _1654 = _1642;
        _1616 = _1646;
        if (!_1650)
        {
            _1652 = _1586;
        }
        float _1656 = _1652;
        _1620 = _1656;
        if (!_1650)
        {
            _1654 = _1584;
        }
        float _1658 = _1654;
        _1624 = _1658;
        if (!_1650)
        {
            _1630 = _1588;
        }
        float _1660 = _1630;
        bool _1662 = !_1650;
        _1632 = _1660;
        if (!_1662)
        {
            float _1664 = rsqrt(_1638);
            float _1666 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1668 = _196 * _1664;
            float _1670 = _194 * _1664;
            float _1672 = _198 * _1664;
            float _1674 = _1646 * _1668;
            float _1676 = fma(_1644, _1670, _1674);
            float _1678 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1680 = fma(_1648, _1672, _1676);
            float _1682 = _1680 * _1678;
            float _1684 = fma(_194, _1682, _1586);
            float _1686 = fma(_196, _1682, _1584);
            float _1688 = fma(_198, _1682, _1588);
            _1624 = _1686;
            _1620 = _1684;
            _1632 = _1688;
        }
    }
    float _1690 = _1624;
    float _1692 = _1620;
    float _1694 = _1632;
    float _1696 = _1616;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1690 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1692 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1694 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1716 = fma(_1708, _1708, _1712);
    float _1718 = rsqrt(_1716);
    float _1720 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1474;
    float _1742 = _1730;
    float _1744 = _1738;
    float _1746 = _1696;
    float _1748 = _1700;
    float _1750 = _1722;
    if (_1734)
    {
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1752;
    }
    float _1754 = _1740;
    if (_1734)
    {
        float _1756 = rsqrt(_1730);
        _1742 = _1756;
    }
    float _1758 = _1742;
    float _1760 = _1758;
    if (_1734)
    {
        float _1762 = _1738 * _1754;
        _1744 = _1762;
    }
    float _1764 = _1744;
    if (_1734)
    {
        float _1766 = _1764 * 0.15915493667125701904296875;
        _1746 = _1766;
    }
    float _1768 = _1746;
    float _1770 = _1708;
    float _1772 = _1768;
    if (_1734)
    {
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1782 = precise::max(0.0, _1780);
    float _1784 = _1754;
    float _1786 = _1782;
    if (_1734)
    {
        float _1788 = _1768 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        _1784 = _1790;
    }
    float _1792 = _1784;
    float _1794 = -_1720;
    float _1796 = -_1782;
    float _1798 = fma(_1700, _1794, _1796);
    if (_1734)
    {
        float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1748 = _1800;
    }
    float _1802 = _1748;
    float _1804 = _1778;
    float _1806 = _1802;
    if (_1734)
    {
        float _1808 = fma(_1778, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1810;
    if (!_1734)
    {
        _1806 = _1724;
    }
    float _1814 = _1806;
    float _1816 = _1814;
    float _1818 = _1792;
    if (_1734)
    {
        float _1820 = _1792 + (-1.0);
        _1786 = _1820;
    }
    float _1822 = _1786;
    if (_1734)
    {
        float _1824 = _1758 * _1810;
        _202 = _1824;
    }
    float _1826 = _202;
    if (!_1734)
    {
        _1812 = _1798;
    }
    float _1828 = _1812;
    float _1830 = _1828;
    if (_1734)
    {
        float _1832 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1832;
    }
    float _1834 = _1772;
    if (_1734)
    {
        float _1836 = _1722 * _1826;
        _1750 = _1836;
    }
    float _1838 = _1750;
    float _1840 = sqrt(_1716);
    if (!_1734)
    {
        _1760 = _1726;
    }
    float _1842 = _1760;
    float _1844 = _1842;
    if (_1734)
    {
        float _1846 = fma(_1798, _1792, _1834);
        _1830 = _1846;
    }
    float _1848 = _1830;
    if (_1734)
    {
        float _1850 = _1724 * _1826;
        _1816 = _1850;
    }
    float _1852 = _1816;
    if (_1734)
    {
        float _1854 = _1838 * _1838;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (!_1734)
    {
        _1818 = _1728;
    }
    float _1858 = _1818;
    float _1860 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1862 = _1858;
    if (_1734)
    {
        float _1864 = _1852 * _1852;
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = fma(_1848, _1848, _1856);
    float _1870 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1860);
    float _1872 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = _1868 + _1866;
    float _1876 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = rsqrt(_1874);
    float _1888 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1890 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1894 = -_1884;
    float _1896 = _1894 + 1.0;
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1902 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1904 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1878);
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1908 = abs(_1896);
    float _1910 = log2(_1908);
    float _1912 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1900);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1916 = -_1906;
    float _1918 = fma(_1916, _1714, 1.0);
    float _1920 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1922 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1886 * _1838;
    float _1928 = _1886 * _1848;
    float _1930 = _1886 * _1852;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1936 = log2(_1918);
    float _1938 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1940 = -_1934;
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1940);
    float _1944 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1948 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1938);
    float _1950 = -_1930;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1942);
    float _1954 = exp2(_1944);
    float _1956 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1958 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1946);
    float _1960 = fma(_1952, -0.5, 0.5);
    float _1962 = fma(_1952, 0.5, 0.5);
    float _1964 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1956);
    float _1966 = _1928 + 1.0;
    float _1968 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1958);
    float _1970 = 1.0 / _1948;
    float _1972 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1964);
    float _1974 = fma(_1962, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1976 = fma(_1962, _1974, -0.212114393711090087890625);
    float _1978 = sqrt(_1960);
    float _1980 = -_1928;
    float _1982 = fma(_1954, _1966, _1980);
    float _1984 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1986 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1988 = _1936 * 0.693147182464599609375;
    float _1990 = fma(_1962, _1976, 1.570728778839111328125);
    float _1992 = fma(_1982, 0.5, 0.5);
    float _1994 = _1984 * _1970;
    float _1996 = _1986 * _1970;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_1996, -0.5, 0.5);
    float _2004 = _1978 * 0.636619746685028076171875;
    float _2006 = -_1990;
    float _2008 = fma(_2004, _2006, 1.0);
    float3 _5662 = float3(_2000, _2002, _1998);
    float _2010 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5662, float3(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5662, float3(0.0), isnan(_5662)), level(0.0)).x;
    float3 _5673 = float3(_2000, _2002, _1998);
    float4 _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5673, float3(0.0), isnan(_5673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5673, float3(0.0), isnan(_5673)), level(0.0)).xyzw;
    float _2015 = _2013.x;
    float _2017 = _2013.y;
    float _2019 = _2013.z;
    float _2021 = _2013.w;
    float2 _5689 = float2(_2008, _1992);
    float3 _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5689, float2(0.0), isnan(_5689)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5689, float2(0.0), isnan(_5689)), level(0.0)).xyz;
    float _2025 = _2023.x;
    float _2027 = _2023.y;
    float _2029 = _2023.z;
    float _2031 = _842 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2033 = -_962;
    float _2035 = _2033 + 1.0;
    out.m_87.x = _1692;
    out.m_87.y = _1690;
    out.m_87.z = _1694;
    bool _2037 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2039 = isnan(_1840);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2045 = _2041 || _2043;
    float _2047 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2031);
    float _2049 = _842 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2051 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2047);
    float _2053 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2049);
    float _2055 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2057 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2053);
    float _2059 = 1.0 / _2055;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2063 = _2061 + _2055;
    float _2065 = _2063 * _2059;
    float _2067 = _2065 * 0.5;
    float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2071 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2069);
    float _2073 = 1.0 / _2071;
    float _2075 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2077 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2079 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2075);
    float _2081 = _1984 + _1948;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2085 = _2073 * _2083;
    float _2087 = exp2(_2077);
    float _2089 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2079);
    float _2091 = _2081 * 0.5;
    float _2093 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2095 = abs(_2085);
    float _2097 = log2(_2095);
    float _2099 = _2093 + _1948;
    out.gl_Position.x = _1984;
    out.gl_Position.y = _1986;
    out.gl_Position.z = _2093;
    out.gl_Position.w = _1948;
    float _2101 = _2099 * 0.5;
    bool _2103 = _2085 <= 8000.0;
    bool _2105 = isnan(_2085);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan(8000.0);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2117 = _2093;
    float _2119 = _1984;
    float _2121 = _1948;
    float _2123 = _1986;
    float _2125 = _2021;
    float _2127 = _2019;
    if (!_2045)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2129 = _2117;
    float _2131 = _2129;
    float _2133 = _2129;
    if (!_2045)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2135 = _2119;
    float _2137 = exp2(_2115);
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2141 = precise::clamp(_2139, 0.0, 1.0);
    float _2143 = -_2087;
    float _2145 = _2143 + 1.0;
    float _2147 = fma(_2141, -2.0, 3.0);
    float _2149 = _2141 * _2141;
    float _2151 = in.m_89.x;
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2155 = _2149 * _2147;
    float _2157 = -_2155;
    float _2159 = _2157 + 1.0;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2155);
    float _2163 = _2113 * _2161;
    float _2165 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2167 = _2035 * _2165;
    float _2169 = precise::clamp(_2167, 0.0, 1.0);
    float _2171 = -_2169;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2175 = _2173 * _2151;
    float _2177 = _1948 * 0.5;
    float _2179 = _2135;
    float _2181 = _2135;
    if (!_2045)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2183 = _2121;
    float _2185 = _2175 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2187 = fma(_1986, -0.5, _2177);
    float _2189 = _2183;
    float _2191 = _2183;
    if (!_2045)
    {
        _2123 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2193 = _2123;
    out.m_91.x = _2185;
    out.m_93.x = _2091;
    out.m_93.y = _2187;
    out.m_93.z = _2101;
    out.m_93.w = _1948;
    float _2195 = _2153 * _2010;
    float _2197 = -_2153;
    float _2199 = _2197 + 1.0;
    float _2201 = _2021 * _2195;
    float _2203 = _2029 * _2195;
    float _2205 = _2021 * _2199;
    float _2207 = fma(_2025, _2201, _2015);
    float _2209 = fma(_2027, _2201, _2017);
    float _2211 = fma(_2021, _2203, _2019);
    float _2213 = _2193;
    float _2215 = _2193;
    if (!_2045)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2217 = _2125;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2045)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2223 = _2127;
    out.m_95.x = _2207;
    out.m_95.y = _2209;
    out.m_95.z = _2211;
    out.m_95.w = _2205;
    bool _2225 = !_2045;
    float _2227 = _2223;
    float _2229 = _2223;
    if (!_2225)
    {
        bool _2231 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2233 = isnan(_1840);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2243 = _1840 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2247 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2245;
            float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2253 = 1.0 / _2247;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2271 = _2243 * _2253;
            float _2273 = precise::clamp(_2271, 0.0, 1.0);
            float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2279 = fma(_2273, _2251, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2281 = fma(_2273, _2277, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2283 = fma(_2273, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2285 = fma(_2273, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2287 = fma(_2273, _2265, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2289 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2229 = _2283;
            _2215 = _2287;
            _2221 = _2279;
            _2133 = _2285;
            _2191 = _2281;
            _2181 = _2289;
            _2291 = true;
        }
        else
        {
            bool _2293 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2295 = isnan(_1840);
            bool _2297 = _2293 || _2295;
            bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2301 = _2297 || _2299;
            if (!_2301)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2303 = _2219;
            _2221 = _2303;
            if (!_2301)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2305 = _2227;
            _2229 = _2305;
            if (!_2301)
            {
                _2189 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2307 = _2189;
            _2191 = _2307;
            if (!_2301)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2309 = _2131;
            _2133 = _2309;
            if (!_2301)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2311 = _2213;
            _2215 = _2311;
            if (!_2301)
            {
                _2179 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2313 = _2179;
            bool _2315 = !_2301;
            _2181 = _2313;
            if (!_2315)
            {
                bool _2317 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1840);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1840 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2339 = 1.0 / _2333;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2357 = _2329 * _2339;
                    float _2359 = precise::clamp(_2357, 0.0, 1.0);
                    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2365 = fma(_2359, _2337, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2229 = _2369;
                    _2215 = _2373;
                    _2221 = _2365;
                    _2133 = _2371;
                    _2191 = _2367;
                    _2181 = _2375;
                    _2291 = true;
                }
                else
                {
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2191 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2181 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2291 = false;
    float _2377 = _2229;
    float _2379 = _2215;
    float _2381 = _2221;
    float _2383 = _2133;
    float _2385 = _2191;
    float _2387 = _2181;
    float _2389 = fma(_1486, -0.5, 0.5);
    float _2391 = precise::clamp(_2389, 0.0, 1.0);
    float _2393 = -_2377;
    float _2395 = _2393 + _2379;
    float _2397 = -_2381;
    float _2399 = _2397 + _2383;
    float _2401 = -_2385;
    float _2403 = _2401 + _2387;
    bool _2405 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2407 = fma(_2391, _2395, _2377);
    float _2409 = fma(_2391, _2399, _2381);
    float _2411 = fma(_2391, _2403, _2385);
    float _2413 = _2407 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2415 = fma(_2409, 0.298911988735198974609375, _2413);
    float _2417 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2419 = fma(_2411, 0.114477999508380889892578125, _2415);
    out.m_53.x = _2417;
    float _2421 = -_2419;
    float _2423 = _2409 + _2421;
    float _2425 = -_2419;
    float _2427 = _2407 + _2425;
    float _2429 = -_2419;
    float _2431 = _2411 + _2429;
    float _2433 = fma(_2423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    float _2435 = fma(_2427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    float _2437 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    out.m_99.x = _2433;
    out.m_99.y = _2435;
    out.m_99.z = _2437;
    if (!_2405)
    {
        return out;
    }
    float _2439 = -_1690;
    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2443 = -_1692;
    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2447 = -_1694;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2451 = _2441 * _2441;
    float _2453 = fma(_2445, _2445, _2451);
    float _2455 = fma(_2449, _2449, _2453);
    float _2457 = sqrt(_2455);
    float _2459 = rsqrt(_2455);
    float _2461 = -_2457;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2465 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2467 = precise::clamp(_2465, 0.0, 1.0);
    float _2469 = _2445 * _2459;
    float _2471 = _2441 * _2459;
    float _2473 = abs(_2467);
    float _2475 = log2(_2473);
    float _2477 = _2449 * _2459;
    float _2479 = _2469 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2481 = _1486 * _2471;
    float _2483 = -_2471;
    float _2485 = -_2479;
    float _2487 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2485);
    float _2489 = fma(_1470, _2469, _2481);
    float _2491 = -_2477;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2487);
    float _2495 = fma(_1488, _2477, _2489);
    float _2497 = precise::clamp(_2495, 0.0, 1.0);
    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2501 = _2493 + _2499;
    float _2503 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2505 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = exp2(_2503);
    float _2511 = _2509 * _2507;
    float _2513 = _2497 * _2511;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2517 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2519 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2515;
    out.m_97.y = _2517;
    out.m_97.z = _2519;
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
    out.dm_pad4 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2291 = false;
    bool _1538 = false;
    bool _404 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2576 = as_type<float>(_134);
        out.gl_Position.z = _2576;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_55.w;
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
        out.m_53.x = 0.0;
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
        float _2645 = as_type<float>(_172);
        out.gl_Position.z = _2645;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _196;
    float _220;
    if (!_200)
    {
        float _204 = in.m_59.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _152);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _152 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _234 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _232;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _238 = 1.0 / _234;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _242 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _244 = _236 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _248 = _246 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _250 = _240 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = _230 + _252;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _258 = _242 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _260 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _262 = isnan(_230);
    bool _264 = _260 || _262;
    bool _266 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _268 = _264 || _266;
    float _270 = float(_268);
    float _272 = 1.0 / _248;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _230 + _274;
    out.m_61.x = _250;
    out.m_61.y = _244;
    out.m_61.z = _258;
    out.m_61.w = _256;
    float _278 = -_270;
    float _280 = _278 + 1.0;
    float _282 = _254 * _238;
    bool _284 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _286 = isnan(_230);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_230);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    bool _308 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _310 = _276 * _272;
    float _312 = _306 * _280;
    float _314 = -_306;
    float _316 = _314 + 1.0;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _322;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _326;
    float _330 = _294 * _316;
    float _332 = fma(_320, _282, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _334 = fma(_324, _282, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _336 = fma(_328, _282, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _338 = -_294;
    float _340 = _338 + 1.0;
    float _342 = _332 * _330;
    float _344 = _334 * _330;
    float _346 = _336 * _330;
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _350 = _348 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _354 = _352 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _360 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].x, _342);
    float _362 = fma(_350, _310, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _364 = fma(_354, _310, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _366 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].y, _344);
    float _368 = fma(_358, _310, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _370 = fma(_340, (*spvDescriptorSet0.vp_c9)._m0[143].z, _346);
    float _372 = fma(_362, _312, _360);
    float _374 = fma(_364, _312, _366);
    float _376 = fma(_368, _312, _370);
    float _378 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].x, _372);
    float _380 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].y, _374);
    float _382 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[145].z, _376);
    bool _384 = !_308;
    float _402;
    if (!_384)
    {
        float _386 = in.m_59.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].w, _152);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        float _406 = float(_118);
        float _408 = 1.0 / _406;
        float _410 = _152 * _408;
        _402 = _410;
    }
    _404 = false;
    float _412 = _402;
    float _414 = in.m_59.z;
    float _416 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _418 = log2(_416);
    float _420 = in.m_59.x;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _424 = _422 != 0;
    int _426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _428 = _426 != 0;
    int _430 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _432 = _430 != 0;
    float _434 = in.m_59.y;
    bool _436 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _438 = isnan(1.0);
    bool _440 = _436 || _438;
    bool _442 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _444 = _440 || _442;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _448 = 1.0 + _446;
    bool _450 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _458 = _454 || _456;
    float _460 = _418 * _152;
    float _462 = 1.0 / _448;
    float _464 = _414 * 2.0;
    float _466 = _420 * 2.0;
    float _468 = exp2(_460);
    float _470 = _434 * 2.0;
    float _472 = floor(_464);
    float _474 = _420 + _434;
    float _476 = _474 + (-1.0);
    float _478 = floor(_466);
    float _480 = -_468;
    float _482 = _480 + 1.0;
    float _484 = _458 ? _482 : 0.0;
    bool _486 = _472 > 0.0;
    float _488 = floor(_470);
    bool _490 = _472 >= 0.0;
    bool _492 = isnan(_472);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = _434 + _414;
    if (_444)
    {
        float _502 = _484 * _462;
        _156 = _502;
    }
    float _504 = _156;
    bool _506 = !_432;
    int _508 = _506 ? 0 : 1;
    float _510 = _500 + (-1.0);
    int _512 = _498 ? 0 : 1;
    bool _514 = _478 > 0.0;
    float _516 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _518 = fma(_476, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _520 = !_424;
    int _522 = _520 ? 0 : 1;
    bool _524 = _478 >= 0.0;
    bool _526 = isnan(_478);
    bool _528 = _524 || _526;
    bool _530 = isnan(0.0);
    bool _532 = _528 || _530;
    float _534 = in.m_63.x;
    float _536 = in.m_63.y;
    float _538 = in.m_63.z;
    int _540 = ~_512;
    int _542 = _540 + 1;
    int _544 = _542 + 1;
    int _546 = _544;
    if (!_486)
    {
        int _548 = ~_512;
        int _550 = _548 + 1;
        _546 = _550;
    }
    int _552 = _546;
    int _554 = abs(_522);
    float _556 = float(_552);
    float _558 = float(_554);
    int _560 = _532 ? 0 : 1;
    bool _562 = !_428;
    int _564 = _562 ? 0 : 1;
    float _566 = _558 * _556;
    int _568 = ~_560;
    int _570 = _568 + 1;
    int _572 = _570 + 1;
    float _574 = _420 + (-0.5);
    int _576 = abs(_564);
    int _578 = _572;
    if (!_514)
    {
        int _580 = ~_560;
        int _582 = _580 + 1;
        _578 = _582;
    }
    int _584 = _578;
    bool _586 = _488 > 0.0;
    bool _588 = _488 >= 0.0;
    bool _590 = isnan(_488);
    bool _592 = _588 || _590;
    bool _594 = isnan(0.0);
    bool _596 = _592 || _594;
    float _598 = _566 * (-2.0);
    float _600 = float(_576);
    float _602 = float(_584);
    float _604 = fma(_598, _534, _534);
    int _606 = _596 ? 0 : 1;
    float _608 = fma(_518, _598, _518);
    int _610 = abs(_508);
    float _612 = _600 * _602;
    int _614 = ~_606;
    int _616 = _614 + 1;
    int _618 = _616 + 1;
    float _620 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[196].x, _604);
    int _622 = _618;
    if (!_586)
    {
        int _624 = ~_606;
        int _626 = _624 + 1;
        _622 = _626;
    }
    int _628 = _622;
    float _630 = _612 * (-2.0);
    float _632 = _434 + (-0.5);
    float _634 = float(_610);
    float _636 = fma(_608, _504, _620);
    float _638 = fma(_630, _536, _536);
    float _640 = float(_628);
    float _642 = fma(_516, _630, _516);
    float _644 = _420 + _414;
    float _646 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[196].y, _638);
    float _648 = _636 * 0.15915493667125701904296875;
    float _650 = _634 * _640;
    float _652 = _644 + (-1.0);
    float _654 = fma(_642, _504, _646);
    float _656 = in.m_65.x;
    float _658 = in.m_65.y;
    float _660 = in.m_65.z;
    float _662 = _650 * (-2.0);
    float _664 = _654 * 0.15915493667125701904296875;
    float _666 = _648 * 6.283185482025146484375;
    float _668 = sin(_666);
    float _670 = in.m_67.x;
    float _672 = in.m_67.y;
    float _674 = in.m_67.z;
    float _676 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _678 = fma(_662, _538, _538);
    float _680 = _414 + (-0.5);
    float _682 = fma(_676, _662, _676);
    float _684 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[196].z, _678);
    float _686 = _648 * 6.283185482025146484375;
    float _688 = cos(_686);
    float _690 = fma(_682, _504, _684);
    float _692 = _690 * 0.15915493667125701904296875;
    float _694 = _664 * 6.283185482025146484375;
    float _696 = sin(_694);
    float _698 = _382 * _660;
    float _700 = _380 * _658;
    float _702 = _378 * _656;
    float _704 = _664 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _670);
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _672);
    float _712 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _714 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _716 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _674);
    float _720 = _710 * _712;
    float _722 = _692 * 6.283185482025146484375;
    float _724 = cos(_722);
    float _726 = _708 * _714;
    float _728 = _718 * _716;
    float _730 = in.m_50.x;
    float _732 = in.m_50.y;
    float _734 = in.m_50.z;
    float _736 = _668 * _696;
    float _738 = _688 * _696;
    float _740 = _692 * 6.283185482025146484375;
    float _742 = sin(_740);
    float _744 = _688 * _706;
    float _746 = _688 * _724;
    float _748 = _668 * _706;
    float _750 = _668 * _724;
    float _752 = _706 * _724;
    float _754 = _746 * _720;
    float _756 = _696 * _724;
    float _758 = fma(_742, _744, _736);
    float _760 = -_720;
    float _762 = _742 * _760;
    float _764 = _750 * _720;
    float _766 = -_738;
    float _768 = fma(_742, _748, _766);
    float _770 = -_748;
    float _772 = fma(_742, _738, _770);
    float _774 = fma(_758, _726, _754);
    float _776 = fma(_742, _736, _744);
    float _778 = fma(_752, _726, _762);
    float _780 = fma(_768, _726, _764);
    float _782 = fma(_772, _728, _774);
    float _784 = _732 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _786 = fma(_756, _728, _778);
    float _788 = fma(_776, _728, _780);
    float _790 = _732 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _792 = _782 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _794 = _782 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _796 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[6].x, _784);
    float _798 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[4].x, _790);
    float _800 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[24].x, _792);
    float _802 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[26].x, _794);
    float _804 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[6].z, _796);
    float _806 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[4].z, _798);
    float _808 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[24].z, _800);
    float _810 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[26].z, _802);
    float _812 = _804 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _814 = _806 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _816 = _808 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _818 = _810 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _820 = _732 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _822 = _814 + _816;
    float _824 = _812 + _818;
    float _826 = fma(_730, (*spvDescriptorSet0.vp_c10)._m0[5].x, _820);
    float _828 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _830 = _822 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _834 = _824 + _832;
    float _836 = fma(_734, (*spvDescriptorSet0.vp_c10)._m0[5].z, _826);
    float _838 = _830 * _830;
    float _840 = _834 * _834;
    float _842 = _836 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _844 = _838 + _840;
    float _846 = sqrt(_844);
    bool _848 = _846 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _852 = _846 + _850;
    float _854 = 0.0;
    float _856 = _782;
    float _858 = _836;
    float _860 = _822;
    float _862 = _824;
    float _864 = _838;
    float _866 = _840;
    if (_848)
    {
        float _868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _854 = _868;
    }
    float _870 = _854;
    float _872 = _870;
    if (_848)
    {
        float _874 = _852 * _870;
        _872 = _874;
    }
    float _876 = _872;
    float _878 = _782 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _880 = _876;
    if (_848)
    {
        float _882 = rsqrt(_844);
        _856 = _882;
    }
    float _884 = _856;
    if (_848)
    {
        float _886 = _876 * 0.15915493667125701904296875;
        _880 = _886;
    }
    float _888 = _880;
    float _890 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[25].x, _878);
    float _892 = fma(_788, (*spvDescriptorSet0.vp_c8)._m0[25].z, _890);
    float _894 = _730;
    if (_848)
    {
        float _896 = _888 * 6.283185482025146484375;
        float _898 = sin(_896);
        _894 = _898;
    }
    float _900 = _894;
    float _902 = fma(_814, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _904 = _892 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _906 = _842 + _904;
    float _908 = floor(_902);
    float _910 = fma(_812, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _912 = _906;
    if (_848)
    {
        float _914 = _906 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _858 = _914;
    }
    float _916 = _858;
    float _918 = _916;
    if (_848)
    {
        float _920 = fma(_900, _916, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _918 = _920;
    }
    float _922 = _918;
    float _924 = floor(_910);
    float _926 = _922;
    if (_848)
    {
        float _928 = _884 * _922;
        _926 = _928;
    }
    float _930 = _926;
    if (_848)
    {
        float _932 = fma(_830, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _860 = _932;
    }
    float _934 = _860;
    if (_848)
    {
        float _936 = fma(_834, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _862 = _936;
    }
    float _938 = _862;
    float _940 = -_908;
    float _942 = _902 + _940;
    float _944 = fma(_934, 6.2500002968590706586837768554688e-05, 0.5);
    float _946 = fma(_938, 6.2500002968590706586837768554688e-05, 0.5);
    float _948 = -_924;
    float _950 = _910 + _948;
    float2 _3870 = float2(_944, _946);
    float3 _954 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3870, float2(0.0), isnan(_3870)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3870, float2(0.0), isnan(_3870)), level(0.0)).xyz;
    float _956 = _954.x;
    float _958 = _954.y;
    float _960 = _954.z;
    float2 _3886 = float2(_942, _950);
    float _962 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3886, float2(0.0), isnan(_3886)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3886, float2(0.0), isnan(_3886)), level(0.0)).x;
    float _964 = in.m_69.y;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _968 = in.m_59.w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _972 = _970 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _974 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _976 = _974 != 0;
    float _978 = in.m_69.x;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _982 = _980 != 0;
    float _984 = 1.0 / _972;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _990 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _992 = _990 != 0;
    bool _994 = _434 > 0.5;
    float _996 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _998 = _996 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1000 = 1.0 / _988;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1004 = _1002 != 0;
    float _1006 = -_964;
    float _1008 = _1006 + 1.0;
    float _1010 = 1.0 / _998;
    bool _1012 = _968 > 0.5;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1014;
    bool _1018 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1020 = isnan(_412);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    int _1030 = _1012 ? as_type<int>(_1008) : as_type<int>(_964);
    int _1032 = 0;
    bool _1034 = _1012;
    bool _1036 = _1004;
    float _1038 = _964;
    float _1040 = _978;
    if (_982)
    {
        float _1042 = -_978;
        float _1044 = _1042 + 1.0;
        _1032 = as_type<int>(_1044);
    }
    int _1046 = _1032;
    if (_976)
    {
        bool _1048 = _420 > 0.5;
        _1034 = _1048;
    }
    bool _1050 = _1034;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1054 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1052;
    float _1056 = _1004 ? as_type<float>(_1030) : _964;
    float _1058 = _1016 * _1000;
    if (_982)
    {
        bool _1060 = _414 > 0.5;
        _1036 = _1060;
    }
    bool _1062 = _1036;
    float _1064 = _1054 * _984;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1068 = _412 + _1066;
    if (_992)
    {
        float _1070 = _994 ? _1008 : _964;
        _1038 = _1070;
    }
    float _1072 = _1038;
    float _1074 = -_1028;
    float _1076 = _1074 + 1.0;
    bool _1078 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1080 = isnan(_412);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = fma(_1064, _1068, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1092 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1094 = isnan(_412);
    bool _1096 = _1092 || _1094;
    bool _1098 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1100 = _1096 || _1098;
    float _1102 = float(_1100);
    float _1104 = in.m_71.x;
    float _1106 = in.m_71.y;
    float _1108 = in.m_71.z;
    float _1110 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1112 = _1110 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1114 = _1088 * _1076;
    float _1116 = -_1088;
    float _1118 = _1116 + 1.0;
    bool _1120 = _412 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1122 = isnan(_412);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1128 = _1124 || _1126;
    float _1130 = float(_1128);
    float _1132 = -_1102;
    float _1134 = _1132 + 1.0;
    bool _1136 = _672 != 0.0;
    bool _1138 = isnan(_672);
    bool _1140 = _1136 || _1138;
    bool _1142 = isnan(0.0);
    bool _1144 = _1140 || _1142;
    float _1146 = _1102 * _1118;
    float _1148 = _1112 * _1010;
    float _1150 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1152 = _412 + _1150;
    float _1154 = _1130 * _1134;
    bool _1156 = _670 == 0.0;
    bool _1158 = !_1144;
    bool _1160 = _1156 && _1158;
    float _1162 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1164 = fma(_1148, _1152, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1166 = _1090 * _1154;
    bool _1168 = _674 == 0.0;
    bool _1170 = _1168 && _1160;
    float _1172 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1174 = _412 + _1172;
    int _1176 = as_type<int>(_1148);
    float _1178 = _1166;
    if (_976)
    {
        float _1180 = -_978;
        float _1182 = _1180 + 1.0;
        _1176 = as_type<int>(_1182);
    }
    int _1184 = _1176;
    float _1186 = 0.0;
    if (!_976)
    {
        _1186 = _978;
    }
    float _1188 = _1186;
    float _1190 = -_1130;
    float _1192 = _1190 + 1.0;
    float _1194 = fma(_1058, _1174, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1198 = _1188;
    float _1200 = _1192;
    if (_976)
    {
        float _1202 = _1050 ? as_type<float>(_1184) : _978;
        _1198 = _1202;
    }
    float _1204 = _1198;
    float _1206 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1166);
    float _1208 = in.m_73.x;
    float _1210 = in.m_73.y;
    float _1212 = in.m_73.z;
    float _1214 = in.m_73.w;
    if (_982)
    {
        float _1216 = _1062 ? as_type<float>(_1046) : _978;
        _1040 = _1216;
    }
    float _1218 = _1040;
    float _1220 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1222 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1224 = 0.0;
    float _1226 = _1104;
    if (_1170)
    {
        _1224 = _1104;
    }
    float _1228 = _1224;
    float _1230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1232 = _1218 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1234 = _1228;
    if (_1170)
    {
        _1200 = _1108;
    }
    float _1236 = _1200;
    float _1238 = fma(_1164, _1146, _1206);
    float _1240 = _1236;
    if (_1170)
    {
        _1178 = _1228;
    }
    float _1242 = _1178;
    float _1244 = _1242;
    if (!_1170)
    {
        float _1246 = fma(_674, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1108);
        _1240 = _1246;
    }
    float _1248 = _1240;
    if (!_1170)
    {
        _1234 = _1104;
    }
    float _1250 = _1234;
    float _1252 = _746 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (_1170)
    {
        _1226 = _1106;
    }
    float _1254 = _1226;
    float _1256 = _1254;
    if (!_1170)
    {
        float _1258 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1106);
        _1256 = _1258;
    }
    float _1260 = _1256;
    float _1262 = fma(_1194, _1114, _1238);
    if (!_1170)
    {
        float _1264 = fma(_670, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1250);
        _1244 = _1264;
    }
    float _1266 = _1244;
    float _1268 = _1072 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1270 = _1220 * _966;
    float _1272 = _888;
    if (_848)
    {
        float _1274 = _888 * 6.283185482025146484375;
        float _1276 = cos(_1274);
        _1272 = _1276;
    }
    float _1278 = _1272;
    float _1280 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1262);
    float _1282 = _1268 * _1162;
    float _1284 = _1222 * _1196;
    float _1286 = _1232 * _1230;
    float _1288 = _1212 * _1250;
    float _1290 = _1210 * _1108;
    float _1292 = _1208 * _1106;
    float _1294 = _746 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1296 = -_1288;
    float _1298 = fma(_1208, _1108, _1296);
    float _1300 = -_1290;
    float _1302 = fma(_1212, _1106, _1300);
    float _1304 = -_1292;
    float _1306 = fma(_1210, _1250, _1304);
    out.m_75.x = _1284;
    out.m_75.y = _1282;
    out.m_75.z = _1286;
    out.m_75.w = _1270;
    float _1308 = _1298 * _1214;
    float _1310 = _1302 * _1214;
    float _1312 = _1306 * _1214;
    float _1314 = _758 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1316 = _758 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1318 = _746 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1320 = _758 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1322 = -_742;
    float _1324 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1294);
    float _1326 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1314);
    float _1328 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1316);
    float _1330 = -_742;
    float _1332 = fma(_1330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1318);
    float _1334 = fma(_752, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1320);
    float _1336 = _772 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1338 = -_742;
    float _1340 = fma(_1338, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1252);
    float _1342 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1324);
    float _1344 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1326);
    float _1346 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1332);
    float _1348 = fma(_750, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1340);
    float _1350 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1328);
    float _1352 = fma(_768, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1334);
    float _1354 = _1342 * _1210;
    float _1356 = _1348 * _1260;
    float _1358 = _1342 * _1260;
    float _1360 = _1308 * _1342;
    float _1362 = _772 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1364 = fma(_1344, _1266, _1356);
    float _1366 = _1356;
    float _1368 = _1358;
    float _1370 = _1208;
    float _1372 = _1312;
    if (_848)
    {
        float _1374 = _1278 + (-1.0);
        _1366 = _1374;
    }
    float _1376 = _1366;
    float _1378 = _772 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1380 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1336);
    float _1382 = _1348 * _1210;
    float _1384 = _1376;
    if (_848)
    {
        float _1386 = _1376 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = _1346 * _1210;
    float _1392 = _1308 * _1348;
    float _1394 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1362);
    float _1396 = fma(_1350, _1266, _1358);
    if (_848)
    {
        float _1398 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1400 = _934 + _1398;
        _1368 = _1400;
    }
    float _1402 = _1368;
    if (_848)
    {
        float _1404 = fma(_906, _1278, _1388);
        _912 = _1404;
    }
    float _1406 = _912;
    float _1408 = _1346 * _1260;
    float _1410 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1378);
    float _1412 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1380);
    float _1414 = fma(_1344, _1208, _1382);
    float _1416 = fma(_1310, _1344, _1392);
    float _1418 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1394);
    float _1420 = fma(_1350, _1208, _1354);
    float _1422 = fma(_1352, _1208, _1390);
    if (_848)
    {
        float _1424 = _1402 * _1402;
        _864 = _1424;
    }
    float _1426 = _864;
    if (_848)
    {
        float _1428 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1430 = _938 + _1428;
        _1370 = _1430;
    }
    float _1432 = _1370;
    float _1434 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1436 = _1406 + _1434;
    float _1438 = _1308 * _1346;
    float _1440 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1410);
    if (_848)
    {
        float _1442 = _1432 * _1432;
        _866 = _1442;
    }
    float _1444 = _866;
    float _1446 = fma(_1436, _1436, _1426);
    float _1448 = fma(_1310, _1350, _1360);
    float _1450 = fma(_1310, _1352, _1438);
    float _1452 = _1446 + _1444;
    float _1454 = fma(_1412, _1212, _1414);
    float _1456 = fma(_1418, _1212, _1420);
    float _1458 = fma(_1440, _1212, _1422);
    float _1460 = sqrt(_1452);
    float _1462 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1464 = fma(_1352, _1266, _1408);
    float _1466 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1468 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1470 = fma(_1412, _1248, _1364);
    float _1472 = fma(_1312, _1412, _1416);
    float _1474 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1476 = _1466 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1478 = _1468 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1480 = _1280 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1482 = fma(_1312, _1418, _1448);
    float _1484 = fma(_1312, _1440, _1450);
    float _1486 = fma(_1418, _1248, _1396);
    float _1488 = fma(_1440, _1248, _1464);
    out.m_77.x = _1474;
    out.m_77.y = _1476;
    out.m_77.z = _1478;
    out.m_77.w = _1480;
    bool _1490 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1492 = isnan(_1460);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1498 = _1494 || _1496;
    out.m_79.x = _1454;
    out.m_79.y = _1456;
    out.m_79.z = _1458;
    out.m_81.x = _1472;
    out.m_81.y = _1482;
    out.m_81.z = _1484;
    out.m_83.x = _1470;
    out.m_83.y = _1486;
    out.m_83.z = _1488;
    if (!_1498)
    {
        _1372 = 1.0;
    }
    float _1500 = _1372;
    out.m_85.x = _956;
    out.m_85.y = _958;
    out.m_85.z = _960;
    bool _1502 = !_1498;
    float _1504 = _1500;
    float _1506 = _958;
    float _1508 = _960;
    if (!_1502)
    {
        bool _1510 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1512 = isnan(_1460);
        bool _1514 = _1510 || _1512;
        bool _1516 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1518 = _1514 || _1516;
        if (!_1518)
        {
            float _1520 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1522 = _1460 + _1520;
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1530 = _1528 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1532 = 1.0 / _1526;
            float _1534 = _1522 * _1532;
            float _1536 = fma(_1534, _1530, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1504 = _1536;
            _1506 = _1532;
            _1538 = true;
        }
        else
        {
            bool _1540 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1542 = isnan(_1460);
            bool _1544 = _1540 || _1542;
            bool _1546 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1548 = _1544 || _1546;
            if (!_1548)
            {
                float _1550 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1552 = _1460 + _1550;
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1554 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1562 = 1.0 / _1556;
                float _1564 = _1552 * _1562;
                float _1566 = fma(_1564, _1560, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1504 = _1566;
                _1506 = _1562;
                _1538 = true;
            }
            else
            {
                _1504 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1538 = false;
    float _1568 = _1504;
    float _1570 = _1506;
    float _1572 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1574 = _1406 + _1572;
    float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1578 = _934 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1582 = _938 + _1580;
    float _1584 = fma(_1574, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1586 = fma(_1578, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1588 = fma(_1582, _1568, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1590 = -_842;
    float _1592 = _1590 + _1584;
    float _1594 = -_814;
    float _1596 = _1594 + _1586;
    float _1598 = -_812;
    float _1600 = _1598 + _1588;
    float _1602 = _1592 * _1592;
    float _1604 = fma(_1596, _1596, _1602);
    float _1606 = fma(_1600, _1600, _1604);
    float _1608 = sqrt(_1606);
    bool _1610 = _1608 > 0.0;
    float _1612 = _1608;
    float _1614 = _1570;
    float _1616 = _1592;
    if (!_1610)
    {
        _1612 = _1586;
    }
    float _1618 = _1612;
    float _1620 = _1618;
    if (!_1610)
    {
        _1614 = _1584;
    }
    float _1622 = _1614;
    float _1624 = _1622;
    if (!_1610)
    {
        _1508 = _1588;
    }
    float _1626 = _1508;
    bool _1628 = !_1610;
    float _1630 = _1626;
    float _1632 = _1626;
    if (!_1628)
    {
        float _1634 = _196 * _196;
        float _1636 = fma(_194, _194, _1634);
        float _1638 = fma(_198, _198, _1636);
        float _1640 = rsqrt(_1606);
        float _1642 = sqrt(_1638);
        float _1644 = _1596 * _1640;
        float _1646 = _1592 * _1640;
        float _1648 = _1600 * _1640;
        bool _1650 = _1642 > 0.0;
        float _1652 = _1640;
        float _1654 = _1642;
        _1616 = _1646;
        if (!_1650)
        {
            _1652 = _1586;
        }
        float _1656 = _1652;
        _1620 = _1656;
        if (!_1650)
        {
            _1654 = _1584;
        }
        float _1658 = _1654;
        _1624 = _1658;
        if (!_1650)
        {
            _1630 = _1588;
        }
        float _1660 = _1630;
        bool _1662 = !_1650;
        _1632 = _1660;
        if (!_1662)
        {
            float _1664 = rsqrt(_1638);
            float _1666 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1668 = _196 * _1664;
            float _1670 = _194 * _1664;
            float _1672 = _198 * _1664;
            float _1674 = _1646 * _1668;
            float _1676 = fma(_1644, _1670, _1674);
            float _1678 = _1666 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1680 = fma(_1648, _1672, _1676);
            float _1682 = _1680 * _1678;
            float _1684 = fma(_194, _1682, _1586);
            float _1686 = fma(_196, _1682, _1584);
            float _1688 = fma(_198, _1682, _1588);
            _1624 = _1686;
            _1620 = _1684;
            _1632 = _1688;
        }
    }
    float _1690 = _1624;
    float _1692 = _1620;
    float _1694 = _1632;
    float _1696 = _1616;
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1700 = _1690 + _1698;
    float _1702 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1704 = _1692 + _1702;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1708 = _1694 + _1706;
    float _1710 = _1700 * _1700;
    float _1712 = fma(_1704, _1704, _1710);
    float _1714 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1716 = fma(_1708, _1708, _1712);
    float _1718 = rsqrt(_1716);
    float _1720 = _1718 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1722 = _1704 * _1720;
    float _1724 = _1708 * _1720;
    float _1726 = _1722 * _1722;
    float _1728 = _1724 * _1724;
    float _1730 = _1726 + _1728;
    float _1732 = sqrt(_1730);
    bool _1734 = _1732 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1736 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1738 = _1732 + _1736;
    float _1740 = _1474;
    float _1742 = _1730;
    float _1744 = _1738;
    float _1746 = _1696;
    float _1748 = _1700;
    float _1750 = _1722;
    if (_1734)
    {
        float _1752 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1740 = _1752;
    }
    float _1754 = _1740;
    if (_1734)
    {
        float _1756 = rsqrt(_1730);
        _1742 = _1756;
    }
    float _1758 = _1742;
    float _1760 = _1758;
    if (_1734)
    {
        float _1762 = _1738 * _1754;
        _1744 = _1762;
    }
    float _1764 = _1744;
    if (_1734)
    {
        float _1766 = _1764 * 0.15915493667125701904296875;
        _1746 = _1766;
    }
    float _1768 = _1746;
    float _1770 = _1708;
    float _1772 = _1768;
    if (_1734)
    {
        float _1774 = _1768 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        _1770 = _1776;
    }
    float _1778 = _1770;
    float _1780 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1782 = precise::max(0.0, _1780);
    float _1784 = _1754;
    float _1786 = _1782;
    if (_1734)
    {
        float _1788 = _1768 * 6.283185482025146484375;
        float _1790 = cos(_1788);
        _1784 = _1790;
    }
    float _1792 = _1784;
    float _1794 = -_1720;
    float _1796 = -_1782;
    float _1798 = fma(_1700, _1794, _1796);
    if (_1734)
    {
        float _1800 = _1798 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1748 = _1800;
    }
    float _1802 = _1748;
    float _1804 = _1778;
    float _1806 = _1802;
    if (_1734)
    {
        float _1808 = fma(_1778, _1802, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1810;
    if (!_1734)
    {
        _1806 = _1724;
    }
    float _1814 = _1806;
    float _1816 = _1814;
    float _1818 = _1792;
    if (_1734)
    {
        float _1820 = _1792 + (-1.0);
        _1786 = _1820;
    }
    float _1822 = _1786;
    if (_1734)
    {
        float _1824 = _1758 * _1810;
        _202 = _1824;
    }
    float _1826 = _202;
    if (!_1734)
    {
        _1812 = _1798;
    }
    float _1828 = _1812;
    float _1830 = _1828;
    if (_1734)
    {
        float _1832 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1772 = _1832;
    }
    float _1834 = _1772;
    if (_1734)
    {
        float _1836 = _1722 * _1826;
        _1750 = _1836;
    }
    float _1838 = _1750;
    float _1840 = sqrt(_1716);
    if (!_1734)
    {
        _1760 = _1726;
    }
    float _1842 = _1760;
    float _1844 = _1842;
    if (_1734)
    {
        float _1846 = fma(_1798, _1792, _1834);
        _1830 = _1846;
    }
    float _1848 = _1830;
    if (_1734)
    {
        float _1850 = _1724 * _1826;
        _1816 = _1850;
    }
    float _1852 = _1816;
    if (_1734)
    {
        float _1854 = _1838 * _1838;
        _1844 = _1854;
    }
    float _1856 = _1844;
    if (!_1734)
    {
        _1818 = _1728;
    }
    float _1858 = _1818;
    float _1860 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1862 = _1858;
    if (_1734)
    {
        float _1864 = _1852 * _1852;
        _1862 = _1864;
    }
    float _1866 = _1862;
    float _1868 = fma(_1848, _1848, _1856);
    float _1870 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1860);
    float _1872 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1874 = _1868 + _1866;
    float _1876 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1878 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1872);
    float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1882 = fma(_1840, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1880);
    float _1884 = precise::clamp(_1882, 0.0, 1.0);
    float _1886 = rsqrt(_1874);
    float _1888 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1870);
    float _1890 = _1690 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1892 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1876);
    float _1894 = -_1884;
    float _1896 = _1894 + 1.0;
    float _1898 = _1888 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1900 = fma(_1692, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1890);
    float _1902 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1892);
    float _1904 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1878);
    float _1906 = _1898 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1908 = abs(_1896);
    float _1910 = log2(_1908);
    float _1912 = fma(_1694, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1900);
    float _1914 = _1902 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1916 = -_1906;
    float _1918 = fma(_1916, _1714, 1.0);
    float _1920 = _1904 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1922 = _1912 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1924 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1926 = _1886 * _1838;
    float _1928 = _1886 * _1848;
    float _1930 = _1886 * _1852;
    float _1932 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1924);
    float _1934 = _1926 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1936 = log2(_1918);
    float _1938 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1932);
    float _1940 = -_1934;
    float _1942 = fma(_1928, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1940);
    float _1944 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1946 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1948 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1938);
    float _1950 = -_1930;
    float _1952 = fma(_1950, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1942);
    float _1954 = exp2(_1944);
    float _1956 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1958 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1946);
    float _1960 = fma(_1952, -0.5, 0.5);
    float _1962 = fma(_1952, 0.5, 0.5);
    float _1964 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1956);
    float _1966 = _1928 + 1.0;
    float _1968 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1958);
    float _1970 = 1.0 / _1948;
    float _1972 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1964);
    float _1974 = fma(_1962, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1976 = fma(_1962, _1974, -0.212114393711090087890625);
    float _1978 = sqrt(_1960);
    float _1980 = -_1928;
    float _1982 = fma(_1954, _1966, _1980);
    float _1984 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1972);
    float _1986 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1968);
    float _1988 = _1936 * 0.693147182464599609375;
    float _1990 = fma(_1962, _1976, 1.570728778839111328125);
    float _1992 = fma(_1982, 0.5, 0.5);
    float _1994 = _1984 * _1970;
    float _1996 = _1986 * _1970;
    float _1998 = _1988 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2000 = fma(_1994, 0.5, 0.5);
    float _2002 = fma(_1996, -0.5, 0.5);
    float _2004 = _1978 * 0.636619746685028076171875;
    float _2006 = -_1990;
    float _2008 = fma(_2004, _2006, 1.0);
    float3 _5662 = float3(_2000, _2002, _1998);
    float _2010 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5662, float3(0.0), isnan(_5662)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5662, float3(0.0), isnan(_5662)), level(0.0)).x;
    float3 _5673 = float3(_2000, _2002, _1998);
    float4 _2013 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5673, float3(0.0), isnan(_5673)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5673, float3(0.0), isnan(_5673)), level(0.0)).xyzw;
    float _2015 = _2013.x;
    float _2017 = _2013.y;
    float _2019 = _2013.z;
    float _2021 = _2013.w;
    float2 _5689 = float2(_2008, _1992);
    float3 _2023 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5689, float2(0.0), isnan(_5689)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5689, float2(0.0), isnan(_5689)), level(0.0)).xyz;
    float _2025 = _2023.x;
    float _2027 = _2023.y;
    float _2029 = _2023.z;
    float _2031 = _842 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2033 = -_962;
    float _2035 = _2033 + 1.0;
    out.m_87.x = _1692;
    out.m_87.y = _1690;
    out.m_87.z = _1694;
    bool _2037 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2039 = isnan(_1840);
    bool _2041 = _2037 || _2039;
    bool _2043 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2045 = _2041 || _2043;
    float _2047 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2031);
    float _2049 = _842 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2051 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2047);
    float _2053 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2049);
    float _2055 = _2051 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2057 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2053);
    float _2059 = 1.0 / _2055;
    float _2061 = _2057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2063 = _2061 + _2055;
    float _2065 = _2063 * _2059;
    float _2067 = _2065 * 0.5;
    float _2069 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2071 = fma(_2067, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2069);
    float _2073 = 1.0 / _2071;
    float _2075 = _1914 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2077 = _1910 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2079 = fma(_1922, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2075);
    float _2081 = _1984 + _1948;
    float _2083 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2085 = _2073 * _2083;
    float _2087 = exp2(_2077);
    float _2089 = fma(_1898, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2079);
    float _2091 = _2081 * 0.5;
    float _2093 = fma(_1920, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2089);
    float _2095 = abs(_2085);
    float _2097 = log2(_2095);
    float _2099 = _2093 + _1948;
    out.gl_Position.x = _1984;
    out.gl_Position.y = _1986;
    out.gl_Position.z = _2093;
    out.gl_Position.w = _1948;
    float _2101 = _2099 * 0.5;
    bool _2103 = _2085 <= 8000.0;
    bool _2105 = isnan(_2085);
    bool _2107 = _2103 || _2105;
    bool _2109 = isnan(8000.0);
    bool _2111 = _2107 || _2109;
    float _2113 = float(_2111);
    float _2115 = _2097 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2117 = _2093;
    float _2119 = _1984;
    float _2121 = _1948;
    float _2123 = _1986;
    float _2125 = _2021;
    float _2127 = _2019;
    if (!_2045)
    {
        _2117 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2129 = _2117;
    float _2131 = _2129;
    float _2133 = _2129;
    if (!_2045)
    {
        _2119 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2135 = _2119;
    float _2137 = exp2(_2115);
    float _2139 = fma(_2137, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2141 = precise::clamp(_2139, 0.0, 1.0);
    float _2143 = -_2087;
    float _2145 = _2143 + 1.0;
    float _2147 = fma(_2141, -2.0, 3.0);
    float _2149 = _2141 * _2141;
    float _2151 = in.m_89.x;
    float _2153 = _2145 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2155 = _2149 * _2147;
    float _2157 = -_2155;
    float _2159 = _2157 + 1.0;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2155);
    float _2163 = _2113 * _2161;
    float _2165 = _2163 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2167 = _2035 * _2165;
    float _2169 = precise::clamp(_2167, 0.0, 1.0);
    float _2171 = -_2169;
    float _2173 = fma(_2171, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2175 = _2173 * _2151;
    float _2177 = _1948 * 0.5;
    float _2179 = _2135;
    float _2181 = _2135;
    if (!_2045)
    {
        _2121 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2183 = _2121;
    float _2185 = _2175 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2187 = fma(_1986, -0.5, _2177);
    float _2189 = _2183;
    float _2191 = _2183;
    if (!_2045)
    {
        _2123 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2193 = _2123;
    out.m_91.x = _2185;
    out.m_93.x = _2091;
    out.m_93.y = _2187;
    out.m_93.z = _2101;
    out.m_93.w = _1948;
    float _2195 = _2153 * _2010;
    float _2197 = -_2153;
    float _2199 = _2197 + 1.0;
    float _2201 = _2021 * _2195;
    float _2203 = _2029 * _2195;
    float _2205 = _2021 * _2199;
    float _2207 = fma(_2025, _2201, _2015);
    float _2209 = fma(_2027, _2201, _2017);
    float _2211 = fma(_2021, _2203, _2019);
    float _2213 = _2193;
    float _2215 = _2193;
    if (!_2045)
    {
        _2125 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2217 = _2125;
    float _2219 = _2217;
    float _2221 = _2217;
    if (!_2045)
    {
        _2127 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2223 = _2127;
    out.m_95.x = _2207;
    out.m_95.y = _2209;
    out.m_95.z = _2211;
    out.m_95.w = _2205;
    bool _2225 = !_2045;
    float _2227 = _2223;
    float _2229 = _2223;
    if (!_2225)
    {
        bool _2231 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2233 = isnan(_1840);
        bool _2235 = _2231 || _2233;
        bool _2237 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2239 = _2235 || _2237;
        if (!_2239)
        {
            float _2241 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2243 = _1840 + _2241;
            float _2245 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2247 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2245;
            float _2249 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2251 = _2249 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2253 = 1.0 / _2247;
            float _2255 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2257 = _2255 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2259 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2261 = _2259 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2265 = _2263 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2267 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2269 = _2267 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2271 = _2243 * _2253;
            float _2273 = precise::clamp(_2271, 0.0, 1.0);
            float _2275 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2277 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2279 = fma(_2273, _2251, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2281 = fma(_2273, _2277, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2283 = fma(_2273, _2257, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2285 = fma(_2273, _2261, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2287 = fma(_2273, _2265, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2289 = fma(_2273, _2269, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2229 = _2283;
            _2215 = _2287;
            _2221 = _2279;
            _2133 = _2285;
            _2191 = _2281;
            _2181 = _2289;
            _2291 = true;
        }
        else
        {
            bool _2293 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2295 = isnan(_1840);
            bool _2297 = _2293 || _2295;
            bool _2299 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2301 = _2297 || _2299;
            if (!_2301)
            {
                _2219 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2303 = _2219;
            _2221 = _2303;
            if (!_2301)
            {
                _2227 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2305 = _2227;
            _2229 = _2305;
            if (!_2301)
            {
                _2189 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2307 = _2189;
            _2191 = _2307;
            if (!_2301)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2309 = _2131;
            _2133 = _2309;
            if (!_2301)
            {
                _2213 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2311 = _2213;
            _2215 = _2311;
            if (!_2301)
            {
                _2179 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2313 = _2179;
            bool _2315 = !_2301;
            _2181 = _2313;
            if (!_2315)
            {
                bool _2317 = _1840 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2319 = isnan(_1840);
                bool _2321 = _2317 || _2319;
                bool _2323 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2325 = _2321 || _2323;
                if (!_2325)
                {
                    float _2327 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2329 = _1840 + _2327;
                    float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2333 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2331;
                    float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2337 = _2335 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2339 = 1.0 / _2333;
                    float _2341 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2343 = _2341 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2357 = _2329 * _2339;
                    float _2359 = precise::clamp(_2357, 0.0, 1.0);
                    float _2361 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2363 = _2361 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2365 = fma(_2359, _2337, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2367 = fma(_2359, _2363, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2369 = fma(_2359, _2343, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2371 = fma(_2359, _2347, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2373 = fma(_2359, _2351, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2375 = fma(_2359, _2355, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2229 = _2369;
                    _2215 = _2373;
                    _2221 = _2365;
                    _2133 = _2371;
                    _2191 = _2367;
                    _2181 = _2375;
                    _2291 = true;
                }
                else
                {
                    _2229 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2215 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2221 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2191 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2181 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2291 = false;
    float _2377 = _2229;
    float _2379 = _2215;
    float _2381 = _2221;
    float _2383 = _2133;
    float _2385 = _2191;
    float _2387 = _2181;
    float _2389 = fma(_1486, -0.5, 0.5);
    float _2391 = precise::clamp(_2389, 0.0, 1.0);
    float _2393 = -_2377;
    float _2395 = _2393 + _2379;
    float _2397 = -_2381;
    float _2399 = _2397 + _2383;
    float _2401 = -_2385;
    float _2403 = _2401 + _2387;
    bool _2405 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2407 = fma(_2391, _2395, _2377);
    float _2409 = fma(_2391, _2399, _2381);
    float _2411 = fma(_2391, _2403, _2385);
    float _2413 = _2407 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2415 = fma(_2409, 0.298911988735198974609375, _2413);
    float _2417 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2419 = fma(_2411, 0.114477999508380889892578125, _2415);
    out.m_53.x = _2417;
    float _2421 = -_2419;
    float _2423 = _2409 + _2421;
    float _2425 = -_2419;
    float _2427 = _2407 + _2425;
    float _2429 = -_2419;
    float _2431 = _2411 + _2429;
    float _2433 = fma(_2423, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    float _2435 = fma(_2427, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    float _2437 = fma(_2431, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2419);
    out.m_99.x = _2433;
    out.m_99.y = _2435;
    out.m_99.z = _2437;
    if (!_2405)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2439 = -_1690;
    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2443 = -_1692;
    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2447 = -_1694;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2451 = _2441 * _2441;
    float _2453 = fma(_2445, _2445, _2451);
    float _2455 = fma(_2449, _2449, _2453);
    float _2457 = sqrt(_2455);
    float _2459 = rsqrt(_2455);
    float _2461 = -_2457;
    float _2463 = _2461 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2465 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2467 = precise::clamp(_2465, 0.0, 1.0);
    float _2469 = _2445 * _2459;
    float _2471 = _2441 * _2459;
    float _2473 = abs(_2467);
    float _2475 = log2(_2473);
    float _2477 = _2449 * _2459;
    float _2479 = _2469 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2481 = _1486 * _2471;
    float _2483 = -_2471;
    float _2485 = -_2479;
    float _2487 = fma(_2483, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2485);
    float _2489 = fma(_1470, _2469, _2481);
    float _2491 = -_2477;
    float _2493 = fma(_2491, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2487);
    float _2495 = fma(_1488, _2477, _2489);
    float _2497 = precise::clamp(_2495, 0.0, 1.0);
    float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2501 = _2493 + _2499;
    float _2503 = _2475 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2505 = _2501 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2507 = precise::clamp(_2505, 0.0, 1.0);
    float _2509 = exp2(_2503);
    float _2511 = _2509 * _2507;
    float _2513 = _2497 * _2511;
    float _2515 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2517 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2519 = _2513 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2515;
    out.m_97.y = _2517;
    out.m_97.z = _2519;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.dm_pad4.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.dm_pad4.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.dm_pad4.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.dm_pad4.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

