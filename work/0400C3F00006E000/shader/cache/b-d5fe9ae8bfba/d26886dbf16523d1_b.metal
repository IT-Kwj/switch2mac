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
    texture2d<float> vp_t_tcb_A [[id(6)]];
    sampler vp_t_tcb_ASmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_ASmplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_85 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_77 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_65 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2507 = false;
    bool _718 = false;
    bool _598 = false;
    bool _464 = false;
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_120);
        out.gl_Position.z = _2793;
    }
    if (!_108)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _124 = in.m_51.w;
    float _126 = float(_104);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _130;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2857 = as_type<float>(_154);
        out.gl_Position.z = _2857;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_53.w;
    float _158 = 1.0 / _126;
    float _160 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_46.x;
    float _180 = in.m_46.y;
    float _182 = in.m_46.z;
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
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    float _278 = fma(_272, _156, _182);
    float _280 = _130 * _158;
    bool _282 = !_260;
    float _300;
    if (!_282)
    {
        float _284 = in.m_55.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        _300 = _280;
    }
    _302 = false;
    float _304 = _300;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _362;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _324 * _376;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _428);
    float _436 = fma(_426, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_374;
    float _462;
    if (!_444)
    {
        float _446 = in.m_55.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _280;
    }
    _464 = false;
    float _466 = _462;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = _466 + _468;
    bool _472 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_466);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _484;
    bool _488 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_466);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -_482;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _504;
    float _508 = 1.0 / _486;
    bool _510 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _512 = _498 * _502;
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = _470 * _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = fma(_506, _518, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _526;
    float _530 = fma(_522, _518, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _532 = _524 * _512;
    float _534 = fma(_528, _518, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _536 = _530 * _512;
    float _538 = _534 * _512;
    float _540 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].x, _532);
    float _542 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].y, _538);
    float _544 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].z, _536);
    float _546 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].x, _540);
    float _548 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].y, _542);
    float _550 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].z, _544);
    float _552 = _546 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _554 = in.m_53.x;
    float _556 = in.m_53.y;
    float _558 = in.m_53.z;
    float _560 = _548 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _564;
    out.m_57.y = _566;
    out.m_57.z = _568;
    float _570 = _442 * _558;
    float _572 = _440 * _556;
    float _574 = _438 * _554;
    bool _576 = !_510;
    float _578 = _574;
    float _596;
    if (!_576)
    {
        float _580 = in.m_55.x;
        float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _584 = _580 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _588 = _586 * _582;
        float _590 = floor(_588);
        float _592 = -_590;
        float _594 = _588 + _592;
        _596 = _594;
        _598 = true;
    }
    else
    {
        _596 = _280;
    }
    _598 = false;
    float _600 = _596;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _604 = _600 + _602;
    bool _606 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _608 = isnan(_600);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _618;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _624 = 1.0 / _620;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = _604 * _624;
    bool _636 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _638 = isnan(_600);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _648;
    float _652 = fma(_632, _634, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _654;
    float _658 = _646 * _628;
    float _660 = fma(_650, _634, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _662 = fma(_656, _634, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _664 = -_646;
    float _666 = _664 + 1.0;
    float _668 = _652 * _658;
    float _670 = _660 * _658;
    float _672 = _662 * _658;
    float _674 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].x, _670);
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].y, _672);
    float _678 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _680 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].x, _674);
    float _682 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].y, _676);
    float _684 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].z, _678);
    float _686 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _690 = _684 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _692;
    out.m_59.y = _694;
    out.m_59.z = _696;
    bool _698 = !_622;
    float _716;
    if (!_698)
    {
        float _700 = in.m_55.x;
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        _716 = _280;
    }
    _718 = false;
    float _720 = _716;
    float _722 = in.m_61.x;
    float _724 = in.m_61.y;
    float _726 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _730 = in.m_55.x;
    float _732 = in.m_55.y;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _740 = in.m_55.z;
    float _742 = in.m_55.w;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _760 = _758 != 0;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_736)
    {
        float _764 = in.m_55.z;
        _762 = _764;
    }
    float _766 = _762;
    float _768 = _726 * _722;
    float _770 = _728 * _724;
    float _772 = -_768;
    float _774 = _772 + 1.0;
    bool _776 = _730 > 0.5;
    float _778 = -_770;
    float _780 = _778 + 1.0;
    float _782 = _768;
    float _784 = _770;
    if (!_736)
    {
        _578 = _732;
    }
    float _786 = _578;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _790 = _776 ? as_type<int>(_774) : as_type<int>(_768);
    bool _792 = _732 > 0.5;
    bool _794 = _742 > 0.5;
    float _796 = _786;
    if (_736)
    {
        _796 = _730;
    }
    float _798 = _796;
    bool _800 = !_746;
    float _802 = _800 ? _768 : as_type<float>(_790);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _806 = _792 ? as_type<int>(_780) : as_type<int>(_770);
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[83].z, _788);
    bool _810 = _740 > 0.5;
    float _812 = _798 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _814 = !_750;
    float _816 = _814 ? _770 : as_type<float>(_806);
    float _818 = _798;
    if (_756)
    {
        float _820 = _810 ? _774 : _768;
        _782 = _820;
    }
    float _822 = _782;
    float _824 = -_804;
    float _826 = fma(_812, 2.0, _824);
    if (_760)
    {
        float _828 = _794 ? _780 : _770;
        _784 = _828;
    }
    float _830 = _784;
    float _832 = _738 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _834 = _766;
    if (!_736)
    {
        _818 = _766;
    }
    float _836 = _818;
    float _838 = _752 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _840 = fma(_832, _822, -0.5);
    float _842 = -_130;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[81].x, _826);
    float _846 = _836;
    if (_736)
    {
        _846 = _732;
    }
    float _848 = _846;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_736)
    {
        _834 = _732;
    }
    float _852 = _834;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _856 = fma(_838, _830, -0.5);
    float _858 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[83].w, _850);
    float _862 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _864 = fma(_858, -2.0, _854);
    float _866 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _860);
    float _868 = fma(_862, _840, _844);
    float _870 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _864);
    float _872 = _868 + 0.5;
    float _874 = -_870;
    float _876 = fma(_866, _856, _874);
    float _878 = _876 + 0.5;
    float2 _4059 = float2(_872, _878);
    float _880 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_4059, float2(0.0), isnan(_4059)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_4059, float2(0.0), isnan(_4059)), level(0.0)).w;
    float _882 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _884 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _888;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _904 = 1.0 / _894;
    float _906 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _882);
    float _908 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _910 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _886);
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _916 = _720 + _914;
    float _918 = 1.0 / _898;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _932 = _930 != 0;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _936 = _720 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _938;
    float _942 = 1.0 / _902;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _946 = _720 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _950 = _720 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _954 = _720 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = _720 + _956;
    bool _960 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _962 = isnan(_720);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = 1.0 / _890;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _978 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _980 = _936 * _918;
    float _982 = -_970;
    float _984 = _982 + 1.0;
    float _986 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _978);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _990 = _720 + _988;
    float _992 = 1.0 / _976;
    float _994 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _996 = _950 * _942;
    float _998 = _990 * _904;
    float _1000 = -_912;
    float _1002 = fma(_994, 2.0, _1000);
    float _1004 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1006 = 1.0 / _940;
    float _1008 = _740 * 2.0;
    float _1010 = fma(_1004, -2.0, _920);
    float _1012 = _946 * _972;
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _986);
    float _1016 = _732 * 2.0;
    float _1018 = _916 * _992;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1020;
    float _1024 = _730 * 2.0;
    float _1026 = floor(_1008);
    float _1028 = -_130;
    float _1030 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    bool _1032 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1034 = isnan(_720);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    float _1046 = _958 * _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1048;
    float _1052 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _908);
    float _1054 = 1.0 / _1022;
    float _1056 = _730 + _740;
    float _1058 = fma(_1050, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1060 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    float _1062 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _906);
    float _1064 = _1056 + (-1.0);
    float _1066 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1070 = floor(_1024);
    float _1072 = _732 + _740;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1076 = _740 + (-0.5);
    float _1078 = _1072 + (-1.0);
    bool _1080 = _1026 > 0.0;
    float _1082 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1084 = _954 * _1054;
    float _1086 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1088 = _732 + _730;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = _1088 + (-1.0);
    bool _1100 = _1026 >= 0.0;
    bool _1102 = isnan(_1026);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = fma(_1092, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1112 = _1070 > 0.0;
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1116 = fma(_1096, _998, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1118 = _1070 >= 0.0;
    bool _1120 = isnan(_1070);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1144 = floor(_1016);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1146;
    float _1150 = fma(_1138, _998, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1152 = fma(_1142, _998, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    bool _1154 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1156 = isnan(_720);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = fma(_1148, _980, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1172 = fma(_1130, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1174 = fma(_1134, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1176 = fma(_1168, _996, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1178 = _1164 * _984;
    float _1180 = -_1164;
    float _1182 = _1180 + 1.0;
    float _1184 = in.m_63.x;
    float _1186 = in.m_63.y;
    float _1188 = in.m_63.z;
    int _1190 = _1108 ? 0 : 1;
    float _1192 = rsqrt(_1014);
    int _1194 = _1126 ? 0 : 1;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1196;
    bool _1200 = _1144 > 0.0;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    bool _1206 = _1144 >= 0.0;
    bool _1208 = isnan(_1144);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(0.0);
    bool _1214 = _1210 || _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1224 = fma(_1218, _980, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _1226 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1228 = isnan(_720);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = fma(_1198, _980, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1240 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1242 = isnan(_720);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = fma(_1222, _996, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1254 = fma(_1204, _996, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1256 = _1236 * _1182;
    float _1258 = -_1236;
    float _1260 = _1258 + 1.0;
    bool _1262 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1264 = isnan(_720);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -_1250;
    float _1276 = _1274 + 1.0;
    bool _1278 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1280 = isnan(_720);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1250 * _1260;
    float _1292 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00999999977648258209228515625, _1184);
    float _1294 = _1272 * _1276;
    float _1296 = -_1272;
    float _1298 = _1296 + 1.0;
    float _1300 = _1292 + _730;
    float _1302 = _1288 * _1298;
    float _1304 = -_1288;
    float _1306 = _1304 + 1.0;
    float _1308 = _1300 * 12.56637096405029296875;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _1330 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1332 = isnan(_720);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1042 * _1306;
    float _1344 = _1308 * 0.15915493667125701904296875;
    float _1346 = -_1042;
    float _1348 = _1346 + 1.0;
    float _1350 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1352 = log2(_1350);
    float _1354 = fma(_1320, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1356 = fma(_1324, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1358 = fma(_1328, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1360 = _1340 * _1348;
    float _1362 = fma(_1312, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1364 = _1344 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1110 * _1360;
    float _1370 = _1172 * _1360;
    float _1372 = _1174 * _1360;
    float _1374 = -_1340;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1316, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1380;
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1370);
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1372);
    float _1388 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1368);
    float _1390 = fma(_1150, _1342, _1384);
    float _1392 = fma(_1152, _1342, _1386);
    float _1394 = _1352 * _130;
    float _1396 = fma(_1116, _1342, _1388);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1402;
    float _1406 = fma(_1366, -0.125, -0.125);
    float _1408 = fma(_1224, _1302, _1390);
    float _1410 = fma(_1238, _1302, _1392);
    float _1412 = fma(_1382, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1414 = fma(_1400, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    int _1416 = _1214 ? 0 : 1;
    float _1418 = exp2(_1394);
    float _1420 = in.m_65.x;
    float _1422 = in.m_65.y;
    float _1424 = in.m_65.z;
    float _1426 = fma(_1404, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    int _1428 = ~_1194;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1436 = ~_1190;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    float _1442 = fma(_1170, _1302, _1396);
    int _1444 = _1432;
    int _1446 = _1440;
    if (!_1112)
    {
        int _1448 = ~_1194;
        int _1450 = _1448 + 1;
        _1444 = _1450;
    }
    int _1452 = _1444;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1456 = 1.0 + _1454;
    if (!_1080)
    {
        int _1458 = ~_1190;
        int _1460 = _1458 + 1;
        _1446 = _1460;
    }
    int _1462 = _1446;
    float _1464 = in.m_67.x;
    float _1466 = in.m_67.y;
    float _1468 = in.m_67.z;
    bool _1470 = !_924;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = fma(_1176, _1294, _1442);
    int _1476 = ~_1416;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = fma(_1252, _1294, _1408);
    int _1484 = _1480;
    if (!_1200)
    {
        int _1486 = ~_1416;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1434);
    int _1494 = abs(_1472);
    float _1496 = 1.0 / _1456;
    float _1498 = float(_1462);
    float _1500 = -_1418;
    float _1502 = _1500 + 1.0;
    float _1504 = float(_1494);
    float _1506 = fma(_1254, _1294, _1410);
    float _1508 = _730 + (-0.5);
    bool _1510 = !_932;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = _1504 * _1498;
    bool _1516 = !_928;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1522 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(1.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = _1514 * (-2.0);
    int _1534 = abs(_1518);
    float _1536 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1520);
    int _1538 = abs(_1512);
    float _1540 = fma(_1532, _1420, _1420);
    float _1542 = float(_1534);
    float _1544 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1492);
    float _1546 = float(_1452);
    float _1548 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1536);
    bool _1550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1558 = _1554 || _1556;
    float _1560 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1540);
    float _1562 = float(_1538);
    float _1564 = _1542 * _1546;
    float _1566 = float(_1490);
    float _1568 = _732 + (-0.5);
    float _1570 = _1558 ? _1502 : 0.0;
    float _1572 = _1564 * (-2.0);
    float _1574 = _1468 * _1468;
    float _1576 = _1562 * _1566;
    float _1578 = fma(_1362, _1290, _1482);
    if (_1530)
    {
        float _1580 = _1570 * _1496;
        _148 = _1580;
    }
    float _1582 = _148;
    float _1584 = fma(_1086, _1572, _1086);
    float _1586 = rint(_730);
    float _1588 = _1576 * (-2.0);
    float _1590 = fma(_1572, _1422, _1422);
    float _1592 = fma(_1058, _1290, _1474);
    float _1594 = fma(_1464, _1464, _1574);
    float _1596 = fma(_1074, _1588, _1074);
    float _1598 = fma(_1588, _1424, _1424);
    float _1600 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1590);
    float _1602 = fma(_1356, _1256, _1578);
    float _1604 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1598);
    float _1606 = fma(_1584, _1582, _1600);
    float _1608 = fma(_1354, _1256, _1592);
    float _1610 = rsqrt(_1594);
    float _1612 = fma(_1414, _1178, _1602);
    float _1614 = -_1466;
    float _1616 = _1614 + _1186;
    float _1618 = fma(_1412, _1178, _1608);
    float _1620 = -_1186;
    float _1622 = fma(_1620, 0.800000011920928955078125, 1.0);
    float _1624 = fma(_1378, _1290, _1506);
    float _1626 = fma(_1114, _1532, _1114);
    float _1628 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1618);
    float _1630 = fma(_1596, _1582, _1604);
    float _1632 = _1606 * 0.15915493667125701904296875;
    float _1634 = fma(_1586, 2.0, -1.0);
    float _1636 = fma(_1186, 2.0, -1.0);
    float _1638 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1612);
    float _1640 = fma(_1358, _1256, _1624);
    float _1642 = fma(_1628, _1616, _1466);
    float _1644 = -_1638;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_1626, _1582, _1560);
    float _1650 = fma(_1426, _1178, _1640);
    float _1652 = _1632 * 6.283185482025146484375;
    float _1654 = sin(_1652);
    float _1656 = _1636 * _1646;
    float _1658 = _1648 * 0.15915493667125701904296875;
    float _1660 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1650);
    float _1662 = _1630 * 0.15915493667125701904296875;
    float _1664 = _1656 * _1634;
    float _1666 = -_1464;
    float _1668 = _1666 + _1184;
    float _1670 = _1660 * _1622;
    float _1672 = _1658 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = _1664 * 0.15915493667125701904296875;
    float _1678 = -_1468;
    float _1680 = _1678 + _1188;
    float _1682 = _1670 * 18.0;
    float _1684 = fma(_1628, _1668, _1464);
    float _1686 = _280 * _1406;
    float _1688 = fma(_1628, _1680, _1468);
    float _1690 = -_1682;
    float _1692 = fma(_1690, _1192, _1642);
    float _1694 = _1658 * 6.283185482025146484375;
    float _1696 = cos(_1694);
    float _1698 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1692);
    float _1700 = fma(_880, 0.20000000298023223876953125, -0.100000001490116119384765625);
    float _1702 = _1632 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    float _1706 = _1610 * _1700;
    float _1708 = _1674 * _1654;
    float _1710 = _1638 * _1706;
    float _1712 = _1710 * 0.5;
    float _1714 = _1676 * 6.283185482025146484375;
    float _1716 = cos(_1714);
    float _1718 = fma(_1464, _1712, _1684);
    float _1720 = fma(_1468, _1712, _1688);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1698);
    float _1724 = _1696 * _1654;
    float _1726 = _728 * _1722;
    float _1728 = _1662 * 6.283185482025146484375;
    float _1730 = sin(_1728);
    float _1732 = _1696 * _1704;
    float _1734 = _1674 * _1704;
    float _1736 = _1676 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = _1718 * _1716;
    float _1742 = _1662 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = fma(_1730, _1732, _1708);
    float _1748 = fma(_1730, _1708, _1732);
    float _1750 = -_1724;
    float _1752 = fma(_1730, _1734, _1750);
    float _1754 = -_1734;
    float _1756 = fma(_1730, _1724, _1754);
    float _1758 = _1718 * _1738;
    float _1760 = fma(_1720, _1738, _1740);
    float _1762 = -_1758;
    float _1764 = fma(_1720, _1716, _1762);
    float _1766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1760);
    float _1768 = _1696 * _1744;
    float _1770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1764);
    float _1772 = _726 * _1766;
    float _1774 = _1674 * _1744;
    float _1776 = _1768 * _1726;
    float _1778 = _1704 * _1744;
    float _1780 = _1066 * _1770;
    float _1782 = -_1726;
    float _1784 = _1730 * _1782;
    float _1786 = fma(_1746, _1772, _1776);
    float _1788 = _1654 * _1744;
    float _1790 = _1774 * _1726;
    float _1792 = fma(_1778, _1772, _1784);
    float _1794 = fma(_1756, _1780, _1786);
    float _1796 = _1062 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1798 = fma(_1752, _1772, _1790);
    float _1800 = fma(_1788, _1780, _1792);
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1804 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1806 = fma(_1748, _1780, _1798);
    float _1808 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1804);
    float _1812 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1808);
    float _1814 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1810);
    float _1816 = _1796 + _1812;
    float _1818 = _1068 + _1814;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1822 = _1816 + _1820;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1826 = _1818 + _1824;
    float _1828 = _1822 * _1822;
    float _1830 = fma(_1826, _1826, _1828);
    float _1832 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1834 = sqrt(_1830);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1832);
    float _1838 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1836);
    float _1840 = _1082 + _1838;
    bool _1842 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = _1800;
    float _1846 = _1806;
    float _1848 = _1780;
    float _1850 = _1830;
    float _1852 = _1642;
    if (!_1842)
    {
        _1844 = _1818;
    }
    float _1854 = _1844;
    float _1856 = _1854;
    if (!_1842)
    {
        _1846 = _1816;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (!_1842)
    {
        _1848 = _1840;
    }
    float _1862 = _1848;
    bool _1864 = !_1842;
    float _1866 = _1862;
    if (!_1864)
    {
        float _1868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1872 = _1834 + _1870;
        float _1874 = rsqrt(_1830);
        float _1876 = _1872 * _1868;
        float _1878 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1880 = _1876 * 0.15915493667125701904296875;
        float _1882 = _1880 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        float _1886 = _1880 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        float _1890 = _1884 + (-1.0);
        float _1892 = fma(_1888, _1878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1894 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = _1874 * _1892;
        float _1898 = fma(_1840, _1884, _1894);
        float _1900 = fma(_1826, _1896, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = fma(_1822, _1896, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1866 = _1898;
        _1856 = _1900;
        _1860 = _1902;
    }
    float _1904 = _1866;
    float _1906 = _1856;
    float _1908 = _1860;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1904 + _1910;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1916 = _1906 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1920 = _1908 + _1918;
    float _1922 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1924 = _1912 * _1912;
    float _1926 = fma(_1916, _1916, _1924);
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1916 * _1934;
    float _1938 = _1920 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1920;
    float _1956 = _1944;
    float _1958 = _1952;
    if (_1948)
    {
        float _1960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1960;
    }
    float _1962 = _1954;
    if (_1948)
    {
        float _1964 = rsqrt(_1944);
        _1956 = _1964;
    }
    float _1966 = _1956;
    if (_1948)
    {
        float _1968 = _1952 * _1962;
        _1958 = _1968;
    }
    float _1970 = _1958;
    if (_1948)
    {
        float _1972 = _1970 * 0.15915493667125701904296875;
        _1850 = _1972;
    }
    float _1974 = _1850;
    float _1976 = _1930;
    float _1978 = _1974;
    if (_1948)
    {
        float _1980 = _1974 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        _1976 = _1982;
    }
    float _1984 = _1976;
    float _1986 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1988 = precise::max(0.0, _1986);
    float _1990 = _1924;
    float _1992 = _1988;
    float _1994 = _1986;
    if (_1948)
    {
        float _1996 = _1974 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1990 = _1998;
    }
    float _2000 = _1990;
    float _2002 = -_1934;
    float _2004 = -_1988;
    float _2006 = fma(_1912, _2002, _2004);
    float _2008 = _2006;
    if (_1948)
    {
        float _2010 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2010;
    }
    float _2012 = _1992;
    float _2014 = _1984;
    float _2016 = _2012;
    if (_1948)
    {
        float _2018 = fma(_1984, _2012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = _2020;
    if (!_1948)
    {
        _2016 = _1940;
    }
    float _2024 = _2016;
    float _2026 = _2024;
    float _2028 = _2000;
    if (_1948)
    {
        float _2030 = _2000 + (-1.0);
        _1994 = _2030;
    }
    float _2032 = _1994;
    float _2034 = _2032;
    if (_1948)
    {
        float _2036 = _1966 * _2020;
        _1852 = _2036;
    }
    float _2038 = _1852;
    if (!_1948)
    {
        _2022 = _1936;
    }
    float _2040 = _2022;
    float _2042 = _2040;
    if (_1948)
    {
        float _2044 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _2044;
    }
    float _2046 = _1978;
    if (_1948)
    {
        float _2048 = _1936 * _2038;
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1948)
    {
        _2034 = _1938;
    }
    float _2052 = _2034;
    float _2054 = _2052;
    if (_1948)
    {
        float _2056 = _1938 * _2038;
        _2054 = _2056;
    }
    float _2058 = _2054;
    if (_1948)
    {
        float _2060 = fma(_2006, _2000, _2046);
        _2008 = _2060;
    }
    float _2062 = _2008;
    if (_1948)
    {
        float _2064 = _2050 * _2050;
        _2026 = _2064;
    }
    float _2066 = _2026;
    if (!_1948)
    {
        _2028 = _1942;
    }
    float _2068 = _2028;
    float _2070 = _2068;
    if (_1948)
    {
        float _2072 = _2058 * _2058;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2078 = fma(_2062, _2062, _2066);
    float _2080 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2082 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2076);
    float _2084 = _2078 + _2074;
    float _2086 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2090 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2088);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2096 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2086);
    float _2100 = rsqrt(_2084);
    float _2102 = -_2092;
    float _2104 = _2102 + 1.0;
    float _2106 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2080);
    float _2112 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2114 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2118 = abs(_2104);
    float _2120 = log2(_2118);
    float _2122 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2110);
    float _2124 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2128 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2130 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2126);
    float _2134 = _2100 * _2050;
    float _2136 = _2100 * _2062;
    float _2138 = _2100 * _2058;
    float _2140 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = -_2128;
    float _2146 = fma(_2144, _1922, 1.0);
    float _2148 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2140);
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2158 = log2(_2146);
    float _2160 = -_2138;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2156);
    float _2168 = fma(_2162, -0.5, 0.5);
    float _2170 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2172 = fma(_2162, 0.5, 0.5);
    float _2174 = 1.0 / _2148;
    float _2176 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2166);
    float _2178 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2170);
    float _2180 = fma(_2172, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2182 = _2136 + 1.0;
    float _2184 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2178);
    float _2186 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2176);
    float _2188 = exp2(_2154);
    float _2190 = fma(_2172, _2180, -0.212114393711090087890625);
    float _2192 = _2158 * 0.693147182464599609375;
    float _2194 = fma(_2172, _2190, 1.570728778839111328125);
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = sqrt(_2168);
    float _2200 = _2184 * _2174;
    float _2202 = _2186 * _2174;
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = fma(_2202, -0.5, 0.5);
    float _2208 = -_2136;
    float _2210 = fma(_2188, _2182, _2208);
    float3 _6203 = float3(_2204, _2206, _2196);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6203, float3(0.0), isnan(_6203)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6203, float3(0.0), isnan(_6203)), level(0.0)).x;
    float _2214 = fma(_2210, 0.5, 0.5);
    float _2216 = _2198 * 0.636619746685028076171875;
    float _2218 = -_2194;
    float _2220 = fma(_2216, _2218, 1.0);
    float3 _6224 = float3(_2204, _2206, _2196);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6224, float3(0.0), isnan(_6224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6224, float3(0.0), isnan(_6224)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6240 = float2(_2220, _2214);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6240, float2(0.0), isnan(_6240)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6240, float2(0.0), isnan(_6240)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = in.m_69.x;
    float _2245 = in.m_69.y;
    float _2247 = in.m_69.z;
    bool _2249 = _1698 != 0.0;
    bool _2251 = isnan(_1698);
    bool _2253 = _2249 || _2251;
    bool _2255 = isnan(0.0);
    bool _2257 = _2253 || _2255;
    float _2259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2261 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1906;
    out.m_71.y = _1904;
    out.m_71.z = _1908;
    bool _2263 = _1760 == 0.0;
    bool _2265 = !_2257;
    bool _2267 = _2263 && _2265;
    bool _2269 = _1764 == 0.0;
    bool _2271 = _2269 && _2267;
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2275 = exp2(_2261);
    float _2277 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2279 = fma(_802, _2277, -0.5);
    float _2281 = _2245;
    float _2283 = _2243;
    float _2285 = _2247;
    float _2287 = _2148;
    float _2289 = _2186;
    if (!_2271)
    {
        float _2291 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2245);
        _2281 = _2291;
    }
    float _2293 = _2281;
    if (!_2271)
    {
        float _2295 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2243);
        _2283 = _2295;
    }
    float _2297 = _2283;
    float _2299 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2271)
    {
        float _2301 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2247);
        _2285 = _2301;
    }
    float _2303 = _2285;
    float _2305 = -_2293;
    float _2307 = _1730 * _2305;
    float _2309 = _1768 * _2293;
    float _2311 = _1774 * _2293;
    float _2313 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2315 = fma(_816, _2299, -0.5);
    float _2317 = fma(_1746, _2297, _2309);
    float _2319 = fma(_1544, _2279, _1030);
    float _2321 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2313);
    float _2323 = -_1044;
    float _2325 = fma(_1548, _2315, _2323);
    float _2327 = fma(_1778, _2297, _2307);
    float _2329 = fma(_1756, _2303, _2317);
    float _2331 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2321);
    float _2333 = -_2275;
    float _2335 = _2333 + 1.0;
    float _2337 = _2319 + 0.5;
    float _2339 = _2325 + 0.5;
    float _2341 = fma(_1788, _2303, _2327);
    float _2343 = fma(_1752, _2297, _2311);
    float _2345 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2347 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2331);
    float _2349 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _2337;
    out.m_73.y = _2339;
    float _2353 = fma(_1748, _2303, _2343);
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2345);
    float _2357 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2359 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2361 = isnan(_1932);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2367 = _2363 || _2365;
    float _2369 = _2347 + _2148;
    float _2371 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2349);
    float _2373 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2355);
    float _2375 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2357);
    float _2377 = _2369 * 0.5;
    float _2379 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2371);
    float _2381 = -_2351;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2375);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2186;
    out.gl_Position.z = _2347;
    out.gl_Position.w = _2148;
    out.m_75.z = _2377;
    out.m_75.w = _2148;
    out.m_77.x = _2373;
    out.m_77.y = _2379;
    out.m_77.z = _2385;
    float _2387 = _2347;
    float _2389 = _2184;
    if (!_2367)
    {
        _2287 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2391 = _2287;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2367)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2397 = _2387;
    float _2399 = _2397;
    float _2401 = _2397;
    if (!_2367)
    {
        _2289 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _2289;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2367)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2409 = _2389;
    float _2411 = _2351 * _2212;
    float _2413 = _2231 * _2411;
    float _2415 = _2231 * _2383;
    float _2417 = _2241 * _2411;
    float _2419 = fma(_2237, _2413, _2225);
    float _2421 = fma(_2239, _2413, _2227);
    float _2423 = _2227;
    float _2425 = _2225;
    float _2427 = _2409;
    float _2429 = _2409;
    if (!_2367)
    {
        _2423 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2431 = _2423;
    float _2433 = fma(_2231, _2417, _2229);
    float _2435 = _2431;
    float _2437 = _2431;
    if (!_2367)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2439 = _2425;
    out.m_79.x = _2419;
    out.m_79.y = _2421;
    out.m_79.z = _2433;
    out.m_79.w = _2415;
    bool _2441 = !_2367;
    float _2443 = _2439;
    float _2445 = _2439;
    if (!_2441)
    {
        bool _2447 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2449 = isnan(_1932);
        bool _2451 = _2447 || _2449;
        bool _2453 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2455 = _2451 || _2453;
        if (!_2455)
        {
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2459 = _1932 + _2457;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2463 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2461;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2469 = 1.0 / _2463;
            float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2487 = _2459 * _2469;
            float _2489 = precise::clamp(_2487, 0.0, 1.0);
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2495 = fma(_2489, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2497 = fma(_2489, _2493, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2499 = fma(_2489, _2473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2501 = fma(_2489, _2477, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2503 = fma(_2489, _2481, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2505 = fma(_2489, _2485, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2445 = _2499;
            _2407 = _2503;
            _2437 = _2495;
            _2401 = _2501;
            _2395 = _2497;
            _2429 = _2505;
            _2507 = true;
        }
        else
        {
            bool _2509 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2511 = isnan(_1932);
            bool _2513 = _2509 || _2511;
            bool _2515 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2517 = _2513 || _2515;
            if (!_2517)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2519 = _2435;
            _2437 = _2519;
            if (!_2517)
            {
                _2443 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2521 = _2443;
            _2445 = _2521;
            if (!_2517)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2523 = _2393;
            _2395 = _2523;
            if (!_2517)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2525 = _2399;
            _2401 = _2525;
            if (!_2517)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2527 = _2405;
            _2407 = _2527;
            if (!_2517)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2529 = _2427;
            bool _2531 = !_2517;
            _2429 = _2529;
            if (!_2531)
            {
                bool _2533 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2535 = isnan(_1932);
                bool _2537 = _2533 || _2535;
                bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2541 = _2537 || _2539;
                if (!_2541)
                {
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2545 = _1932 + _2543;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2547;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2555 = 1.0 / _2549;
                    float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2573 = _2545 * _2555;
                    float _2575 = precise::clamp(_2573, 0.0, 1.0);
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2445 = _2585;
                    _2407 = _2589;
                    _2437 = _2581;
                    _2401 = _2587;
                    _2395 = _2583;
                    _2429 = _2591;
                    _2507 = true;
                }
                else
                {
                    _2445 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2507 = false;
    float _2593 = _2445;
    float _2595 = _2407;
    float _2597 = _2437;
    float _2599 = _2401;
    float _2601 = _2395;
    float _2603 = _2429;
    float _2605 = fma(_2379, -0.5, 0.5);
    float _2607 = precise::clamp(_2605, 0.0, 1.0);
    float _2609 = -_2593;
    float _2611 = _2609 + _2595;
    float _2613 = -_2597;
    float _2615 = _2613 + _2599;
    float _2617 = -_2601;
    float _2619 = _2617 + _2603;
    bool _2621 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2623 = fma(_2607, _2611, _2593);
    float _2625 = fma(_2607, _2615, _2597);
    float _2627 = fma(_2607, _2619, _2601);
    float _2629 = _2623 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2631 = fma(_2625, 0.298911988735198974609375, _2629);
    float _2633 = fma(_2627, 0.114477999508380889892578125, _2631);
    out.m_81.x = 0.0;
    float _2635 = -_2633;
    float _2637 = _2625 + _2635;
    float _2639 = -_2633;
    float _2641 = _2623 + _2639;
    float _2643 = -_2633;
    float _2645 = _2627 + _2643;
    float _2647 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2649 = fma(_2637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    float _2653 = fma(_2645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    out.m_83.w = _2647;
    out.m_85.x = _2649;
    out.m_85.y = _2651;
    out.m_85.z = _2653;
    if (!_2621)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2655 = -_1904;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2659 = -_1906;
    float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2663 = -_1908;
    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2667 = _2657 * _2657;
    float _2669 = fma(_2661, _2661, _2667);
    float _2671 = fma(_2665, _2665, _2669);
    float _2673 = sqrt(_2671);
    float _2675 = rsqrt(_2671);
    float _2677 = -_2673;
    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2681 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2683 = precise::clamp(_2681, 0.0, 1.0);
    float _2685 = _2661 * _2675;
    float _2687 = _2657 * _2675;
    float _2689 = abs(_2683);
    float _2691 = log2(_2689);
    float _2693 = _2665 * _2675;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2697 = _2379 * _2687;
    float _2699 = -_2687;
    float _2701 = -_2695;
    float _2703 = fma(_2699, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2701);
    float _2705 = fma(_2373, _2685, _2697);
    float _2707 = -_2693;
    float _2709 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2703);
    float _2711 = fma(_2385, _2693, _2705);
    float _2713 = precise::clamp(_2711, 0.0, 1.0);
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2717 = _2709 + _2715;
    float _2719 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2721 = _2717 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2723 = precise::clamp(_2721, 0.0, 1.0);
    float _2725 = exp2(_2719);
    float _2727 = _2725 * _2723;
    float _2729 = _2713 * _2727;
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2733 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2735 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2731;
    out.m_81.y = _2733;
    out.m_81.z = _2735;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2507 = false;
    bool _718 = false;
    bool _598 = false;
    bool _464 = false;
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_120);
        out.gl_Position.z = _2793;
    }
    if (!_108)
    {
        return out;
    }
    float _124 = in.m_51.w;
    float _126 = float(_104);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _130;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2857 = as_type<float>(_154);
        out.gl_Position.z = _2857;
    }
    if (_146)
    {
        return out;
    }
    float _156 = in.m_53.w;
    float _158 = 1.0 / _126;
    float _160 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_46.x;
    float _180 = in.m_46.y;
    float _182 = in.m_46.z;
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
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    float _278 = fma(_272, _156, _182);
    float _280 = _130 * _158;
    bool _282 = !_260;
    float _300;
    if (!_282)
    {
        float _284 = in.m_55.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        _300 = _280;
    }
    _302 = false;
    float _304 = _300;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _362;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _324 * _376;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _428);
    float _436 = fma(_426, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_374;
    float _462;
    if (!_444)
    {
        float _446 = in.m_55.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _280;
    }
    _464 = false;
    float _466 = _462;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = _466 + _468;
    bool _472 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_466);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _484;
    bool _488 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_466);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -_482;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _504;
    float _508 = 1.0 / _486;
    bool _510 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _512 = _498 * _502;
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = _470 * _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = fma(_506, _518, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _526;
    float _530 = fma(_522, _518, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _532 = _524 * _512;
    float _534 = fma(_528, _518, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _536 = _530 * _512;
    float _538 = _534 * _512;
    float _540 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].x, _532);
    float _542 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].y, _538);
    float _544 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].z, _536);
    float _546 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].x, _540);
    float _548 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].y, _542);
    float _550 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].z, _544);
    float _552 = _546 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _554 = in.m_53.x;
    float _556 = in.m_53.y;
    float _558 = in.m_53.z;
    float _560 = _548 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _564;
    out.m_57.y = _566;
    out.m_57.z = _568;
    float _570 = _442 * _558;
    float _572 = _440 * _556;
    float _574 = _438 * _554;
    bool _576 = !_510;
    float _578 = _574;
    float _596;
    if (!_576)
    {
        float _580 = in.m_55.x;
        float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _584 = _580 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _588 = _586 * _582;
        float _590 = floor(_588);
        float _592 = -_590;
        float _594 = _588 + _592;
        _596 = _594;
        _598 = true;
    }
    else
    {
        _596 = _280;
    }
    _598 = false;
    float _600 = _596;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _604 = _600 + _602;
    bool _606 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _608 = isnan(_600);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _618;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _624 = 1.0 / _620;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = _604 * _624;
    bool _636 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _638 = isnan(_600);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _648;
    float _652 = fma(_632, _634, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _654;
    float _658 = _646 * _628;
    float _660 = fma(_650, _634, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _662 = fma(_656, _634, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _664 = -_646;
    float _666 = _664 + 1.0;
    float _668 = _652 * _658;
    float _670 = _660 * _658;
    float _672 = _662 * _658;
    float _674 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].x, _670);
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].y, _672);
    float _678 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _680 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].x, _674);
    float _682 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].y, _676);
    float _684 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].z, _678);
    float _686 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _690 = _684 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _692;
    out.m_59.y = _694;
    out.m_59.z = _696;
    bool _698 = !_622;
    float _716;
    if (!_698)
    {
        float _700 = in.m_55.x;
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        _716 = _280;
    }
    _718 = false;
    float _720 = _716;
    float _722 = in.m_61.x;
    float _724 = in.m_61.y;
    float _726 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _730 = in.m_55.x;
    float _732 = in.m_55.y;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _740 = in.m_55.z;
    float _742 = in.m_55.w;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _760 = _758 != 0;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_736)
    {
        float _764 = in.m_55.z;
        _762 = _764;
    }
    float _766 = _762;
    float _768 = _726 * _722;
    float _770 = _728 * _724;
    float _772 = -_768;
    float _774 = _772 + 1.0;
    bool _776 = _730 > 0.5;
    float _778 = -_770;
    float _780 = _778 + 1.0;
    float _782 = _768;
    float _784 = _770;
    if (!_736)
    {
        _578 = _732;
    }
    float _786 = _578;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _790 = _776 ? as_type<int>(_774) : as_type<int>(_768);
    bool _792 = _732 > 0.5;
    bool _794 = _742 > 0.5;
    float _796 = _786;
    if (_736)
    {
        _796 = _730;
    }
    float _798 = _796;
    bool _800 = !_746;
    float _802 = _800 ? _768 : as_type<float>(_790);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _806 = _792 ? as_type<int>(_780) : as_type<int>(_770);
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[83].z, _788);
    bool _810 = _740 > 0.5;
    float _812 = _798 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _814 = !_750;
    float _816 = _814 ? _770 : as_type<float>(_806);
    float _818 = _798;
    if (_756)
    {
        float _820 = _810 ? _774 : _768;
        _782 = _820;
    }
    float _822 = _782;
    float _824 = -_804;
    float _826 = fma(_812, 2.0, _824);
    if (_760)
    {
        float _828 = _794 ? _780 : _770;
        _784 = _828;
    }
    float _830 = _784;
    float _832 = _738 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _834 = _766;
    if (!_736)
    {
        _818 = _766;
    }
    float _836 = _818;
    float _838 = _752 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _840 = fma(_832, _822, -0.5);
    float _842 = -_130;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[81].x, _826);
    float _846 = _836;
    if (_736)
    {
        _846 = _732;
    }
    float _848 = _846;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_736)
    {
        _834 = _732;
    }
    float _852 = _834;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _856 = fma(_838, _830, -0.5);
    float _858 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[83].w, _850);
    float _862 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _864 = fma(_858, -2.0, _854);
    float _866 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _860);
    float _868 = fma(_862, _840, _844);
    float _870 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _864);
    float _872 = _868 + 0.5;
    float _874 = -_870;
    float _876 = fma(_866, _856, _874);
    float _878 = _876 + 0.5;
    float2 _4059 = float2(_872, _878);
    float _880 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_4059, float2(0.0), isnan(_4059)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_4059, float2(0.0), isnan(_4059)), level(0.0)).w;
    float _882 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _884 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _888;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _904 = 1.0 / _894;
    float _906 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _882);
    float _908 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _910 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _886);
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _916 = _720 + _914;
    float _918 = 1.0 / _898;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _932 = _930 != 0;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _936 = _720 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _938;
    float _942 = 1.0 / _902;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _946 = _720 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _950 = _720 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _954 = _720 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = _720 + _956;
    bool _960 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _962 = isnan(_720);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = 1.0 / _890;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _978 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _980 = _936 * _918;
    float _982 = -_970;
    float _984 = _982 + 1.0;
    float _986 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _978);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _990 = _720 + _988;
    float _992 = 1.0 / _976;
    float _994 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _996 = _950 * _942;
    float _998 = _990 * _904;
    float _1000 = -_912;
    float _1002 = fma(_994, 2.0, _1000);
    float _1004 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1006 = 1.0 / _940;
    float _1008 = _740 * 2.0;
    float _1010 = fma(_1004, -2.0, _920);
    float _1012 = _946 * _972;
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _986);
    float _1016 = _732 * 2.0;
    float _1018 = _916 * _992;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1020;
    float _1024 = _730 * 2.0;
    float _1026 = floor(_1008);
    float _1028 = -_130;
    float _1030 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    bool _1032 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1034 = isnan(_720);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    float _1046 = _958 * _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1048;
    float _1052 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _908);
    float _1054 = 1.0 / _1022;
    float _1056 = _730 + _740;
    float _1058 = fma(_1050, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1060 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    float _1062 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _906);
    float _1064 = _1056 + (-1.0);
    float _1066 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1070 = floor(_1024);
    float _1072 = _732 + _740;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1076 = _740 + (-0.5);
    float _1078 = _1072 + (-1.0);
    bool _1080 = _1026 > 0.0;
    float _1082 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1084 = _954 * _1054;
    float _1086 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1088 = _732 + _730;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = _1088 + (-1.0);
    bool _1100 = _1026 >= 0.0;
    bool _1102 = isnan(_1026);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = fma(_1092, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1112 = _1070 > 0.0;
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1116 = fma(_1096, _998, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1118 = _1070 >= 0.0;
    bool _1120 = isnan(_1070);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1144 = floor(_1016);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1146;
    float _1150 = fma(_1138, _998, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1152 = fma(_1142, _998, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    bool _1154 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1156 = isnan(_720);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = fma(_1148, _980, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1172 = fma(_1130, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1174 = fma(_1134, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1176 = fma(_1168, _996, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1178 = _1164 * _984;
    float _1180 = -_1164;
    float _1182 = _1180 + 1.0;
    float _1184 = in.m_63.x;
    float _1186 = in.m_63.y;
    float _1188 = in.m_63.z;
    int _1190 = _1108 ? 0 : 1;
    float _1192 = rsqrt(_1014);
    int _1194 = _1126 ? 0 : 1;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1196;
    bool _1200 = _1144 > 0.0;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    bool _1206 = _1144 >= 0.0;
    bool _1208 = isnan(_1144);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(0.0);
    bool _1214 = _1210 || _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1224 = fma(_1218, _980, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _1226 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1228 = isnan(_720);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = fma(_1198, _980, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1240 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1242 = isnan(_720);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = fma(_1222, _996, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1254 = fma(_1204, _996, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1256 = _1236 * _1182;
    float _1258 = -_1236;
    float _1260 = _1258 + 1.0;
    bool _1262 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1264 = isnan(_720);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -_1250;
    float _1276 = _1274 + 1.0;
    bool _1278 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1280 = isnan(_720);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1250 * _1260;
    float _1292 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00999999977648258209228515625, _1184);
    float _1294 = _1272 * _1276;
    float _1296 = -_1272;
    float _1298 = _1296 + 1.0;
    float _1300 = _1292 + _730;
    float _1302 = _1288 * _1298;
    float _1304 = -_1288;
    float _1306 = _1304 + 1.0;
    float _1308 = _1300 * 12.56637096405029296875;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _1330 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1332 = isnan(_720);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1042 * _1306;
    float _1344 = _1308 * 0.15915493667125701904296875;
    float _1346 = -_1042;
    float _1348 = _1346 + 1.0;
    float _1350 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1352 = log2(_1350);
    float _1354 = fma(_1320, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1356 = fma(_1324, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1358 = fma(_1328, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1360 = _1340 * _1348;
    float _1362 = fma(_1312, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1364 = _1344 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1110 * _1360;
    float _1370 = _1172 * _1360;
    float _1372 = _1174 * _1360;
    float _1374 = -_1340;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1316, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1380;
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1370);
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1372);
    float _1388 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1368);
    float _1390 = fma(_1150, _1342, _1384);
    float _1392 = fma(_1152, _1342, _1386);
    float _1394 = _1352 * _130;
    float _1396 = fma(_1116, _1342, _1388);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1402;
    float _1406 = fma(_1366, -0.125, -0.125);
    float _1408 = fma(_1224, _1302, _1390);
    float _1410 = fma(_1238, _1302, _1392);
    float _1412 = fma(_1382, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1414 = fma(_1400, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    int _1416 = _1214 ? 0 : 1;
    float _1418 = exp2(_1394);
    float _1420 = in.m_65.x;
    float _1422 = in.m_65.y;
    float _1424 = in.m_65.z;
    float _1426 = fma(_1404, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    int _1428 = ~_1194;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1436 = ~_1190;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    float _1442 = fma(_1170, _1302, _1396);
    int _1444 = _1432;
    int _1446 = _1440;
    if (!_1112)
    {
        int _1448 = ~_1194;
        int _1450 = _1448 + 1;
        _1444 = _1450;
    }
    int _1452 = _1444;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1456 = 1.0 + _1454;
    if (!_1080)
    {
        int _1458 = ~_1190;
        int _1460 = _1458 + 1;
        _1446 = _1460;
    }
    int _1462 = _1446;
    float _1464 = in.m_67.x;
    float _1466 = in.m_67.y;
    float _1468 = in.m_67.z;
    bool _1470 = !_924;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = fma(_1176, _1294, _1442);
    int _1476 = ~_1416;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = fma(_1252, _1294, _1408);
    int _1484 = _1480;
    if (!_1200)
    {
        int _1486 = ~_1416;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1434);
    int _1494 = abs(_1472);
    float _1496 = 1.0 / _1456;
    float _1498 = float(_1462);
    float _1500 = -_1418;
    float _1502 = _1500 + 1.0;
    float _1504 = float(_1494);
    float _1506 = fma(_1254, _1294, _1410);
    float _1508 = _730 + (-0.5);
    bool _1510 = !_932;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = _1504 * _1498;
    bool _1516 = !_928;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1522 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(1.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = _1514 * (-2.0);
    int _1534 = abs(_1518);
    float _1536 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1520);
    int _1538 = abs(_1512);
    float _1540 = fma(_1532, _1420, _1420);
    float _1542 = float(_1534);
    float _1544 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1492);
    float _1546 = float(_1452);
    float _1548 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1536);
    bool _1550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1558 = _1554 || _1556;
    float _1560 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1540);
    float _1562 = float(_1538);
    float _1564 = _1542 * _1546;
    float _1566 = float(_1490);
    float _1568 = _732 + (-0.5);
    float _1570 = _1558 ? _1502 : 0.0;
    float _1572 = _1564 * (-2.0);
    float _1574 = _1468 * _1468;
    float _1576 = _1562 * _1566;
    float _1578 = fma(_1362, _1290, _1482);
    if (_1530)
    {
        float _1580 = _1570 * _1496;
        _148 = _1580;
    }
    float _1582 = _148;
    float _1584 = fma(_1086, _1572, _1086);
    float _1586 = rint(_730);
    float _1588 = _1576 * (-2.0);
    float _1590 = fma(_1572, _1422, _1422);
    float _1592 = fma(_1058, _1290, _1474);
    float _1594 = fma(_1464, _1464, _1574);
    float _1596 = fma(_1074, _1588, _1074);
    float _1598 = fma(_1588, _1424, _1424);
    float _1600 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1590);
    float _1602 = fma(_1356, _1256, _1578);
    float _1604 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1598);
    float _1606 = fma(_1584, _1582, _1600);
    float _1608 = fma(_1354, _1256, _1592);
    float _1610 = rsqrt(_1594);
    float _1612 = fma(_1414, _1178, _1602);
    float _1614 = -_1466;
    float _1616 = _1614 + _1186;
    float _1618 = fma(_1412, _1178, _1608);
    float _1620 = -_1186;
    float _1622 = fma(_1620, 0.800000011920928955078125, 1.0);
    float _1624 = fma(_1378, _1290, _1506);
    float _1626 = fma(_1114, _1532, _1114);
    float _1628 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1618);
    float _1630 = fma(_1596, _1582, _1604);
    float _1632 = _1606 * 0.15915493667125701904296875;
    float _1634 = fma(_1586, 2.0, -1.0);
    float _1636 = fma(_1186, 2.0, -1.0);
    float _1638 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1612);
    float _1640 = fma(_1358, _1256, _1624);
    float _1642 = fma(_1628, _1616, _1466);
    float _1644 = -_1638;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_1626, _1582, _1560);
    float _1650 = fma(_1426, _1178, _1640);
    float _1652 = _1632 * 6.283185482025146484375;
    float _1654 = sin(_1652);
    float _1656 = _1636 * _1646;
    float _1658 = _1648 * 0.15915493667125701904296875;
    float _1660 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1650);
    float _1662 = _1630 * 0.15915493667125701904296875;
    float _1664 = _1656 * _1634;
    float _1666 = -_1464;
    float _1668 = _1666 + _1184;
    float _1670 = _1660 * _1622;
    float _1672 = _1658 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = _1664 * 0.15915493667125701904296875;
    float _1678 = -_1468;
    float _1680 = _1678 + _1188;
    float _1682 = _1670 * 18.0;
    float _1684 = fma(_1628, _1668, _1464);
    float _1686 = _280 * _1406;
    float _1688 = fma(_1628, _1680, _1468);
    float _1690 = -_1682;
    float _1692 = fma(_1690, _1192, _1642);
    float _1694 = _1658 * 6.283185482025146484375;
    float _1696 = cos(_1694);
    float _1698 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1692);
    float _1700 = fma(_880, 0.20000000298023223876953125, -0.100000001490116119384765625);
    float _1702 = _1632 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    float _1706 = _1610 * _1700;
    float _1708 = _1674 * _1654;
    float _1710 = _1638 * _1706;
    float _1712 = _1710 * 0.5;
    float _1714 = _1676 * 6.283185482025146484375;
    float _1716 = cos(_1714);
    float _1718 = fma(_1464, _1712, _1684);
    float _1720 = fma(_1468, _1712, _1688);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1698);
    float _1724 = _1696 * _1654;
    float _1726 = _728 * _1722;
    float _1728 = _1662 * 6.283185482025146484375;
    float _1730 = sin(_1728);
    float _1732 = _1696 * _1704;
    float _1734 = _1674 * _1704;
    float _1736 = _1676 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = _1718 * _1716;
    float _1742 = _1662 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = fma(_1730, _1732, _1708);
    float _1748 = fma(_1730, _1708, _1732);
    float _1750 = -_1724;
    float _1752 = fma(_1730, _1734, _1750);
    float _1754 = -_1734;
    float _1756 = fma(_1730, _1724, _1754);
    float _1758 = _1718 * _1738;
    float _1760 = fma(_1720, _1738, _1740);
    float _1762 = -_1758;
    float _1764 = fma(_1720, _1716, _1762);
    float _1766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1760);
    float _1768 = _1696 * _1744;
    float _1770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1764);
    float _1772 = _726 * _1766;
    float _1774 = _1674 * _1744;
    float _1776 = _1768 * _1726;
    float _1778 = _1704 * _1744;
    float _1780 = _1066 * _1770;
    float _1782 = -_1726;
    float _1784 = _1730 * _1782;
    float _1786 = fma(_1746, _1772, _1776);
    float _1788 = _1654 * _1744;
    float _1790 = _1774 * _1726;
    float _1792 = fma(_1778, _1772, _1784);
    float _1794 = fma(_1756, _1780, _1786);
    float _1796 = _1062 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1798 = fma(_1752, _1772, _1790);
    float _1800 = fma(_1788, _1780, _1792);
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1804 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1806 = fma(_1748, _1780, _1798);
    float _1808 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1804);
    float _1812 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1808);
    float _1814 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1810);
    float _1816 = _1796 + _1812;
    float _1818 = _1068 + _1814;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1822 = _1816 + _1820;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1826 = _1818 + _1824;
    float _1828 = _1822 * _1822;
    float _1830 = fma(_1826, _1826, _1828);
    float _1832 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1834 = sqrt(_1830);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1832);
    float _1838 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1836);
    float _1840 = _1082 + _1838;
    bool _1842 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = _1800;
    float _1846 = _1806;
    float _1848 = _1780;
    float _1850 = _1830;
    float _1852 = _1642;
    if (!_1842)
    {
        _1844 = _1818;
    }
    float _1854 = _1844;
    float _1856 = _1854;
    if (!_1842)
    {
        _1846 = _1816;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (!_1842)
    {
        _1848 = _1840;
    }
    float _1862 = _1848;
    bool _1864 = !_1842;
    float _1866 = _1862;
    if (!_1864)
    {
        float _1868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1872 = _1834 + _1870;
        float _1874 = rsqrt(_1830);
        float _1876 = _1872 * _1868;
        float _1878 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1880 = _1876 * 0.15915493667125701904296875;
        float _1882 = _1880 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        float _1886 = _1880 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        float _1890 = _1884 + (-1.0);
        float _1892 = fma(_1888, _1878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1894 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = _1874 * _1892;
        float _1898 = fma(_1840, _1884, _1894);
        float _1900 = fma(_1826, _1896, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = fma(_1822, _1896, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1866 = _1898;
        _1856 = _1900;
        _1860 = _1902;
    }
    float _1904 = _1866;
    float _1906 = _1856;
    float _1908 = _1860;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1904 + _1910;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1916 = _1906 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1920 = _1908 + _1918;
    float _1922 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1924 = _1912 * _1912;
    float _1926 = fma(_1916, _1916, _1924);
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1916 * _1934;
    float _1938 = _1920 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1920;
    float _1956 = _1944;
    float _1958 = _1952;
    if (_1948)
    {
        float _1960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1960;
    }
    float _1962 = _1954;
    if (_1948)
    {
        float _1964 = rsqrt(_1944);
        _1956 = _1964;
    }
    float _1966 = _1956;
    if (_1948)
    {
        float _1968 = _1952 * _1962;
        _1958 = _1968;
    }
    float _1970 = _1958;
    if (_1948)
    {
        float _1972 = _1970 * 0.15915493667125701904296875;
        _1850 = _1972;
    }
    float _1974 = _1850;
    float _1976 = _1930;
    float _1978 = _1974;
    if (_1948)
    {
        float _1980 = _1974 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        _1976 = _1982;
    }
    float _1984 = _1976;
    float _1986 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1988 = precise::max(0.0, _1986);
    float _1990 = _1924;
    float _1992 = _1988;
    float _1994 = _1986;
    if (_1948)
    {
        float _1996 = _1974 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1990 = _1998;
    }
    float _2000 = _1990;
    float _2002 = -_1934;
    float _2004 = -_1988;
    float _2006 = fma(_1912, _2002, _2004);
    float _2008 = _2006;
    if (_1948)
    {
        float _2010 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2010;
    }
    float _2012 = _1992;
    float _2014 = _1984;
    float _2016 = _2012;
    if (_1948)
    {
        float _2018 = fma(_1984, _2012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = _2020;
    if (!_1948)
    {
        _2016 = _1940;
    }
    float _2024 = _2016;
    float _2026 = _2024;
    float _2028 = _2000;
    if (_1948)
    {
        float _2030 = _2000 + (-1.0);
        _1994 = _2030;
    }
    float _2032 = _1994;
    float _2034 = _2032;
    if (_1948)
    {
        float _2036 = _1966 * _2020;
        _1852 = _2036;
    }
    float _2038 = _1852;
    if (!_1948)
    {
        _2022 = _1936;
    }
    float _2040 = _2022;
    float _2042 = _2040;
    if (_1948)
    {
        float _2044 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _2044;
    }
    float _2046 = _1978;
    if (_1948)
    {
        float _2048 = _1936 * _2038;
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1948)
    {
        _2034 = _1938;
    }
    float _2052 = _2034;
    float _2054 = _2052;
    if (_1948)
    {
        float _2056 = _1938 * _2038;
        _2054 = _2056;
    }
    float _2058 = _2054;
    if (_1948)
    {
        float _2060 = fma(_2006, _2000, _2046);
        _2008 = _2060;
    }
    float _2062 = _2008;
    if (_1948)
    {
        float _2064 = _2050 * _2050;
        _2026 = _2064;
    }
    float _2066 = _2026;
    if (!_1948)
    {
        _2028 = _1942;
    }
    float _2068 = _2028;
    float _2070 = _2068;
    if (_1948)
    {
        float _2072 = _2058 * _2058;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2078 = fma(_2062, _2062, _2066);
    float _2080 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2082 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2076);
    float _2084 = _2078 + _2074;
    float _2086 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2090 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2088);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2096 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2086);
    float _2100 = rsqrt(_2084);
    float _2102 = -_2092;
    float _2104 = _2102 + 1.0;
    float _2106 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2080);
    float _2112 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2114 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2118 = abs(_2104);
    float _2120 = log2(_2118);
    float _2122 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2110);
    float _2124 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2128 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2130 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2126);
    float _2134 = _2100 * _2050;
    float _2136 = _2100 * _2062;
    float _2138 = _2100 * _2058;
    float _2140 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = -_2128;
    float _2146 = fma(_2144, _1922, 1.0);
    float _2148 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2140);
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2158 = log2(_2146);
    float _2160 = -_2138;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2156);
    float _2168 = fma(_2162, -0.5, 0.5);
    float _2170 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2172 = fma(_2162, 0.5, 0.5);
    float _2174 = 1.0 / _2148;
    float _2176 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2166);
    float _2178 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2170);
    float _2180 = fma(_2172, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2182 = _2136 + 1.0;
    float _2184 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2178);
    float _2186 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2176);
    float _2188 = exp2(_2154);
    float _2190 = fma(_2172, _2180, -0.212114393711090087890625);
    float _2192 = _2158 * 0.693147182464599609375;
    float _2194 = fma(_2172, _2190, 1.570728778839111328125);
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = sqrt(_2168);
    float _2200 = _2184 * _2174;
    float _2202 = _2186 * _2174;
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = fma(_2202, -0.5, 0.5);
    float _2208 = -_2136;
    float _2210 = fma(_2188, _2182, _2208);
    float3 _6203 = float3(_2204, _2206, _2196);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6203, float3(0.0), isnan(_6203)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6203, float3(0.0), isnan(_6203)), level(0.0)).x;
    float _2214 = fma(_2210, 0.5, 0.5);
    float _2216 = _2198 * 0.636619746685028076171875;
    float _2218 = -_2194;
    float _2220 = fma(_2216, _2218, 1.0);
    float3 _6224 = float3(_2204, _2206, _2196);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6224, float3(0.0), isnan(_6224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6224, float3(0.0), isnan(_6224)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6240 = float2(_2220, _2214);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6240, float2(0.0), isnan(_6240)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6240, float2(0.0), isnan(_6240)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = in.m_69.x;
    float _2245 = in.m_69.y;
    float _2247 = in.m_69.z;
    bool _2249 = _1698 != 0.0;
    bool _2251 = isnan(_1698);
    bool _2253 = _2249 || _2251;
    bool _2255 = isnan(0.0);
    bool _2257 = _2253 || _2255;
    float _2259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2261 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1906;
    out.m_71.y = _1904;
    out.m_71.z = _1908;
    bool _2263 = _1760 == 0.0;
    bool _2265 = !_2257;
    bool _2267 = _2263 && _2265;
    bool _2269 = _1764 == 0.0;
    bool _2271 = _2269 && _2267;
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2275 = exp2(_2261);
    float _2277 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2279 = fma(_802, _2277, -0.5);
    float _2281 = _2245;
    float _2283 = _2243;
    float _2285 = _2247;
    float _2287 = _2148;
    float _2289 = _2186;
    if (!_2271)
    {
        float _2291 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2245);
        _2281 = _2291;
    }
    float _2293 = _2281;
    if (!_2271)
    {
        float _2295 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2243);
        _2283 = _2295;
    }
    float _2297 = _2283;
    float _2299 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2271)
    {
        float _2301 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2247);
        _2285 = _2301;
    }
    float _2303 = _2285;
    float _2305 = -_2293;
    float _2307 = _1730 * _2305;
    float _2309 = _1768 * _2293;
    float _2311 = _1774 * _2293;
    float _2313 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2315 = fma(_816, _2299, -0.5);
    float _2317 = fma(_1746, _2297, _2309);
    float _2319 = fma(_1544, _2279, _1030);
    float _2321 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2313);
    float _2323 = -_1044;
    float _2325 = fma(_1548, _2315, _2323);
    float _2327 = fma(_1778, _2297, _2307);
    float _2329 = fma(_1756, _2303, _2317);
    float _2331 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2321);
    float _2333 = -_2275;
    float _2335 = _2333 + 1.0;
    float _2337 = _2319 + 0.5;
    float _2339 = _2325 + 0.5;
    float _2341 = fma(_1788, _2303, _2327);
    float _2343 = fma(_1752, _2297, _2311);
    float _2345 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2347 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2331);
    float _2349 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _2337;
    out.m_73.y = _2339;
    float _2353 = fma(_1748, _2303, _2343);
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2345);
    float _2357 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2359 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2361 = isnan(_1932);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2367 = _2363 || _2365;
    float _2369 = _2347 + _2148;
    float _2371 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2349);
    float _2373 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2355);
    float _2375 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2357);
    float _2377 = _2369 * 0.5;
    float _2379 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2371);
    float _2381 = -_2351;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2375);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2186;
    out.gl_Position.z = _2347;
    out.gl_Position.w = _2148;
    out.m_75.z = _2377;
    out.m_75.w = _2148;
    out.m_77.x = _2373;
    out.m_77.y = _2379;
    out.m_77.z = _2385;
    float _2387 = _2347;
    float _2389 = _2184;
    if (!_2367)
    {
        _2287 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2391 = _2287;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2367)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2397 = _2387;
    float _2399 = _2397;
    float _2401 = _2397;
    if (!_2367)
    {
        _2289 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _2289;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2367)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2409 = _2389;
    float _2411 = _2351 * _2212;
    float _2413 = _2231 * _2411;
    float _2415 = _2231 * _2383;
    float _2417 = _2241 * _2411;
    float _2419 = fma(_2237, _2413, _2225);
    float _2421 = fma(_2239, _2413, _2227);
    float _2423 = _2227;
    float _2425 = _2225;
    float _2427 = _2409;
    float _2429 = _2409;
    if (!_2367)
    {
        _2423 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2431 = _2423;
    float _2433 = fma(_2231, _2417, _2229);
    float _2435 = _2431;
    float _2437 = _2431;
    if (!_2367)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2439 = _2425;
    out.m_79.x = _2419;
    out.m_79.y = _2421;
    out.m_79.z = _2433;
    out.m_79.w = _2415;
    bool _2441 = !_2367;
    float _2443 = _2439;
    float _2445 = _2439;
    if (!_2441)
    {
        bool _2447 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2449 = isnan(_1932);
        bool _2451 = _2447 || _2449;
        bool _2453 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2455 = _2451 || _2453;
        if (!_2455)
        {
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2459 = _1932 + _2457;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2463 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2461;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2469 = 1.0 / _2463;
            float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2487 = _2459 * _2469;
            float _2489 = precise::clamp(_2487, 0.0, 1.0);
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2495 = fma(_2489, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2497 = fma(_2489, _2493, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2499 = fma(_2489, _2473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2501 = fma(_2489, _2477, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2503 = fma(_2489, _2481, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2505 = fma(_2489, _2485, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2445 = _2499;
            _2407 = _2503;
            _2437 = _2495;
            _2401 = _2501;
            _2395 = _2497;
            _2429 = _2505;
            _2507 = true;
        }
        else
        {
            bool _2509 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2511 = isnan(_1932);
            bool _2513 = _2509 || _2511;
            bool _2515 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2517 = _2513 || _2515;
            if (!_2517)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2519 = _2435;
            _2437 = _2519;
            if (!_2517)
            {
                _2443 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2521 = _2443;
            _2445 = _2521;
            if (!_2517)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2523 = _2393;
            _2395 = _2523;
            if (!_2517)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2525 = _2399;
            _2401 = _2525;
            if (!_2517)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2527 = _2405;
            _2407 = _2527;
            if (!_2517)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2529 = _2427;
            bool _2531 = !_2517;
            _2429 = _2529;
            if (!_2531)
            {
                bool _2533 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2535 = isnan(_1932);
                bool _2537 = _2533 || _2535;
                bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2541 = _2537 || _2539;
                if (!_2541)
                {
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2545 = _1932 + _2543;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2547;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2555 = 1.0 / _2549;
                    float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2573 = _2545 * _2555;
                    float _2575 = precise::clamp(_2573, 0.0, 1.0);
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2445 = _2585;
                    _2407 = _2589;
                    _2437 = _2581;
                    _2401 = _2587;
                    _2395 = _2583;
                    _2429 = _2591;
                    _2507 = true;
                }
                else
                {
                    _2445 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2507 = false;
    float _2593 = _2445;
    float _2595 = _2407;
    float _2597 = _2437;
    float _2599 = _2401;
    float _2601 = _2395;
    float _2603 = _2429;
    float _2605 = fma(_2379, -0.5, 0.5);
    float _2607 = precise::clamp(_2605, 0.0, 1.0);
    float _2609 = -_2593;
    float _2611 = _2609 + _2595;
    float _2613 = -_2597;
    float _2615 = _2613 + _2599;
    float _2617 = -_2601;
    float _2619 = _2617 + _2603;
    bool _2621 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2623 = fma(_2607, _2611, _2593);
    float _2625 = fma(_2607, _2615, _2597);
    float _2627 = fma(_2607, _2619, _2601);
    float _2629 = _2623 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2631 = fma(_2625, 0.298911988735198974609375, _2629);
    float _2633 = fma(_2627, 0.114477999508380889892578125, _2631);
    out.m_81.x = 0.0;
    float _2635 = -_2633;
    float _2637 = _2625 + _2635;
    float _2639 = -_2633;
    float _2641 = _2623 + _2639;
    float _2643 = -_2633;
    float _2645 = _2627 + _2643;
    float _2647 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2649 = fma(_2637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    float _2653 = fma(_2645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    out.m_83.w = _2647;
    out.m_85.x = _2649;
    out.m_85.y = _2651;
    out.m_85.z = _2653;
    if (!_2621)
    {
        return out;
    }
    float _2655 = -_1904;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2659 = -_1906;
    float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2663 = -_1908;
    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2667 = _2657 * _2657;
    float _2669 = fma(_2661, _2661, _2667);
    float _2671 = fma(_2665, _2665, _2669);
    float _2673 = sqrt(_2671);
    float _2675 = rsqrt(_2671);
    float _2677 = -_2673;
    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2681 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2683 = precise::clamp(_2681, 0.0, 1.0);
    float _2685 = _2661 * _2675;
    float _2687 = _2657 * _2675;
    float _2689 = abs(_2683);
    float _2691 = log2(_2689);
    float _2693 = _2665 * _2675;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2697 = _2379 * _2687;
    float _2699 = -_2687;
    float _2701 = -_2695;
    float _2703 = fma(_2699, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2701);
    float _2705 = fma(_2373, _2685, _2697);
    float _2707 = -_2693;
    float _2709 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2703);
    float _2711 = fma(_2385, _2693, _2705);
    float _2713 = precise::clamp(_2711, 0.0, 1.0);
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2717 = _2709 + _2715;
    float _2719 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2721 = _2717 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2723 = precise::clamp(_2721, 0.0, 1.0);
    float _2725 = exp2(_2719);
    float _2727 = _2725 * _2723;
    float _2729 = _2713 * _2727;
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2733 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2735 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2731;
    out.m_81.y = _2733;
    out.m_81.z = _2735;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2507 = false;
    bool _718 = false;
    bool _598 = false;
    bool _464 = false;
    bool _302 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _99 = in.m_46.w;
    float _101 = trunc(_99);
    int _104 = int(_101);
    bool _108 = _104 >= 1;
    float _110 = 0.0;
    float _112 = as_type<float>(_104);
    if (!_108)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _110;
    if (!_108)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_108)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_108)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2793 = as_type<float>(_120);
        out.gl_Position.z = _2793;
    }
    if (!_108)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _124 = in.m_51.w;
    float _126 = float(_104);
    float _128 = -_124;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = _124 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_124);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    bool _142 = _130 >= _126;
    bool _144 = !_140;
    bool _146 = _142 || _144;
    float _148 = _130;
    if (_146)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_146)
    {
        out.m_49.x = 0.0;
    }
    if (_146)
    {
        float _152 = _150 * 5.0;
        _122 = as_type<int>(_152);
    }
    int _154 = _122;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2857 = as_type<float>(_154);
        out.gl_Position.z = _2857;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_53.w;
    float _158 = 1.0 / _126;
    float _160 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _162 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _164 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _166 = _162 || _164;
    bool _168 = isnan(1.0);
    bool _170 = _166 || _168;
    float _172 = in.m_51.x;
    float _174 = in.m_51.y;
    float _176 = in.m_51.z;
    float _178 = in.m_46.x;
    float _180 = in.m_46.y;
    float _182 = in.m_46.z;
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
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    float _278 = fma(_272, _156, _182);
    float _280 = _130 * _158;
    bool _282 = !_260;
    float _300;
    if (!_282)
    {
        float _284 = in.m_55.x;
        float _286 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _288 = _284 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _290 = fma(_288, (*spvDescriptorSet0.vp_c9)._m0[12].x, _130);
        float _292 = _290 * _286;
        float _294 = floor(_292);
        float _296 = -_294;
        float _298 = _292 + _296;
        _300 = _298;
        _302 = true;
    }
    else
    {
        _300 = _280;
    }
    _302 = false;
    float _304 = _300;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _308 = _304 + _306;
    bool _310 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _312 = isnan(_304);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _324 = _304 + _322;
    bool _326 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _328 = isnan(_304);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = _304 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _348 = isnan(_304);
    bool _350 = _346 || _348;
    bool _352 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _354 = _350 || _352;
    float _356 = float(_354);
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = 1.0 / _340;
    float _364 = _356 * _360;
    float _366 = -_356;
    float _368 = _366 + 1.0;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _372 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _370;
    bool _374 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _376 = 1.0 / _344;
    float _378 = _336 * _368;
    float _380 = -_336;
    float _382 = _380 + 1.0;
    float _384 = _308 * _362;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _392 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _390;
    float _394 = fma(_372, _384, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _396 = fma(_388, _384, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _398 = fma(_392, _384, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _400 = _324 * _376;
    float _402 = _394 * _378;
    float _404 = _396 * _378;
    float _406 = _398 * _378;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _418 = _416 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _420 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _422 = fma(_410, _400, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _400, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_418, _400, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _430 = fma(_382, (*spvDescriptorSet0.vp_c9)._m0[143].z, _406);
    float _432 = fma(_422, _364, _420);
    float _434 = fma(_424, _364, _428);
    float _436 = fma(_426, _364, _430);
    float _438 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].x, _432);
    float _440 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].y, _434);
    float _442 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[145].z, _436);
    bool _444 = !_374;
    float _462;
    if (!_444)
    {
        float _446 = in.m_55.x;
        float _448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _450 = _446 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _452 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _454 = _452 * _448;
        float _456 = floor(_454);
        float _458 = -_456;
        float _460 = _454 + _458;
        _462 = _460;
        _464 = true;
    }
    else
    {
        _462 = _280;
    }
    _464 = false;
    float _466 = _462;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _470 = _466 + _468;
    bool _472 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _474 = isnan(_466);
    bool _476 = _472 || _474;
    bool _478 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _480 = _476 || _478;
    float _482 = float(_480);
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _486 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _484;
    bool _488 = _466 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _490 = isnan(_466);
    bool _492 = _488 || _490;
    bool _494 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _496 = _492 || _494;
    float _498 = float(_496);
    float _500 = -_482;
    float _502 = _500 + 1.0;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _506 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _504;
    float _508 = 1.0 / _486;
    bool _510 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _512 = _498 * _502;
    float _514 = -_498;
    float _516 = _514 + 1.0;
    float _518 = _470 * _508;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _520;
    float _524 = fma(_506, _518, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _528 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _526;
    float _530 = fma(_522, _518, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _532 = _524 * _512;
    float _534 = fma(_528, _518, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _536 = _530 * _512;
    float _538 = _534 * _512;
    float _540 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].x, _532);
    float _542 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].y, _538);
    float _544 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[107].z, _536);
    float _546 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].x, _540);
    float _548 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].y, _542);
    float _550 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[108].z, _544);
    float _552 = _546 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _554 = in.m_53.x;
    float _556 = in.m_53.y;
    float _558 = in.m_53.z;
    float _560 = _548 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = _550 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = _552 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _566 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.x = _564;
    out.m_57.y = _566;
    out.m_57.z = _568;
    float _570 = _442 * _558;
    float _572 = _440 * _556;
    float _574 = _438 * _554;
    bool _576 = !_510;
    float _578 = _574;
    float _596;
    if (!_576)
    {
        float _580 = in.m_55.x;
        float _582 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _584 = _580 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _586 = fma(_584, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _588 = _586 * _582;
        float _590 = floor(_588);
        float _592 = -_590;
        float _594 = _588 + _592;
        _596 = _594;
        _598 = true;
    }
    else
    {
        _596 = _280;
    }
    _598 = false;
    float _600 = _596;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _604 = _600 + _602;
    bool _606 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _608 = isnan(_600);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _618;
    bool _622 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _624 = 1.0 / _620;
    float _626 = -_616;
    float _628 = _626 + 1.0;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _632 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _630;
    float _634 = _604 * _624;
    bool _636 = _600 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _638 = isnan(_600);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _650 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _648;
    float _652 = fma(_632, _634, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _656 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _654;
    float _658 = _646 * _628;
    float _660 = fma(_650, _634, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _662 = fma(_656, _634, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _664 = -_646;
    float _666 = _664 + 1.0;
    float _668 = _652 * _658;
    float _670 = _660 * _658;
    float _672 = _662 * _658;
    float _674 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].x, _670);
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].y, _672);
    float _678 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[123].z, _668);
    float _680 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].x, _674);
    float _682 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].y, _676);
    float _684 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[124].z, _678);
    float _686 = _680 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _688 = _682 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _690 = _684 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _692 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _694 = _688 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = _690 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _692;
    out.m_59.y = _694;
    out.m_59.z = _696;
    bool _698 = !_622;
    float _716;
    if (!_698)
    {
        float _700 = in.m_55.x;
        float _702 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _704 = _700 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _706 = fma(_704, (*spvDescriptorSet0.vp_c9)._m0[14].x, _130);
        float _708 = _706 * _702;
        float _710 = floor(_708);
        float _712 = -_710;
        float _714 = _708 + _712;
        _716 = _714;
        _718 = true;
    }
    else
    {
        _716 = _280;
    }
    _718 = false;
    float _720 = _716;
    float _722 = in.m_61.x;
    float _724 = in.m_61.y;
    float _726 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _728 = _572 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _730 = in.m_55.x;
    float _732 = in.m_55.y;
    int _734 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _736 = _734 != 0;
    float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _740 = in.m_55.z;
    float _742 = in.m_55.w;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _746 = _744 != 0;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _750 = _748 != 0;
    float _752 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _754 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _756 = _754 != 0;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _760 = _758 != 0;
    float _762 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    if (!_736)
    {
        float _764 = in.m_55.z;
        _762 = _764;
    }
    float _766 = _762;
    float _768 = _726 * _722;
    float _770 = _728 * _724;
    float _772 = -_768;
    float _774 = _772 + 1.0;
    bool _776 = _730 > 0.5;
    float _778 = -_770;
    float _780 = _778 + 1.0;
    float _782 = _768;
    float _784 = _770;
    if (!_736)
    {
        _578 = _732;
    }
    float _786 = _578;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _790 = _776 ? as_type<int>(_774) : as_type<int>(_768);
    bool _792 = _732 > 0.5;
    bool _794 = _742 > 0.5;
    float _796 = _786;
    if (_736)
    {
        _796 = _730;
    }
    float _798 = _796;
    bool _800 = !_746;
    float _802 = _800 ? _768 : as_type<float>(_790);
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _806 = _792 ? as_type<int>(_780) : as_type<int>(_770);
    float _808 = fma(_798, (*spvDescriptorSet0.vp_c9)._m0[83].z, _788);
    bool _810 = _740 > 0.5;
    float _812 = _798 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _814 = !_750;
    float _816 = _814 ? _770 : as_type<float>(_806);
    float _818 = _798;
    if (_756)
    {
        float _820 = _810 ? _774 : _768;
        _782 = _820;
    }
    float _822 = _782;
    float _824 = -_804;
    float _826 = fma(_812, 2.0, _824);
    if (_760)
    {
        float _828 = _794 ? _780 : _770;
        _784 = _828;
    }
    float _830 = _784;
    float _832 = _738 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _834 = _766;
    if (!_736)
    {
        _818 = _766;
    }
    float _836 = _818;
    float _838 = _752 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _840 = fma(_832, _822, -0.5);
    float _842 = -_130;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[81].x, _826);
    float _846 = _836;
    if (_736)
    {
        _846 = _732;
    }
    float _848 = _846;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (_736)
    {
        _834 = _732;
    }
    float _852 = _834;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _856 = fma(_838, _830, -0.5);
    float _858 = _848 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _860 = fma(_852, (*spvDescriptorSet0.vp_c9)._m0[83].w, _850);
    float _862 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _808);
    float _864 = fma(_858, -2.0, _854);
    float _866 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _860);
    float _868 = fma(_862, _840, _844);
    float _870 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _864);
    float _872 = _868 + 0.5;
    float _874 = -_870;
    float _876 = fma(_866, _856, _874);
    float _878 = _876 + 0.5;
    float2 _4059 = float2(_872, _878);
    float _880 = dm_bs(spvDescriptorSet0.vp_t_tcb_A.sample(spvDescriptorSet0.vp_t_tcb_ASmplr, select(_4059, float2(0.0), isnan(_4059)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_A, spvDescriptorSet0.vp_t_tcb_ASmplr_w, select(_4059, float2(0.0), isnan(_4059)), level(0.0)).w;
    float _882 = _276 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _884 = _276 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _886 = _276 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _890 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _888;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _898 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _896;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _902 = _900 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _904 = 1.0 / _894;
    float _906 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _882);
    float _908 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _884);
    float _910 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _886);
    float _912 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _914 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _916 = _720 + _914;
    float _918 = 1.0 / _898;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _922 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _924 = _922 != 0;
    int _926 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _928 = _926 != 0;
    int _930 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _932 = _930 != 0;
    float _934 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _936 = _720 + _934;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _938;
    float _942 = 1.0 / _902;
    float _944 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _946 = _720 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _950 = _720 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _954 = _720 + _952;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _958 = _720 + _956;
    bool _960 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _962 = isnan(_720);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = 1.0 / _890;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _976 = _974 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _978 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _980 = _936 * _918;
    float _982 = -_970;
    float _984 = _982 + 1.0;
    float _986 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _978);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _990 = _720 + _988;
    float _992 = 1.0 / _976;
    float _994 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _996 = _950 * _942;
    float _998 = _990 * _904;
    float _1000 = -_912;
    float _1002 = fma(_994, 2.0, _1000);
    float _1004 = _732 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1006 = 1.0 / _940;
    float _1008 = _740 * 2.0;
    float _1010 = fma(_1004, -2.0, _920);
    float _1012 = _946 * _972;
    float _1014 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _986);
    float _1016 = _732 * 2.0;
    float _1018 = _916 * _992;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1022 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1020;
    float _1024 = _730 * 2.0;
    float _1026 = floor(_1008);
    float _1028 = -_130;
    float _1030 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    bool _1032 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1034 = isnan(_720);
    bool _1036 = _1032 || _1034;
    bool _1038 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1040 = _1036 || _1038;
    float _1042 = float(_1040);
    float _1044 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    float _1046 = _958 * _1006;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1048;
    float _1052 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[4].z, _908);
    float _1054 = 1.0 / _1022;
    float _1056 = _730 + _740;
    float _1058 = fma(_1050, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1060 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[5].z, _910);
    float _1062 = fma(_278, (*spvDescriptorSet0.vp_c10)._m0[6].z, _906);
    float _1064 = _1056 + (-1.0);
    float _1066 = _570 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1068 = _1052 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1070 = floor(_1024);
    float _1072 = _732 + _740;
    float _1074 = fma(_1064, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1076 = _740 + (-0.5);
    float _1078 = _1072 + (-1.0);
    bool _1080 = _1026 > 0.0;
    float _1082 = _1060 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1084 = _954 * _1054;
    float _1086 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1088 = _732 + _730;
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1090;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = _1088 + (-1.0);
    bool _1100 = _1026 >= 0.0;
    bool _1102 = isnan(_1026);
    bool _1104 = _1100 || _1102;
    bool _1106 = isnan(0.0);
    bool _1108 = _1104 || _1106;
    float _1110 = fma(_1092, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1112 = _1070 > 0.0;
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1116 = fma(_1096, _998, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _1118 = _1070 >= 0.0;
    bool _1120 = isnan(_1070);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan(0.0);
    bool _1126 = _1122 || _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1134 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1138 = _1136 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1142 = _1140 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1144 = floor(_1016);
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1148 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1146;
    float _1150 = fma(_1138, _998, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1152 = fma(_1142, _998, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    bool _1154 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1156 = isnan(_720);
    bool _1158 = _1154 || _1156;
    bool _1160 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1162 = _1158 || _1160;
    float _1164 = float(_1162);
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1168 = _1166 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1170 = fma(_1148, _980, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1172 = fma(_1130, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1174 = fma(_1134, _1012, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1176 = fma(_1168, _996, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1178 = _1164 * _984;
    float _1180 = -_1164;
    float _1182 = _1180 + 1.0;
    float _1184 = in.m_63.x;
    float _1186 = in.m_63.y;
    float _1188 = in.m_63.z;
    int _1190 = _1108 ? 0 : 1;
    float _1192 = rsqrt(_1014);
    int _1194 = _1126 ? 0 : 1;
    float _1196 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1198 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1196;
    bool _1200 = _1144 > 0.0;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    bool _1206 = _1144 >= 0.0;
    bool _1208 = isnan(_1144);
    bool _1210 = _1206 || _1208;
    bool _1212 = isnan(0.0);
    bool _1214 = _1210 || _1212;
    float _1216 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1218 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1216;
    float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1222 = _1220 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1224 = fma(_1218, _980, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    bool _1226 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1228 = isnan(_720);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1234 = _1230 || _1232;
    float _1236 = float(_1234);
    float _1238 = fma(_1198, _980, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1240 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1242 = isnan(_720);
    bool _1244 = _1240 || _1242;
    bool _1246 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1248 = _1244 || _1246;
    float _1250 = float(_1248);
    float _1252 = fma(_1222, _996, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1254 = fma(_1204, _996, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1256 = _1236 * _1182;
    float _1258 = -_1236;
    float _1260 = _1258 + 1.0;
    bool _1262 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1264 = isnan(_720);
    bool _1266 = _1262 || _1264;
    bool _1268 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1270 = _1266 || _1268;
    float _1272 = float(_1270);
    float _1274 = -_1250;
    float _1276 = _1274 + 1.0;
    bool _1278 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1280 = isnan(_720);
    bool _1282 = _1278 || _1280;
    bool _1284 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1286 = _1282 || _1284;
    float _1288 = float(_1286);
    float _1290 = _1250 * _1260;
    float _1292 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.00999999977648258209228515625, _1184);
    float _1294 = _1272 * _1276;
    float _1296 = -_1272;
    float _1298 = _1296 + 1.0;
    float _1300 = _1292 + _730;
    float _1302 = _1288 * _1298;
    float _1304 = -_1288;
    float _1306 = _1304 + 1.0;
    float _1308 = _1300 * 12.56637096405029296875;
    float _1310 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1312 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1328 = _1326 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    bool _1330 = _720 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1332 = isnan(_720);
    bool _1334 = _1330 || _1332;
    bool _1336 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1338 = _1334 || _1336;
    float _1340 = float(_1338);
    float _1342 = _1042 * _1306;
    float _1344 = _1308 * 0.15915493667125701904296875;
    float _1346 = -_1042;
    float _1348 = _1346 + 1.0;
    float _1350 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1352 = log2(_1350);
    float _1354 = fma(_1320, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1356 = fma(_1324, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1358 = fma(_1328, _1018, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1360 = _1340 * _1348;
    float _1362 = fma(_1312, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1364 = _1344 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = _1110 * _1360;
    float _1370 = _1172 * _1360;
    float _1372 = _1174 * _1360;
    float _1374 = -_1340;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1316, _1046, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1380;
    float _1384 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1370);
    float _1386 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1372);
    float _1388 = fma(_1376, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1368);
    float _1390 = fma(_1150, _1342, _1384);
    float _1392 = fma(_1152, _1342, _1386);
    float _1394 = _1352 * _130;
    float _1396 = fma(_1116, _1342, _1388);
    float _1398 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1400 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1402;
    float _1406 = fma(_1366, -0.125, -0.125);
    float _1408 = fma(_1224, _1302, _1390);
    float _1410 = fma(_1238, _1302, _1392);
    float _1412 = fma(_1382, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1414 = fma(_1400, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    int _1416 = _1214 ? 0 : 1;
    float _1418 = exp2(_1394);
    float _1420 = in.m_65.x;
    float _1422 = in.m_65.y;
    float _1424 = in.m_65.z;
    float _1426 = fma(_1404, _1084, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    int _1428 = ~_1194;
    int _1430 = _1428 + 1;
    int _1432 = _1430 + 1;
    float _1434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1436 = ~_1190;
    int _1438 = _1436 + 1;
    int _1440 = _1438 + 1;
    float _1442 = fma(_1170, _1302, _1396);
    int _1444 = _1432;
    int _1446 = _1440;
    if (!_1112)
    {
        int _1448 = ~_1194;
        int _1450 = _1448 + 1;
        _1444 = _1450;
    }
    int _1452 = _1444;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1456 = 1.0 + _1454;
    if (!_1080)
    {
        int _1458 = ~_1190;
        int _1460 = _1458 + 1;
        _1446 = _1460;
    }
    int _1462 = _1446;
    float _1464 = in.m_67.x;
    float _1466 = in.m_67.y;
    float _1468 = in.m_67.z;
    bool _1470 = !_924;
    int _1472 = _1470 ? 0 : 1;
    float _1474 = fma(_1176, _1294, _1442);
    int _1476 = ~_1416;
    int _1478 = _1476 + 1;
    int _1480 = _1478 + 1;
    float _1482 = fma(_1252, _1294, _1408);
    int _1484 = _1480;
    if (!_1200)
    {
        int _1486 = ~_1416;
        int _1488 = _1486 + 1;
        _1484 = _1488;
    }
    int _1490 = _1484;
    float _1492 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1434);
    int _1494 = abs(_1472);
    float _1496 = 1.0 / _1456;
    float _1498 = float(_1462);
    float _1500 = -_1418;
    float _1502 = _1500 + 1.0;
    float _1504 = float(_1494);
    float _1506 = fma(_1254, _1294, _1410);
    float _1508 = _730 + (-0.5);
    bool _1510 = !_932;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = _1504 * _1498;
    bool _1516 = !_928;
    int _1518 = _1516 ? 0 : 1;
    float _1520 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1522 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1524 = isnan(1.0);
    bool _1526 = _1522 || _1524;
    bool _1528 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1530 = _1526 || _1528;
    float _1532 = _1514 * (-2.0);
    int _1534 = abs(_1518);
    float _1536 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1520);
    int _1538 = abs(_1512);
    float _1540 = fma(_1532, _1420, _1420);
    float _1542 = float(_1534);
    float _1544 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1492);
    float _1546 = float(_1452);
    float _1548 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1536);
    bool _1550 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1552 = isnan(0.0);
    bool _1554 = _1550 || _1552;
    bool _1556 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1558 = _1554 || _1556;
    float _1560 = fma(_1508, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1540);
    float _1562 = float(_1538);
    float _1564 = _1542 * _1546;
    float _1566 = float(_1490);
    float _1568 = _732 + (-0.5);
    float _1570 = _1558 ? _1502 : 0.0;
    float _1572 = _1564 * (-2.0);
    float _1574 = _1468 * _1468;
    float _1576 = _1562 * _1566;
    float _1578 = fma(_1362, _1290, _1482);
    if (_1530)
    {
        float _1580 = _1570 * _1496;
        _148 = _1580;
    }
    float _1582 = _148;
    float _1584 = fma(_1086, _1572, _1086);
    float _1586 = rint(_730);
    float _1588 = _1576 * (-2.0);
    float _1590 = fma(_1572, _1422, _1422);
    float _1592 = fma(_1058, _1290, _1474);
    float _1594 = fma(_1464, _1464, _1574);
    float _1596 = fma(_1074, _1588, _1074);
    float _1598 = fma(_1588, _1424, _1424);
    float _1600 = fma(_1568, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1590);
    float _1602 = fma(_1356, _1256, _1578);
    float _1604 = fma(_1076, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1598);
    float _1606 = fma(_1584, _1582, _1600);
    float _1608 = fma(_1354, _1256, _1592);
    float _1610 = rsqrt(_1594);
    float _1612 = fma(_1414, _1178, _1602);
    float _1614 = -_1466;
    float _1616 = _1614 + _1186;
    float _1618 = fma(_1412, _1178, _1608);
    float _1620 = -_1186;
    float _1622 = fma(_1620, 0.800000011920928955078125, 1.0);
    float _1624 = fma(_1378, _1290, _1506);
    float _1626 = fma(_1114, _1532, _1114);
    float _1628 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1618);
    float _1630 = fma(_1596, _1582, _1604);
    float _1632 = _1606 * 0.15915493667125701904296875;
    float _1634 = fma(_1586, 2.0, -1.0);
    float _1636 = fma(_1186, 2.0, -1.0);
    float _1638 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1612);
    float _1640 = fma(_1358, _1256, _1624);
    float _1642 = fma(_1628, _1616, _1466);
    float _1644 = -_1638;
    float _1646 = _1644 + 1.0;
    float _1648 = fma(_1626, _1582, _1560);
    float _1650 = fma(_1426, _1178, _1640);
    float _1652 = _1632 * 6.283185482025146484375;
    float _1654 = sin(_1652);
    float _1656 = _1636 * _1646;
    float _1658 = _1648 * 0.15915493667125701904296875;
    float _1660 = fma(_970, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1650);
    float _1662 = _1630 * 0.15915493667125701904296875;
    float _1664 = _1656 * _1634;
    float _1666 = -_1464;
    float _1668 = _1666 + _1184;
    float _1670 = _1660 * _1622;
    float _1672 = _1658 * 6.283185482025146484375;
    float _1674 = sin(_1672);
    float _1676 = _1664 * 0.15915493667125701904296875;
    float _1678 = -_1468;
    float _1680 = _1678 + _1188;
    float _1682 = _1670 * 18.0;
    float _1684 = fma(_1628, _1668, _1464);
    float _1686 = _280 * _1406;
    float _1688 = fma(_1628, _1680, _1468);
    float _1690 = -_1682;
    float _1692 = fma(_1690, _1192, _1642);
    float _1694 = _1658 * 6.283185482025146484375;
    float _1696 = cos(_1694);
    float _1698 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[193].x, _1692);
    float _1700 = fma(_880, 0.20000000298023223876953125, -0.100000001490116119384765625);
    float _1702 = _1632 * 6.283185482025146484375;
    float _1704 = cos(_1702);
    float _1706 = _1610 * _1700;
    float _1708 = _1674 * _1654;
    float _1710 = _1638 * _1706;
    float _1712 = _1710 * 0.5;
    float _1714 = _1676 * 6.283185482025146484375;
    float _1716 = cos(_1714);
    float _1718 = fma(_1464, _1712, _1684);
    float _1720 = fma(_1468, _1712, _1688);
    float _1722 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1698);
    float _1724 = _1696 * _1654;
    float _1726 = _728 * _1722;
    float _1728 = _1662 * 6.283185482025146484375;
    float _1730 = sin(_1728);
    float _1732 = _1696 * _1704;
    float _1734 = _1674 * _1704;
    float _1736 = _1676 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = _1718 * _1716;
    float _1742 = _1662 * 6.283185482025146484375;
    float _1744 = cos(_1742);
    float _1746 = fma(_1730, _1732, _1708);
    float _1748 = fma(_1730, _1708, _1732);
    float _1750 = -_1724;
    float _1752 = fma(_1730, _1734, _1750);
    float _1754 = -_1734;
    float _1756 = fma(_1730, _1724, _1754);
    float _1758 = _1718 * _1738;
    float _1760 = fma(_1720, _1738, _1740);
    float _1762 = -_1758;
    float _1764 = fma(_1720, _1716, _1762);
    float _1766 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1760);
    float _1768 = _1696 * _1744;
    float _1770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1764);
    float _1772 = _726 * _1766;
    float _1774 = _1674 * _1744;
    float _1776 = _1768 * _1726;
    float _1778 = _1704 * _1744;
    float _1780 = _1066 * _1770;
    float _1782 = -_1726;
    float _1784 = _1730 * _1782;
    float _1786 = fma(_1746, _1772, _1776);
    float _1788 = _1654 * _1744;
    float _1790 = _1774 * _1726;
    float _1792 = fma(_1778, _1772, _1784);
    float _1794 = fma(_1756, _1780, _1786);
    float _1796 = _1062 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1798 = fma(_1752, _1772, _1790);
    float _1800 = fma(_1788, _1780, _1792);
    float _1802 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1804 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1806 = fma(_1748, _1780, _1798);
    float _1808 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1802);
    float _1810 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1804);
    float _1812 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1808);
    float _1814 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1810);
    float _1816 = _1796 + _1812;
    float _1818 = _1068 + _1814;
    float _1820 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1822 = _1816 + _1820;
    float _1824 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1826 = _1818 + _1824;
    float _1828 = _1822 * _1822;
    float _1830 = fma(_1826, _1826, _1828);
    float _1832 = _1794 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1834 = sqrt(_1830);
    float _1836 = fma(_1800, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1832);
    float _1838 = fma(_1806, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1836);
    float _1840 = _1082 + _1838;
    bool _1842 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1844 = _1800;
    float _1846 = _1806;
    float _1848 = _1780;
    float _1850 = _1830;
    float _1852 = _1642;
    if (!_1842)
    {
        _1844 = _1818;
    }
    float _1854 = _1844;
    float _1856 = _1854;
    if (!_1842)
    {
        _1846 = _1816;
    }
    float _1858 = _1846;
    float _1860 = _1858;
    if (!_1842)
    {
        _1848 = _1840;
    }
    float _1862 = _1848;
    bool _1864 = !_1842;
    float _1866 = _1862;
    if (!_1864)
    {
        float _1868 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1872 = _1834 + _1870;
        float _1874 = rsqrt(_1830);
        float _1876 = _1872 * _1868;
        float _1878 = _1840 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1880 = _1876 * 0.15915493667125701904296875;
        float _1882 = _1880 * 6.283185482025146484375;
        float _1884 = cos(_1882);
        float _1886 = _1880 * 6.283185482025146484375;
        float _1888 = sin(_1886);
        float _1890 = _1884 + (-1.0);
        float _1892 = fma(_1888, _1878, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1894 = _1890 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1896 = _1874 * _1892;
        float _1898 = fma(_1840, _1884, _1894);
        float _1900 = fma(_1826, _1896, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1902 = fma(_1822, _1896, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1866 = _1898;
        _1856 = _1900;
        _1860 = _1902;
    }
    float _1904 = _1866;
    float _1906 = _1856;
    float _1908 = _1860;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1912 = _1904 + _1910;
    float _1914 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1916 = _1906 + _1914;
    float _1918 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1920 = _1908 + _1918;
    float _1922 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1924 = _1912 * _1912;
    float _1926 = fma(_1916, _1916, _1924);
    float _1928 = fma(_1920, _1920, _1926);
    float _1930 = rsqrt(_1928);
    float _1932 = sqrt(_1928);
    float _1934 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1936 = _1916 * _1934;
    float _1938 = _1920 * _1934;
    float _1940 = _1936 * _1936;
    float _1942 = _1938 * _1938;
    float _1944 = _1940 + _1942;
    float _1946 = sqrt(_1944);
    bool _1948 = _1946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1950 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1952 = _1946 + _1950;
    float _1954 = _1920;
    float _1956 = _1944;
    float _1958 = _1952;
    if (_1948)
    {
        float _1960 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1960;
    }
    float _1962 = _1954;
    if (_1948)
    {
        float _1964 = rsqrt(_1944);
        _1956 = _1964;
    }
    float _1966 = _1956;
    if (_1948)
    {
        float _1968 = _1952 * _1962;
        _1958 = _1968;
    }
    float _1970 = _1958;
    if (_1948)
    {
        float _1972 = _1970 * 0.15915493667125701904296875;
        _1850 = _1972;
    }
    float _1974 = _1850;
    float _1976 = _1930;
    float _1978 = _1974;
    if (_1948)
    {
        float _1980 = _1974 * 6.283185482025146484375;
        float _1982 = sin(_1980);
        _1976 = _1982;
    }
    float _1984 = _1976;
    float _1986 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1988 = precise::max(0.0, _1986);
    float _1990 = _1924;
    float _1992 = _1988;
    float _1994 = _1986;
    if (_1948)
    {
        float _1996 = _1974 * 6.283185482025146484375;
        float _1998 = cos(_1996);
        _1990 = _1998;
    }
    float _2000 = _1990;
    float _2002 = -_1934;
    float _2004 = -_1988;
    float _2006 = fma(_1912, _2002, _2004);
    float _2008 = _2006;
    if (_1948)
    {
        float _2010 = _2006 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1992 = _2010;
    }
    float _2012 = _1992;
    float _2014 = _1984;
    float _2016 = _2012;
    if (_1948)
    {
        float _2018 = fma(_1984, _2012, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2014 = _2018;
    }
    float _2020 = _2014;
    float _2022 = _2020;
    if (!_1948)
    {
        _2016 = _1940;
    }
    float _2024 = _2016;
    float _2026 = _2024;
    float _2028 = _2000;
    if (_1948)
    {
        float _2030 = _2000 + (-1.0);
        _1994 = _2030;
    }
    float _2032 = _1994;
    float _2034 = _2032;
    if (_1948)
    {
        float _2036 = _1966 * _2020;
        _1852 = _2036;
    }
    float _2038 = _1852;
    if (!_1948)
    {
        _2022 = _1936;
    }
    float _2040 = _2022;
    float _2042 = _2040;
    if (_1948)
    {
        float _2044 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1978 = _2044;
    }
    float _2046 = _1978;
    if (_1948)
    {
        float _2048 = _1936 * _2038;
        _2042 = _2048;
    }
    float _2050 = _2042;
    if (!_1948)
    {
        _2034 = _1938;
    }
    float _2052 = _2034;
    float _2054 = _2052;
    if (_1948)
    {
        float _2056 = _1938 * _2038;
        _2054 = _2056;
    }
    float _2058 = _2054;
    if (_1948)
    {
        float _2060 = fma(_2006, _2000, _2046);
        _2008 = _2060;
    }
    float _2062 = _2008;
    if (_1948)
    {
        float _2064 = _2050 * _2050;
        _2026 = _2064;
    }
    float _2066 = _2026;
    if (!_1948)
    {
        _2028 = _1942;
    }
    float _2068 = _2028;
    float _2070 = _2068;
    if (_1948)
    {
        float _2072 = _2058 * _2058;
        _2070 = _2072;
    }
    float _2074 = _2070;
    float _2076 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2078 = fma(_2062, _2062, _2066);
    float _2080 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2082 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2076);
    float _2084 = _2078 + _2074;
    float _2086 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2088 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2090 = fma(_1932, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2088);
    float _2092 = precise::clamp(_2090, 0.0, 1.0);
    float _2094 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2082);
    float _2096 = _1904 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2086);
    float _2100 = rsqrt(_2084);
    float _2102 = -_2092;
    float _2104 = _2102 + 1.0;
    float _2106 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = fma(_1906, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2080);
    float _2112 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2114 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2118 = abs(_2104);
    float _2120 = log2(_2118);
    float _2122 = fma(_1908, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2110);
    float _2124 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2126 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2128 = _2112 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2130 = _2122 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2126);
    float _2134 = _2100 * _2050;
    float _2136 = _2100 * _2062;
    float _2138 = _2100 * _2058;
    float _2140 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2132);
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = -_2128;
    float _2146 = fma(_2144, _1922, 1.0);
    float _2148 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2140);
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2158 = log2(_2146);
    float _2160 = -_2138;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2166 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2156);
    float _2168 = fma(_2162, -0.5, 0.5);
    float _2170 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2164);
    float _2172 = fma(_2162, 0.5, 0.5);
    float _2174 = 1.0 / _2148;
    float _2176 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2166);
    float _2178 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2170);
    float _2180 = fma(_2172, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2182 = _2136 + 1.0;
    float _2184 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2178);
    float _2186 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2176);
    float _2188 = exp2(_2154);
    float _2190 = fma(_2172, _2180, -0.212114393711090087890625);
    float _2192 = _2158 * 0.693147182464599609375;
    float _2194 = fma(_2172, _2190, 1.570728778839111328125);
    float _2196 = _2192 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2198 = sqrt(_2168);
    float _2200 = _2184 * _2174;
    float _2202 = _2186 * _2174;
    float _2204 = fma(_2200, 0.5, 0.5);
    float _2206 = fma(_2202, -0.5, 0.5);
    float _2208 = -_2136;
    float _2210 = fma(_2188, _2182, _2208);
    float3 _6203 = float3(_2204, _2206, _2196);
    float _2212 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6203, float3(0.0), isnan(_6203)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6203, float3(0.0), isnan(_6203)), level(0.0)).x;
    float _2214 = fma(_2210, 0.5, 0.5);
    float _2216 = _2198 * 0.636619746685028076171875;
    float _2218 = -_2194;
    float _2220 = fma(_2216, _2218, 1.0);
    float3 _6224 = float3(_2204, _2206, _2196);
    float4 _2223 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6224, float3(0.0), isnan(_6224)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6224, float3(0.0), isnan(_6224)), level(0.0)).xyzw;
    float _2225 = _2223.x;
    float _2227 = _2223.y;
    float _2229 = _2223.z;
    float _2231 = _2223.w;
    float2 _6240 = float2(_2220, _2214);
    float3 _2235 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6240, float2(0.0), isnan(_6240)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6240, float2(0.0), isnan(_6240)), level(0.0)).xyz;
    float _2237 = _2235.x;
    float _2239 = _2235.y;
    float _2241 = _2235.z;
    float _2243 = in.m_69.x;
    float _2245 = in.m_69.y;
    float _2247 = in.m_69.z;
    bool _2249 = _1698 != 0.0;
    bool _2251 = isnan(_1698);
    bool _2253 = _2249 || _2251;
    bool _2255 = isnan(0.0);
    bool _2257 = _2253 || _2255;
    float _2259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2261 = _2120 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_71.x = _1906;
    out.m_71.y = _1904;
    out.m_71.z = _1908;
    bool _2263 = _1760 == 0.0;
    bool _2265 = !_2257;
    bool _2267 = _2263 && _2265;
    bool _2269 = _1764 == 0.0;
    bool _2271 = _2269 && _2267;
    float _2273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2275 = exp2(_2261);
    float _2277 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2279 = fma(_802, _2277, -0.5);
    float _2281 = _2245;
    float _2283 = _2243;
    float _2285 = _2247;
    float _2287 = _2148;
    float _2289 = _2186;
    if (!_2271)
    {
        float _2291 = fma(_1698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2245);
        _2281 = _2291;
    }
    float _2293 = _2281;
    if (!_2271)
    {
        float _2295 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2243);
        _2283 = _2295;
    }
    float _2297 = _2283;
    float _2299 = _2273 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_2271)
    {
        float _2301 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2247);
        _2285 = _2301;
    }
    float _2303 = _2285;
    float _2305 = -_2293;
    float _2307 = _1730 * _2305;
    float _2309 = _1768 * _2293;
    float _2311 = _1774 * _2293;
    float _2313 = _2116 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2315 = fma(_816, _2299, -0.5);
    float _2317 = fma(_1746, _2297, _2309);
    float _2319 = fma(_1544, _2279, _1030);
    float _2321 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2313);
    float _2323 = -_1044;
    float _2325 = fma(_1548, _2315, _2323);
    float _2327 = fma(_1778, _2297, _2307);
    float _2329 = fma(_1756, _2303, _2317);
    float _2331 = fma(_2112, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2321);
    float _2333 = -_2275;
    float _2335 = _2333 + 1.0;
    float _2337 = _2319 + 0.5;
    float _2339 = _2325 + 0.5;
    float _2341 = fma(_1788, _2303, _2327);
    float _2343 = fma(_1752, _2297, _2311);
    float _2345 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2347 = fma(_2130, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2331);
    float _2349 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2351 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_73.x = _2337;
    out.m_73.y = _2339;
    float _2353 = fma(_1748, _2303, _2343);
    float _2355 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2345);
    float _2357 = _2329 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _2359 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2361 = isnan(_1932);
    bool _2363 = _2359 || _2361;
    bool _2365 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2367 = _2363 || _2365;
    float _2369 = _2347 + _2148;
    float _2371 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2349);
    float _2373 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2355);
    float _2375 = fma(_2341, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2357);
    float _2377 = _2369 * 0.5;
    float _2379 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2371);
    float _2381 = -_2351;
    float _2383 = _2381 + 1.0;
    float _2385 = fma(_2353, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2375);
    out.gl_Position.x = _2184;
    out.gl_Position.y = _2186;
    out.gl_Position.z = _2347;
    out.gl_Position.w = _2148;
    out.m_75.z = _2377;
    out.m_75.w = _2148;
    out.m_77.x = _2373;
    out.m_77.y = _2379;
    out.m_77.z = _2385;
    float _2387 = _2347;
    float _2389 = _2184;
    if (!_2367)
    {
        _2287 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2391 = _2287;
    float _2393 = _2391;
    float _2395 = _2391;
    if (!_2367)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2397 = _2387;
    float _2399 = _2397;
    float _2401 = _2397;
    if (!_2367)
    {
        _2289 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2403 = _2289;
    float _2405 = _2403;
    float _2407 = _2403;
    if (!_2367)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2409 = _2389;
    float _2411 = _2351 * _2212;
    float _2413 = _2231 * _2411;
    float _2415 = _2231 * _2383;
    float _2417 = _2241 * _2411;
    float _2419 = fma(_2237, _2413, _2225);
    float _2421 = fma(_2239, _2413, _2227);
    float _2423 = _2227;
    float _2425 = _2225;
    float _2427 = _2409;
    float _2429 = _2409;
    if (!_2367)
    {
        _2423 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2431 = _2423;
    float _2433 = fma(_2231, _2417, _2229);
    float _2435 = _2431;
    float _2437 = _2431;
    if (!_2367)
    {
        _2425 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2439 = _2425;
    out.m_79.x = _2419;
    out.m_79.y = _2421;
    out.m_79.z = _2433;
    out.m_79.w = _2415;
    bool _2441 = !_2367;
    float _2443 = _2439;
    float _2445 = _2439;
    if (!_2441)
    {
        bool _2447 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2449 = isnan(_1932);
        bool _2451 = _2447 || _2449;
        bool _2453 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2455 = _2451 || _2453;
        if (!_2455)
        {
            float _2457 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2459 = _1932 + _2457;
            float _2461 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2463 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2461;
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2467 = _2465 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2469 = 1.0 / _2463;
            float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2475 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2477 = _2475 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2487 = _2459 * _2469;
            float _2489 = precise::clamp(_2487, 0.0, 1.0);
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2495 = fma(_2489, _2467, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2497 = fma(_2489, _2493, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2499 = fma(_2489, _2473, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2501 = fma(_2489, _2477, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2503 = fma(_2489, _2481, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2505 = fma(_2489, _2485, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2445 = _2499;
            _2407 = _2503;
            _2437 = _2495;
            _2401 = _2501;
            _2395 = _2497;
            _2429 = _2505;
            _2507 = true;
        }
        else
        {
            bool _2509 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2511 = isnan(_1932);
            bool _2513 = _2509 || _2511;
            bool _2515 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2517 = _2513 || _2515;
            if (!_2517)
            {
                _2435 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2519 = _2435;
            _2437 = _2519;
            if (!_2517)
            {
                _2443 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2521 = _2443;
            _2445 = _2521;
            if (!_2517)
            {
                _2393 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2523 = _2393;
            _2395 = _2523;
            if (!_2517)
            {
                _2399 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2525 = _2399;
            _2401 = _2525;
            if (!_2517)
            {
                _2405 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2527 = _2405;
            _2407 = _2527;
            if (!_2517)
            {
                _2427 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2529 = _2427;
            bool _2531 = !_2517;
            _2429 = _2529;
            if (!_2531)
            {
                bool _2533 = _1932 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2535 = isnan(_1932);
                bool _2537 = _2533 || _2535;
                bool _2539 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2541 = _2537 || _2539;
                if (!_2541)
                {
                    float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2545 = _1932 + _2543;
                    float _2547 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2549 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2547;
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2553 = _2551 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2555 = 1.0 / _2549;
                    float _2557 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2559 = _2557 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2561 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2563 = _2561 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2573 = _2545 * _2555;
                    float _2575 = precise::clamp(_2573, 0.0, 1.0);
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2581 = fma(_2575, _2553, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2583 = fma(_2575, _2579, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2585 = fma(_2575, _2559, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2587 = fma(_2575, _2563, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2589 = fma(_2575, _2567, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2591 = fma(_2575, _2571, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2445 = _2585;
                    _2407 = _2589;
                    _2437 = _2581;
                    _2401 = _2587;
                    _2395 = _2583;
                    _2429 = _2591;
                    _2507 = true;
                }
                else
                {
                    _2445 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2407 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2437 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2401 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2395 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2429 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2507 = false;
    float _2593 = _2445;
    float _2595 = _2407;
    float _2597 = _2437;
    float _2599 = _2401;
    float _2601 = _2395;
    float _2603 = _2429;
    float _2605 = fma(_2379, -0.5, 0.5);
    float _2607 = precise::clamp(_2605, 0.0, 1.0);
    float _2609 = -_2593;
    float _2611 = _2609 + _2595;
    float _2613 = -_2597;
    float _2615 = _2613 + _2599;
    float _2617 = -_2601;
    float _2619 = _2617 + _2603;
    bool _2621 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2623 = fma(_2607, _2611, _2593);
    float _2625 = fma(_2607, _2615, _2597);
    float _2627 = fma(_2607, _2619, _2601);
    float _2629 = _2623 * 0.586610972881317138671875;
    out.m_49.x = 1.0;
    float _2631 = fma(_2625, 0.298911988735198974609375, _2629);
    float _2633 = fma(_2627, 0.114477999508380889892578125, _2631);
    out.m_81.x = 0.0;
    float _2635 = -_2633;
    float _2637 = _2625 + _2635;
    float _2639 = -_2633;
    float _2641 = _2623 + _2639;
    float _2643 = -_2633;
    float _2645 = _2627 + _2643;
    float _2647 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2649 = fma(_2637, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    float _2651 = fma(_2641, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    float _2653 = fma(_2645, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2633);
    out.m_83.w = _2647;
    out.m_85.x = _2649;
    out.m_85.y = _2651;
    out.m_85.z = _2653;
    if (!_2621)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2655 = -_1904;
    float _2657 = _2655 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2659 = -_1906;
    float _2661 = _2659 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2663 = -_1908;
    float _2665 = _2663 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2667 = _2657 * _2657;
    float _2669 = fma(_2661, _2661, _2667);
    float _2671 = fma(_2665, _2665, _2669);
    float _2673 = sqrt(_2671);
    float _2675 = rsqrt(_2671);
    float _2677 = -_2673;
    float _2679 = _2677 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2681 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2683 = precise::clamp(_2681, 0.0, 1.0);
    float _2685 = _2661 * _2675;
    float _2687 = _2657 * _2675;
    float _2689 = abs(_2683);
    float _2691 = log2(_2689);
    float _2693 = _2665 * _2675;
    float _2695 = _2685 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2697 = _2379 * _2687;
    float _2699 = -_2687;
    float _2701 = -_2695;
    float _2703 = fma(_2699, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2701);
    float _2705 = fma(_2373, _2685, _2697);
    float _2707 = -_2693;
    float _2709 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2703);
    float _2711 = fma(_2385, _2693, _2705);
    float _2713 = precise::clamp(_2711, 0.0, 1.0);
    float _2715 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2717 = _2709 + _2715;
    float _2719 = _2691 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2721 = _2717 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2723 = precise::clamp(_2721, 0.0, 1.0);
    float _2725 = exp2(_2719);
    float _2727 = _2725 * _2723;
    float _2729 = _2713 * _2727;
    float _2731 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2733 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2735 = _2729 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_81.x = _2731;
    out.m_81.y = _2733;
    out.m_81.z = _2735;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

