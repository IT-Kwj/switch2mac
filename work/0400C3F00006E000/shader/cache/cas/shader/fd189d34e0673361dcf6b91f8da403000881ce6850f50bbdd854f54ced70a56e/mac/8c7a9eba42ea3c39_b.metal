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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c15 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_87 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_95 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_101 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 m_93 [[user(locn14)]];
    float4 m_71 [[user(locn15)]];
    float4 m_79 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_65 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_46 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_89 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_81 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2530 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_144);
        out.gl_Position.z = _2846;
    }
    if (!_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _148 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_119);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = float(_124);
    bool _160 = _128 >= _158;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    if (_164)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _136;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _146 = as_type<int>(_168);
    }
    int _170 = _146;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_170);
        out.gl_Position.z = _2901;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = 1.0 / _158;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _128 * _172;
    bool _178 = !_174;
    float _180 = _176;
    float _198;
    if (!_178)
    {
        float _182 = in.m_55.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        _198 = _176;
    }
    _200 = false;
    float _202 = _198;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    bool _208 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _210 = isnan(_202);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = 1.0 / _222;
    bool _226 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_202);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -_218;
    float _240 = _238 + 1.0;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _246;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _252;
    float _256 = _236 * _240;
    float _258 = -_236;
    float _260 = _258 + 1.0;
    float _262 = _206 * _224;
    float _264 = in.m_57.x;
    float _266 = in.m_57.y;
    float _268 = in.m_57.z;
    float _270 = fma(_244, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _272 = fma(_254, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = fma(_248, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _276 = _270 * _256;
    float _278 = _272 * _256;
    float _280 = _274 * _256;
    float _282 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].x, _276);
    float _284 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _286 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].z, _280);
    float _288 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].x, _282);
    float _290 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].y, _284);
    float _292 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].z, _286);
    float _294 = _288 * _264;
    float _296 = _290 * _266;
    float _298 = _292 * _268;
    bool _300 = !_250;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _180 = _316;
    }
    float _318 = _180;
    float _320 = in.m_46.x;
    float _322 = in.m_46.y;
    float _324 = in.m_46.z;
    float _326 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = in.m_59.w;
    float _336 = _326 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _338 = in.m_61.x;
    float _340 = in.m_61.y;
    float _342 = in.m_61.z;
    float _344 = in.m_61.w;
    float _346 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _348 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _350 = in.m_63.y;
    float _352 = _322 * _330;
    float _354 = _322 * _340;
    float _356 = fma(_320, _328, _352);
    float _358 = fma(_320, _338, _354);
    float _360 = _322 + _350;
    float _362 = fma(_324, _332, _356);
    float _364 = fma(_324, _342, _358);
    float _366 = -_360;
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _370 = _362 + _334;
    float _372 = _364 + _344;
    float _374 = _368 * _368;
    float _376 = -_370;
    float _378 = _376 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _380 = -_372;
    float _382 = _380 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _384 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _386 = fma(_378, _378, _374);
    float _388 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _390 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _392 = -_384;
    float _394 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _392);
    float _396 = fma(_382, _382, _386);
    float _398 = -_388;
    float _400 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _398);
    float _402 = -_390;
    float _404 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _402);
    float _406 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _408 = rsqrt(_396);
    float _410 = _378 * _408;
    float _412 = _382 * _408;
    float _414 = _410 * _410;
    float _416 = fma(_412, _412, _414);
    float _418 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _420 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _422 = rsqrt(_416);
    float _424 = -_418;
    float _426 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _424);
    float _428 = _400 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _430 = -_406;
    float _432 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _430);
    float _434 = _368 * _408;
    float _436 = _404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _438 = -_428;
    float _440 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].y, _438);
    float _442 = -_420;
    float _444 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _442);
    float _446 = _404 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _448 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].w, _440);
    float _450 = -_436;
    float _452 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _450);
    float _454 = -_446;
    float _456 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].x, _454);
    float _458 = _412 * _422;
    float _460 = _410 * _422;
    float _462 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].w, _456);
    float _464 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].w, _452);
    float _466 = -_458;
    float _468 = _412 * _466;
    float _470 = -_458;
    float _472 = _434 * _470;
    float _474 = _462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _476 = -_468;
    float _478 = fma(_410, _460, _476);
    float _480 = _434 * _460;
    float _482 = -_474;
    float _484 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _482);
    float _486 = _444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _488 = _478 * _478;
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _484);
    float _492 = -_486;
    float _494 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _492);
    float _496 = fma(_480, _480, _488);
    float _498 = _404 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _500 = _404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _502 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _494);
    float _504 = fma(_472, _472, _496);
    float _506 = -_500;
    float _508 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _506);
    float _510 = -_502;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].w, _490);
    float _514 = -_498;
    float _516 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].x, _514);
    float _518 = _400 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _520 = rsqrt(_504);
    float _522 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].w, _508);
    float _524 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].w, _516);
    float _526 = -_518;
    float _528 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].y, _526);
    float _530 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].w, _528);
    float _532 = 1.0 / _512;
    float _534 = _478 * _520;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = -_536;
    float _540 = _538 + 1.0;
    float _542 = fma(_524, _532, -1.0);
    float _544 = _540 * _532;
    float _546 = fma(_540, _542, 1.0);
    float _548 = _530 * _544;
    float _550 = _522 * _544;
    float _552 = _546 * _546;
    float _554 = fma(_548, _548, _552);
    float _556 = in.m_65.x;
    float _558 = in.m_65.y;
    float _560 = in.m_65.z;
    float _562 = in.m_65.w;
    float _564 = fma(_550, _550, _554);
    float _566 = rsqrt(_564);
    float _568 = _550 * _566;
    float _570 = _546 * _566;
    float _572 = _322 * _558;
    float _574 = _548 * _566;
    float _576 = -_568;
    float _578 = _410 * _576;
    float _580 = fma(_320, _556, _572);
    float _582 = _412 * _570;
    float _584 = -_574;
    float _586 = -_578;
    float _588 = fma(_412, _584, _586);
    float _590 = -_574;
    float _592 = _434 * _590;
    float _594 = fma(_324, _560, _580);
    float _596 = -_568;
    float _598 = -_582;
    float _600 = fma(_434, _596, _598);
    float _602 = _588 * _588;
    float _604 = -_592;
    float _606 = fma(_410, _570, _604);
    float _608 = _594 + _562;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _370 + _610;
    float _614 = fma(_600, _600, _602);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _372 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _608 + _620;
    float _624 = fma(_606, _606, _614);
    float _626 = _622 * _622;
    float _628 = rsqrt(_624);
    float _630 = fma(_612, _612, _626);
    float _632 = fma(_618, _618, _630);
    float _634 = sqrt(_632);
    float _636 = _600 * _628;
    float _638 = _606 * _628;
    float _640 = rsqrt(_632);
    float _642 = _588 * _628;
    float _644 = _412 * _636;
    float _646 = _434 * _638;
    float _648 = -_644;
    float _650 = fma(_410, _638, _648);
    float _652 = _634 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _654 = -_646;
    float _656 = fma(_412, _642, _654);
    float _658 = _410 * _642;
    float _660 = _650 * _650;
    float _662 = precise::min(_336, _652);
    float _664 = -_658;
    float _666 = fma(_434, _636, _664);
    float _668 = fma(_656, _656, _660);
    float _670 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.934999942779541015625);
    float _672 = _640 * _662;
    float _674 = fma(_666, _666, _668);
    float _676 = precise::min(_670, 3.0);
    float _678 = _622 * _672;
    float _680 = rsqrt(_674);
    float _682 = _612 * _672;
    float _684 = -_678;
    float _686 = _622 + _684;
    float _688 = -_682;
    float _690 = _612 + _688;
    float _692 = _686 * _686;
    float _694 = fma(_676, 15.384601593017578125, -45.153804779052734375);
    float _696 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 4.870999813079833984375);
    float _698 = in.m_67.x;
    float _700 = in.m_67.y;
    float _702 = in.m_67.z;
    float _704 = fma(_690, _690, _692);
    float _706 = _618 * _672;
    float _708 = precise::min(_696, 5.0);
    float _710 = _666 * _680;
    float _712 = -_706;
    float _714 = _618 + _712;
    float _716 = _656 * _680;
    float _718 = _650 * _680;
    float _720 = _410 * _710;
    float _722 = fma(_714, _714, _704);
    float _724 = fma(_708, -7.751926898956298828125, 38.75963592529296875);
    float _726 = _412 * _718;
    float _728 = -_720;
    float _730 = fma(_412, _716, _728);
    float _732 = _434 * _716;
    float _734 = _694 * _724;
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = sqrt(_722);
    float _740 = -_726;
    float _742 = fma(_434, _710, _740);
    float _744 = _730 * _730;
    float _746 = -_732;
    float _748 = fma(_410, _718, _746);
    float _750 = _736 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _752 = fma(_742, _742, _744);
    float _754 = -_700;
    float _756 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[191].y, _754);
    float _758 = -_698;
    float _760 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[191].y, _758);
    float _762 = -_702;
    float _764 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[191].y, _762);
    float _766 = fma(_748, _748, _752);
    float _768 = fma(_750, _756, _700);
    float _770 = fma(_750, _760, _698);
    float _772 = fma(_750, _764, _702);
    float _774 = rsqrt(_766);
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _778 = _640 * _738;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    float _782 = _346 * _778;
    float _784 = _326 * _778;
    float _786 = _348 * _778;
    float _788 = _782 * _776;
    float _790 = _784 * _780;
    float _792 = _772 * _786;
    float _794 = _788 * _710;
    float _796 = _788 * _716;
    float _798 = _748 * _774;
    float _800 = _742 * _774;
    float _802 = _730 * _774;
    float _804 = fma(_790, _798, _794);
    float _806 = fma(_790, _800, _796);
    float _808 = fma(_792, _412, _804);
    float _810 = fma(_792, _410, _806);
    float _812 = _788 * _718;
    float _814 = _372 + _808;
    float _816 = _370 + _810;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _814 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _824 = _816 + _822;
    float _826 = _820 * _820;
    float _828 = fma(_824, _824, _826);
    float _830 = fma(_790, _802, _812);
    float _832 = sqrt(_828);
    float _834 = fma(_792, _434, _830);
    float _836 = _360 + _834;
    bool _838 = _832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    bool _852 = !_846;
    int _854 = _852 ? 0 : 1;
    bool _856 = !_842;
    int _858 = _856 ? 0 : 1;
    bool _860 = !_850;
    int _862 = _860 ? 0 : 1;
    float _864 = _812;
    float _866 = _792;
    float _868 = _816;
    float _870 = _682;
    float _872 = _820;
    float _874 = _412;
    if (!_838)
    {
        _864 = _814;
    }
    float _876 = _864;
    float _878 = _876;
    if (!_838)
    {
        _866 = _836;
    }
    float _880 = _866;
    bool _882 = !_838;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _832 + _888;
        float _892 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = _890 * _886;
        float _896 = rsqrt(_828);
        float _898 = _894 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = _896 * _910;
        float _916 = fma(_836, _902, _912);
        float _918 = fma(_824, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_820, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _916;
        _868 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _868;
    float _926 = _878;
    float _928 = -_678;
    float _930 = _928 + _922;
    float _932 = -_682;
    float _934 = _932 + _924;
    float _936 = -_706;
    float _938 = _936 + _926;
    float _940 = -_682;
    float _942 = _370 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _930 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _934 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _938 + _952;
    float _956 = -_706;
    float _958 = _372 + _956;
    float _960 = _946 * _946;
    float _962 = fma(_950, _950, _960);
    float _964 = fma(_954, _954, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _972 = _950 * _970;
    float _974 = _954 * _970;
    float _976 = _972 * _972;
    float _978 = _974 * _974;
    float _980 = _976 + _978;
    float _982 = sqrt(_980);
    bool _984 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _982 + _986;
    float _990 = _962;
    float _992 = _980;
    float _994 = _988;
    float _996 = _946;
    if (_984)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _990 = _998;
    }
    float _1000 = _990;
    if (!_984)
    {
        _870 = _972;
    }
    float _1002 = _870;
    float _1004 = _1002;
    if (_984)
    {
        float _1006 = rsqrt(_980);
        _992 = _1006;
    }
    float _1008 = _992;
    float _1010 = _1000;
    if (_984)
    {
        float _1012 = _988 * _1000;
        _994 = _1012;
    }
    float _1014 = _994;
    if (_984)
    {
        float _1016 = _1014 * 0.15915493667125701904296875;
        _872 = _1016;
    }
    float _1018 = _872;
    float _1020 = _954;
    float _1022 = _1018;
    if (_984)
    {
        float _1024 = _1018 * 6.283185482025146484375;
        float _1026 = sin(_1024);
        _1020 = _1026;
    }
    float _1028 = _1020;
    float _1030 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1032 = precise::max(0.0, _1030);
    float _1034 = _966;
    if (_984)
    {
        float _1036 = _1018 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        _1034 = _1038;
    }
    float _1040 = _1034;
    float _1042 = -_970;
    float _1044 = -_1032;
    float _1046 = fma(_946, _1042, _1044);
    float _1048 = _1046;
    if (_984)
    {
        float _1050 = _1046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1050;
    }
    float _1052 = _996;
    float _1054 = _1052;
    if (!_984)
    {
        _1022 = _978;
    }
    float _1056 = _1022;
    float _1058 = _1028;
    float _1060 = _1056;
    if (_984)
    {
        float _1062 = fma(_1028, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1010 = _1062;
    }
    float _1064 = _1010;
    float _1066 = _1064;
    if (!_984)
    {
        _1058 = _974;
    }
    float _1068 = _1058;
    float _1070 = _1068;
    if (_984)
    {
        float _1072 = _1040 + (-1.0);
        _1054 = _1072;
    }
    float _1074 = _1054;
    float _1076 = 0.0;
    if (_984)
    {
        float _1078 = _1008 * _1064;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1084 = _930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_984)
    {
        float _1086 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1086;
    }
    float _1088 = _1066;
    float _1090 = _1088;
    if (_984)
    {
        float _1092 = _972 * _1080;
        _1004 = _1092;
    }
    float _1094 = _1004;
    if (_984)
    {
        float _1096 = _974 * _1080;
        _1070 = _1096;
    }
    float _1098 = _1070;
    float _1100 = _930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_984)
    {
        float _1102 = fma(_1046, _1040, _1088);
        _1048 = _1102;
    }
    float _1104 = _1048;
    if (!_984)
    {
        _1090 = _976;
    }
    float _1106 = _1090;
    float _1108 = _1106;
    if (_984)
    {
        float _1110 = _1094 * _1094;
        _1108 = _1110;
    }
    float _1112 = _1108;
    if (_984)
    {
        float _1114 = _1098 * _1098;
        _1060 = _1114;
    }
    float _1116 = _1060;
    float _1118 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1120 = _930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = fma(_1104, _1104, _1112);
    float _1124 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1126 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1128 = _1122 + _1116;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1132 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1130);
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1124);
    float _1138 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1140 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1084);
    float _1142 = -_1134;
    float _1144 = _1142 + 1.0;
    float _1146 = rsqrt(_1128);
    float _1148 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1150 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1152 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1140);
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1158 = _930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = abs(_1144);
    float _1162 = log2(_1160);
    float _1164 = -_1156;
    float _1166 = fma(_1164, _1152, 1.0);
    float _1168 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1172 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1174 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1170);
    float _1176 = _1146 * _1094;
    float _1178 = floor(_1118);
    float _1180 = _1146 * _1104;
    float _1182 = _1146 * _1098;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1172);
    float _1188 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1190 = -_1184;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1190);
    float _1194 = floor(_1082);
    float _1196 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1186);
    float _1198 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1200 = -_1182;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1192);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1196);
    float _1206 = fma(_1202, -0.5, 0.5);
    float _1208 = -_1178;
    float _1210 = _1118 + _1208;
    float _1212 = log2(_1166);
    float _1214 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1216 = fma(_1202, 0.5, 0.5);
    float _1218 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1214);
    float _1220 = fma(_1216, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1222 = -_1194;
    float _1224 = _1082 + _1222;
    float _1226 = 1.0 / _1204;
    float _1228 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1230 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1218);
    float _1232 = _1180 + 1.0;
    float _1234 = fma(_1216, _1220, -0.212114393711090087890625);
    float _1236 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1228);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1230);
    float _1240 = exp2(_1198);
    float _1242 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1236);
    float _1244 = fma(_1216, _1234, 1.570728778839111328125);
    float _1246 = _1212 * 0.693147182464599609375;
    float _1248 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1252 = sqrt(_1206);
    float _1254 = _1238 * _1226;
    float _1256 = _1248 * _1226;
    float _1258 = fma(_1254, 0.5, 0.5);
    float _1260 = fma(_1256, -0.5, 0.5);
    float _1262 = -_1180;
    float _1264 = fma(_1240, _1232, _1262);
    float2 _4676 = float2(_1210, _1224);
    float _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4676, float2(0.0), isnan(_4676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4676, float2(0.0), isnan(_4676)), level(0.0)).x;
    float _1268 = fma(_1264, 0.5, 0.5);
    float _1270 = _1252 * 0.636619746685028076171875;
    float _1272 = -_1244;
    float _1274 = fma(_1270, _1272, 1.0);
    float3 _4697 = float3(_1258, _1260, _1250);
    float _1276 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4697, float3(0.0), isnan(_4697)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4697, float3(0.0), isnan(_4697)), level(0.0)).x;
    float3 _4708 = float3(_1258, _1260, _1250);
    float4 _1279 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4708, float3(0.0), isnan(_4708)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4708, float3(0.0), isnan(_4708)), level(0.0)).xyzw;
    float _1281 = _1279.x;
    float _1283 = _1279.y;
    float _1285 = _1279.z;
    float _1287 = _1279.w;
    float2 _4724 = float2(_1274, _1268);
    float3 _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4724, float2(0.0), isnan(_4724)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4724, float2(0.0), isnan(_4724)), level(0.0)).xyz;
    float _1293 = _1291.x;
    float _1295 = _1291.y;
    float _1297 = _1291.z;
    float _1299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1301 = int(_1299);
    float _1303 = in.m_69.w;
    float _1305 = -_678;
    float _1307 = _1305 + _360;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1311 = _1309 != 0;
    out.m_71.x = _750;
    int _1313 = abs(_854);
    float _1315 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1317 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1319 = int(_1317);
    out.m_73.x = _942;
    out.m_73.y = _1307;
    out.m_73.z = _958;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1323 = _1321 != 0;
    float _1325 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1315);
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1329 = _1327 != 0;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    out.m_75.w = _662;
    float _1333 = float(_1301);
    float _1335 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1325);
    bool _1337 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1339 = isnan(_318);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    out.m_77.x = _784;
    float _1349 = 1.0 / _1333;
    float _1351 = float(uint(_1319));
    out.m_79.w = _1303;
    int _1353 = ~_1319;
    int _1355 = _1353 + 1;
    bool _1357 = _1319 == 0;
    int _1359 = _1319 + (-1);
    float _1361 = 1.0 / _1351;
    int _1363 = ~_1319;
    int _1365 = _1363 + 1;
    float _1367 = _128 * _1349;
    float _1369 = trunc(_1367);
    int _1371 = int(_1369);
    int _1373 = as_type<int>(_1361) + (-2);
    float _1375 = float(uint(_1371));
    float _1377 = as_type<float>(_1373) * _1375;
    int _1379 = ~_1319;
    int _1381 = _1379 + 1;
    float _1383 = trunc(_1377);
    float _1385 = precise::max(_1383, 0.0);
    uint _1388 = uint(_1385);
    int _1390 = _1381 * int(_1388);
    int _1392 = _1390 + _1371;
    float _1394 = in.m_55.x;
    float _1396 = in.m_55.y;
    float _1398 = in.m_55.z;
    float _1400 = float(uint(_1392));
    float _1402 = as_type<float>(_1373) * _1400;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1406 = _1404 != 0;
    float _1408 = trunc(_1402);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    bool _1414 = !_1406;
    float _1416 = _1414 ? 7.345489978790283203125 : 1.0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1420 = _1418 != 0;
    float _1422 = float(_1371);
    float _1424 = _1416 * _1394;
    float _1426 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1331);
    int _1428 = int(_1388) + int(_1412);
    float _1430 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1426);
    float _1432 = float(_1319);
    float _1434 = floor(_1424);
    int _1436 = _1355 * _1428;
    int _1438 = _1436 + _1371;
    bool _1440 = _1422 >= _1432;
    bool _1442 = isnan(_1422);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(_1432);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = _1430 * (-0.15915493667125701904296875);
    bool _1454 = uint(_1438) >= uint(_1319);
    float _1456 = trunc(_1450);
    int _1458 = int(_1456);
    bool _1460 = !_1454;
    int _1462 = _1460 ? 0 : (-1);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1466 = _1464 != 0;
    int _1468 = ~_1428;
    int _1470 = _1468 + _1462;
    int _1472 = _1470 + 1;
    float _1474 = -_1434;
    float _1476 = _1424 + _1474;
    float _1478 = _128 * _1432;
    bool _1480 = !_1466;
    int _1482 = _1480 ? 0 : 1;
    float _1484 = in.m_81.y;
    float _1486 = _1476 * _1432;
    int _1488 = _1319 * _1472;
    int _1490 = _1488 + _1371;
    float _1492 = _1478 * _172;
    int _1494 = abs(_1482);
    int _1496 = ~_1458;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    float _1502 = trunc(_1486);
    int _1504 = int(_1502);
    bool _1506 = !_1357;
    int _1508 = _1506 ? _1490 : (-1);
    int _1510 = _1508 * _1500;
    float _1512 = trunc(_1492);
    int _1514 = int(_1512);
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1518 = _1458 * _1359;
    int _1520 = _1518 + _1510;
    int _1522 = abs(_858);
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1526 = _1520 * _1313;
    int _1528 = abs(_862);
    float _1530 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1524);
    bool _1532 = !_1311;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1504 * _1494;
    int _1538 = _1536 + _1371;
    int _1540 = abs(_1534);
    float _1542 = -_1484;
    float _1544 = _1542 + 1.0;
    int _1546 = _1514 * _1522;
    int _1548 = _1546 + _1526;
    bool _1550 = _1396 > 0.5;
    int _1552 = _1538 * _1528;
    int _1554 = _1552 + _1548;
    float _1556 = as_type<float>(_1540);
    float _1558 = _1484;
    float _1560 = _1204;
    if (_1329)
    {
        float _1562 = in.m_55.x;
        _1556 = _1562;
    }
    float _1564 = _1556;
    int _1566 = _1504 * _1540;
    int _1568 = _1566 + _1554;
    if (_1323)
    {
        float _1570 = _1550 ? _1544 : _1484;
        _1558 = _1570;
    }
    float _1572 = _1558;
    float _1574 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1578 = float(uint(_1568));
    float _1580 = -_1516;
    float _1582 = fma(_1574, 2.0, _1580);
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1586 = _1584 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1588 = as_type<float>(_1373) * _1578;
    float _1590 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1596 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.5);
    bool _1604 = _1600 || _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1610 = fma(_1590, -2.0, _1576);
    float _1612 = trunc(_1588);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1622 = 1.0 / _1586;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1630 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1620);
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1634 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1636 = _1365 * int(_1616);
    int _1638 = _1636 + _1568;
    float _1640 = 1.0 / _1594;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1646;
    float _1650 = float(uint(_1638));
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1656 = _1564 > 0.5;
    bool _1658 = _1656 && _1329;
    float _1660 = 1.0 / _1608;
    out.m_83.x = _1634;
    out.m_83.y = _1642;
    out.m_83.z = _1644;
    out.m_83.w = _1632;
    float _1662 = as_type<float>(_1373) * _1650;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1664;
    float _1668 = _1654 * _1622;
    float _1670 = in.m_81.x;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1674 = _318 + _1672;
    float _1676 = float(uint(_1538));
    float _1678 = trunc(_1662);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    float _1684 = _1648 * _1640;
    float _1686 = -_128;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1582);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1692 = _318 + _1690;
    float _1694 = fma(_1684, _1674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1696 = ~_1319;
    int _1698 = _1696 + 1;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1702 = _318 + _1700;
    float _1704 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1530);
    float _1706 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1610);
    float _1708 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1630);
    float _1710 = fma(_1668, _1702, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1712 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1714 = isnan(_318);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1720 = _1716 || _1718;
    float _1722 = float(_1720);
    float _1724 = _1666 * _1660;
    bool _1726 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1728 = isnan(_318);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1734 = _1730 || _1732;
    float _1736 = float(_1734);
    int _1738 = int(_1616) + int(_1682);
    float _1740 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1742 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1744 = isnan(_318);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1722;
    float _1756 = _1754 + 1.0;
    float _1758 = -_1736;
    float _1760 = _1758 + 1.0;
    float _1762 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1740);
    int _1764 = _1698 * _1738;
    int _1766 = _1764 + _1568;
    float _1768 = -_1752;
    float _1770 = _1768 + 1.0;
    float _1772 = _1736 * _1756;
    float _1774 = _1752 * _1760;
    float _1776 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1762);
    float _1778 = fma(_1724, _1692, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1780 = uint(_1766) >= uint(_1319);
    float _1782 = _1347 * _1770;
    float _1784 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1788 = !_1780;
    int _1790 = _1788 ? 0 : (-1);
    float _1792 = _1694 * _1782;
    float _1794 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1796 = _1784;
    float _1798 = _1670;
    if (!_1329)
    {
        _1796 = _1670;
    }
    float _1800 = _1796;
    float _1802 = 1.0 / _1786;
    float _1804 = _1800;
    if (_1658)
    {
        float _1806 = -_1670;
        float _1808 = _1806 + 1.0;
        _1798 = _1808;
    }
    float _1810 = _1798;
    int _1812 = ~_1738;
    int _1814 = _1812 + _1790;
    int _1816 = _1814 + 1;
    float _1818 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1794);
    float _1820 = -_1347;
    float _1822 = _1820 + 1.0;
    float _1824 = as_type<float>(_1373) * _1676;
    if (_1329)
    {
        _1804 = _1810;
    }
    float _1826 = _1804;
    int _1828 = _1319 * _1816;
    int _1830 = _1828 + _1568;
    float _1832 = _1452 * 6.283185482025146484375;
    float _1834 = sin(_1832);
    float _1836 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1838 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1792);
    float _1840 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1842 = !_1357;
    int _1844 = _1842 ? _1830 : (-1);
    float _1846 = _1836 + _1786;
    float _1848 = fma(_1710, _1774, _1838);
    float _1850 = _1452 * 6.283185482025146484375;
    float _1852 = cos(_1850);
    int _1854 = _1844 >> 31;
    float _1856 = _1846 * _1802;
    float _1858 = _1856 * 0.5;
    int _1860 = ~_1319;
    int _1862 = _1860 + 1;
    float _1864 = fma(_1778, _1772, _1848);
    int _1866 = _1854 & 3;
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1868);
    int _1872 = _1844 & 3;
    bool _1874 = _1872 != 0;
    float _1876 = trunc(_1824);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = _1834 * _1618;
    int _1884 = _1844 + _1866;
    int _1886 = _1844 & 3;
    bool _1888 = _1886 != 0;
    int _1890 = ~_1319;
    int _1892 = _1890 + 1;
    float _1894 = _1852 * _1618;
    float _1896 = -_1882;
    float _1898 = fma(_1852, _1840, _1896);
    bool _1900 = uint(_1886) > 1u;
    float _1902 = 1.0 / _1870;
    float _1904 = fma(_1834, _1840, _1894);
    int _1906 = _1884 >> 2;
    float _1908 = fma(_1704, _1898, _1688);
    int _1910 = _1862 * int(_1880);
    int _1912 = _1910 + _1538;
    int _1914 = _1906 << 4;
    int _1916 = _1914 + 368;
    float _1918 = -_1706;
    float _1920 = fma(_1708, _1904, _1918);
    float _1922 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1864);
    uint _1924 = uint(int(uint(_1916) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    float _1940 = float(uint(_1912));
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1946 = _1908 + 0.5;
    float _1948 = as_type<float>(_1373) * _1940;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1952 = _1902 * _1950;
    int _1954 = _1916 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = trunc(_1948);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1984 = abs(_1952);
    float _1986 = log2(_1984);
    int _1988 = _1874 ? 0 : 1;
    float _1990 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1920 + 0.5;
    float _1994 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1996 = uint(_1886) >= 2u;
    bool _1998 = !_1888;
    int _2000 = _1998 ? 0 : 1;
    out.m_85.x = _1946;
    out.m_85.y = _1992;
    int _2002 = int(_1880) + int(_1976);
    int _2004 = ~_1988;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    out.m_87.x = _1978;
    out.m_87.y = _1980;
    out.m_87.z = _1990;
    out.m_87.w = _1994;
    int _2010 = _2008;
    if (!_1900)
    {
        int _2012 = ~_1988;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    int _2018 = _1892 * _2002;
    int _2020 = _2018 + _1538;
    bool _2022 = _1886 != 3;
    float _2024 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2026 = abs(_2016);
    int _2028 = _1996 ? 0 : 1;
    bool _2030 = uint(_2020) >= uint(_1319);
    float _2032 = exp2(_2024);
    int _2034 = abs(_2000);
    int _2036 = ~_2026;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = ~_2028;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = ~_2034;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    int _2054 = _2040 * as_type<int>(_1938);
    int _2056 = _2046;
    if (_2022)
    {
        int _2058 = ~_2028;
        int _2060 = _2058 + 1;
        _2056 = _2060;
    }
    int _2062 = _2056;
    bool _2064 = !_2030;
    int _2066 = _2064 ? 0 : (-1);
    float _2068 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2070 = precise::clamp(_2068, 0.0, 1.0);
    bool _2072 = _1886 != 3;
    int _2074 = _2052 * as_type<int>(_1930);
    int _2076 = _2074 + _2054;
    int _2078 = abs(_2062);
    bool _2080 = !_1420;
    int _2082 = _2080 ? 0 : 1;
    float _2084 = in.m_89.x;
    float _2086 = in.m_89.y;
    float _2088 = in.m_89.z;
    bool _2090 = !_2072;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = ~_2002;
    int _2096 = _2094 + _2066;
    int _2098 = _2096 + 1;
    int _2100 = ~_2078;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = abs(_2082);
    int _2108 = _1319 * _2098;
    int _2110 = _2108 + _1538;
    int _2112 = abs(_2092);
    int _2114 = _2104 * as_type<int>(_1962);
    int _2116 = _2114 + _2076;
    bool _2118 = _768 != 0.0;
    bool _2120 = isnan(_768);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(0.0);
    bool _2126 = _2122 || _2124;
    int _2128 = ~_2112;
    int _2130 = _2128 + 1;
    int _2132 = _2130 + 1;
    float _2134 = fma(_2070, -2.0, 3.0);
    bool _2136 = _770 == 0.0;
    bool _2138 = !_2126;
    bool _2140 = _2136 && _2138;
    float _2142 = _2070 * _2070;
    int _2144 = ~_2106;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = _2132 * as_type<int>(_1970);
    int _2152 = _2150 + _2116;
    bool _2154 = _772 == 0.0;
    bool _2156 = _2154 && _2140;
    float _2158 = _2142 * _2134;
    bool _2160 = _1952 <= 8000.0;
    bool _2162 = isnan(_1952);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan(8000.0);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    int _2172 = _2152 * _2148;
    bool _2174 = !_1357;
    int _2176 = _2174 ? _2110 : (-1);
    float _2178 = -_2158;
    float _2180 = _2178 + 1.0;
    int _2182 = _2176 * _2106;
    int _2184 = _2182 + _2172;
    float _2186 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2158);
    float _2188 = _2086;
    float _2190 = _2084;
    float _2192 = _2088;
    if (!_2156)
    {
        float _2194 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2188 = _2194;
    }
    float _2196 = _2188;
    float _2198 = float(_2184);
    float _2200 = _2170 * _2186;
    float _2202 = in.m_63.x;
    float _2204 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2156)
    {
        float _2206 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2084);
        _2190 = _2206;
    }
    float _2208 = _2190;
    float _2210 = _718 * _2196;
    if (!_2156)
    {
        float _2212 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2088);
        _2192 = _2212;
    }
    float _2214 = _2192;
    float _2216 = _716 * _2196;
    float _2218 = _710 * _2196;
    float _2220 = fma(_802, _2208, _2210);
    float _2222 = exp2(_2204);
    float _2224 = fma(_800, _2208, _2216);
    out.m_91.x = _2198;
    float _2226 = fma(_434, _2214, _2220);
    float _2228 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _2230 = fma(_798, _2208, _2218);
    float _2232 = _1204 * 0.5;
    float _2234 = fma(_410, _2214, _2224);
    float _2236 = _2228 + _1204;
    float _2238 = fma(_412, _2214, _2230);
    float _2240 = _1238 + _1204;
    float _2242 = fma(_1248, -0.5, _2232);
    float _2244 = _2232;
    float _2246 = _2242;
    if (_1604)
    {
        _874 = 1.0;
    }
    float _2248 = _874;
    float _2250 = _2236 * 0.5;
    float _2252 = _2240 * 0.5;
    float _2254 = _2248;
    float _2256 = _2252;
    if (_1604)
    {
        _2244 = 1.0;
    }
    float _2258 = _2244;
    float _2260 = _2258;
    if (!_1604)
    {
        float _2262 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = _2264 * 6.283185482025146484375;
        float _2268 = cos(_2266);
        float _2270 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2272 = _2270 * 0.15915493667125701904296875;
        float _2274 = _2264 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = 1.0 / _2268;
        float _2280 = _2272 * 6.283185482025146484375;
        float _2282 = cos(_2280);
        float _2284 = _2276 * _2278;
        float _2286 = _2272 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2282 * _2284;
        float _2292 = 1.0 / _2290;
        float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2296 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2294;
        float _2298 = 1.0 / _2296;
        float _2300 = _2288 * _2292;
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2304 = fma(_1952, _2300, _2302);
        float _2306 = _2304 * _2298;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2260 = _2308;
    }
    float _2310 = _2260;
    if (!_1604)
    {
        float _2312 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2322 = _2320 * 0.15915493667125701904296875;
        float _2324 = _2314 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = 1.0 / _2318;
        float _2330 = _2322 * 6.283185482025146484375;
        float _2332 = cos(_2330);
        float _2334 = _2326 * _2328;
        float _2336 = _2322 * 6.283185482025146484375;
        float _2338 = sin(_2336);
        float _2340 = _2332 * _2334;
        float _2342 = 1.0 / _2340;
        float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2346 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2344;
        float _2348 = 1.0 / _2346;
        float _2350 = _2338 * _2342;
        float _2352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2354 = fma(_1952, _2350, _2352);
        float _2356 = _2354 * _2348;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = -_2358;
        float _2362 = _2360 + 1.0;
        _2254 = _2362;
    }
    float _2364 = _2254;
    float _2366 = -_2222;
    float _2368 = _2366 + 1.0;
    float _2370 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2372 = -_1266;
    float _2374 = _2372 + 1.0;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1238;
    out.gl_Position.y = _1248;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _1204;
    float _2378 = _2374 * _2370;
    float _2380 = precise::clamp(_2378, 0.0, 1.0);
    bool _2382 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2384 = isnan(_968);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2390 = _2386 || _2388;
    float _2392 = _2376 * _1276;
    float _2394 = in.m_63.z;
    float _2396 = -_2380;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2400 = _1297 * _2392;
    out.m_93.x = _2234;
    out.m_93.y = _2226;
    out.m_93.z = _2238;
    float _2402 = _2398 * _2202;
    out.m_95.x = _934;
    out.m_95.y = _930;
    out.m_95.z = _938;
    float _2404 = _2402 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2406 = _1287 * _2392;
    float _2408 = -_2376;
    float _2410 = _2408 + 1.0;
    out.m_97.x = _2252;
    out.m_97.y = _2242;
    out.m_97.z = _2250;
    out.m_97.w = _1204;
    float _2412 = _2406;
    if (!_2390)
    {
        _1560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2414 = _1560;
    float _2416 = fma(_1293, _2406, _1281);
    float _2418 = fma(_1295, _2406, _1283);
    float _2420 = _1287 * _2410;
    float _2422 = fma(_1287, _2400, _1285);
    out.m_99.x = _2404;
    float _2424 = _2310 * _2364;
    float _2426 = _2414;
    float _2428 = _2414;
    if (!_2390)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2430 = _2412;
    out.m_101.x = _2416;
    out.m_101.y = _2418;
    out.m_101.z = _2422;
    out.m_101.w = _2420;
    float _2432 = _2424 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2434 = _2432;
    float _2436 = _2430;
    float _2438 = _2430;
    if (!_2390)
    {
        _2246 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2440 = _2246;
    float _2442 = _2432 * _2394;
    float _2444 = _2394;
    float _2446 = _2440;
    float _2448 = _2440;
    if (!_2390)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2450 = _2256;
    float _2452 = _2450;
    float _2454 = _2450;
    if (!_2390)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2456 = _2444;
    float _2458 = _2456;
    float _2460 = _2456;
    if (!_2390)
    {
        _2434 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2462 = _2434;
    bool _2464 = !_2390;
    float _2466 = _2462;
    float _2468 = _2462;
    if (!_2464)
    {
        bool _2470 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2472 = isnan(_968);
        bool _2474 = _2470 || _2472;
        bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2478 = _2474 || _2476;
        if (!_2478)
        {
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2482 = _968 + _2480;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2486 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2484;
            float _2488 = 1.0 / _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2510 = _2482 * _2488;
            float _2512 = precise::clamp(_2510, 0.0, 1.0);
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = fma(_2512, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2520 = fma(_2512, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2522 = fma(_2512, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2524 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2526 = fma(_2512, _2504, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2528 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2454 = _2520;
            _2460 = _2526;
            _2448 = _2518;
            _2438 = _2524;
            _2428 = _2522;
            _2468 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2534 = isnan(_968);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                _2446 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2542 = _2446;
            _2448 = _2542;
            if (!_2540)
            {
                _2452 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2544 = _2452;
            _2454 = _2544;
            if (!_2540)
            {
                _2426 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2546 = _2426;
            _2428 = _2546;
            if (!_2540)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2548 = _2436;
            _2438 = _2548;
            if (!_2540)
            {
                _2458 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2550 = _2458;
            _2460 = _2550;
            if (!_2540)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2552 = _2466;
            bool _2554 = !_2540;
            _2468 = _2552;
            if (!_2554)
            {
                bool _2556 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2558 = isnan(_968);
                bool _2560 = _2556 || _2558;
                bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2564 = _2560 || _2562;
                if (!_2564)
                {
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2568 = _968 + _2566;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2572 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2570;
                    float _2574 = 1.0 / _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2596 = _2568 * _2574;
                    float _2598 = precise::clamp(_2596, 0.0, 1.0);
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = fma(_2598, _2578, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2606 = fma(_2598, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2598, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2610 = fma(_2598, _2586, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2612 = fma(_2598, _2590, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2614 = fma(_2598, _2594, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2454 = _2606;
                    _2460 = _2612;
                    _2448 = _2604;
                    _2438 = _2610;
                    _2428 = _2608;
                    _2468 = _2614;
                    _2530 = true;
                }
                else
                {
                    _2454 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2460 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2448 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2428 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2530 = false;
    float _2616 = _2454;
    float _2618 = _2460;
    float _2620 = _2448;
    float _2622 = _2438;
    float _2624 = _2428;
    float _2626 = _2468;
    float _2628 = fma(_2226, -0.5, 0.5);
    float _2630 = precise::clamp(_2628, 0.0, 1.0);
    float _2632 = -_2616;
    float _2634 = _2632 + _2618;
    float _2636 = -_2620;
    float _2638 = _2636 + _2622;
    out.m_103.x = 0.0;
    float _2640 = fma(_2630, _2634, _2616);
    float _2642 = -_2624;
    float _2644 = _2642 + _2626;
    float _2646 = fma(_2630, _2638, _2620);
    float _2648 = _2640 * 0.586610972881317138671875;
    bool _2650 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2652 = fma(_2630, _2644, _2624);
    float _2654 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2656 = fma(_2646, 0.298911988735198974609375, _2648);
    bool _2658 = _2310 > 0.0;
    bool _2660 = isnan(_2310);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan(0.0);
    bool _2666 = _2662 || _2664;
    float _2668 = fma(_2652, 0.114477999508380889892578125, _2656);
    out.m_53.x = _2654;
    bool _2670 = _2364 <= 0.0;
    bool _2672 = !_2666;
    bool _2674 = _2670 || _2672;
    float _2676 = -_2668;
    float _2678 = _2646 + _2676;
    float _2680 = -_2668;
    float _2682 = _2640 + _2680;
    float _2684 = -_2668;
    float _2686 = _2652 + _2684;
    float _2688 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    bool _2694 = !_2650;
    if (!_2694)
    {
        float _2696 = -_930;
        float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2700 = -_934;
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2704 = -_938;
        float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2708 = _2698 * _2698;
        float _2710 = fma(_2702, _2702, _2708);
        float _2712 = fma(_2706, _2706, _2710);
        float _2714 = sqrt(_2712);
        float _2716 = rsqrt(_2712);
        float _2718 = -_2714;
        float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2722 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = _2702 * _2716;
        float _2728 = _2698 * _2716;
        float _2730 = abs(_2724);
        float _2732 = log2(_2730);
        float _2734 = _2706 * _2716;
        float _2736 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2738 = _2226 * _2728;
        float _2740 = -_2728;
        float _2742 = -_2736;
        float _2744 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2742);
        float _2746 = fma(_2234, _2726, _2738);
        float _2748 = -_2734;
        float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2744);
        float _2752 = fma(_2238, _2734, _2746);
        float _2754 = precise::clamp(_2752, 0.0, 1.0);
        float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2758 = _2750 + _2756;
        float _2760 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2762 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2764 = precise::clamp(_2762, 0.0, 1.0);
        float _2766 = exp2(_2760);
        float _2768 = _2766 * _2764;
        float _2770 = _2754 * _2768;
        float _2772 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2774 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2776 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2772;
        out.m_103.y = _2774;
        out.m_103.z = _2776;
    }
    out.m_75.x = _2688;
    out.m_75.y = _2690;
    out.m_75.z = _2692;
    if (!_2674)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2778 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2778;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2530 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_144);
        out.gl_Position.z = _2846;
    }
    if (!_132)
    {
        return out;
    }
    bool _148 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_119);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = float(_124);
    bool _160 = _128 >= _158;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    if (_164)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _136;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _146 = as_type<int>(_168);
    }
    int _170 = _146;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_170);
        out.gl_Position.z = _2901;
    }
    if (_164)
    {
        return out;
    }
    float _172 = 1.0 / _158;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _128 * _172;
    bool _178 = !_174;
    float _180 = _176;
    float _198;
    if (!_178)
    {
        float _182 = in.m_55.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        _198 = _176;
    }
    _200 = false;
    float _202 = _198;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    bool _208 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _210 = isnan(_202);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = 1.0 / _222;
    bool _226 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_202);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -_218;
    float _240 = _238 + 1.0;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _246;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _252;
    float _256 = _236 * _240;
    float _258 = -_236;
    float _260 = _258 + 1.0;
    float _262 = _206 * _224;
    float _264 = in.m_57.x;
    float _266 = in.m_57.y;
    float _268 = in.m_57.z;
    float _270 = fma(_244, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _272 = fma(_254, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = fma(_248, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _276 = _270 * _256;
    float _278 = _272 * _256;
    float _280 = _274 * _256;
    float _282 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].x, _276);
    float _284 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _286 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].z, _280);
    float _288 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].x, _282);
    float _290 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].y, _284);
    float _292 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].z, _286);
    float _294 = _288 * _264;
    float _296 = _290 * _266;
    float _298 = _292 * _268;
    bool _300 = !_250;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _180 = _316;
    }
    float _318 = _180;
    float _320 = in.m_46.x;
    float _322 = in.m_46.y;
    float _324 = in.m_46.z;
    float _326 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = in.m_59.w;
    float _336 = _326 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _338 = in.m_61.x;
    float _340 = in.m_61.y;
    float _342 = in.m_61.z;
    float _344 = in.m_61.w;
    float _346 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _348 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _350 = in.m_63.y;
    float _352 = _322 * _330;
    float _354 = _322 * _340;
    float _356 = fma(_320, _328, _352);
    float _358 = fma(_320, _338, _354);
    float _360 = _322 + _350;
    float _362 = fma(_324, _332, _356);
    float _364 = fma(_324, _342, _358);
    float _366 = -_360;
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _370 = _362 + _334;
    float _372 = _364 + _344;
    float _374 = _368 * _368;
    float _376 = -_370;
    float _378 = _376 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _380 = -_372;
    float _382 = _380 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _384 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _386 = fma(_378, _378, _374);
    float _388 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _390 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _392 = -_384;
    float _394 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _392);
    float _396 = fma(_382, _382, _386);
    float _398 = -_388;
    float _400 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _398);
    float _402 = -_390;
    float _404 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _402);
    float _406 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _408 = rsqrt(_396);
    float _410 = _378 * _408;
    float _412 = _382 * _408;
    float _414 = _410 * _410;
    float _416 = fma(_412, _412, _414);
    float _418 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _420 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _422 = rsqrt(_416);
    float _424 = -_418;
    float _426 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _424);
    float _428 = _400 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _430 = -_406;
    float _432 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _430);
    float _434 = _368 * _408;
    float _436 = _404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _438 = -_428;
    float _440 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].y, _438);
    float _442 = -_420;
    float _444 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _442);
    float _446 = _404 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _448 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].w, _440);
    float _450 = -_436;
    float _452 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _450);
    float _454 = -_446;
    float _456 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].x, _454);
    float _458 = _412 * _422;
    float _460 = _410 * _422;
    float _462 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].w, _456);
    float _464 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].w, _452);
    float _466 = -_458;
    float _468 = _412 * _466;
    float _470 = -_458;
    float _472 = _434 * _470;
    float _474 = _462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _476 = -_468;
    float _478 = fma(_410, _460, _476);
    float _480 = _434 * _460;
    float _482 = -_474;
    float _484 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _482);
    float _486 = _444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _488 = _478 * _478;
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _484);
    float _492 = -_486;
    float _494 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _492);
    float _496 = fma(_480, _480, _488);
    float _498 = _404 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _500 = _404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _502 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _494);
    float _504 = fma(_472, _472, _496);
    float _506 = -_500;
    float _508 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _506);
    float _510 = -_502;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].w, _490);
    float _514 = -_498;
    float _516 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].x, _514);
    float _518 = _400 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _520 = rsqrt(_504);
    float _522 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].w, _508);
    float _524 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].w, _516);
    float _526 = -_518;
    float _528 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].y, _526);
    float _530 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].w, _528);
    float _532 = 1.0 / _512;
    float _534 = _478 * _520;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = -_536;
    float _540 = _538 + 1.0;
    float _542 = fma(_524, _532, -1.0);
    float _544 = _540 * _532;
    float _546 = fma(_540, _542, 1.0);
    float _548 = _530 * _544;
    float _550 = _522 * _544;
    float _552 = _546 * _546;
    float _554 = fma(_548, _548, _552);
    float _556 = in.m_65.x;
    float _558 = in.m_65.y;
    float _560 = in.m_65.z;
    float _562 = in.m_65.w;
    float _564 = fma(_550, _550, _554);
    float _566 = rsqrt(_564);
    float _568 = _550 * _566;
    float _570 = _546 * _566;
    float _572 = _322 * _558;
    float _574 = _548 * _566;
    float _576 = -_568;
    float _578 = _410 * _576;
    float _580 = fma(_320, _556, _572);
    float _582 = _412 * _570;
    float _584 = -_574;
    float _586 = -_578;
    float _588 = fma(_412, _584, _586);
    float _590 = -_574;
    float _592 = _434 * _590;
    float _594 = fma(_324, _560, _580);
    float _596 = -_568;
    float _598 = -_582;
    float _600 = fma(_434, _596, _598);
    float _602 = _588 * _588;
    float _604 = -_592;
    float _606 = fma(_410, _570, _604);
    float _608 = _594 + _562;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _370 + _610;
    float _614 = fma(_600, _600, _602);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _372 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _608 + _620;
    float _624 = fma(_606, _606, _614);
    float _626 = _622 * _622;
    float _628 = rsqrt(_624);
    float _630 = fma(_612, _612, _626);
    float _632 = fma(_618, _618, _630);
    float _634 = sqrt(_632);
    float _636 = _600 * _628;
    float _638 = _606 * _628;
    float _640 = rsqrt(_632);
    float _642 = _588 * _628;
    float _644 = _412 * _636;
    float _646 = _434 * _638;
    float _648 = -_644;
    float _650 = fma(_410, _638, _648);
    float _652 = _634 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _654 = -_646;
    float _656 = fma(_412, _642, _654);
    float _658 = _410 * _642;
    float _660 = _650 * _650;
    float _662 = precise::min(_336, _652);
    float _664 = -_658;
    float _666 = fma(_434, _636, _664);
    float _668 = fma(_656, _656, _660);
    float _670 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.934999942779541015625);
    float _672 = _640 * _662;
    float _674 = fma(_666, _666, _668);
    float _676 = precise::min(_670, 3.0);
    float _678 = _622 * _672;
    float _680 = rsqrt(_674);
    float _682 = _612 * _672;
    float _684 = -_678;
    float _686 = _622 + _684;
    float _688 = -_682;
    float _690 = _612 + _688;
    float _692 = _686 * _686;
    float _694 = fma(_676, 15.384601593017578125, -45.153804779052734375);
    float _696 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 4.870999813079833984375);
    float _698 = in.m_67.x;
    float _700 = in.m_67.y;
    float _702 = in.m_67.z;
    float _704 = fma(_690, _690, _692);
    float _706 = _618 * _672;
    float _708 = precise::min(_696, 5.0);
    float _710 = _666 * _680;
    float _712 = -_706;
    float _714 = _618 + _712;
    float _716 = _656 * _680;
    float _718 = _650 * _680;
    float _720 = _410 * _710;
    float _722 = fma(_714, _714, _704);
    float _724 = fma(_708, -7.751926898956298828125, 38.75963592529296875);
    float _726 = _412 * _718;
    float _728 = -_720;
    float _730 = fma(_412, _716, _728);
    float _732 = _434 * _716;
    float _734 = _694 * _724;
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = sqrt(_722);
    float _740 = -_726;
    float _742 = fma(_434, _710, _740);
    float _744 = _730 * _730;
    float _746 = -_732;
    float _748 = fma(_410, _718, _746);
    float _750 = _736 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _752 = fma(_742, _742, _744);
    float _754 = -_700;
    float _756 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[191].y, _754);
    float _758 = -_698;
    float _760 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[191].y, _758);
    float _762 = -_702;
    float _764 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[191].y, _762);
    float _766 = fma(_748, _748, _752);
    float _768 = fma(_750, _756, _700);
    float _770 = fma(_750, _760, _698);
    float _772 = fma(_750, _764, _702);
    float _774 = rsqrt(_766);
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _778 = _640 * _738;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    float _782 = _346 * _778;
    float _784 = _326 * _778;
    float _786 = _348 * _778;
    float _788 = _782 * _776;
    float _790 = _784 * _780;
    float _792 = _772 * _786;
    float _794 = _788 * _710;
    float _796 = _788 * _716;
    float _798 = _748 * _774;
    float _800 = _742 * _774;
    float _802 = _730 * _774;
    float _804 = fma(_790, _798, _794);
    float _806 = fma(_790, _800, _796);
    float _808 = fma(_792, _412, _804);
    float _810 = fma(_792, _410, _806);
    float _812 = _788 * _718;
    float _814 = _372 + _808;
    float _816 = _370 + _810;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _814 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _824 = _816 + _822;
    float _826 = _820 * _820;
    float _828 = fma(_824, _824, _826);
    float _830 = fma(_790, _802, _812);
    float _832 = sqrt(_828);
    float _834 = fma(_792, _434, _830);
    float _836 = _360 + _834;
    bool _838 = _832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    bool _852 = !_846;
    int _854 = _852 ? 0 : 1;
    bool _856 = !_842;
    int _858 = _856 ? 0 : 1;
    bool _860 = !_850;
    int _862 = _860 ? 0 : 1;
    float _864 = _812;
    float _866 = _792;
    float _868 = _816;
    float _870 = _682;
    float _872 = _820;
    float _874 = _412;
    if (!_838)
    {
        _864 = _814;
    }
    float _876 = _864;
    float _878 = _876;
    if (!_838)
    {
        _866 = _836;
    }
    float _880 = _866;
    bool _882 = !_838;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _832 + _888;
        float _892 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = _890 * _886;
        float _896 = rsqrt(_828);
        float _898 = _894 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = _896 * _910;
        float _916 = fma(_836, _902, _912);
        float _918 = fma(_824, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_820, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _916;
        _868 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _868;
    float _926 = _878;
    float _928 = -_678;
    float _930 = _928 + _922;
    float _932 = -_682;
    float _934 = _932 + _924;
    float _936 = -_706;
    float _938 = _936 + _926;
    float _940 = -_682;
    float _942 = _370 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _930 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _934 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _938 + _952;
    float _956 = -_706;
    float _958 = _372 + _956;
    float _960 = _946 * _946;
    float _962 = fma(_950, _950, _960);
    float _964 = fma(_954, _954, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _972 = _950 * _970;
    float _974 = _954 * _970;
    float _976 = _972 * _972;
    float _978 = _974 * _974;
    float _980 = _976 + _978;
    float _982 = sqrt(_980);
    bool _984 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _982 + _986;
    float _990 = _962;
    float _992 = _980;
    float _994 = _988;
    float _996 = _946;
    if (_984)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _990 = _998;
    }
    float _1000 = _990;
    if (!_984)
    {
        _870 = _972;
    }
    float _1002 = _870;
    float _1004 = _1002;
    if (_984)
    {
        float _1006 = rsqrt(_980);
        _992 = _1006;
    }
    float _1008 = _992;
    float _1010 = _1000;
    if (_984)
    {
        float _1012 = _988 * _1000;
        _994 = _1012;
    }
    float _1014 = _994;
    if (_984)
    {
        float _1016 = _1014 * 0.15915493667125701904296875;
        _872 = _1016;
    }
    float _1018 = _872;
    float _1020 = _954;
    float _1022 = _1018;
    if (_984)
    {
        float _1024 = _1018 * 6.283185482025146484375;
        float _1026 = sin(_1024);
        _1020 = _1026;
    }
    float _1028 = _1020;
    float _1030 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1032 = precise::max(0.0, _1030);
    float _1034 = _966;
    if (_984)
    {
        float _1036 = _1018 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        _1034 = _1038;
    }
    float _1040 = _1034;
    float _1042 = -_970;
    float _1044 = -_1032;
    float _1046 = fma(_946, _1042, _1044);
    float _1048 = _1046;
    if (_984)
    {
        float _1050 = _1046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1050;
    }
    float _1052 = _996;
    float _1054 = _1052;
    if (!_984)
    {
        _1022 = _978;
    }
    float _1056 = _1022;
    float _1058 = _1028;
    float _1060 = _1056;
    if (_984)
    {
        float _1062 = fma(_1028, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1010 = _1062;
    }
    float _1064 = _1010;
    float _1066 = _1064;
    if (!_984)
    {
        _1058 = _974;
    }
    float _1068 = _1058;
    float _1070 = _1068;
    if (_984)
    {
        float _1072 = _1040 + (-1.0);
        _1054 = _1072;
    }
    float _1074 = _1054;
    float _1076 = 0.0;
    if (_984)
    {
        float _1078 = _1008 * _1064;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1084 = _930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_984)
    {
        float _1086 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1086;
    }
    float _1088 = _1066;
    float _1090 = _1088;
    if (_984)
    {
        float _1092 = _972 * _1080;
        _1004 = _1092;
    }
    float _1094 = _1004;
    if (_984)
    {
        float _1096 = _974 * _1080;
        _1070 = _1096;
    }
    float _1098 = _1070;
    float _1100 = _930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_984)
    {
        float _1102 = fma(_1046, _1040, _1088);
        _1048 = _1102;
    }
    float _1104 = _1048;
    if (!_984)
    {
        _1090 = _976;
    }
    float _1106 = _1090;
    float _1108 = _1106;
    if (_984)
    {
        float _1110 = _1094 * _1094;
        _1108 = _1110;
    }
    float _1112 = _1108;
    if (_984)
    {
        float _1114 = _1098 * _1098;
        _1060 = _1114;
    }
    float _1116 = _1060;
    float _1118 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1120 = _930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = fma(_1104, _1104, _1112);
    float _1124 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1126 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1128 = _1122 + _1116;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1132 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1130);
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1124);
    float _1138 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1140 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1084);
    float _1142 = -_1134;
    float _1144 = _1142 + 1.0;
    float _1146 = rsqrt(_1128);
    float _1148 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1150 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1152 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1140);
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1158 = _930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = abs(_1144);
    float _1162 = log2(_1160);
    float _1164 = -_1156;
    float _1166 = fma(_1164, _1152, 1.0);
    float _1168 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1172 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1174 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1170);
    float _1176 = _1146 * _1094;
    float _1178 = floor(_1118);
    float _1180 = _1146 * _1104;
    float _1182 = _1146 * _1098;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1172);
    float _1188 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1190 = -_1184;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1190);
    float _1194 = floor(_1082);
    float _1196 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1186);
    float _1198 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1200 = -_1182;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1192);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1196);
    float _1206 = fma(_1202, -0.5, 0.5);
    float _1208 = -_1178;
    float _1210 = _1118 + _1208;
    float _1212 = log2(_1166);
    float _1214 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1216 = fma(_1202, 0.5, 0.5);
    float _1218 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1214);
    float _1220 = fma(_1216, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1222 = -_1194;
    float _1224 = _1082 + _1222;
    float _1226 = 1.0 / _1204;
    float _1228 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1230 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1218);
    float _1232 = _1180 + 1.0;
    float _1234 = fma(_1216, _1220, -0.212114393711090087890625);
    float _1236 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1228);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1230);
    float _1240 = exp2(_1198);
    float _1242 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1236);
    float _1244 = fma(_1216, _1234, 1.570728778839111328125);
    float _1246 = _1212 * 0.693147182464599609375;
    float _1248 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1252 = sqrt(_1206);
    float _1254 = _1238 * _1226;
    float _1256 = _1248 * _1226;
    float _1258 = fma(_1254, 0.5, 0.5);
    float _1260 = fma(_1256, -0.5, 0.5);
    float _1262 = -_1180;
    float _1264 = fma(_1240, _1232, _1262);
    float2 _4676 = float2(_1210, _1224);
    float _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4676, float2(0.0), isnan(_4676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4676, float2(0.0), isnan(_4676)), level(0.0)).x;
    float _1268 = fma(_1264, 0.5, 0.5);
    float _1270 = _1252 * 0.636619746685028076171875;
    float _1272 = -_1244;
    float _1274 = fma(_1270, _1272, 1.0);
    float3 _4697 = float3(_1258, _1260, _1250);
    float _1276 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4697, float3(0.0), isnan(_4697)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4697, float3(0.0), isnan(_4697)), level(0.0)).x;
    float3 _4708 = float3(_1258, _1260, _1250);
    float4 _1279 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4708, float3(0.0), isnan(_4708)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4708, float3(0.0), isnan(_4708)), level(0.0)).xyzw;
    float _1281 = _1279.x;
    float _1283 = _1279.y;
    float _1285 = _1279.z;
    float _1287 = _1279.w;
    float2 _4724 = float2(_1274, _1268);
    float3 _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4724, float2(0.0), isnan(_4724)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4724, float2(0.0), isnan(_4724)), level(0.0)).xyz;
    float _1293 = _1291.x;
    float _1295 = _1291.y;
    float _1297 = _1291.z;
    float _1299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1301 = int(_1299);
    float _1303 = in.m_69.w;
    float _1305 = -_678;
    float _1307 = _1305 + _360;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1311 = _1309 != 0;
    out.m_71.x = _750;
    int _1313 = abs(_854);
    float _1315 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1317 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1319 = int(_1317);
    out.m_73.x = _942;
    out.m_73.y = _1307;
    out.m_73.z = _958;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1323 = _1321 != 0;
    float _1325 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1315);
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1329 = _1327 != 0;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    out.m_75.w = _662;
    float _1333 = float(_1301);
    float _1335 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1325);
    bool _1337 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1339 = isnan(_318);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    out.m_77.x = _784;
    float _1349 = 1.0 / _1333;
    float _1351 = float(uint(_1319));
    out.m_79.w = _1303;
    int _1353 = ~_1319;
    int _1355 = _1353 + 1;
    bool _1357 = _1319 == 0;
    int _1359 = _1319 + (-1);
    float _1361 = 1.0 / _1351;
    int _1363 = ~_1319;
    int _1365 = _1363 + 1;
    float _1367 = _128 * _1349;
    float _1369 = trunc(_1367);
    int _1371 = int(_1369);
    int _1373 = as_type<int>(_1361) + (-2);
    float _1375 = float(uint(_1371));
    float _1377 = as_type<float>(_1373) * _1375;
    int _1379 = ~_1319;
    int _1381 = _1379 + 1;
    float _1383 = trunc(_1377);
    float _1385 = precise::max(_1383, 0.0);
    uint _1388 = uint(_1385);
    int _1390 = _1381 * int(_1388);
    int _1392 = _1390 + _1371;
    float _1394 = in.m_55.x;
    float _1396 = in.m_55.y;
    float _1398 = in.m_55.z;
    float _1400 = float(uint(_1392));
    float _1402 = as_type<float>(_1373) * _1400;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1406 = _1404 != 0;
    float _1408 = trunc(_1402);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    bool _1414 = !_1406;
    float _1416 = _1414 ? 7.345489978790283203125 : 1.0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1420 = _1418 != 0;
    float _1422 = float(_1371);
    float _1424 = _1416 * _1394;
    float _1426 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1331);
    int _1428 = int(_1388) + int(_1412);
    float _1430 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1426);
    float _1432 = float(_1319);
    float _1434 = floor(_1424);
    int _1436 = _1355 * _1428;
    int _1438 = _1436 + _1371;
    bool _1440 = _1422 >= _1432;
    bool _1442 = isnan(_1422);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(_1432);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = _1430 * (-0.15915493667125701904296875);
    bool _1454 = uint(_1438) >= uint(_1319);
    float _1456 = trunc(_1450);
    int _1458 = int(_1456);
    bool _1460 = !_1454;
    int _1462 = _1460 ? 0 : (-1);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1466 = _1464 != 0;
    int _1468 = ~_1428;
    int _1470 = _1468 + _1462;
    int _1472 = _1470 + 1;
    float _1474 = -_1434;
    float _1476 = _1424 + _1474;
    float _1478 = _128 * _1432;
    bool _1480 = !_1466;
    int _1482 = _1480 ? 0 : 1;
    float _1484 = in.m_81.y;
    float _1486 = _1476 * _1432;
    int _1488 = _1319 * _1472;
    int _1490 = _1488 + _1371;
    float _1492 = _1478 * _172;
    int _1494 = abs(_1482);
    int _1496 = ~_1458;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    float _1502 = trunc(_1486);
    int _1504 = int(_1502);
    bool _1506 = !_1357;
    int _1508 = _1506 ? _1490 : (-1);
    int _1510 = _1508 * _1500;
    float _1512 = trunc(_1492);
    int _1514 = int(_1512);
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1518 = _1458 * _1359;
    int _1520 = _1518 + _1510;
    int _1522 = abs(_858);
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1526 = _1520 * _1313;
    int _1528 = abs(_862);
    float _1530 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1524);
    bool _1532 = !_1311;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1504 * _1494;
    int _1538 = _1536 + _1371;
    int _1540 = abs(_1534);
    float _1542 = -_1484;
    float _1544 = _1542 + 1.0;
    int _1546 = _1514 * _1522;
    int _1548 = _1546 + _1526;
    bool _1550 = _1396 > 0.5;
    int _1552 = _1538 * _1528;
    int _1554 = _1552 + _1548;
    float _1556 = as_type<float>(_1540);
    float _1558 = _1484;
    float _1560 = _1204;
    if (_1329)
    {
        float _1562 = in.m_55.x;
        _1556 = _1562;
    }
    float _1564 = _1556;
    int _1566 = _1504 * _1540;
    int _1568 = _1566 + _1554;
    if (_1323)
    {
        float _1570 = _1550 ? _1544 : _1484;
        _1558 = _1570;
    }
    float _1572 = _1558;
    float _1574 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1578 = float(uint(_1568));
    float _1580 = -_1516;
    float _1582 = fma(_1574, 2.0, _1580);
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1586 = _1584 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1588 = as_type<float>(_1373) * _1578;
    float _1590 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1596 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.5);
    bool _1604 = _1600 || _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1610 = fma(_1590, -2.0, _1576);
    float _1612 = trunc(_1588);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1622 = 1.0 / _1586;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1630 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1620);
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1634 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1636 = _1365 * int(_1616);
    int _1638 = _1636 + _1568;
    float _1640 = 1.0 / _1594;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1646;
    float _1650 = float(uint(_1638));
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1656 = _1564 > 0.5;
    bool _1658 = _1656 && _1329;
    float _1660 = 1.0 / _1608;
    out.m_83.x = _1634;
    out.m_83.y = _1642;
    out.m_83.z = _1644;
    out.m_83.w = _1632;
    float _1662 = as_type<float>(_1373) * _1650;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1664;
    float _1668 = _1654 * _1622;
    float _1670 = in.m_81.x;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1674 = _318 + _1672;
    float _1676 = float(uint(_1538));
    float _1678 = trunc(_1662);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    float _1684 = _1648 * _1640;
    float _1686 = -_128;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1582);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1692 = _318 + _1690;
    float _1694 = fma(_1684, _1674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1696 = ~_1319;
    int _1698 = _1696 + 1;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1702 = _318 + _1700;
    float _1704 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1530);
    float _1706 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1610);
    float _1708 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1630);
    float _1710 = fma(_1668, _1702, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1712 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1714 = isnan(_318);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1720 = _1716 || _1718;
    float _1722 = float(_1720);
    float _1724 = _1666 * _1660;
    bool _1726 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1728 = isnan(_318);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1734 = _1730 || _1732;
    float _1736 = float(_1734);
    int _1738 = int(_1616) + int(_1682);
    float _1740 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1742 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1744 = isnan(_318);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1722;
    float _1756 = _1754 + 1.0;
    float _1758 = -_1736;
    float _1760 = _1758 + 1.0;
    float _1762 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1740);
    int _1764 = _1698 * _1738;
    int _1766 = _1764 + _1568;
    float _1768 = -_1752;
    float _1770 = _1768 + 1.0;
    float _1772 = _1736 * _1756;
    float _1774 = _1752 * _1760;
    float _1776 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1762);
    float _1778 = fma(_1724, _1692, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1780 = uint(_1766) >= uint(_1319);
    float _1782 = _1347 * _1770;
    float _1784 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1788 = !_1780;
    int _1790 = _1788 ? 0 : (-1);
    float _1792 = _1694 * _1782;
    float _1794 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1796 = _1784;
    float _1798 = _1670;
    if (!_1329)
    {
        _1796 = _1670;
    }
    float _1800 = _1796;
    float _1802 = 1.0 / _1786;
    float _1804 = _1800;
    if (_1658)
    {
        float _1806 = -_1670;
        float _1808 = _1806 + 1.0;
        _1798 = _1808;
    }
    float _1810 = _1798;
    int _1812 = ~_1738;
    int _1814 = _1812 + _1790;
    int _1816 = _1814 + 1;
    float _1818 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1794);
    float _1820 = -_1347;
    float _1822 = _1820 + 1.0;
    float _1824 = as_type<float>(_1373) * _1676;
    if (_1329)
    {
        _1804 = _1810;
    }
    float _1826 = _1804;
    int _1828 = _1319 * _1816;
    int _1830 = _1828 + _1568;
    float _1832 = _1452 * 6.283185482025146484375;
    float _1834 = sin(_1832);
    float _1836 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1838 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1792);
    float _1840 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1842 = !_1357;
    int _1844 = _1842 ? _1830 : (-1);
    float _1846 = _1836 + _1786;
    float _1848 = fma(_1710, _1774, _1838);
    float _1850 = _1452 * 6.283185482025146484375;
    float _1852 = cos(_1850);
    int _1854 = _1844 >> 31;
    float _1856 = _1846 * _1802;
    float _1858 = _1856 * 0.5;
    int _1860 = ~_1319;
    int _1862 = _1860 + 1;
    float _1864 = fma(_1778, _1772, _1848);
    int _1866 = _1854 & 3;
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1868);
    int _1872 = _1844 & 3;
    bool _1874 = _1872 != 0;
    float _1876 = trunc(_1824);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = _1834 * _1618;
    int _1884 = _1844 + _1866;
    int _1886 = _1844 & 3;
    bool _1888 = _1886 != 0;
    int _1890 = ~_1319;
    int _1892 = _1890 + 1;
    float _1894 = _1852 * _1618;
    float _1896 = -_1882;
    float _1898 = fma(_1852, _1840, _1896);
    bool _1900 = uint(_1886) > 1u;
    float _1902 = 1.0 / _1870;
    float _1904 = fma(_1834, _1840, _1894);
    int _1906 = _1884 >> 2;
    float _1908 = fma(_1704, _1898, _1688);
    int _1910 = _1862 * int(_1880);
    int _1912 = _1910 + _1538;
    int _1914 = _1906 << 4;
    int _1916 = _1914 + 368;
    float _1918 = -_1706;
    float _1920 = fma(_1708, _1904, _1918);
    float _1922 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1864);
    uint _1924 = uint(int(uint(_1916) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    float _1940 = float(uint(_1912));
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1946 = _1908 + 0.5;
    float _1948 = as_type<float>(_1373) * _1940;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1952 = _1902 * _1950;
    int _1954 = _1916 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = trunc(_1948);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1984 = abs(_1952);
    float _1986 = log2(_1984);
    int _1988 = _1874 ? 0 : 1;
    float _1990 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1920 + 0.5;
    float _1994 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1996 = uint(_1886) >= 2u;
    bool _1998 = !_1888;
    int _2000 = _1998 ? 0 : 1;
    out.m_85.x = _1946;
    out.m_85.y = _1992;
    int _2002 = int(_1880) + int(_1976);
    int _2004 = ~_1988;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    out.m_87.x = _1978;
    out.m_87.y = _1980;
    out.m_87.z = _1990;
    out.m_87.w = _1994;
    int _2010 = _2008;
    if (!_1900)
    {
        int _2012 = ~_1988;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    int _2018 = _1892 * _2002;
    int _2020 = _2018 + _1538;
    bool _2022 = _1886 != 3;
    float _2024 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2026 = abs(_2016);
    int _2028 = _1996 ? 0 : 1;
    bool _2030 = uint(_2020) >= uint(_1319);
    float _2032 = exp2(_2024);
    int _2034 = abs(_2000);
    int _2036 = ~_2026;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = ~_2028;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = ~_2034;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    int _2054 = _2040 * as_type<int>(_1938);
    int _2056 = _2046;
    if (_2022)
    {
        int _2058 = ~_2028;
        int _2060 = _2058 + 1;
        _2056 = _2060;
    }
    int _2062 = _2056;
    bool _2064 = !_2030;
    int _2066 = _2064 ? 0 : (-1);
    float _2068 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2070 = precise::clamp(_2068, 0.0, 1.0);
    bool _2072 = _1886 != 3;
    int _2074 = _2052 * as_type<int>(_1930);
    int _2076 = _2074 + _2054;
    int _2078 = abs(_2062);
    bool _2080 = !_1420;
    int _2082 = _2080 ? 0 : 1;
    float _2084 = in.m_89.x;
    float _2086 = in.m_89.y;
    float _2088 = in.m_89.z;
    bool _2090 = !_2072;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = ~_2002;
    int _2096 = _2094 + _2066;
    int _2098 = _2096 + 1;
    int _2100 = ~_2078;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = abs(_2082);
    int _2108 = _1319 * _2098;
    int _2110 = _2108 + _1538;
    int _2112 = abs(_2092);
    int _2114 = _2104 * as_type<int>(_1962);
    int _2116 = _2114 + _2076;
    bool _2118 = _768 != 0.0;
    bool _2120 = isnan(_768);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(0.0);
    bool _2126 = _2122 || _2124;
    int _2128 = ~_2112;
    int _2130 = _2128 + 1;
    int _2132 = _2130 + 1;
    float _2134 = fma(_2070, -2.0, 3.0);
    bool _2136 = _770 == 0.0;
    bool _2138 = !_2126;
    bool _2140 = _2136 && _2138;
    float _2142 = _2070 * _2070;
    int _2144 = ~_2106;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = _2132 * as_type<int>(_1970);
    int _2152 = _2150 + _2116;
    bool _2154 = _772 == 0.0;
    bool _2156 = _2154 && _2140;
    float _2158 = _2142 * _2134;
    bool _2160 = _1952 <= 8000.0;
    bool _2162 = isnan(_1952);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan(8000.0);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    int _2172 = _2152 * _2148;
    bool _2174 = !_1357;
    int _2176 = _2174 ? _2110 : (-1);
    float _2178 = -_2158;
    float _2180 = _2178 + 1.0;
    int _2182 = _2176 * _2106;
    int _2184 = _2182 + _2172;
    float _2186 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2158);
    float _2188 = _2086;
    float _2190 = _2084;
    float _2192 = _2088;
    if (!_2156)
    {
        float _2194 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2188 = _2194;
    }
    float _2196 = _2188;
    float _2198 = float(_2184);
    float _2200 = _2170 * _2186;
    float _2202 = in.m_63.x;
    float _2204 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2156)
    {
        float _2206 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2084);
        _2190 = _2206;
    }
    float _2208 = _2190;
    float _2210 = _718 * _2196;
    if (!_2156)
    {
        float _2212 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2088);
        _2192 = _2212;
    }
    float _2214 = _2192;
    float _2216 = _716 * _2196;
    float _2218 = _710 * _2196;
    float _2220 = fma(_802, _2208, _2210);
    float _2222 = exp2(_2204);
    float _2224 = fma(_800, _2208, _2216);
    out.m_91.x = _2198;
    float _2226 = fma(_434, _2214, _2220);
    float _2228 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _2230 = fma(_798, _2208, _2218);
    float _2232 = _1204 * 0.5;
    float _2234 = fma(_410, _2214, _2224);
    float _2236 = _2228 + _1204;
    float _2238 = fma(_412, _2214, _2230);
    float _2240 = _1238 + _1204;
    float _2242 = fma(_1248, -0.5, _2232);
    float _2244 = _2232;
    float _2246 = _2242;
    if (_1604)
    {
        _874 = 1.0;
    }
    float _2248 = _874;
    float _2250 = _2236 * 0.5;
    float _2252 = _2240 * 0.5;
    float _2254 = _2248;
    float _2256 = _2252;
    if (_1604)
    {
        _2244 = 1.0;
    }
    float _2258 = _2244;
    float _2260 = _2258;
    if (!_1604)
    {
        float _2262 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = _2264 * 6.283185482025146484375;
        float _2268 = cos(_2266);
        float _2270 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2272 = _2270 * 0.15915493667125701904296875;
        float _2274 = _2264 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = 1.0 / _2268;
        float _2280 = _2272 * 6.283185482025146484375;
        float _2282 = cos(_2280);
        float _2284 = _2276 * _2278;
        float _2286 = _2272 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2282 * _2284;
        float _2292 = 1.0 / _2290;
        float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2296 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2294;
        float _2298 = 1.0 / _2296;
        float _2300 = _2288 * _2292;
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2304 = fma(_1952, _2300, _2302);
        float _2306 = _2304 * _2298;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2260 = _2308;
    }
    float _2310 = _2260;
    if (!_1604)
    {
        float _2312 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2322 = _2320 * 0.15915493667125701904296875;
        float _2324 = _2314 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = 1.0 / _2318;
        float _2330 = _2322 * 6.283185482025146484375;
        float _2332 = cos(_2330);
        float _2334 = _2326 * _2328;
        float _2336 = _2322 * 6.283185482025146484375;
        float _2338 = sin(_2336);
        float _2340 = _2332 * _2334;
        float _2342 = 1.0 / _2340;
        float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2346 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2344;
        float _2348 = 1.0 / _2346;
        float _2350 = _2338 * _2342;
        float _2352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2354 = fma(_1952, _2350, _2352);
        float _2356 = _2354 * _2348;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = -_2358;
        float _2362 = _2360 + 1.0;
        _2254 = _2362;
    }
    float _2364 = _2254;
    float _2366 = -_2222;
    float _2368 = _2366 + 1.0;
    float _2370 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2372 = -_1266;
    float _2374 = _2372 + 1.0;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1238;
    out.gl_Position.y = _1248;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _1204;
    float _2378 = _2374 * _2370;
    float _2380 = precise::clamp(_2378, 0.0, 1.0);
    bool _2382 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2384 = isnan(_968);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2390 = _2386 || _2388;
    float _2392 = _2376 * _1276;
    float _2394 = in.m_63.z;
    float _2396 = -_2380;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2400 = _1297 * _2392;
    out.m_93.x = _2234;
    out.m_93.y = _2226;
    out.m_93.z = _2238;
    float _2402 = _2398 * _2202;
    out.m_95.x = _934;
    out.m_95.y = _930;
    out.m_95.z = _938;
    float _2404 = _2402 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2406 = _1287 * _2392;
    float _2408 = -_2376;
    float _2410 = _2408 + 1.0;
    out.m_97.x = _2252;
    out.m_97.y = _2242;
    out.m_97.z = _2250;
    out.m_97.w = _1204;
    float _2412 = _2406;
    if (!_2390)
    {
        _1560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2414 = _1560;
    float _2416 = fma(_1293, _2406, _1281);
    float _2418 = fma(_1295, _2406, _1283);
    float _2420 = _1287 * _2410;
    float _2422 = fma(_1287, _2400, _1285);
    out.m_99.x = _2404;
    float _2424 = _2310 * _2364;
    float _2426 = _2414;
    float _2428 = _2414;
    if (!_2390)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2430 = _2412;
    out.m_101.x = _2416;
    out.m_101.y = _2418;
    out.m_101.z = _2422;
    out.m_101.w = _2420;
    float _2432 = _2424 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2434 = _2432;
    float _2436 = _2430;
    float _2438 = _2430;
    if (!_2390)
    {
        _2246 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2440 = _2246;
    float _2442 = _2432 * _2394;
    float _2444 = _2394;
    float _2446 = _2440;
    float _2448 = _2440;
    if (!_2390)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2450 = _2256;
    float _2452 = _2450;
    float _2454 = _2450;
    if (!_2390)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2456 = _2444;
    float _2458 = _2456;
    float _2460 = _2456;
    if (!_2390)
    {
        _2434 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2462 = _2434;
    bool _2464 = !_2390;
    float _2466 = _2462;
    float _2468 = _2462;
    if (!_2464)
    {
        bool _2470 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2472 = isnan(_968);
        bool _2474 = _2470 || _2472;
        bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2478 = _2474 || _2476;
        if (!_2478)
        {
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2482 = _968 + _2480;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2486 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2484;
            float _2488 = 1.0 / _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2510 = _2482 * _2488;
            float _2512 = precise::clamp(_2510, 0.0, 1.0);
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = fma(_2512, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2520 = fma(_2512, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2522 = fma(_2512, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2524 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2526 = fma(_2512, _2504, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2528 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2454 = _2520;
            _2460 = _2526;
            _2448 = _2518;
            _2438 = _2524;
            _2428 = _2522;
            _2468 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2534 = isnan(_968);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                _2446 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2542 = _2446;
            _2448 = _2542;
            if (!_2540)
            {
                _2452 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2544 = _2452;
            _2454 = _2544;
            if (!_2540)
            {
                _2426 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2546 = _2426;
            _2428 = _2546;
            if (!_2540)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2548 = _2436;
            _2438 = _2548;
            if (!_2540)
            {
                _2458 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2550 = _2458;
            _2460 = _2550;
            if (!_2540)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2552 = _2466;
            bool _2554 = !_2540;
            _2468 = _2552;
            if (!_2554)
            {
                bool _2556 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2558 = isnan(_968);
                bool _2560 = _2556 || _2558;
                bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2564 = _2560 || _2562;
                if (!_2564)
                {
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2568 = _968 + _2566;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2572 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2570;
                    float _2574 = 1.0 / _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2596 = _2568 * _2574;
                    float _2598 = precise::clamp(_2596, 0.0, 1.0);
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = fma(_2598, _2578, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2606 = fma(_2598, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2598, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2610 = fma(_2598, _2586, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2612 = fma(_2598, _2590, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2614 = fma(_2598, _2594, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2454 = _2606;
                    _2460 = _2612;
                    _2448 = _2604;
                    _2438 = _2610;
                    _2428 = _2608;
                    _2468 = _2614;
                    _2530 = true;
                }
                else
                {
                    _2454 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2460 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2448 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2428 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2530 = false;
    float _2616 = _2454;
    float _2618 = _2460;
    float _2620 = _2448;
    float _2622 = _2438;
    float _2624 = _2428;
    float _2626 = _2468;
    float _2628 = fma(_2226, -0.5, 0.5);
    float _2630 = precise::clamp(_2628, 0.0, 1.0);
    float _2632 = -_2616;
    float _2634 = _2632 + _2618;
    float _2636 = -_2620;
    float _2638 = _2636 + _2622;
    out.m_103.x = 0.0;
    float _2640 = fma(_2630, _2634, _2616);
    float _2642 = -_2624;
    float _2644 = _2642 + _2626;
    float _2646 = fma(_2630, _2638, _2620);
    float _2648 = _2640 * 0.586610972881317138671875;
    bool _2650 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2652 = fma(_2630, _2644, _2624);
    float _2654 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2656 = fma(_2646, 0.298911988735198974609375, _2648);
    bool _2658 = _2310 > 0.0;
    bool _2660 = isnan(_2310);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan(0.0);
    bool _2666 = _2662 || _2664;
    float _2668 = fma(_2652, 0.114477999508380889892578125, _2656);
    out.m_53.x = _2654;
    bool _2670 = _2364 <= 0.0;
    bool _2672 = !_2666;
    bool _2674 = _2670 || _2672;
    float _2676 = -_2668;
    float _2678 = _2646 + _2676;
    float _2680 = -_2668;
    float _2682 = _2640 + _2680;
    float _2684 = -_2668;
    float _2686 = _2652 + _2684;
    float _2688 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    bool _2694 = !_2650;
    if (!_2694)
    {
        float _2696 = -_930;
        float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2700 = -_934;
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2704 = -_938;
        float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2708 = _2698 * _2698;
        float _2710 = fma(_2702, _2702, _2708);
        float _2712 = fma(_2706, _2706, _2710);
        float _2714 = sqrt(_2712);
        float _2716 = rsqrt(_2712);
        float _2718 = -_2714;
        float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2722 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = _2702 * _2716;
        float _2728 = _2698 * _2716;
        float _2730 = abs(_2724);
        float _2732 = log2(_2730);
        float _2734 = _2706 * _2716;
        float _2736 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2738 = _2226 * _2728;
        float _2740 = -_2728;
        float _2742 = -_2736;
        float _2744 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2742);
        float _2746 = fma(_2234, _2726, _2738);
        float _2748 = -_2734;
        float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2744);
        float _2752 = fma(_2238, _2734, _2746);
        float _2754 = precise::clamp(_2752, 0.0, 1.0);
        float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2758 = _2750 + _2756;
        float _2760 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2762 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2764 = precise::clamp(_2762, 0.0, 1.0);
        float _2766 = exp2(_2760);
        float _2768 = _2766 * _2764;
        float _2770 = _2754 * _2768;
        float _2772 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2774 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2776 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2772;
        out.m_103.y = _2774;
        out.m_103.z = _2776;
    }
    out.m_75.x = _2688;
    out.m_75.y = _2690;
    out.m_75.z = _2692;
    if (!_2674)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2778 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2778;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2530 = false;
    bool _200 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = in.m_48.w;
    float _121 = trunc(_117);
    int _124 = int(_121);
    float _126 = -_119;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _128;
    bool _132 = _124 >= 1;
    float _134 = 0.0;
    float _136 = as_type<float>(_124);
    if (!_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _134;
    if (!_132)
    {
        out.m_53.x = 0.0;
    }
    int _140 = 0;
    if (!_132)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    int _146 = _144;
    if (!_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2846 = as_type<float>(_144);
        out.gl_Position.z = _2846;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _148 = _119 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_119);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = float(_124);
    bool _160 = _128 >= _158;
    bool _162 = !_156;
    bool _164 = _160 || _162;
    if (_164)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _136;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _168 = _166 * 5.0;
        _146 = as_type<int>(_168);
    }
    int _170 = _146;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2901 = as_type<float>(_170);
        out.gl_Position.z = _2901;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = 1.0 / _158;
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _176 = _128 * _172;
    bool _178 = !_174;
    float _180 = _176;
    float _198;
    if (!_178)
    {
        float _182 = in.m_55.x;
        float _184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _188 = fma(_186, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _190 = _188 * _184;
        float _192 = floor(_190);
        float _194 = -_192;
        float _196 = _190 + _194;
        _198 = _196;
        _200 = true;
    }
    else
    {
        _198 = _176;
    }
    _200 = false;
    float _202 = _198;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = _202 + _204;
    bool _208 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _210 = isnan(_202);
    bool _212 = _208 || _210;
    bool _214 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _216 = _212 || _214;
    float _218 = float(_216);
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = 1.0 / _222;
    bool _226 = _202 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_202);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -_218;
    float _240 = _238 + 1.0;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _246;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _252;
    float _256 = _236 * _240;
    float _258 = -_236;
    float _260 = _258 + 1.0;
    float _262 = _206 * _224;
    float _264 = in.m_57.x;
    float _266 = in.m_57.y;
    float _268 = in.m_57.z;
    float _270 = fma(_244, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _272 = fma(_254, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = fma(_248, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _276 = _270 * _256;
    float _278 = _272 * _256;
    float _280 = _274 * _256;
    float _282 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].x, _276);
    float _284 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].y, _278);
    float _286 = fma(_260, (*spvDescriptorSet0.vp_c9)._m0[143].z, _280);
    float _288 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].x, _282);
    float _290 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].y, _284);
    float _292 = fma(_218, (*spvDescriptorSet0.vp_c9)._m0[144].z, _286);
    float _294 = _288 * _264;
    float _296 = _290 * _266;
    float _298 = _292 * _268;
    bool _300 = !_250;
    if (!_300)
    {
        float _302 = in.m_55.x;
        float _304 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _306 = _302 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _308 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _310 = _308 * _304;
        float _312 = floor(_310);
        float _314 = -_312;
        float _316 = _310 + _314;
        _180 = _316;
    }
    float _318 = _180;
    float _320 = in.m_46.x;
    float _322 = in.m_46.y;
    float _324 = in.m_46.z;
    float _326 = _294 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = in.m_59.w;
    float _336 = _326 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _338 = in.m_61.x;
    float _340 = in.m_61.y;
    float _342 = in.m_61.z;
    float _344 = in.m_61.w;
    float _346 = _296 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _348 = _298 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _350 = in.m_63.y;
    float _352 = _322 * _330;
    float _354 = _322 * _340;
    float _356 = fma(_320, _328, _352);
    float _358 = fma(_320, _338, _354);
    float _360 = _322 + _350;
    float _362 = fma(_324, _332, _356);
    float _364 = fma(_324, _342, _358);
    float _366 = -_360;
    float _368 = _366 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _370 = _362 + _334;
    float _372 = _364 + _344;
    float _374 = _368 * _368;
    float _376 = -_370;
    float _378 = _376 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _380 = -_372;
    float _382 = _380 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _384 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _386 = fma(_378, _378, _374);
    float _388 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _390 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _392 = -_384;
    float _394 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _392);
    float _396 = fma(_382, _382, _386);
    float _398 = -_388;
    float _400 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _398);
    float _402 = -_390;
    float _404 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _402);
    float _406 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _408 = rsqrt(_396);
    float _410 = _378 * _408;
    float _412 = _382 * _408;
    float _414 = _410 * _410;
    float _416 = fma(_412, _412, _414);
    float _418 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _420 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _422 = rsqrt(_416);
    float _424 = -_418;
    float _426 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _424);
    float _428 = _400 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _430 = -_406;
    float _432 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _430);
    float _434 = _368 * _408;
    float _436 = _404 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _438 = -_428;
    float _440 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].y, _438);
    float _442 = -_420;
    float _444 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _442);
    float _446 = _404 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _448 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].w, _440);
    float _450 = -_436;
    float _452 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[1].x, _450);
    float _454 = -_446;
    float _456 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[1].x, _454);
    float _458 = _412 * _422;
    float _460 = _410 * _422;
    float _462 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[1].w, _456);
    float _464 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].w, _452);
    float _466 = -_458;
    float _468 = _412 * _466;
    float _470 = -_458;
    float _472 = _434 * _470;
    float _474 = _462 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _476 = -_468;
    float _478 = fma(_410, _460, _476);
    float _480 = _434 * _460;
    float _482 = -_474;
    float _484 = fma(_448, (*spvDescriptorSet0.vp_c8)._m0[0].x, _482);
    float _486 = _444 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _488 = _478 * _478;
    float _490 = fma(_464, (*spvDescriptorSet0.vp_c8)._m0[0].z, _484);
    float _492 = -_486;
    float _494 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[1].x, _492);
    float _496 = fma(_480, _480, _488);
    float _498 = _404 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _500 = _404 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _502 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[1].z, _494);
    float _504 = fma(_472, _472, _496);
    float _506 = -_500;
    float _508 = fma(_400, (*spvDescriptorSet0.vp_c8)._m0[0].x, _506);
    float _510 = -_502;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c8)._m0[0].w, _490);
    float _514 = -_498;
    float _516 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].x, _514);
    float _518 = _400 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _520 = rsqrt(_504);
    float _522 = fma(_432, (*spvDescriptorSet0.vp_c8)._m0[0].w, _508);
    float _524 = fma(_444, (*spvDescriptorSet0.vp_c8)._m0[0].w, _516);
    float _526 = -_518;
    float _528 = fma(_394, (*spvDescriptorSet0.vp_c8)._m0[0].y, _526);
    float _530 = fma(_426, (*spvDescriptorSet0.vp_c8)._m0[0].w, _528);
    float _532 = 1.0 / _512;
    float _534 = _478 * _520;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = -_536;
    float _540 = _538 + 1.0;
    float _542 = fma(_524, _532, -1.0);
    float _544 = _540 * _532;
    float _546 = fma(_540, _542, 1.0);
    float _548 = _530 * _544;
    float _550 = _522 * _544;
    float _552 = _546 * _546;
    float _554 = fma(_548, _548, _552);
    float _556 = in.m_65.x;
    float _558 = in.m_65.y;
    float _560 = in.m_65.z;
    float _562 = in.m_65.w;
    float _564 = fma(_550, _550, _554);
    float _566 = rsqrt(_564);
    float _568 = _550 * _566;
    float _570 = _546 * _566;
    float _572 = _322 * _558;
    float _574 = _548 * _566;
    float _576 = -_568;
    float _578 = _410 * _576;
    float _580 = fma(_320, _556, _572);
    float _582 = _412 * _570;
    float _584 = -_574;
    float _586 = -_578;
    float _588 = fma(_412, _584, _586);
    float _590 = -_574;
    float _592 = _434 * _590;
    float _594 = fma(_324, _560, _580);
    float _596 = -_568;
    float _598 = -_582;
    float _600 = fma(_434, _596, _598);
    float _602 = _588 * _588;
    float _604 = -_592;
    float _606 = fma(_410, _570, _604);
    float _608 = _594 + _562;
    float _610 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _612 = _370 + _610;
    float _614 = fma(_600, _600, _602);
    float _616 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _618 = _372 + _616;
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _608 + _620;
    float _624 = fma(_606, _606, _614);
    float _626 = _622 * _622;
    float _628 = rsqrt(_624);
    float _630 = fma(_612, _612, _626);
    float _632 = fma(_618, _618, _630);
    float _634 = sqrt(_632);
    float _636 = _600 * _628;
    float _638 = _606 * _628;
    float _640 = rsqrt(_632);
    float _642 = _588 * _628;
    float _644 = _412 * _636;
    float _646 = _434 * _638;
    float _648 = -_644;
    float _650 = fma(_410, _638, _648);
    float _652 = _634 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _654 = -_646;
    float _656 = fma(_412, _642, _654);
    float _658 = _410 * _642;
    float _660 = _650 * _650;
    float _662 = precise::min(_336, _652);
    float _664 = -_658;
    float _666 = fma(_434, _636, _664);
    float _668 = fma(_656, _656, _660);
    float _670 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 2.934999942779541015625);
    float _672 = _640 * _662;
    float _674 = fma(_666, _666, _668);
    float _676 = precise::min(_670, 3.0);
    float _678 = _622 * _672;
    float _680 = rsqrt(_674);
    float _682 = _612 * _672;
    float _684 = -_678;
    float _686 = _622 + _684;
    float _688 = -_682;
    float _690 = _612 + _688;
    float _692 = _686 * _686;
    float _694 = fma(_676, 15.384601593017578125, -45.153804779052734375);
    float _696 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, 4.870999813079833984375);
    float _698 = in.m_67.x;
    float _700 = in.m_67.y;
    float _702 = in.m_67.z;
    float _704 = fma(_690, _690, _692);
    float _706 = _618 * _672;
    float _708 = precise::min(_696, 5.0);
    float _710 = _666 * _680;
    float _712 = -_706;
    float _714 = _618 + _712;
    float _716 = _656 * _680;
    float _718 = _650 * _680;
    float _720 = _410 * _710;
    float _722 = fma(_714, _714, _704);
    float _724 = fma(_708, -7.751926898956298828125, 38.75963592529296875);
    float _726 = _412 * _718;
    float _728 = -_720;
    float _730 = fma(_412, _716, _728);
    float _732 = _434 * _716;
    float _734 = _694 * _724;
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = sqrt(_722);
    float _740 = -_726;
    float _742 = fma(_434, _710, _740);
    float _744 = _730 * _730;
    float _746 = -_732;
    float _748 = fma(_410, _718, _746);
    float _750 = _736 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _752 = fma(_742, _742, _744);
    float _754 = -_700;
    float _756 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[191].y, _754);
    float _758 = -_698;
    float _760 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[191].y, _758);
    float _762 = -_702;
    float _764 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[191].y, _762);
    float _766 = fma(_748, _748, _752);
    float _768 = fma(_750, _756, _700);
    float _770 = fma(_750, _760, _698);
    float _772 = fma(_750, _764, _702);
    float _774 = rsqrt(_766);
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _778 = _640 * _738;
    float _780 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _770);
    float _782 = _346 * _778;
    float _784 = _326 * _778;
    float _786 = _348 * _778;
    float _788 = _782 * _776;
    float _790 = _784 * _780;
    float _792 = _772 * _786;
    float _794 = _788 * _710;
    float _796 = _788 * _716;
    float _798 = _748 * _774;
    float _800 = _742 * _774;
    float _802 = _730 * _774;
    float _804 = fma(_790, _798, _794);
    float _806 = fma(_790, _800, _796);
    float _808 = fma(_792, _412, _804);
    float _810 = fma(_792, _410, _806);
    float _812 = _788 * _718;
    float _814 = _372 + _808;
    float _816 = _370 + _810;
    float _818 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _820 = _814 + _818;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _824 = _816 + _822;
    float _826 = _820 * _820;
    float _828 = fma(_824, _824, _826);
    float _830 = fma(_790, _802, _812);
    float _832 = sqrt(_828);
    float _834 = fma(_792, _434, _830);
    float _836 = _360 + _834;
    bool _838 = _832 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _840 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _842 = _840 != 0;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _850 = _848 != 0;
    bool _852 = !_846;
    int _854 = _852 ? 0 : 1;
    bool _856 = !_842;
    int _858 = _856 ? 0 : 1;
    bool _860 = !_850;
    int _862 = _860 ? 0 : 1;
    float _864 = _812;
    float _866 = _792;
    float _868 = _816;
    float _870 = _682;
    float _872 = _820;
    float _874 = _412;
    if (!_838)
    {
        _864 = _814;
    }
    float _876 = _864;
    float _878 = _876;
    if (!_838)
    {
        _866 = _836;
    }
    float _880 = _866;
    bool _882 = !_838;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _832 + _888;
        float _892 = _836 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = _890 * _886;
        float _896 = rsqrt(_828);
        float _898 = _894 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _912 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _914 = _896 * _910;
        float _916 = fma(_836, _902, _912);
        float _918 = fma(_824, _914, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_820, _914, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _916;
        _868 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _868;
    float _926 = _878;
    float _928 = -_678;
    float _930 = _928 + _922;
    float _932 = -_682;
    float _934 = _932 + _924;
    float _936 = -_706;
    float _938 = _936 + _926;
    float _940 = -_682;
    float _942 = _370 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _946 = _930 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _950 = _934 + _948;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _954 = _938 + _952;
    float _956 = -_706;
    float _958 = _372 + _956;
    float _960 = _946 * _946;
    float _962 = fma(_950, _950, _960);
    float _964 = fma(_954, _954, _962);
    float _966 = rsqrt(_964);
    float _968 = sqrt(_964);
    float _970 = _966 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _972 = _950 * _970;
    float _974 = _954 * _970;
    float _976 = _972 * _972;
    float _978 = _974 * _974;
    float _980 = _976 + _978;
    float _982 = sqrt(_980);
    bool _984 = _982 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _988 = _982 + _986;
    float _990 = _962;
    float _992 = _980;
    float _994 = _988;
    float _996 = _946;
    if (_984)
    {
        float _998 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _990 = _998;
    }
    float _1000 = _990;
    if (!_984)
    {
        _870 = _972;
    }
    float _1002 = _870;
    float _1004 = _1002;
    if (_984)
    {
        float _1006 = rsqrt(_980);
        _992 = _1006;
    }
    float _1008 = _992;
    float _1010 = _1000;
    if (_984)
    {
        float _1012 = _988 * _1000;
        _994 = _1012;
    }
    float _1014 = _994;
    if (_984)
    {
        float _1016 = _1014 * 0.15915493667125701904296875;
        _872 = _1016;
    }
    float _1018 = _872;
    float _1020 = _954;
    float _1022 = _1018;
    if (_984)
    {
        float _1024 = _1018 * 6.283185482025146484375;
        float _1026 = sin(_1024);
        _1020 = _1026;
    }
    float _1028 = _1020;
    float _1030 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1032 = precise::max(0.0, _1030);
    float _1034 = _966;
    if (_984)
    {
        float _1036 = _1018 * 6.283185482025146484375;
        float _1038 = cos(_1036);
        _1034 = _1038;
    }
    float _1040 = _1034;
    float _1042 = -_970;
    float _1044 = -_1032;
    float _1046 = fma(_946, _1042, _1044);
    float _1048 = _1046;
    if (_984)
    {
        float _1050 = _1046 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _996 = _1050;
    }
    float _1052 = _996;
    float _1054 = _1052;
    if (!_984)
    {
        _1022 = _978;
    }
    float _1056 = _1022;
    float _1058 = _1028;
    float _1060 = _1056;
    if (_984)
    {
        float _1062 = fma(_1028, _1052, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1010 = _1062;
    }
    float _1064 = _1010;
    float _1066 = _1064;
    if (!_984)
    {
        _1058 = _974;
    }
    float _1068 = _1058;
    float _1070 = _1068;
    if (_984)
    {
        float _1072 = _1040 + (-1.0);
        _1054 = _1072;
    }
    float _1074 = _1054;
    float _1076 = 0.0;
    if (_984)
    {
        float _1078 = _1008 * _1064;
        _1076 = _1078;
    }
    float _1080 = _1076;
    float _1082 = fma(_958, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1084 = _930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    if (_984)
    {
        float _1086 = _1074 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1066 = _1086;
    }
    float _1088 = _1066;
    float _1090 = _1088;
    if (_984)
    {
        float _1092 = _972 * _1080;
        _1004 = _1092;
    }
    float _1094 = _1004;
    if (_984)
    {
        float _1096 = _974 * _1080;
        _1070 = _1096;
    }
    float _1098 = _1070;
    float _1100 = _930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_984)
    {
        float _1102 = fma(_1046, _1040, _1088);
        _1048 = _1102;
    }
    float _1104 = _1048;
    if (!_984)
    {
        _1090 = _976;
    }
    float _1106 = _1090;
    float _1108 = _1106;
    if (_984)
    {
        float _1110 = _1094 * _1094;
        _1108 = _1110;
    }
    float _1112 = _1108;
    if (_984)
    {
        float _1114 = _1098 * _1098;
        _1060 = _1114;
    }
    float _1116 = _1060;
    float _1118 = fma(_942, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1120 = _930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1122 = fma(_1104, _1104, _1112);
    float _1124 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1100);
    float _1126 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1120);
    float _1128 = _1122 + _1116;
    float _1130 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1132 = fma(_968, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1130);
    float _1134 = precise::clamp(_1132, 0.0, 1.0);
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1124);
    float _1138 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1126);
    float _1140 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1084);
    float _1142 = -_1134;
    float _1144 = _1142 + 1.0;
    float _1146 = rsqrt(_1128);
    float _1148 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1150 = _1138 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1152 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1140);
    float _1156 = _1148 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1158 = _930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1160 = abs(_1144);
    float _1162 = log2(_1160);
    float _1164 = -_1156;
    float _1166 = fma(_1164, _1152, 1.0);
    float _1168 = _1154 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1170 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1158);
    float _1172 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1174 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1170);
    float _1176 = _1146 * _1094;
    float _1178 = floor(_1118);
    float _1180 = _1146 * _1104;
    float _1182 = _1146 * _1098;
    float _1184 = _1176 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1186 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1172);
    float _1188 = _1174 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1190 = -_1184;
    float _1192 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1190);
    float _1194 = floor(_1082);
    float _1196 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1186);
    float _1198 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1200 = -_1182;
    float _1202 = fma(_1200, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1192);
    float _1204 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1196);
    float _1206 = fma(_1202, -0.5, 0.5);
    float _1208 = -_1178;
    float _1210 = _1118 + _1208;
    float _1212 = log2(_1166);
    float _1214 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1216 = fma(_1202, 0.5, 0.5);
    float _1218 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1214);
    float _1220 = fma(_1216, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1222 = -_1194;
    float _1224 = _1082 + _1222;
    float _1226 = 1.0 / _1204;
    float _1228 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1230 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1218);
    float _1232 = _1180 + 1.0;
    float _1234 = fma(_1216, _1220, -0.212114393711090087890625);
    float _1236 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1228);
    float _1238 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1230);
    float _1240 = exp2(_1198);
    float _1242 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1236);
    float _1244 = fma(_1216, _1234, 1.570728778839111328125);
    float _1246 = _1212 * 0.693147182464599609375;
    float _1248 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1242);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1252 = sqrt(_1206);
    float _1254 = _1238 * _1226;
    float _1256 = _1248 * _1226;
    float _1258 = fma(_1254, 0.5, 0.5);
    float _1260 = fma(_1256, -0.5, 0.5);
    float _1262 = -_1180;
    float _1264 = fma(_1240, _1232, _1262);
    float2 _4676 = float2(_1210, _1224);
    float _1266 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4676, float2(0.0), isnan(_4676)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4676, float2(0.0), isnan(_4676)), level(0.0)).x;
    float _1268 = fma(_1264, 0.5, 0.5);
    float _1270 = _1252 * 0.636619746685028076171875;
    float _1272 = -_1244;
    float _1274 = fma(_1270, _1272, 1.0);
    float3 _4697 = float3(_1258, _1260, _1250);
    float _1276 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4697, float3(0.0), isnan(_4697)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4697, float3(0.0), isnan(_4697)), level(0.0)).x;
    float3 _4708 = float3(_1258, _1260, _1250);
    float4 _1279 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4708, float3(0.0), isnan(_4708)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4708, float3(0.0), isnan(_4708)), level(0.0)).xyzw;
    float _1281 = _1279.x;
    float _1283 = _1279.y;
    float _1285 = _1279.z;
    float _1287 = _1279.w;
    float2 _4724 = float2(_1274, _1268);
    float3 _1291 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4724, float2(0.0), isnan(_4724)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4724, float2(0.0), isnan(_4724)), level(0.0)).xyz;
    float _1293 = _1291.x;
    float _1295 = _1291.y;
    float _1297 = _1291.z;
    float _1299 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1301 = int(_1299);
    float _1303 = in.m_69.w;
    float _1305 = -_678;
    float _1307 = _1305 + _360;
    int _1309 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1311 = _1309 != 0;
    out.m_71.x = _750;
    int _1313 = abs(_854);
    float _1315 = _1150 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1317 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1319 = int(_1317);
    out.m_73.x = _942;
    out.m_73.y = _1307;
    out.m_73.z = _958;
    int _1321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1323 = _1321 != 0;
    float _1325 = fma(_1168, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1315);
    int _1327 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1329 = _1327 != 0;
    float _1331 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    out.m_75.w = _662;
    float _1333 = float(_1301);
    float _1335 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1325);
    bool _1337 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1339 = isnan(_318);
    bool _1341 = _1337 || _1339;
    bool _1343 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1345 = _1341 || _1343;
    float _1347 = float(_1345);
    out.m_77.x = _784;
    float _1349 = 1.0 / _1333;
    float _1351 = float(uint(_1319));
    out.m_79.w = _1303;
    int _1353 = ~_1319;
    int _1355 = _1353 + 1;
    bool _1357 = _1319 == 0;
    int _1359 = _1319 + (-1);
    float _1361 = 1.0 / _1351;
    int _1363 = ~_1319;
    int _1365 = _1363 + 1;
    float _1367 = _128 * _1349;
    float _1369 = trunc(_1367);
    int _1371 = int(_1369);
    int _1373 = as_type<int>(_1361) + (-2);
    float _1375 = float(uint(_1371));
    float _1377 = as_type<float>(_1373) * _1375;
    int _1379 = ~_1319;
    int _1381 = _1379 + 1;
    float _1383 = trunc(_1377);
    float _1385 = precise::max(_1383, 0.0);
    uint _1388 = uint(_1385);
    int _1390 = _1381 * int(_1388);
    int _1392 = _1390 + _1371;
    float _1394 = in.m_55.x;
    float _1396 = in.m_55.y;
    float _1398 = in.m_55.z;
    float _1400 = float(uint(_1392));
    float _1402 = as_type<float>(_1373) * _1400;
    int _1404 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1406 = _1404 != 0;
    float _1408 = trunc(_1402);
    float _1410 = precise::max(_1408, 0.0);
    uint _1412 = uint(_1410);
    bool _1414 = !_1406;
    float _1416 = _1414 ? 7.345489978790283203125 : 1.0;
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1420 = _1418 != 0;
    float _1422 = float(_1371);
    float _1424 = _1416 * _1394;
    float _1426 = fma(_1398, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1331);
    int _1428 = int(_1388) + int(_1412);
    float _1430 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1426);
    float _1432 = float(_1319);
    float _1434 = floor(_1424);
    int _1436 = _1355 * _1428;
    int _1438 = _1436 + _1371;
    bool _1440 = _1422 >= _1432;
    bool _1442 = isnan(_1422);
    bool _1444 = _1440 || _1442;
    bool _1446 = isnan(_1432);
    bool _1448 = _1444 || _1446;
    float _1450 = float(_1448);
    float _1452 = _1430 * (-0.15915493667125701904296875);
    bool _1454 = uint(_1438) >= uint(_1319);
    float _1456 = trunc(_1450);
    int _1458 = int(_1456);
    bool _1460 = !_1454;
    int _1462 = _1460 ? 0 : (-1);
    int _1464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1466 = _1464 != 0;
    int _1468 = ~_1428;
    int _1470 = _1468 + _1462;
    int _1472 = _1470 + 1;
    float _1474 = -_1434;
    float _1476 = _1424 + _1474;
    float _1478 = _128 * _1432;
    bool _1480 = !_1466;
    int _1482 = _1480 ? 0 : 1;
    float _1484 = in.m_81.y;
    float _1486 = _1476 * _1432;
    int _1488 = _1319 * _1472;
    int _1490 = _1488 + _1371;
    float _1492 = _1478 * _172;
    int _1494 = abs(_1482);
    int _1496 = ~_1458;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    float _1502 = trunc(_1486);
    int _1504 = int(_1502);
    bool _1506 = !_1357;
    int _1508 = _1506 ? _1490 : (-1);
    int _1510 = _1508 * _1500;
    float _1512 = trunc(_1492);
    int _1514 = int(_1512);
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1518 = _1458 * _1359;
    int _1520 = _1518 + _1510;
    int _1522 = abs(_858);
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1526 = _1520 * _1313;
    int _1528 = abs(_862);
    float _1530 = fma(_1394, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1524);
    bool _1532 = !_1311;
    int _1534 = _1532 ? 0 : 1;
    int _1536 = _1504 * _1494;
    int _1538 = _1536 + _1371;
    int _1540 = abs(_1534);
    float _1542 = -_1484;
    float _1544 = _1542 + 1.0;
    int _1546 = _1514 * _1522;
    int _1548 = _1546 + _1526;
    bool _1550 = _1396 > 0.5;
    int _1552 = _1538 * _1528;
    int _1554 = _1552 + _1548;
    float _1556 = as_type<float>(_1540);
    float _1558 = _1484;
    float _1560 = _1204;
    if (_1329)
    {
        float _1562 = in.m_55.x;
        _1556 = _1562;
    }
    float _1564 = _1556;
    int _1566 = _1504 * _1540;
    int _1568 = _1566 + _1554;
    if (_1323)
    {
        float _1570 = _1550 ? _1544 : _1484;
        _1558 = _1570;
    }
    float _1572 = _1558;
    float _1574 = _1394 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1576 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1578 = float(uint(_1568));
    float _1580 = -_1516;
    float _1582 = fma(_1574, 2.0, _1580);
    float _1584 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1586 = _1584 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1588 = as_type<float>(_1373) * _1578;
    float _1590 = _1396 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1592 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1594 = _1592 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1596 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1598 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan(0.5);
    bool _1604 = _1600 || _1602;
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1608 = _1606 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1610 = fma(_1590, -2.0, _1576);
    float _1612 = trunc(_1588);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = fma(_1572, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1620 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1622 = 1.0 / _1586;
    float _1624 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1626 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1630 = fma(_1396, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1620);
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1634 = _1624 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1636 = _1365 * int(_1616);
    int _1638 = _1636 + _1568;
    float _1640 = 1.0 / _1594;
    float _1642 = _1626 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1646;
    float _1650 = float(uint(_1638));
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1654 = _1652 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1656 = _1564 > 0.5;
    bool _1658 = _1656 && _1329;
    float _1660 = 1.0 / _1608;
    out.m_83.x = _1634;
    out.m_83.y = _1642;
    out.m_83.z = _1644;
    out.m_83.w = _1632;
    float _1662 = as_type<float>(_1373) * _1650;
    float _1664 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1666 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1664;
    float _1668 = _1654 * _1622;
    float _1670 = in.m_81.x;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1674 = _318 + _1672;
    float _1676 = float(uint(_1538));
    float _1678 = trunc(_1662);
    float _1680 = precise::max(_1678, 0.0);
    uint _1682 = uint(_1680);
    float _1684 = _1648 * _1640;
    float _1686 = -_128;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1582);
    float _1690 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1692 = _318 + _1690;
    float _1694 = fma(_1684, _1674, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    int _1696 = ~_1319;
    int _1698 = _1696 + 1;
    float _1700 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1702 = _318 + _1700;
    float _1704 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1530);
    float _1706 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1610);
    float _1708 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1630);
    float _1710 = fma(_1668, _1702, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _1712 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1714 = isnan(_318);
    bool _1716 = _1712 || _1714;
    bool _1718 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1720 = _1716 || _1718;
    float _1722 = float(_1720);
    float _1724 = _1666 * _1660;
    bool _1726 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1728 = isnan(_318);
    bool _1730 = _1726 || _1728;
    bool _1732 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1734 = _1730 || _1732;
    float _1736 = float(_1734);
    int _1738 = int(_1616) + int(_1682);
    float _1740 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1742 = _318 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1744 = isnan(_318);
    bool _1746 = _1742 || _1744;
    bool _1748 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1750 = _1746 || _1748;
    float _1752 = float(_1750);
    float _1754 = -_1722;
    float _1756 = _1754 + 1.0;
    float _1758 = -_1736;
    float _1760 = _1758 + 1.0;
    float _1762 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1740);
    int _1764 = _1698 * _1738;
    int _1766 = _1764 + _1568;
    float _1768 = -_1752;
    float _1770 = _1768 + 1.0;
    float _1772 = _1736 * _1756;
    float _1774 = _1752 * _1760;
    float _1776 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1762);
    float _1778 = fma(_1724, _1692, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    bool _1780 = uint(_1766) >= uint(_1319);
    float _1782 = _1347 * _1770;
    float _1784 = _1307 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1786 = _1776 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1788 = !_1780;
    int _1790 = _1788 ? 0 : (-1);
    float _1792 = _1694 * _1782;
    float _1794 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1784);
    float _1796 = _1784;
    float _1798 = _1670;
    if (!_1329)
    {
        _1796 = _1670;
    }
    float _1800 = _1796;
    float _1802 = 1.0 / _1786;
    float _1804 = _1800;
    if (_1658)
    {
        float _1806 = -_1670;
        float _1808 = _1806 + 1.0;
        _1798 = _1808;
    }
    float _1810 = _1798;
    int _1812 = ~_1738;
    int _1814 = _1812 + _1790;
    int _1816 = _1814 + 1;
    float _1818 = fma(_958, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1794);
    float _1820 = -_1347;
    float _1822 = _1820 + 1.0;
    float _1824 = as_type<float>(_1373) * _1676;
    if (_1329)
    {
        _1804 = _1810;
    }
    float _1826 = _1804;
    int _1828 = _1319 * _1816;
    int _1830 = _1828 + _1568;
    float _1832 = _1452 * 6.283185482025146484375;
    float _1834 = sin(_1832);
    float _1836 = _1818 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1838 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1792);
    float _1840 = fma(_1826, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1842 = !_1357;
    int _1844 = _1842 ? _1830 : (-1);
    float _1846 = _1836 + _1786;
    float _1848 = fma(_1710, _1774, _1838);
    float _1850 = _1452 * 6.283185482025146484375;
    float _1852 = cos(_1850);
    int _1854 = _1844 >> 31;
    float _1856 = _1846 * _1802;
    float _1858 = _1856 * 0.5;
    int _1860 = ~_1319;
    int _1862 = _1860 + 1;
    float _1864 = fma(_1778, _1772, _1848);
    int _1866 = _1854 & 3;
    float _1868 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1870 = fma(_1858, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1868);
    int _1872 = _1844 & 3;
    bool _1874 = _1872 != 0;
    float _1876 = trunc(_1824);
    float _1878 = precise::max(_1876, 0.0);
    uint _1880 = uint(_1878);
    float _1882 = _1834 * _1618;
    int _1884 = _1844 + _1866;
    int _1886 = _1844 & 3;
    bool _1888 = _1886 != 0;
    int _1890 = ~_1319;
    int _1892 = _1890 + 1;
    float _1894 = _1852 * _1618;
    float _1896 = -_1882;
    float _1898 = fma(_1852, _1840, _1896);
    bool _1900 = uint(_1886) > 1u;
    float _1902 = 1.0 / _1870;
    float _1904 = fma(_1834, _1840, _1894);
    int _1906 = _1884 >> 2;
    float _1908 = fma(_1704, _1898, _1688);
    int _1910 = _1862 * int(_1880);
    int _1912 = _1910 + _1538;
    int _1914 = _1906 << 4;
    int _1916 = _1914 + 368;
    float _1918 = -_1706;
    float _1920 = fma(_1708, _1904, _1918);
    float _1922 = fma(_1722, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1864);
    uint _1924 = uint(int(uint(_1916) >> uint(2)));
    uint _1926 = uint(int(uint(int(_1924)) >> uint(2)));
    int _1928 = int(_1924) & 3;
    float _1930 = (*spvDescriptorSet0.vp_c9)._m0[int(_1926)][_1928];
    int _1932 = int(_1924) + 1;
    uint _1934 = uint(int(uint(_1932) >> uint(2)));
    int _1936 = _1932 & 3;
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[int(_1934)][_1936];
    float _1940 = float(uint(_1912));
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1946 = _1908 + 0.5;
    float _1948 = as_type<float>(_1373) * _1940;
    float _1950 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1952 = _1902 * _1950;
    int _1954 = _1916 + 8;
    uint _1956 = uint(int(uint(_1954) >> uint(2)));
    uint _1958 = uint(int(uint(int(_1956)) >> uint(2)));
    int _1960 = int(_1956) & 3;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[int(_1958)][_1960];
    int _1964 = int(_1956) + 1;
    uint _1966 = uint(int(uint(_1964) >> uint(2)));
    int _1968 = _1964 & 3;
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[int(_1966)][_1968];
    float _1972 = trunc(_1948);
    float _1974 = precise::max(_1972, 0.0);
    uint _1976 = uint(_1974);
    float _1978 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1984 = abs(_1952);
    float _1986 = log2(_1984);
    int _1988 = _1874 ? 0 : 1;
    float _1990 = _1982 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = _1920 + 0.5;
    float _1994 = _1922 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1996 = uint(_1886) >= 2u;
    bool _1998 = !_1888;
    int _2000 = _1998 ? 0 : 1;
    out.m_85.x = _1946;
    out.m_85.y = _1992;
    int _2002 = int(_1880) + int(_1976);
    int _2004 = ~_1988;
    int _2006 = _2004 + 1;
    int _2008 = _2006 + 1;
    out.m_87.x = _1978;
    out.m_87.y = _1980;
    out.m_87.z = _1990;
    out.m_87.w = _1994;
    int _2010 = _2008;
    if (!_1900)
    {
        int _2012 = ~_1988;
        int _2014 = _2012 + 1;
        _2010 = _2014;
    }
    int _2016 = _2010;
    int _2018 = _1892 * _2002;
    int _2020 = _2018 + _1538;
    bool _2022 = _1886 != 3;
    float _2024 = _1986 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2026 = abs(_2016);
    int _2028 = _1996 ? 0 : 1;
    bool _2030 = uint(_2020) >= uint(_1319);
    float _2032 = exp2(_2024);
    int _2034 = abs(_2000);
    int _2036 = ~_2026;
    int _2038 = _2036 + 1;
    int _2040 = _2038 + 1;
    int _2042 = ~_2028;
    int _2044 = _2042 + 1;
    int _2046 = _2044 + 1;
    int _2048 = ~_2034;
    int _2050 = _2048 + 1;
    int _2052 = _2050 + 1;
    int _2054 = _2040 * as_type<int>(_1938);
    int _2056 = _2046;
    if (_2022)
    {
        int _2058 = ~_2028;
        int _2060 = _2058 + 1;
        _2056 = _2060;
    }
    int _2062 = _2056;
    bool _2064 = !_2030;
    int _2066 = _2064 ? 0 : (-1);
    float _2068 = fma(_2032, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2070 = precise::clamp(_2068, 0.0, 1.0);
    bool _2072 = _1886 != 3;
    int _2074 = _2052 * as_type<int>(_1930);
    int _2076 = _2074 + _2054;
    int _2078 = abs(_2062);
    bool _2080 = !_1420;
    int _2082 = _2080 ? 0 : 1;
    float _2084 = in.m_89.x;
    float _2086 = in.m_89.y;
    float _2088 = in.m_89.z;
    bool _2090 = !_2072;
    int _2092 = _2090 ? 0 : (-1);
    int _2094 = ~_2002;
    int _2096 = _2094 + _2066;
    int _2098 = _2096 + 1;
    int _2100 = ~_2078;
    int _2102 = _2100 + 1;
    int _2104 = _2102 + 1;
    int _2106 = abs(_2082);
    int _2108 = _1319 * _2098;
    int _2110 = _2108 + _1538;
    int _2112 = abs(_2092);
    int _2114 = _2104 * as_type<int>(_1962);
    int _2116 = _2114 + _2076;
    bool _2118 = _768 != 0.0;
    bool _2120 = isnan(_768);
    bool _2122 = _2118 || _2120;
    bool _2124 = isnan(0.0);
    bool _2126 = _2122 || _2124;
    int _2128 = ~_2112;
    int _2130 = _2128 + 1;
    int _2132 = _2130 + 1;
    float _2134 = fma(_2070, -2.0, 3.0);
    bool _2136 = _770 == 0.0;
    bool _2138 = !_2126;
    bool _2140 = _2136 && _2138;
    float _2142 = _2070 * _2070;
    int _2144 = ~_2106;
    int _2146 = _2144 + 1;
    int _2148 = _2146 + 1;
    int _2150 = _2132 * as_type<int>(_1970);
    int _2152 = _2150 + _2116;
    bool _2154 = _772 == 0.0;
    bool _2156 = _2154 && _2140;
    float _2158 = _2142 * _2134;
    bool _2160 = _1952 <= 8000.0;
    bool _2162 = isnan(_1952);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan(8000.0);
    bool _2168 = _2164 || _2166;
    float _2170 = float(_2168);
    int _2172 = _2152 * _2148;
    bool _2174 = !_1357;
    int _2176 = _2174 ? _2110 : (-1);
    float _2178 = -_2158;
    float _2180 = _2178 + 1.0;
    int _2182 = _2176 * _2106;
    int _2184 = _2182 + _2172;
    float _2186 = fma(_2180, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2158);
    float _2188 = _2086;
    float _2190 = _2084;
    float _2192 = _2088;
    if (!_2156)
    {
        float _2194 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2086);
        _2188 = _2194;
    }
    float _2196 = _2188;
    float _2198 = float(_2184);
    float _2200 = _2170 * _2186;
    float _2202 = in.m_63.x;
    float _2204 = _1162 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    if (!_2156)
    {
        float _2206 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2084);
        _2190 = _2206;
    }
    float _2208 = _2190;
    float _2210 = _718 * _2196;
    if (!_2156)
    {
        float _2212 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2088);
        _2192 = _2212;
    }
    float _2214 = _2192;
    float _2216 = _716 * _2196;
    float _2218 = _710 * _2196;
    float _2220 = fma(_802, _2208, _2210);
    float _2222 = exp2(_2204);
    float _2224 = fma(_800, _2208, _2216);
    out.m_91.x = _2198;
    float _2226 = fma(_434, _2214, _2220);
    float _2228 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1335);
    float _2230 = fma(_798, _2208, _2218);
    float _2232 = _1204 * 0.5;
    float _2234 = fma(_410, _2214, _2224);
    float _2236 = _2228 + _1204;
    float _2238 = fma(_412, _2214, _2230);
    float _2240 = _1238 + _1204;
    float _2242 = fma(_1248, -0.5, _2232);
    float _2244 = _2232;
    float _2246 = _2242;
    if (_1604)
    {
        _874 = 1.0;
    }
    float _2248 = _874;
    float _2250 = _2236 * 0.5;
    float _2252 = _2240 * 0.5;
    float _2254 = _2248;
    float _2256 = _2252;
    if (_1604)
    {
        _2244 = 1.0;
    }
    float _2258 = _2244;
    float _2260 = _2258;
    if (!_1604)
    {
        float _2262 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2264 = _2262 * 0.15915493667125701904296875;
        float _2266 = _2264 * 6.283185482025146484375;
        float _2268 = cos(_2266);
        float _2270 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2272 = _2270 * 0.15915493667125701904296875;
        float _2274 = _2264 * 6.283185482025146484375;
        float _2276 = sin(_2274);
        float _2278 = 1.0 / _2268;
        float _2280 = _2272 * 6.283185482025146484375;
        float _2282 = cos(_2280);
        float _2284 = _2276 * _2278;
        float _2286 = _2272 * 6.283185482025146484375;
        float _2288 = sin(_2286);
        float _2290 = _2282 * _2284;
        float _2292 = 1.0 / _2290;
        float _2294 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2296 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2294;
        float _2298 = 1.0 / _2296;
        float _2300 = _2288 * _2292;
        float _2302 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2304 = fma(_1952, _2300, _2302);
        float _2306 = _2304 * _2298;
        float _2308 = precise::clamp(_2306, 0.0, 1.0);
        _2260 = _2308;
    }
    float _2310 = _2260;
    if (!_1604)
    {
        float _2312 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2314 = _2312 * 0.15915493667125701904296875;
        float _2316 = _2314 * 6.283185482025146484375;
        float _2318 = cos(_2316);
        float _2320 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2322 = _2320 * 0.15915493667125701904296875;
        float _2324 = _2314 * 6.283185482025146484375;
        float _2326 = sin(_2324);
        float _2328 = 1.0 / _2318;
        float _2330 = _2322 * 6.283185482025146484375;
        float _2332 = cos(_2330);
        float _2334 = _2326 * _2328;
        float _2336 = _2322 * 6.283185482025146484375;
        float _2338 = sin(_2336);
        float _2340 = _2332 * _2334;
        float _2342 = 1.0 / _2340;
        float _2344 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2346 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2344;
        float _2348 = 1.0 / _2346;
        float _2350 = _2338 * _2342;
        float _2352 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2354 = fma(_1952, _2350, _2352);
        float _2356 = _2354 * _2348;
        float _2358 = precise::clamp(_2356, 0.0, 1.0);
        float _2360 = -_2358;
        float _2362 = _2360 + 1.0;
        _2254 = _2362;
    }
    float _2364 = _2254;
    float _2366 = -_2222;
    float _2368 = _2366 + 1.0;
    float _2370 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2372 = -_1266;
    float _2374 = _2372 + 1.0;
    float _2376 = _2368 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _1238;
    out.gl_Position.y = _1248;
    out.gl_Position.z = _2228;
    out.gl_Position.w = _1204;
    float _2378 = _2374 * _2370;
    float _2380 = precise::clamp(_2378, 0.0, 1.0);
    bool _2382 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2384 = isnan(_968);
    bool _2386 = _2382 || _2384;
    bool _2388 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2390 = _2386 || _2388;
    float _2392 = _2376 * _1276;
    float _2394 = in.m_63.z;
    float _2396 = -_2380;
    float _2398 = fma(_2396, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2400 = _1297 * _2392;
    out.m_93.x = _2234;
    out.m_93.y = _2226;
    out.m_93.z = _2238;
    float _2402 = _2398 * _2202;
    out.m_95.x = _934;
    out.m_95.y = _930;
    out.m_95.z = _938;
    float _2404 = _2402 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2406 = _1287 * _2392;
    float _2408 = -_2376;
    float _2410 = _2408 + 1.0;
    out.m_97.x = _2252;
    out.m_97.y = _2242;
    out.m_97.z = _2250;
    out.m_97.w = _1204;
    float _2412 = _2406;
    if (!_2390)
    {
        _1560 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2414 = _1560;
    float _2416 = fma(_1293, _2406, _1281);
    float _2418 = fma(_1295, _2406, _1283);
    float _2420 = _1287 * _2410;
    float _2422 = fma(_1287, _2400, _1285);
    out.m_99.x = _2404;
    float _2424 = _2310 * _2364;
    float _2426 = _2414;
    float _2428 = _2414;
    if (!_2390)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2430 = _2412;
    out.m_101.x = _2416;
    out.m_101.y = _2418;
    out.m_101.z = _2422;
    out.m_101.w = _2420;
    float _2432 = _2424 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2434 = _2432;
    float _2436 = _2430;
    float _2438 = _2430;
    if (!_2390)
    {
        _2246 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2440 = _2246;
    float _2442 = _2432 * _2394;
    float _2444 = _2394;
    float _2446 = _2440;
    float _2448 = _2440;
    if (!_2390)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2450 = _2256;
    float _2452 = _2450;
    float _2454 = _2450;
    if (!_2390)
    {
        _2444 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2456 = _2444;
    float _2458 = _2456;
    float _2460 = _2456;
    if (!_2390)
    {
        _2434 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2462 = _2434;
    bool _2464 = !_2390;
    float _2466 = _2462;
    float _2468 = _2462;
    if (!_2464)
    {
        bool _2470 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2472 = isnan(_968);
        bool _2474 = _2470 || _2472;
        bool _2476 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2478 = _2474 || _2476;
        if (!_2478)
        {
            float _2480 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2482 = _968 + _2480;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2486 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2484;
            float _2488 = 1.0 / _2486;
            float _2490 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2492 = _2490 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2494 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2496 = _2494 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2498 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2500 = _2498 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2502 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2504 = _2502 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2506 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2508 = _2506 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2510 = _2482 * _2488;
            float _2512 = precise::clamp(_2510, 0.0, 1.0);
            float _2514 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2516 = _2514 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2518 = fma(_2512, _2492, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2520 = fma(_2512, _2516, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2522 = fma(_2512, _2496, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2524 = fma(_2512, _2500, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2526 = fma(_2512, _2504, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2528 = fma(_2512, _2508, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2454 = _2520;
            _2460 = _2526;
            _2448 = _2518;
            _2438 = _2524;
            _2428 = _2522;
            _2468 = _2528;
            _2530 = true;
        }
        else
        {
            bool _2532 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2534 = isnan(_968);
            bool _2536 = _2532 || _2534;
            bool _2538 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2540 = _2536 || _2538;
            if (!_2540)
            {
                _2446 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2542 = _2446;
            _2448 = _2542;
            if (!_2540)
            {
                _2452 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2544 = _2452;
            _2454 = _2544;
            if (!_2540)
            {
                _2426 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2546 = _2426;
            _2428 = _2546;
            if (!_2540)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2548 = _2436;
            _2438 = _2548;
            if (!_2540)
            {
                _2458 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2550 = _2458;
            _2460 = _2550;
            if (!_2540)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2552 = _2466;
            bool _2554 = !_2540;
            _2468 = _2552;
            if (!_2554)
            {
                bool _2556 = _968 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2558 = isnan(_968);
                bool _2560 = _2556 || _2558;
                bool _2562 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2564 = _2560 || _2562;
                if (!_2564)
                {
                    float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2568 = _968 + _2566;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2572 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2570;
                    float _2574 = 1.0 / _2572;
                    float _2576 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2578 = _2576 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2580 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2582 = _2580 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2584 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2586 = _2584 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2588 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2590 = _2588 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2594 = _2592 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2596 = _2568 * _2574;
                    float _2598 = precise::clamp(_2596, 0.0, 1.0);
                    float _2600 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2602 = _2600 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2604 = fma(_2598, _2578, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2606 = fma(_2598, _2602, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2608 = fma(_2598, _2582, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2610 = fma(_2598, _2586, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2612 = fma(_2598, _2590, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2614 = fma(_2598, _2594, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2454 = _2606;
                    _2460 = _2612;
                    _2448 = _2604;
                    _2438 = _2610;
                    _2428 = _2608;
                    _2468 = _2614;
                    _2530 = true;
                }
                else
                {
                    _2454 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2460 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2448 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2428 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2530 = false;
    float _2616 = _2454;
    float _2618 = _2460;
    float _2620 = _2448;
    float _2622 = _2438;
    float _2624 = _2428;
    float _2626 = _2468;
    float _2628 = fma(_2226, -0.5, 0.5);
    float _2630 = precise::clamp(_2628, 0.0, 1.0);
    float _2632 = -_2616;
    float _2634 = _2632 + _2618;
    float _2636 = -_2620;
    float _2638 = _2636 + _2622;
    out.m_103.x = 0.0;
    float _2640 = fma(_2630, _2634, _2616);
    float _2642 = -_2624;
    float _2644 = _2642 + _2626;
    float _2646 = fma(_2630, _2638, _2620);
    float _2648 = _2640 * 0.586610972881317138671875;
    bool _2650 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2652 = fma(_2630, _2644, _2624);
    float _2654 = _2442 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2656 = fma(_2646, 0.298911988735198974609375, _2648);
    bool _2658 = _2310 > 0.0;
    bool _2660 = isnan(_2310);
    bool _2662 = _2658 || _2660;
    bool _2664 = isnan(0.0);
    bool _2666 = _2662 || _2664;
    float _2668 = fma(_2652, 0.114477999508380889892578125, _2656);
    out.m_53.x = _2654;
    bool _2670 = _2364 <= 0.0;
    bool _2672 = !_2666;
    bool _2674 = _2670 || _2672;
    float _2676 = -_2668;
    float _2678 = _2646 + _2676;
    float _2680 = -_2668;
    float _2682 = _2640 + _2680;
    float _2684 = -_2668;
    float _2686 = _2652 + _2684;
    float _2688 = fma(_2678, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    float _2690 = fma(_2682, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    float _2692 = fma(_2686, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2668);
    bool _2694 = !_2650;
    if (!_2694)
    {
        float _2696 = -_930;
        float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2700 = -_934;
        float _2702 = _2700 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2704 = -_938;
        float _2706 = _2704 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2708 = _2698 * _2698;
        float _2710 = fma(_2702, _2702, _2708);
        float _2712 = fma(_2706, _2706, _2710);
        float _2714 = sqrt(_2712);
        float _2716 = rsqrt(_2712);
        float _2718 = -_2714;
        float _2720 = _2718 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2722 = _2720 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2724 = precise::clamp(_2722, 0.0, 1.0);
        float _2726 = _2702 * _2716;
        float _2728 = _2698 * _2716;
        float _2730 = abs(_2724);
        float _2732 = log2(_2730);
        float _2734 = _2706 * _2716;
        float _2736 = _2726 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2738 = _2226 * _2728;
        float _2740 = -_2728;
        float _2742 = -_2736;
        float _2744 = fma(_2740, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2742);
        float _2746 = fma(_2234, _2726, _2738);
        float _2748 = -_2734;
        float _2750 = fma(_2748, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2744);
        float _2752 = fma(_2238, _2734, _2746);
        float _2754 = precise::clamp(_2752, 0.0, 1.0);
        float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2758 = _2750 + _2756;
        float _2760 = _2732 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2762 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2764 = precise::clamp(_2762, 0.0, 1.0);
        float _2766 = exp2(_2760);
        float _2768 = _2766 * _2764;
        float _2770 = _2754 * _2768;
        float _2772 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2774 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2776 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2772;
        out.m_103.y = _2774;
        out.m_103.z = _2776;
    }
    out.m_75.x = _2688;
    out.m_75.y = _2690;
    out.m_75.z = _2692;
    if (!_2674)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2778 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2778;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

