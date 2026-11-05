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
    bool _2776 = false;
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
        float _3092 = as_type<float>(_144);
        out.gl_Position.z = _3092;
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
        float _3147 = as_type<float>(_170);
        out.gl_Position.z = _3147;
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
    float _798 = fma(_782, _792, _790);
    float _800 = fma(_460, _784, _796);
    float _802 = fma(_458, _784, _798);
    float _804 = _410 + _800;
    float _806 = _408 + _802;
    float _808 = -_704;
    float _810 = _808 + _396;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _814 = _804 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _806 + _816;
    float _820 = _810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _822 = _814 * _814;
    float _824 = fma(_818, _818, _822);
    float _826 = _780 * _728;
    float _828 = sqrt(_824);
    float _830 = fma(_782, _794, _826);
    float _832 = -_706;
    float _834 = _408 + _832;
    float _836 = fma(_470, _784, _830);
    float _838 = -_708;
    float _840 = _410 + _838;
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].x, _820);
    float _844 = _396 + _836;
    float _846 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[11].z, _842);
    bool _848 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
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
    float _874 = _836;
    float _876 = _766;
    float _878 = _806;
    float _880 = _704;
    float _882 = _706;
    float _884 = _708;
    if (!_848)
    {
        _874 = _804;
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
        float _900 = _828 + _898;
        float _902 = rsqrt(_824);
        float _904 = _900 * _896;
        float _906 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = cos(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 + (-1.0);
        float _920 = fma(_916, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _922 = _918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _902 * _920;
        float _926 = fma(_844, _912, _922);
        float _928 = fma(_818, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_814, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _894 = _926;
        _878 = _928;
        _888 = _930;
    }
    float _932 = _894;
    float _934 = _878;
    float _936 = _888;
    float _938 = -_396;
    float _940 = _938 + _932;
    float _942 = -_408;
    float _944 = _942 + _934;
    float _946 = _846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _948 = _810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _950 = _940 * _940;
    float _952 = -_410;
    float _954 = _952 + _936;
    float _956 = 1.0 / _946;
    float _958 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _960 = fma(_944, _944, _950);
    float _962 = -_706;
    float _964 = _962 + _934;
    float _966 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[10].z, _958);
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
    float _1102 = _1096;
    float _1104 = _1094;
    float _1106 = _1098;
    if (_1000)
    {
        _224 = 1.0;
    }
    float _1108 = _224;
    float _1110 = _1108;
    if (!_1014)
    {
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1114 = _810 + _1112;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1118 = _834 + _1116;
        float _1120 = -_834;
        float _1122 = _1120 + _1094;
        float _1124 = -_810;
        float _1126 = _1124 + _1096;
        float _1128 = _1114 * _1114;
        float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1132 = _840 + _1130;
        float _1134 = fma(_1118, _1118, _1128);
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1138 = fma(_1132, _1132, _1134);
        float _1140 = sqrt(_1138);
        float _1142 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1144 = _1140 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1146 = isnan(_1140);
        bool _1148 = _1144 || _1146;
        bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1152 = _1148 || _1150;
        float _1154 = precise::min(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1136;
        float _1158 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1160 = _1158 * _1156;
        float _1162 = _218;
        float _1164 = _1136;
        float _1166 = _1158;
        _1018 = _1126;
        _884 = _1122;
        if (_1152)
        {
            float _1168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1162 = _1168;
        }
        float _1170 = _1162;
        if (_1152)
        {
            float _1172 = precise::max(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1164 = _1172;
        }
        float _1174 = _1164;
        float _1176 = -_840;
        float _1178 = _1176 + _1098;
        float _1180 = fma(_1122, _1160, _834);
        float _1182 = fma(_1126, _1160, _810);
        float _1184 = fma(_1178, _1160, _840);
        float _1186 = _1182;
        float _1188 = _1180;
        _226 = _1170;
        if (_1152)
        {
            float _1190 = _1174 * _1170;
            _1100 = _1190;
        }
        float _1192 = _1100;
        float _1194 = _1192;
        if (_1152)
        {
            float _1196 = _1158 * _1192;
            _1166 = _1196;
        }
        float _1198 = _1166;
        if (!_1152)
        {
            _1194 = _1182;
        }
        float _1200 = _1194;
        float _1202 = _1200;
        if (!_1152)
        {
            _1186 = _1184;
        }
        float _1204 = _1186;
        _1106 = _1204;
        if (_1152)
        {
            float _1206 = fma(_1122, _1198, _834);
            _1188 = _1206;
        }
        float _1208 = _1188;
        _1104 = _1208;
        if (_1152)
        {
            float _1210 = fma(_1126, _1198, _810);
            _1202 = _1210;
        }
        float _1212 = _1202;
        _1102 = _1212;
        if (_1152)
        {
            float _1214 = fma(_1178, _1198, _840);
            _1106 = _1214;
        }
    }
    float _1216 = _1018;
    float _1218 = _1102;
    float _1220 = _1104;
    float _1222 = _1106;
    float _1224 = _884;
    float _1226 = _226;
    float _1228 = 0.0;
    float _1230 = _1216;
    float _1232 = _1226;
    float _1234 = _1224;
    if (_1000)
    {
        _1228 = 1.0;
    }
    float _1236 = _1228;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1240 = _988 * _1238;
    float _1242 = _1236;
    if (!_1000)
    {
        float _1244 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1246 = _1244 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1246 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = 1.0 / _1250;
        float _1262 = _1254 * 6.283185482025146484375;
        float _1264 = cos(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = _1254 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = 1.0 / _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1278 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1276;
        float _1280 = 1.0 / _1278;
        float _1282 = _1270 * _1274;
        float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1286 = fma(_1240, _1282, _1284);
        float _1288 = _1286 * _1280;
        float _1290 = precise::clamp(_1288, 0.0, 1.0);
        _1230 = _1246;
        _1232 = _1254;
        _1110 = _1290;
    }
    float _1292 = _1230;
    float _1294 = _1232;
    float _1296 = _1110;
    float _1298 = _1292;
    float _1300 = _1294;
    if (!_1000)
    {
        float _1302 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1304 = _1302 * 0.15915493667125701904296875;
        float _1306 = _1304 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1312 = _1310 * 0.15915493667125701904296875;
        float _1314 = _1304 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = 1.0 / _1308;
        float _1320 = _1312 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1316 * _1318;
        float _1326 = _1312 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1322 * _1324;
        float _1332 = 1.0 / _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1336 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1334;
        float _1338 = 1.0 / _1336;
        float _1340 = _1328 * _1332;
        float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1344 = fma(_1240, _1340, _1342);
        float _1346 = _1344 * _1338;
        float _1348 = precise::clamp(_1346, 0.0, 1.0);
        float _1350 = -_1348;
        float _1352 = _1350 + 1.0;
        _1298 = _1318;
        _1300 = _1330;
        _1242 = _1352;
    }
    float _1354 = _1298;
    float _1356 = _1300;
    float _1358 = _1242;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = _1218 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1366 = _1220 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1370 = _1222 + _1368;
    float _1372 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1374 = _1362 * _1362;
    float _1376 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1372);
    float _1378 = fma(_1366, _1366, _1374);
    float _1380 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1376);
    float _1382 = fma(_1370, _1370, _1378);
    float _1384 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1386 = rsqrt(_1382);
    float _1388 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1390 = _1366 * _1388;
    float _1392 = _1370 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 * _1392;
    float _1398 = _1394 + _1396;
    float _1400 = sqrt(_1398);
    bool _1402 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1406 = _1400 + _1404;
    float _1408 = _1386;
    float _1410 = _1356;
    float _1412 = _1406;
    float _1414 = _1354;
    float _1416 = _1394;
    if (_1402)
    {
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1418;
    }
    float _1420 = _1408;
    if (_1402)
    {
        float _1422 = rsqrt(_1398);
        _1410 = _1422;
    }
    float _1424 = _1410;
    float _1426 = _1424;
    if (_1402)
    {
        float _1428 = _1406 * _1420;
        _1412 = _1428;
    }
    float _1430 = _1412;
    if (_1402)
    {
        float _1432 = _1430 * 0.15915493667125701904296875;
        _1234 = _1432;
    }
    float _1434 = _1234;
    float _1436 = _1370;
    float _1438 = _1434;
    if (_1402)
    {
        float _1440 = _1434 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1436 = _1442;
    }
    float _1444 = _1436;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1420;
    if (_1402)
    {
        float _1452 = _1434 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = -_1388;
    float _1460 = -_1448;
    float _1462 = fma(_1362, _1458, _1460);
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1402)
    {
        float _1466 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1466;
    }
    float _1468 = _1414;
    float _1470 = _1468;
    if (!_1402)
    {
        _1438 = _1392;
    }
    float _1472 = _1438;
    float _1474 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1472;
    if (_1402)
    {
        float _1478 = fma(_1444, _1468, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = floor(_1474);
    float _1484 = _1480;
    float _1486 = _1456;
    if (_1402)
    {
        float _1488 = _1456 + (-1.0);
        _1464 = _1488;
    }
    float _1490 = _1464;
    float _1492 = _1490;
    if (_1402)
    {
        float _1494 = _1424 * _1480;
        _1020 = _1494;
    }
    float _1496 = _1020;
    if (!_1402)
    {
        _1426 = _1390;
    }
    float _1498 = _1426;
    float _1500 = _1498;
    if (_1402)
    {
        float _1502 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (_1402)
    {
        float _1506 = _1390 * _1496;
        _1500 = _1506;
    }
    float _1508 = _1500;
    if (!_1402)
    {
        _1484 = _1462;
    }
    float _1510 = _1484;
    float _1512 = _1510;
    if (_1402)
    {
        float _1514 = _1392 * _1496;
        _1476 = _1514;
    }
    float _1516 = _1476;
    if (_1402)
    {
        float _1518 = fma(_1462, _1456, _1504);
        _1512 = _1518;
    }
    float _1520 = _1512;
    if (_1402)
    {
        float _1522 = _1508 * _1508;
        _1416 = _1522;
    }
    float _1524 = _1416;
    if (!_1402)
    {
        _1486 = _1396;
    }
    float _1526 = _1486;
    float _1528 = sqrt(_1382);
    float _1530 = _1526;
    if (_1402)
    {
        float _1532 = _1516 * _1516;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1520, _1520, _1524);
    float _1538 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1540 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1536 + _1534;
    float _1546 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1540);
    float _1548 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1552 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1546);
    float _1554 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1556 = rsqrt(_1544);
    float _1558 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    float _1560 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1554);
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1566 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1564);
    float _1568 = precise::clamp(_1566, 0.0, 1.0);
    float _1570 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1574 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = -_1568;
    float _1580 = _1578 + 1.0;
    float _1582 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1584 = floor(_1538);
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1588 = -_1482;
    float _1590 = _1474 + _1588;
    float _1592 = -_1582;
    float _1594 = fma(_1592, _1572, 1.0);
    float _1596 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1598 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1600 = _1556 * _1508;
    float _1602 = _1556 * _1516;
    float _1604 = abs(_1580);
    float _1606 = log2(_1604);
    float _1608 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1598);
    float _1610 = _1556 * _1520;
    float _1612 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1614 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1596);
    float _1616 = -_1612;
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1616);
    float _1620 = 1.0 / _1608;
    float _1622 = -_1584;
    float _1624 = _1538 + _1622;
    float _1626 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1614);
    float _1628 = -_1602;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1618);
    float _1632 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1634 = _1610 + 1.0;
    float _1636 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1626);
    float _1638 = fma(_1630, -0.5, 0.5);
    float _1640 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1642 = log2(_1594);
    float _1644 = fma(_1630, 0.5, 0.5);
    float _1646 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1632);
    float _1648 = fma(_1644, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1650 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1646);
    float _1652 = exp2(_1640);
    float _1654 = fma(_1644, _1648, -0.212114393711090087890625);
    float _1656 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1650);
    float _1658 = _1636 * _1620;
    float _1660 = fma(_1644, _1654, 1.570728778839111328125);
    float _1662 = sqrt(_1638);
    float _1664 = _1642 * 0.693147182464599609375;
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1668 = -_1610;
    float _1670 = fma(_1652, _1634, _1668);
    float _1672 = _1656 * _1620;
    float _1674 = fma(_1658, 0.5, 0.5);
    float _1676 = fma(_1670, 0.5, 0.5);
    float _1678 = fma(_1672, -0.5, 0.5);
    float _1680 = _1662 * 0.636619746685028076171875;
    float2 _5522 = float2(_1590, _1624);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5522, float2(0.0), isnan(_5522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5522, float2(0.0), isnan(_5522)), level(0.0)).x;
    float3 _5533 = float3(_1674, _1678, _1666);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5533, float3(0.0), isnan(_5533)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5533, float3(0.0), isnan(_5533)), level(0.0)).x;
    float _1686 = -_1660;
    float _1688 = fma(_1680, _1686, 1.0);
    float3 _5549 = float3(_1674, _1678, _1666);
    float4 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5549, float3(0.0), isnan(_5549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5549, float3(0.0), isnan(_5549)), level(0.0)).xyzw;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = _1691.w;
    float2 _5565 = float2(_1688, _1676);
    float3 _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5565, float2(0.0), isnan(_5565)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5565, float2(0.0), isnan(_5565)), level(0.0)).xyz;
    float _1705 = _1703.x;
    float _1707 = _1703.y;
    float _1709 = _1703.z;
    float _1711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1713 = int(_1711);
    out.m_71.x = _834;
    out.m_71.y = _810;
    out.m_71.z = _840;
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1717 = _1715 != 0;
    int _1719 = abs(_868);
    out.m_73.w = _696;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1723 = _1721 != 0;
    float _1725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1727 = int(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1731 = _1729 != 0;
    out.m_75.x = _776;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1735 = _1733 != 0;
    out.m_77.x = _1220;
    out.m_77.y = _1218;
    out.m_77.z = _1222;
    float _1737 = float(_1713);
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1741 = 1.0 / _1737;
    float _1743 = float(uint(_1727));
    int _1745 = ~_1727;
    int _1747 = _1745 + 1;
    bool _1749 = _1727 == 0;
    float _1751 = 1.0 / _1743;
    float _1753 = _128 * _1741;
    int _1755 = ~_1727;
    int _1757 = _1755 + 1;
    float _1759 = trunc(_1753);
    int _1761 = int(_1759);
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1765 = _1763 != 0;
    int _1767 = as_type<int>(_1751) + (-2);
    float _1769 = float(uint(_1761));
    float _1771 = as_type<float>(_1767) * _1769;
    float _1773 = in.m_63.x;
    float _1775 = in.m_63.y;
    float _1777 = in.m_63.z;
    float _1779 = trunc(_1771);
    float _1781 = precise::max(_1779, 0.0);
    uint _1784 = uint(_1781);
    bool _1786 = !_1765;
    float _1788 = _1786 ? 7.345489978790283203125 : 1.0;
    float _1790 = float(_1761);
    int _1792 = _1757 * int(_1784);
    int _1794 = _1792 + _1761;
    float _1796 = float(uint(_1794));
    float _1798 = _1788 * _1773;
    float _1800 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1802 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1739);
    float _1804 = as_type<float>(_1767) * _1796;
    float _1806 = floor(_1798);
    float _1808 = trunc(_1804);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    int _1814 = int(_1784) + int(_1812);
    float _1816 = -_1806;
    float _1818 = _1798 + _1816;
    float _1820 = float(_1727);
    float _1822 = in.m_79.y;
    int _1824 = _1747 * _1814;
    int _1826 = _1824 + _1761;
    bool _1828 = _1790 >= _1820;
    bool _1830 = isnan(_1790);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(_1820);
    bool _1836 = _1832 || _1834;
    float _1838 = float(_1836);
    float _1840 = _128 * _1820;
    float _1842 = _1818 * _1820;
    bool _1844 = uint(_1826) >= uint(_1727);
    float _1846 = _1840 * _178;
    float _1848 = trunc(_1838);
    int _1850 = int(_1848);
    float _1852 = in.m_81.w;
    bool _1854 = !_1844;
    int _1856 = _1854 ? 0 : (-1);
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1860 = _1858 != 0;
    int _1862 = ~_1814;
    int _1864 = _1862 + _1856;
    int _1866 = _1864 + 1;
    float _1868 = trunc(_1842);
    int _1870 = int(_1868);
    bool _1872 = !_1860;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1727 * _1866;
    int _1878 = _1876 + _1761;
    int _1880 = abs(_864);
    int _1882 = abs(_1874);
    int _1884 = ~_1850;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    float _1890 = trunc(_1846);
    int _1892 = int(_1890);
    bool _1894 = !_1749;
    int _1896 = _1894 ? _1878 : (-1);
    int _1898 = _1896 * _1888;
    int _1900 = _1727 + (-1);
    int _1902 = _1870 * _1882;
    int _1904 = _1902 + _1761;
    int _1906 = abs(_872);
    out.m_83.w = _1852;
    int _1908 = _1850 * _1900;
    int _1910 = _1908 + _1898;
    bool _1912 = _1775 > 0.5;
    int _1914 = _1910 * _1880;
    float _1916 = -_1822;
    float _1918 = _1916 + 1.0;
    int _1920 = _1892 * _1719;
    int _1922 = _1920 + _1914;
    bool _1924 = !_1717;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1930 = _1822;
    float _1932 = _1608;
    float _1934 = _1636;
    float _1936 = _1656;
    if (_1723)
    {
        float _1938 = _1912 ? _1918 : _1822;
        _1930 = _1938;
    }
    float _1940 = _1930;
    int _1942 = _1904 * _1906;
    int _1944 = _1942 + _1922;
    int _1946 = abs(_1926);
    float _1948 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1928);
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1952 = _1870 * _1946;
    int _1954 = _1952 + _1944;
    float _1956 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1962 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1950);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1968 = float(uint(_1954));
    float _1970 = as_type<float>(_1870);
    if (_1731)
    {
        float _1972 = in.m_63.x;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = 1.0 / _1960;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1980 = as_type<float>(_1767) * _1968;
    float _1982 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1948);
    float _1984 = fma(_1800, -2.0, _1978);
    bool _1986 = _740 != 0.0;
    bool _1988 = isnan(_740);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan(0.0);
    bool _1994 = _1990 || _1992;
    float _1996 = trunc(_1980);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2004 = _1982 * (-0.15915493667125701904296875);
    float _2006 = -_2002;
    float _2008 = fma(_1956, 2.0, _2006);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2012 = 1.0 / _1966;
    int _2014 = ~_1727;
    int _2016 = _2014 + 1;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2020 = _738 == 0.0;
    bool _2022 = !_1994;
    bool _2024 = _2020 && _2022;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2028 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2030 = _2016 * int(_2000);
    int _2032 = _2030 + _1954;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2034;
    bool _2038 = _742 == 0.0;
    bool _2040 = _2038 && _2024;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2044 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = float(uint(_2032));
    float _2048 = _2036 * _1976;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2054 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = in.m_85.x;
    float _2058 = in.m_85.y;
    float _2060 = in.m_85.z;
    float _2062 = as_type<float>(_1767) * _2046;
    float _2064 = _2052 * _2012;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_87.x = _2028;
    out.m_87.y = _2044;
    out.m_87.z = _2054;
    out.m_87.w = _2042;
    float _2070 = trunc(_2062);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    bool _2076 = _1974 > 0.5;
    bool _2078 = _2076 && _1731;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2080;
    float _2084 = in.m_79.x;
    float _2086 = -_128;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2008);
    float _2090 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1984);
    float _2092 = 1.0 / _2068;
    int _2094 = ~_1727;
    int _2096 = _2094 + 1;
    float _2098 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1962);
    float _2100 = float(uint(_1904));
    float _2102 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2104 = _364 + _2102;
    int _2106 = int(_2000) + int(_2074);
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2110 = _364 + _2108;
    int _2112 = ~_1727;
    int _2114 = _2112 + 1;
    float _2116 = _2058;
    float _2118 = _2056;
    float _2120 = _2060;
    if (!_2040)
    {
        float _2122 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2058);
        _2116 = _2122;
    }
    float _2124 = _2116;
    float _2126 = as_type<float>(_1767) * _2100;
    float _2128 = fma(_2064, _2104, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2130 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2132 = isnan(_364);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2138 = _2134 || _2136;
    float _2140 = float(_2138);
    if (!_2040)
    {
        float _2142 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2056);
        _2118 = _2142;
    }
    float _2144 = _2118;
    bool _2146 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2148 = isnan(_364);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = fma(_2048, _2110, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2160 = trunc(_2126);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    float _2166 = _2082 * _2092;
    float _2168 = -_2140;
    float _2170 = _2168 + 1.0;
    bool _2172 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2174 = isnan(_364);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = _2114 * _2106;
    int _2186 = _2184 + _1954;
    float _2188 = -_2156;
    float _2190 = _2188 + 1.0;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2194 = _364 + _2192;
    float _2196 = _2156 * _2170;
    float _2198 = _2182;
    float _2200 = _2084;
    if (!_2040)
    {
        float _2202 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2060);
        _2120 = _2202;
    }
    float _2204 = _2120;
    float _2206 = _2182 * _2190;
    bool _2208 = uint(_2186) >= uint(_1727);
    float _2210 = fma(_2166, _2194, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2212 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1802);
    bool _2214 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2216 = isnan(_364);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_2182;
    float _2228 = _2226 + 1.0;
    bool _2230 = !_2208;
    int _2232 = _2230 ? 0 : (-1);
    float _2234 = _2004 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    int _2238 = _2096 * int(_2164);
    int _2240 = _2238 + _1904;
    if (_1731)
    {
        _2198 = _2084;
    }
    float _2242 = _2198;
    float _2244 = _2224 * _2228;
    int _2246 = ~_2106;
    int _2248 = _2246 + _2232;
    int _2250 = _2248 + 1;
    float _2252 = -_2224;
    float _2254 = _2252 + 1.0;
    float _2256 = float(uint(_2240));
    float _2258 = _2242;
    if (_2078)
    {
        float _2260 = -_2242;
        float _2262 = _2260 + 1.0;
        _2258 = _2262;
    }
    float _2264 = _2258;
    float _2266 = _2004 * 6.283185482025146484375;
    float _2268 = cos(_2266);
    float _2270 = _2158 * _2244;
    int _2272 = _1727 * _2250;
    int _2274 = _2272 + _1954;
    float _2276 = as_type<float>(_1767) * _2256;
    if (_1731)
    {
        _2200 = _2264;
    }
    float _2278 = _2200;
    float _2280 = fma(_2254, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2270);
    float _2282 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2284 = !_1749;
    int _2286 = _2284 ? _2274 : (-1);
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    float _2294 = fma(_2128, _2206, _2280);
    float _2296 = _2236 * _2282;
    float _2298 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2300 = _2286 >> 31;
    float _2302 = _730 * _2124;
    int _2304 = _2286 & 3;
    bool _2306 = _2304 != 0;
    float _2308 = _728 * _2124;
    float _2310 = _2268 * _2282;
    int _2312 = _2300 & 3;
    float _2314 = -_2296;
    float _2316 = fma(_2268, _2298, _2314);
    float _2318 = fma(_2236, _2298, _2310);
    float _2320 = fma(_2210, _2196, _2294);
    int _2322 = _2286 + _2312;
    float _2324 = fma(_2098, _2316, _2088);
    int _2326 = int(_2164) + int(_2292);
    float _2328 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2320);
    int _2330 = _2322 >> 2;
    float _2332 = abs(_1240);
    float _2334 = log2(_2332);
    float _2336 = -_2090;
    float _2338 = fma(_2212, _2318, _2336);
    int _2340 = ~_1727;
    int _2342 = _2340 + 1;
    float _2344 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2346 = _2330 << 4;
    int _2348 = _2346 + 368;
    float _2350 = _2338 + 0.5;
    int _2352 = _2342 * _2326;
    int _2354 = _2352 + _1904;
    uint _2356 = uint(int(uint(_2348) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    int _2364 = int(_2356) + 1;
    uint _2366 = uint(int(uint(_2364) >> uint(2)));
    int _2368 = _2364 & 3;
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[int(_2366)][_2368];
    float _2372 = _726 * _2124;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2378 = uint(_2354) >= uint(_1727);
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2382 = _2286 & 3;
    bool _2384 = _2382 != 0;
    float _2386 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2388 = _2348 + 8;
    uint _2390 = uint(int(uint(_2388) >> uint(2)));
    uint _2392 = uint(int(uint(int(_2390)) >> uint(2)));
    int _2394 = int(_2390) & 3;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[int(_2392)][_2394];
    int _2398 = int(_2390) + 1;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    int _2402 = _2398 & 3;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[int(_2400)][_2402];
    float _2406 = _2324 + 0.5;
    bool _2408 = !_2378;
    int _2410 = _2408 ? 0 : (-1);
    float _2412 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2414 = uint(_2382) > 1u;
    float _2416 = exp2(_2386);
    int _2418 = ~_2326;
    int _2420 = _2418 + _2410;
    int _2422 = _2420 + 1;
    float _2424 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2426 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2428 = _2306 ? 0 : 1;
    int _2430 = _1727 * _2422;
    int _2432 = _2430 + _1904;
    out.m_89.x = _2406;
    out.m_89.y = _2350;
    bool _2434 = _2382 != 3;
    float _2436 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2438 = uint(_2382) >= 2u;
    out.m_91.x = _2412;
    out.m_91.y = _2424;
    out.m_91.z = _2426;
    out.m_91.w = _2344;
    bool _2440 = !_2384;
    int _2442 = _2440 ? 0 : 1;
    float _2444 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2436);
    bool _2446 = _2382 != 3;
    float _2448 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    bool _2452 = !_1749;
    int _2454 = _2452 ? _2432 : (-1);
    float _2456 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2444);
    int _2458 = ~_2428;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    float _2464 = fma(_792, _2144, _2302);
    int _2466 = _2462;
    if (!_2414)
    {
        int _2468 = ~_2428;
        int _2470 = _2468 + 1;
        _2466 = _2470;
    }
    int _2472 = _2466;
    float _2474 = fma(_794, _2144, _2308);
    bool _2476 = _1240 <= 8000.0;
    bool _2478 = isnan(_1240);
    bool _2480 = _2476 || _2478;
    bool _2482 = isnan(8000.0);
    bool _2484 = _2480 || _2482;
    float _2486 = float(_2484);
    float _2488 = fma(_788, _2144, _2372);
    int _2490 = abs(_2472);
    float _2492 = fma(_2450, -2.0, 3.0);
    float _2494 = _2450 * _2450;
    int _2496 = _2438 ? 0 : 1;
    float _2498 = fma(_458, _2204, _2464);
    float _2500 = fma(_470, _2204, _2474);
    float _2502 = _2494 * _2492;
    int _2504 = ~_2496;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = fma(_460, _2204, _2488);
    int _2512 = _2508;
    if (_2434)
    {
        int _2514 = ~_2496;
        int _2516 = _2514 + 1;
        _2512 = _2516;
    }
    int _2518 = _2512;
    float _2520 = -_2502;
    float _2522 = _2520 + 1.0;
    int _2524 = abs(_2442);
    float _2526 = -_1682;
    float _2528 = _2526 + 1.0;
    int _2530 = ~_2490;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    float _2536 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2502);
    int _2538 = abs(_2518);
    out.m_93.x = _2498;
    out.m_93.y = _2500;
    out.m_93.z = _2510;
    bool _2540 = !_2446;
    int _2542 = _2540 ? 0 : (-1);
    int _2544 = _2534 * as_type<int>(_2370);
    int _2546 = ~_2524;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    int _2552 = abs(_2542);
    int _2554 = ~_2538;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    int _2560 = _2550 * as_type<int>(_2362);
    int _2562 = _2560 + _2544;
    bool _2564 = !_1735;
    int _2566 = _2564 ? 0 : 1;
    float _2568 = _1608 * 0.5;
    int _2570 = ~_2552;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = _2558 * as_type<int>(_2396);
    int _2578 = _2576 + _2562;
    int _2580 = abs(_2566);
    float _2582 = fma(_1656, -0.5, _2568);
    float _2584 = in.m_67.x;
    int _2586 = _2574 * as_type<int>(_2404);
    int _2588 = _2586 + _2578;
    int _2590 = ~_2580;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    float _2596 = _2486 * _2536;
    int _2598 = _2588 * _2594;
    float _2600 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2602 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2456);
    float _2604 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2606 = _2454 * _2580;
    int _2608 = _2606 + _2598;
    float _2610 = _1636 + _1608;
    float _2612 = _2602 + _1608;
    float _2614 = exp2(_2600);
    float _2616 = _2528 * _2604;
    float _2618 = precise::clamp(_2616, 0.0, 1.0);
    float _2620 = _2610 * 0.5;
    float _2622 = _2612 * 0.5;
    bool _2624 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2626 = isnan(_1528);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2632 = _2628 || _2630;
    float _2634 = -_2618;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2638 = float(_2608);
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1656;
    out.gl_Position.z = _2602;
    out.gl_Position.w = _1608;
    float _2640 = _2636 * _2584;
    out.m_95.x = _2620;
    out.m_95.y = _2582;
    out.m_95.z = _2622;
    out.m_95.w = _1608;
    out.m_97.x = _2638;
    float _2642 = -_2614;
    float _2644 = _2642 + 1.0;
    float _2646 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2648 = _2638;
    if (!_2632)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2650 = _1932;
    float _2652 = _2650;
    float _2654 = _2650;
    if (!_2632)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2656 = _1934;
    float _2658 = _2646 * _1684;
    float _2660 = -_2646;
    float _2662 = _2660 + 1.0;
    float _2664 = _2656;
    float _2666 = _2656;
    if (!_2632)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2668 = _1936;
    float _2670 = _1699 * _2658;
    float _2672 = _1709 * _2658;
    float _2674 = _1699 * _2662;
    float _2676 = _2668;
    float _2678 = _2668;
    if (!_2632)
    {
        _2648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2680 = _2648;
    float _2682 = fma(_1705, _2670, _1693);
    float _2684 = fma(_1707, _2670, _1695);
    float _2686 = fma(_1699, _2672, _1697);
    float _2688 = _2640 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2690 = _1296 * _1358;
    out.m_99.x = _2682;
    out.m_99.y = _2684;
    out.m_99.z = _2686;
    out.m_99.w = _2674;
    float _2692 = _2690 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2694 = _2690;
    float _2696 = _2688;
    float _2698 = _2680;
    float _2700 = _2680;
    if (!_2632)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2702 = _2694;
    out.m_101.x = _2688;
    float _2704 = _2702;
    float _2706 = _2702;
    if (!_2632)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2708 = _2696;
    bool _2710 = !_2632;
    float _2712 = _2708;
    float _2714 = _2708;
    if (!_2710)
    {
        bool _2716 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2718 = isnan(_1528);
        bool _2720 = _2716 || _2718;
        bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2724 = _2720 || _2722;
        if (!_2724)
        {
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2728 = _1528 + _2726;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2732 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2730;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2738 = 1.0 / _2732;
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2756 = _2728 * _2738;
            float _2758 = precise::clamp(_2756, 0.0, 1.0);
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2764 = fma(_2758, _2736, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2766 = fma(_2758, _2762, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2768 = fma(_2758, _2742, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2770 = fma(_2758, _2746, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2772 = fma(_2758, _2750, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2774 = fma(_2758, _2754, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2666 = _2768;
            _2714 = _2772;
            _2654 = _2764;
            _2700 = _2770;
            _2678 = _2766;
            _2706 = _2774;
            _2776 = true;
        }
        else
        {
            bool _2778 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2780 = isnan(_1528);
            bool _2782 = _2778 || _2780;
            bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2786 = _2782 || _2784;
            if (!_2786)
            {
                _2652 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2788 = _2652;
            _2654 = _2788;
            if (!_2786)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2790 = _2664;
            _2666 = _2790;
            if (!_2786)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2792 = _2676;
            _2678 = _2792;
            if (!_2786)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2794 = _2698;
            _2700 = _2794;
            if (!_2786)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2796 = _2712;
            _2714 = _2796;
            if (!_2786)
            {
                _2704 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2798 = _2704;
            bool _2800 = !_2786;
            _2706 = _2798;
            if (!_2800)
            {
                bool _2802 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2804 = isnan(_1528);
                bool _2806 = _2802 || _2804;
                bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2810 = _2806 || _2808;
                if (!_2810)
                {
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2814 = _1528 + _2812;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2818 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2816;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2824 = 1.0 / _2818;
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2842 = _2814 * _2824;
                    float _2844 = precise::clamp(_2842, 0.0, 1.0);
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2850 = fma(_2844, _2822, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2852 = fma(_2844, _2848, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2854 = fma(_2844, _2828, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2856 = fma(_2844, _2832, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2858 = fma(_2844, _2836, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2860 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2666 = _2854;
                    _2714 = _2858;
                    _2654 = _2850;
                    _2700 = _2856;
                    _2678 = _2852;
                    _2706 = _2860;
                    _2776 = true;
                }
                else
                {
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2654 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2706 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2776 = false;
    float _2862 = _2666;
    float _2864 = _2714;
    float _2866 = _2654;
    float _2868 = _2700;
    float _2870 = _2678;
    float _2872 = _2706;
    float _2874 = _2692 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2876 = fma(_2500, -0.5, 0.5);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -_2862;
    float _2882 = _2880 + _2864;
    float _2884 = -_2866;
    float _2886 = _2884 + _2868;
    out.m_103.x = 0.0;
    float _2888 = fma(_2878, _2882, _2862);
    float _2890 = -_2870;
    float _2892 = _2890 + _2872;
    float _2894 = fma(_2878, _2886, _2866);
    float _2896 = _2888 * 0.586610972881317138671875;
    bool _2898 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2900 = fma(_2878, _2892, _2870);
    out.m_53.x = _2874;
    float _2902 = fma(_2894, 0.298911988735198974609375, _2896);
    bool _2904 = _1296 > 0.0;
    bool _2906 = isnan(_1296);
    bool _2908 = _2904 || _2906;
    bool _2910 = isnan(0.0);
    bool _2912 = _2908 || _2910;
    float _2914 = fma(_2900, 0.114477999508380889892578125, _2902);
    bool _2916 = _1358 <= 0.0;
    bool _2918 = !_2912;
    bool _2920 = _2916 || _2918;
    float _2922 = -_2914;
    float _2924 = _2894 + _2922;
    float _2926 = -_2914;
    float _2928 = _2888 + _2926;
    float _2930 = -_2914;
    float _2932 = _2900 + _2930;
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    float _2938 = fma(_2932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    bool _2940 = !_2898;
    if (!_2940)
    {
        float _2942 = -_1218;
        float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2946 = -_1220;
        float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2950 = -_1222;
        float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2954 = _2944 * _2944;
        float _2956 = fma(_2948, _2948, _2954);
        float _2958 = fma(_2952, _2952, _2956);
        float _2960 = sqrt(_2958);
        float _2962 = rsqrt(_2958);
        float _2964 = -_2960;
        float _2966 = _2964 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2968 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2970 = precise::clamp(_2968, 0.0, 1.0);
        float _2972 = _2948 * _2962;
        float _2974 = _2944 * _2962;
        float _2976 = abs(_2970);
        float _2978 = log2(_2976);
        float _2980 = _2952 * _2962;
        float _2982 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2984 = _2500 * _2974;
        float _2986 = -_2974;
        float _2988 = -_2982;
        float _2990 = fma(_2986, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2988);
        float _2992 = fma(_2498, _2972, _2984);
        float _2994 = -_2980;
        float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2990);
        float _2998 = fma(_2510, _2980, _2992);
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3004 = _2996 + _3002;
        float _3006 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3008 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3010 = precise::clamp(_3008, 0.0, 1.0);
        float _3012 = exp2(_3006);
        float _3014 = _3012 * _3010;
        float _3016 = _3000 * _3014;
        float _3018 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3020 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3022 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3018;
        out.m_103.y = _3020;
        out.m_103.z = _3022;
    }
    out.m_73.x = _2934;
    out.m_73.y = _2936;
    out.m_73.z = _2938;
    if (!_2920)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3024 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3024;
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
    bool _2776 = false;
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
        float _3092 = as_type<float>(_144);
        out.gl_Position.z = _3092;
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
        float _3147 = as_type<float>(_170);
        out.gl_Position.z = _3147;
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
    float _798 = fma(_782, _792, _790);
    float _800 = fma(_460, _784, _796);
    float _802 = fma(_458, _784, _798);
    float _804 = _410 + _800;
    float _806 = _408 + _802;
    float _808 = -_704;
    float _810 = _808 + _396;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _814 = _804 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _806 + _816;
    float _820 = _810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _822 = _814 * _814;
    float _824 = fma(_818, _818, _822);
    float _826 = _780 * _728;
    float _828 = sqrt(_824);
    float _830 = fma(_782, _794, _826);
    float _832 = -_706;
    float _834 = _408 + _832;
    float _836 = fma(_470, _784, _830);
    float _838 = -_708;
    float _840 = _410 + _838;
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].x, _820);
    float _844 = _396 + _836;
    float _846 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[11].z, _842);
    bool _848 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
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
    float _874 = _836;
    float _876 = _766;
    float _878 = _806;
    float _880 = _704;
    float _882 = _706;
    float _884 = _708;
    if (!_848)
    {
        _874 = _804;
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
        float _900 = _828 + _898;
        float _902 = rsqrt(_824);
        float _904 = _900 * _896;
        float _906 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = cos(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 + (-1.0);
        float _920 = fma(_916, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _922 = _918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _902 * _920;
        float _926 = fma(_844, _912, _922);
        float _928 = fma(_818, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_814, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _894 = _926;
        _878 = _928;
        _888 = _930;
    }
    float _932 = _894;
    float _934 = _878;
    float _936 = _888;
    float _938 = -_396;
    float _940 = _938 + _932;
    float _942 = -_408;
    float _944 = _942 + _934;
    float _946 = _846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _948 = _810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _950 = _940 * _940;
    float _952 = -_410;
    float _954 = _952 + _936;
    float _956 = 1.0 / _946;
    float _958 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _960 = fma(_944, _944, _950);
    float _962 = -_706;
    float _964 = _962 + _934;
    float _966 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[10].z, _958);
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
    float _1102 = _1096;
    float _1104 = _1094;
    float _1106 = _1098;
    if (_1000)
    {
        _224 = 1.0;
    }
    float _1108 = _224;
    float _1110 = _1108;
    if (!_1014)
    {
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1114 = _810 + _1112;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1118 = _834 + _1116;
        float _1120 = -_834;
        float _1122 = _1120 + _1094;
        float _1124 = -_810;
        float _1126 = _1124 + _1096;
        float _1128 = _1114 * _1114;
        float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1132 = _840 + _1130;
        float _1134 = fma(_1118, _1118, _1128);
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1138 = fma(_1132, _1132, _1134);
        float _1140 = sqrt(_1138);
        float _1142 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1144 = _1140 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1146 = isnan(_1140);
        bool _1148 = _1144 || _1146;
        bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1152 = _1148 || _1150;
        float _1154 = precise::min(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1136;
        float _1158 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1160 = _1158 * _1156;
        float _1162 = _218;
        float _1164 = _1136;
        float _1166 = _1158;
        _1018 = _1126;
        _884 = _1122;
        if (_1152)
        {
            float _1168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1162 = _1168;
        }
        float _1170 = _1162;
        if (_1152)
        {
            float _1172 = precise::max(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1164 = _1172;
        }
        float _1174 = _1164;
        float _1176 = -_840;
        float _1178 = _1176 + _1098;
        float _1180 = fma(_1122, _1160, _834);
        float _1182 = fma(_1126, _1160, _810);
        float _1184 = fma(_1178, _1160, _840);
        float _1186 = _1182;
        float _1188 = _1180;
        _226 = _1170;
        if (_1152)
        {
            float _1190 = _1174 * _1170;
            _1100 = _1190;
        }
        float _1192 = _1100;
        float _1194 = _1192;
        if (_1152)
        {
            float _1196 = _1158 * _1192;
            _1166 = _1196;
        }
        float _1198 = _1166;
        if (!_1152)
        {
            _1194 = _1182;
        }
        float _1200 = _1194;
        float _1202 = _1200;
        if (!_1152)
        {
            _1186 = _1184;
        }
        float _1204 = _1186;
        _1106 = _1204;
        if (_1152)
        {
            float _1206 = fma(_1122, _1198, _834);
            _1188 = _1206;
        }
        float _1208 = _1188;
        _1104 = _1208;
        if (_1152)
        {
            float _1210 = fma(_1126, _1198, _810);
            _1202 = _1210;
        }
        float _1212 = _1202;
        _1102 = _1212;
        if (_1152)
        {
            float _1214 = fma(_1178, _1198, _840);
            _1106 = _1214;
        }
    }
    float _1216 = _1018;
    float _1218 = _1102;
    float _1220 = _1104;
    float _1222 = _1106;
    float _1224 = _884;
    float _1226 = _226;
    float _1228 = 0.0;
    float _1230 = _1216;
    float _1232 = _1226;
    float _1234 = _1224;
    if (_1000)
    {
        _1228 = 1.0;
    }
    float _1236 = _1228;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1240 = _988 * _1238;
    float _1242 = _1236;
    if (!_1000)
    {
        float _1244 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1246 = _1244 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1246 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = 1.0 / _1250;
        float _1262 = _1254 * 6.283185482025146484375;
        float _1264 = cos(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = _1254 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = 1.0 / _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1278 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1276;
        float _1280 = 1.0 / _1278;
        float _1282 = _1270 * _1274;
        float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1286 = fma(_1240, _1282, _1284);
        float _1288 = _1286 * _1280;
        float _1290 = precise::clamp(_1288, 0.0, 1.0);
        _1230 = _1246;
        _1232 = _1254;
        _1110 = _1290;
    }
    float _1292 = _1230;
    float _1294 = _1232;
    float _1296 = _1110;
    float _1298 = _1292;
    float _1300 = _1294;
    if (!_1000)
    {
        float _1302 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1304 = _1302 * 0.15915493667125701904296875;
        float _1306 = _1304 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1312 = _1310 * 0.15915493667125701904296875;
        float _1314 = _1304 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = 1.0 / _1308;
        float _1320 = _1312 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1316 * _1318;
        float _1326 = _1312 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1322 * _1324;
        float _1332 = 1.0 / _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1336 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1334;
        float _1338 = 1.0 / _1336;
        float _1340 = _1328 * _1332;
        float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1344 = fma(_1240, _1340, _1342);
        float _1346 = _1344 * _1338;
        float _1348 = precise::clamp(_1346, 0.0, 1.0);
        float _1350 = -_1348;
        float _1352 = _1350 + 1.0;
        _1298 = _1318;
        _1300 = _1330;
        _1242 = _1352;
    }
    float _1354 = _1298;
    float _1356 = _1300;
    float _1358 = _1242;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = _1218 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1366 = _1220 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1370 = _1222 + _1368;
    float _1372 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1374 = _1362 * _1362;
    float _1376 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1372);
    float _1378 = fma(_1366, _1366, _1374);
    float _1380 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1376);
    float _1382 = fma(_1370, _1370, _1378);
    float _1384 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1386 = rsqrt(_1382);
    float _1388 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1390 = _1366 * _1388;
    float _1392 = _1370 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 * _1392;
    float _1398 = _1394 + _1396;
    float _1400 = sqrt(_1398);
    bool _1402 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1406 = _1400 + _1404;
    float _1408 = _1386;
    float _1410 = _1356;
    float _1412 = _1406;
    float _1414 = _1354;
    float _1416 = _1394;
    if (_1402)
    {
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1418;
    }
    float _1420 = _1408;
    if (_1402)
    {
        float _1422 = rsqrt(_1398);
        _1410 = _1422;
    }
    float _1424 = _1410;
    float _1426 = _1424;
    if (_1402)
    {
        float _1428 = _1406 * _1420;
        _1412 = _1428;
    }
    float _1430 = _1412;
    if (_1402)
    {
        float _1432 = _1430 * 0.15915493667125701904296875;
        _1234 = _1432;
    }
    float _1434 = _1234;
    float _1436 = _1370;
    float _1438 = _1434;
    if (_1402)
    {
        float _1440 = _1434 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1436 = _1442;
    }
    float _1444 = _1436;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1420;
    if (_1402)
    {
        float _1452 = _1434 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = -_1388;
    float _1460 = -_1448;
    float _1462 = fma(_1362, _1458, _1460);
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1402)
    {
        float _1466 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1466;
    }
    float _1468 = _1414;
    float _1470 = _1468;
    if (!_1402)
    {
        _1438 = _1392;
    }
    float _1472 = _1438;
    float _1474 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1472;
    if (_1402)
    {
        float _1478 = fma(_1444, _1468, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = floor(_1474);
    float _1484 = _1480;
    float _1486 = _1456;
    if (_1402)
    {
        float _1488 = _1456 + (-1.0);
        _1464 = _1488;
    }
    float _1490 = _1464;
    float _1492 = _1490;
    if (_1402)
    {
        float _1494 = _1424 * _1480;
        _1020 = _1494;
    }
    float _1496 = _1020;
    if (!_1402)
    {
        _1426 = _1390;
    }
    float _1498 = _1426;
    float _1500 = _1498;
    if (_1402)
    {
        float _1502 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (_1402)
    {
        float _1506 = _1390 * _1496;
        _1500 = _1506;
    }
    float _1508 = _1500;
    if (!_1402)
    {
        _1484 = _1462;
    }
    float _1510 = _1484;
    float _1512 = _1510;
    if (_1402)
    {
        float _1514 = _1392 * _1496;
        _1476 = _1514;
    }
    float _1516 = _1476;
    if (_1402)
    {
        float _1518 = fma(_1462, _1456, _1504);
        _1512 = _1518;
    }
    float _1520 = _1512;
    if (_1402)
    {
        float _1522 = _1508 * _1508;
        _1416 = _1522;
    }
    float _1524 = _1416;
    if (!_1402)
    {
        _1486 = _1396;
    }
    float _1526 = _1486;
    float _1528 = sqrt(_1382);
    float _1530 = _1526;
    if (_1402)
    {
        float _1532 = _1516 * _1516;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1520, _1520, _1524);
    float _1538 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1540 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1536 + _1534;
    float _1546 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1540);
    float _1548 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1552 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1546);
    float _1554 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1556 = rsqrt(_1544);
    float _1558 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    float _1560 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1554);
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1566 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1564);
    float _1568 = precise::clamp(_1566, 0.0, 1.0);
    float _1570 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1574 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = -_1568;
    float _1580 = _1578 + 1.0;
    float _1582 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1584 = floor(_1538);
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1588 = -_1482;
    float _1590 = _1474 + _1588;
    float _1592 = -_1582;
    float _1594 = fma(_1592, _1572, 1.0);
    float _1596 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1598 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1600 = _1556 * _1508;
    float _1602 = _1556 * _1516;
    float _1604 = abs(_1580);
    float _1606 = log2(_1604);
    float _1608 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1598);
    float _1610 = _1556 * _1520;
    float _1612 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1614 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1596);
    float _1616 = -_1612;
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1616);
    float _1620 = 1.0 / _1608;
    float _1622 = -_1584;
    float _1624 = _1538 + _1622;
    float _1626 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1614);
    float _1628 = -_1602;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1618);
    float _1632 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1634 = _1610 + 1.0;
    float _1636 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1626);
    float _1638 = fma(_1630, -0.5, 0.5);
    float _1640 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1642 = log2(_1594);
    float _1644 = fma(_1630, 0.5, 0.5);
    float _1646 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1632);
    float _1648 = fma(_1644, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1650 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1646);
    float _1652 = exp2(_1640);
    float _1654 = fma(_1644, _1648, -0.212114393711090087890625);
    float _1656 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1650);
    float _1658 = _1636 * _1620;
    float _1660 = fma(_1644, _1654, 1.570728778839111328125);
    float _1662 = sqrt(_1638);
    float _1664 = _1642 * 0.693147182464599609375;
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1668 = -_1610;
    float _1670 = fma(_1652, _1634, _1668);
    float _1672 = _1656 * _1620;
    float _1674 = fma(_1658, 0.5, 0.5);
    float _1676 = fma(_1670, 0.5, 0.5);
    float _1678 = fma(_1672, -0.5, 0.5);
    float _1680 = _1662 * 0.636619746685028076171875;
    float2 _5522 = float2(_1590, _1624);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5522, float2(0.0), isnan(_5522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5522, float2(0.0), isnan(_5522)), level(0.0)).x;
    float3 _5533 = float3(_1674, _1678, _1666);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5533, float3(0.0), isnan(_5533)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5533, float3(0.0), isnan(_5533)), level(0.0)).x;
    float _1686 = -_1660;
    float _1688 = fma(_1680, _1686, 1.0);
    float3 _5549 = float3(_1674, _1678, _1666);
    float4 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5549, float3(0.0), isnan(_5549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5549, float3(0.0), isnan(_5549)), level(0.0)).xyzw;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = _1691.w;
    float2 _5565 = float2(_1688, _1676);
    float3 _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5565, float2(0.0), isnan(_5565)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5565, float2(0.0), isnan(_5565)), level(0.0)).xyz;
    float _1705 = _1703.x;
    float _1707 = _1703.y;
    float _1709 = _1703.z;
    float _1711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1713 = int(_1711);
    out.m_71.x = _834;
    out.m_71.y = _810;
    out.m_71.z = _840;
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1717 = _1715 != 0;
    int _1719 = abs(_868);
    out.m_73.w = _696;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1723 = _1721 != 0;
    float _1725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1727 = int(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1731 = _1729 != 0;
    out.m_75.x = _776;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1735 = _1733 != 0;
    out.m_77.x = _1220;
    out.m_77.y = _1218;
    out.m_77.z = _1222;
    float _1737 = float(_1713);
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1741 = 1.0 / _1737;
    float _1743 = float(uint(_1727));
    int _1745 = ~_1727;
    int _1747 = _1745 + 1;
    bool _1749 = _1727 == 0;
    float _1751 = 1.0 / _1743;
    float _1753 = _128 * _1741;
    int _1755 = ~_1727;
    int _1757 = _1755 + 1;
    float _1759 = trunc(_1753);
    int _1761 = int(_1759);
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1765 = _1763 != 0;
    int _1767 = as_type<int>(_1751) + (-2);
    float _1769 = float(uint(_1761));
    float _1771 = as_type<float>(_1767) * _1769;
    float _1773 = in.m_63.x;
    float _1775 = in.m_63.y;
    float _1777 = in.m_63.z;
    float _1779 = trunc(_1771);
    float _1781 = precise::max(_1779, 0.0);
    uint _1784 = uint(_1781);
    bool _1786 = !_1765;
    float _1788 = _1786 ? 7.345489978790283203125 : 1.0;
    float _1790 = float(_1761);
    int _1792 = _1757 * int(_1784);
    int _1794 = _1792 + _1761;
    float _1796 = float(uint(_1794));
    float _1798 = _1788 * _1773;
    float _1800 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1802 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1739);
    float _1804 = as_type<float>(_1767) * _1796;
    float _1806 = floor(_1798);
    float _1808 = trunc(_1804);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    int _1814 = int(_1784) + int(_1812);
    float _1816 = -_1806;
    float _1818 = _1798 + _1816;
    float _1820 = float(_1727);
    float _1822 = in.m_79.y;
    int _1824 = _1747 * _1814;
    int _1826 = _1824 + _1761;
    bool _1828 = _1790 >= _1820;
    bool _1830 = isnan(_1790);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(_1820);
    bool _1836 = _1832 || _1834;
    float _1838 = float(_1836);
    float _1840 = _128 * _1820;
    float _1842 = _1818 * _1820;
    bool _1844 = uint(_1826) >= uint(_1727);
    float _1846 = _1840 * _178;
    float _1848 = trunc(_1838);
    int _1850 = int(_1848);
    float _1852 = in.m_81.w;
    bool _1854 = !_1844;
    int _1856 = _1854 ? 0 : (-1);
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1860 = _1858 != 0;
    int _1862 = ~_1814;
    int _1864 = _1862 + _1856;
    int _1866 = _1864 + 1;
    float _1868 = trunc(_1842);
    int _1870 = int(_1868);
    bool _1872 = !_1860;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1727 * _1866;
    int _1878 = _1876 + _1761;
    int _1880 = abs(_864);
    int _1882 = abs(_1874);
    int _1884 = ~_1850;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    float _1890 = trunc(_1846);
    int _1892 = int(_1890);
    bool _1894 = !_1749;
    int _1896 = _1894 ? _1878 : (-1);
    int _1898 = _1896 * _1888;
    int _1900 = _1727 + (-1);
    int _1902 = _1870 * _1882;
    int _1904 = _1902 + _1761;
    int _1906 = abs(_872);
    out.m_83.w = _1852;
    int _1908 = _1850 * _1900;
    int _1910 = _1908 + _1898;
    bool _1912 = _1775 > 0.5;
    int _1914 = _1910 * _1880;
    float _1916 = -_1822;
    float _1918 = _1916 + 1.0;
    int _1920 = _1892 * _1719;
    int _1922 = _1920 + _1914;
    bool _1924 = !_1717;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1930 = _1822;
    float _1932 = _1608;
    float _1934 = _1636;
    float _1936 = _1656;
    if (_1723)
    {
        float _1938 = _1912 ? _1918 : _1822;
        _1930 = _1938;
    }
    float _1940 = _1930;
    int _1942 = _1904 * _1906;
    int _1944 = _1942 + _1922;
    int _1946 = abs(_1926);
    float _1948 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1928);
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1952 = _1870 * _1946;
    int _1954 = _1952 + _1944;
    float _1956 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1962 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1950);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1968 = float(uint(_1954));
    float _1970 = as_type<float>(_1870);
    if (_1731)
    {
        float _1972 = in.m_63.x;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = 1.0 / _1960;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1980 = as_type<float>(_1767) * _1968;
    float _1982 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1948);
    float _1984 = fma(_1800, -2.0, _1978);
    bool _1986 = _740 != 0.0;
    bool _1988 = isnan(_740);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan(0.0);
    bool _1994 = _1990 || _1992;
    float _1996 = trunc(_1980);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2004 = _1982 * (-0.15915493667125701904296875);
    float _2006 = -_2002;
    float _2008 = fma(_1956, 2.0, _2006);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2012 = 1.0 / _1966;
    int _2014 = ~_1727;
    int _2016 = _2014 + 1;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2020 = _738 == 0.0;
    bool _2022 = !_1994;
    bool _2024 = _2020 && _2022;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2028 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2030 = _2016 * int(_2000);
    int _2032 = _2030 + _1954;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2034;
    bool _2038 = _742 == 0.0;
    bool _2040 = _2038 && _2024;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2044 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = float(uint(_2032));
    float _2048 = _2036 * _1976;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2054 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = in.m_85.x;
    float _2058 = in.m_85.y;
    float _2060 = in.m_85.z;
    float _2062 = as_type<float>(_1767) * _2046;
    float _2064 = _2052 * _2012;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_87.x = _2028;
    out.m_87.y = _2044;
    out.m_87.z = _2054;
    out.m_87.w = _2042;
    float _2070 = trunc(_2062);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    bool _2076 = _1974 > 0.5;
    bool _2078 = _2076 && _1731;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2080;
    float _2084 = in.m_79.x;
    float _2086 = -_128;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2008);
    float _2090 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1984);
    float _2092 = 1.0 / _2068;
    int _2094 = ~_1727;
    int _2096 = _2094 + 1;
    float _2098 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1962);
    float _2100 = float(uint(_1904));
    float _2102 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2104 = _364 + _2102;
    int _2106 = int(_2000) + int(_2074);
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2110 = _364 + _2108;
    int _2112 = ~_1727;
    int _2114 = _2112 + 1;
    float _2116 = _2058;
    float _2118 = _2056;
    float _2120 = _2060;
    if (!_2040)
    {
        float _2122 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2058);
        _2116 = _2122;
    }
    float _2124 = _2116;
    float _2126 = as_type<float>(_1767) * _2100;
    float _2128 = fma(_2064, _2104, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2130 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2132 = isnan(_364);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2138 = _2134 || _2136;
    float _2140 = float(_2138);
    if (!_2040)
    {
        float _2142 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2056);
        _2118 = _2142;
    }
    float _2144 = _2118;
    bool _2146 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2148 = isnan(_364);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = fma(_2048, _2110, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2160 = trunc(_2126);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    float _2166 = _2082 * _2092;
    float _2168 = -_2140;
    float _2170 = _2168 + 1.0;
    bool _2172 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2174 = isnan(_364);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = _2114 * _2106;
    int _2186 = _2184 + _1954;
    float _2188 = -_2156;
    float _2190 = _2188 + 1.0;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2194 = _364 + _2192;
    float _2196 = _2156 * _2170;
    float _2198 = _2182;
    float _2200 = _2084;
    if (!_2040)
    {
        float _2202 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2060);
        _2120 = _2202;
    }
    float _2204 = _2120;
    float _2206 = _2182 * _2190;
    bool _2208 = uint(_2186) >= uint(_1727);
    float _2210 = fma(_2166, _2194, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2212 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1802);
    bool _2214 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2216 = isnan(_364);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_2182;
    float _2228 = _2226 + 1.0;
    bool _2230 = !_2208;
    int _2232 = _2230 ? 0 : (-1);
    float _2234 = _2004 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    int _2238 = _2096 * int(_2164);
    int _2240 = _2238 + _1904;
    if (_1731)
    {
        _2198 = _2084;
    }
    float _2242 = _2198;
    float _2244 = _2224 * _2228;
    int _2246 = ~_2106;
    int _2248 = _2246 + _2232;
    int _2250 = _2248 + 1;
    float _2252 = -_2224;
    float _2254 = _2252 + 1.0;
    float _2256 = float(uint(_2240));
    float _2258 = _2242;
    if (_2078)
    {
        float _2260 = -_2242;
        float _2262 = _2260 + 1.0;
        _2258 = _2262;
    }
    float _2264 = _2258;
    float _2266 = _2004 * 6.283185482025146484375;
    float _2268 = cos(_2266);
    float _2270 = _2158 * _2244;
    int _2272 = _1727 * _2250;
    int _2274 = _2272 + _1954;
    float _2276 = as_type<float>(_1767) * _2256;
    if (_1731)
    {
        _2200 = _2264;
    }
    float _2278 = _2200;
    float _2280 = fma(_2254, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2270);
    float _2282 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2284 = !_1749;
    int _2286 = _2284 ? _2274 : (-1);
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    float _2294 = fma(_2128, _2206, _2280);
    float _2296 = _2236 * _2282;
    float _2298 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2300 = _2286 >> 31;
    float _2302 = _730 * _2124;
    int _2304 = _2286 & 3;
    bool _2306 = _2304 != 0;
    float _2308 = _728 * _2124;
    float _2310 = _2268 * _2282;
    int _2312 = _2300 & 3;
    float _2314 = -_2296;
    float _2316 = fma(_2268, _2298, _2314);
    float _2318 = fma(_2236, _2298, _2310);
    float _2320 = fma(_2210, _2196, _2294);
    int _2322 = _2286 + _2312;
    float _2324 = fma(_2098, _2316, _2088);
    int _2326 = int(_2164) + int(_2292);
    float _2328 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2320);
    int _2330 = _2322 >> 2;
    float _2332 = abs(_1240);
    float _2334 = log2(_2332);
    float _2336 = -_2090;
    float _2338 = fma(_2212, _2318, _2336);
    int _2340 = ~_1727;
    int _2342 = _2340 + 1;
    float _2344 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2346 = _2330 << 4;
    int _2348 = _2346 + 368;
    float _2350 = _2338 + 0.5;
    int _2352 = _2342 * _2326;
    int _2354 = _2352 + _1904;
    uint _2356 = uint(int(uint(_2348) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    int _2364 = int(_2356) + 1;
    uint _2366 = uint(int(uint(_2364) >> uint(2)));
    int _2368 = _2364 & 3;
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[int(_2366)][_2368];
    float _2372 = _726 * _2124;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2378 = uint(_2354) >= uint(_1727);
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2382 = _2286 & 3;
    bool _2384 = _2382 != 0;
    float _2386 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2388 = _2348 + 8;
    uint _2390 = uint(int(uint(_2388) >> uint(2)));
    uint _2392 = uint(int(uint(int(_2390)) >> uint(2)));
    int _2394 = int(_2390) & 3;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[int(_2392)][_2394];
    int _2398 = int(_2390) + 1;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    int _2402 = _2398 & 3;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[int(_2400)][_2402];
    float _2406 = _2324 + 0.5;
    bool _2408 = !_2378;
    int _2410 = _2408 ? 0 : (-1);
    float _2412 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2414 = uint(_2382) > 1u;
    float _2416 = exp2(_2386);
    int _2418 = ~_2326;
    int _2420 = _2418 + _2410;
    int _2422 = _2420 + 1;
    float _2424 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2426 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2428 = _2306 ? 0 : 1;
    int _2430 = _1727 * _2422;
    int _2432 = _2430 + _1904;
    out.m_89.x = _2406;
    out.m_89.y = _2350;
    bool _2434 = _2382 != 3;
    float _2436 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2438 = uint(_2382) >= 2u;
    out.m_91.x = _2412;
    out.m_91.y = _2424;
    out.m_91.z = _2426;
    out.m_91.w = _2344;
    bool _2440 = !_2384;
    int _2442 = _2440 ? 0 : 1;
    float _2444 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2436);
    bool _2446 = _2382 != 3;
    float _2448 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    bool _2452 = !_1749;
    int _2454 = _2452 ? _2432 : (-1);
    float _2456 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2444);
    int _2458 = ~_2428;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    float _2464 = fma(_792, _2144, _2302);
    int _2466 = _2462;
    if (!_2414)
    {
        int _2468 = ~_2428;
        int _2470 = _2468 + 1;
        _2466 = _2470;
    }
    int _2472 = _2466;
    float _2474 = fma(_794, _2144, _2308);
    bool _2476 = _1240 <= 8000.0;
    bool _2478 = isnan(_1240);
    bool _2480 = _2476 || _2478;
    bool _2482 = isnan(8000.0);
    bool _2484 = _2480 || _2482;
    float _2486 = float(_2484);
    float _2488 = fma(_788, _2144, _2372);
    int _2490 = abs(_2472);
    float _2492 = fma(_2450, -2.0, 3.0);
    float _2494 = _2450 * _2450;
    int _2496 = _2438 ? 0 : 1;
    float _2498 = fma(_458, _2204, _2464);
    float _2500 = fma(_470, _2204, _2474);
    float _2502 = _2494 * _2492;
    int _2504 = ~_2496;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = fma(_460, _2204, _2488);
    int _2512 = _2508;
    if (_2434)
    {
        int _2514 = ~_2496;
        int _2516 = _2514 + 1;
        _2512 = _2516;
    }
    int _2518 = _2512;
    float _2520 = -_2502;
    float _2522 = _2520 + 1.0;
    int _2524 = abs(_2442);
    float _2526 = -_1682;
    float _2528 = _2526 + 1.0;
    int _2530 = ~_2490;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    float _2536 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2502);
    int _2538 = abs(_2518);
    out.m_93.x = _2498;
    out.m_93.y = _2500;
    out.m_93.z = _2510;
    bool _2540 = !_2446;
    int _2542 = _2540 ? 0 : (-1);
    int _2544 = _2534 * as_type<int>(_2370);
    int _2546 = ~_2524;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    int _2552 = abs(_2542);
    int _2554 = ~_2538;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    int _2560 = _2550 * as_type<int>(_2362);
    int _2562 = _2560 + _2544;
    bool _2564 = !_1735;
    int _2566 = _2564 ? 0 : 1;
    float _2568 = _1608 * 0.5;
    int _2570 = ~_2552;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = _2558 * as_type<int>(_2396);
    int _2578 = _2576 + _2562;
    int _2580 = abs(_2566);
    float _2582 = fma(_1656, -0.5, _2568);
    float _2584 = in.m_67.x;
    int _2586 = _2574 * as_type<int>(_2404);
    int _2588 = _2586 + _2578;
    int _2590 = ~_2580;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    float _2596 = _2486 * _2536;
    int _2598 = _2588 * _2594;
    float _2600 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2602 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2456);
    float _2604 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2606 = _2454 * _2580;
    int _2608 = _2606 + _2598;
    float _2610 = _1636 + _1608;
    float _2612 = _2602 + _1608;
    float _2614 = exp2(_2600);
    float _2616 = _2528 * _2604;
    float _2618 = precise::clamp(_2616, 0.0, 1.0);
    float _2620 = _2610 * 0.5;
    float _2622 = _2612 * 0.5;
    bool _2624 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2626 = isnan(_1528);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2632 = _2628 || _2630;
    float _2634 = -_2618;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2638 = float(_2608);
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1656;
    out.gl_Position.z = _2602;
    out.gl_Position.w = _1608;
    float _2640 = _2636 * _2584;
    out.m_95.x = _2620;
    out.m_95.y = _2582;
    out.m_95.z = _2622;
    out.m_95.w = _1608;
    out.m_97.x = _2638;
    float _2642 = -_2614;
    float _2644 = _2642 + 1.0;
    float _2646 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2648 = _2638;
    if (!_2632)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2650 = _1932;
    float _2652 = _2650;
    float _2654 = _2650;
    if (!_2632)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2656 = _1934;
    float _2658 = _2646 * _1684;
    float _2660 = -_2646;
    float _2662 = _2660 + 1.0;
    float _2664 = _2656;
    float _2666 = _2656;
    if (!_2632)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2668 = _1936;
    float _2670 = _1699 * _2658;
    float _2672 = _1709 * _2658;
    float _2674 = _1699 * _2662;
    float _2676 = _2668;
    float _2678 = _2668;
    if (!_2632)
    {
        _2648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2680 = _2648;
    float _2682 = fma(_1705, _2670, _1693);
    float _2684 = fma(_1707, _2670, _1695);
    float _2686 = fma(_1699, _2672, _1697);
    float _2688 = _2640 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2690 = _1296 * _1358;
    out.m_99.x = _2682;
    out.m_99.y = _2684;
    out.m_99.z = _2686;
    out.m_99.w = _2674;
    float _2692 = _2690 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2694 = _2690;
    float _2696 = _2688;
    float _2698 = _2680;
    float _2700 = _2680;
    if (!_2632)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2702 = _2694;
    out.m_101.x = _2688;
    float _2704 = _2702;
    float _2706 = _2702;
    if (!_2632)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2708 = _2696;
    bool _2710 = !_2632;
    float _2712 = _2708;
    float _2714 = _2708;
    if (!_2710)
    {
        bool _2716 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2718 = isnan(_1528);
        bool _2720 = _2716 || _2718;
        bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2724 = _2720 || _2722;
        if (!_2724)
        {
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2728 = _1528 + _2726;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2732 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2730;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2738 = 1.0 / _2732;
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2756 = _2728 * _2738;
            float _2758 = precise::clamp(_2756, 0.0, 1.0);
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2764 = fma(_2758, _2736, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2766 = fma(_2758, _2762, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2768 = fma(_2758, _2742, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2770 = fma(_2758, _2746, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2772 = fma(_2758, _2750, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2774 = fma(_2758, _2754, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2666 = _2768;
            _2714 = _2772;
            _2654 = _2764;
            _2700 = _2770;
            _2678 = _2766;
            _2706 = _2774;
            _2776 = true;
        }
        else
        {
            bool _2778 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2780 = isnan(_1528);
            bool _2782 = _2778 || _2780;
            bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2786 = _2782 || _2784;
            if (!_2786)
            {
                _2652 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2788 = _2652;
            _2654 = _2788;
            if (!_2786)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2790 = _2664;
            _2666 = _2790;
            if (!_2786)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2792 = _2676;
            _2678 = _2792;
            if (!_2786)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2794 = _2698;
            _2700 = _2794;
            if (!_2786)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2796 = _2712;
            _2714 = _2796;
            if (!_2786)
            {
                _2704 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2798 = _2704;
            bool _2800 = !_2786;
            _2706 = _2798;
            if (!_2800)
            {
                bool _2802 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2804 = isnan(_1528);
                bool _2806 = _2802 || _2804;
                bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2810 = _2806 || _2808;
                if (!_2810)
                {
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2814 = _1528 + _2812;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2818 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2816;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2824 = 1.0 / _2818;
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2842 = _2814 * _2824;
                    float _2844 = precise::clamp(_2842, 0.0, 1.0);
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2850 = fma(_2844, _2822, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2852 = fma(_2844, _2848, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2854 = fma(_2844, _2828, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2856 = fma(_2844, _2832, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2858 = fma(_2844, _2836, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2860 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2666 = _2854;
                    _2714 = _2858;
                    _2654 = _2850;
                    _2700 = _2856;
                    _2678 = _2852;
                    _2706 = _2860;
                    _2776 = true;
                }
                else
                {
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2654 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2706 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2776 = false;
    float _2862 = _2666;
    float _2864 = _2714;
    float _2866 = _2654;
    float _2868 = _2700;
    float _2870 = _2678;
    float _2872 = _2706;
    float _2874 = _2692 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2876 = fma(_2500, -0.5, 0.5);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -_2862;
    float _2882 = _2880 + _2864;
    float _2884 = -_2866;
    float _2886 = _2884 + _2868;
    out.m_103.x = 0.0;
    float _2888 = fma(_2878, _2882, _2862);
    float _2890 = -_2870;
    float _2892 = _2890 + _2872;
    float _2894 = fma(_2878, _2886, _2866);
    float _2896 = _2888 * 0.586610972881317138671875;
    bool _2898 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2900 = fma(_2878, _2892, _2870);
    out.m_53.x = _2874;
    float _2902 = fma(_2894, 0.298911988735198974609375, _2896);
    bool _2904 = _1296 > 0.0;
    bool _2906 = isnan(_1296);
    bool _2908 = _2904 || _2906;
    bool _2910 = isnan(0.0);
    bool _2912 = _2908 || _2910;
    float _2914 = fma(_2900, 0.114477999508380889892578125, _2902);
    bool _2916 = _1358 <= 0.0;
    bool _2918 = !_2912;
    bool _2920 = _2916 || _2918;
    float _2922 = -_2914;
    float _2924 = _2894 + _2922;
    float _2926 = -_2914;
    float _2928 = _2888 + _2926;
    float _2930 = -_2914;
    float _2932 = _2900 + _2930;
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    float _2938 = fma(_2932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    bool _2940 = !_2898;
    if (!_2940)
    {
        float _2942 = -_1218;
        float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2946 = -_1220;
        float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2950 = -_1222;
        float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2954 = _2944 * _2944;
        float _2956 = fma(_2948, _2948, _2954);
        float _2958 = fma(_2952, _2952, _2956);
        float _2960 = sqrt(_2958);
        float _2962 = rsqrt(_2958);
        float _2964 = -_2960;
        float _2966 = _2964 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2968 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2970 = precise::clamp(_2968, 0.0, 1.0);
        float _2972 = _2948 * _2962;
        float _2974 = _2944 * _2962;
        float _2976 = abs(_2970);
        float _2978 = log2(_2976);
        float _2980 = _2952 * _2962;
        float _2982 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2984 = _2500 * _2974;
        float _2986 = -_2974;
        float _2988 = -_2982;
        float _2990 = fma(_2986, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2988);
        float _2992 = fma(_2498, _2972, _2984);
        float _2994 = -_2980;
        float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2990);
        float _2998 = fma(_2510, _2980, _2992);
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3004 = _2996 + _3002;
        float _3006 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3008 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3010 = precise::clamp(_3008, 0.0, 1.0);
        float _3012 = exp2(_3006);
        float _3014 = _3012 * _3010;
        float _3016 = _3000 * _3014;
        float _3018 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3020 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3022 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3018;
        out.m_103.y = _3020;
        out.m_103.z = _3022;
    }
    out.m_73.x = _2934;
    out.m_73.y = _2936;
    out.m_73.z = _2938;
    if (!_2920)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3024 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3024;
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
    bool _2776 = false;
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
        float _3092 = as_type<float>(_144);
        out.gl_Position.z = _3092;
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
        float _3147 = as_type<float>(_170);
        out.gl_Position.z = _3147;
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
    float _798 = fma(_782, _792, _790);
    float _800 = fma(_460, _784, _796);
    float _802 = fma(_458, _784, _798);
    float _804 = _410 + _800;
    float _806 = _408 + _802;
    float _808 = -_704;
    float _810 = _808 + _396;
    float _812 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _814 = _804 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _818 = _806 + _816;
    float _820 = _810 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _822 = _814 * _814;
    float _824 = fma(_818, _818, _822);
    float _826 = _780 * _728;
    float _828 = sqrt(_824);
    float _830 = fma(_782, _794, _826);
    float _832 = -_706;
    float _834 = _408 + _832;
    float _836 = fma(_470, _784, _830);
    float _838 = -_708;
    float _840 = _410 + _838;
    float _842 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].x, _820);
    float _844 = _396 + _836;
    float _846 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[11].z, _842);
    bool _848 = _828 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
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
    float _874 = _836;
    float _876 = _766;
    float _878 = _806;
    float _880 = _704;
    float _882 = _706;
    float _884 = _708;
    if (!_848)
    {
        _874 = _804;
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
        float _900 = _828 + _898;
        float _902 = rsqrt(_824);
        float _904 = _900 * _896;
        float _906 = _844 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = _904 * 0.15915493667125701904296875;
        float _910 = _908 * 6.283185482025146484375;
        float _912 = cos(_910);
        float _914 = _908 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 + (-1.0);
        float _920 = fma(_916, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _922 = _918 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _924 = _902 * _920;
        float _926 = fma(_844, _912, _922);
        float _928 = fma(_818, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_814, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _894 = _926;
        _878 = _928;
        _888 = _930;
    }
    float _932 = _894;
    float _934 = _878;
    float _936 = _888;
    float _938 = -_396;
    float _940 = _938 + _932;
    float _942 = -_408;
    float _944 = _942 + _934;
    float _946 = _846 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _948 = _810 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _950 = _940 * _940;
    float _952 = -_410;
    float _954 = _952 + _936;
    float _956 = 1.0 / _946;
    float _958 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].x, _948);
    float _960 = fma(_944, _944, _950);
    float _962 = -_706;
    float _964 = _962 + _934;
    float _966 = fma(_840, (*spvDescriptorSet0.vp_c8)._m0[10].z, _958);
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
    float _1102 = _1096;
    float _1104 = _1094;
    float _1106 = _1098;
    if (_1000)
    {
        _224 = 1.0;
    }
    float _1108 = _224;
    float _1110 = _1108;
    if (!_1014)
    {
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1114 = _810 + _1112;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1118 = _834 + _1116;
        float _1120 = -_834;
        float _1122 = _1120 + _1094;
        float _1124 = -_810;
        float _1126 = _1124 + _1096;
        float _1128 = _1114 * _1114;
        float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1132 = _840 + _1130;
        float _1134 = fma(_1118, _1118, _1128);
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1138 = fma(_1132, _1132, _1134);
        float _1140 = sqrt(_1138);
        float _1142 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _1144 = _1140 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _1146 = isnan(_1140);
        bool _1148 = _1144 || _1146;
        bool _1150 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _1152 = _1148 || _1150;
        float _1154 = precise::min(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1156 = _1154 * _1136;
        float _1158 = _1142 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1160 = _1158 * _1156;
        float _1162 = _218;
        float _1164 = _1136;
        float _1166 = _1158;
        _1018 = _1126;
        _884 = _1122;
        if (_1152)
        {
            float _1168 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _1162 = _1168;
        }
        float _1170 = _1162;
        if (_1152)
        {
            float _1172 = precise::max(_1140, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _1164 = _1172;
        }
        float _1174 = _1164;
        float _1176 = -_840;
        float _1178 = _1176 + _1098;
        float _1180 = fma(_1122, _1160, _834);
        float _1182 = fma(_1126, _1160, _810);
        float _1184 = fma(_1178, _1160, _840);
        float _1186 = _1182;
        float _1188 = _1180;
        _226 = _1170;
        if (_1152)
        {
            float _1190 = _1174 * _1170;
            _1100 = _1190;
        }
        float _1192 = _1100;
        float _1194 = _1192;
        if (_1152)
        {
            float _1196 = _1158 * _1192;
            _1166 = _1196;
        }
        float _1198 = _1166;
        if (!_1152)
        {
            _1194 = _1182;
        }
        float _1200 = _1194;
        float _1202 = _1200;
        if (!_1152)
        {
            _1186 = _1184;
        }
        float _1204 = _1186;
        _1106 = _1204;
        if (_1152)
        {
            float _1206 = fma(_1122, _1198, _834);
            _1188 = _1206;
        }
        float _1208 = _1188;
        _1104 = _1208;
        if (_1152)
        {
            float _1210 = fma(_1126, _1198, _810);
            _1202 = _1210;
        }
        float _1212 = _1202;
        _1102 = _1212;
        if (_1152)
        {
            float _1214 = fma(_1178, _1198, _840);
            _1106 = _1214;
        }
    }
    float _1216 = _1018;
    float _1218 = _1102;
    float _1220 = _1104;
    float _1222 = _1106;
    float _1224 = _884;
    float _1226 = _226;
    float _1228 = 0.0;
    float _1230 = _1216;
    float _1232 = _1226;
    float _1234 = _1224;
    if (_1000)
    {
        _1228 = 1.0;
    }
    float _1236 = _1228;
    float _1238 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1240 = _988 * _1238;
    float _1242 = _1236;
    if (!_1000)
    {
        float _1244 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1246 = _1244 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = cos(_1248);
        float _1252 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1254 = _1252 * 0.15915493667125701904296875;
        float _1256 = _1246 * 6.283185482025146484375;
        float _1258 = sin(_1256);
        float _1260 = 1.0 / _1250;
        float _1262 = _1254 * 6.283185482025146484375;
        float _1264 = cos(_1262);
        float _1266 = _1258 * _1260;
        float _1268 = _1254 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1264 * _1266;
        float _1274 = 1.0 / _1272;
        float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1278 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1276;
        float _1280 = 1.0 / _1278;
        float _1282 = _1270 * _1274;
        float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1286 = fma(_1240, _1282, _1284);
        float _1288 = _1286 * _1280;
        float _1290 = precise::clamp(_1288, 0.0, 1.0);
        _1230 = _1246;
        _1232 = _1254;
        _1110 = _1290;
    }
    float _1292 = _1230;
    float _1294 = _1232;
    float _1296 = _1110;
    float _1298 = _1292;
    float _1300 = _1294;
    if (!_1000)
    {
        float _1302 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1304 = _1302 * 0.15915493667125701904296875;
        float _1306 = _1304 * 6.283185482025146484375;
        float _1308 = cos(_1306);
        float _1310 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1312 = _1310 * 0.15915493667125701904296875;
        float _1314 = _1304 * 6.283185482025146484375;
        float _1316 = sin(_1314);
        float _1318 = 1.0 / _1308;
        float _1320 = _1312 * 6.283185482025146484375;
        float _1322 = cos(_1320);
        float _1324 = _1316 * _1318;
        float _1326 = _1312 * 6.283185482025146484375;
        float _1328 = sin(_1326);
        float _1330 = _1322 * _1324;
        float _1332 = 1.0 / _1330;
        float _1334 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1336 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1334;
        float _1338 = 1.0 / _1336;
        float _1340 = _1328 * _1332;
        float _1342 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1344 = fma(_1240, _1340, _1342);
        float _1346 = _1344 * _1338;
        float _1348 = precise::clamp(_1346, 0.0, 1.0);
        float _1350 = -_1348;
        float _1352 = _1350 + 1.0;
        _1298 = _1318;
        _1300 = _1330;
        _1242 = _1352;
    }
    float _1354 = _1298;
    float _1356 = _1300;
    float _1358 = _1242;
    float _1360 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1362 = _1218 + _1360;
    float _1364 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1366 = _1220 + _1364;
    float _1368 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1370 = _1222 + _1368;
    float _1372 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1374 = _1362 * _1362;
    float _1376 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1372);
    float _1378 = fma(_1366, _1366, _1374);
    float _1380 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1376);
    float _1382 = fma(_1370, _1370, _1378);
    float _1384 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1386 = rsqrt(_1382);
    float _1388 = _1386 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1390 = _1366 * _1388;
    float _1392 = _1370 * _1388;
    float _1394 = _1390 * _1390;
    float _1396 = _1392 * _1392;
    float _1398 = _1394 + _1396;
    float _1400 = sqrt(_1398);
    bool _1402 = _1400 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1406 = _1400 + _1404;
    float _1408 = _1386;
    float _1410 = _1356;
    float _1412 = _1406;
    float _1414 = _1354;
    float _1416 = _1394;
    if (_1402)
    {
        float _1418 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1418;
    }
    float _1420 = _1408;
    if (_1402)
    {
        float _1422 = rsqrt(_1398);
        _1410 = _1422;
    }
    float _1424 = _1410;
    float _1426 = _1424;
    if (_1402)
    {
        float _1428 = _1406 * _1420;
        _1412 = _1428;
    }
    float _1430 = _1412;
    if (_1402)
    {
        float _1432 = _1430 * 0.15915493667125701904296875;
        _1234 = _1432;
    }
    float _1434 = _1234;
    float _1436 = _1370;
    float _1438 = _1434;
    if (_1402)
    {
        float _1440 = _1434 * 6.283185482025146484375;
        float _1442 = sin(_1440);
        _1436 = _1442;
    }
    float _1444 = _1436;
    float _1446 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1448 = precise::max(0.0, _1446);
    float _1450 = _1420;
    if (_1402)
    {
        float _1452 = _1434 * 6.283185482025146484375;
        float _1454 = cos(_1452);
        _1450 = _1454;
    }
    float _1456 = _1450;
    float _1458 = -_1388;
    float _1460 = -_1448;
    float _1462 = fma(_1362, _1458, _1460);
    float _1464 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1402)
    {
        float _1466 = _1462 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1414 = _1466;
    }
    float _1468 = _1414;
    float _1470 = _1468;
    if (!_1402)
    {
        _1438 = _1392;
    }
    float _1472 = _1438;
    float _1474 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1476 = _1472;
    if (_1402)
    {
        float _1478 = fma(_1444, _1468, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1470 = _1478;
    }
    float _1480 = _1470;
    float _1482 = floor(_1474);
    float _1484 = _1480;
    float _1486 = _1456;
    if (_1402)
    {
        float _1488 = _1456 + (-1.0);
        _1464 = _1488;
    }
    float _1490 = _1464;
    float _1492 = _1490;
    if (_1402)
    {
        float _1494 = _1424 * _1480;
        _1020 = _1494;
    }
    float _1496 = _1020;
    if (!_1402)
    {
        _1426 = _1390;
    }
    float _1498 = _1426;
    float _1500 = _1498;
    if (_1402)
    {
        float _1502 = _1490 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1492 = _1502;
    }
    float _1504 = _1492;
    if (_1402)
    {
        float _1506 = _1390 * _1496;
        _1500 = _1506;
    }
    float _1508 = _1500;
    if (!_1402)
    {
        _1484 = _1462;
    }
    float _1510 = _1484;
    float _1512 = _1510;
    if (_1402)
    {
        float _1514 = _1392 * _1496;
        _1476 = _1514;
    }
    float _1516 = _1476;
    if (_1402)
    {
        float _1518 = fma(_1462, _1456, _1504);
        _1512 = _1518;
    }
    float _1520 = _1512;
    if (_1402)
    {
        float _1522 = _1508 * _1508;
        _1416 = _1522;
    }
    float _1524 = _1416;
    if (!_1402)
    {
        _1486 = _1396;
    }
    float _1526 = _1486;
    float _1528 = sqrt(_1382);
    float _1530 = _1526;
    if (_1402)
    {
        float _1532 = _1516 * _1516;
        _1530 = _1532;
    }
    float _1534 = _1530;
    float _1536 = fma(_1520, _1520, _1524);
    float _1538 = fma(_840, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1540 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1542 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1544 = _1536 + _1534;
    float _1546 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1540);
    float _1548 = _1218 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1550 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1542);
    float _1552 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1546);
    float _1554 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1548);
    float _1556 = rsqrt(_1544);
    float _1558 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1550);
    float _1560 = _1552 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1562 = fma(_1222, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1554);
    float _1564 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1566 = fma(_1528, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1564);
    float _1568 = precise::clamp(_1566, 0.0, 1.0);
    float _1570 = _1558 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1572 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1574 = _1562 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1576 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1578 = -_1568;
    float _1580 = _1578 + 1.0;
    float _1582 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1584 = floor(_1538);
    float _1586 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1576);
    float _1588 = -_1482;
    float _1590 = _1474 + _1588;
    float _1592 = -_1582;
    float _1594 = fma(_1592, _1572, 1.0);
    float _1596 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1598 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1586);
    float _1600 = _1556 * _1508;
    float _1602 = _1556 * _1516;
    float _1604 = abs(_1580);
    float _1606 = log2(_1604);
    float _1608 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1598);
    float _1610 = _1556 * _1520;
    float _1612 = _1600 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1614 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1596);
    float _1616 = -_1612;
    float _1618 = fma(_1610, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1616);
    float _1620 = 1.0 / _1608;
    float _1622 = -_1584;
    float _1624 = _1538 + _1622;
    float _1626 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1614);
    float _1628 = -_1602;
    float _1630 = fma(_1628, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1618);
    float _1632 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1634 = _1610 + 1.0;
    float _1636 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1626);
    float _1638 = fma(_1630, -0.5, 0.5);
    float _1640 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1642 = log2(_1594);
    float _1644 = fma(_1630, 0.5, 0.5);
    float _1646 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1632);
    float _1648 = fma(_1644, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1650 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1646);
    float _1652 = exp2(_1640);
    float _1654 = fma(_1644, _1648, -0.212114393711090087890625);
    float _1656 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1650);
    float _1658 = _1636 * _1620;
    float _1660 = fma(_1644, _1654, 1.570728778839111328125);
    float _1662 = sqrt(_1638);
    float _1664 = _1642 * 0.693147182464599609375;
    float _1666 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1668 = -_1610;
    float _1670 = fma(_1652, _1634, _1668);
    float _1672 = _1656 * _1620;
    float _1674 = fma(_1658, 0.5, 0.5);
    float _1676 = fma(_1670, 0.5, 0.5);
    float _1678 = fma(_1672, -0.5, 0.5);
    float _1680 = _1662 * 0.636619746685028076171875;
    float2 _5522 = float2(_1590, _1624);
    float _1682 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5522, float2(0.0), isnan(_5522)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5522, float2(0.0), isnan(_5522)), level(0.0)).x;
    float3 _5533 = float3(_1674, _1678, _1666);
    float _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5533, float3(0.0), isnan(_5533)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5533, float3(0.0), isnan(_5533)), level(0.0)).x;
    float _1686 = -_1660;
    float _1688 = fma(_1680, _1686, 1.0);
    float3 _5549 = float3(_1674, _1678, _1666);
    float4 _1691 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5549, float3(0.0), isnan(_5549)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5549, float3(0.0), isnan(_5549)), level(0.0)).xyzw;
    float _1693 = _1691.x;
    float _1695 = _1691.y;
    float _1697 = _1691.z;
    float _1699 = _1691.w;
    float2 _5565 = float2(_1688, _1676);
    float3 _1703 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5565, float2(0.0), isnan(_5565)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5565, float2(0.0), isnan(_5565)), level(0.0)).xyz;
    float _1705 = _1703.x;
    float _1707 = _1703.y;
    float _1709 = _1703.z;
    float _1711 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1713 = int(_1711);
    out.m_71.x = _834;
    out.m_71.y = _810;
    out.m_71.z = _840;
    int _1715 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1717 = _1715 != 0;
    int _1719 = abs(_868);
    out.m_73.w = _696;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1723 = _1721 != 0;
    float _1725 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1727 = int(_1725);
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1731 = _1729 != 0;
    out.m_75.x = _776;
    int _1733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1735 = _1733 != 0;
    out.m_77.x = _1220;
    out.m_77.y = _1218;
    out.m_77.z = _1222;
    float _1737 = float(_1713);
    float _1739 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1741 = 1.0 / _1737;
    float _1743 = float(uint(_1727));
    int _1745 = ~_1727;
    int _1747 = _1745 + 1;
    bool _1749 = _1727 == 0;
    float _1751 = 1.0 / _1743;
    float _1753 = _128 * _1741;
    int _1755 = ~_1727;
    int _1757 = _1755 + 1;
    float _1759 = trunc(_1753);
    int _1761 = int(_1759);
    int _1763 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1765 = _1763 != 0;
    int _1767 = as_type<int>(_1751) + (-2);
    float _1769 = float(uint(_1761));
    float _1771 = as_type<float>(_1767) * _1769;
    float _1773 = in.m_63.x;
    float _1775 = in.m_63.y;
    float _1777 = in.m_63.z;
    float _1779 = trunc(_1771);
    float _1781 = precise::max(_1779, 0.0);
    uint _1784 = uint(_1781);
    bool _1786 = !_1765;
    float _1788 = _1786 ? 7.345489978790283203125 : 1.0;
    float _1790 = float(_1761);
    int _1792 = _1757 * int(_1784);
    int _1794 = _1792 + _1761;
    float _1796 = float(uint(_1794));
    float _1798 = _1788 * _1773;
    float _1800 = _1775 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1802 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1739);
    float _1804 = as_type<float>(_1767) * _1796;
    float _1806 = floor(_1798);
    float _1808 = trunc(_1804);
    float _1810 = precise::max(_1808, 0.0);
    uint _1812 = uint(_1810);
    int _1814 = int(_1784) + int(_1812);
    float _1816 = -_1806;
    float _1818 = _1798 + _1816;
    float _1820 = float(_1727);
    float _1822 = in.m_79.y;
    int _1824 = _1747 * _1814;
    int _1826 = _1824 + _1761;
    bool _1828 = _1790 >= _1820;
    bool _1830 = isnan(_1790);
    bool _1832 = _1828 || _1830;
    bool _1834 = isnan(_1820);
    bool _1836 = _1832 || _1834;
    float _1838 = float(_1836);
    float _1840 = _128 * _1820;
    float _1842 = _1818 * _1820;
    bool _1844 = uint(_1826) >= uint(_1727);
    float _1846 = _1840 * _178;
    float _1848 = trunc(_1838);
    int _1850 = int(_1848);
    float _1852 = in.m_81.w;
    bool _1854 = !_1844;
    int _1856 = _1854 ? 0 : (-1);
    int _1858 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1860 = _1858 != 0;
    int _1862 = ~_1814;
    int _1864 = _1862 + _1856;
    int _1866 = _1864 + 1;
    float _1868 = trunc(_1842);
    int _1870 = int(_1868);
    bool _1872 = !_1860;
    int _1874 = _1872 ? 0 : 1;
    int _1876 = _1727 * _1866;
    int _1878 = _1876 + _1761;
    int _1880 = abs(_864);
    int _1882 = abs(_1874);
    int _1884 = ~_1850;
    int _1886 = _1884 + 1;
    int _1888 = _1886 + 1;
    float _1890 = trunc(_1846);
    int _1892 = int(_1890);
    bool _1894 = !_1749;
    int _1896 = _1894 ? _1878 : (-1);
    int _1898 = _1896 * _1888;
    int _1900 = _1727 + (-1);
    int _1902 = _1870 * _1882;
    int _1904 = _1902 + _1761;
    int _1906 = abs(_872);
    out.m_83.w = _1852;
    int _1908 = _1850 * _1900;
    int _1910 = _1908 + _1898;
    bool _1912 = _1775 > 0.5;
    int _1914 = _1910 * _1880;
    float _1916 = -_1822;
    float _1918 = _1916 + 1.0;
    int _1920 = _1892 * _1719;
    int _1922 = _1920 + _1914;
    bool _1924 = !_1717;
    int _1926 = _1924 ? 0 : 1;
    float _1928 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _1930 = _1822;
    float _1932 = _1608;
    float _1934 = _1636;
    float _1936 = _1656;
    if (_1723)
    {
        float _1938 = _1912 ? _1918 : _1822;
        _1930 = _1938;
    }
    float _1940 = _1930;
    int _1942 = _1904 * _1906;
    int _1944 = _1942 + _1922;
    int _1946 = abs(_1926);
    float _1948 = fma(_1777, (*spvDescriptorSet0.vp_c9)._m0[79].z, _1928);
    float _1950 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1952 = _1870 * _1946;
    int _1954 = _1952 + _1944;
    float _1956 = _1773 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1962 = fma(_1773, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1950);
    float _1964 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1966 = _1964 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1968 = float(uint(_1954));
    float _1970 = as_type<float>(_1870);
    if (_1731)
    {
        float _1972 = in.m_63.x;
        _1970 = _1972;
    }
    float _1974 = _1970;
    float _1976 = 1.0 / _1960;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1980 = as_type<float>(_1767) * _1968;
    float _1982 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[79].x, _1948);
    float _1984 = fma(_1800, -2.0, _1978);
    bool _1986 = _740 != 0.0;
    bool _1988 = isnan(_740);
    bool _1990 = _1986 || _1988;
    bool _1992 = isnan(0.0);
    bool _1994 = _1990 || _1992;
    float _1996 = trunc(_1980);
    float _1998 = precise::max(_1996, 0.0);
    uint _2000 = uint(_1998);
    float _2002 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2004 = _1982 * (-0.15915493667125701904296875);
    float _2006 = -_2002;
    float _2008 = fma(_1956, 2.0, _2006);
    float _2010 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2012 = 1.0 / _1966;
    int _2014 = ~_1727;
    int _2016 = _2014 + 1;
    float _2018 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _2020 = _738 == 0.0;
    bool _2022 = !_1994;
    bool _2024 = _2020 && _2022;
    float _2026 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2028 = _2010 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2030 = _2016 * int(_2000);
    int _2032 = _2030 + _1954;
    float _2034 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _2034;
    bool _2038 = _742 == 0.0;
    bool _2040 = _2038 && _2024;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2044 = _2026 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2046 = float(uint(_2032));
    float _2048 = _2036 * _1976;
    float _2050 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _2052 = _2050 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2054 = _2018 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2056 = in.m_85.x;
    float _2058 = in.m_85.y;
    float _2060 = in.m_85.z;
    float _2062 = as_type<float>(_1767) * _2046;
    float _2064 = _2052 * _2012;
    float _2066 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2068 = _2066 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    out.m_87.x = _2028;
    out.m_87.y = _2044;
    out.m_87.z = _2054;
    out.m_87.w = _2042;
    float _2070 = trunc(_2062);
    float _2072 = precise::max(_2070, 0.0);
    uint _2074 = uint(_2072);
    bool _2076 = _1974 > 0.5;
    bool _2078 = _2076 && _1731;
    float _2080 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _2080;
    float _2084 = in.m_79.x;
    float _2086 = -_128;
    float _2088 = fma(_2086, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2008);
    float _2090 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1984);
    float _2092 = 1.0 / _2068;
    int _2094 = ~_1727;
    int _2096 = _2094 + 1;
    float _2098 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1962);
    float _2100 = float(uint(_1904));
    float _2102 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _2104 = _364 + _2102;
    int _2106 = int(_2000) + int(_2074);
    float _2108 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _2110 = _364 + _2108;
    int _2112 = ~_1727;
    int _2114 = _2112 + 1;
    float _2116 = _2058;
    float _2118 = _2056;
    float _2120 = _2060;
    if (!_2040)
    {
        float _2122 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2058);
        _2116 = _2122;
    }
    float _2124 = _2116;
    float _2126 = as_type<float>(_1767) * _2100;
    float _2128 = fma(_2064, _2104, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    bool _2130 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _2132 = isnan(_364);
    bool _2134 = _2130 || _2132;
    bool _2136 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _2138 = _2134 || _2136;
    float _2140 = float(_2138);
    if (!_2040)
    {
        float _2142 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2056);
        _2118 = _2142;
    }
    float _2144 = _2118;
    bool _2146 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _2148 = isnan(_364);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = fma(_2048, _2110, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _2160 = trunc(_2126);
    float _2162 = precise::max(_2160, 0.0);
    uint _2164 = uint(_2162);
    float _2166 = _2082 * _2092;
    float _2168 = -_2140;
    float _2170 = _2168 + 1.0;
    bool _2172 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _2174 = isnan(_364);
    bool _2176 = _2172 || _2174;
    bool _2178 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _2180 = _2176 || _2178;
    float _2182 = float(_2180);
    int _2184 = _2114 * _2106;
    int _2186 = _2184 + _1954;
    float _2188 = -_2156;
    float _2190 = _2188 + 1.0;
    float _2192 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _2194 = _364 + _2192;
    float _2196 = _2156 * _2170;
    float _2198 = _2182;
    float _2200 = _2084;
    if (!_2040)
    {
        float _2202 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2060);
        _2120 = _2202;
    }
    float _2204 = _2120;
    float _2206 = _2182 * _2190;
    bool _2208 = uint(_2186) >= uint(_1727);
    float _2210 = fma(_2166, _2194, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _2212 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1802);
    bool _2214 = _364 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _2216 = isnan(_364);
    bool _2218 = _2214 || _2216;
    bool _2220 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _2222 = _2218 || _2220;
    float _2224 = float(_2222);
    float _2226 = -_2182;
    float _2228 = _2226 + 1.0;
    bool _2230 = !_2208;
    int _2232 = _2230 ? 0 : (-1);
    float _2234 = _2004 * 6.283185482025146484375;
    float _2236 = sin(_2234);
    int _2238 = _2096 * int(_2164);
    int _2240 = _2238 + _1904;
    if (_1731)
    {
        _2198 = _2084;
    }
    float _2242 = _2198;
    float _2244 = _2224 * _2228;
    int _2246 = ~_2106;
    int _2248 = _2246 + _2232;
    int _2250 = _2248 + 1;
    float _2252 = -_2224;
    float _2254 = _2252 + 1.0;
    float _2256 = float(uint(_2240));
    float _2258 = _2242;
    if (_2078)
    {
        float _2260 = -_2242;
        float _2262 = _2260 + 1.0;
        _2258 = _2262;
    }
    float _2264 = _2258;
    float _2266 = _2004 * 6.283185482025146484375;
    float _2268 = cos(_2266);
    float _2270 = _2158 * _2244;
    int _2272 = _1727 * _2250;
    int _2274 = _2272 + _1954;
    float _2276 = as_type<float>(_1767) * _2256;
    if (_1731)
    {
        _2200 = _2264;
    }
    float _2278 = _2200;
    float _2280 = fma(_2254, (*spvDescriptorSet0.vp_c9)._m0[115].x, _2270);
    float _2282 = fma(_1940, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2284 = !_1749;
    int _2286 = _2284 ? _2274 : (-1);
    float _2288 = trunc(_2276);
    float _2290 = precise::max(_2288, 0.0);
    uint _2292 = uint(_2290);
    float _2294 = fma(_2128, _2206, _2280);
    float _2296 = _2236 * _2282;
    float _2298 = fma(_2278, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2300 = _2286 >> 31;
    float _2302 = _730 * _2124;
    int _2304 = _2286 & 3;
    bool _2306 = _2304 != 0;
    float _2308 = _728 * _2124;
    float _2310 = _2268 * _2282;
    int _2312 = _2300 & 3;
    float _2314 = -_2296;
    float _2316 = fma(_2268, _2298, _2314);
    float _2318 = fma(_2236, _2298, _2310);
    float _2320 = fma(_2210, _2196, _2294);
    int _2322 = _2286 + _2312;
    float _2324 = fma(_2098, _2316, _2088);
    int _2326 = int(_2164) + int(_2292);
    float _2328 = fma(_2140, (*spvDescriptorSet0.vp_c9)._m0[118].x, _2320);
    int _2330 = _2322 >> 2;
    float _2332 = abs(_1240);
    float _2334 = log2(_2332);
    float _2336 = -_2090;
    float _2338 = fma(_2212, _2318, _2336);
    int _2340 = ~_1727;
    int _2342 = _2340 + 1;
    float _2344 = _2328 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2346 = _2330 << 4;
    int _2348 = _2346 + 368;
    float _2350 = _2338 + 0.5;
    int _2352 = _2342 * _2326;
    int _2354 = _2352 + _1904;
    uint _2356 = uint(int(uint(_2348) >> uint(2)));
    uint _2358 = uint(int(uint(int(_2356)) >> uint(2)));
    int _2360 = int(_2356) & 3;
    float _2362 = (*spvDescriptorSet0.vp_c9)._m0[int(_2358)][_2360];
    int _2364 = int(_2356) + 1;
    uint _2366 = uint(int(uint(_2364) >> uint(2)));
    int _2368 = _2364 & 3;
    float _2370 = (*spvDescriptorSet0.vp_c9)._m0[int(_2366)][_2368];
    float _2372 = _726 * _2124;
    float _2374 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _2376 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _2378 = uint(_2354) >= uint(_1727);
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _2382 = _2286 & 3;
    bool _2384 = _2382 != 0;
    float _2386 = _2334 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2388 = _2348 + 8;
    uint _2390 = uint(int(uint(_2388) >> uint(2)));
    uint _2392 = uint(int(uint(int(_2390)) >> uint(2)));
    int _2394 = int(_2390) & 3;
    float _2396 = (*spvDescriptorSet0.vp_c9)._m0[int(_2392)][_2394];
    int _2398 = int(_2390) + 1;
    uint _2400 = uint(int(uint(_2398) >> uint(2)));
    int _2402 = _2398 & 3;
    float _2404 = (*spvDescriptorSet0.vp_c9)._m0[int(_2400)][_2402];
    float _2406 = _2324 + 0.5;
    bool _2408 = !_2378;
    int _2410 = _2408 ? 0 : (-1);
    float _2412 = _2374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2414 = uint(_2382) > 1u;
    float _2416 = exp2(_2386);
    int _2418 = ~_2326;
    int _2420 = _2418 + _2410;
    int _2422 = _2420 + 1;
    float _2424 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2426 = _2380 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2428 = _2306 ? 0 : 1;
    int _2430 = _1727 * _2422;
    int _2432 = _2430 + _1904;
    out.m_89.x = _2406;
    out.m_89.y = _2350;
    bool _2434 = _2382 != 3;
    float _2436 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2438 = uint(_2382) >= 2u;
    out.m_91.x = _2412;
    out.m_91.y = _2424;
    out.m_91.z = _2426;
    out.m_91.w = _2344;
    bool _2440 = !_2384;
    int _2442 = _2440 ? 0 : 1;
    float _2444 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2436);
    bool _2446 = _2382 != 3;
    float _2448 = fma(_2416, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2450 = precise::clamp(_2448, 0.0, 1.0);
    bool _2452 = !_1749;
    int _2454 = _2452 ? _2432 : (-1);
    float _2456 = fma(_1570, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2444);
    int _2458 = ~_2428;
    int _2460 = _2458 + 1;
    int _2462 = _2460 + 1;
    float _2464 = fma(_792, _2144, _2302);
    int _2466 = _2462;
    if (!_2414)
    {
        int _2468 = ~_2428;
        int _2470 = _2468 + 1;
        _2466 = _2470;
    }
    int _2472 = _2466;
    float _2474 = fma(_794, _2144, _2308);
    bool _2476 = _1240 <= 8000.0;
    bool _2478 = isnan(_1240);
    bool _2480 = _2476 || _2478;
    bool _2482 = isnan(8000.0);
    bool _2484 = _2480 || _2482;
    float _2486 = float(_2484);
    float _2488 = fma(_788, _2144, _2372);
    int _2490 = abs(_2472);
    float _2492 = fma(_2450, -2.0, 3.0);
    float _2494 = _2450 * _2450;
    int _2496 = _2438 ? 0 : 1;
    float _2498 = fma(_458, _2204, _2464);
    float _2500 = fma(_470, _2204, _2474);
    float _2502 = _2494 * _2492;
    int _2504 = ~_2496;
    int _2506 = _2504 + 1;
    int _2508 = _2506 + 1;
    float _2510 = fma(_460, _2204, _2488);
    int _2512 = _2508;
    if (_2434)
    {
        int _2514 = ~_2496;
        int _2516 = _2514 + 1;
        _2512 = _2516;
    }
    int _2518 = _2512;
    float _2520 = -_2502;
    float _2522 = _2520 + 1.0;
    int _2524 = abs(_2442);
    float _2526 = -_1682;
    float _2528 = _2526 + 1.0;
    int _2530 = ~_2490;
    int _2532 = _2530 + 1;
    int _2534 = _2532 + 1;
    float _2536 = fma(_2522, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2502);
    int _2538 = abs(_2518);
    out.m_93.x = _2498;
    out.m_93.y = _2500;
    out.m_93.z = _2510;
    bool _2540 = !_2446;
    int _2542 = _2540 ? 0 : (-1);
    int _2544 = _2534 * as_type<int>(_2370);
    int _2546 = ~_2524;
    int _2548 = _2546 + 1;
    int _2550 = _2548 + 1;
    int _2552 = abs(_2542);
    int _2554 = ~_2538;
    int _2556 = _2554 + 1;
    int _2558 = _2556 + 1;
    int _2560 = _2550 * as_type<int>(_2362);
    int _2562 = _2560 + _2544;
    bool _2564 = !_1735;
    int _2566 = _2564 ? 0 : 1;
    float _2568 = _1608 * 0.5;
    int _2570 = ~_2552;
    int _2572 = _2570 + 1;
    int _2574 = _2572 + 1;
    int _2576 = _2558 * as_type<int>(_2396);
    int _2578 = _2576 + _2562;
    int _2580 = abs(_2566);
    float _2582 = fma(_1656, -0.5, _2568);
    float _2584 = in.m_67.x;
    int _2586 = _2574 * as_type<int>(_2404);
    int _2588 = _2586 + _2578;
    int _2590 = ~_2580;
    int _2592 = _2590 + 1;
    int _2594 = _2592 + 1;
    float _2596 = _2486 * _2536;
    int _2598 = _2588 * _2594;
    float _2600 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2602 = fma(_1384, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2456);
    float _2604 = _2596 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    int _2606 = _2454 * _2580;
    int _2608 = _2606 + _2598;
    float _2610 = _1636 + _1608;
    float _2612 = _2602 + _1608;
    float _2614 = exp2(_2600);
    float _2616 = _2528 * _2604;
    float _2618 = precise::clamp(_2616, 0.0, 1.0);
    float _2620 = _2610 * 0.5;
    float _2622 = _2612 * 0.5;
    bool _2624 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2626 = isnan(_1528);
    bool _2628 = _2624 || _2626;
    bool _2630 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2632 = _2628 || _2630;
    float _2634 = -_2618;
    float _2636 = fma(_2634, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2638 = float(_2608);
    out.gl_Position.x = _1636;
    out.gl_Position.y = _1656;
    out.gl_Position.z = _2602;
    out.gl_Position.w = _1608;
    float _2640 = _2636 * _2584;
    out.m_95.x = _2620;
    out.m_95.y = _2582;
    out.m_95.z = _2622;
    out.m_95.w = _1608;
    out.m_97.x = _2638;
    float _2642 = -_2614;
    float _2644 = _2642 + 1.0;
    float _2646 = _2644 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2648 = _2638;
    if (!_2632)
    {
        _1932 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2650 = _1932;
    float _2652 = _2650;
    float _2654 = _2650;
    if (!_2632)
    {
        _1934 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2656 = _1934;
    float _2658 = _2646 * _1684;
    float _2660 = -_2646;
    float _2662 = _2660 + 1.0;
    float _2664 = _2656;
    float _2666 = _2656;
    if (!_2632)
    {
        _1936 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2668 = _1936;
    float _2670 = _1699 * _2658;
    float _2672 = _1709 * _2658;
    float _2674 = _1699 * _2662;
    float _2676 = _2668;
    float _2678 = _2668;
    if (!_2632)
    {
        _2648 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2680 = _2648;
    float _2682 = fma(_1705, _2670, _1693);
    float _2684 = fma(_1707, _2670, _1695);
    float _2686 = fma(_1699, _2672, _1697);
    float _2688 = _2640 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2690 = _1296 * _1358;
    out.m_99.x = _2682;
    out.m_99.y = _2684;
    out.m_99.z = _2686;
    out.m_99.w = _2674;
    float _2692 = _2690 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2694 = _2690;
    float _2696 = _2688;
    float _2698 = _2680;
    float _2700 = _2680;
    if (!_2632)
    {
        _2694 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2702 = _2694;
    out.m_101.x = _2688;
    float _2704 = _2702;
    float _2706 = _2702;
    if (!_2632)
    {
        _2696 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2708 = _2696;
    bool _2710 = !_2632;
    float _2712 = _2708;
    float _2714 = _2708;
    if (!_2710)
    {
        bool _2716 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2718 = isnan(_1528);
        bool _2720 = _2716 || _2718;
        bool _2722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2724 = _2720 || _2722;
        if (!_2724)
        {
            float _2726 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2728 = _1528 + _2726;
            float _2730 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2732 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2730;
            float _2734 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2736 = _2734 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2738 = 1.0 / _2732;
            float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2742 = _2740 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2744 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2746 = _2744 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2748 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2750 = _2748 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2752 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2754 = _2752 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2756 = _2728 * _2738;
            float _2758 = precise::clamp(_2756, 0.0, 1.0);
            float _2760 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2762 = _2760 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2764 = fma(_2758, _2736, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2766 = fma(_2758, _2762, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2768 = fma(_2758, _2742, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2770 = fma(_2758, _2746, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2772 = fma(_2758, _2750, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2774 = fma(_2758, _2754, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2666 = _2768;
            _2714 = _2772;
            _2654 = _2764;
            _2700 = _2770;
            _2678 = _2766;
            _2706 = _2774;
            _2776 = true;
        }
        else
        {
            bool _2778 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2780 = isnan(_1528);
            bool _2782 = _2778 || _2780;
            bool _2784 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2786 = _2782 || _2784;
            if (!_2786)
            {
                _2652 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2788 = _2652;
            _2654 = _2788;
            if (!_2786)
            {
                _2664 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2790 = _2664;
            _2666 = _2790;
            if (!_2786)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2792 = _2676;
            _2678 = _2792;
            if (!_2786)
            {
                _2698 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2794 = _2698;
            _2700 = _2794;
            if (!_2786)
            {
                _2712 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2796 = _2712;
            _2714 = _2796;
            if (!_2786)
            {
                _2704 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2798 = _2704;
            bool _2800 = !_2786;
            _2706 = _2798;
            if (!_2800)
            {
                bool _2802 = _1528 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2804 = isnan(_1528);
                bool _2806 = _2802 || _2804;
                bool _2808 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2810 = _2806 || _2808;
                if (!_2810)
                {
                    float _2812 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2814 = _1528 + _2812;
                    float _2816 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2818 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2816;
                    float _2820 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2822 = _2820 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2824 = 1.0 / _2818;
                    float _2826 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2828 = _2826 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2830 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2832 = _2830 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2836 = _2834 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2838 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2840 = _2838 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2842 = _2814 * _2824;
                    float _2844 = precise::clamp(_2842, 0.0, 1.0);
                    float _2846 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2848 = _2846 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2850 = fma(_2844, _2822, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2852 = fma(_2844, _2848, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2854 = fma(_2844, _2828, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2856 = fma(_2844, _2832, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2858 = fma(_2844, _2836, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2860 = fma(_2844, _2840, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2666 = _2854;
                    _2714 = _2858;
                    _2654 = _2850;
                    _2700 = _2856;
                    _2678 = _2852;
                    _2706 = _2860;
                    _2776 = true;
                }
                else
                {
                    _2666 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2714 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2654 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2700 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2706 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2776 = false;
    float _2862 = _2666;
    float _2864 = _2714;
    float _2866 = _2654;
    float _2868 = _2700;
    float _2870 = _2678;
    float _2872 = _2706;
    float _2874 = _2692 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2876 = fma(_2500, -0.5, 0.5);
    float _2878 = precise::clamp(_2876, 0.0, 1.0);
    float _2880 = -_2862;
    float _2882 = _2880 + _2864;
    float _2884 = -_2866;
    float _2886 = _2884 + _2868;
    out.m_103.x = 0.0;
    float _2888 = fma(_2878, _2882, _2862);
    float _2890 = -_2870;
    float _2892 = _2890 + _2872;
    float _2894 = fma(_2878, _2886, _2866);
    float _2896 = _2888 * 0.586610972881317138671875;
    bool _2898 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2900 = fma(_2878, _2892, _2870);
    out.m_53.x = _2874;
    float _2902 = fma(_2894, 0.298911988735198974609375, _2896);
    bool _2904 = _1296 > 0.0;
    bool _2906 = isnan(_1296);
    bool _2908 = _2904 || _2906;
    bool _2910 = isnan(0.0);
    bool _2912 = _2908 || _2910;
    float _2914 = fma(_2900, 0.114477999508380889892578125, _2902);
    bool _2916 = _1358 <= 0.0;
    bool _2918 = !_2912;
    bool _2920 = _2916 || _2918;
    float _2922 = -_2914;
    float _2924 = _2894 + _2922;
    float _2926 = -_2914;
    float _2928 = _2888 + _2926;
    float _2930 = -_2914;
    float _2932 = _2900 + _2930;
    float _2934 = fma(_2924, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    float _2936 = fma(_2928, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    float _2938 = fma(_2932, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2914);
    bool _2940 = !_2898;
    if (!_2940)
    {
        float _2942 = -_1218;
        float _2944 = _2942 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2946 = -_1220;
        float _2948 = _2946 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2950 = -_1222;
        float _2952 = _2950 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2954 = _2944 * _2944;
        float _2956 = fma(_2948, _2948, _2954);
        float _2958 = fma(_2952, _2952, _2956);
        float _2960 = sqrt(_2958);
        float _2962 = rsqrt(_2958);
        float _2964 = -_2960;
        float _2966 = _2964 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2968 = _2966 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2970 = precise::clamp(_2968, 0.0, 1.0);
        float _2972 = _2948 * _2962;
        float _2974 = _2944 * _2962;
        float _2976 = abs(_2970);
        float _2978 = log2(_2976);
        float _2980 = _2952 * _2962;
        float _2982 = _2972 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2984 = _2500 * _2974;
        float _2986 = -_2974;
        float _2988 = -_2982;
        float _2990 = fma(_2986, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2988);
        float _2992 = fma(_2498, _2972, _2984);
        float _2994 = -_2980;
        float _2996 = fma(_2994, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2990);
        float _2998 = fma(_2510, _2980, _2992);
        float _3000 = precise::clamp(_2998, 0.0, 1.0);
        float _3002 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3004 = _2996 + _3002;
        float _3006 = _2978 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3008 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3010 = precise::clamp(_3008, 0.0, 1.0);
        float _3012 = exp2(_3006);
        float _3014 = _3012 * _3010;
        float _3016 = _3000 * _3014;
        float _3018 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3020 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3022 = _3016 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_103.x = _3018;
        out.m_103.y = _3020;
        out.m_103.z = _3022;
    }
    out.m_73.x = _2934;
    out.m_73.y = _2936;
    out.m_73.z = _2938;
    if (!_2920)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3024 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3024;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

