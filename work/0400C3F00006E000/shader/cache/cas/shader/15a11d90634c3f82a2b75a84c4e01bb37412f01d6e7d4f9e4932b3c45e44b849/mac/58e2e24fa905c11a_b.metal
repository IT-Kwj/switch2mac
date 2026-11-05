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
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_91 [[user(locn0)]];
    float4 m_87 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_77 [[user(locn3)]];
    float4 m_103 [[user(locn4)]];
    float4 m_101 [[user(locn5)]];
    float4 m_99 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_73 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_71 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 m_93 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_67 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_46 [[attribute(6)]];
    float4 m_48 [[attribute(7)]];
    float4 m_85 [[attribute(8)]];
    float4 m_69 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_79 [[attribute(13)]];
    float4 m_81 [[attribute(14)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2712 = false;
    bool _246 = false;
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
        float _3028 = as_type<float>(_144);
        out.gl_Position.z = _3028;
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
        float _3083 = as_type<float>(_170);
        out.gl_Position.z = _3083;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = 1.0 / _158;
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
    float _200 = _128 * _178;
    float _202 = _174 * _184;
    float _204 = _174 * _190;
    float _206 = fma(_172, _182, _202);
    float _208 = _174 * _196;
    float _210 = fma(_172, _188, _204);
    float _212 = fma(_176, _186, _206);
    float _214 = fma(_172, _194, _208);
    float _216 = fma(_176, _192, _210);
    float _218 = fma(_176, _198, _214);
    bool _220 = !_180;
    float _222 = _200;
    float _224 = _212;
    float _226 = _218;
    float _244;
    if (!_220)
    {
        float _228 = in.m_63.x;
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _232 = _228 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _236 = _234 * _230;
        float _238 = floor(_236);
        float _240 = -_238;
        float _242 = _236 + _240;
        _244 = _242;
        _246 = true;
    }
    else
    {
        _244 = _200;
    }
    _246 = false;
    float _248 = _244;
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
    float _270 = 1.0 / _268;
    bool _272 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _274 = isnan(_248);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_264;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = _282 * _286;
    float _304 = -_282;
    float _306 = _304 + 1.0;
    float _308 = _252 * _270;
    float _310 = in.m_65.x;
    float _312 = in.m_65.y;
    float _314 = in.m_65.z;
    float _316 = fma(_290, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_300, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = fma(_294, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = _316 * _302;
    float _324 = _318 * _302;
    float _326 = _320 * _302;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _330 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _324);
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _334 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].x, _328);
    float _336 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].y, _330);
    float _338 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].z, _332);
    float _340 = _334 * _310;
    float _342 = _336 * _312;
    float _344 = _338 * _314;
    bool _346 = !_296;
    if (!_346)
    {
        float _348 = in.m_63.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _222 = _362;
    }
    float _364 = _222;
    float _366 = in.m_46.x;
    float _368 = in.m_46.y;
    float _370 = in.m_46.z;
    float _372 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = in.m_67.y;
    float _376 = _372 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _378 = in.m_57.w;
    float _380 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _382 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _384 = in.m_61.w;
    float _386 = _184 * _368;
    float _388 = _196 * _368;
    float _390 = _190 * _368;
    float _392 = fma(_182, _366, _386);
    float _394 = fma(_194, _366, _388);
    float _396 = _368 + _374;
    float _398 = fma(_188, _366, _390);
    float _400 = fma(_186, _370, _392);
    float _402 = fma(_198, _370, _394);
    float _404 = -_396;
    float _406 = _404 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _408 = _400 + _378;
    float _410 = _402 + _384;
    float _412 = _406 * _406;
    float _414 = fma(_192, _370, _398);
    float _416 = -_408;
    float _418 = _416 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _420 = -_410;
    float _422 = _420 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _424 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _428 = _408 + _426;
    float _430 = fma(_418, _418, _412);
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _434 = _410 + _432;
    float _436 = -_424;
    float _438 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _436);
    float _440 = fma(_422, _422, _430);
    float _442 = rsqrt(_440);
    float _444 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _446 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _448 = -_444;
    float _450 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _448);
    float _452 = -_446;
    float _454 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _452);
    float _456 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _458 = _418 * _442;
    float _460 = _422 * _442;
    float _462 = _454 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _464 = -_456;
    float _466 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _464);
    float _468 = _458 * _458;
    float _470 = _406 * _442;
    float _472 = -_462;
    float _474 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _472);
    float _476 = fma(_460, _460, _468);
    float _478 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _480 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _482 = rsqrt(_476);
    float _484 = -_478;
    float _486 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _484);
    float _488 = _454 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _490 = -_488;
    float _492 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[1].x, _490);
    float _494 = -_480;
    float _496 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _494);
    float _498 = _450 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _500 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].w, _492);
    float _502 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[1].w, _474);
    float _504 = -_498;
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].y, _504);
    float _508 = _496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _510 = _460 * _482;
    float _512 = _458 * _482;
    float _514 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].w, _506);
    float _516 = _502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _518 = -_510;
    float _520 = _460 * _518;
    float _522 = -_508;
    float _524 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _522);
    float _526 = -_510;
    float _528 = _470 * _526;
    float _530 = -_516;
    float _532 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _530);
    float _534 = -_520;
    float _536 = fma(_458, _512, _534);
    float _538 = _470 * _512;
    float _540 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _524);
    float _542 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _532);
    float _544 = _536 * _536;
    float _546 = _454 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _548 = _454 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _550 = -_540;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[0].w, _542);
    float _554 = fma(_538, _538, _544);
    float _556 = -_546;
    float _558 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _556);
    float _560 = _450 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _562 = -_548;
    float _564 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _562);
    float _566 = fma(_528, _528, _554);
    float _568 = 1.0 / _552;
    float _570 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[0].w, _558);
    float _572 = -_560;
    float _574 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].y, _572);
    float _576 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[0].w, _564);
    float _578 = in.m_59.w;
    float _580 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[0].w, _574);
    float _582 = rsqrt(_566);
    float _584 = fma(_570, _568, -1.0);
    float _586 = _536 * _582;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = -_588;
    float _592 = _590 + 1.0;
    float _594 = _414 + _578;
    float _596 = _592 * _568;
    float _598 = fma(_592, _584, 1.0);
    float _600 = _580 * _596;
    float _602 = _598 * _598;
    float _604 = _576 * _596;
    float _606 = fma(_600, _600, _602);
    float _608 = fma(_604, _604, _606);
    float _610 = rsqrt(_608);
    float _612 = _604 * _610;
    float _614 = _598 * _610;
    float _616 = _600 * _610;
    float _618 = -_612;
    float _620 = _458 * _618;
    float _622 = _460 * _614;
    float _624 = -_616;
    float _626 = -_620;
    float _628 = fma(_460, _624, _626);
    float _630 = -_612;
    float _632 = -_622;
    float _634 = fma(_470, _630, _632);
    float _636 = -_616;
    float _638 = _470 * _636;
    float _640 = _628 * _628;
    float _642 = -_638;
    float _644 = fma(_458, _614, _642);
    float _646 = fma(_634, _634, _640);
    float _648 = fma(_644, _644, _646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _594 + _650;
    float _654 = rsqrt(_648);
    float _656 = _652 * _652;
    float _658 = fma(_428, _428, _656);
    float _660 = fma(_434, _434, _658);
    float _662 = sqrt(_660);
    float _664 = _634 * _654;
    float _666 = _644 * _654;
    float _668 = _628 * _654;
    float _670 = _460 * _664;
    float _672 = _470 * _666;
    float _674 = rsqrt(_660);
    float _676 = -_670;
    float _678 = fma(_458, _666, _676);
    float _680 = -_672;
    float _682 = fma(_460, _668, _680);
    float _684 = _458 * _668;
    float _686 = _678 * _678;
    float _688 = _662 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _690 = -_684;
    float _692 = fma(_470, _664, _690);
    float _694 = fma(_682, _682, _686);
    float _696 = precise::min(_376, _688);
    float _698 = fma(_692, _692, _694);
    float _700 = _674 * _696;
    float _702 = rsqrt(_698);
    float _704 = _652 * _700;
    float _706 = _428 * _700;
    float _708 = _434 * _700;
    float _710 = -_704;
    float _712 = _652 + _710;
    float _714 = -_706;
    float _716 = _428 + _714;
    float _718 = -_708;
    float _720 = _434 + _718;
    float _722 = _712 * _712;
    float _724 = fma(_716, _716, _722);
    float _726 = _692 * _702;
    float _728 = _678 * _702;
    float _730 = _682 * _702;
    float _732 = fma(_720, _720, _724);
    float _734 = _458 * _726;
    float _736 = _460 * _728;
    float _738 = in.m_69.x;
    float _740 = in.m_69.y;
    float _742 = in.m_69.z;
    float _744 = _470 * _730;
    float _746 = -_734;
    float _748 = fma(_460, _730, _746);
    float _750 = -_736;
    float _752 = fma(_470, _726, _750);
    float _754 = sqrt(_732);
    float _756 = -_744;
    float _758 = fma(_458, _728, _756);
    float _760 = _748 * _748;
    float _762 = fma(_752, _752, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = rsqrt(_764);
    float _768 = _674 * _754;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _740);
    float _772 = _380 * _768;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _738);
    float _776 = _372 * _768;
    float _778 = _382 * _768;
    float _780 = _772 * _770;
    float _782 = _776 * _774;
    float _784 = _778 * _742;
    float _786 = _780 * _726;
    float _788 = _758 * _766;
    float _790 = _780 * _730;
    float _792 = _752 * _766;
    float _794 = _748 * _766;
    float _796 = fma(_782, _788, _786);
    float _798 = -_708;
    float _800 = _410 + _798;
    float _802 = fma(_782, _792, _790);
    float _804 = fma(_784, _460, _796);
    float _806 = fma(_784, _458, _802);
    float _808 = _410 + _804;
    float _810 = _408 + _806;
    float _812 = -_704;
    float _814 = _812 + _396;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _808 + _816;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _822 = _810 + _820;
    float _824 = _818 * _818;
    float _826 = fma(_822, _822, _824);
    float _828 = _780 * _728;
    float _830 = sqrt(_826);
    float _832 = fma(_782, _794, _828);
    float _834 = -_706;
    float _836 = _408 + _834;
    float _838 = _814 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _840 = fma(_784, _470, _832);
    float _842 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[11].x, _838);
    float _844 = _396 + _840;
    float _846 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].z, _842);
    bool _848 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _860 = _858 != 0;
    bool _862 = !_856;
    int _864 = _862 ? 0 : 1;
    bool _866 = !_852;
    int _868 = _866 ? 0 : 1;
    bool _870 = !_860;
    int _872 = _870 ? 0 : 1;
    float _874 = _840;
    float _876 = _766;
    float _878 = _810;
    float _880 = _704;
    float _882 = _706;
    float _884 = _708;
    if (!_848)
    {
        _874 = _808;
    }
    float _886 = _874;
    float _888 = _886;
    if (!_848)
    {
        _876 = _844;
    }
    float _890 = _876;
    bool _892 = !_848;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _830 + _898;
        float _902 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = _900 * _896;
        float _906 = rsqrt(_826);
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = sin(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = fma(_912, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _920 = _906 * _918;
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_822, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _928 = fma(_818, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _930 = fma(_844, _916, _924);
        _894 = _930;
        _878 = _926;
        _888 = _928;
    }
    float _932 = _894;
    float _934 = _878;
    float _936 = _888;
    float _938 = -_396;
    float _940 = _938 + _932;
    float _942 = -_408;
    float _944 = _942 + _934;
    float _946 = _846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _948 = _814 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _950 = _940 * _940;
    float _952 = -_410;
    float _954 = _952 + _936;
    float _956 = 1.0 / _946;
    float _958 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _960 = fma(_944, _944, _950);
    float _962 = -_706;
    float _964 = _962 + _934;
    float _966 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].z, _958);
    float _968 = fma(_954, _954, _960);
    float _970 = -_704;
    float _972 = _970 + _932;
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _976 = sqrt(_968);
    float _978 = _974 + _946;
    float _980 = _978 * _956;
    float _982 = _980 * 0.5;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _986 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[30].w, _984);
    float _988 = 1.0 / _986;
    bool _990 = _976 > 0.0;
    bool _992 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _994 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    float _1002 = -_708;
    float _1004 = _1002 + _936;
    bool _1006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.5);
    bool _1014 = _1010 || _1012;
    float _1016 = _936;
    float _1018 = _972;
    float _1020 = _968;
    if (!_990)
    {
        _880 = _964;
    }
    float _1022 = _880;
    float _1024 = _1022;
    if (!_990)
    {
        _882 = _972;
    }
    float _1026 = _882;
    float _1028 = _1026;
    if (!_990)
    {
        _1016 = _1004;
    }
    float _1030 = _1016;
    bool _1032 = !_990;
    float _1034 = _1030;
    float _1036 = _1030;
    if (!_1032)
    {
        float _1038 = _216 * _216;
        float _1040 = fma(_212, _212, _1038);
        float _1042 = fma(_218, _218, _1040);
        float _1044 = rsqrt(_968);
        float _1046 = sqrt(_1042);
        float _1048 = _944 * _1044;
        float _1050 = _940 * _1044;
        float _1052 = _954 * _1044;
        bool _1054 = _1046 > 0.0;
        float _1056 = _1044;
        float _1058 = _1046;
        if (!_1054)
        {
            _1056 = _964;
        }
        float _1060 = _1056;
        _1024 = _1060;
        if (!_1054)
        {
            _1058 = _972;
        }
        float _1062 = _1058;
        _1028 = _1062;
        if (!_1054)
        {
            _1034 = _1004;
        }
        float _1064 = _1034;
        bool _1066 = !_1054;
        _1036 = _1064;
        if (!_1066)
        {
            float _1068 = rsqrt(_1042);
            float _1070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1072 = _216 * _1068;
            float _1074 = _212 * _1068;
            float _1076 = _1050 * _1072;
            float _1078 = _218 * _1068;
            float _1080 = fma(_1048, _1074, _1076);
            float _1082 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1084 = fma(_1052, _1078, _1080);
            float _1086 = _1084 * _1082;
            float _1088 = fma(_212, _1086, _964);
            float _1090 = fma(_216, _1086, _972);
            float _1092 = fma(_218, _1086, _1004);
            _1024 = _1088;
            _1028 = _1090;
            _1036 = _1092;
        }
    }
    float _1094 = _1024;
    float _1096 = _1028;
    float _1098 = _1036;
    float _1100 = _1096;
    float _1102 = _1094;
    float _1104 = _1098;
    if (_1000)
    {
        _224 = 1.0;
    }
    float _1106 = _224;
    float _1108 = _1106;
    if (!_1014)
    {
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1112 = _814 + _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1116 = _836 + _1114;
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1120 = _1112 * _1112;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1124 = _800 + _1122;
        float _1126 = fma(_1116, _1116, _1120);
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1130 = fma(_1124, _1124, _1126);
        float _1132 = sqrt(_1130);
        float _1134 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1136 = precise::min(_1132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1138 = _1136 * _1128;
        float _1140 = -_836;
        float _1142 = _1140 + _1094;
        float _1144 = _1134 * _1138;
        float _1146 = -_814;
        float _1148 = _1146 + _1096;
        float _1150 = -_800;
        float _1152 = _1150 + _1098;
        float _1154 = fma(_1142, _1144, _836);
        float _1156 = fma(_1148, _1144, _814);
        float _1158 = fma(_1152, _1144, _800);
        _1100 = _1156;
        _1102 = _1154;
        _1104 = _1158;
        _226 = _1152;
    }
    float _1160 = _1100;
    float _1162 = _1102;
    float _1164 = _1104;
    float _1166 = _226;
    float _1168 = 0.0;
    float _1170 = _1166;
    if (_1000)
    {
        _1168 = 1.0;
    }
    float _1172 = _1168;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1176 = _988 * _1174;
    float _1178 = _1172;
    if (!_1000)
    {
        float _1180 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1182 = _1180 * 0.15915493667125701904296875;
        float _1184 = _1182 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1190 = _1188 * 0.15915493667125701904296875;
        float _1192 = _1182 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = 1.0 / _1186;
        float _1198 = _1190 * 6.283185482025146484375;
        float _1200 = cos(_1198);
        float _1202 = _1194 * _1196;
        float _1204 = _1190 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1200 * _1202;
        float _1210 = 1.0 / _1208;
        float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1214 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1212;
        float _1216 = 1.0 / _1214;
        float _1218 = _1206 * _1210;
        float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1222 = fma(_1176, _1218, _1220);
        float _1224 = _1222 * _1216;
        float _1226 = precise::clamp(_1224, 0.0, 1.0);
        _1018 = _1182;
        _1170 = _1190;
        _1108 = _1226;
    }
    float _1228 = _1018;
    float _1230 = _1170;
    float _1232 = _1108;
    float _1234 = _1228;
    float _1236 = _1230;
    if (!_1000)
    {
        float _1238 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = _1240 * 6.283185482025146484375;
        float _1244 = cos(_1242);
        float _1246 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1244;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = 1.0 / _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1270;
        float _1274 = 1.0 / _1272;
        float _1276 = _1264 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1280 = fma(_1176, _1276, _1278);
        float _1282 = _1280 * _1274;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        float _1286 = -_1284;
        float _1288 = _1286 + 1.0;
        _1234 = _1254;
        _1236 = _1266;
        _1178 = _1288;
    }
    float _1290 = _1234;
    float _1292 = _1236;
    float _1294 = _1178;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _1160 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1302 = _1162 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1306 = _1164 + _1304;
    float _1308 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = _1298 * _1298;
    float _1312 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1314 = fma(_1302, _1302, _1310);
    float _1316 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1312);
    float _1318 = fma(_1306, _1306, _1314);
    float _1320 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1322 = rsqrt(_1318);
    float _1324 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1326 = _1302 * _1324;
    float _1328 = _1306 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 * _1328;
    float _1334 = _1330 + _1332;
    float _1336 = sqrt(_1334);
    bool _1338 = _1336 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1336 + _1340;
    float _1344 = _1322;
    float _1346 = _1292;
    float _1348 = _1342;
    float _1350 = _1290;
    float _1352 = _1330;
    if (_1338)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1354;
    }
    float _1356 = _1344;
    if (_1338)
    {
        float _1358 = rsqrt(_1334);
        _1346 = _1358;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (_1338)
    {
        float _1364 = _1342 * _1356;
        _1348 = _1364;
    }
    float _1366 = _1348;
    if (_1338)
    {
        float _1368 = _1366 * 0.15915493667125701904296875;
        _884 = _1368;
    }
    float _1370 = _884;
    float _1372 = _1306;
    float _1374 = _1370;
    if (_1338)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1384 = precise::max(0.0, _1382);
    float _1386 = _1356;
    if (_1338)
    {
        float _1388 = _1370 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = -_1324;
    float _1396 = -_1384;
    float _1398 = fma(_1298, _1394, _1396);
    float _1400 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1338)
    {
        float _1402 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1402;
    }
    float _1404 = _1350;
    float _1406 = _1404;
    if (!_1338)
    {
        _1374 = _1328;
    }
    float _1408 = _1374;
    float _1410 = fma(_836, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1412 = _1408;
    if (_1338)
    {
        float _1414 = fma(_1380, _1404, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = floor(_1410);
    float _1420 = _1416;
    float _1422 = _1392;
    if (_1338)
    {
        float _1424 = _1392 + (-1.0);
        _1400 = _1424;
    }
    float _1426 = _1400;
    float _1428 = _1426;
    if (_1338)
    {
        float _1430 = _1360 * _1416;
        _1020 = _1430;
    }
    float _1432 = _1020;
    if (!_1338)
    {
        _1362 = _1326;
    }
    float _1434 = _1362;
    float _1436 = _1434;
    if (_1338)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1438;
    }
    float _1440 = _1428;
    if (_1338)
    {
        float _1442 = _1326 * _1432;
        _1436 = _1442;
    }
    float _1444 = _1436;
    if (!_1338)
    {
        _1420 = _1398;
    }
    float _1446 = _1420;
    float _1448 = _1446;
    if (_1338)
    {
        float _1450 = _1328 * _1432;
        _1412 = _1450;
    }
    float _1452 = _1412;
    if (_1338)
    {
        float _1454 = fma(_1398, _1392, _1440);
        _1448 = _1454;
    }
    float _1456 = _1448;
    if (_1338)
    {
        float _1458 = _1444 * _1444;
        _1352 = _1458;
    }
    float _1460 = _1352;
    if (!_1338)
    {
        _1422 = _1332;
    }
    float _1462 = _1422;
    float _1464 = sqrt(_1318);
    float _1466 = _1462;
    if (_1338)
    {
        float _1468 = _1452 * _1452;
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = fma(_1456, _1456, _1460);
    float _1474 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1476 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1478 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1472 + _1470;
    float _1482 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1476);
    float _1484 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1488 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1482);
    float _1490 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1492 = rsqrt(_1480);
    float _1494 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1498 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1502 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1500);
    float _1504 = precise::clamp(_1502, 0.0, 1.0);
    float _1506 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1508 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1510 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1512 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1514 = -_1504;
    float _1516 = _1514 + 1.0;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1520 = floor(_1474);
    float _1522 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1512);
    float _1524 = -_1418;
    float _1526 = _1410 + _1524;
    float _1528 = -_1518;
    float _1530 = fma(_1528, _1508, 1.0);
    float _1532 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1534 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1536 = _1492 * _1444;
    float _1538 = _1492 * _1452;
    float _1540 = abs(_1516);
    float _1542 = log2(_1540);
    float _1544 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1534);
    float _1546 = _1492 * _1456;
    float _1548 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1550 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1532);
    float _1552 = -_1548;
    float _1554 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1552);
    float _1556 = 1.0 / _1544;
    float _1558 = -_1520;
    float _1560 = _1474 + _1558;
    float _1562 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1550);
    float _1564 = -_1538;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1554);
    float _1568 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1570 = _1546 + 1.0;
    float _1572 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1574 = fma(_1566, -0.5, 0.5);
    float _1576 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1578 = log2(_1530);
    float _1580 = fma(_1566, 0.5, 0.5);
    float _1582 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1568);
    float _1584 = fma(_1580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1586 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1588 = exp2(_1576);
    float _1590 = fma(_1580, _1584, -0.212114393711090087890625);
    float _1592 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1586);
    float _1594 = _1572 * _1556;
    float _1596 = fma(_1580, _1590, 1.570728778839111328125);
    float _1598 = sqrt(_1574);
    float _1600 = _1578 * 0.693147182464599609375;
    float _1602 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1604 = -_1546;
    float _1606 = fma(_1588, _1570, _1604);
    float _1608 = _1592 * _1556;
    float _1610 = fma(_1594, 0.5, 0.5);
    float _1612 = fma(_1606, 0.5, 0.5);
    float _1614 = fma(_1608, -0.5, 0.5);
    float _1616 = _1598 * 0.636619746685028076171875;
    float2 _5358 = float2(_1526, _1560);
    float _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5358, float2(0.0), isnan(_5358)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5358, float2(0.0), isnan(_5358)), level(0.0)).x;
    float3 _5369 = float3(_1610, _1614, _1602);
    float _1620 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5369, float3(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5369, float3(0.0), isnan(_5369)), level(0.0)).x;
    float _1622 = -_1596;
    float _1624 = fma(_1616, _1622, 1.0);
    float3 _5385 = float3(_1610, _1614, _1602);
    float4 _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5385, float3(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5385, float3(0.0), isnan(_5385)), level(0.0)).xyzw;
    float _1629 = _1627.x;
    float _1631 = _1627.y;
    float _1633 = _1627.z;
    float _1635 = _1627.w;
    float2 _5401 = float2(_1624, _1612);
    float3 _1639 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5401, float2(0.0), isnan(_5401)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5401, float2(0.0), isnan(_5401)), level(0.0)).xyz;
    float _1641 = _1639.x;
    float _1643 = _1639.y;
    float _1645 = _1639.z;
    float _1647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1649 = int(_1647);
    out.m_71.x = _836;
    out.m_71.y = _814;
    out.m_71.z = _800;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1653 = _1651 != 0;
    int _1655 = abs(_868);
    out.m_73.w = _696;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1659 = _1657 != 0;
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1663 = int(_1661);
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1667 = _1665 != 0;
    out.m_75.x = _776;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1671 = _1669 != 0;
    out.m_77.x = _1162;
    out.m_77.y = _1160;
    out.m_77.z = _1164;
    float _1673 = float(_1649);
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1677 = 1.0 / _1673;
    float _1679 = float(uint(_1663));
    int _1681 = ~_1663;
    int _1683 = _1681 + 1;
    bool _1685 = _1663 == 0;
    float _1687 = 1.0 / _1679;
    float _1689 = _128 * _1677;
    int _1691 = ~_1663;
    int _1693 = _1691 + 1;
    float _1695 = trunc(_1689);
    int _1697 = int(_1695);
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1701 = _1699 != 0;
    int _1703 = as_type<int>(_1687) + (-2);
    float _1705 = float(uint(_1697));
    float _1707 = as_type<float>(_1703) * _1705;
    float _1709 = in.m_63.x;
    float _1711 = in.m_63.y;
    float _1713 = in.m_63.z;
    float _1715 = trunc(_1707);
    float _1717 = precise::max(_1715, 0.0);
    uint _1720 = uint(_1717);
    bool _1722 = !_1701;
    float _1724 = _1722 ? 7.345489978790283203125 : 1.0;
    float _1726 = float(_1697);
    int _1728 = _1693 * int(_1720);
    int _1730 = _1728 + _1697;
    float _1732 = float(uint(_1730));
    float _1734 = _1724 * _1709;
    float _1736 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1738 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1675);
    float _1740 = as_type<float>(_1703) * _1732;
    float _1742 = floor(_1734);
    float _1744 = trunc(_1740);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    int _1750 = int(_1720) + int(_1748);
    float _1752 = -_1742;
    float _1754 = _1734 + _1752;
    float _1756 = float(_1663);
    float _1758 = in.m_79.y;
    int _1760 = _1683 * _1750;
    int _1762 = _1760 + _1697;
    bool _1764 = _1726 >= _1756;
    bool _1766 = isnan(_1726);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(_1756);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = _128 * _1756;
    float _1778 = _1754 * _1756;
    bool _1780 = uint(_1762) >= uint(_1663);
    float _1782 = _1776 * _178;
    float _1784 = trunc(_1774);
    int _1786 = int(_1784);
    float _1788 = in.m_81.w;
    bool _1790 = !_1780;
    int _1792 = _1790 ? 0 : (-1);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1796 = _1794 != 0;
    int _1798 = ~_1750;
    int _1800 = _1798 + _1792;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1778);
    int _1806 = int(_1804);
    bool _1808 = !_1796;
    int _1810 = _1808 ? 0 : 1;
    int _1812 = _1663 * _1802;
    int _1814 = _1812 + _1697;
    int _1816 = abs(_864);
    int _1818 = abs(_1810);
    int _1820 = ~_1786;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    float _1826 = trunc(_1782);
    int _1828 = int(_1826);
    bool _1830 = !_1685;
    int _1832 = _1830 ? _1814 : (-1);
    int _1834 = _1832 * _1824;
    int _1836 = _1663 + (-1);
    int _1838 = _1806 * _1818;
    int _1840 = _1838 + _1697;
    int _1842 = abs(_872);
    out.m_83.w = _1788;
    int _1844 = _1786 * _1836;
    int _1846 = _1844 + _1834;
    bool _1848 = _1711 > 0.5;
    int _1850 = _1846 * _1816;
    float _1852 = -_1758;
    float _1854 = _1852 + 1.0;
    int _1856 = _1828 * _1655;
    int _1858 = _1856 + _1850;
    bool _1860 = !_1653;
    int _1862 = _1860 ? 0 : 1;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1866 = _1758;
    float _1868 = _1544;
    float _1870 = _1572;
    float _1872 = _1592;
    if (_1659)
    {
        float _1874 = _1848 ? _1854 : _1758;
        _1866 = _1874;
    }
    float _1876 = _1866;
    int _1878 = _1840 * _1842;
    int _1880 = _1878 + _1858;
    int _1882 = abs(_1862);
    float _1884 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1864);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1888 = _1806 * _1882;
    int _1890 = _1888 + _1880;
    float _1892 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1898 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1886);
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1904 = float(uint(_1890));
    float _1906 = as_type<float>(_1806);
    if (_1667)
    {
        float _1908 = in.m_63.x;
        _1906 = _1908;
    }
    float _1910 = _1906;
    float _1912 = 1.0 / _1896;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1916 = as_type<float>(_1703) * _1904;
    float _1918 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1884);
    float _1920 = fma(_1736, -2.0, _1914);
    bool _1922 = _740 != 0.0;
    bool _1924 = isnan(_740);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    float _1932 = trunc(_1916);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1940 = _1918 * (-0.15915493667125701904296875);
    float _1942 = -_1938;
    float _1944 = fma(_1892, 2.0, _1942);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1948 = 1.0 / _1902;
    int _1950 = ~_1663;
    int _1952 = _1950 + 1;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1956 = _738 == 0.0;
    bool _1958 = !_1930;
    bool _1960 = _1956 && _1958;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1964 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1966 = _1952 * int(_1936);
    int _1968 = _1966 + _1890;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1970;
    bool _1974 = _742 == 0.0;
    bool _1976 = _1974 && _1960;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1980 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = float(uint(_1968));
    float _1984 = _1972 * _1912;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1990 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = in.m_85.x;
    float _1994 = in.m_85.y;
    float _1996 = in.m_85.z;
    float _1998 = as_type<float>(_1703) * _1982;
    float _2000 = _1988 * _1948;
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_87.x = _1964;
    out.m_87.y = _1980;
    out.m_87.z = _1990;
    out.m_87.w = _1978;
    float _2006 = trunc(_1998);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    bool _2012 = _1910 > 0.5;
    bool _2014 = _2012 && _1667;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2016;
    float _2020 = in.m_79.x;
    float _2022 = -_128;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1944);
    float _2026 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1920);
    float _2028 = 1.0 / _2004;
    int _2030 = ~_1663;
    int _2032 = _2030 + 1;
    float _2034 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1898);
    float _2036 = float(uint(_1840));
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2040 = _364 + _2038;
    int _2042 = int(_1936) + int(_2010);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2046 = _364 + _2044;
    int _2048 = ~_1663;
    int _2050 = _2048 + 1;
    float _2052 = _1994;
    float _2054 = _1992;
    float _2056 = _1996;
    if (!_1976)
    {
        float _2058 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1994);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = as_type<float>(_1703) * _2036;
    float _2064 = fma(_2000, _2040, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2066 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2068 = isnan(_364);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    if (!_1976)
    {
        float _2078 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1992);
        _2054 = _2078;
    }
    float _2080 = _2054;
    bool _2082 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2084 = isnan(_364);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    float _2094 = fma(_1984, _2046, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2096 = trunc(_2062);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    float _2102 = _2018 * _2028;
    float _2104 = -_2076;
    float _2106 = _2104 + 1.0;
    bool _2108 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2110 = isnan(_364);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    int _2120 = _2050 * _2042;
    int _2122 = _2120 + _1890;
    float _2124 = -_2092;
    float _2126 = _2124 + 1.0;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2130 = _364 + _2128;
    float _2132 = _2092 * _2106;
    float _2134 = _2118;
    float _2136 = _2020;
    if (!_1976)
    {
        float _2138 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1996);
        _2056 = _2138;
    }
    float _2140 = _2056;
    float _2142 = _2118 * _2126;
    bool _2144 = uint(_2122) >= uint(_1663);
    float _2146 = fma(_2102, _2130, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1738);
    bool _2150 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2152 = isnan(_364);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = -_2118;
    float _2164 = _2162 + 1.0;
    bool _2166 = !_2144;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = _1940 * 6.283185482025146484375;
    float _2172 = sin(_2170);
    int _2174 = _2032 * int(_2100);
    int _2176 = _2174 + _1840;
    if (_1667)
    {
        _2134 = _2020;
    }
    float _2178 = _2134;
    float _2180 = _2160 * _2164;
    int _2182 = ~_2042;
    int _2184 = _2182 + _2168;
    int _2186 = _2184 + 1;
    float _2188 = -_2160;
    float _2190 = _2188 + 1.0;
    float _2192 = float(uint(_2176));
    float _2194 = _2178;
    if (_2014)
    {
        float _2196 = -_2178;
        float _2198 = _2196 + 1.0;
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _1940 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    float _2206 = _2094 * _2180;
    int _2208 = _1663 * _2186;
    int _2210 = _2208 + _1890;
    float _2212 = as_type<float>(_1703) * _2192;
    if (_1667)
    {
        _2136 = _2200;
    }
    float _2214 = _2136;
    float _2216 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2206);
    float _2218 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2220 = !_1685;
    int _2222 = _2220 ? _2210 : (-1);
    float _2224 = trunc(_2212);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    float _2230 = fma(_2064, _2142, _2216);
    float _2232 = _2172 * _2218;
    float _2234 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2236 = _2222 >> 31;
    float _2238 = _730 * _2060;
    int _2240 = _2222 & 3;
    bool _2242 = _2240 != 0;
    float _2244 = _728 * _2060;
    float _2246 = _2204 * _2218;
    int _2248 = _2236 & 3;
    float _2250 = -_2232;
    float _2252 = fma(_2204, _2234, _2250);
    float _2254 = fma(_2172, _2234, _2246);
    float _2256 = fma(_2146, _2132, _2230);
    int _2258 = _2222 + _2248;
    float _2260 = fma(_2034, _2252, _2024);
    int _2262 = int(_2100) + int(_2228);
    float _2264 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2256);
    int _2266 = _2258 >> 2;
    float _2268 = abs(_1176);
    float _2270 = log2(_2268);
    float _2272 = -_2026;
    float _2274 = fma(_2148, _2254, _2272);
    int _2276 = ~_1663;
    int _2278 = _2276 + 1;
    float _2280 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2282 = _2266 << 4;
    int _2284 = _2282 + 368;
    float _2286 = _2274 + 0.5;
    int _2288 = _2278 * _2262;
    int _2290 = _2288 + _1840;
    uint _2292 = uint(int(uint(_2284) >> uint(2)));
    uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
    int _2296 = int(_2292) & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    int _2300 = int(_2292) + 1;
    uint _2302 = uint(int(uint(_2300) >> uint(2)));
    int _2304 = _2300 & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    float _2308 = _726 * _2060;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2314 = uint(_2290) >= uint(_1663);
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2318 = _2222 & 3;
    bool _2320 = _2318 != 0;
    float _2322 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2324 = _2284 + 8;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    float _2342 = _2260 + 0.5;
    bool _2344 = !_2314;
    int _2346 = _2344 ? 0 : (-1);
    float _2348 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2350 = uint(_2318) > 1u;
    float _2352 = exp2(_2322);
    int _2354 = ~_2262;
    int _2356 = _2354 + _2346;
    int _2358 = _2356 + 1;
    float _2360 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2362 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2364 = _2242 ? 0 : 1;
    int _2366 = _1663 * _2358;
    int _2368 = _2366 + _1840;
    out.m_89.x = _2342;
    out.m_89.y = _2286;
    bool _2370 = _2318 != 3;
    float _2372 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2374 = uint(_2318) >= 2u;
    out.m_91.x = _2348;
    out.m_91.y = _2360;
    out.m_91.z = _2362;
    out.m_91.w = _2280;
    bool _2376 = !_2320;
    int _2378 = _2376 ? 0 : 1;
    float _2380 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2372);
    bool _2382 = _2318 != 3;
    float _2384 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2386 = precise::clamp(_2384, 0.0, 1.0);
    bool _2388 = !_1685;
    int _2390 = _2388 ? _2368 : (-1);
    float _2392 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    int _2394 = ~_2364;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    float _2400 = fma(_792, _2080, _2238);
    int _2402 = _2398;
    if (!_2350)
    {
        int _2404 = ~_2364;
        int _2406 = _2404 + 1;
        _2402 = _2406;
    }
    int _2408 = _2402;
    float _2410 = fma(_794, _2080, _2244);
    bool _2412 = _1176 <= 8000.0;
    bool _2414 = isnan(_1176);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan(8000.0);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = fma(_788, _2080, _2308);
    int _2426 = abs(_2408);
    float _2428 = fma(_2386, -2.0, 3.0);
    float _2430 = _2386 * _2386;
    int _2432 = _2374 ? 0 : 1;
    float _2434 = fma(_458, _2140, _2400);
    float _2436 = fma(_470, _2140, _2410);
    float _2438 = _2430 * _2428;
    int _2440 = ~_2432;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = fma(_460, _2140, _2424);
    int _2448 = _2444;
    if (_2370)
    {
        int _2450 = ~_2432;
        int _2452 = _2450 + 1;
        _2448 = _2452;
    }
    int _2454 = _2448;
    float _2456 = -_2438;
    float _2458 = _2456 + 1.0;
    int _2460 = abs(_2378);
    float _2462 = -_1618;
    float _2464 = _2462 + 1.0;
    int _2466 = ~_2426;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2438);
    int _2474 = abs(_2454);
    out.m_93.x = _2434;
    out.m_93.y = _2436;
    out.m_93.z = _2446;
    bool _2476 = !_2382;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2470 * as_type<int>(_2306);
    int _2482 = ~_2460;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = abs(_2478);
    int _2490 = ~_2474;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2486 * as_type<int>(_2298);
    int _2498 = _2496 + _2480;
    bool _2500 = !_1671;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = _1544 * 0.5;
    int _2506 = ~_2488;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = _2494 * as_type<int>(_2332);
    int _2514 = _2512 + _2498;
    int _2516 = abs(_2502);
    float _2518 = fma(_1592, -0.5, _2504);
    float _2520 = in.m_67.x;
    int _2522 = _2510 * as_type<int>(_2340);
    int _2524 = _2522 + _2514;
    int _2526 = ~_2516;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    float _2532 = _2422 * _2472;
    int _2534 = _2524 * _2530;
    float _2536 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2538 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2392);
    float _2540 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2542 = _2390 * _2516;
    int _2544 = _2542 + _2534;
    float _2546 = _1572 + _1544;
    float _2548 = _2538 + _1544;
    float _2550 = exp2(_2536);
    float _2552 = _2464 * _2540;
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    float _2556 = _2546 * 0.5;
    float _2558 = _2548 * 0.5;
    bool _2560 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2562 = isnan(_1464);
    bool _2564 = _2560 || _2562;
    bool _2566 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2568 = _2564 || _2566;
    float _2570 = -_2554;
    float _2572 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2574 = float(_2544);
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1592;
    out.gl_Position.z = _2538;
    out.gl_Position.w = _1544;
    float _2576 = _2572 * _2520;
    out.m_95.x = _2556;
    out.m_95.y = _2518;
    out.m_95.z = _2558;
    out.m_95.w = _1544;
    out.m_97.x = _2574;
    float _2578 = -_2550;
    float _2580 = _2578 + 1.0;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2584 = _2574;
    if (!_2568)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2586 = _1868;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2568)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2592 = _1870;
    float _2594 = _2582 * _1620;
    float _2596 = -_2582;
    float _2598 = _2596 + 1.0;
    float _2600 = _2592;
    float _2602 = _2592;
    if (!_2568)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2604 = _1872;
    float _2606 = _1635 * _2594;
    float _2608 = _1645 * _2594;
    float _2610 = _1635 * _2598;
    float _2612 = _2604;
    float _2614 = _2604;
    if (!_2568)
    {
        _2584 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2616 = _2584;
    float _2618 = fma(_1641, _2606, _1629);
    float _2620 = fma(_1643, _2606, _1631);
    float _2622 = fma(_1635, _2608, _1633);
    float _2624 = _2576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2626 = _1232 * _1294;
    out.m_99.x = _2618;
    out.m_99.y = _2620;
    out.m_99.z = _2622;
    out.m_99.w = _2610;
    float _2628 = _2626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2630 = _2626;
    float _2632 = _2624;
    float _2634 = _2616;
    float _2636 = _2616;
    if (!_2568)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _2630;
    out.m_101.x = _2624;
    float _2640 = _2638;
    float _2642 = _2638;
    if (!_2568)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2644 = _2632;
    bool _2646 = !_2568;
    float _2648 = _2644;
    float _2650 = _2644;
    if (!_2646)
    {
        bool _2652 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2654 = isnan(_1464);
        bool _2656 = _2652 || _2654;
        bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2660 = _2656 || _2658;
        if (!_2660)
        {
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2664 = _1464 + _2662;
            float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2668 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2666;
            float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2674 = 1.0 / _2668;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2692 = _2664 * _2674;
            float _2694 = precise::clamp(_2692, 0.0, 1.0);
            float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2700 = fma(_2694, _2672, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2702 = fma(_2694, _2698, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2704 = fma(_2694, _2678, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2706 = fma(_2694, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2708 = fma(_2694, _2686, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2710 = fma(_2694, _2690, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2602 = _2704;
            _2650 = _2708;
            _2590 = _2700;
            _2636 = _2706;
            _2614 = _2702;
            _2642 = _2710;
            _2712 = true;
        }
        else
        {
            bool _2714 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2716 = isnan(_1464);
            bool _2718 = _2714 || _2716;
            bool _2720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2722 = _2718 || _2720;
            if (!_2722)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2724 = _2588;
            _2590 = _2724;
            if (!_2722)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2726 = _2600;
            _2602 = _2726;
            if (!_2722)
            {
                _2612 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2728 = _2612;
            _2614 = _2728;
            if (!_2722)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2730 = _2634;
            _2636 = _2730;
            if (!_2722)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2732 = _2648;
            _2650 = _2732;
            if (!_2722)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2734 = _2640;
            bool _2736 = !_2722;
            _2642 = _2734;
            if (!_2736)
            {
                bool _2738 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2740 = isnan(_1464);
                bool _2742 = _2738 || _2740;
                bool _2744 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2746 = _2742 || _2744;
                if (!_2746)
                {
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2750 = _1464 + _2748;
                    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2754 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2752;
                    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2760 = 1.0 / _2754;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2778 = _2750 * _2760;
                    float _2780 = precise::clamp(_2778, 0.0, 1.0);
                    float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2786 = fma(_2780, _2758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2788 = fma(_2780, _2784, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2790 = fma(_2780, _2764, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2792 = fma(_2780, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2794 = fma(_2780, _2772, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2796 = fma(_2780, _2776, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2602 = _2790;
                    _2650 = _2794;
                    _2590 = _2786;
                    _2636 = _2792;
                    _2614 = _2788;
                    _2642 = _2796;
                    _2712 = true;
                }
                else
                {
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2614 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2712 = false;
    float _2798 = _2602;
    float _2800 = _2650;
    float _2802 = _2590;
    float _2804 = _2636;
    float _2806 = _2614;
    float _2808 = _2642;
    float _2810 = _2628 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2812 = fma(_2436, -0.5, 0.5);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -_2798;
    float _2818 = _2816 + _2800;
    float _2820 = -_2802;
    float _2822 = _2820 + _2804;
    out.m_103.x = 0.0;
    float _2824 = fma(_2814, _2818, _2798);
    float _2826 = -_2806;
    float _2828 = _2826 + _2808;
    float _2830 = fma(_2814, _2822, _2802);
    float _2832 = _2824 * 0.586610972881317138671875;
    bool _2834 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2836 = fma(_2814, _2828, _2806);
    out.m_53.x = _2810;
    float _2838 = fma(_2830, 0.298911988735198974609375, _2832);
    bool _2840 = _1232 > 0.0;
    bool _2842 = isnan(_1232);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan(0.0);
    bool _2848 = _2844 || _2846;
    float _2850 = fma(_2836, 0.114477999508380889892578125, _2838);
    bool _2852 = _1294 <= 0.0;
    bool _2854 = !_2848;
    bool _2856 = _2852 || _2854;
    float _2858 = -_2850;
    float _2860 = _2830 + _2858;
    float _2862 = -_2850;
    float _2864 = _2824 + _2862;
    float _2866 = -_2850;
    float _2868 = _2836 + _2866;
    float _2870 = fma(_2860, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    float _2872 = fma(_2864, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    float _2874 = fma(_2868, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    bool _2876 = !_2834;
    if (!_2876)
    {
        float _2878 = -_1160;
        float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2882 = -_1162;
        float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2886 = -_1164;
        float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2890 = _2880 * _2880;
        float _2892 = fma(_2884, _2884, _2890);
        float _2894 = fma(_2888, _2888, _2892);
        float _2896 = sqrt(_2894);
        float _2898 = rsqrt(_2894);
        float _2900 = -_2896;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2904 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2906 = precise::clamp(_2904, 0.0, 1.0);
        float _2908 = _2884 * _2898;
        float _2910 = _2880 * _2898;
        float _2912 = abs(_2906);
        float _2914 = log2(_2912);
        float _2916 = _2888 * _2898;
        float _2918 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2920 = _2436 * _2910;
        float _2922 = -_2910;
        float _2924 = -_2918;
        float _2926 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2924);
        float _2928 = fma(_2434, _2908, _2920);
        float _2930 = -_2916;
        float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2926);
        float _2934 = fma(_2446, _2916, _2928);
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2940 = _2932 + _2938;
        float _2942 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2944 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        float _2948 = exp2(_2942);
        float _2950 = _2948 * _2946;
        float _2952 = _2936 * _2950;
        float _2954 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2956 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2958 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2954;
        out.m_103.y = _2956;
        out.m_103.z = _2958;
    }
    out.m_73.x = _2870;
    out.m_73.y = _2872;
    out.m_73.z = _2874;
    if (!_2856)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2960;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2712 = false;
    bool _246 = false;
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
        float _3028 = as_type<float>(_144);
        out.gl_Position.z = _3028;
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
        float _3083 = as_type<float>(_170);
        out.gl_Position.z = _3083;
    }
    if (_164)
    {
        return out;
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = 1.0 / _158;
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
    float _200 = _128 * _178;
    float _202 = _174 * _184;
    float _204 = _174 * _190;
    float _206 = fma(_172, _182, _202);
    float _208 = _174 * _196;
    float _210 = fma(_172, _188, _204);
    float _212 = fma(_176, _186, _206);
    float _214 = fma(_172, _194, _208);
    float _216 = fma(_176, _192, _210);
    float _218 = fma(_176, _198, _214);
    bool _220 = !_180;
    float _222 = _200;
    float _224 = _212;
    float _226 = _218;
    float _244;
    if (!_220)
    {
        float _228 = in.m_63.x;
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _232 = _228 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _236 = _234 * _230;
        float _238 = floor(_236);
        float _240 = -_238;
        float _242 = _236 + _240;
        _244 = _242;
        _246 = true;
    }
    else
    {
        _244 = _200;
    }
    _246 = false;
    float _248 = _244;
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
    float _270 = 1.0 / _268;
    bool _272 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _274 = isnan(_248);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_264;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = _282 * _286;
    float _304 = -_282;
    float _306 = _304 + 1.0;
    float _308 = _252 * _270;
    float _310 = in.m_65.x;
    float _312 = in.m_65.y;
    float _314 = in.m_65.z;
    float _316 = fma(_290, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_300, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = fma(_294, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = _316 * _302;
    float _324 = _318 * _302;
    float _326 = _320 * _302;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _330 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _324);
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _334 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].x, _328);
    float _336 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].y, _330);
    float _338 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].z, _332);
    float _340 = _334 * _310;
    float _342 = _336 * _312;
    float _344 = _338 * _314;
    bool _346 = !_296;
    if (!_346)
    {
        float _348 = in.m_63.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _222 = _362;
    }
    float _364 = _222;
    float _366 = in.m_46.x;
    float _368 = in.m_46.y;
    float _370 = in.m_46.z;
    float _372 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = in.m_67.y;
    float _376 = _372 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _378 = in.m_57.w;
    float _380 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _382 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _384 = in.m_61.w;
    float _386 = _184 * _368;
    float _388 = _196 * _368;
    float _390 = _190 * _368;
    float _392 = fma(_182, _366, _386);
    float _394 = fma(_194, _366, _388);
    float _396 = _368 + _374;
    float _398 = fma(_188, _366, _390);
    float _400 = fma(_186, _370, _392);
    float _402 = fma(_198, _370, _394);
    float _404 = -_396;
    float _406 = _404 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _408 = _400 + _378;
    float _410 = _402 + _384;
    float _412 = _406 * _406;
    float _414 = fma(_192, _370, _398);
    float _416 = -_408;
    float _418 = _416 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _420 = -_410;
    float _422 = _420 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _424 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _428 = _408 + _426;
    float _430 = fma(_418, _418, _412);
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _434 = _410 + _432;
    float _436 = -_424;
    float _438 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _436);
    float _440 = fma(_422, _422, _430);
    float _442 = rsqrt(_440);
    float _444 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _446 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _448 = -_444;
    float _450 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _448);
    float _452 = -_446;
    float _454 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _452);
    float _456 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _458 = _418 * _442;
    float _460 = _422 * _442;
    float _462 = _454 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _464 = -_456;
    float _466 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _464);
    float _468 = _458 * _458;
    float _470 = _406 * _442;
    float _472 = -_462;
    float _474 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _472);
    float _476 = fma(_460, _460, _468);
    float _478 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _480 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _482 = rsqrt(_476);
    float _484 = -_478;
    float _486 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _484);
    float _488 = _454 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _490 = -_488;
    float _492 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[1].x, _490);
    float _494 = -_480;
    float _496 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _494);
    float _498 = _450 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _500 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].w, _492);
    float _502 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[1].w, _474);
    float _504 = -_498;
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].y, _504);
    float _508 = _496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _510 = _460 * _482;
    float _512 = _458 * _482;
    float _514 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].w, _506);
    float _516 = _502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _518 = -_510;
    float _520 = _460 * _518;
    float _522 = -_508;
    float _524 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _522);
    float _526 = -_510;
    float _528 = _470 * _526;
    float _530 = -_516;
    float _532 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _530);
    float _534 = -_520;
    float _536 = fma(_458, _512, _534);
    float _538 = _470 * _512;
    float _540 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _524);
    float _542 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _532);
    float _544 = _536 * _536;
    float _546 = _454 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _548 = _454 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _550 = -_540;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[0].w, _542);
    float _554 = fma(_538, _538, _544);
    float _556 = -_546;
    float _558 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _556);
    float _560 = _450 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _562 = -_548;
    float _564 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _562);
    float _566 = fma(_528, _528, _554);
    float _568 = 1.0 / _552;
    float _570 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[0].w, _558);
    float _572 = -_560;
    float _574 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].y, _572);
    float _576 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[0].w, _564);
    float _578 = in.m_59.w;
    float _580 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[0].w, _574);
    float _582 = rsqrt(_566);
    float _584 = fma(_570, _568, -1.0);
    float _586 = _536 * _582;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = -_588;
    float _592 = _590 + 1.0;
    float _594 = _414 + _578;
    float _596 = _592 * _568;
    float _598 = fma(_592, _584, 1.0);
    float _600 = _580 * _596;
    float _602 = _598 * _598;
    float _604 = _576 * _596;
    float _606 = fma(_600, _600, _602);
    float _608 = fma(_604, _604, _606);
    float _610 = rsqrt(_608);
    float _612 = _604 * _610;
    float _614 = _598 * _610;
    float _616 = _600 * _610;
    float _618 = -_612;
    float _620 = _458 * _618;
    float _622 = _460 * _614;
    float _624 = -_616;
    float _626 = -_620;
    float _628 = fma(_460, _624, _626);
    float _630 = -_612;
    float _632 = -_622;
    float _634 = fma(_470, _630, _632);
    float _636 = -_616;
    float _638 = _470 * _636;
    float _640 = _628 * _628;
    float _642 = -_638;
    float _644 = fma(_458, _614, _642);
    float _646 = fma(_634, _634, _640);
    float _648 = fma(_644, _644, _646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _594 + _650;
    float _654 = rsqrt(_648);
    float _656 = _652 * _652;
    float _658 = fma(_428, _428, _656);
    float _660 = fma(_434, _434, _658);
    float _662 = sqrt(_660);
    float _664 = _634 * _654;
    float _666 = _644 * _654;
    float _668 = _628 * _654;
    float _670 = _460 * _664;
    float _672 = _470 * _666;
    float _674 = rsqrt(_660);
    float _676 = -_670;
    float _678 = fma(_458, _666, _676);
    float _680 = -_672;
    float _682 = fma(_460, _668, _680);
    float _684 = _458 * _668;
    float _686 = _678 * _678;
    float _688 = _662 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _690 = -_684;
    float _692 = fma(_470, _664, _690);
    float _694 = fma(_682, _682, _686);
    float _696 = precise::min(_376, _688);
    float _698 = fma(_692, _692, _694);
    float _700 = _674 * _696;
    float _702 = rsqrt(_698);
    float _704 = _652 * _700;
    float _706 = _428 * _700;
    float _708 = _434 * _700;
    float _710 = -_704;
    float _712 = _652 + _710;
    float _714 = -_706;
    float _716 = _428 + _714;
    float _718 = -_708;
    float _720 = _434 + _718;
    float _722 = _712 * _712;
    float _724 = fma(_716, _716, _722);
    float _726 = _692 * _702;
    float _728 = _678 * _702;
    float _730 = _682 * _702;
    float _732 = fma(_720, _720, _724);
    float _734 = _458 * _726;
    float _736 = _460 * _728;
    float _738 = in.m_69.x;
    float _740 = in.m_69.y;
    float _742 = in.m_69.z;
    float _744 = _470 * _730;
    float _746 = -_734;
    float _748 = fma(_460, _730, _746);
    float _750 = -_736;
    float _752 = fma(_470, _726, _750);
    float _754 = sqrt(_732);
    float _756 = -_744;
    float _758 = fma(_458, _728, _756);
    float _760 = _748 * _748;
    float _762 = fma(_752, _752, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = rsqrt(_764);
    float _768 = _674 * _754;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _740);
    float _772 = _380 * _768;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _738);
    float _776 = _372 * _768;
    float _778 = _382 * _768;
    float _780 = _772 * _770;
    float _782 = _776 * _774;
    float _784 = _778 * _742;
    float _786 = _780 * _726;
    float _788 = _758 * _766;
    float _790 = _780 * _730;
    float _792 = _752 * _766;
    float _794 = _748 * _766;
    float _796 = fma(_782, _788, _786);
    float _798 = -_708;
    float _800 = _410 + _798;
    float _802 = fma(_782, _792, _790);
    float _804 = fma(_784, _460, _796);
    float _806 = fma(_784, _458, _802);
    float _808 = _410 + _804;
    float _810 = _408 + _806;
    float _812 = -_704;
    float _814 = _812 + _396;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _808 + _816;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _822 = _810 + _820;
    float _824 = _818 * _818;
    float _826 = fma(_822, _822, _824);
    float _828 = _780 * _728;
    float _830 = sqrt(_826);
    float _832 = fma(_782, _794, _828);
    float _834 = -_706;
    float _836 = _408 + _834;
    float _838 = _814 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _840 = fma(_784, _470, _832);
    float _842 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[11].x, _838);
    float _844 = _396 + _840;
    float _846 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].z, _842);
    bool _848 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _860 = _858 != 0;
    bool _862 = !_856;
    int _864 = _862 ? 0 : 1;
    bool _866 = !_852;
    int _868 = _866 ? 0 : 1;
    bool _870 = !_860;
    int _872 = _870 ? 0 : 1;
    float _874 = _840;
    float _876 = _766;
    float _878 = _810;
    float _880 = _704;
    float _882 = _706;
    float _884 = _708;
    if (!_848)
    {
        _874 = _808;
    }
    float _886 = _874;
    float _888 = _886;
    if (!_848)
    {
        _876 = _844;
    }
    float _890 = _876;
    bool _892 = !_848;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _830 + _898;
        float _902 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = _900 * _896;
        float _906 = rsqrt(_826);
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = sin(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = fma(_912, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _920 = _906 * _918;
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_822, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _928 = fma(_818, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _930 = fma(_844, _916, _924);
        _894 = _930;
        _878 = _926;
        _888 = _928;
    }
    float _932 = _894;
    float _934 = _878;
    float _936 = _888;
    float _938 = -_396;
    float _940 = _938 + _932;
    float _942 = -_408;
    float _944 = _942 + _934;
    float _946 = _846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _948 = _814 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _950 = _940 * _940;
    float _952 = -_410;
    float _954 = _952 + _936;
    float _956 = 1.0 / _946;
    float _958 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _960 = fma(_944, _944, _950);
    float _962 = -_706;
    float _964 = _962 + _934;
    float _966 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].z, _958);
    float _968 = fma(_954, _954, _960);
    float _970 = -_704;
    float _972 = _970 + _932;
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _976 = sqrt(_968);
    float _978 = _974 + _946;
    float _980 = _978 * _956;
    float _982 = _980 * 0.5;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _986 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[30].w, _984);
    float _988 = 1.0 / _986;
    bool _990 = _976 > 0.0;
    bool _992 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _994 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    float _1002 = -_708;
    float _1004 = _1002 + _936;
    bool _1006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.5);
    bool _1014 = _1010 || _1012;
    float _1016 = _936;
    float _1018 = _972;
    float _1020 = _968;
    if (!_990)
    {
        _880 = _964;
    }
    float _1022 = _880;
    float _1024 = _1022;
    if (!_990)
    {
        _882 = _972;
    }
    float _1026 = _882;
    float _1028 = _1026;
    if (!_990)
    {
        _1016 = _1004;
    }
    float _1030 = _1016;
    bool _1032 = !_990;
    float _1034 = _1030;
    float _1036 = _1030;
    if (!_1032)
    {
        float _1038 = _216 * _216;
        float _1040 = fma(_212, _212, _1038);
        float _1042 = fma(_218, _218, _1040);
        float _1044 = rsqrt(_968);
        float _1046 = sqrt(_1042);
        float _1048 = _944 * _1044;
        float _1050 = _940 * _1044;
        float _1052 = _954 * _1044;
        bool _1054 = _1046 > 0.0;
        float _1056 = _1044;
        float _1058 = _1046;
        if (!_1054)
        {
            _1056 = _964;
        }
        float _1060 = _1056;
        _1024 = _1060;
        if (!_1054)
        {
            _1058 = _972;
        }
        float _1062 = _1058;
        _1028 = _1062;
        if (!_1054)
        {
            _1034 = _1004;
        }
        float _1064 = _1034;
        bool _1066 = !_1054;
        _1036 = _1064;
        if (!_1066)
        {
            float _1068 = rsqrt(_1042);
            float _1070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1072 = _216 * _1068;
            float _1074 = _212 * _1068;
            float _1076 = _1050 * _1072;
            float _1078 = _218 * _1068;
            float _1080 = fma(_1048, _1074, _1076);
            float _1082 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1084 = fma(_1052, _1078, _1080);
            float _1086 = _1084 * _1082;
            float _1088 = fma(_212, _1086, _964);
            float _1090 = fma(_216, _1086, _972);
            float _1092 = fma(_218, _1086, _1004);
            _1024 = _1088;
            _1028 = _1090;
            _1036 = _1092;
        }
    }
    float _1094 = _1024;
    float _1096 = _1028;
    float _1098 = _1036;
    float _1100 = _1096;
    float _1102 = _1094;
    float _1104 = _1098;
    if (_1000)
    {
        _224 = 1.0;
    }
    float _1106 = _224;
    float _1108 = _1106;
    if (!_1014)
    {
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1112 = _814 + _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1116 = _836 + _1114;
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1120 = _1112 * _1112;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1124 = _800 + _1122;
        float _1126 = fma(_1116, _1116, _1120);
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1130 = fma(_1124, _1124, _1126);
        float _1132 = sqrt(_1130);
        float _1134 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1136 = precise::min(_1132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1138 = _1136 * _1128;
        float _1140 = -_836;
        float _1142 = _1140 + _1094;
        float _1144 = _1134 * _1138;
        float _1146 = -_814;
        float _1148 = _1146 + _1096;
        float _1150 = -_800;
        float _1152 = _1150 + _1098;
        float _1154 = fma(_1142, _1144, _836);
        float _1156 = fma(_1148, _1144, _814);
        float _1158 = fma(_1152, _1144, _800);
        _1100 = _1156;
        _1102 = _1154;
        _1104 = _1158;
        _226 = _1152;
    }
    float _1160 = _1100;
    float _1162 = _1102;
    float _1164 = _1104;
    float _1166 = _226;
    float _1168 = 0.0;
    float _1170 = _1166;
    if (_1000)
    {
        _1168 = 1.0;
    }
    float _1172 = _1168;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1176 = _988 * _1174;
    float _1178 = _1172;
    if (!_1000)
    {
        float _1180 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1182 = _1180 * 0.15915493667125701904296875;
        float _1184 = _1182 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1190 = _1188 * 0.15915493667125701904296875;
        float _1192 = _1182 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = 1.0 / _1186;
        float _1198 = _1190 * 6.283185482025146484375;
        float _1200 = cos(_1198);
        float _1202 = _1194 * _1196;
        float _1204 = _1190 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1200 * _1202;
        float _1210 = 1.0 / _1208;
        float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1214 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1212;
        float _1216 = 1.0 / _1214;
        float _1218 = _1206 * _1210;
        float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1222 = fma(_1176, _1218, _1220);
        float _1224 = _1222 * _1216;
        float _1226 = precise::clamp(_1224, 0.0, 1.0);
        _1018 = _1182;
        _1170 = _1190;
        _1108 = _1226;
    }
    float _1228 = _1018;
    float _1230 = _1170;
    float _1232 = _1108;
    float _1234 = _1228;
    float _1236 = _1230;
    if (!_1000)
    {
        float _1238 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = _1240 * 6.283185482025146484375;
        float _1244 = cos(_1242);
        float _1246 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1244;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = 1.0 / _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1270;
        float _1274 = 1.0 / _1272;
        float _1276 = _1264 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1280 = fma(_1176, _1276, _1278);
        float _1282 = _1280 * _1274;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        float _1286 = -_1284;
        float _1288 = _1286 + 1.0;
        _1234 = _1254;
        _1236 = _1266;
        _1178 = _1288;
    }
    float _1290 = _1234;
    float _1292 = _1236;
    float _1294 = _1178;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _1160 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1302 = _1162 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1306 = _1164 + _1304;
    float _1308 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = _1298 * _1298;
    float _1312 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1314 = fma(_1302, _1302, _1310);
    float _1316 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1312);
    float _1318 = fma(_1306, _1306, _1314);
    float _1320 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1322 = rsqrt(_1318);
    float _1324 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1326 = _1302 * _1324;
    float _1328 = _1306 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 * _1328;
    float _1334 = _1330 + _1332;
    float _1336 = sqrt(_1334);
    bool _1338 = _1336 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1336 + _1340;
    float _1344 = _1322;
    float _1346 = _1292;
    float _1348 = _1342;
    float _1350 = _1290;
    float _1352 = _1330;
    if (_1338)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1354;
    }
    float _1356 = _1344;
    if (_1338)
    {
        float _1358 = rsqrt(_1334);
        _1346 = _1358;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (_1338)
    {
        float _1364 = _1342 * _1356;
        _1348 = _1364;
    }
    float _1366 = _1348;
    if (_1338)
    {
        float _1368 = _1366 * 0.15915493667125701904296875;
        _884 = _1368;
    }
    float _1370 = _884;
    float _1372 = _1306;
    float _1374 = _1370;
    if (_1338)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1384 = precise::max(0.0, _1382);
    float _1386 = _1356;
    if (_1338)
    {
        float _1388 = _1370 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = -_1324;
    float _1396 = -_1384;
    float _1398 = fma(_1298, _1394, _1396);
    float _1400 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1338)
    {
        float _1402 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1402;
    }
    float _1404 = _1350;
    float _1406 = _1404;
    if (!_1338)
    {
        _1374 = _1328;
    }
    float _1408 = _1374;
    float _1410 = fma(_836, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1412 = _1408;
    if (_1338)
    {
        float _1414 = fma(_1380, _1404, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = floor(_1410);
    float _1420 = _1416;
    float _1422 = _1392;
    if (_1338)
    {
        float _1424 = _1392 + (-1.0);
        _1400 = _1424;
    }
    float _1426 = _1400;
    float _1428 = _1426;
    if (_1338)
    {
        float _1430 = _1360 * _1416;
        _1020 = _1430;
    }
    float _1432 = _1020;
    if (!_1338)
    {
        _1362 = _1326;
    }
    float _1434 = _1362;
    float _1436 = _1434;
    if (_1338)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1438;
    }
    float _1440 = _1428;
    if (_1338)
    {
        float _1442 = _1326 * _1432;
        _1436 = _1442;
    }
    float _1444 = _1436;
    if (!_1338)
    {
        _1420 = _1398;
    }
    float _1446 = _1420;
    float _1448 = _1446;
    if (_1338)
    {
        float _1450 = _1328 * _1432;
        _1412 = _1450;
    }
    float _1452 = _1412;
    if (_1338)
    {
        float _1454 = fma(_1398, _1392, _1440);
        _1448 = _1454;
    }
    float _1456 = _1448;
    if (_1338)
    {
        float _1458 = _1444 * _1444;
        _1352 = _1458;
    }
    float _1460 = _1352;
    if (!_1338)
    {
        _1422 = _1332;
    }
    float _1462 = _1422;
    float _1464 = sqrt(_1318);
    float _1466 = _1462;
    if (_1338)
    {
        float _1468 = _1452 * _1452;
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = fma(_1456, _1456, _1460);
    float _1474 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1476 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1478 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1472 + _1470;
    float _1482 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1476);
    float _1484 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1488 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1482);
    float _1490 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1492 = rsqrt(_1480);
    float _1494 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1498 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1502 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1500);
    float _1504 = precise::clamp(_1502, 0.0, 1.0);
    float _1506 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1508 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1510 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1512 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1514 = -_1504;
    float _1516 = _1514 + 1.0;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1520 = floor(_1474);
    float _1522 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1512);
    float _1524 = -_1418;
    float _1526 = _1410 + _1524;
    float _1528 = -_1518;
    float _1530 = fma(_1528, _1508, 1.0);
    float _1532 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1534 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1536 = _1492 * _1444;
    float _1538 = _1492 * _1452;
    float _1540 = abs(_1516);
    float _1542 = log2(_1540);
    float _1544 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1534);
    float _1546 = _1492 * _1456;
    float _1548 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1550 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1532);
    float _1552 = -_1548;
    float _1554 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1552);
    float _1556 = 1.0 / _1544;
    float _1558 = -_1520;
    float _1560 = _1474 + _1558;
    float _1562 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1550);
    float _1564 = -_1538;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1554);
    float _1568 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1570 = _1546 + 1.0;
    float _1572 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1574 = fma(_1566, -0.5, 0.5);
    float _1576 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1578 = log2(_1530);
    float _1580 = fma(_1566, 0.5, 0.5);
    float _1582 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1568);
    float _1584 = fma(_1580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1586 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1588 = exp2(_1576);
    float _1590 = fma(_1580, _1584, -0.212114393711090087890625);
    float _1592 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1586);
    float _1594 = _1572 * _1556;
    float _1596 = fma(_1580, _1590, 1.570728778839111328125);
    float _1598 = sqrt(_1574);
    float _1600 = _1578 * 0.693147182464599609375;
    float _1602 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1604 = -_1546;
    float _1606 = fma(_1588, _1570, _1604);
    float _1608 = _1592 * _1556;
    float _1610 = fma(_1594, 0.5, 0.5);
    float _1612 = fma(_1606, 0.5, 0.5);
    float _1614 = fma(_1608, -0.5, 0.5);
    float _1616 = _1598 * 0.636619746685028076171875;
    float2 _5358 = float2(_1526, _1560);
    float _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5358, float2(0.0), isnan(_5358)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5358, float2(0.0), isnan(_5358)), level(0.0)).x;
    float3 _5369 = float3(_1610, _1614, _1602);
    float _1620 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5369, float3(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5369, float3(0.0), isnan(_5369)), level(0.0)).x;
    float _1622 = -_1596;
    float _1624 = fma(_1616, _1622, 1.0);
    float3 _5385 = float3(_1610, _1614, _1602);
    float4 _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5385, float3(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5385, float3(0.0), isnan(_5385)), level(0.0)).xyzw;
    float _1629 = _1627.x;
    float _1631 = _1627.y;
    float _1633 = _1627.z;
    float _1635 = _1627.w;
    float2 _5401 = float2(_1624, _1612);
    float3 _1639 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5401, float2(0.0), isnan(_5401)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5401, float2(0.0), isnan(_5401)), level(0.0)).xyz;
    float _1641 = _1639.x;
    float _1643 = _1639.y;
    float _1645 = _1639.z;
    float _1647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1649 = int(_1647);
    out.m_71.x = _836;
    out.m_71.y = _814;
    out.m_71.z = _800;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1653 = _1651 != 0;
    int _1655 = abs(_868);
    out.m_73.w = _696;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1659 = _1657 != 0;
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1663 = int(_1661);
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1667 = _1665 != 0;
    out.m_75.x = _776;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1671 = _1669 != 0;
    out.m_77.x = _1162;
    out.m_77.y = _1160;
    out.m_77.z = _1164;
    float _1673 = float(_1649);
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1677 = 1.0 / _1673;
    float _1679 = float(uint(_1663));
    int _1681 = ~_1663;
    int _1683 = _1681 + 1;
    bool _1685 = _1663 == 0;
    float _1687 = 1.0 / _1679;
    float _1689 = _128 * _1677;
    int _1691 = ~_1663;
    int _1693 = _1691 + 1;
    float _1695 = trunc(_1689);
    int _1697 = int(_1695);
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1701 = _1699 != 0;
    int _1703 = as_type<int>(_1687) + (-2);
    float _1705 = float(uint(_1697));
    float _1707 = as_type<float>(_1703) * _1705;
    float _1709 = in.m_63.x;
    float _1711 = in.m_63.y;
    float _1713 = in.m_63.z;
    float _1715 = trunc(_1707);
    float _1717 = precise::max(_1715, 0.0);
    uint _1720 = uint(_1717);
    bool _1722 = !_1701;
    float _1724 = _1722 ? 7.345489978790283203125 : 1.0;
    float _1726 = float(_1697);
    int _1728 = _1693 * int(_1720);
    int _1730 = _1728 + _1697;
    float _1732 = float(uint(_1730));
    float _1734 = _1724 * _1709;
    float _1736 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1738 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1675);
    float _1740 = as_type<float>(_1703) * _1732;
    float _1742 = floor(_1734);
    float _1744 = trunc(_1740);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    int _1750 = int(_1720) + int(_1748);
    float _1752 = -_1742;
    float _1754 = _1734 + _1752;
    float _1756 = float(_1663);
    float _1758 = in.m_79.y;
    int _1760 = _1683 * _1750;
    int _1762 = _1760 + _1697;
    bool _1764 = _1726 >= _1756;
    bool _1766 = isnan(_1726);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(_1756);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = _128 * _1756;
    float _1778 = _1754 * _1756;
    bool _1780 = uint(_1762) >= uint(_1663);
    float _1782 = _1776 * _178;
    float _1784 = trunc(_1774);
    int _1786 = int(_1784);
    float _1788 = in.m_81.w;
    bool _1790 = !_1780;
    int _1792 = _1790 ? 0 : (-1);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1796 = _1794 != 0;
    int _1798 = ~_1750;
    int _1800 = _1798 + _1792;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1778);
    int _1806 = int(_1804);
    bool _1808 = !_1796;
    int _1810 = _1808 ? 0 : 1;
    int _1812 = _1663 * _1802;
    int _1814 = _1812 + _1697;
    int _1816 = abs(_864);
    int _1818 = abs(_1810);
    int _1820 = ~_1786;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    float _1826 = trunc(_1782);
    int _1828 = int(_1826);
    bool _1830 = !_1685;
    int _1832 = _1830 ? _1814 : (-1);
    int _1834 = _1832 * _1824;
    int _1836 = _1663 + (-1);
    int _1838 = _1806 * _1818;
    int _1840 = _1838 + _1697;
    int _1842 = abs(_872);
    out.m_83.w = _1788;
    int _1844 = _1786 * _1836;
    int _1846 = _1844 + _1834;
    bool _1848 = _1711 > 0.5;
    int _1850 = _1846 * _1816;
    float _1852 = -_1758;
    float _1854 = _1852 + 1.0;
    int _1856 = _1828 * _1655;
    int _1858 = _1856 + _1850;
    bool _1860 = !_1653;
    int _1862 = _1860 ? 0 : 1;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1866 = _1758;
    float _1868 = _1544;
    float _1870 = _1572;
    float _1872 = _1592;
    if (_1659)
    {
        float _1874 = _1848 ? _1854 : _1758;
        _1866 = _1874;
    }
    float _1876 = _1866;
    int _1878 = _1840 * _1842;
    int _1880 = _1878 + _1858;
    int _1882 = abs(_1862);
    float _1884 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1864);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1888 = _1806 * _1882;
    int _1890 = _1888 + _1880;
    float _1892 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1898 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1886);
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1904 = float(uint(_1890));
    float _1906 = as_type<float>(_1806);
    if (_1667)
    {
        float _1908 = in.m_63.x;
        _1906 = _1908;
    }
    float _1910 = _1906;
    float _1912 = 1.0 / _1896;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1916 = as_type<float>(_1703) * _1904;
    float _1918 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1884);
    float _1920 = fma(_1736, -2.0, _1914);
    bool _1922 = _740 != 0.0;
    bool _1924 = isnan(_740);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    float _1932 = trunc(_1916);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1940 = _1918 * (-0.15915493667125701904296875);
    float _1942 = -_1938;
    float _1944 = fma(_1892, 2.0, _1942);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1948 = 1.0 / _1902;
    int _1950 = ~_1663;
    int _1952 = _1950 + 1;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1956 = _738 == 0.0;
    bool _1958 = !_1930;
    bool _1960 = _1956 && _1958;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1964 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1966 = _1952 * int(_1936);
    int _1968 = _1966 + _1890;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1970;
    bool _1974 = _742 == 0.0;
    bool _1976 = _1974 && _1960;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1980 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = float(uint(_1968));
    float _1984 = _1972 * _1912;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1990 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = in.m_85.x;
    float _1994 = in.m_85.y;
    float _1996 = in.m_85.z;
    float _1998 = as_type<float>(_1703) * _1982;
    float _2000 = _1988 * _1948;
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_87.x = _1964;
    out.m_87.y = _1980;
    out.m_87.z = _1990;
    out.m_87.w = _1978;
    float _2006 = trunc(_1998);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    bool _2012 = _1910 > 0.5;
    bool _2014 = _2012 && _1667;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2016;
    float _2020 = in.m_79.x;
    float _2022 = -_128;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1944);
    float _2026 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1920);
    float _2028 = 1.0 / _2004;
    int _2030 = ~_1663;
    int _2032 = _2030 + 1;
    float _2034 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1898);
    float _2036 = float(uint(_1840));
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2040 = _364 + _2038;
    int _2042 = int(_1936) + int(_2010);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2046 = _364 + _2044;
    int _2048 = ~_1663;
    int _2050 = _2048 + 1;
    float _2052 = _1994;
    float _2054 = _1992;
    float _2056 = _1996;
    if (!_1976)
    {
        float _2058 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1994);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = as_type<float>(_1703) * _2036;
    float _2064 = fma(_2000, _2040, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2066 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2068 = isnan(_364);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    if (!_1976)
    {
        float _2078 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1992);
        _2054 = _2078;
    }
    float _2080 = _2054;
    bool _2082 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2084 = isnan(_364);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    float _2094 = fma(_1984, _2046, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2096 = trunc(_2062);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    float _2102 = _2018 * _2028;
    float _2104 = -_2076;
    float _2106 = _2104 + 1.0;
    bool _2108 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2110 = isnan(_364);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    int _2120 = _2050 * _2042;
    int _2122 = _2120 + _1890;
    float _2124 = -_2092;
    float _2126 = _2124 + 1.0;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2130 = _364 + _2128;
    float _2132 = _2092 * _2106;
    float _2134 = _2118;
    float _2136 = _2020;
    if (!_1976)
    {
        float _2138 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1996);
        _2056 = _2138;
    }
    float _2140 = _2056;
    float _2142 = _2118 * _2126;
    bool _2144 = uint(_2122) >= uint(_1663);
    float _2146 = fma(_2102, _2130, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1738);
    bool _2150 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2152 = isnan(_364);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = -_2118;
    float _2164 = _2162 + 1.0;
    bool _2166 = !_2144;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = _1940 * 6.283185482025146484375;
    float _2172 = sin(_2170);
    int _2174 = _2032 * int(_2100);
    int _2176 = _2174 + _1840;
    if (_1667)
    {
        _2134 = _2020;
    }
    float _2178 = _2134;
    float _2180 = _2160 * _2164;
    int _2182 = ~_2042;
    int _2184 = _2182 + _2168;
    int _2186 = _2184 + 1;
    float _2188 = -_2160;
    float _2190 = _2188 + 1.0;
    float _2192 = float(uint(_2176));
    float _2194 = _2178;
    if (_2014)
    {
        float _2196 = -_2178;
        float _2198 = _2196 + 1.0;
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _1940 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    float _2206 = _2094 * _2180;
    int _2208 = _1663 * _2186;
    int _2210 = _2208 + _1890;
    float _2212 = as_type<float>(_1703) * _2192;
    if (_1667)
    {
        _2136 = _2200;
    }
    float _2214 = _2136;
    float _2216 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2206);
    float _2218 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2220 = !_1685;
    int _2222 = _2220 ? _2210 : (-1);
    float _2224 = trunc(_2212);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    float _2230 = fma(_2064, _2142, _2216);
    float _2232 = _2172 * _2218;
    float _2234 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2236 = _2222 >> 31;
    float _2238 = _730 * _2060;
    int _2240 = _2222 & 3;
    bool _2242 = _2240 != 0;
    float _2244 = _728 * _2060;
    float _2246 = _2204 * _2218;
    int _2248 = _2236 & 3;
    float _2250 = -_2232;
    float _2252 = fma(_2204, _2234, _2250);
    float _2254 = fma(_2172, _2234, _2246);
    float _2256 = fma(_2146, _2132, _2230);
    int _2258 = _2222 + _2248;
    float _2260 = fma(_2034, _2252, _2024);
    int _2262 = int(_2100) + int(_2228);
    float _2264 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2256);
    int _2266 = _2258 >> 2;
    float _2268 = abs(_1176);
    float _2270 = log2(_2268);
    float _2272 = -_2026;
    float _2274 = fma(_2148, _2254, _2272);
    int _2276 = ~_1663;
    int _2278 = _2276 + 1;
    float _2280 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2282 = _2266 << 4;
    int _2284 = _2282 + 368;
    float _2286 = _2274 + 0.5;
    int _2288 = _2278 * _2262;
    int _2290 = _2288 + _1840;
    uint _2292 = uint(int(uint(_2284) >> uint(2)));
    uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
    int _2296 = int(_2292) & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    int _2300 = int(_2292) + 1;
    uint _2302 = uint(int(uint(_2300) >> uint(2)));
    int _2304 = _2300 & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    float _2308 = _726 * _2060;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2314 = uint(_2290) >= uint(_1663);
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2318 = _2222 & 3;
    bool _2320 = _2318 != 0;
    float _2322 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2324 = _2284 + 8;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    float _2342 = _2260 + 0.5;
    bool _2344 = !_2314;
    int _2346 = _2344 ? 0 : (-1);
    float _2348 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2350 = uint(_2318) > 1u;
    float _2352 = exp2(_2322);
    int _2354 = ~_2262;
    int _2356 = _2354 + _2346;
    int _2358 = _2356 + 1;
    float _2360 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2362 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2364 = _2242 ? 0 : 1;
    int _2366 = _1663 * _2358;
    int _2368 = _2366 + _1840;
    out.m_89.x = _2342;
    out.m_89.y = _2286;
    bool _2370 = _2318 != 3;
    float _2372 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2374 = uint(_2318) >= 2u;
    out.m_91.x = _2348;
    out.m_91.y = _2360;
    out.m_91.z = _2362;
    out.m_91.w = _2280;
    bool _2376 = !_2320;
    int _2378 = _2376 ? 0 : 1;
    float _2380 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2372);
    bool _2382 = _2318 != 3;
    float _2384 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2386 = precise::clamp(_2384, 0.0, 1.0);
    bool _2388 = !_1685;
    int _2390 = _2388 ? _2368 : (-1);
    float _2392 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    int _2394 = ~_2364;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    float _2400 = fma(_792, _2080, _2238);
    int _2402 = _2398;
    if (!_2350)
    {
        int _2404 = ~_2364;
        int _2406 = _2404 + 1;
        _2402 = _2406;
    }
    int _2408 = _2402;
    float _2410 = fma(_794, _2080, _2244);
    bool _2412 = _1176 <= 8000.0;
    bool _2414 = isnan(_1176);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan(8000.0);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = fma(_788, _2080, _2308);
    int _2426 = abs(_2408);
    float _2428 = fma(_2386, -2.0, 3.0);
    float _2430 = _2386 * _2386;
    int _2432 = _2374 ? 0 : 1;
    float _2434 = fma(_458, _2140, _2400);
    float _2436 = fma(_470, _2140, _2410);
    float _2438 = _2430 * _2428;
    int _2440 = ~_2432;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = fma(_460, _2140, _2424);
    int _2448 = _2444;
    if (_2370)
    {
        int _2450 = ~_2432;
        int _2452 = _2450 + 1;
        _2448 = _2452;
    }
    int _2454 = _2448;
    float _2456 = -_2438;
    float _2458 = _2456 + 1.0;
    int _2460 = abs(_2378);
    float _2462 = -_1618;
    float _2464 = _2462 + 1.0;
    int _2466 = ~_2426;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2438);
    int _2474 = abs(_2454);
    out.m_93.x = _2434;
    out.m_93.y = _2436;
    out.m_93.z = _2446;
    bool _2476 = !_2382;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2470 * as_type<int>(_2306);
    int _2482 = ~_2460;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = abs(_2478);
    int _2490 = ~_2474;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2486 * as_type<int>(_2298);
    int _2498 = _2496 + _2480;
    bool _2500 = !_1671;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = _1544 * 0.5;
    int _2506 = ~_2488;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = _2494 * as_type<int>(_2332);
    int _2514 = _2512 + _2498;
    int _2516 = abs(_2502);
    float _2518 = fma(_1592, -0.5, _2504);
    float _2520 = in.m_67.x;
    int _2522 = _2510 * as_type<int>(_2340);
    int _2524 = _2522 + _2514;
    int _2526 = ~_2516;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    float _2532 = _2422 * _2472;
    int _2534 = _2524 * _2530;
    float _2536 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2538 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2392);
    float _2540 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2542 = _2390 * _2516;
    int _2544 = _2542 + _2534;
    float _2546 = _1572 + _1544;
    float _2548 = _2538 + _1544;
    float _2550 = exp2(_2536);
    float _2552 = _2464 * _2540;
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    float _2556 = _2546 * 0.5;
    float _2558 = _2548 * 0.5;
    bool _2560 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2562 = isnan(_1464);
    bool _2564 = _2560 || _2562;
    bool _2566 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2568 = _2564 || _2566;
    float _2570 = -_2554;
    float _2572 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2574 = float(_2544);
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1592;
    out.gl_Position.z = _2538;
    out.gl_Position.w = _1544;
    float _2576 = _2572 * _2520;
    out.m_95.x = _2556;
    out.m_95.y = _2518;
    out.m_95.z = _2558;
    out.m_95.w = _1544;
    out.m_97.x = _2574;
    float _2578 = -_2550;
    float _2580 = _2578 + 1.0;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2584 = _2574;
    if (!_2568)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2586 = _1868;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2568)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2592 = _1870;
    float _2594 = _2582 * _1620;
    float _2596 = -_2582;
    float _2598 = _2596 + 1.0;
    float _2600 = _2592;
    float _2602 = _2592;
    if (!_2568)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2604 = _1872;
    float _2606 = _1635 * _2594;
    float _2608 = _1645 * _2594;
    float _2610 = _1635 * _2598;
    float _2612 = _2604;
    float _2614 = _2604;
    if (!_2568)
    {
        _2584 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2616 = _2584;
    float _2618 = fma(_1641, _2606, _1629);
    float _2620 = fma(_1643, _2606, _1631);
    float _2622 = fma(_1635, _2608, _1633);
    float _2624 = _2576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2626 = _1232 * _1294;
    out.m_99.x = _2618;
    out.m_99.y = _2620;
    out.m_99.z = _2622;
    out.m_99.w = _2610;
    float _2628 = _2626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2630 = _2626;
    float _2632 = _2624;
    float _2634 = _2616;
    float _2636 = _2616;
    if (!_2568)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _2630;
    out.m_101.x = _2624;
    float _2640 = _2638;
    float _2642 = _2638;
    if (!_2568)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2644 = _2632;
    bool _2646 = !_2568;
    float _2648 = _2644;
    float _2650 = _2644;
    if (!_2646)
    {
        bool _2652 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2654 = isnan(_1464);
        bool _2656 = _2652 || _2654;
        bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2660 = _2656 || _2658;
        if (!_2660)
        {
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2664 = _1464 + _2662;
            float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2668 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2666;
            float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2674 = 1.0 / _2668;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2692 = _2664 * _2674;
            float _2694 = precise::clamp(_2692, 0.0, 1.0);
            float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2700 = fma(_2694, _2672, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2702 = fma(_2694, _2698, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2704 = fma(_2694, _2678, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2706 = fma(_2694, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2708 = fma(_2694, _2686, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2710 = fma(_2694, _2690, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2602 = _2704;
            _2650 = _2708;
            _2590 = _2700;
            _2636 = _2706;
            _2614 = _2702;
            _2642 = _2710;
            _2712 = true;
        }
        else
        {
            bool _2714 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2716 = isnan(_1464);
            bool _2718 = _2714 || _2716;
            bool _2720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2722 = _2718 || _2720;
            if (!_2722)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2724 = _2588;
            _2590 = _2724;
            if (!_2722)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2726 = _2600;
            _2602 = _2726;
            if (!_2722)
            {
                _2612 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2728 = _2612;
            _2614 = _2728;
            if (!_2722)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2730 = _2634;
            _2636 = _2730;
            if (!_2722)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2732 = _2648;
            _2650 = _2732;
            if (!_2722)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2734 = _2640;
            bool _2736 = !_2722;
            _2642 = _2734;
            if (!_2736)
            {
                bool _2738 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2740 = isnan(_1464);
                bool _2742 = _2738 || _2740;
                bool _2744 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2746 = _2742 || _2744;
                if (!_2746)
                {
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2750 = _1464 + _2748;
                    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2754 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2752;
                    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2760 = 1.0 / _2754;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2778 = _2750 * _2760;
                    float _2780 = precise::clamp(_2778, 0.0, 1.0);
                    float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2786 = fma(_2780, _2758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2788 = fma(_2780, _2784, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2790 = fma(_2780, _2764, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2792 = fma(_2780, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2794 = fma(_2780, _2772, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2796 = fma(_2780, _2776, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2602 = _2790;
                    _2650 = _2794;
                    _2590 = _2786;
                    _2636 = _2792;
                    _2614 = _2788;
                    _2642 = _2796;
                    _2712 = true;
                }
                else
                {
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2614 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2712 = false;
    float _2798 = _2602;
    float _2800 = _2650;
    float _2802 = _2590;
    float _2804 = _2636;
    float _2806 = _2614;
    float _2808 = _2642;
    float _2810 = _2628 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2812 = fma(_2436, -0.5, 0.5);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -_2798;
    float _2818 = _2816 + _2800;
    float _2820 = -_2802;
    float _2822 = _2820 + _2804;
    out.m_103.x = 0.0;
    float _2824 = fma(_2814, _2818, _2798);
    float _2826 = -_2806;
    float _2828 = _2826 + _2808;
    float _2830 = fma(_2814, _2822, _2802);
    float _2832 = _2824 * 0.586610972881317138671875;
    bool _2834 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2836 = fma(_2814, _2828, _2806);
    out.m_53.x = _2810;
    float _2838 = fma(_2830, 0.298911988735198974609375, _2832);
    bool _2840 = _1232 > 0.0;
    bool _2842 = isnan(_1232);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan(0.0);
    bool _2848 = _2844 || _2846;
    float _2850 = fma(_2836, 0.114477999508380889892578125, _2838);
    bool _2852 = _1294 <= 0.0;
    bool _2854 = !_2848;
    bool _2856 = _2852 || _2854;
    float _2858 = -_2850;
    float _2860 = _2830 + _2858;
    float _2862 = -_2850;
    float _2864 = _2824 + _2862;
    float _2866 = -_2850;
    float _2868 = _2836 + _2866;
    float _2870 = fma(_2860, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    float _2872 = fma(_2864, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    float _2874 = fma(_2868, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    bool _2876 = !_2834;
    if (!_2876)
    {
        float _2878 = -_1160;
        float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2882 = -_1162;
        float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2886 = -_1164;
        float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2890 = _2880 * _2880;
        float _2892 = fma(_2884, _2884, _2890);
        float _2894 = fma(_2888, _2888, _2892);
        float _2896 = sqrt(_2894);
        float _2898 = rsqrt(_2894);
        float _2900 = -_2896;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2904 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2906 = precise::clamp(_2904, 0.0, 1.0);
        float _2908 = _2884 * _2898;
        float _2910 = _2880 * _2898;
        float _2912 = abs(_2906);
        float _2914 = log2(_2912);
        float _2916 = _2888 * _2898;
        float _2918 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2920 = _2436 * _2910;
        float _2922 = -_2910;
        float _2924 = -_2918;
        float _2926 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2924);
        float _2928 = fma(_2434, _2908, _2920);
        float _2930 = -_2916;
        float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2926);
        float _2934 = fma(_2446, _2916, _2928);
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2940 = _2932 + _2938;
        float _2942 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2944 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        float _2948 = exp2(_2942);
        float _2950 = _2948 * _2946;
        float _2952 = _2936 * _2950;
        float _2954 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2956 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2958 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2954;
        out.m_103.y = _2956;
        out.m_103.z = _2958;
    }
    out.m_73.x = _2870;
    out.m_73.y = _2872;
    out.m_73.z = _2874;
    if (!_2856)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2960;
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
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2712 = false;
    bool _246 = false;
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
        float _3028 = as_type<float>(_144);
        out.gl_Position.z = _3028;
    }
    if (!_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3083 = as_type<float>(_170);
        out.gl_Position.z = _3083;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _172 = in.m_55.x;
    float _174 = in.m_55.y;
    float _176 = in.m_55.z;
    float _178 = 1.0 / _158;
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
    float _200 = _128 * _178;
    float _202 = _174 * _184;
    float _204 = _174 * _190;
    float _206 = fma(_172, _182, _202);
    float _208 = _174 * _196;
    float _210 = fma(_172, _188, _204);
    float _212 = fma(_176, _186, _206);
    float _214 = fma(_172, _194, _208);
    float _216 = fma(_176, _192, _210);
    float _218 = fma(_176, _198, _214);
    bool _220 = !_180;
    float _222 = _200;
    float _224 = _212;
    float _226 = _218;
    float _244;
    if (!_220)
    {
        float _228 = in.m_63.x;
        float _230 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _232 = _228 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _234 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _236 = _234 * _230;
        float _238 = floor(_236);
        float _240 = -_238;
        float _242 = _236 + _240;
        _244 = _242;
        _246 = true;
    }
    else
    {
        _244 = _200;
    }
    _246 = false;
    float _248 = _244;
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
    float _270 = 1.0 / _268;
    bool _272 = _248 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _274 = isnan(_248);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -_264;
    float _286 = _284 + 1.0;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _288;
    float _292 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _294 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _292;
    bool _296 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _298;
    float _302 = _282 * _286;
    float _304 = -_282;
    float _306 = _304 + 1.0;
    float _308 = _252 * _270;
    float _310 = in.m_65.x;
    float _312 = in.m_65.y;
    float _314 = in.m_65.z;
    float _316 = fma(_290, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _318 = fma(_300, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _320 = fma(_294, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _322 = _316 * _302;
    float _324 = _318 * _302;
    float _326 = _320 * _302;
    float _328 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].x, _322);
    float _330 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].y, _324);
    float _332 = fma(_306, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _334 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].x, _328);
    float _336 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].y, _330);
    float _338 = fma(_264, (*spvDescriptorSet0.vp_c9)._m0[144].z, _332);
    float _340 = _334 * _310;
    float _342 = _336 * _312;
    float _344 = _338 * _314;
    bool _346 = !_296;
    if (!_346)
    {
        float _348 = in.m_63.x;
        float _350 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _352 = _348 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _354 = fma(_352, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _356 = _354 * _350;
        float _358 = floor(_356);
        float _360 = -_358;
        float _362 = _356 + _360;
        _222 = _362;
    }
    float _364 = _222;
    float _366 = in.m_46.x;
    float _368 = in.m_46.y;
    float _370 = in.m_46.z;
    float _372 = _340 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _374 = in.m_67.y;
    float _376 = _372 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _378 = in.m_57.w;
    float _380 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _382 = _344 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _384 = in.m_61.w;
    float _386 = _184 * _368;
    float _388 = _196 * _368;
    float _390 = _190 * _368;
    float _392 = fma(_182, _366, _386);
    float _394 = fma(_194, _366, _388);
    float _396 = _368 + _374;
    float _398 = fma(_188, _366, _390);
    float _400 = fma(_186, _370, _392);
    float _402 = fma(_198, _370, _394);
    float _404 = -_396;
    float _406 = _404 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _408 = _400 + _378;
    float _410 = _402 + _384;
    float _412 = _406 * _406;
    float _414 = fma(_192, _370, _398);
    float _416 = -_408;
    float _418 = _416 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _420 = -_410;
    float _422 = _420 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _424 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _426 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _428 = _408 + _426;
    float _430 = fma(_418, _418, _412);
    float _432 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _434 = _410 + _432;
    float _436 = -_424;
    float _438 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _436);
    float _440 = fma(_422, _422, _430);
    float _442 = rsqrt(_440);
    float _444 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _446 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _448 = -_444;
    float _450 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _448);
    float _452 = -_446;
    float _454 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _452);
    float _456 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _458 = _418 * _442;
    float _460 = _422 * _442;
    float _462 = _454 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _464 = -_456;
    float _466 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _464);
    float _468 = _458 * _458;
    float _470 = _406 * _442;
    float _472 = -_462;
    float _474 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].x, _472);
    float _476 = fma(_460, _460, _468);
    float _478 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _480 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _482 = rsqrt(_476);
    float _484 = -_478;
    float _486 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _484);
    float _488 = _454 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _490 = -_488;
    float _492 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[1].x, _490);
    float _494 = -_480;
    float _496 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _494);
    float _498 = _450 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _500 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].w, _492);
    float _502 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[1].w, _474);
    float _504 = -_498;
    float _506 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[1].y, _504);
    float _508 = _496 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _510 = _460 * _482;
    float _512 = _458 * _482;
    float _514 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].w, _506);
    float _516 = _502 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _518 = -_510;
    float _520 = _460 * _518;
    float _522 = -_508;
    float _524 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[1].x, _522);
    float _526 = -_510;
    float _528 = _470 * _526;
    float _530 = -_516;
    float _532 = fma(_514, (*spvDescriptorSet0.vp_c8)._m0[0].x, _530);
    float _534 = -_520;
    float _536 = fma(_458, _512, _534);
    float _538 = _470 * _512;
    float _540 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[1].z, _524);
    float _542 = fma(_500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _532);
    float _544 = _536 * _536;
    float _546 = _454 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _548 = _454 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _550 = -_540;
    float _552 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[0].w, _542);
    float _554 = fma(_538, _538, _544);
    float _556 = -_546;
    float _558 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].x, _556);
    float _560 = _450 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _562 = -_548;
    float _564 = fma(_450, (*spvDescriptorSet0.vp_c8)._m0[0].x, _562);
    float _566 = fma(_528, _528, _554);
    float _568 = 1.0 / _552;
    float _570 = fma(_496, (*spvDescriptorSet0.vp_c8)._m0[0].w, _558);
    float _572 = -_560;
    float _574 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[0].y, _572);
    float _576 = fma(_466, (*spvDescriptorSet0.vp_c8)._m0[0].w, _564);
    float _578 = in.m_59.w;
    float _580 = fma(_486, (*spvDescriptorSet0.vp_c8)._m0[0].w, _574);
    float _582 = rsqrt(_566);
    float _584 = fma(_570, _568, -1.0);
    float _586 = _536 * _582;
    float _588 = precise::clamp(_586, 0.0, 1.0);
    float _590 = -_588;
    float _592 = _590 + 1.0;
    float _594 = _414 + _578;
    float _596 = _592 * _568;
    float _598 = fma(_592, _584, 1.0);
    float _600 = _580 * _596;
    float _602 = _598 * _598;
    float _604 = _576 * _596;
    float _606 = fma(_600, _600, _602);
    float _608 = fma(_604, _604, _606);
    float _610 = rsqrt(_608);
    float _612 = _604 * _610;
    float _614 = _598 * _610;
    float _616 = _600 * _610;
    float _618 = -_612;
    float _620 = _458 * _618;
    float _622 = _460 * _614;
    float _624 = -_616;
    float _626 = -_620;
    float _628 = fma(_460, _624, _626);
    float _630 = -_612;
    float _632 = -_622;
    float _634 = fma(_470, _630, _632);
    float _636 = -_616;
    float _638 = _470 * _636;
    float _640 = _628 * _628;
    float _642 = -_638;
    float _644 = fma(_458, _614, _642);
    float _646 = fma(_634, _634, _640);
    float _648 = fma(_644, _644, _646);
    float _650 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _652 = _594 + _650;
    float _654 = rsqrt(_648);
    float _656 = _652 * _652;
    float _658 = fma(_428, _428, _656);
    float _660 = fma(_434, _434, _658);
    float _662 = sqrt(_660);
    float _664 = _634 * _654;
    float _666 = _644 * _654;
    float _668 = _628 * _654;
    float _670 = _460 * _664;
    float _672 = _470 * _666;
    float _674 = rsqrt(_660);
    float _676 = -_670;
    float _678 = fma(_458, _666, _676);
    float _680 = -_672;
    float _682 = fma(_460, _668, _680);
    float _684 = _458 * _668;
    float _686 = _678 * _678;
    float _688 = _662 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _690 = -_684;
    float _692 = fma(_470, _664, _690);
    float _694 = fma(_682, _682, _686);
    float _696 = precise::min(_376, _688);
    float _698 = fma(_692, _692, _694);
    float _700 = _674 * _696;
    float _702 = rsqrt(_698);
    float _704 = _652 * _700;
    float _706 = _428 * _700;
    float _708 = _434 * _700;
    float _710 = -_704;
    float _712 = _652 + _710;
    float _714 = -_706;
    float _716 = _428 + _714;
    float _718 = -_708;
    float _720 = _434 + _718;
    float _722 = _712 * _712;
    float _724 = fma(_716, _716, _722);
    float _726 = _692 * _702;
    float _728 = _678 * _702;
    float _730 = _682 * _702;
    float _732 = fma(_720, _720, _724);
    float _734 = _458 * _726;
    float _736 = _460 * _728;
    float _738 = in.m_69.x;
    float _740 = in.m_69.y;
    float _742 = in.m_69.z;
    float _744 = _470 * _730;
    float _746 = -_734;
    float _748 = fma(_460, _730, _746);
    float _750 = -_736;
    float _752 = fma(_470, _726, _750);
    float _754 = sqrt(_732);
    float _756 = -_744;
    float _758 = fma(_458, _728, _756);
    float _760 = _748 * _748;
    float _762 = fma(_752, _752, _760);
    float _764 = fma(_758, _758, _762);
    float _766 = rsqrt(_764);
    float _768 = _674 * _754;
    float _770 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _740);
    float _772 = _380 * _768;
    float _774 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _738);
    float _776 = _372 * _768;
    float _778 = _382 * _768;
    float _780 = _772 * _770;
    float _782 = _776 * _774;
    float _784 = _778 * _742;
    float _786 = _780 * _726;
    float _788 = _758 * _766;
    float _790 = _780 * _730;
    float _792 = _752 * _766;
    float _794 = _748 * _766;
    float _796 = fma(_782, _788, _786);
    float _798 = -_708;
    float _800 = _410 + _798;
    float _802 = fma(_782, _792, _790);
    float _804 = fma(_784, _460, _796);
    float _806 = fma(_784, _458, _802);
    float _808 = _410 + _804;
    float _810 = _408 + _806;
    float _812 = -_704;
    float _814 = _812 + _396;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _808 + _816;
    float _820 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _822 = _810 + _820;
    float _824 = _818 * _818;
    float _826 = fma(_822, _822, _824);
    float _828 = _780 * _728;
    float _830 = sqrt(_826);
    float _832 = fma(_782, _794, _828);
    float _834 = -_706;
    float _836 = _408 + _834;
    float _838 = _814 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _840 = fma(_784, _470, _832);
    float _842 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[11].x, _838);
    float _844 = _396 + _840;
    float _846 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[11].z, _842);
    bool _848 = _830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _850 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _852 = _850 != 0;
    int _854 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _856 = _854 != 0;
    int _858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _860 = _858 != 0;
    bool _862 = !_856;
    int _864 = _862 ? 0 : 1;
    bool _866 = !_852;
    int _868 = _866 ? 0 : 1;
    bool _870 = !_860;
    int _872 = _870 ? 0 : 1;
    float _874 = _840;
    float _876 = _766;
    float _878 = _810;
    float _880 = _704;
    float _882 = _706;
    float _884 = _708;
    if (!_848)
    {
        _874 = _808;
    }
    float _886 = _874;
    float _888 = _886;
    if (!_848)
    {
        _876 = _844;
    }
    float _890 = _876;
    bool _892 = !_848;
    float _894 = _890;
    if (!_892)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _898 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _900 = _830 + _898;
        float _902 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _904 = _900 * _896;
        float _906 = rsqrt(_826);
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = sin(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = fma(_912, _902, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _920 = _906 * _918;
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_822, _920, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _928 = fma(_818, _920, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _930 = fma(_844, _916, _924);
        _894 = _930;
        _878 = _926;
        _888 = _928;
    }
    float _932 = _894;
    float _934 = _878;
    float _936 = _888;
    float _938 = -_396;
    float _940 = _938 + _932;
    float _942 = -_408;
    float _944 = _942 + _934;
    float _946 = _846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _948 = _814 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _950 = _940 * _940;
    float _952 = -_410;
    float _954 = _952 + _936;
    float _956 = 1.0 / _946;
    float _958 = fma(_836, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _960 = fma(_944, _944, _950);
    float _962 = -_706;
    float _964 = _962 + _934;
    float _966 = fma(_800, (*spvDescriptorSet0.vp_c8)._m0[10].z, _958);
    float _968 = fma(_954, _954, _960);
    float _970 = -_704;
    float _972 = _970 + _932;
    float _974 = _966 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _976 = sqrt(_968);
    float _978 = _974 + _946;
    float _980 = _978 * _956;
    float _982 = _980 * 0.5;
    float _984 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _986 = fma(_982, (*spvDescriptorSet0.vp_c8)._m0[30].w, _984);
    float _988 = 1.0 / _986;
    bool _990 = _976 > 0.0;
    bool _992 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _994 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _996 = _992 || _994;
    bool _998 = isnan(0.5);
    bool _1000 = _996 || _998;
    float _1002 = -_708;
    float _1004 = _1002 + _936;
    bool _1006 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1010 = _1006 || _1008;
    bool _1012 = isnan(0.5);
    bool _1014 = _1010 || _1012;
    float _1016 = _936;
    float _1018 = _972;
    float _1020 = _968;
    if (!_990)
    {
        _880 = _964;
    }
    float _1022 = _880;
    float _1024 = _1022;
    if (!_990)
    {
        _882 = _972;
    }
    float _1026 = _882;
    float _1028 = _1026;
    if (!_990)
    {
        _1016 = _1004;
    }
    float _1030 = _1016;
    bool _1032 = !_990;
    float _1034 = _1030;
    float _1036 = _1030;
    if (!_1032)
    {
        float _1038 = _216 * _216;
        float _1040 = fma(_212, _212, _1038);
        float _1042 = fma(_218, _218, _1040);
        float _1044 = rsqrt(_968);
        float _1046 = sqrt(_1042);
        float _1048 = _944 * _1044;
        float _1050 = _940 * _1044;
        float _1052 = _954 * _1044;
        bool _1054 = _1046 > 0.0;
        float _1056 = _1044;
        float _1058 = _1046;
        if (!_1054)
        {
            _1056 = _964;
        }
        float _1060 = _1056;
        _1024 = _1060;
        if (!_1054)
        {
            _1058 = _972;
        }
        float _1062 = _1058;
        _1028 = _1062;
        if (!_1054)
        {
            _1034 = _1004;
        }
        float _1064 = _1034;
        bool _1066 = !_1054;
        _1036 = _1064;
        if (!_1066)
        {
            float _1068 = rsqrt(_1042);
            float _1070 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1072 = _216 * _1068;
            float _1074 = _212 * _1068;
            float _1076 = _1050 * _1072;
            float _1078 = _218 * _1068;
            float _1080 = fma(_1048, _1074, _1076);
            float _1082 = _1070 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1084 = fma(_1052, _1078, _1080);
            float _1086 = _1084 * _1082;
            float _1088 = fma(_212, _1086, _964);
            float _1090 = fma(_216, _1086, _972);
            float _1092 = fma(_218, _1086, _1004);
            _1024 = _1088;
            _1028 = _1090;
            _1036 = _1092;
        }
    }
    float _1094 = _1024;
    float _1096 = _1028;
    float _1098 = _1036;
    float _1100 = _1096;
    float _1102 = _1094;
    float _1104 = _1098;
    if (_1000)
    {
        _224 = 1.0;
    }
    float _1106 = _224;
    float _1108 = _1106;
    if (!_1014)
    {
        float _1110 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1112 = _814 + _1110;
        float _1114 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1116 = _836 + _1114;
        float _1118 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1120 = _1112 * _1112;
        float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1124 = _800 + _1122;
        float _1126 = fma(_1116, _1116, _1120);
        float _1128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1130 = fma(_1124, _1124, _1126);
        float _1132 = sqrt(_1130);
        float _1134 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1136 = precise::min(_1132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1138 = _1136 * _1128;
        float _1140 = -_836;
        float _1142 = _1140 + _1094;
        float _1144 = _1134 * _1138;
        float _1146 = -_814;
        float _1148 = _1146 + _1096;
        float _1150 = -_800;
        float _1152 = _1150 + _1098;
        float _1154 = fma(_1142, _1144, _836);
        float _1156 = fma(_1148, _1144, _814);
        float _1158 = fma(_1152, _1144, _800);
        _1100 = _1156;
        _1102 = _1154;
        _1104 = _1158;
        _226 = _1152;
    }
    float _1160 = _1100;
    float _1162 = _1102;
    float _1164 = _1104;
    float _1166 = _226;
    float _1168 = 0.0;
    float _1170 = _1166;
    if (_1000)
    {
        _1168 = 1.0;
    }
    float _1172 = _1168;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1176 = _988 * _1174;
    float _1178 = _1172;
    if (!_1000)
    {
        float _1180 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1182 = _1180 * 0.15915493667125701904296875;
        float _1184 = _1182 * 6.283185482025146484375;
        float _1186 = cos(_1184);
        float _1188 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1190 = _1188 * 0.15915493667125701904296875;
        float _1192 = _1182 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = 1.0 / _1186;
        float _1198 = _1190 * 6.283185482025146484375;
        float _1200 = cos(_1198);
        float _1202 = _1194 * _1196;
        float _1204 = _1190 * 6.283185482025146484375;
        float _1206 = sin(_1204);
        float _1208 = _1200 * _1202;
        float _1210 = 1.0 / _1208;
        float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1214 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1212;
        float _1216 = 1.0 / _1214;
        float _1218 = _1206 * _1210;
        float _1220 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1222 = fma(_1176, _1218, _1220);
        float _1224 = _1222 * _1216;
        float _1226 = precise::clamp(_1224, 0.0, 1.0);
        _1018 = _1182;
        _1170 = _1190;
        _1108 = _1226;
    }
    float _1228 = _1018;
    float _1230 = _1170;
    float _1232 = _1108;
    float _1234 = _1228;
    float _1236 = _1230;
    if (!_1000)
    {
        float _1238 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1240 = _1238 * 0.15915493667125701904296875;
        float _1242 = _1240 * 6.283185482025146484375;
        float _1244 = cos(_1242);
        float _1246 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1248 = _1246 * 0.15915493667125701904296875;
        float _1250 = _1240 * 6.283185482025146484375;
        float _1252 = sin(_1250);
        float _1254 = 1.0 / _1244;
        float _1256 = _1248 * 6.283185482025146484375;
        float _1258 = cos(_1256);
        float _1260 = _1252 * _1254;
        float _1262 = _1248 * 6.283185482025146484375;
        float _1264 = sin(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = 1.0 / _1266;
        float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1272 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1270;
        float _1274 = 1.0 / _1272;
        float _1276 = _1264 * _1268;
        float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1280 = fma(_1176, _1276, _1278);
        float _1282 = _1280 * _1274;
        float _1284 = precise::clamp(_1282, 0.0, 1.0);
        float _1286 = -_1284;
        float _1288 = _1286 + 1.0;
        _1234 = _1254;
        _1236 = _1266;
        _1178 = _1288;
    }
    float _1290 = _1234;
    float _1292 = _1236;
    float _1294 = _1178;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1298 = _1160 + _1296;
    float _1300 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1302 = _1162 + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1306 = _1164 + _1304;
    float _1308 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1310 = _1298 * _1298;
    float _1312 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1308);
    float _1314 = fma(_1302, _1302, _1310);
    float _1316 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1312);
    float _1318 = fma(_1306, _1306, _1314);
    float _1320 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1322 = rsqrt(_1318);
    float _1324 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1326 = _1302 * _1324;
    float _1328 = _1306 * _1324;
    float _1330 = _1326 * _1326;
    float _1332 = _1328 * _1328;
    float _1334 = _1330 + _1332;
    float _1336 = sqrt(_1334);
    bool _1338 = _1336 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1340 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1342 = _1336 + _1340;
    float _1344 = _1322;
    float _1346 = _1292;
    float _1348 = _1342;
    float _1350 = _1290;
    float _1352 = _1330;
    if (_1338)
    {
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1344 = _1354;
    }
    float _1356 = _1344;
    if (_1338)
    {
        float _1358 = rsqrt(_1334);
        _1346 = _1358;
    }
    float _1360 = _1346;
    float _1362 = _1360;
    if (_1338)
    {
        float _1364 = _1342 * _1356;
        _1348 = _1364;
    }
    float _1366 = _1348;
    if (_1338)
    {
        float _1368 = _1366 * 0.15915493667125701904296875;
        _884 = _1368;
    }
    float _1370 = _884;
    float _1372 = _1306;
    float _1374 = _1370;
    if (_1338)
    {
        float _1376 = _1370 * 6.283185482025146484375;
        float _1378 = sin(_1376);
        _1372 = _1378;
    }
    float _1380 = _1372;
    float _1382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1384 = precise::max(0.0, _1382);
    float _1386 = _1356;
    if (_1338)
    {
        float _1388 = _1370 * 6.283185482025146484375;
        float _1390 = cos(_1388);
        _1386 = _1390;
    }
    float _1392 = _1386;
    float _1394 = -_1324;
    float _1396 = -_1384;
    float _1398 = fma(_1298, _1394, _1396);
    float _1400 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1338)
    {
        float _1402 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1350 = _1402;
    }
    float _1404 = _1350;
    float _1406 = _1404;
    if (!_1338)
    {
        _1374 = _1328;
    }
    float _1408 = _1374;
    float _1410 = fma(_836, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1412 = _1408;
    if (_1338)
    {
        float _1414 = fma(_1380, _1404, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = floor(_1410);
    float _1420 = _1416;
    float _1422 = _1392;
    if (_1338)
    {
        float _1424 = _1392 + (-1.0);
        _1400 = _1424;
    }
    float _1426 = _1400;
    float _1428 = _1426;
    if (_1338)
    {
        float _1430 = _1360 * _1416;
        _1020 = _1430;
    }
    float _1432 = _1020;
    if (!_1338)
    {
        _1362 = _1326;
    }
    float _1434 = _1362;
    float _1436 = _1434;
    if (_1338)
    {
        float _1438 = _1426 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1428 = _1438;
    }
    float _1440 = _1428;
    if (_1338)
    {
        float _1442 = _1326 * _1432;
        _1436 = _1442;
    }
    float _1444 = _1436;
    if (!_1338)
    {
        _1420 = _1398;
    }
    float _1446 = _1420;
    float _1448 = _1446;
    if (_1338)
    {
        float _1450 = _1328 * _1432;
        _1412 = _1450;
    }
    float _1452 = _1412;
    if (_1338)
    {
        float _1454 = fma(_1398, _1392, _1440);
        _1448 = _1454;
    }
    float _1456 = _1448;
    if (_1338)
    {
        float _1458 = _1444 * _1444;
        _1352 = _1458;
    }
    float _1460 = _1352;
    if (!_1338)
    {
        _1422 = _1332;
    }
    float _1462 = _1422;
    float _1464 = sqrt(_1318);
    float _1466 = _1462;
    if (_1338)
    {
        float _1468 = _1452 * _1452;
        _1466 = _1468;
    }
    float _1470 = _1466;
    float _1472 = fma(_1456, _1456, _1460);
    float _1474 = fma(_800, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1476 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1478 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1480 = _1472 + _1470;
    float _1482 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1476);
    float _1484 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1486 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1478);
    float _1488 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1482);
    float _1490 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1484);
    float _1492 = rsqrt(_1480);
    float _1494 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1486);
    float _1496 = _1488 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1498 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1490);
    float _1500 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1502 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1500);
    float _1504 = precise::clamp(_1502, 0.0, 1.0);
    float _1506 = _1494 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1508 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1510 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1512 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1514 = -_1504;
    float _1516 = _1514 + 1.0;
    float _1518 = _1506 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1520 = floor(_1474);
    float _1522 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1512);
    float _1524 = -_1418;
    float _1526 = _1410 + _1524;
    float _1528 = -_1518;
    float _1530 = fma(_1528, _1508, 1.0);
    float _1532 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1534 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1522);
    float _1536 = _1492 * _1444;
    float _1538 = _1492 * _1452;
    float _1540 = abs(_1516);
    float _1542 = log2(_1540);
    float _1544 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1534);
    float _1546 = _1492 * _1456;
    float _1548 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1550 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1532);
    float _1552 = -_1548;
    float _1554 = fma(_1546, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1552);
    float _1556 = 1.0 / _1544;
    float _1558 = -_1520;
    float _1560 = _1474 + _1558;
    float _1562 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1550);
    float _1564 = -_1538;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1554);
    float _1568 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1570 = _1546 + 1.0;
    float _1572 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1562);
    float _1574 = fma(_1566, -0.5, 0.5);
    float _1576 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1578 = log2(_1530);
    float _1580 = fma(_1566, 0.5, 0.5);
    float _1582 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1568);
    float _1584 = fma(_1580, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1586 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1582);
    float _1588 = exp2(_1576);
    float _1590 = fma(_1580, _1584, -0.212114393711090087890625);
    float _1592 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1586);
    float _1594 = _1572 * _1556;
    float _1596 = fma(_1580, _1590, 1.570728778839111328125);
    float _1598 = sqrt(_1574);
    float _1600 = _1578 * 0.693147182464599609375;
    float _1602 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1604 = -_1546;
    float _1606 = fma(_1588, _1570, _1604);
    float _1608 = _1592 * _1556;
    float _1610 = fma(_1594, 0.5, 0.5);
    float _1612 = fma(_1606, 0.5, 0.5);
    float _1614 = fma(_1608, -0.5, 0.5);
    float _1616 = _1598 * 0.636619746685028076171875;
    float2 _5358 = float2(_1526, _1560);
    float _1618 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5358, float2(0.0), isnan(_5358)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5358, float2(0.0), isnan(_5358)), level(0.0)).x;
    float3 _5369 = float3(_1610, _1614, _1602);
    float _1620 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5369, float3(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5369, float3(0.0), isnan(_5369)), level(0.0)).x;
    float _1622 = -_1596;
    float _1624 = fma(_1616, _1622, 1.0);
    float3 _5385 = float3(_1610, _1614, _1602);
    float4 _1627 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5385, float3(0.0), isnan(_5385)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5385, float3(0.0), isnan(_5385)), level(0.0)).xyzw;
    float _1629 = _1627.x;
    float _1631 = _1627.y;
    float _1633 = _1627.z;
    float _1635 = _1627.w;
    float2 _5401 = float2(_1624, _1612);
    float3 _1639 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5401, float2(0.0), isnan(_5401)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5401, float2(0.0), isnan(_5401)), level(0.0)).xyz;
    float _1641 = _1639.x;
    float _1643 = _1639.y;
    float _1645 = _1639.z;
    float _1647 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1649 = int(_1647);
    out.m_71.x = _836;
    out.m_71.y = _814;
    out.m_71.z = _800;
    int _1651 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1653 = _1651 != 0;
    int _1655 = abs(_868);
    out.m_73.w = _696;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1659 = _1657 != 0;
    float _1661 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1663 = int(_1661);
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1667 = _1665 != 0;
    out.m_75.x = _776;
    int _1669 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1671 = _1669 != 0;
    out.m_77.x = _1162;
    out.m_77.y = _1160;
    out.m_77.z = _1164;
    float _1673 = float(_1649);
    float _1675 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1677 = 1.0 / _1673;
    float _1679 = float(uint(_1663));
    int _1681 = ~_1663;
    int _1683 = _1681 + 1;
    bool _1685 = _1663 == 0;
    float _1687 = 1.0 / _1679;
    float _1689 = _128 * _1677;
    int _1691 = ~_1663;
    int _1693 = _1691 + 1;
    float _1695 = trunc(_1689);
    int _1697 = int(_1695);
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1701 = _1699 != 0;
    int _1703 = as_type<int>(_1687) + (-2);
    float _1705 = float(uint(_1697));
    float _1707 = as_type<float>(_1703) * _1705;
    float _1709 = in.m_63.x;
    float _1711 = in.m_63.y;
    float _1713 = in.m_63.z;
    float _1715 = trunc(_1707);
    float _1717 = precise::max(_1715, 0.0);
    uint _1720 = uint(_1717);
    bool _1722 = !_1701;
    float _1724 = _1722 ? 7.345489978790283203125 : 1.0;
    float _1726 = float(_1697);
    int _1728 = _1693 * int(_1720);
    int _1730 = _1728 + _1697;
    float _1732 = float(uint(_1730));
    float _1734 = _1724 * _1709;
    float _1736 = _1711 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1738 = fma(_1711, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1675);
    float _1740 = as_type<float>(_1703) * _1732;
    float _1742 = floor(_1734);
    float _1744 = trunc(_1740);
    float _1746 = precise::max(_1744, 0.0);
    uint _1748 = uint(_1746);
    int _1750 = int(_1720) + int(_1748);
    float _1752 = -_1742;
    float _1754 = _1734 + _1752;
    float _1756 = float(_1663);
    float _1758 = in.m_79.y;
    int _1760 = _1683 * _1750;
    int _1762 = _1760 + _1697;
    bool _1764 = _1726 >= _1756;
    bool _1766 = isnan(_1726);
    bool _1768 = _1764 || _1766;
    bool _1770 = isnan(_1756);
    bool _1772 = _1768 || _1770;
    float _1774 = float(_1772);
    float _1776 = _128 * _1756;
    float _1778 = _1754 * _1756;
    bool _1780 = uint(_1762) >= uint(_1663);
    float _1782 = _1776 * _178;
    float _1784 = trunc(_1774);
    int _1786 = int(_1784);
    float _1788 = in.m_81.w;
    bool _1790 = !_1780;
    int _1792 = _1790 ? 0 : (-1);
    int _1794 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1796 = _1794 != 0;
    int _1798 = ~_1750;
    int _1800 = _1798 + _1792;
    int _1802 = _1800 + 1;
    float _1804 = trunc(_1778);
    int _1806 = int(_1804);
    bool _1808 = !_1796;
    int _1810 = _1808 ? 0 : 1;
    int _1812 = _1663 * _1802;
    int _1814 = _1812 + _1697;
    int _1816 = abs(_864);
    int _1818 = abs(_1810);
    int _1820 = ~_1786;
    int _1822 = _1820 + 1;
    int _1824 = _1822 + 1;
    float _1826 = trunc(_1782);
    int _1828 = int(_1826);
    bool _1830 = !_1685;
    int _1832 = _1830 ? _1814 : (-1);
    int _1834 = _1832 * _1824;
    int _1836 = _1663 + (-1);
    int _1838 = _1806 * _1818;
    int _1840 = _1838 + _1697;
    int _1842 = abs(_872);
    out.m_83.w = _1788;
    int _1844 = _1786 * _1836;
    int _1846 = _1844 + _1834;
    bool _1848 = _1711 > 0.5;
    int _1850 = _1846 * _1816;
    float _1852 = -_1758;
    float _1854 = _1852 + 1.0;
    int _1856 = _1828 * _1655;
    int _1858 = _1856 + _1850;
    bool _1860 = !_1653;
    int _1862 = _1860 ? 0 : 1;
    float _1864 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1866 = _1758;
    float _1868 = _1544;
    float _1870 = _1572;
    float _1872 = _1592;
    if (_1659)
    {
        float _1874 = _1848 ? _1854 : _1758;
        _1866 = _1874;
    }
    float _1876 = _1866;
    int _1878 = _1840 * _1842;
    int _1880 = _1878 + _1858;
    int _1882 = abs(_1862);
    float _1884 = fma(_1713, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1864);
    float _1886 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1888 = _1806 * _1882;
    int _1890 = _1888 + _1880;
    float _1892 = _1709 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1896 = _1894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1898 = fma(_1709, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1886);
    float _1900 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1902 = _1900 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1904 = float(uint(_1890));
    float _1906 = as_type<float>(_1806);
    if (_1667)
    {
        float _1908 = in.m_63.x;
        _1906 = _1908;
    }
    float _1910 = _1906;
    float _1912 = 1.0 / _1896;
    float _1914 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1916 = as_type<float>(_1703) * _1904;
    float _1918 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1884);
    float _1920 = fma(_1736, -2.0, _1914);
    bool _1922 = _740 != 0.0;
    bool _1924 = isnan(_740);
    bool _1926 = _1922 || _1924;
    bool _1928 = isnan(0.0);
    bool _1930 = _1926 || _1928;
    float _1932 = trunc(_1916);
    float _1934 = precise::max(_1932, 0.0);
    uint _1936 = uint(_1934);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1940 = _1918 * (-0.15915493667125701904296875);
    float _1942 = -_1938;
    float _1944 = fma(_1892, 2.0, _1942);
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1948 = 1.0 / _1902;
    int _1950 = ~_1663;
    int _1952 = _1950 + 1;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1956 = _738 == 0.0;
    bool _1958 = !_1930;
    bool _1960 = _1956 && _1958;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1964 = _1946 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1966 = _1952 * int(_1936);
    int _1968 = _1966 + _1890;
    float _1970 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1970;
    bool _1974 = _742 == 0.0;
    bool _1976 = _1974 && _1960;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1980 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = float(uint(_1968));
    float _1984 = _1972 * _1912;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1990 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1992 = in.m_85.x;
    float _1994 = in.m_85.y;
    float _1996 = in.m_85.z;
    float _1998 = as_type<float>(_1703) * _1982;
    float _2000 = _1988 * _1948;
    float _2002 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2004 = _2002 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_87.x = _1964;
    out.m_87.y = _1980;
    out.m_87.z = _1990;
    out.m_87.w = _1978;
    float _2006 = trunc(_1998);
    float _2008 = precise::max(_2006, 0.0);
    uint _2010 = uint(_2008);
    bool _2012 = _1910 > 0.5;
    bool _2014 = _2012 && _1667;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2016;
    float _2020 = in.m_79.x;
    float _2022 = -_128;
    float _2024 = fma(_2022, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1944);
    float _2026 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1920);
    float _2028 = 1.0 / _2004;
    int _2030 = ~_1663;
    int _2032 = _2030 + 1;
    float _2034 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1898);
    float _2036 = float(uint(_1840));
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2040 = _364 + _2038;
    int _2042 = int(_1936) + int(_2010);
    float _2044 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2046 = _364 + _2044;
    int _2048 = ~_1663;
    int _2050 = _2048 + 1;
    float _2052 = _1994;
    float _2054 = _1992;
    float _2056 = _1996;
    if (!_1976)
    {
        float _2058 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1994);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = as_type<float>(_1703) * _2036;
    float _2064 = fma(_2000, _2040, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2066 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2068 = isnan(_364);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    if (!_1976)
    {
        float _2078 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1992);
        _2054 = _2078;
    }
    float _2080 = _2054;
    bool _2082 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2084 = isnan(_364);
    bool _2086 = _2082 || _2084;
    bool _2088 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2090 = _2086 || _2088;
    float _2092 = float(_2090);
    float _2094 = fma(_1984, _2046, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2096 = trunc(_2062);
    float _2098 = precise::max(_2096, 0.0);
    uint _2100 = uint(_2098);
    float _2102 = _2018 * _2028;
    float _2104 = -_2076;
    float _2106 = _2104 + 1.0;
    bool _2108 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2110 = isnan(_364);
    bool _2112 = _2108 || _2110;
    bool _2114 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2116 = _2112 || _2114;
    float _2118 = float(_2116);
    int _2120 = _2050 * _2042;
    int _2122 = _2120 + _1890;
    float _2124 = -_2092;
    float _2126 = _2124 + 1.0;
    float _2128 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2130 = _364 + _2128;
    float _2132 = _2092 * _2106;
    float _2134 = _2118;
    float _2136 = _2020;
    if (!_1976)
    {
        float _2138 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1996);
        _2056 = _2138;
    }
    float _2140 = _2056;
    float _2142 = _2118 * _2126;
    bool _2144 = uint(_2122) >= uint(_1663);
    float _2146 = fma(_2102, _2130, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2148 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1738);
    bool _2150 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2152 = isnan(_364);
    bool _2154 = _2150 || _2152;
    bool _2156 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2158 = _2154 || _2156;
    float _2160 = float(_2158);
    float _2162 = -_2118;
    float _2164 = _2162 + 1.0;
    bool _2166 = !_2144;
    int _2168 = _2166 ? 0 : (-1);
    float _2170 = _1940 * 6.283185482025146484375;
    float _2172 = sin(_2170);
    int _2174 = _2032 * int(_2100);
    int _2176 = _2174 + _1840;
    if (_1667)
    {
        _2134 = _2020;
    }
    float _2178 = _2134;
    float _2180 = _2160 * _2164;
    int _2182 = ~_2042;
    int _2184 = _2182 + _2168;
    int _2186 = _2184 + 1;
    float _2188 = -_2160;
    float _2190 = _2188 + 1.0;
    float _2192 = float(uint(_2176));
    float _2194 = _2178;
    if (_2014)
    {
        float _2196 = -_2178;
        float _2198 = _2196 + 1.0;
        _2194 = _2198;
    }
    float _2200 = _2194;
    float _2202 = _1940 * 6.283185482025146484375;
    float _2204 = cos(_2202);
    float _2206 = _2094 * _2180;
    int _2208 = _1663 * _2186;
    int _2210 = _2208 + _1890;
    float _2212 = as_type<float>(_1703) * _2192;
    if (_1667)
    {
        _2136 = _2200;
    }
    float _2214 = _2136;
    float _2216 = fma(_2190, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2206);
    float _2218 = fma(_1876, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2220 = !_1685;
    int _2222 = _2220 ? _2210 : (-1);
    float _2224 = trunc(_2212);
    float _2226 = precise::max(_2224, 0.0);
    uint _2228 = uint(_2226);
    float _2230 = fma(_2064, _2142, _2216);
    float _2232 = _2172 * _2218;
    float _2234 = fma(_2214, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2236 = _2222 >> 31;
    float _2238 = _730 * _2060;
    int _2240 = _2222 & 3;
    bool _2242 = _2240 != 0;
    float _2244 = _728 * _2060;
    float _2246 = _2204 * _2218;
    int _2248 = _2236 & 3;
    float _2250 = -_2232;
    float _2252 = fma(_2204, _2234, _2250);
    float _2254 = fma(_2172, _2234, _2246);
    float _2256 = fma(_2146, _2132, _2230);
    int _2258 = _2222 + _2248;
    float _2260 = fma(_2034, _2252, _2024);
    int _2262 = int(_2100) + int(_2228);
    float _2264 = fma(_2076, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2256);
    int _2266 = _2258 >> 2;
    float _2268 = abs(_1176);
    float _2270 = log2(_2268);
    float _2272 = -_2026;
    float _2274 = fma(_2148, _2254, _2272);
    int _2276 = ~_1663;
    int _2278 = _2276 + 1;
    float _2280 = _2264 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2282 = _2266 << 4;
    int _2284 = _2282 + 368;
    float _2286 = _2274 + 0.5;
    int _2288 = _2278 * _2262;
    int _2290 = _2288 + _1840;
    uint _2292 = uint(int(uint(_2284) >> uint(2)));
    uint _2294 = uint(int(uint(int(_2292)) >> uint(2)));
    int _2296 = int(_2292) & 3;
    float _2298 = (*spvDescriptorSet0.vp_c9)._m0[int(_2294)][_2296];
    int _2300 = int(_2292) + 1;
    uint _2302 = uint(int(uint(_2300) >> uint(2)));
    int _2304 = _2300 & 3;
    float _2306 = (*spvDescriptorSet0.vp_c9)._m0[int(_2302)][_2304];
    float _2308 = _726 * _2060;
    float _2310 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2312 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2314 = uint(_2290) >= uint(_1663);
    float _2316 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2318 = _2222 & 3;
    bool _2320 = _2318 != 0;
    float _2322 = _2270 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2324 = _2284 + 8;
    uint _2326 = uint(int(uint(_2324) >> uint(2)));
    uint _2328 = uint(int(uint(int(_2326)) >> uint(2)));
    int _2330 = int(_2326) & 3;
    float _2332 = (*spvDescriptorSet0.vp_c9)._m0[int(_2328)][_2330];
    int _2334 = int(_2326) + 1;
    uint _2336 = uint(int(uint(_2334) >> uint(2)));
    int _2338 = _2334 & 3;
    float _2340 = (*spvDescriptorSet0.vp_c9)._m0[int(_2336)][_2338];
    float _2342 = _2260 + 0.5;
    bool _2344 = !_2314;
    int _2346 = _2344 ? 0 : (-1);
    float _2348 = _2310 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2350 = uint(_2318) > 1u;
    float _2352 = exp2(_2322);
    int _2354 = ~_2262;
    int _2356 = _2354 + _2346;
    int _2358 = _2356 + 1;
    float _2360 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2362 = _2316 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2364 = _2242 ? 0 : 1;
    int _2366 = _1663 * _2358;
    int _2368 = _2366 + _1840;
    out.m_89.x = _2342;
    out.m_89.y = _2286;
    bool _2370 = _2318 != 3;
    float _2372 = _1496 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2374 = uint(_2318) >= 2u;
    out.m_91.x = _2348;
    out.m_91.y = _2360;
    out.m_91.z = _2362;
    out.m_91.w = _2280;
    bool _2376 = !_2320;
    int _2378 = _2376 ? 0 : 1;
    float _2380 = fma(_1510, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2372);
    bool _2382 = _2318 != 3;
    float _2384 = fma(_2352, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2386 = precise::clamp(_2384, 0.0, 1.0);
    bool _2388 = !_1685;
    int _2390 = _2388 ? _2368 : (-1);
    float _2392 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2380);
    int _2394 = ~_2364;
    int _2396 = _2394 + 1;
    int _2398 = _2396 + 1;
    float _2400 = fma(_792, _2080, _2238);
    int _2402 = _2398;
    if (!_2350)
    {
        int _2404 = ~_2364;
        int _2406 = _2404 + 1;
        _2402 = _2406;
    }
    int _2408 = _2402;
    float _2410 = fma(_794, _2080, _2244);
    bool _2412 = _1176 <= 8000.0;
    bool _2414 = isnan(_1176);
    bool _2416 = _2412 || _2414;
    bool _2418 = isnan(8000.0);
    bool _2420 = _2416 || _2418;
    float _2422 = float(_2420);
    float _2424 = fma(_788, _2080, _2308);
    int _2426 = abs(_2408);
    float _2428 = fma(_2386, -2.0, 3.0);
    float _2430 = _2386 * _2386;
    int _2432 = _2374 ? 0 : 1;
    float _2434 = fma(_458, _2140, _2400);
    float _2436 = fma(_470, _2140, _2410);
    float _2438 = _2430 * _2428;
    int _2440 = ~_2432;
    int _2442 = _2440 + 1;
    int _2444 = _2442 + 1;
    float _2446 = fma(_460, _2140, _2424);
    int _2448 = _2444;
    if (_2370)
    {
        int _2450 = ~_2432;
        int _2452 = _2450 + 1;
        _2448 = _2452;
    }
    int _2454 = _2448;
    float _2456 = -_2438;
    float _2458 = _2456 + 1.0;
    int _2460 = abs(_2378);
    float _2462 = -_1618;
    float _2464 = _2462 + 1.0;
    int _2466 = ~_2426;
    int _2468 = _2466 + 1;
    int _2470 = _2468 + 1;
    float _2472 = fma(_2458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2438);
    int _2474 = abs(_2454);
    out.m_93.x = _2434;
    out.m_93.y = _2436;
    out.m_93.z = _2446;
    bool _2476 = !_2382;
    int _2478 = _2476 ? 0 : (-1);
    int _2480 = _2470 * as_type<int>(_2306);
    int _2482 = ~_2460;
    int _2484 = _2482 + 1;
    int _2486 = _2484 + 1;
    int _2488 = abs(_2478);
    int _2490 = ~_2474;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    int _2496 = _2486 * as_type<int>(_2298);
    int _2498 = _2496 + _2480;
    bool _2500 = !_1671;
    int _2502 = _2500 ? 0 : 1;
    float _2504 = _1544 * 0.5;
    int _2506 = ~_2488;
    int _2508 = _2506 + 1;
    int _2510 = _2508 + 1;
    int _2512 = _2494 * as_type<int>(_2332);
    int _2514 = _2512 + _2498;
    int _2516 = abs(_2502);
    float _2518 = fma(_1592, -0.5, _2504);
    float _2520 = in.m_67.x;
    int _2522 = _2510 * as_type<int>(_2340);
    int _2524 = _2522 + _2514;
    int _2526 = ~_2516;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    float _2532 = _2422 * _2472;
    int _2534 = _2524 * _2530;
    float _2536 = _1542 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2538 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2392);
    float _2540 = _2532 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2542 = _2390 * _2516;
    int _2544 = _2542 + _2534;
    float _2546 = _1572 + _1544;
    float _2548 = _2538 + _1544;
    float _2550 = exp2(_2536);
    float _2552 = _2464 * _2540;
    float _2554 = precise::clamp(_2552, 0.0, 1.0);
    float _2556 = _2546 * 0.5;
    float _2558 = _2548 * 0.5;
    bool _2560 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2562 = isnan(_1464);
    bool _2564 = _2560 || _2562;
    bool _2566 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2568 = _2564 || _2566;
    float _2570 = -_2554;
    float _2572 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2574 = float(_2544);
    out.gl_Position.x = _1572;
    out.gl_Position.y = _1592;
    out.gl_Position.z = _2538;
    out.gl_Position.w = _1544;
    float _2576 = _2572 * _2520;
    out.m_95.x = _2556;
    out.m_95.y = _2518;
    out.m_95.z = _2558;
    out.m_95.w = _1544;
    out.m_97.x = _2574;
    float _2578 = -_2550;
    float _2580 = _2578 + 1.0;
    float _2582 = _2580 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2584 = _2574;
    if (!_2568)
    {
        _1868 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2586 = _1868;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2568)
    {
        _1870 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2592 = _1870;
    float _2594 = _2582 * _1620;
    float _2596 = -_2582;
    float _2598 = _2596 + 1.0;
    float _2600 = _2592;
    float _2602 = _2592;
    if (!_2568)
    {
        _1872 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2604 = _1872;
    float _2606 = _1635 * _2594;
    float _2608 = _1645 * _2594;
    float _2610 = _1635 * _2598;
    float _2612 = _2604;
    float _2614 = _2604;
    if (!_2568)
    {
        _2584 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2616 = _2584;
    float _2618 = fma(_1641, _2606, _1629);
    float _2620 = fma(_1643, _2606, _1631);
    float _2622 = fma(_1635, _2608, _1633);
    float _2624 = _2576 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2626 = _1232 * _1294;
    out.m_99.x = _2618;
    out.m_99.y = _2620;
    out.m_99.z = _2622;
    out.m_99.w = _2610;
    float _2628 = _2626 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2630 = _2626;
    float _2632 = _2624;
    float _2634 = _2616;
    float _2636 = _2616;
    if (!_2568)
    {
        _2630 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2638 = _2630;
    out.m_101.x = _2624;
    float _2640 = _2638;
    float _2642 = _2638;
    if (!_2568)
    {
        _2632 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2644 = _2632;
    bool _2646 = !_2568;
    float _2648 = _2644;
    float _2650 = _2644;
    if (!_2646)
    {
        bool _2652 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2654 = isnan(_1464);
        bool _2656 = _2652 || _2654;
        bool _2658 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2660 = _2656 || _2658;
        if (!_2660)
        {
            float _2662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2664 = _1464 + _2662;
            float _2666 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2668 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2666;
            float _2670 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2674 = 1.0 / _2668;
            float _2676 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2678 = _2676 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2680 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2684 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2688 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2692 = _2664 * _2674;
            float _2694 = precise::clamp(_2692, 0.0, 1.0);
            float _2696 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2698 = _2696 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2700 = fma(_2694, _2672, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2702 = fma(_2694, _2698, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2704 = fma(_2694, _2678, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2706 = fma(_2694, _2682, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2708 = fma(_2694, _2686, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2710 = fma(_2694, _2690, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2602 = _2704;
            _2650 = _2708;
            _2590 = _2700;
            _2636 = _2706;
            _2614 = _2702;
            _2642 = _2710;
            _2712 = true;
        }
        else
        {
            bool _2714 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2716 = isnan(_1464);
            bool _2718 = _2714 || _2716;
            bool _2720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2722 = _2718 || _2720;
            if (!_2722)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2724 = _2588;
            _2590 = _2724;
            if (!_2722)
            {
                _2600 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2726 = _2600;
            _2602 = _2726;
            if (!_2722)
            {
                _2612 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2728 = _2612;
            _2614 = _2728;
            if (!_2722)
            {
                _2634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2730 = _2634;
            _2636 = _2730;
            if (!_2722)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2732 = _2648;
            _2650 = _2732;
            if (!_2722)
            {
                _2640 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2734 = _2640;
            bool _2736 = !_2722;
            _2642 = _2734;
            if (!_2736)
            {
                bool _2738 = _1464 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2740 = isnan(_1464);
                bool _2742 = _2738 || _2740;
                bool _2744 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2746 = _2742 || _2744;
                if (!_2746)
                {
                    float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2750 = _1464 + _2748;
                    float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2754 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2752;
                    float _2756 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2758 = _2756 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2760 = 1.0 / _2754;
                    float _2762 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2764 = _2762 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2766 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2768 = _2766 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2770 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2772 = _2770 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2774 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2776 = _2774 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2778 = _2750 * _2760;
                    float _2780 = precise::clamp(_2778, 0.0, 1.0);
                    float _2782 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2784 = _2782 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2786 = fma(_2780, _2758, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2788 = fma(_2780, _2784, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2790 = fma(_2780, _2764, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2792 = fma(_2780, _2768, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2794 = fma(_2780, _2772, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2796 = fma(_2780, _2776, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2602 = _2790;
                    _2650 = _2794;
                    _2590 = _2786;
                    _2636 = _2792;
                    _2614 = _2788;
                    _2642 = _2796;
                    _2712 = true;
                }
                else
                {
                    _2602 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2614 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2642 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2712 = false;
    float _2798 = _2602;
    float _2800 = _2650;
    float _2802 = _2590;
    float _2804 = _2636;
    float _2806 = _2614;
    float _2808 = _2642;
    float _2810 = _2628 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2812 = fma(_2436, -0.5, 0.5);
    float _2814 = precise::clamp(_2812, 0.0, 1.0);
    float _2816 = -_2798;
    float _2818 = _2816 + _2800;
    float _2820 = -_2802;
    float _2822 = _2820 + _2804;
    out.m_103.x = 0.0;
    float _2824 = fma(_2814, _2818, _2798);
    float _2826 = -_2806;
    float _2828 = _2826 + _2808;
    float _2830 = fma(_2814, _2822, _2802);
    float _2832 = _2824 * 0.586610972881317138671875;
    bool _2834 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2836 = fma(_2814, _2828, _2806);
    out.m_53.x = _2810;
    float _2838 = fma(_2830, 0.298911988735198974609375, _2832);
    bool _2840 = _1232 > 0.0;
    bool _2842 = isnan(_1232);
    bool _2844 = _2840 || _2842;
    bool _2846 = isnan(0.0);
    bool _2848 = _2844 || _2846;
    float _2850 = fma(_2836, 0.114477999508380889892578125, _2838);
    bool _2852 = _1294 <= 0.0;
    bool _2854 = !_2848;
    bool _2856 = _2852 || _2854;
    float _2858 = -_2850;
    float _2860 = _2830 + _2858;
    float _2862 = -_2850;
    float _2864 = _2824 + _2862;
    float _2866 = -_2850;
    float _2868 = _2836 + _2866;
    float _2870 = fma(_2860, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    float _2872 = fma(_2864, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    float _2874 = fma(_2868, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2850);
    bool _2876 = !_2834;
    if (!_2876)
    {
        float _2878 = -_1160;
        float _2880 = _2878 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2882 = -_1162;
        float _2884 = _2882 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2886 = -_1164;
        float _2888 = _2886 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2890 = _2880 * _2880;
        float _2892 = fma(_2884, _2884, _2890);
        float _2894 = fma(_2888, _2888, _2892);
        float _2896 = sqrt(_2894);
        float _2898 = rsqrt(_2894);
        float _2900 = -_2896;
        float _2902 = _2900 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2904 = _2902 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2906 = precise::clamp(_2904, 0.0, 1.0);
        float _2908 = _2884 * _2898;
        float _2910 = _2880 * _2898;
        float _2912 = abs(_2906);
        float _2914 = log2(_2912);
        float _2916 = _2888 * _2898;
        float _2918 = _2908 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2920 = _2436 * _2910;
        float _2922 = -_2910;
        float _2924 = -_2918;
        float _2926 = fma(_2922, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2924);
        float _2928 = fma(_2434, _2908, _2920);
        float _2930 = -_2916;
        float _2932 = fma(_2930, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2926);
        float _2934 = fma(_2446, _2916, _2928);
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2940 = _2932 + _2938;
        float _2942 = _2914 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2944 = _2940 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2946 = precise::clamp(_2944, 0.0, 1.0);
        float _2948 = exp2(_2942);
        float _2950 = _2948 * _2946;
        float _2952 = _2936 * _2950;
        float _2954 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2956 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2958 = _2952 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _2954;
        out.m_103.y = _2956;
        out.m_103.z = _2958;
    }
    out.m_73.x = _2870;
    out.m_73.y = _2872;
    out.m_73.z = _2874;
    if (!_2856)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2960 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2960;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

