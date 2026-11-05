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
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
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
    float4 m_79 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_99 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_59 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_77 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_81 [[attribute(11)]];
    float4 m_71 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3812 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4097 = as_type<float>(_136);
        out.gl_Position.z = _4097;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _140 = in.m_53.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4167 = as_type<float>(_174);
        out.gl_Position.z = _4167;
    }
    if (_166)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _212 > 0.0;
    bool _220 = _214 > 0.0;
    float _222 = _214;
    float _224 = _208;
    float _226 = _206;
    int _228 = as_type<int>(_188);
    float _230 = _192;
    if (_218)
    {
        float _232 = rsqrt(_206);
        _222 = _232;
    }
    float _234 = _222;
    float _236 = 0.0;
    if (!_218)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _216 > 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = 0.0;
    float _250 = _246;
    if (!_218)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = _216;
    float _256 = _252;
    if (_220)
    {
        float _258 = rsqrt(_208);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (!_220)
    {
        _262 = 0.0;
    }
    float _264 = _262;
    float _266 = 0.0;
    float _268 = _264;
    if (!_220)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = 0.0;
    float _274 = _270;
    if (!_220)
    {
        _272 = 0.0;
    }
    float _276 = _272;
    float _278 = _212;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_210);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _234;
    if (_218)
    {
        float _288 = _234 * _176;
        _244 = _288;
    }
    float _290 = _244;
    if (_218)
    {
        float _292 = _234 * _182;
        _250 = _292;
    }
    float _294 = _250;
    if (_218)
    {
        float _296 = _234 * _188;
        _256 = _296;
    }
    float _298 = _256;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _224 = 0.0;
    }
    float _302 = _224;
    float _304 = _302;
    if (!_240)
    {
        _286 = 0.0;
    }
    float _306 = _286;
    float _308 = _306;
    if (_220)
    {
        float _310 = _260 * _178;
        _268 = _310;
    }
    float _312 = _268;
    if (!_240)
    {
        _226 = 0.0;
    }
    float _314 = _226;
    float _316 = _314;
    if (_220)
    {
        float _318 = _260 * _184;
        _274 = _318;
    }
    float _320 = _274;
    if (_220)
    {
        float _322 = _260 * _190;
        _280 = _322;
    }
    float _324 = _280;
    if (_240)
    {
        float _326 = _284 * _180;
        _304 = _326;
    }
    float _328 = _304;
    if (_240)
    {
        float _330 = _284 * _186;
        _308 = _330;
    }
    float _332 = _308;
    if (_240)
    {
        float _334 = _284 * _192;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_300;
    float _356;
    if (!_338)
    {
        float _340 = in.m_61.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_120);
        float _362 = 1.0 / _360;
        float _364 = _154 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_48.x;
    float _370 = in.m_48.y;
    float _372 = in.m_48.z;
    float _374 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _376 = int(_374);
    float _378 = in.m_63.y;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _380;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _386 = _384 != 0;
    float _388 = in.m_61.x;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = 1.0 / _382;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _366 + _396;
    float _400 = in.m_61.y;
    float _402 = in.m_57.w;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _406 = int(_404);
    float _408 = float(_376);
    float _410 = in.m_61.z;
    float _412 = _190 * _370;
    float _414 = _184 * _370;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _418 = fma(_188, _368, _412);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_386)
    {
        _228 = 0;
    }
    int _422 = _228;
    float _424 = _370 + _378;
    int _426 = _422;
    if (!_386)
    {
        _426 = 1;
    }
    int _428 = _426;
    float _430 = _388 * 2.0;
    float _432 = fma(_182, _368, _414);
    float _434 = _388 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _436 = _428 != 1;
    float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _440 = log2(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _444 = _366 + _442;
    float _446 = -_416;
    float _448 = fma(_434, 2.0, _446);
    float _450 = fma(_186, _372, _432);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _456 = floor(_430);
    float _458 = _444 * _394;
    float _460 = fma(_454, -2.0, _452);
    float _462 = _444;
    if (!_436)
    {
        _462 = _410;
    }
    float _464 = _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = _464;
    if (_436)
    {
        _468 = _400;
    }
    float _470 = _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _472;
    float _476 = 1.0 / _392;
    float _478 = fma(_192, _372, _418);
    float _480 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _482 = _440 * _154;
    float _484 = _474;
    float _486 = _470;
    if (!_436)
    {
        _230 = _400;
    }
    float _488 = _230;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _496 = 1.0 / _474;
    bool _498 = _456 > 0.0;
    float _500 = _400 * 2.0;
    bool _502 = _456 >= 0.0;
    bool _504 = isnan(_456);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = -_154;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _448);
    float _516 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    float _518 = _488;
    if (_436)
    {
        _518 = _388;
    }
    float _520 = _518;
    float _522 = exp2(_482);
    if (!_436)
    {
        _484 = _400;
    }
    float _524 = _484;
    float _526 = _398 * _476;
    float _528 = _524;
    if (_436)
    {
        _528 = _388;
    }
    float _530 = _528;
    float _532 = _520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_436)
    {
        _486 = _410;
    }
    float _534 = _486;
    float _536 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _480);
    float _538 = 1.0 / _492;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[83].z, _494);
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _544 = _534;
    if (_436)
    {
        _544 = _400;
    }
    float _546 = _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _550 = 1.0 + _548;
    float _552 = float(_406);
    float _554 = -_542;
    float _556 = fma(_532, 2.0, _554);
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _560 = int(_558);
    float _562 = _546 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _564 = -_522;
    float _566 = _564 + 1.0;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _580 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _588 = _584 || _586;
    float _590 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _592 = int(_590);
    float _594 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _540);
    float _596 = fma(_562, -2.0, _578);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = _588 ? _566 : 0.0;
    float _604 = -_154;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[81].x, _556);
    float _608 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    float _610 = 1.0 / _408;
    float _612 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _624 = _622 != 0;
    float _626 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _630 = _366 + _628;
    float _632 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    int _634 = _510 ? 0 : 1;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _638 = _366 + _636;
    float _640 = 1.0 / _552;
    float _642 = float(_560);
    float _644 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _596);
    float _646 = float(_592);
    float _648 = _638 * _538;
    int _650 = ~_634;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    float _656 = _642 * _154;
    int _658 = _654;
    if (!_498)
    {
        int _660 = ~_634;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = 1.0 / _550;
    float _668 = _610 * _154;
    float _670 = _646 * _154;
    float _672 = _410 * 2.0;
    float _674 = _388 + _410;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    bool _680 = !_624;
    int _682 = _680 ? 0 : 1;
    float _684 = floor(_500);
    float _686 = _640 * _154;
    float _688 = _630 * _496;
    float _690 = _388 + _400;
    float _692 = _674 + (-1.0);
    float _694 = in.m_59.w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _700 = _690 + (-1.0);
    if (_576)
    {
        float _702 = _602 * _666;
        _156 = _702;
    }
    float _704 = _156;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _712 = _710 != 0;
    float _714 = floor(_672);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _718 = _716 != 0;
    float _720 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _722 = fma(_698, _648, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _724 = !_712;
    int _726 = _724 ? 0 : 1;
    float _728 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _730 = _684 >= 0.0;
    bool _732 = isnan(_684);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _742 = !_708;
    int _744 = _742 ? 0 : 1;
    float _746 = _400 + _410;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _754 = _752 != 0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _756;
    int _760 = _738 ? 0 : 1;
    float _762 = _746 + (-1.0);
    bool _764 = _684 > 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _770 = fma(_758, _458, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _772 = !_620;
    int _774 = _772 ? 0 : 1;
    float _776 = _450 + _402;
    int _778 = ~_760;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _786 = _704 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _788 = !_616;
    int _790 = _788 ? 0 : 1;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _424 + _792;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _806 = _804 != 0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _808;
    int _812 = _782;
    if (!_764)
    {
        int _814 = ~_760;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _820;
    bool _824 = _714 >= 0.0;
    bool _826 = isnan(_714);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _842 = fma(_822, _458, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _844 = _832 ? 0 : 1;
    float _846 = fma(_836, _526, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _848 = _714 > 0.0;
    float _850 = fma(_840, _526, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _852 = fma(_768, _526, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _854 = fma(_810, _458, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _858 = _478 + _694;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _776 + _860;
    bool _864 = !_802;
    int _866 = _864 ? 0 : 1;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _868;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _884 = !_798;
    int _886 = _884 ? 0 : 1;
    float _888 = fma(_874, _648, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _890 = ~_844;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = fma(_882, _648, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _898 = _894;
    if (!_848)
    {
        int _900 = ~_844;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = fma(_870, _688, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _908 = _786 * _856;
    int _910 = abs(_866);
    float _912 = fma(_878, _688, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _914 = abs(_886);
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _918 = _858 + _916;
    float _920 = in.m_65.x;
    float _922 = in.m_65.y;
    float _924 = in.m_65.z;
    bool _926 = !_806;
    int _928 = _926 ? 0 : 1;
    float _930 = float(_664);
    int _932 = abs(_928);
    float _934 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[203].y, _908);
    float _936 = float(_914);
    float _938 = float(_904);
    float _940 = floor(_934);
    float _942 = float(_818);
    float _944 = _794 * _794;
    float _946 = float(_910);
    float _948 = _936 * _938;
    float _950 = float(_932);
    float _952 = fma(_862, _862, _944);
    float _954 = _948 * (-2.0);
    float _956 = _946 * _930;
    float _958 = _950 * _942;
    float _960 = _934 + 0.25;
    float _962 = fma(_740, _954, _740);
    float _964 = fma(_954, _920, _920);
    float _966 = fma(_918, _918, _952);
    float _968 = floor(_960);
    float _970 = _958 * (-2.0);
    float _972 = _934 * 6.283185482025146484375;
    float _974 = -_940;
    float _976 = _934 + _974;
    bool _978 = !_750;
    int _980 = _978 ? 0 : 1;
    float _982 = _388 + (-0.5);
    float _984 = _972 * 0.15915493667125701904296875;
    float _986 = fma(_970, _924, _924);
    float _988 = rsqrt(_966);
    bool _990 = _976 >= 0.5;
    bool _992 = isnan(_976);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[196].x, _964);
    int _1002 = abs(_980);
    float _1004 = fma(_720, _970, _720);
    bool _1006 = !_998;
    float _1008 = _1006 ? 0.5 : (-0.5);
    float _1010 = _984 * 6.283185482025146484375;
    float _1012 = sin(_1010);
    float _1014 = -_968;
    float _1016 = _960 + _1014;
    float _1018 = float(_1002);
    float _1020 = fma(_962, _704, _1000);
    float _1022 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1024 = _1022 * 2.0;
    bool _1026 = !_718;
    int _1028 = _1026 ? 0 : 1;
    bool _1030 = _1016 > 0.5;
    float _1032 = _794 * _988;
    float _1034 = _1018 * _1024;
    int _1036 = abs(_1028);
    float _1038 = _410 + (-0.5);
    float _1040 = -_1032;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _1044 = _862 * _988;
    float _1046 = float(_1036);
    float _1048 = _1020 * 0.15915493667125701904296875;
    float _1050 = _1042 * _1042;
    float _1052 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1054 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].z, _986);
    bool _1056 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1058 = isnan(_366);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -_1044;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    bool _1072 = !_754;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = fma(_1046, _1052, _1034);
    bool _1078 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1080 = isnan(_366);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = -_1066;
    float _1092 = _1090 + 1.0;
    int _1094 = abs(_1074);
    float _1096 = _1016;
    if (_1030)
    {
        float _1098 = -_1016;
        float _1100 = _1098 + 1.0;
        _1096 = _1100;
    }
    float _1102 = _1096;
    bool _1104 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1106 = isnan(_366);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = fma(_1070, _1070, _1050);
    float _1118 = _1088 * _1092;
    float _1120 = fma(_1102, 4.0, -1.0);
    bool _1122 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1124 = isnan(_366);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1088;
    float _1136 = _1134 + 1.0;
    float _1138 = -_1114;
    float _1140 = _1138 + 1.0;
    float _1142 = float(_1094);
    float _1144 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1146 = _1114 * _1136;
    bool _1148 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1150 = isnan(_366);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = _1132 * _1140;
    float _1162 = -_1132;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1142, _1144, _1076);
    float _1168 = _956 * (-2.0);
    float _1170 = _918 * _988;
    float _1172 = _1158 * _1164;
    float _1174 = fma(_1166, 3.1415927410125732421875, _922);
    float _1176 = _400 + (-0.5);
    float _1178 = -_1170;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _918);
    float _1182 = _842 * _1172;
    float _1184 = fma(_1174, _1168, _1174);
    float _1186 = _854 * _1172;
    float _1188 = fma(_784, _1168, _784);
    float _1190 = _770 * _1172;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1184);
    float _1194 = -_1158;
    float _1196 = _1194 + 1.0;
    float _1198 = in.m_67.x;
    float _1200 = in.m_67.y;
    float _1202 = in.m_67.z;
    float _1204 = fma(_1004, _704, _1054);
    float _1206 = fma(_1180, _1180, _1116);
    float _1208 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1182);
    float _1210 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1190);
    float _1212 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1186);
    float _1214 = in.m_69.x;
    float _1216 = in.m_69.y;
    float _1218 = in.m_69.z;
    float _1220 = fma(_846, _1160, _1208);
    float _1222 = fma(_852, _1160, _1210);
    float _1224 = fma(_850, _1160, _1212);
    float _1226 = sqrt(_1206);
    float _1228 = fma(_906, _1146, _1220);
    float _1230 = fma(_1188, _704, _1192);
    float _1232 = fma(_728, _1146, _1222);
    float _1234 = fma(_912, _1146, _1224);
    float _1236 = fma(_888, _1118, _1228);
    float _1238 = _1204 * 0.15915493667125701904296875;
    float _1240 = _1230 * 0.15915493667125701904296875;
    float _1242 = fma(_722, _1118, _1232);
    float _1244 = fma(_896, _1118, _1234);
    float _1246 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1236);
    float _1248 = _1048 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1242);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1244);
    float _1256 = _1246 * _1198;
    float _1258 = _1252 * _1202;
    float _1260 = _1254 * _1200;
    float _1262 = _988 * _1226;
    float _1264 = _1048 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _1256 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1270 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1214);
    float _1274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1218);
    float _1276 = _1262 * _1268;
    float _1278 = _1262 * _1270;
    float _1280 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1282 = _1238 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1272 * _1276;
    float _1288 = _1274 * _1278;
    float _1290 = _1262 * _1280;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1216);
    float _1294 = _1240 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = _1292 * _1290;
    float _1300 = _1240 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1266 * _1284;
    float _1306 = _1250 * _1284;
    float _1308 = _1304 * _1288;
    float _1310 = _1238 * 6.283185482025146484375;
    float _1312 = sin(_1310);
    float _1314 = _1250 * _1296;
    float _1316 = _1266 * _1296;
    float _1318 = _1296 * _1284;
    float _1320 = _1266 * _1302;
    float _1322 = _1250 * _1302;
    float _1324 = _1302 * _1284;
    float _1326 = fma(_1312, _1320, _1314);
    float _1328 = -_1288;
    float _1330 = _1312 * _1328;
    float _1332 = -_1322;
    float _1334 = fma(_1312, _1316, _1332);
    float _1336 = -_1316;
    float _1338 = fma(_1312, _1322, _1336);
    float _1340 = fma(_1326, _1286, _1308);
    float _1342 = _1306 * _1288;
    float _1344 = fma(_1324, _1286, _1330);
    float _1346 = fma(_1312, _1314, _1320);
    float _1348 = -_1298;
    float _1350 = fma(_1334, _1348, _1340);
    float _1352 = fma(_1338, _1286, _1342);
    float _1354 = -_1298;
    float _1356 = fma(_1318, _1354, _1344);
    float _1358 = _1350 * _324;
    float _1360 = -_1298;
    float _1362 = fma(_1346, _1360, _1352);
    float _1364 = _1350 * _320;
    float _1366 = fma(_1356, _298, _1358);
    float _1368 = fma(_1356, _294, _1364);
    float _1370 = fma(_1362, _336, _1366);
    float _1372 = fma(_1362, _332, _1368);
    float _1374 = _858 + _1370;
    float _1376 = _776 + _1372;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1380 = _1374 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1384 = _1376 + _1382;
    float _1386 = _1380 * _1380;
    float _1388 = fma(_1384, _1384, _1386);
    float _1390 = _1350 * _312;
    float _1392 = sqrt(_1388);
    float _1394 = fma(_1356, _290, _1390);
    float _1396 = fma(_1362, _328, _1394);
    float _1398 = _424 + _1396;
    bool _1400 = _1392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1408 = _1406 != 0;
    bool _1410 = !_1404;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1408;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1350;
    float _1420 = _1308;
    float _1422 = _1376;
    if (!_1400)
    {
        _1418 = _1374;
    }
    float _1424 = _1418;
    float _1426 = _1424;
    if (!_1400)
    {
        _1420 = _1398;
    }
    float _1428 = _1420;
    bool _1430 = !_1400;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1392 + _1436;
        float _1440 = rsqrt(_1388);
        float _1442 = _1438 * _1434;
        float _1444 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1398, _1450, _1460);
        float _1466 = fma(_1384, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1380, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1422 = _1466;
        _1426 = _1468;
        _1432 = _1464;
    }
    float _1470 = _1422;
    float _1472 = _1426;
    float _1474 = _1432;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1478 = _1470 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1482 = _1472 + _1480;
    float _1484 = fma(_1478, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1486 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6157 = float2(_1484, _1486);
    float _1488 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6157, float2(0.0), isnan(_6157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6157, float2(0.0), isnan(_6157)), level(0.0)).x;
    float _1490 = float(uint(_560));
    float _1492 = trunc(_668);
    int _1494 = int(_1492);
    float _1496 = float(uint(_592));
    float _1498 = -_1170;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    float _1502 = float(_120);
    float _1504 = -_1044;
    float _1506 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1510 = _1508 != 0;
    float _1512 = -_1170;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    int _1516 = ~_592;
    int _1518 = _1516 + 1;
    float _1520 = 1.0 / _1490;
    bool _1522 = _560 == 0;
    float _1524 = in.m_71.x;
    int _1526 = abs(_774);
    int _1528 = abs(_726);
    int _1530 = abs(_744);
    float _1532 = 1.0 / _1496;
    float _1534 = float(uint(_1494));
    float _1536 = trunc(_686);
    int _1538 = int(_1536);
    int _1540 = as_type<int>(_1520) + (-2);
    int _1542 = ~_560;
    int _1544 = _1542 + 1;
    int _1546 = ~_592;
    int _1548 = _1546 + 1;
    float _1550 = as_type<float>(_1540) * _1534;
    float _1552 = _1524;
    if (_1510)
    {
        _420 = 1.0;
    }
    float _1554 = _420;
    float _1556 = 1.0 / _1502;
    int _1558 = as_type<int>(_1532) + (-2);
    float _1560 = _1554;
    if (!_1510)
    {
        _1560 = 7.345489978790283203125;
    }
    float _1562 = _1560;
    int _1564 = abs(_1412);
    float _1566 = trunc(_1550);
    float _1568 = precise::max(_1566, 0.0);
    uint _1571 = uint(_1568);
    float _1573 = float(uint(_1538));
    float _1575 = _1562 * _388;
    int _1577 = ~_560;
    int _1579 = _1577 + 1;
    float _1581 = as_type<float>(_1558) * _1573;
    int _1583 = abs(_682);
    float _1585 = trunc(_1581);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    int _1591 = _1544 * int(_1571);
    int _1593 = _1591 + _1494;
    float _1595 = float(uint(_1593));
    float _1597 = as_type<float>(_1540) * _1595;
    float _1599 = _1595;
    if (_1510)
    {
        _1599 = _388;
    }
    float _1601 = _1599;
    int _1603 = _1548 * int(_1589);
    int _1605 = _1603 + _1538;
    float _1607 = _1601;
    float _1609 = as_type<float>(_1605);
    if (!_1510)
    {
        _1607 = _400;
    }
    float _1611 = _1607;
    float _1613 = trunc(_1597);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    float _1619 = float(uint(_1605));
    if (_1510)
    {
        _1609 = 1.0;
    }
    float _1621 = _1609;
    float _1623 = _1621;
    if (!_1510)
    {
        _1623 = 1.2345600128173828125;
    }
    float _1625 = _1623;
    float _1627 = as_type<float>(_1558) * _1619;
    float _1629 = floor(_1575);
    float _1631 = _1611 * _1625;
    float _1633 = float(_1494);
    int _1635 = int(_1571) + int(_1617);
    float _1637 = trunc(_1627);
    float _1639 = precise::max(_1637, 0.0);
    uint _1641 = uint(_1639);
    bool _1643 = _1633 >= _642;
    bool _1645 = isnan(_1633);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(_642);
    bool _1651 = _1647 || _1649;
    float _1653 = float(_1651);
    int _1655 = _1579 * _1635;
    int _1657 = _1655 + _1494;
    float _1659 = floor(_1631);
    float _1661 = -_1629;
    float _1663 = _1575 + _1661;
    bool _1665 = uint(_1657) >= uint(_560);
    float _1667 = float(_1538);
    float _1669 = trunc(_1653);
    int _1671 = int(_1669);
    int _1673 = int(_1589) + int(_1641);
    bool _1675 = !_1665;
    int _1677 = _1675 ? 0 : (-1);
    int _1679 = ~_1635;
    int _1681 = _1679 + _1677;
    int _1683 = _1681 + 1;
    float _1685 = _656 * _1556;
    bool _1687 = _1667 >= _646;
    bool _1689 = isnan(_1667);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(_646);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    int _1699 = _1518 * _1673;
    int _1701 = _1699 + _1538;
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1705 = _1703 != 0;
    int _1707 = _560 * _1683;
    int _1709 = _1707 + _1494;
    float _1711 = _670 * _1556;
    float _1713 = _1663 * _642;
    bool _1715 = uint(_1701) >= uint(_592);
    float _1717 = trunc(_1697);
    int _1719 = int(_1717);
    int _1721 = ~_1671;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    float _1727 = -_1659;
    float _1729 = _1631 + _1727;
    bool _1731 = !_1522;
    int _1733 = _1731 ? _1709 : (-1);
    float _1735 = in.m_71.y;
    bool _1737 = !_1715;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = _646 * _1729;
    int _1743 = _1733 * _1725;
    int _1745 = _560 + (-1);
    float _1747 = trunc(_1685);
    int _1749 = int(_1747);
    int _1751 = ~_1673;
    int _1753 = _1751 + _1739;
    int _1755 = _1753 + 1;
    float _1757 = in.m_61.w;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1761 = _1759 != 0;
    int _1763 = _1671 * _1745;
    int _1765 = _1763 + _1743;
    bool _1767 = _592 == 0;
    int _1769 = _592 * _1755;
    int _1771 = _1769 + _1538;
    bool _1773 = !_1761;
    int _1775 = _1773 ? 0 : 1;
    float _1777 = trunc(_1741);
    int _1779 = int(_1777);
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1783 = _1781 != 0;
    int _1785 = ~_1719;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    bool _1791 = !_1767;
    int _1793 = _1791 ? _1771 : (-1);
    int _1795 = abs(_1775);
    float _1797 = trunc(_1713);
    int _1799 = int(_1797);
    bool _1801 = !_1783;
    int _1803 = _1801 ? 0 : 1;
    int _1805 = _1789 * _1793;
    int _1807 = _592 + (-1);
    int _1809 = abs(_1803);
    float _1811 = trunc(_1711);
    int _1813 = int(_1811);
    int _1815 = _1719 * _1807;
    int _1817 = _1815 + _1805;
    int _1819 = abs(_790);
    int _1821 = _1765 * _1526;
    int _1823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1825 = _1823 != 0;
    int _1827 = _1817 * _1528;
    int _1829 = _1749 * _1819;
    int _1831 = _1829 + _1821;
    int _1833 = abs(_1416);
    int _1835 = _1779 * _1809;
    int _1837 = _1835 + _1538;
    bool _1839 = !_1705;
    int _1841 = _1839 ? 0 : 1;
    int _1843 = _1799 * _1795;
    int _1845 = _1843 + _1494;
    int _1847 = abs(_1841);
    int _1849 = _1813 * _1530;
    int _1851 = _1849 + _1827;
    int _1853 = _1845 * _1583;
    int _1855 = _1853 + _1831;
    int _1857 = _1837 * _1564;
    int _1859 = _1857 + _1851;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1863 = _1500 + _1861;
    int _1865 = _1779 * _1833;
    int _1867 = _1865 + _1859;
    int _1869 = _1799 * _1847;
    int _1871 = _1869 + _1855;
    float _1873 = -_1044;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1470);
    float _1877 = float(uint(_1867));
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1881 = _1875 + _1879;
    float _1883 = float(uint(_1871));
    float _1885 = as_type<float>(_1558) * _1877;
    float _1887 = fma(_1488, 100.0, _1474);
    float _1889 = -_1032;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1887);
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1895 = _1891 + _1893;
    float _1897 = _1895 * _1895;
    float _1899 = fma(_1881, _1881, _1897);
    float _1901 = fma(_1863, _1863, _1899);
    float _1903 = rsqrt(_1901);
    float _1905 = sqrt(_1901);
    float _1907 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1909 = _1881 * _1907;
    float _1911 = _1863 * _1907;
    float _1913 = _1909 * _1909;
    float _1915 = _1911 * _1911;
    float _1917 = _1913 + _1915;
    float _1919 = sqrt(_1917);
    bool _1921 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1925 = _1919 + _1923;
    float _1927 = _1863;
    float _1929 = _1899;
    float _1931 = _1925;
    float _1933 = as_type<float>(_1831);
    float _1935 = _1907;
    float _1937 = _1735;
    if (_1921)
    {
        float _1939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1939;
    }
    float _1941 = _1927;
    if (_1921)
    {
        float _1943 = rsqrt(_1917);
        _1929 = _1943;
    }
    float _1945 = _1929;
    float _1947 = _1945;
    if (_1921)
    {
        float _1949 = _1925 * _1941;
        _1931 = _1949;
    }
    float _1951 = _1931;
    if (_1921)
    {
        float _1953 = _1951 * 0.15915493667125701904296875;
        _1933 = _1953;
    }
    float _1955 = _1933;
    float _1957 = _1941;
    float _1959 = _1955;
    if (_1921)
    {
        float _1961 = _1955 * 6.283185482025146484375;
        float _1963 = sin(_1961);
        _1957 = _1963;
    }
    float _1965 = _1957;
    float _1967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1969 = precise::max(0.0, _1967);
    float _1971 = _1903;
    float _1973 = _1969;
    if (_1921)
    {
        float _1975 = _1955 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        _1971 = _1977;
    }
    float _1979 = _1971;
    float _1981 = -_1907;
    float _1983 = -_1969;
    float _1985 = fma(_1895, _1981, _1983);
    float _1987 = _1985;
    if (_1921)
    {
        float _1989 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1973 = _1989;
    }
    float _1991 = _1973;
    float _1993 = _1965;
    float _1995 = _1991;
    if (_1921)
    {
        float _1997 = fma(_1965, _1991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = _1999;
    float _2003 = _1979;
    if (_1921)
    {
        float _2005 = _1979 + (-1.0);
        _1995 = _2005;
    }
    float _2007 = _1995;
    float _2009 = _2007;
    if (_1921)
    {
        float _2011 = _1945 * _1999;
        _1935 = _2011;
    }
    float _2013 = _1935;
    if (!_1921)
    {
        _2001 = _1909;
    }
    float _2015 = _2001;
    float _2017 = _2015;
    if (_1921)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _2019;
    }
    float _2021 = _1959;
    if (_1921)
    {
        float _2023 = _1909 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1921)
    {
        _2009 = _1911;
    }
    float _2027 = _2009;
    float _2029 = _2027;
    if (_1921)
    {
        float _2031 = _1911 * _2013;
        _2029 = _2031;
    }
    float _2033 = _2029;
    if (!_1921)
    {
        _1947 = _1913;
    }
    float _2035 = _1947;
    float _2037 = _2035;
    if (_1921)
    {
        float _2039 = fma(_1985, _1979, _2021);
        _1987 = _2039;
    }
    float _2041 = _1987;
    if (_1921)
    {
        float _2043 = _2025 * _2025;
        _2037 = _2043;
    }
    float _2045 = _2037;
    if (!_1921)
    {
        _2003 = _1915;
    }
    float _2047 = _2003;
    float _2049 = _2047;
    if (_1921)
    {
        float _2051 = _2033 * _2033;
        _2049 = _2051;
    }
    float _2053 = _2049;
    float _2055 = fma(_2041, _2041, _2045);
    float _2057 = _2055 + _2053;
    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2061 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2059);
    float _2063 = precise::clamp(_2061, 0.0, 1.0);
    float _2065 = rsqrt(_2057);
    float _2067 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2069 = -_2063;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2075 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2077 = abs(_2071);
    float _2079 = log2(_2077);
    float _2081 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2075);
    float _2083 = _2065 * _2025;
    float _2085 = floor(_2073);
    float _2087 = _2065 * _2041;
    float _2089 = _2065 * _2033;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2093 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2081);
    float _2095 = -_2091;
    float _2097 = fma(_2087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2095);
    float _2099 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = floor(_2067);
    float _2103 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2105 = -_2089;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2097);
    float _2109 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2111 = fma(_2107, -0.5, 0.5);
    float _2113 = fma(_2107, 0.5, 0.5);
    float _2115 = -_2085;
    float _2117 = _2073 + _2115;
    float _2119 = -_2109;
    float _2121 = fma(_2119, _2103, 1.0);
    float _2123 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = fma(_2113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2129 = sqrt(_2111);
    float _2131 = fma(_2113, _2125, -0.212114393711090087890625);
    float _2133 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2135 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2127);
    float _2137 = -_2101;
    float _2139 = _2067 + _2137;
    float _2141 = fma(_2113, _2131, 1.570728778839111328125);
    float _2143 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2133);
    float _2145 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2135);
    float _2147 = exp2(_2123);
    float _2149 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2143);
    float _2153 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2155 = as_type<float>(_1540) * _1883;
    float _2157 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2161 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2163 = _2087 + 1.0;
    float _2165 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2157);
    float _2167 = trunc(_2155);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    float _2173 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2161);
    float _2175 = _2129 * 0.636619746685028076171875;
    float _2177 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2173);
    float _2183 = -_2087;
    float _2185 = fma(_2147, _2163, _2183);
    float _2187 = -_2141;
    float _2189 = fma(_2175, _2187, 1.0);
    float _2191 = log2(_2121);
    float _2193 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2181);
    float _2195 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    int _2199 = ~_560;
    int _2201 = _2199 + 1;
    float _2203 = fma(_2185, 0.5, 0.5);
    float _2205 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2207 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2197);
    float _2209 = 1.0 / _2193;
    int _2211 = _2201 * int(_2171);
    int _2213 = _2211 + _1871;
    float _2215 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2217 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float2 _7242 = float2(_2139, _2117);
    float _2219 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7242, float2(0.0), isnan(_7242)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7242, float2(0.0), isnan(_7242)), level(0.0)).x;
    float _2221 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2223 = float(uint(_2213));
    float _2225 = _2191 * 0.693147182464599609375;
    float _2227 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2229 = as_type<float>(_1540) * _2223;
    float _2231 = _2217 * _2209;
    float _2233 = _2221 * _2209;
    float _2235 = trunc(_2229);
    float _2237 = precise::max(_2235, 0.0);
    uint _2239 = uint(_2237);
    float _2241 = fma(_2231, 0.5, 0.5);
    float _2243 = fma(_2233, -0.5, 0.5);
    float3 _7286 = float3(_2241, _2243, _2227);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7286, float3(0.0), isnan(_7286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7286, float3(0.0), isnan(_7286)), level(0.0)).x;
    float3 _7297 = float3(_2241, _2243, _2227);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7297, float3(0.0), isnan(_7297)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7297, float3(0.0), isnan(_7297)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _7313 = float2(_2189, _2203);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7313, float2(0.0), isnan(_7313)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7313, float2(0.0), isnan(_7313)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = trunc(_1885);
    float _2270 = precise::max(_2268, 0.0);
    uint _2272 = uint(_2270);
    int _2274 = ~_592;
    int _2276 = _2274 + 1;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2280 = _2278 != 0;
    float _2282 = fma(_1488, 100.0, _424);
    bool _2284 = _400 > 0.5;
    float _2286 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2288 = int(_2171) + int(_2239);
    float _2290 = -_1032;
    float _2292 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    bool _2294 = _1757 > 0.5;
    float _2296 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2298 = float(uint(_1845));
    float _2300 = exp2(_2286);
    float _2302 = -_1735;
    float _2304 = _2302 + 1.0;
    int _2306 = ~_560;
    int _2308 = _2306 + 1;
    float _2310 = as_type<float>(_1540) * _2298;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2314 = _2312 != 0;
    int _2316 = _2276 * int(_2272);
    int _2318 = _2316 + _1867;
    float _2320 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2296);
    int _2322 = _2284 ? as_type<int>(_2304) : as_type<int>(_1735);
    float _2324 = trunc(_2310);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    int _2330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2332 = _2330 != 0;
    int _2334 = _2308 * _2288;
    int _2336 = _2334 + _1871;
    float _2338 = float(uint(_2318));
    int _2340 = _2318;
    bool _2342 = _2294;
    float _2344 = _2229;
    float _2346 = as_type<float>(_2239);
    float _2348 = _2217;
    if (_1825)
    {
        float _2350 = -_1524;
        float _2352 = _2350 + 1.0;
        _2340 = as_type<int>(_2352);
    }
    int _2354 = _2340;
    float _2356 = _2314 ? as_type<float>(_2322) : _1735;
    float _2358 = -_2300;
    float _2360 = _2358 + 1.0;
    int _2362 = _2354;
    if (_2280)
    {
        float _2364 = _2294 ? _2304 : _1735;
        _1937 = _2364;
    }
    float _2366 = _1937;
    float _2368 = as_type<float>(_1558) * _2338;
    bool _2370 = uint(_2336) >= uint(_560);
    float _2372 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2374 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2376 = trunc(_2368);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    bool _2382 = _2370;
    if (_1825)
    {
        bool _2384 = _388 > 0.5;
        _2342 = _2384;
    }
    bool _2386 = _2342;
    out.m_75.x = _1875;
    out.m_75.y = _1891;
    out.m_75.z = _1500;
    bool _2388 = !_2370;
    int _2390 = _2388 ? 0 : (-1);
    float _2392 = _2374 * _388;
    if (!_1825)
    {
        _2344 = _1524;
    }
    float _2394 = _2344;
    int _2396 = _2308 * int(_2328);
    int _2398 = _2396 + _1845;
    float _2400 = _2394;
    if (_1825)
    {
        float _2402 = _2386 ? as_type<float>(_2354) : _1524;
        _2400 = _2402;
    }
    float _2404 = _2400;
    if (_2332)
    {
        float _2406 = -_1524;
        float _2408 = _2406 + 1.0;
        _2362 = as_type<int>(_2408);
    }
    int _2410 = _2362;
    int _2412 = ~_2288;
    int _2414 = _2412 + _2390;
    int _2416 = _2414 + 1;
    float _2418 = trunc(_2392);
    int _2420 = int(_2418);
    if (_2332)
    {
        bool _2422 = _410 > 0.5;
        _2382 = _2422;
    }
    bool _2424 = _2382;
    float _2426 = float(uint(_2398));
    int _2428 = _560 * _2416;
    int _2430 = _2428 + _1871;
    if (_2332)
    {
        float _2432 = _2424 ? as_type<float>(_2410) : _1524;
        _1552 = _2432;
    }
    float _2434 = _1552;
    float _2436 = in.m_77.x;
    float _2438 = in.m_77.y;
    float _2440 = in.m_77.z;
    int _2442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2444 = _2442 != 0;
    float _2446 = as_type<float>(_1540) * _2426;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2450 = _2448 != 0;
    bool _2452 = _1216 != 0.0;
    bool _2454 = isnan(_1216);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan(0.0);
    bool _2460 = _2456 || _2458;
    float _2462 = trunc(_2446);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    bool _2468 = !_1522;
    int _2470 = _2468 ? _2430 : (-1);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2474 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2476 = int(_2272) + int(_2380);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2480 = _1214 == 0.0;
    bool _2482 = !_2460;
    bool _2484 = _2480 && _2482;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2488 = _2470 & 3;
    bool _2490 = _2488 != 0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2494 = _2470 & 3;
    bool _2496 = _2494 != 0;
    bool _2498 = _1218 == 0.0;
    bool _2500 = _2498 && _2484;
    float _2502 = _2490 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2504 = uint(_2494) > 1u;
    int _2506 = _2420 << 4;
    int _2508 = _2506 + 1968;
    float _2510 = float(uint(_1837));
    int _2512 = _2508 + 8;
    uint _2514 = uint(int(uint(_2512) >> uint(2)));
    uint _2516 = uint(int(uint(int(_2514)) >> uint(2)));
    int _2518 = int(_2514) & 3;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[int(_2516)][_2518];
    int _2522 = ~_592;
    int _2524 = _2522 + 1;
    float _2526 = as_type<float>(_1558) * _2510;
    int _2528 = ~as_type<int>(_2502);
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2536 = _2532;
    float _2538 = _2502;
    float _2540 = _2526;
    if (_2500)
    {
        _2346 = _2436;
    }
    float _2542 = _2346;
    int _2544 = _2524 * _2476;
    int _2546 = _2544 + _1867;
    float _2548 = _2542;
    if (!_2504)
    {
        int _2550 = ~as_type<int>(_2502);
        int _2552 = _2550 + 1;
        _2536 = _2552;
    }
    int _2554 = _2536;
    float _2556 = trunc(_2526);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    bool _2562 = uint(_2494) >= 2u;
    float _2564 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2500)
    {
        _2538 = _2542;
    }
    float _2566 = _2538;
    uint _2568 = uint(int(uint(_2508) >> uint(2)));
    uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
    int _2572 = int(_2568) & 3;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[int(_2570)][_2572];
    int _2576 = int(_2568) + 1;
    uint _2578 = uint(int(uint(_2576) >> uint(2)));
    int _2580 = _2576 & 3;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[int(_2578)][_2580];
    float _2584 = _2566;
    if (!_2500)
    {
        _2548 = _2436;
    }
    float _2586 = _2548;
    int _2588 = _2562 ? 0 : 1;
    out.m_79.x = _2564;
    out.m_79.y = _2474;
    out.m_79.z = _2492;
    out.m_79.w = _2486;
    bool _2590 = uint(_2546) >= uint(_592);
    if (!_2500)
    {
        float _2592 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2586);
        _2584 = _2592;
    }
    float _2594 = _2584;
    float _2596 = 0.0;
    if (_2500)
    {
        _2596 = _2438;
    }
    float _2598 = _2596;
    int _2600 = ~_592;
    int _2602 = _2600 + 1;
    float _2604 = _2598;
    if (_2500)
    {
        _2540 = _2598;
    }
    float _2606 = _2540;
    int _2608 = int(_2328) + int(_2466);
    float _2610 = _2606;
    if (!_2500)
    {
        _2604 = _2438;
    }
    float _2612 = _2604;
    int _2614 = _2470 >> 31;
    int _2616 = _2602 * int(_2560);
    int _2618 = _2616 + _1837;
    bool _2620 = !_2590;
    int _2622 = _2620 ? 0 : (-1);
    if (!_2500)
    {
        float _2624 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2612);
        _2610 = _2624;
    }
    float _2626 = _2610;
    bool _2628 = _2494 != 3;
    int _2630 = ~_2476;
    int _2632 = _2630 + _2622;
    int _2634 = _2632 + 1;
    int _2636 = ~_560;
    int _2638 = _2636 + 1;
    float _2640 = float(uint(_2618));
    int _2642 = _592 * _2634;
    int _2644 = _2642 + _1867;
    int _2646 = _2614 & 3;
    int _2648 = _2638 * _2608;
    int _2650 = _2648 + _1845;
    int _2652 = ~_2588;
    int _2654 = _2652 + 1;
    int _2656 = _2654 + 1;
    float _2658 = as_type<float>(_1558) * _2640;
    bool _2660 = !_1767;
    int _2662 = _2660 ? _2644 : (-1);
    float _2664 = _2520 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2666 = _2656;
    if (_2628)
    {
        int _2668 = ~_2588;
        int _2670 = _2668 + 1;
        _2666 = _2670;
    }
    int _2672 = _2666;
    float _2674 = trunc(_2658);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    int _2680 = _2662 >> 31;
    float _2682 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2684 = uint(_2650) >= uint(_560);
    int _2686 = _2470 + _2646;
    float _2688 = in.m_81.x;
    float _2690 = in.m_81.y;
    float _2692 = in.m_81.z;
    float _2694 = in.m_81.w;
    int _2696 = _2680 & 3;
    bool _2698 = !_2684;
    int _2700 = _2698 ? 0 : (-1);
    int _2702 = _2662 + _2696;
    float _2704 = _2574 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2706 = _2662 & 3;
    bool _2708 = _2706 != 0;
    float _2710 = _2582 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2712 = _2686 >> 2;
    float _2714 = _2704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2716 = _2702 >> 2;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2720 = _2708 ? 0 : 1;
    int _2722 = _2712 << 4;
    int _2724 = _2722 + 368;
    bool _2726 = uint(_2706) >= 2u;
    out.m_83.x = _2714;
    out.m_83.y = _2718;
    out.m_83.z = _2682;
    int _2728 = _2716 << 4;
    int _2730 = _2728 + 512;
    float _2732 = 0.0;
    if (_2500)
    {
        _2732 = _2440;
    }
    float _2734 = _2732;
    uint _2736 = uint(int(uint(_2724) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    int _2752 = _2726 ? 0 : 1;
    bool _2754 = uint(_2706) > 1u;
    int _2756 = int(_2560) + int(_2678);
    float _2758 = as_type<float>(_2678);
    float _2760 = _2734;
    if (_2500)
    {
        _2758 = _2734;
    }
    float _2762 = _2758;
    uint _2764 = uint(int(uint(_2730) >> uint(2)));
    uint _2766 = uint(int(uint(int(_2764)) >> uint(2)));
    int _2768 = int(_2764) & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    int _2772 = int(_2764) + 1;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    int _2776 = _2772 & 3;
    float _2778 = (*spvDescriptorSet0.vp_c9)._m0[int(_2774)][_2776];
    int _2780 = ~_592;
    int _2782 = _2780 + 1;
    float _2784 = _2762;
    if (!_2500)
    {
        _2760 = _2440;
    }
    float _2786 = _2760;
    float _2788 = _2688 * _2612;
    int _2790 = ~_2720;
    int _2792 = _2790 + 1;
    int _2794 = _2792 + 1;
    int _2796 = _2782 * _2756;
    int _2798 = _2796 + _1837;
    int _2800 = abs(_2672);
    float _2802 = _2690 * _2786;
    int _2804 = _2794;
    if (!_2754)
    {
        int _2806 = ~_2720;
        int _2808 = _2806 + 1;
        _2804 = _2808;
    }
    int _2810 = _2804;
    int _2812 = _2730 + 8;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    bool _2830 = uint(_2798) >= uint(_592);
    float _2832 = -_2802;
    float _2834 = fma(_2692, _2612, _2832);
    float _2836 = _2692 * _2586;
    if (!_2500)
    {
        float _2838 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2786);
        _2784 = _2838;
    }
    float _2840 = _2784;
    bool _2842 = !_2830;
    int _2844 = _2842 ? 0 : (-1);
    float _2846 = -_2788;
    float _2848 = fma(_2690, _2586, _2846);
    bool _2850 = _2706 != 3;
    int _2852 = _2724 + 8;
    uint _2854 = uint(int(uint(_2852) >> uint(2)));
    uint _2856 = uint(int(uint(int(_2854)) >> uint(2)));
    int _2858 = int(_2854) & 3;
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[int(_2856)][_2858];
    int _2862 = int(_2854) + 1;
    uint _2864 = uint(int(uint(_2862) >> uint(2)));
    int _2866 = _2862 & 3;
    float _2868 = (*spvDescriptorSet0.vp_c9)._m0[int(_2864)][_2866];
    bool _2870 = !_2496;
    int _2872 = _2870 ? 0 : 1;
    float _2874 = -_2836;
    float _2876 = fma(_2688, _2786, _2874);
    int _2878 = _2662 & 3;
    bool _2880 = _2878 != 0;
    float _2882 = _2834 * _2694;
    int _2884 = abs(_2554);
    float _2886 = _2876 * _2694;
    int _2888 = abs(_2872);
    float _2890 = _2848 * _2694;
    int _2892 = ~_2752;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    int _2898 = _2896;
    if (_2850)
    {
        int _2900 = ~_2752;
        int _2902 = _2900 + 1;
        _2898 = _2902;
    }
    int _2904 = _2898;
    int _2906 = abs(_2810);
    bool _2908 = _2494 != 3;
    int _2910 = ~_2884;
    int _2912 = _2910 + 1;
    int _2914 = _2912 + 1;
    float _2916 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2918 = int(_2916);
    bool _2920 = !_2880;
    int _2922 = _2920 ? 0 : 1;
    int _2924 = _2914 * as_type<int>(_2750);
    int _2926 = ~_2888;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    int _2932 = ~_2906;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    int _2938 = abs(_2922);
    int _2940 = _2930 * as_type<int>(_2742);
    int _2942 = _2940 + _2924;
    bool _2944 = !_2908;
    int _2946 = _2944 ? 0 : (-1);
    float _2948 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2950 = int(_2948);
    bool _2952 = _2706 != 3;
    int _2954 = _2936 * as_type<int>(_2778);
    int _2956 = ~_2938;
    int _2958 = _2956 + 1;
    int _2960 = _2958 + 1;
    int _2962 = abs(_2946);
    bool _2964 = !_2952;
    int _2966 = _2964 ? 0 : (-1);
    int _2968 = _2960 * as_type<int>(_2770);
    int _2970 = _2968 + _2954;
    int _2972 = ~_2800;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    int _2978 = abs(_2904);
    int _2980 = _2976 * as_type<int>(_2860);
    int _2982 = _2980 + _2942;
    int _2984 = abs(_2966);
    float _2986 = _1306 * _2890;
    int _2988 = ~_2962;
    int _2990 = _2988 + 1;
    int _2992 = _2990 + 1;
    float _2994 = _1304 * _2890;
    int _2996 = ~_2978;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2992 * as_type<int>(_2868);
    int _3004 = _3002 + _2982;
    int _3006 = ~_2608;
    int _3008 = _3006 + _2700;
    int _3010 = _3008 + 1;
    float _3012 = fma(_1326, _2882, _2994);
    bool _3014 = !_2444;
    int _3016 = _3014 ? 0 : 1;
    int _3018 = _3000 * as_type<int>(_2820);
    int _3020 = _3018 + _2970;
    int _3022 = ~_2984;
    int _3024 = _3022 + 1;
    int _3026 = _3024 + 1;
    int _3028 = _560 * _3010;
    int _3030 = _3028 + _1845;
    float _3032 = float(uint(_2918));
    float _3034 = _1306 * _2692;
    int _3036 = abs(_3016);
    int _3038 = _3026 * as_type<int>(_2828);
    int _3040 = _3038 + _3020;
    int _3042 = abs(_2918);
    float _3044 = fma(_1338, _2882, _2986);
    float _3046 = float(uint(_2950));
    float _3048 = 1.0 / _3032;
    bool _3050 = !_2450;
    int _3052 = _3050 ? 0 : 1;
    float _3054 = -_2886;
    float _3056 = fma(_1334, _3054, _3012);
    int _3058 = ~_3036;
    int _3060 = _3058 + 1;
    int _3062 = _3060 + 1;
    int _3064 = ~_2756;
    int _3066 = _3064 + _2844;
    int _3068 = _3066 + 1;
    float _3070 = 1.0 / _3046;
    int _3072 = abs(_3052);
    int _3074 = _3004 * _3062;
    bool _3076 = !_1522;
    int _3078 = _3076 ? _3030 : (-1);
    int _3080 = _592 * _3068;
    int _3082 = _3080 + _1837;
    float _3084 = float(uint(_3042));
    float _3086 = -_2692;
    float _3088 = _1312 * _3086;
    int _3090 = ~_3072;
    int _3092 = _3090 + 1;
    int _3094 = _3092 + 1;
    int _3096 = _3078 * _3036;
    int _3098 = _3096 + _3074;
    float _3100 = _1304 * _2692;
    bool _3102 = !_1767;
    int _3104 = _3102 ? _3082 : (-1);
    float _3106 = 1.0 / _3084;
    int _3108 = abs(_2950);
    int _3110 = _3094 * _3040;
    float _3112 = -_2840;
    float _3114 = _1312 * _3112;
    int _3116 = as_type<int>(_3048) + (-2);
    float _3118 = -_2890;
    float _3120 = _1312 * _3118;
    float _3122 = float(uint(_3108));
    int _3124 = _3104 * _3072;
    int _3126 = _3124 + _3110;
    float _3128 = float(uint(_3098));
    float _3130 = fma(_1324, _2594, _3114);
    float _3132 = 1.0 / _3122;
    int _3134 = abs(_3098);
    float _3136 = fma(_1324, _2688, _3088);
    float _3138 = float(uint(_3126));
    float _3140 = as_type<float>(_3116) * _3128;
    float _3142 = fma(_1324, _2882, _3120);
    int _3144 = ~_2918;
    int _3146 = _3144 + 1;
    float _3148 = _1304 * _2840;
    float _3150 = _1306 * _2840;
    int _3152 = as_type<int>(_3070) + (-2);
    float _3154 = trunc(_3140);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = as_type<int>(_3106) + (-2);
    float _3162 = fma(_1338, _2594, _3150);
    int _3164 = abs(_3126);
    float _3166 = as_type<float>(_3152) * _3138;
    float _3168 = float(uint(_3134));
    float _3170 = fma(_1338, _2688, _3034);
    int _3172 = as_type<int>(_3132) + (-2);
    float _3174 = -_2886;
    float _3176 = fma(_1318, _3174, _3142);
    float _3178 = float(uint(_3164));
    float _3180 = trunc(_3166);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    float _3186 = as_type<float>(_3160) * _3168;
    int _3188 = ~_2950;
    int _3190 = _3188 + 1;
    float _3192 = -_2219;
    float _3194 = _3192 + 1.0;
    float _3196 = fma(_1326, _2594, _3148);
    float _3198 = as_type<float>(_3172) * _3178;
    float _3200 = trunc(_3186);
    float _3202 = precise::max(_3200, 0.0);
    uint _3204 = uint(_3202);
    int _3206 = _3146 * int(_3158);
    int _3208 = _3206 + _3098;
    int _3210 = ~_3042;
    int _3212 = _3210 + 1;
    float _3214 = fma(_1326, _2688, _3100);
    float _3216 = _2372 * _2245;
    float _3218 = -_2372;
    float _3220 = _3218 + 1.0;
    float _3222 = float(uint(_3208));
    float _3224 = trunc(_3198);
    float _3226 = precise::max(_3224, 0.0);
    uint _3228 = uint(_3226);
    int _3230 = _3190 * int(_3184);
    int _3232 = _3230 + _3126;
    float _3234 = as_type<float>(_3116) * _3222;
    int _3236 = ~_3108;
    int _3238 = _3236 + 1;
    float _3240 = float(uint(_3232));
    int _3242 = _3212 * int(_3204);
    int _3244 = _3242 + _3134;
    float _3246 = trunc(_3234);
    float _3248 = precise::max(_3246, 0.0);
    uint _3250 = uint(_3248);
    float _3252 = as_type<float>(_3152) * _3240;
    float _3254 = -_2626;
    float _3256 = fma(_1318, _3254, _3130);
    float _3258 = float(uint(_3244));
    float _3260 = -_2690;
    float _3262 = fma(_1318, _3260, _3136);
    float _3264 = -_2690;
    float _3266 = fma(_1334, _3264, _3214);
    int _3268 = _3238 * int(_3228);
    int _3270 = _3268 + _3164;
    float _3272 = -_2626;
    float _3274 = fma(_1334, _3272, _3196);
    float _3276 = as_type<float>(_3160) * _3258;
    float _3278 = trunc(_3252);
    float _3280 = precise::max(_3278, 0.0);
    uint _3282 = uint(_3280);
    float _3284 = -_2690;
    float _3286 = fma(_1346, _3284, _3170);
    float _3288 = float(uint(_3270));
    float _3290 = -_2626;
    float _3292 = fma(_1346, _3290, _3162);
    float _3294 = _3266 * _320;
    float _3296 = _3266 * _312;
    float _3298 = _3266 * _324;
    float _3300 = as_type<float>(_3172) * _3288;
    float _3302 = trunc(_3276);
    float _3304 = precise::max(_3302, 0.0);
    uint _3306 = uint(_3304);
    float _3308 = _3274 * _312;
    float _3310 = _3056 * _312;
    int _3312 = ~_2918;
    int _3314 = _3312 + 1;
    float _3316 = fma(_3262, _294, _3294);
    float _3318 = fma(_3262, _290, _3296);
    float _3320 = fma(_3262, _298, _3298);
    int _3322 = int(_3158) + int(_3250);
    float _3324 = trunc(_3300);
    float _3326 = precise::max(_3324, 0.0);
    uint _3328 = uint(_3326);
    int _3330 = ~_2950;
    int _3332 = _3330 + 1;
    float _3334 = _3274 * _320;
    float _3336 = _3056 * _320;
    int _3338 = int(_3184) + int(_3282);
    float _3340 = _3274 * _324;
    int _3342 = ~_3108;
    int _3344 = _3342 + 1;
    float _3346 = fma(_3176, _294, _3336);
    int _3348 = int(_3204) + int(_3306);
    float _3350 = _3056 * _324;
    float _3352 = fma(_3256, _294, _3334);
    int _3354 = ~_3042;
    int _3356 = _3354 + 1;
    float _3358 = fma(_3176, _290, _3310);
    float _3360 = fma(_3176, _298, _3350);
    int _3362 = _3314 * _3322;
    int _3364 = _3362 + _3098;
    int _3366 = int(_3228) + int(_3328);
    int _3368 = _3356 * _3348;
    int _3370 = _3368 + _3134;
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3374 = uint(_3364) >= uint(_2918);
    int _3376 = _3344 * _3366;
    int _3378 = _3376 + _3164;
    bool _3380 = uint(_3370) >= uint(_3042);
    int _3382 = _3332 * _3338;
    int _3384 = _3382 + _3126;
    bool _3386 = !_3374;
    int _3388 = _3386 ? 0 : (-1);
    float _3390 = fma(_3256, _290, _3308);
    bool _3392 = uint(_3378) >= uint(_3108);
    float _3394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3396 = uint(_3384) >= uint(_2950);
    float _3398 = -_2886;
    float _3400 = fma(_1346, _3398, _3044);
    int _3402 = ~_3322;
    int _3404 = _3402 + _3388;
    int _3406 = _3404 + 1;
    float _3408 = fma(_3256, _298, _3340);
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    float _3414 = fma(_3292, _332, _3352);
    bool _3416 = _2918 == 0;
    int _3418 = _2918 * _3406;
    int _3420 = _3418 + _3098;
    bool _3422 = _2918 == 0;
    float _3424 = fma(_3292, _328, _3390);
    int _3426 = _3098 ^ _2918;
    float _3428 = fma(_3292, _336, _3408);
    int _3430 = _3126 ^ _2950;
    float _3432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3434 = !_3380;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = !_3392;
    int _3440 = _3438 ? 0 : (-1);
    float _3442 = _2266 * _3216;
    uint _3444 = uint(int(uint(_3430) >> uint(31)));
    out.m_85.x = _3414;
    out.m_85.y = _3424;
    out.m_85.z = _3428;
    int _3446 = ~_3338;
    int _3448 = _3446 + _3412;
    int _3450 = _3448 + 1;
    float _3452 = fma(_2256, _3442, _2254);
    bool _3454 = !_3416;
    int _3456 = _3454 ? _3420 : (-1);
    int _3458 = ~_3436;
    int _3460 = _3348 + _3458;
    int _3462 = _3460 + 1;
    int _3464 = _2950 * _3450;
    int _3466 = _3464 + _3126;
    float _3468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3470 = ~_3440;
    int _3472 = _3366 + _3470;
    int _3474 = _3472 + 1;
    float _3476 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _3478 = uint(int(uint(_3426) >> uint(31)));
    int _3480 = ~int(_3444);
    int _3482 = _3480 + 1;
    float _3484 = fma(_3476, _2404, -0.5);
    float _3486 = float(_3456);
    bool _3488 = _2950 == 0;
    int _3490 = ~int(_3478);
    int _3492 = _3490 + 1;
    float _3494 = fma(_3476, _3486, _514);
    int _3496 = _3474 ^ _3482;
    bool _3498 = !_3488;
    int _3500 = _3498 ? _3466 : (-1);
    float _3502 = _3468 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3504 = _2950 == 0;
    float _3506 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3508 = _3462 ^ _3492;
    float _3510 = fma(_626, _3484, _3494);
    int _3512 = ~_3482;
    int _3514 = _3512 + _3496;
    int _3516 = _3514 + 1;
    float _3518 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3520 = float(_3500);
    float _3522 = fma(_3506, _2434, -0.5);
    int _3524 = ~_3492;
    int _3526 = _3524 + _3508;
    int _3528 = _3526 + 1;
    float _3530 = fma(_3518, _2356, -0.5);
    bool _3532 = !_3504;
    int _3534 = _3532 ? _3516 : (-1);
    float _3536 = fma(_3506, _3520, _606);
    bool _3538 = !_3422;
    int _3540 = _3538 ? _3528 : (-1);
    float _3542 = fma(_3400, _332, _3346);
    float _3544 = float(_3534);
    float _3546 = fma(_3502, _2366, -0.5);
    float _3548 = float(_3540);
    float _3550 = fma(_594, _3522, _3536);
    float _3552 = _2256 * _3220;
    float _3554 = -_644;
    float _3556 = fma(_3502, _3544, _3554);
    float _3558 = fma(_3400, _328, _3358);
    float _3560 = -_516;
    float _3562 = fma(_3518, _3548, _3560);
    float _3564 = fma(_3286, _332, _3316);
    float _3566 = fma(_536, _3546, _3556);
    float _3568 = fma(_3286, _328, _3318);
    float _3570 = fma(_3286, _336, _3320);
    float _3572 = fma(_3400, _336, _3360);
    float _3574 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3576 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_87.x = _3564;
    out.m_87.y = _3568;
    out.m_87.z = _3570;
    float _3578 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3574);
    float _3580 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3576);
    float _3582 = fma(_632, _3530, _3562);
    float _3584 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3578);
    float _3586 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3580);
    float _3588 = _3550 + 0.5;
    float _3590 = _3510 + 0.5;
    float _3592 = _3566 + 0.5;
    float _3594 = _3586 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3596 = _3582 + 0.5;
    float _3598 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_89.x = _3542;
    out.m_89.y = _3558;
    out.m_89.z = _3572;
    bool _3600 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3602 = isnan(_1905);
    bool _3604 = _3600 || _3602;
    bool _3606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3608 = _3604 || _3606;
    float _3610 = 1.0 / _3598;
    float _3612 = _3594 + _3598;
    out.m_91.x = _3590;
    out.m_91.y = _3596;
    out.m_91.z = _3588;
    out.m_91.w = _3592;
    float _3614 = in.m_63.x;
    float _3616 = _2193 * 0.5;
    float _3618 = _3612 * _3610;
    float _3620 = _3618 * 0.5;
    float _3622 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3624 = fma(_3620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3622);
    float _3626 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2320);
    float _3628 = 1.0 / _3624;
    float _3630 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3626);
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2221;
    out.gl_Position.z = _3630;
    out.gl_Position.w = _2193;
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3634 = _3628 * _3632;
    float _3636 = abs(_3634);
    float _3638 = log2(_3636);
    float _3640 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3642 = exp2(_3640);
    float _3644 = fma(_3642, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3646 = precise::clamp(_3644, 0.0, 1.0);
    float _3648 = _3630 + _2193;
    float _3650 = fma(_3646, -2.0, 3.0);
    float _3652 = _3646 * _3646;
    bool _3654 = _3634 <= 8000.0;
    bool _3656 = isnan(_3634);
    bool _3658 = _3654 || _3656;
    bool _3660 = isnan(8000.0);
    bool _3662 = _3658 || _3660;
    float _3664 = float(_3662);
    float _3666 = fma(_2221, -0.5, _3616);
    float _3668 = _3652 * _3650;
    float _3670 = _3648 * 0.5;
    float _3672 = -_3668;
    float _3674 = _3672 + 1.0;
    float _3676 = fma(_3674, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3668);
    float _3678 = _2217 + _2193;
    float _3680 = _3664 * _3676;
    float _3682 = _3678 * 0.5;
    float _3684 = _2193;
    float _3686 = _3670;
    float _3688 = _3666;
    float _3690 = _3682;
    if (!_3608)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3692 = _2348;
    float _3694 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_93.x = _3682;
    out.m_93.y = _3666;
    out.m_93.z = _3670;
    out.m_93.w = _2193;
    float _3696 = _3194 * _3694;
    float _3698 = precise::clamp(_3696, 0.0, 1.0);
    float _3700 = -_3698;
    float _3702 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3704 = _2256 * _3216;
    float _3706 = _3702 * _3614;
    float _3708 = fma(_2262, _3704, _2250);
    float _3710 = fma(_2264, _3704, _2252);
    float _3712 = _3706 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3714 = _3706;
    float _3716 = _3692;
    float _3718 = _3692;
    if (!_3608)
    {
        _3714 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3720 = _3714;
    out.m_95.x = _3708;
    out.m_95.y = _3710;
    out.m_95.z = _3452;
    out.m_95.w = _3552;
    float _3722 = _3720;
    float _3724 = _3720;
    if (!_3608)
    {
        _3684 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3726 = _3684;
    float _3728 = _3726;
    float _3730 = _3726;
    if (!_3608)
    {
        _3686 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3732 = _3686;
    out.m_97.x = _3712;
    float _3734 = _3732;
    float _3736 = _3732;
    if (!_3608)
    {
        _3688 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3738 = _3688;
    float _3740 = _3738;
    float _3742 = _3738;
    if (!_3608)
    {
        _3690 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3744 = _3690;
    bool _3746 = !_3608;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3746)
    {
        bool _3752 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3754 = isnan(_1905);
        bool _3756 = _3752 || _3754;
        bool _3758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3760 = _3756 || _3758;
        if (!_3760)
        {
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3764 = _1905 + _3762;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3766;
            float _3770 = 1.0 / _3768;
            float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3792 = _3764 * _3770;
            float _3794 = precise::clamp(_3792, 0.0, 1.0);
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3800 = fma(_3794, _3774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3802 = fma(_3794, _3798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3804 = fma(_3794, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3806 = fma(_3794, _3782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3808 = fma(_3794, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3810 = fma(_3794, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3718 = _3802;
            _3742 = _3808;
            _3724 = _3800;
            _3736 = _3806;
            _3730 = _3804;
            _3750 = _3810;
            _3812 = true;
        }
        else
        {
            bool _3814 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3816 = isnan(_1905);
            bool _3818 = _3814 || _3816;
            bool _3820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3822 = _3818 || _3820;
            if (!_3822)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3824 = _3722;
            _3724 = _3824;
            if (!_3822)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3826 = _3716;
            _3718 = _3826;
            if (!_3822)
            {
                _3728 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3828 = _3728;
            _3730 = _3828;
            if (!_3822)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3830 = _3734;
            _3736 = _3830;
            if (!_3822)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3832 = _3740;
            _3742 = _3832;
            if (!_3822)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3834 = _3748;
            bool _3836 = !_3822;
            _3750 = _3834;
            if (!_3836)
            {
                bool _3838 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3840 = isnan(_1905);
                bool _3842 = _3838 || _3840;
                bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3846 = _3842 || _3844;
                if (!_3846)
                {
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3850 = _1905 + _3848;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3852;
                    float _3856 = 1.0 / _3854;
                    float _3858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3878 = _3850 * _3856;
                    float _3880 = precise::clamp(_3878, 0.0, 1.0);
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3886 = fma(_3880, _3860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3888 = fma(_3880, _3884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3890 = fma(_3880, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3892 = fma(_3880, _3868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3894 = fma(_3880, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3896 = fma(_3880, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3718 = _3888;
                    _3742 = _3894;
                    _3724 = _3886;
                    _3736 = _3892;
                    _3730 = _3890;
                    _3750 = _3896;
                    _3812 = true;
                }
                else
                {
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3730 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3812 = false;
    float _3898 = _3718;
    float _3900 = _3742;
    float _3902 = _3724;
    float _3904 = _3736;
    float _3906 = _3730;
    float _3908 = _3750;
    float _3910 = fma(_3424, -0.5, 0.5);
    float _3912 = precise::clamp(_3910, 0.0, 1.0);
    float _3914 = -_3898;
    float _3916 = _3914 + _3900;
    float _3918 = -_3902;
    float _3920 = _3918 + _3904;
    float _3922 = -_3906;
    float _3924 = _3922 + _3908;
    bool _3926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3928 = fma(_3912, _3916, _3898);
    float _3930 = fma(_3912, _3920, _3902);
    float _3932 = fma(_3912, _3924, _3906);
    float _3934 = _3928 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _3936 = fma(_3930, 0.298911988735198974609375, _3934);
    float _3938 = fma(_3932, 0.114477999508380889892578125, _3936);
    float _3940 = -_3938;
    float _3942 = _3930 + _3940;
    float _3944 = -_3938;
    float _3946 = _3928 + _3944;
    float _3948 = -_3938;
    float _3950 = _3932 + _3948;
    float _3952 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3954 = fma(_3942, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    float _3956 = fma(_3946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    float _3958 = fma(_3950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    out.m_51.x = _3952;
    out.m_101.x = _3954;
    out.m_101.y = _3956;
    out.m_101.z = _3958;
    if (!_3926)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3960 = -_1891;
    float _3962 = _3960 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3964 = -_1875;
    float _3966 = _3964 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3968 = -_1500;
    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3972 = _3962 * _3962;
    float _3974 = fma(_3966, _3966, _3972);
    float _3976 = fma(_3970, _3970, _3974);
    float _3978 = sqrt(_3976);
    float _3980 = rsqrt(_3976);
    float _3982 = -_3978;
    float _3984 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3986 = _3984 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3988 = precise::clamp(_3986, 0.0, 1.0);
    float _3990 = _3966 * _3980;
    float _3992 = _3962 * _3980;
    float _3994 = abs(_3988);
    float _3996 = log2(_3994);
    float _3998 = _3970 * _3980;
    float _4000 = _3990 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4002 = _3424 * _3992;
    float _4004 = -_3992;
    float _4006 = -_4000;
    float _4008 = fma(_4004, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4006);
    float _4010 = fma(_3414, _3990, _4002);
    float _4012 = -_3998;
    float _4014 = fma(_4012, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4008);
    float _4016 = fma(_3428, _3998, _4010);
    float _4018 = precise::clamp(_4016, 0.0, 1.0);
    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4022 = _4014 + _4020;
    float _4024 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4026 = _4022 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4028 = precise::clamp(_4026, 0.0, 1.0);
    float _4030 = exp2(_4024);
    float _4032 = _4030 * _4028;
    float _4034 = _4018 * _4032;
    float _4036 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4038 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4040 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _4036;
    out.m_99.y = _4038;
    out.m_99.z = _4040;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3812 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4097 = as_type<float>(_136);
        out.gl_Position.z = _4097;
    }
    if (!_124)
    {
        return out;
    }
    float _140 = in.m_53.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4167 = as_type<float>(_174);
        out.gl_Position.z = _4167;
    }
    if (_166)
    {
        return out;
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _212 > 0.0;
    bool _220 = _214 > 0.0;
    float _222 = _214;
    float _224 = _208;
    float _226 = _206;
    int _228 = as_type<int>(_188);
    float _230 = _192;
    if (_218)
    {
        float _232 = rsqrt(_206);
        _222 = _232;
    }
    float _234 = _222;
    float _236 = 0.0;
    if (!_218)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _216 > 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = 0.0;
    float _250 = _246;
    if (!_218)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = _216;
    float _256 = _252;
    if (_220)
    {
        float _258 = rsqrt(_208);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (!_220)
    {
        _262 = 0.0;
    }
    float _264 = _262;
    float _266 = 0.0;
    float _268 = _264;
    if (!_220)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = 0.0;
    float _274 = _270;
    if (!_220)
    {
        _272 = 0.0;
    }
    float _276 = _272;
    float _278 = _212;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_210);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _234;
    if (_218)
    {
        float _288 = _234 * _176;
        _244 = _288;
    }
    float _290 = _244;
    if (_218)
    {
        float _292 = _234 * _182;
        _250 = _292;
    }
    float _294 = _250;
    if (_218)
    {
        float _296 = _234 * _188;
        _256 = _296;
    }
    float _298 = _256;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _224 = 0.0;
    }
    float _302 = _224;
    float _304 = _302;
    if (!_240)
    {
        _286 = 0.0;
    }
    float _306 = _286;
    float _308 = _306;
    if (_220)
    {
        float _310 = _260 * _178;
        _268 = _310;
    }
    float _312 = _268;
    if (!_240)
    {
        _226 = 0.0;
    }
    float _314 = _226;
    float _316 = _314;
    if (_220)
    {
        float _318 = _260 * _184;
        _274 = _318;
    }
    float _320 = _274;
    if (_220)
    {
        float _322 = _260 * _190;
        _280 = _322;
    }
    float _324 = _280;
    if (_240)
    {
        float _326 = _284 * _180;
        _304 = _326;
    }
    float _328 = _304;
    if (_240)
    {
        float _330 = _284 * _186;
        _308 = _330;
    }
    float _332 = _308;
    if (_240)
    {
        float _334 = _284 * _192;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_300;
    float _356;
    if (!_338)
    {
        float _340 = in.m_61.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_120);
        float _362 = 1.0 / _360;
        float _364 = _154 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_48.x;
    float _370 = in.m_48.y;
    float _372 = in.m_48.z;
    float _374 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _376 = int(_374);
    float _378 = in.m_63.y;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _380;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _386 = _384 != 0;
    float _388 = in.m_61.x;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = 1.0 / _382;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _366 + _396;
    float _400 = in.m_61.y;
    float _402 = in.m_57.w;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _406 = int(_404);
    float _408 = float(_376);
    float _410 = in.m_61.z;
    float _412 = _190 * _370;
    float _414 = _184 * _370;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _418 = fma(_188, _368, _412);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_386)
    {
        _228 = 0;
    }
    int _422 = _228;
    float _424 = _370 + _378;
    int _426 = _422;
    if (!_386)
    {
        _426 = 1;
    }
    int _428 = _426;
    float _430 = _388 * 2.0;
    float _432 = fma(_182, _368, _414);
    float _434 = _388 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _436 = _428 != 1;
    float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _440 = log2(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _444 = _366 + _442;
    float _446 = -_416;
    float _448 = fma(_434, 2.0, _446);
    float _450 = fma(_186, _372, _432);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _456 = floor(_430);
    float _458 = _444 * _394;
    float _460 = fma(_454, -2.0, _452);
    float _462 = _444;
    if (!_436)
    {
        _462 = _410;
    }
    float _464 = _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = _464;
    if (_436)
    {
        _468 = _400;
    }
    float _470 = _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _472;
    float _476 = 1.0 / _392;
    float _478 = fma(_192, _372, _418);
    float _480 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _482 = _440 * _154;
    float _484 = _474;
    float _486 = _470;
    if (!_436)
    {
        _230 = _400;
    }
    float _488 = _230;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _496 = 1.0 / _474;
    bool _498 = _456 > 0.0;
    float _500 = _400 * 2.0;
    bool _502 = _456 >= 0.0;
    bool _504 = isnan(_456);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = -_154;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _448);
    float _516 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    float _518 = _488;
    if (_436)
    {
        _518 = _388;
    }
    float _520 = _518;
    float _522 = exp2(_482);
    if (!_436)
    {
        _484 = _400;
    }
    float _524 = _484;
    float _526 = _398 * _476;
    float _528 = _524;
    if (_436)
    {
        _528 = _388;
    }
    float _530 = _528;
    float _532 = _520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_436)
    {
        _486 = _410;
    }
    float _534 = _486;
    float _536 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _480);
    float _538 = 1.0 / _492;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[83].z, _494);
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _544 = _534;
    if (_436)
    {
        _544 = _400;
    }
    float _546 = _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _550 = 1.0 + _548;
    float _552 = float(_406);
    float _554 = -_542;
    float _556 = fma(_532, 2.0, _554);
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _560 = int(_558);
    float _562 = _546 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _564 = -_522;
    float _566 = _564 + 1.0;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _580 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _588 = _584 || _586;
    float _590 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _592 = int(_590);
    float _594 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _540);
    float _596 = fma(_562, -2.0, _578);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = _588 ? _566 : 0.0;
    float _604 = -_154;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[81].x, _556);
    float _608 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    float _610 = 1.0 / _408;
    float _612 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _624 = _622 != 0;
    float _626 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _630 = _366 + _628;
    float _632 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    int _634 = _510 ? 0 : 1;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _638 = _366 + _636;
    float _640 = 1.0 / _552;
    float _642 = float(_560);
    float _644 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _596);
    float _646 = float(_592);
    float _648 = _638 * _538;
    int _650 = ~_634;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    float _656 = _642 * _154;
    int _658 = _654;
    if (!_498)
    {
        int _660 = ~_634;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = 1.0 / _550;
    float _668 = _610 * _154;
    float _670 = _646 * _154;
    float _672 = _410 * 2.0;
    float _674 = _388 + _410;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    bool _680 = !_624;
    int _682 = _680 ? 0 : 1;
    float _684 = floor(_500);
    float _686 = _640 * _154;
    float _688 = _630 * _496;
    float _690 = _388 + _400;
    float _692 = _674 + (-1.0);
    float _694 = in.m_59.w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _700 = _690 + (-1.0);
    if (_576)
    {
        float _702 = _602 * _666;
        _156 = _702;
    }
    float _704 = _156;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _712 = _710 != 0;
    float _714 = floor(_672);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _718 = _716 != 0;
    float _720 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _722 = fma(_698, _648, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _724 = !_712;
    int _726 = _724 ? 0 : 1;
    float _728 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _730 = _684 >= 0.0;
    bool _732 = isnan(_684);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _742 = !_708;
    int _744 = _742 ? 0 : 1;
    float _746 = _400 + _410;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _754 = _752 != 0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _756;
    int _760 = _738 ? 0 : 1;
    float _762 = _746 + (-1.0);
    bool _764 = _684 > 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _770 = fma(_758, _458, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _772 = !_620;
    int _774 = _772 ? 0 : 1;
    float _776 = _450 + _402;
    int _778 = ~_760;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _786 = _704 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _788 = !_616;
    int _790 = _788 ? 0 : 1;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _424 + _792;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _806 = _804 != 0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _808;
    int _812 = _782;
    if (!_764)
    {
        int _814 = ~_760;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _820;
    bool _824 = _714 >= 0.0;
    bool _826 = isnan(_714);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _842 = fma(_822, _458, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _844 = _832 ? 0 : 1;
    float _846 = fma(_836, _526, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _848 = _714 > 0.0;
    float _850 = fma(_840, _526, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _852 = fma(_768, _526, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _854 = fma(_810, _458, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _858 = _478 + _694;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _776 + _860;
    bool _864 = !_802;
    int _866 = _864 ? 0 : 1;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _868;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _884 = !_798;
    int _886 = _884 ? 0 : 1;
    float _888 = fma(_874, _648, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _890 = ~_844;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = fma(_882, _648, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _898 = _894;
    if (!_848)
    {
        int _900 = ~_844;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = fma(_870, _688, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _908 = _786 * _856;
    int _910 = abs(_866);
    float _912 = fma(_878, _688, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _914 = abs(_886);
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _918 = _858 + _916;
    float _920 = in.m_65.x;
    float _922 = in.m_65.y;
    float _924 = in.m_65.z;
    bool _926 = !_806;
    int _928 = _926 ? 0 : 1;
    float _930 = float(_664);
    int _932 = abs(_928);
    float _934 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[203].y, _908);
    float _936 = float(_914);
    float _938 = float(_904);
    float _940 = floor(_934);
    float _942 = float(_818);
    float _944 = _794 * _794;
    float _946 = float(_910);
    float _948 = _936 * _938;
    float _950 = float(_932);
    float _952 = fma(_862, _862, _944);
    float _954 = _948 * (-2.0);
    float _956 = _946 * _930;
    float _958 = _950 * _942;
    float _960 = _934 + 0.25;
    float _962 = fma(_740, _954, _740);
    float _964 = fma(_954, _920, _920);
    float _966 = fma(_918, _918, _952);
    float _968 = floor(_960);
    float _970 = _958 * (-2.0);
    float _972 = _934 * 6.283185482025146484375;
    float _974 = -_940;
    float _976 = _934 + _974;
    bool _978 = !_750;
    int _980 = _978 ? 0 : 1;
    float _982 = _388 + (-0.5);
    float _984 = _972 * 0.15915493667125701904296875;
    float _986 = fma(_970, _924, _924);
    float _988 = rsqrt(_966);
    bool _990 = _976 >= 0.5;
    bool _992 = isnan(_976);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[196].x, _964);
    int _1002 = abs(_980);
    float _1004 = fma(_720, _970, _720);
    bool _1006 = !_998;
    float _1008 = _1006 ? 0.5 : (-0.5);
    float _1010 = _984 * 6.283185482025146484375;
    float _1012 = sin(_1010);
    float _1014 = -_968;
    float _1016 = _960 + _1014;
    float _1018 = float(_1002);
    float _1020 = fma(_962, _704, _1000);
    float _1022 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1024 = _1022 * 2.0;
    bool _1026 = !_718;
    int _1028 = _1026 ? 0 : 1;
    bool _1030 = _1016 > 0.5;
    float _1032 = _794 * _988;
    float _1034 = _1018 * _1024;
    int _1036 = abs(_1028);
    float _1038 = _410 + (-0.5);
    float _1040 = -_1032;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _1044 = _862 * _988;
    float _1046 = float(_1036);
    float _1048 = _1020 * 0.15915493667125701904296875;
    float _1050 = _1042 * _1042;
    float _1052 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1054 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].z, _986);
    bool _1056 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1058 = isnan(_366);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -_1044;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    bool _1072 = !_754;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = fma(_1046, _1052, _1034);
    bool _1078 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1080 = isnan(_366);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = -_1066;
    float _1092 = _1090 + 1.0;
    int _1094 = abs(_1074);
    float _1096 = _1016;
    if (_1030)
    {
        float _1098 = -_1016;
        float _1100 = _1098 + 1.0;
        _1096 = _1100;
    }
    float _1102 = _1096;
    bool _1104 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1106 = isnan(_366);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = fma(_1070, _1070, _1050);
    float _1118 = _1088 * _1092;
    float _1120 = fma(_1102, 4.0, -1.0);
    bool _1122 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1124 = isnan(_366);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1088;
    float _1136 = _1134 + 1.0;
    float _1138 = -_1114;
    float _1140 = _1138 + 1.0;
    float _1142 = float(_1094);
    float _1144 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1146 = _1114 * _1136;
    bool _1148 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1150 = isnan(_366);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = _1132 * _1140;
    float _1162 = -_1132;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1142, _1144, _1076);
    float _1168 = _956 * (-2.0);
    float _1170 = _918 * _988;
    float _1172 = _1158 * _1164;
    float _1174 = fma(_1166, 3.1415927410125732421875, _922);
    float _1176 = _400 + (-0.5);
    float _1178 = -_1170;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _918);
    float _1182 = _842 * _1172;
    float _1184 = fma(_1174, _1168, _1174);
    float _1186 = _854 * _1172;
    float _1188 = fma(_784, _1168, _784);
    float _1190 = _770 * _1172;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1184);
    float _1194 = -_1158;
    float _1196 = _1194 + 1.0;
    float _1198 = in.m_67.x;
    float _1200 = in.m_67.y;
    float _1202 = in.m_67.z;
    float _1204 = fma(_1004, _704, _1054);
    float _1206 = fma(_1180, _1180, _1116);
    float _1208 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1182);
    float _1210 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1190);
    float _1212 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1186);
    float _1214 = in.m_69.x;
    float _1216 = in.m_69.y;
    float _1218 = in.m_69.z;
    float _1220 = fma(_846, _1160, _1208);
    float _1222 = fma(_852, _1160, _1210);
    float _1224 = fma(_850, _1160, _1212);
    float _1226 = sqrt(_1206);
    float _1228 = fma(_906, _1146, _1220);
    float _1230 = fma(_1188, _704, _1192);
    float _1232 = fma(_728, _1146, _1222);
    float _1234 = fma(_912, _1146, _1224);
    float _1236 = fma(_888, _1118, _1228);
    float _1238 = _1204 * 0.15915493667125701904296875;
    float _1240 = _1230 * 0.15915493667125701904296875;
    float _1242 = fma(_722, _1118, _1232);
    float _1244 = fma(_896, _1118, _1234);
    float _1246 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1236);
    float _1248 = _1048 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1242);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1244);
    float _1256 = _1246 * _1198;
    float _1258 = _1252 * _1202;
    float _1260 = _1254 * _1200;
    float _1262 = _988 * _1226;
    float _1264 = _1048 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _1256 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1270 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1214);
    float _1274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1218);
    float _1276 = _1262 * _1268;
    float _1278 = _1262 * _1270;
    float _1280 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1282 = _1238 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1272 * _1276;
    float _1288 = _1274 * _1278;
    float _1290 = _1262 * _1280;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1216);
    float _1294 = _1240 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = _1292 * _1290;
    float _1300 = _1240 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1266 * _1284;
    float _1306 = _1250 * _1284;
    float _1308 = _1304 * _1288;
    float _1310 = _1238 * 6.283185482025146484375;
    float _1312 = sin(_1310);
    float _1314 = _1250 * _1296;
    float _1316 = _1266 * _1296;
    float _1318 = _1296 * _1284;
    float _1320 = _1266 * _1302;
    float _1322 = _1250 * _1302;
    float _1324 = _1302 * _1284;
    float _1326 = fma(_1312, _1320, _1314);
    float _1328 = -_1288;
    float _1330 = _1312 * _1328;
    float _1332 = -_1322;
    float _1334 = fma(_1312, _1316, _1332);
    float _1336 = -_1316;
    float _1338 = fma(_1312, _1322, _1336);
    float _1340 = fma(_1326, _1286, _1308);
    float _1342 = _1306 * _1288;
    float _1344 = fma(_1324, _1286, _1330);
    float _1346 = fma(_1312, _1314, _1320);
    float _1348 = -_1298;
    float _1350 = fma(_1334, _1348, _1340);
    float _1352 = fma(_1338, _1286, _1342);
    float _1354 = -_1298;
    float _1356 = fma(_1318, _1354, _1344);
    float _1358 = _1350 * _324;
    float _1360 = -_1298;
    float _1362 = fma(_1346, _1360, _1352);
    float _1364 = _1350 * _320;
    float _1366 = fma(_1356, _298, _1358);
    float _1368 = fma(_1356, _294, _1364);
    float _1370 = fma(_1362, _336, _1366);
    float _1372 = fma(_1362, _332, _1368);
    float _1374 = _858 + _1370;
    float _1376 = _776 + _1372;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1380 = _1374 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1384 = _1376 + _1382;
    float _1386 = _1380 * _1380;
    float _1388 = fma(_1384, _1384, _1386);
    float _1390 = _1350 * _312;
    float _1392 = sqrt(_1388);
    float _1394 = fma(_1356, _290, _1390);
    float _1396 = fma(_1362, _328, _1394);
    float _1398 = _424 + _1396;
    bool _1400 = _1392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1408 = _1406 != 0;
    bool _1410 = !_1404;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1408;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1350;
    float _1420 = _1308;
    float _1422 = _1376;
    if (!_1400)
    {
        _1418 = _1374;
    }
    float _1424 = _1418;
    float _1426 = _1424;
    if (!_1400)
    {
        _1420 = _1398;
    }
    float _1428 = _1420;
    bool _1430 = !_1400;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1392 + _1436;
        float _1440 = rsqrt(_1388);
        float _1442 = _1438 * _1434;
        float _1444 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1398, _1450, _1460);
        float _1466 = fma(_1384, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1380, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1422 = _1466;
        _1426 = _1468;
        _1432 = _1464;
    }
    float _1470 = _1422;
    float _1472 = _1426;
    float _1474 = _1432;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1478 = _1470 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1482 = _1472 + _1480;
    float _1484 = fma(_1478, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1486 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6157 = float2(_1484, _1486);
    float _1488 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6157, float2(0.0), isnan(_6157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6157, float2(0.0), isnan(_6157)), level(0.0)).x;
    float _1490 = float(uint(_560));
    float _1492 = trunc(_668);
    int _1494 = int(_1492);
    float _1496 = float(uint(_592));
    float _1498 = -_1170;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    float _1502 = float(_120);
    float _1504 = -_1044;
    float _1506 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1510 = _1508 != 0;
    float _1512 = -_1170;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    int _1516 = ~_592;
    int _1518 = _1516 + 1;
    float _1520 = 1.0 / _1490;
    bool _1522 = _560 == 0;
    float _1524 = in.m_71.x;
    int _1526 = abs(_774);
    int _1528 = abs(_726);
    int _1530 = abs(_744);
    float _1532 = 1.0 / _1496;
    float _1534 = float(uint(_1494));
    float _1536 = trunc(_686);
    int _1538 = int(_1536);
    int _1540 = as_type<int>(_1520) + (-2);
    int _1542 = ~_560;
    int _1544 = _1542 + 1;
    int _1546 = ~_592;
    int _1548 = _1546 + 1;
    float _1550 = as_type<float>(_1540) * _1534;
    float _1552 = _1524;
    if (_1510)
    {
        _420 = 1.0;
    }
    float _1554 = _420;
    float _1556 = 1.0 / _1502;
    int _1558 = as_type<int>(_1532) + (-2);
    float _1560 = _1554;
    if (!_1510)
    {
        _1560 = 7.345489978790283203125;
    }
    float _1562 = _1560;
    int _1564 = abs(_1412);
    float _1566 = trunc(_1550);
    float _1568 = precise::max(_1566, 0.0);
    uint _1571 = uint(_1568);
    float _1573 = float(uint(_1538));
    float _1575 = _1562 * _388;
    int _1577 = ~_560;
    int _1579 = _1577 + 1;
    float _1581 = as_type<float>(_1558) * _1573;
    int _1583 = abs(_682);
    float _1585 = trunc(_1581);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    int _1591 = _1544 * int(_1571);
    int _1593 = _1591 + _1494;
    float _1595 = float(uint(_1593));
    float _1597 = as_type<float>(_1540) * _1595;
    float _1599 = _1595;
    if (_1510)
    {
        _1599 = _388;
    }
    float _1601 = _1599;
    int _1603 = _1548 * int(_1589);
    int _1605 = _1603 + _1538;
    float _1607 = _1601;
    float _1609 = as_type<float>(_1605);
    if (!_1510)
    {
        _1607 = _400;
    }
    float _1611 = _1607;
    float _1613 = trunc(_1597);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    float _1619 = float(uint(_1605));
    if (_1510)
    {
        _1609 = 1.0;
    }
    float _1621 = _1609;
    float _1623 = _1621;
    if (!_1510)
    {
        _1623 = 1.2345600128173828125;
    }
    float _1625 = _1623;
    float _1627 = as_type<float>(_1558) * _1619;
    float _1629 = floor(_1575);
    float _1631 = _1611 * _1625;
    float _1633 = float(_1494);
    int _1635 = int(_1571) + int(_1617);
    float _1637 = trunc(_1627);
    float _1639 = precise::max(_1637, 0.0);
    uint _1641 = uint(_1639);
    bool _1643 = _1633 >= _642;
    bool _1645 = isnan(_1633);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(_642);
    bool _1651 = _1647 || _1649;
    float _1653 = float(_1651);
    int _1655 = _1579 * _1635;
    int _1657 = _1655 + _1494;
    float _1659 = floor(_1631);
    float _1661 = -_1629;
    float _1663 = _1575 + _1661;
    bool _1665 = uint(_1657) >= uint(_560);
    float _1667 = float(_1538);
    float _1669 = trunc(_1653);
    int _1671 = int(_1669);
    int _1673 = int(_1589) + int(_1641);
    bool _1675 = !_1665;
    int _1677 = _1675 ? 0 : (-1);
    int _1679 = ~_1635;
    int _1681 = _1679 + _1677;
    int _1683 = _1681 + 1;
    float _1685 = _656 * _1556;
    bool _1687 = _1667 >= _646;
    bool _1689 = isnan(_1667);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(_646);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    int _1699 = _1518 * _1673;
    int _1701 = _1699 + _1538;
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1705 = _1703 != 0;
    int _1707 = _560 * _1683;
    int _1709 = _1707 + _1494;
    float _1711 = _670 * _1556;
    float _1713 = _1663 * _642;
    bool _1715 = uint(_1701) >= uint(_592);
    float _1717 = trunc(_1697);
    int _1719 = int(_1717);
    int _1721 = ~_1671;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    float _1727 = -_1659;
    float _1729 = _1631 + _1727;
    bool _1731 = !_1522;
    int _1733 = _1731 ? _1709 : (-1);
    float _1735 = in.m_71.y;
    bool _1737 = !_1715;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = _646 * _1729;
    int _1743 = _1733 * _1725;
    int _1745 = _560 + (-1);
    float _1747 = trunc(_1685);
    int _1749 = int(_1747);
    int _1751 = ~_1673;
    int _1753 = _1751 + _1739;
    int _1755 = _1753 + 1;
    float _1757 = in.m_61.w;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1761 = _1759 != 0;
    int _1763 = _1671 * _1745;
    int _1765 = _1763 + _1743;
    bool _1767 = _592 == 0;
    int _1769 = _592 * _1755;
    int _1771 = _1769 + _1538;
    bool _1773 = !_1761;
    int _1775 = _1773 ? 0 : 1;
    float _1777 = trunc(_1741);
    int _1779 = int(_1777);
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1783 = _1781 != 0;
    int _1785 = ~_1719;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    bool _1791 = !_1767;
    int _1793 = _1791 ? _1771 : (-1);
    int _1795 = abs(_1775);
    float _1797 = trunc(_1713);
    int _1799 = int(_1797);
    bool _1801 = !_1783;
    int _1803 = _1801 ? 0 : 1;
    int _1805 = _1789 * _1793;
    int _1807 = _592 + (-1);
    int _1809 = abs(_1803);
    float _1811 = trunc(_1711);
    int _1813 = int(_1811);
    int _1815 = _1719 * _1807;
    int _1817 = _1815 + _1805;
    int _1819 = abs(_790);
    int _1821 = _1765 * _1526;
    int _1823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1825 = _1823 != 0;
    int _1827 = _1817 * _1528;
    int _1829 = _1749 * _1819;
    int _1831 = _1829 + _1821;
    int _1833 = abs(_1416);
    int _1835 = _1779 * _1809;
    int _1837 = _1835 + _1538;
    bool _1839 = !_1705;
    int _1841 = _1839 ? 0 : 1;
    int _1843 = _1799 * _1795;
    int _1845 = _1843 + _1494;
    int _1847 = abs(_1841);
    int _1849 = _1813 * _1530;
    int _1851 = _1849 + _1827;
    int _1853 = _1845 * _1583;
    int _1855 = _1853 + _1831;
    int _1857 = _1837 * _1564;
    int _1859 = _1857 + _1851;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1863 = _1500 + _1861;
    int _1865 = _1779 * _1833;
    int _1867 = _1865 + _1859;
    int _1869 = _1799 * _1847;
    int _1871 = _1869 + _1855;
    float _1873 = -_1044;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1470);
    float _1877 = float(uint(_1867));
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1881 = _1875 + _1879;
    float _1883 = float(uint(_1871));
    float _1885 = as_type<float>(_1558) * _1877;
    float _1887 = fma(_1488, 100.0, _1474);
    float _1889 = -_1032;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1887);
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1895 = _1891 + _1893;
    float _1897 = _1895 * _1895;
    float _1899 = fma(_1881, _1881, _1897);
    float _1901 = fma(_1863, _1863, _1899);
    float _1903 = rsqrt(_1901);
    float _1905 = sqrt(_1901);
    float _1907 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1909 = _1881 * _1907;
    float _1911 = _1863 * _1907;
    float _1913 = _1909 * _1909;
    float _1915 = _1911 * _1911;
    float _1917 = _1913 + _1915;
    float _1919 = sqrt(_1917);
    bool _1921 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1925 = _1919 + _1923;
    float _1927 = _1863;
    float _1929 = _1899;
    float _1931 = _1925;
    float _1933 = as_type<float>(_1831);
    float _1935 = _1907;
    float _1937 = _1735;
    if (_1921)
    {
        float _1939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1939;
    }
    float _1941 = _1927;
    if (_1921)
    {
        float _1943 = rsqrt(_1917);
        _1929 = _1943;
    }
    float _1945 = _1929;
    float _1947 = _1945;
    if (_1921)
    {
        float _1949 = _1925 * _1941;
        _1931 = _1949;
    }
    float _1951 = _1931;
    if (_1921)
    {
        float _1953 = _1951 * 0.15915493667125701904296875;
        _1933 = _1953;
    }
    float _1955 = _1933;
    float _1957 = _1941;
    float _1959 = _1955;
    if (_1921)
    {
        float _1961 = _1955 * 6.283185482025146484375;
        float _1963 = sin(_1961);
        _1957 = _1963;
    }
    float _1965 = _1957;
    float _1967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1969 = precise::max(0.0, _1967);
    float _1971 = _1903;
    float _1973 = _1969;
    if (_1921)
    {
        float _1975 = _1955 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        _1971 = _1977;
    }
    float _1979 = _1971;
    float _1981 = -_1907;
    float _1983 = -_1969;
    float _1985 = fma(_1895, _1981, _1983);
    float _1987 = _1985;
    if (_1921)
    {
        float _1989 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1973 = _1989;
    }
    float _1991 = _1973;
    float _1993 = _1965;
    float _1995 = _1991;
    if (_1921)
    {
        float _1997 = fma(_1965, _1991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = _1999;
    float _2003 = _1979;
    if (_1921)
    {
        float _2005 = _1979 + (-1.0);
        _1995 = _2005;
    }
    float _2007 = _1995;
    float _2009 = _2007;
    if (_1921)
    {
        float _2011 = _1945 * _1999;
        _1935 = _2011;
    }
    float _2013 = _1935;
    if (!_1921)
    {
        _2001 = _1909;
    }
    float _2015 = _2001;
    float _2017 = _2015;
    if (_1921)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _2019;
    }
    float _2021 = _1959;
    if (_1921)
    {
        float _2023 = _1909 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1921)
    {
        _2009 = _1911;
    }
    float _2027 = _2009;
    float _2029 = _2027;
    if (_1921)
    {
        float _2031 = _1911 * _2013;
        _2029 = _2031;
    }
    float _2033 = _2029;
    if (!_1921)
    {
        _1947 = _1913;
    }
    float _2035 = _1947;
    float _2037 = _2035;
    if (_1921)
    {
        float _2039 = fma(_1985, _1979, _2021);
        _1987 = _2039;
    }
    float _2041 = _1987;
    if (_1921)
    {
        float _2043 = _2025 * _2025;
        _2037 = _2043;
    }
    float _2045 = _2037;
    if (!_1921)
    {
        _2003 = _1915;
    }
    float _2047 = _2003;
    float _2049 = _2047;
    if (_1921)
    {
        float _2051 = _2033 * _2033;
        _2049 = _2051;
    }
    float _2053 = _2049;
    float _2055 = fma(_2041, _2041, _2045);
    float _2057 = _2055 + _2053;
    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2061 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2059);
    float _2063 = precise::clamp(_2061, 0.0, 1.0);
    float _2065 = rsqrt(_2057);
    float _2067 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2069 = -_2063;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2075 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2077 = abs(_2071);
    float _2079 = log2(_2077);
    float _2081 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2075);
    float _2083 = _2065 * _2025;
    float _2085 = floor(_2073);
    float _2087 = _2065 * _2041;
    float _2089 = _2065 * _2033;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2093 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2081);
    float _2095 = -_2091;
    float _2097 = fma(_2087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2095);
    float _2099 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = floor(_2067);
    float _2103 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2105 = -_2089;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2097);
    float _2109 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2111 = fma(_2107, -0.5, 0.5);
    float _2113 = fma(_2107, 0.5, 0.5);
    float _2115 = -_2085;
    float _2117 = _2073 + _2115;
    float _2119 = -_2109;
    float _2121 = fma(_2119, _2103, 1.0);
    float _2123 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = fma(_2113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2129 = sqrt(_2111);
    float _2131 = fma(_2113, _2125, -0.212114393711090087890625);
    float _2133 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2135 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2127);
    float _2137 = -_2101;
    float _2139 = _2067 + _2137;
    float _2141 = fma(_2113, _2131, 1.570728778839111328125);
    float _2143 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2133);
    float _2145 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2135);
    float _2147 = exp2(_2123);
    float _2149 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2143);
    float _2153 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2155 = as_type<float>(_1540) * _1883;
    float _2157 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2161 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2163 = _2087 + 1.0;
    float _2165 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2157);
    float _2167 = trunc(_2155);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    float _2173 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2161);
    float _2175 = _2129 * 0.636619746685028076171875;
    float _2177 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2173);
    float _2183 = -_2087;
    float _2185 = fma(_2147, _2163, _2183);
    float _2187 = -_2141;
    float _2189 = fma(_2175, _2187, 1.0);
    float _2191 = log2(_2121);
    float _2193 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2181);
    float _2195 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    int _2199 = ~_560;
    int _2201 = _2199 + 1;
    float _2203 = fma(_2185, 0.5, 0.5);
    float _2205 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2207 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2197);
    float _2209 = 1.0 / _2193;
    int _2211 = _2201 * int(_2171);
    int _2213 = _2211 + _1871;
    float _2215 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2217 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float2 _7242 = float2(_2139, _2117);
    float _2219 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7242, float2(0.0), isnan(_7242)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7242, float2(0.0), isnan(_7242)), level(0.0)).x;
    float _2221 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2223 = float(uint(_2213));
    float _2225 = _2191 * 0.693147182464599609375;
    float _2227 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2229 = as_type<float>(_1540) * _2223;
    float _2231 = _2217 * _2209;
    float _2233 = _2221 * _2209;
    float _2235 = trunc(_2229);
    float _2237 = precise::max(_2235, 0.0);
    uint _2239 = uint(_2237);
    float _2241 = fma(_2231, 0.5, 0.5);
    float _2243 = fma(_2233, -0.5, 0.5);
    float3 _7286 = float3(_2241, _2243, _2227);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7286, float3(0.0), isnan(_7286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7286, float3(0.0), isnan(_7286)), level(0.0)).x;
    float3 _7297 = float3(_2241, _2243, _2227);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7297, float3(0.0), isnan(_7297)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7297, float3(0.0), isnan(_7297)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _7313 = float2(_2189, _2203);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7313, float2(0.0), isnan(_7313)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7313, float2(0.0), isnan(_7313)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = trunc(_1885);
    float _2270 = precise::max(_2268, 0.0);
    uint _2272 = uint(_2270);
    int _2274 = ~_592;
    int _2276 = _2274 + 1;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2280 = _2278 != 0;
    float _2282 = fma(_1488, 100.0, _424);
    bool _2284 = _400 > 0.5;
    float _2286 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2288 = int(_2171) + int(_2239);
    float _2290 = -_1032;
    float _2292 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    bool _2294 = _1757 > 0.5;
    float _2296 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2298 = float(uint(_1845));
    float _2300 = exp2(_2286);
    float _2302 = -_1735;
    float _2304 = _2302 + 1.0;
    int _2306 = ~_560;
    int _2308 = _2306 + 1;
    float _2310 = as_type<float>(_1540) * _2298;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2314 = _2312 != 0;
    int _2316 = _2276 * int(_2272);
    int _2318 = _2316 + _1867;
    float _2320 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2296);
    int _2322 = _2284 ? as_type<int>(_2304) : as_type<int>(_1735);
    float _2324 = trunc(_2310);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    int _2330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2332 = _2330 != 0;
    int _2334 = _2308 * _2288;
    int _2336 = _2334 + _1871;
    float _2338 = float(uint(_2318));
    int _2340 = _2318;
    bool _2342 = _2294;
    float _2344 = _2229;
    float _2346 = as_type<float>(_2239);
    float _2348 = _2217;
    if (_1825)
    {
        float _2350 = -_1524;
        float _2352 = _2350 + 1.0;
        _2340 = as_type<int>(_2352);
    }
    int _2354 = _2340;
    float _2356 = _2314 ? as_type<float>(_2322) : _1735;
    float _2358 = -_2300;
    float _2360 = _2358 + 1.0;
    int _2362 = _2354;
    if (_2280)
    {
        float _2364 = _2294 ? _2304 : _1735;
        _1937 = _2364;
    }
    float _2366 = _1937;
    float _2368 = as_type<float>(_1558) * _2338;
    bool _2370 = uint(_2336) >= uint(_560);
    float _2372 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2374 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2376 = trunc(_2368);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    bool _2382 = _2370;
    if (_1825)
    {
        bool _2384 = _388 > 0.5;
        _2342 = _2384;
    }
    bool _2386 = _2342;
    out.m_75.x = _1875;
    out.m_75.y = _1891;
    out.m_75.z = _1500;
    bool _2388 = !_2370;
    int _2390 = _2388 ? 0 : (-1);
    float _2392 = _2374 * _388;
    if (!_1825)
    {
        _2344 = _1524;
    }
    float _2394 = _2344;
    int _2396 = _2308 * int(_2328);
    int _2398 = _2396 + _1845;
    float _2400 = _2394;
    if (_1825)
    {
        float _2402 = _2386 ? as_type<float>(_2354) : _1524;
        _2400 = _2402;
    }
    float _2404 = _2400;
    if (_2332)
    {
        float _2406 = -_1524;
        float _2408 = _2406 + 1.0;
        _2362 = as_type<int>(_2408);
    }
    int _2410 = _2362;
    int _2412 = ~_2288;
    int _2414 = _2412 + _2390;
    int _2416 = _2414 + 1;
    float _2418 = trunc(_2392);
    int _2420 = int(_2418);
    if (_2332)
    {
        bool _2422 = _410 > 0.5;
        _2382 = _2422;
    }
    bool _2424 = _2382;
    float _2426 = float(uint(_2398));
    int _2428 = _560 * _2416;
    int _2430 = _2428 + _1871;
    if (_2332)
    {
        float _2432 = _2424 ? as_type<float>(_2410) : _1524;
        _1552 = _2432;
    }
    float _2434 = _1552;
    float _2436 = in.m_77.x;
    float _2438 = in.m_77.y;
    float _2440 = in.m_77.z;
    int _2442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2444 = _2442 != 0;
    float _2446 = as_type<float>(_1540) * _2426;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2450 = _2448 != 0;
    bool _2452 = _1216 != 0.0;
    bool _2454 = isnan(_1216);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan(0.0);
    bool _2460 = _2456 || _2458;
    float _2462 = trunc(_2446);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    bool _2468 = !_1522;
    int _2470 = _2468 ? _2430 : (-1);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2474 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2476 = int(_2272) + int(_2380);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2480 = _1214 == 0.0;
    bool _2482 = !_2460;
    bool _2484 = _2480 && _2482;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2488 = _2470 & 3;
    bool _2490 = _2488 != 0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2494 = _2470 & 3;
    bool _2496 = _2494 != 0;
    bool _2498 = _1218 == 0.0;
    bool _2500 = _2498 && _2484;
    float _2502 = _2490 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2504 = uint(_2494) > 1u;
    int _2506 = _2420 << 4;
    int _2508 = _2506 + 1968;
    float _2510 = float(uint(_1837));
    int _2512 = _2508 + 8;
    uint _2514 = uint(int(uint(_2512) >> uint(2)));
    uint _2516 = uint(int(uint(int(_2514)) >> uint(2)));
    int _2518 = int(_2514) & 3;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[int(_2516)][_2518];
    int _2522 = ~_592;
    int _2524 = _2522 + 1;
    float _2526 = as_type<float>(_1558) * _2510;
    int _2528 = ~as_type<int>(_2502);
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2536 = _2532;
    float _2538 = _2502;
    float _2540 = _2526;
    if (_2500)
    {
        _2346 = _2436;
    }
    float _2542 = _2346;
    int _2544 = _2524 * _2476;
    int _2546 = _2544 + _1867;
    float _2548 = _2542;
    if (!_2504)
    {
        int _2550 = ~as_type<int>(_2502);
        int _2552 = _2550 + 1;
        _2536 = _2552;
    }
    int _2554 = _2536;
    float _2556 = trunc(_2526);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    bool _2562 = uint(_2494) >= 2u;
    float _2564 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2500)
    {
        _2538 = _2542;
    }
    float _2566 = _2538;
    uint _2568 = uint(int(uint(_2508) >> uint(2)));
    uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
    int _2572 = int(_2568) & 3;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[int(_2570)][_2572];
    int _2576 = int(_2568) + 1;
    uint _2578 = uint(int(uint(_2576) >> uint(2)));
    int _2580 = _2576 & 3;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[int(_2578)][_2580];
    float _2584 = _2566;
    if (!_2500)
    {
        _2548 = _2436;
    }
    float _2586 = _2548;
    int _2588 = _2562 ? 0 : 1;
    out.m_79.x = _2564;
    out.m_79.y = _2474;
    out.m_79.z = _2492;
    out.m_79.w = _2486;
    bool _2590 = uint(_2546) >= uint(_592);
    if (!_2500)
    {
        float _2592 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2586);
        _2584 = _2592;
    }
    float _2594 = _2584;
    float _2596 = 0.0;
    if (_2500)
    {
        _2596 = _2438;
    }
    float _2598 = _2596;
    int _2600 = ~_592;
    int _2602 = _2600 + 1;
    float _2604 = _2598;
    if (_2500)
    {
        _2540 = _2598;
    }
    float _2606 = _2540;
    int _2608 = int(_2328) + int(_2466);
    float _2610 = _2606;
    if (!_2500)
    {
        _2604 = _2438;
    }
    float _2612 = _2604;
    int _2614 = _2470 >> 31;
    int _2616 = _2602 * int(_2560);
    int _2618 = _2616 + _1837;
    bool _2620 = !_2590;
    int _2622 = _2620 ? 0 : (-1);
    if (!_2500)
    {
        float _2624 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2612);
        _2610 = _2624;
    }
    float _2626 = _2610;
    bool _2628 = _2494 != 3;
    int _2630 = ~_2476;
    int _2632 = _2630 + _2622;
    int _2634 = _2632 + 1;
    int _2636 = ~_560;
    int _2638 = _2636 + 1;
    float _2640 = float(uint(_2618));
    int _2642 = _592 * _2634;
    int _2644 = _2642 + _1867;
    int _2646 = _2614 & 3;
    int _2648 = _2638 * _2608;
    int _2650 = _2648 + _1845;
    int _2652 = ~_2588;
    int _2654 = _2652 + 1;
    int _2656 = _2654 + 1;
    float _2658 = as_type<float>(_1558) * _2640;
    bool _2660 = !_1767;
    int _2662 = _2660 ? _2644 : (-1);
    float _2664 = _2520 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2666 = _2656;
    if (_2628)
    {
        int _2668 = ~_2588;
        int _2670 = _2668 + 1;
        _2666 = _2670;
    }
    int _2672 = _2666;
    float _2674 = trunc(_2658);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    int _2680 = _2662 >> 31;
    float _2682 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2684 = uint(_2650) >= uint(_560);
    int _2686 = _2470 + _2646;
    float _2688 = in.m_81.x;
    float _2690 = in.m_81.y;
    float _2692 = in.m_81.z;
    float _2694 = in.m_81.w;
    int _2696 = _2680 & 3;
    bool _2698 = !_2684;
    int _2700 = _2698 ? 0 : (-1);
    int _2702 = _2662 + _2696;
    float _2704 = _2574 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2706 = _2662 & 3;
    bool _2708 = _2706 != 0;
    float _2710 = _2582 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2712 = _2686 >> 2;
    float _2714 = _2704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2716 = _2702 >> 2;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2720 = _2708 ? 0 : 1;
    int _2722 = _2712 << 4;
    int _2724 = _2722 + 368;
    bool _2726 = uint(_2706) >= 2u;
    out.m_83.x = _2714;
    out.m_83.y = _2718;
    out.m_83.z = _2682;
    int _2728 = _2716 << 4;
    int _2730 = _2728 + 512;
    float _2732 = 0.0;
    if (_2500)
    {
        _2732 = _2440;
    }
    float _2734 = _2732;
    uint _2736 = uint(int(uint(_2724) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    int _2752 = _2726 ? 0 : 1;
    bool _2754 = uint(_2706) > 1u;
    int _2756 = int(_2560) + int(_2678);
    float _2758 = as_type<float>(_2678);
    float _2760 = _2734;
    if (_2500)
    {
        _2758 = _2734;
    }
    float _2762 = _2758;
    uint _2764 = uint(int(uint(_2730) >> uint(2)));
    uint _2766 = uint(int(uint(int(_2764)) >> uint(2)));
    int _2768 = int(_2764) & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    int _2772 = int(_2764) + 1;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    int _2776 = _2772 & 3;
    float _2778 = (*spvDescriptorSet0.vp_c9)._m0[int(_2774)][_2776];
    int _2780 = ~_592;
    int _2782 = _2780 + 1;
    float _2784 = _2762;
    if (!_2500)
    {
        _2760 = _2440;
    }
    float _2786 = _2760;
    float _2788 = _2688 * _2612;
    int _2790 = ~_2720;
    int _2792 = _2790 + 1;
    int _2794 = _2792 + 1;
    int _2796 = _2782 * _2756;
    int _2798 = _2796 + _1837;
    int _2800 = abs(_2672);
    float _2802 = _2690 * _2786;
    int _2804 = _2794;
    if (!_2754)
    {
        int _2806 = ~_2720;
        int _2808 = _2806 + 1;
        _2804 = _2808;
    }
    int _2810 = _2804;
    int _2812 = _2730 + 8;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    bool _2830 = uint(_2798) >= uint(_592);
    float _2832 = -_2802;
    float _2834 = fma(_2692, _2612, _2832);
    float _2836 = _2692 * _2586;
    if (!_2500)
    {
        float _2838 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2786);
        _2784 = _2838;
    }
    float _2840 = _2784;
    bool _2842 = !_2830;
    int _2844 = _2842 ? 0 : (-1);
    float _2846 = -_2788;
    float _2848 = fma(_2690, _2586, _2846);
    bool _2850 = _2706 != 3;
    int _2852 = _2724 + 8;
    uint _2854 = uint(int(uint(_2852) >> uint(2)));
    uint _2856 = uint(int(uint(int(_2854)) >> uint(2)));
    int _2858 = int(_2854) & 3;
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[int(_2856)][_2858];
    int _2862 = int(_2854) + 1;
    uint _2864 = uint(int(uint(_2862) >> uint(2)));
    int _2866 = _2862 & 3;
    float _2868 = (*spvDescriptorSet0.vp_c9)._m0[int(_2864)][_2866];
    bool _2870 = !_2496;
    int _2872 = _2870 ? 0 : 1;
    float _2874 = -_2836;
    float _2876 = fma(_2688, _2786, _2874);
    int _2878 = _2662 & 3;
    bool _2880 = _2878 != 0;
    float _2882 = _2834 * _2694;
    int _2884 = abs(_2554);
    float _2886 = _2876 * _2694;
    int _2888 = abs(_2872);
    float _2890 = _2848 * _2694;
    int _2892 = ~_2752;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    int _2898 = _2896;
    if (_2850)
    {
        int _2900 = ~_2752;
        int _2902 = _2900 + 1;
        _2898 = _2902;
    }
    int _2904 = _2898;
    int _2906 = abs(_2810);
    bool _2908 = _2494 != 3;
    int _2910 = ~_2884;
    int _2912 = _2910 + 1;
    int _2914 = _2912 + 1;
    float _2916 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2918 = int(_2916);
    bool _2920 = !_2880;
    int _2922 = _2920 ? 0 : 1;
    int _2924 = _2914 * as_type<int>(_2750);
    int _2926 = ~_2888;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    int _2932 = ~_2906;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    int _2938 = abs(_2922);
    int _2940 = _2930 * as_type<int>(_2742);
    int _2942 = _2940 + _2924;
    bool _2944 = !_2908;
    int _2946 = _2944 ? 0 : (-1);
    float _2948 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2950 = int(_2948);
    bool _2952 = _2706 != 3;
    int _2954 = _2936 * as_type<int>(_2778);
    int _2956 = ~_2938;
    int _2958 = _2956 + 1;
    int _2960 = _2958 + 1;
    int _2962 = abs(_2946);
    bool _2964 = !_2952;
    int _2966 = _2964 ? 0 : (-1);
    int _2968 = _2960 * as_type<int>(_2770);
    int _2970 = _2968 + _2954;
    int _2972 = ~_2800;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    int _2978 = abs(_2904);
    int _2980 = _2976 * as_type<int>(_2860);
    int _2982 = _2980 + _2942;
    int _2984 = abs(_2966);
    float _2986 = _1306 * _2890;
    int _2988 = ~_2962;
    int _2990 = _2988 + 1;
    int _2992 = _2990 + 1;
    float _2994 = _1304 * _2890;
    int _2996 = ~_2978;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2992 * as_type<int>(_2868);
    int _3004 = _3002 + _2982;
    int _3006 = ~_2608;
    int _3008 = _3006 + _2700;
    int _3010 = _3008 + 1;
    float _3012 = fma(_1326, _2882, _2994);
    bool _3014 = !_2444;
    int _3016 = _3014 ? 0 : 1;
    int _3018 = _3000 * as_type<int>(_2820);
    int _3020 = _3018 + _2970;
    int _3022 = ~_2984;
    int _3024 = _3022 + 1;
    int _3026 = _3024 + 1;
    int _3028 = _560 * _3010;
    int _3030 = _3028 + _1845;
    float _3032 = float(uint(_2918));
    float _3034 = _1306 * _2692;
    int _3036 = abs(_3016);
    int _3038 = _3026 * as_type<int>(_2828);
    int _3040 = _3038 + _3020;
    int _3042 = abs(_2918);
    float _3044 = fma(_1338, _2882, _2986);
    float _3046 = float(uint(_2950));
    float _3048 = 1.0 / _3032;
    bool _3050 = !_2450;
    int _3052 = _3050 ? 0 : 1;
    float _3054 = -_2886;
    float _3056 = fma(_1334, _3054, _3012);
    int _3058 = ~_3036;
    int _3060 = _3058 + 1;
    int _3062 = _3060 + 1;
    int _3064 = ~_2756;
    int _3066 = _3064 + _2844;
    int _3068 = _3066 + 1;
    float _3070 = 1.0 / _3046;
    int _3072 = abs(_3052);
    int _3074 = _3004 * _3062;
    bool _3076 = !_1522;
    int _3078 = _3076 ? _3030 : (-1);
    int _3080 = _592 * _3068;
    int _3082 = _3080 + _1837;
    float _3084 = float(uint(_3042));
    float _3086 = -_2692;
    float _3088 = _1312 * _3086;
    int _3090 = ~_3072;
    int _3092 = _3090 + 1;
    int _3094 = _3092 + 1;
    int _3096 = _3078 * _3036;
    int _3098 = _3096 + _3074;
    float _3100 = _1304 * _2692;
    bool _3102 = !_1767;
    int _3104 = _3102 ? _3082 : (-1);
    float _3106 = 1.0 / _3084;
    int _3108 = abs(_2950);
    int _3110 = _3094 * _3040;
    float _3112 = -_2840;
    float _3114 = _1312 * _3112;
    int _3116 = as_type<int>(_3048) + (-2);
    float _3118 = -_2890;
    float _3120 = _1312 * _3118;
    float _3122 = float(uint(_3108));
    int _3124 = _3104 * _3072;
    int _3126 = _3124 + _3110;
    float _3128 = float(uint(_3098));
    float _3130 = fma(_1324, _2594, _3114);
    float _3132 = 1.0 / _3122;
    int _3134 = abs(_3098);
    float _3136 = fma(_1324, _2688, _3088);
    float _3138 = float(uint(_3126));
    float _3140 = as_type<float>(_3116) * _3128;
    float _3142 = fma(_1324, _2882, _3120);
    int _3144 = ~_2918;
    int _3146 = _3144 + 1;
    float _3148 = _1304 * _2840;
    float _3150 = _1306 * _2840;
    int _3152 = as_type<int>(_3070) + (-2);
    float _3154 = trunc(_3140);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = as_type<int>(_3106) + (-2);
    float _3162 = fma(_1338, _2594, _3150);
    int _3164 = abs(_3126);
    float _3166 = as_type<float>(_3152) * _3138;
    float _3168 = float(uint(_3134));
    float _3170 = fma(_1338, _2688, _3034);
    int _3172 = as_type<int>(_3132) + (-2);
    float _3174 = -_2886;
    float _3176 = fma(_1318, _3174, _3142);
    float _3178 = float(uint(_3164));
    float _3180 = trunc(_3166);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    float _3186 = as_type<float>(_3160) * _3168;
    int _3188 = ~_2950;
    int _3190 = _3188 + 1;
    float _3192 = -_2219;
    float _3194 = _3192 + 1.0;
    float _3196 = fma(_1326, _2594, _3148);
    float _3198 = as_type<float>(_3172) * _3178;
    float _3200 = trunc(_3186);
    float _3202 = precise::max(_3200, 0.0);
    uint _3204 = uint(_3202);
    int _3206 = _3146 * int(_3158);
    int _3208 = _3206 + _3098;
    int _3210 = ~_3042;
    int _3212 = _3210 + 1;
    float _3214 = fma(_1326, _2688, _3100);
    float _3216 = _2372 * _2245;
    float _3218 = -_2372;
    float _3220 = _3218 + 1.0;
    float _3222 = float(uint(_3208));
    float _3224 = trunc(_3198);
    float _3226 = precise::max(_3224, 0.0);
    uint _3228 = uint(_3226);
    int _3230 = _3190 * int(_3184);
    int _3232 = _3230 + _3126;
    float _3234 = as_type<float>(_3116) * _3222;
    int _3236 = ~_3108;
    int _3238 = _3236 + 1;
    float _3240 = float(uint(_3232));
    int _3242 = _3212 * int(_3204);
    int _3244 = _3242 + _3134;
    float _3246 = trunc(_3234);
    float _3248 = precise::max(_3246, 0.0);
    uint _3250 = uint(_3248);
    float _3252 = as_type<float>(_3152) * _3240;
    float _3254 = -_2626;
    float _3256 = fma(_1318, _3254, _3130);
    float _3258 = float(uint(_3244));
    float _3260 = -_2690;
    float _3262 = fma(_1318, _3260, _3136);
    float _3264 = -_2690;
    float _3266 = fma(_1334, _3264, _3214);
    int _3268 = _3238 * int(_3228);
    int _3270 = _3268 + _3164;
    float _3272 = -_2626;
    float _3274 = fma(_1334, _3272, _3196);
    float _3276 = as_type<float>(_3160) * _3258;
    float _3278 = trunc(_3252);
    float _3280 = precise::max(_3278, 0.0);
    uint _3282 = uint(_3280);
    float _3284 = -_2690;
    float _3286 = fma(_1346, _3284, _3170);
    float _3288 = float(uint(_3270));
    float _3290 = -_2626;
    float _3292 = fma(_1346, _3290, _3162);
    float _3294 = _3266 * _320;
    float _3296 = _3266 * _312;
    float _3298 = _3266 * _324;
    float _3300 = as_type<float>(_3172) * _3288;
    float _3302 = trunc(_3276);
    float _3304 = precise::max(_3302, 0.0);
    uint _3306 = uint(_3304);
    float _3308 = _3274 * _312;
    float _3310 = _3056 * _312;
    int _3312 = ~_2918;
    int _3314 = _3312 + 1;
    float _3316 = fma(_3262, _294, _3294);
    float _3318 = fma(_3262, _290, _3296);
    float _3320 = fma(_3262, _298, _3298);
    int _3322 = int(_3158) + int(_3250);
    float _3324 = trunc(_3300);
    float _3326 = precise::max(_3324, 0.0);
    uint _3328 = uint(_3326);
    int _3330 = ~_2950;
    int _3332 = _3330 + 1;
    float _3334 = _3274 * _320;
    float _3336 = _3056 * _320;
    int _3338 = int(_3184) + int(_3282);
    float _3340 = _3274 * _324;
    int _3342 = ~_3108;
    int _3344 = _3342 + 1;
    float _3346 = fma(_3176, _294, _3336);
    int _3348 = int(_3204) + int(_3306);
    float _3350 = _3056 * _324;
    float _3352 = fma(_3256, _294, _3334);
    int _3354 = ~_3042;
    int _3356 = _3354 + 1;
    float _3358 = fma(_3176, _290, _3310);
    float _3360 = fma(_3176, _298, _3350);
    int _3362 = _3314 * _3322;
    int _3364 = _3362 + _3098;
    int _3366 = int(_3228) + int(_3328);
    int _3368 = _3356 * _3348;
    int _3370 = _3368 + _3134;
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3374 = uint(_3364) >= uint(_2918);
    int _3376 = _3344 * _3366;
    int _3378 = _3376 + _3164;
    bool _3380 = uint(_3370) >= uint(_3042);
    int _3382 = _3332 * _3338;
    int _3384 = _3382 + _3126;
    bool _3386 = !_3374;
    int _3388 = _3386 ? 0 : (-1);
    float _3390 = fma(_3256, _290, _3308);
    bool _3392 = uint(_3378) >= uint(_3108);
    float _3394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3396 = uint(_3384) >= uint(_2950);
    float _3398 = -_2886;
    float _3400 = fma(_1346, _3398, _3044);
    int _3402 = ~_3322;
    int _3404 = _3402 + _3388;
    int _3406 = _3404 + 1;
    float _3408 = fma(_3256, _298, _3340);
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    float _3414 = fma(_3292, _332, _3352);
    bool _3416 = _2918 == 0;
    int _3418 = _2918 * _3406;
    int _3420 = _3418 + _3098;
    bool _3422 = _2918 == 0;
    float _3424 = fma(_3292, _328, _3390);
    int _3426 = _3098 ^ _2918;
    float _3428 = fma(_3292, _336, _3408);
    int _3430 = _3126 ^ _2950;
    float _3432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3434 = !_3380;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = !_3392;
    int _3440 = _3438 ? 0 : (-1);
    float _3442 = _2266 * _3216;
    uint _3444 = uint(int(uint(_3430) >> uint(31)));
    out.m_85.x = _3414;
    out.m_85.y = _3424;
    out.m_85.z = _3428;
    int _3446 = ~_3338;
    int _3448 = _3446 + _3412;
    int _3450 = _3448 + 1;
    float _3452 = fma(_2256, _3442, _2254);
    bool _3454 = !_3416;
    int _3456 = _3454 ? _3420 : (-1);
    int _3458 = ~_3436;
    int _3460 = _3348 + _3458;
    int _3462 = _3460 + 1;
    int _3464 = _2950 * _3450;
    int _3466 = _3464 + _3126;
    float _3468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3470 = ~_3440;
    int _3472 = _3366 + _3470;
    int _3474 = _3472 + 1;
    float _3476 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _3478 = uint(int(uint(_3426) >> uint(31)));
    int _3480 = ~int(_3444);
    int _3482 = _3480 + 1;
    float _3484 = fma(_3476, _2404, -0.5);
    float _3486 = float(_3456);
    bool _3488 = _2950 == 0;
    int _3490 = ~int(_3478);
    int _3492 = _3490 + 1;
    float _3494 = fma(_3476, _3486, _514);
    int _3496 = _3474 ^ _3482;
    bool _3498 = !_3488;
    int _3500 = _3498 ? _3466 : (-1);
    float _3502 = _3468 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3504 = _2950 == 0;
    float _3506 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3508 = _3462 ^ _3492;
    float _3510 = fma(_626, _3484, _3494);
    int _3512 = ~_3482;
    int _3514 = _3512 + _3496;
    int _3516 = _3514 + 1;
    float _3518 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3520 = float(_3500);
    float _3522 = fma(_3506, _2434, -0.5);
    int _3524 = ~_3492;
    int _3526 = _3524 + _3508;
    int _3528 = _3526 + 1;
    float _3530 = fma(_3518, _2356, -0.5);
    bool _3532 = !_3504;
    int _3534 = _3532 ? _3516 : (-1);
    float _3536 = fma(_3506, _3520, _606);
    bool _3538 = !_3422;
    int _3540 = _3538 ? _3528 : (-1);
    float _3542 = fma(_3400, _332, _3346);
    float _3544 = float(_3534);
    float _3546 = fma(_3502, _2366, -0.5);
    float _3548 = float(_3540);
    float _3550 = fma(_594, _3522, _3536);
    float _3552 = _2256 * _3220;
    float _3554 = -_644;
    float _3556 = fma(_3502, _3544, _3554);
    float _3558 = fma(_3400, _328, _3358);
    float _3560 = -_516;
    float _3562 = fma(_3518, _3548, _3560);
    float _3564 = fma(_3286, _332, _3316);
    float _3566 = fma(_536, _3546, _3556);
    float _3568 = fma(_3286, _328, _3318);
    float _3570 = fma(_3286, _336, _3320);
    float _3572 = fma(_3400, _336, _3360);
    float _3574 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3576 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_87.x = _3564;
    out.m_87.y = _3568;
    out.m_87.z = _3570;
    float _3578 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3574);
    float _3580 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3576);
    float _3582 = fma(_632, _3530, _3562);
    float _3584 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3578);
    float _3586 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3580);
    float _3588 = _3550 + 0.5;
    float _3590 = _3510 + 0.5;
    float _3592 = _3566 + 0.5;
    float _3594 = _3586 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3596 = _3582 + 0.5;
    float _3598 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_89.x = _3542;
    out.m_89.y = _3558;
    out.m_89.z = _3572;
    bool _3600 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3602 = isnan(_1905);
    bool _3604 = _3600 || _3602;
    bool _3606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3608 = _3604 || _3606;
    float _3610 = 1.0 / _3598;
    float _3612 = _3594 + _3598;
    out.m_91.x = _3590;
    out.m_91.y = _3596;
    out.m_91.z = _3588;
    out.m_91.w = _3592;
    float _3614 = in.m_63.x;
    float _3616 = _2193 * 0.5;
    float _3618 = _3612 * _3610;
    float _3620 = _3618 * 0.5;
    float _3622 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3624 = fma(_3620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3622);
    float _3626 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2320);
    float _3628 = 1.0 / _3624;
    float _3630 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3626);
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2221;
    out.gl_Position.z = _3630;
    out.gl_Position.w = _2193;
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3634 = _3628 * _3632;
    float _3636 = abs(_3634);
    float _3638 = log2(_3636);
    float _3640 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3642 = exp2(_3640);
    float _3644 = fma(_3642, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3646 = precise::clamp(_3644, 0.0, 1.0);
    float _3648 = _3630 + _2193;
    float _3650 = fma(_3646, -2.0, 3.0);
    float _3652 = _3646 * _3646;
    bool _3654 = _3634 <= 8000.0;
    bool _3656 = isnan(_3634);
    bool _3658 = _3654 || _3656;
    bool _3660 = isnan(8000.0);
    bool _3662 = _3658 || _3660;
    float _3664 = float(_3662);
    float _3666 = fma(_2221, -0.5, _3616);
    float _3668 = _3652 * _3650;
    float _3670 = _3648 * 0.5;
    float _3672 = -_3668;
    float _3674 = _3672 + 1.0;
    float _3676 = fma(_3674, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3668);
    float _3678 = _2217 + _2193;
    float _3680 = _3664 * _3676;
    float _3682 = _3678 * 0.5;
    float _3684 = _2193;
    float _3686 = _3670;
    float _3688 = _3666;
    float _3690 = _3682;
    if (!_3608)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3692 = _2348;
    float _3694 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_93.x = _3682;
    out.m_93.y = _3666;
    out.m_93.z = _3670;
    out.m_93.w = _2193;
    float _3696 = _3194 * _3694;
    float _3698 = precise::clamp(_3696, 0.0, 1.0);
    float _3700 = -_3698;
    float _3702 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3704 = _2256 * _3216;
    float _3706 = _3702 * _3614;
    float _3708 = fma(_2262, _3704, _2250);
    float _3710 = fma(_2264, _3704, _2252);
    float _3712 = _3706 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3714 = _3706;
    float _3716 = _3692;
    float _3718 = _3692;
    if (!_3608)
    {
        _3714 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3720 = _3714;
    out.m_95.x = _3708;
    out.m_95.y = _3710;
    out.m_95.z = _3452;
    out.m_95.w = _3552;
    float _3722 = _3720;
    float _3724 = _3720;
    if (!_3608)
    {
        _3684 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3726 = _3684;
    float _3728 = _3726;
    float _3730 = _3726;
    if (!_3608)
    {
        _3686 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3732 = _3686;
    out.m_97.x = _3712;
    float _3734 = _3732;
    float _3736 = _3732;
    if (!_3608)
    {
        _3688 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3738 = _3688;
    float _3740 = _3738;
    float _3742 = _3738;
    if (!_3608)
    {
        _3690 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3744 = _3690;
    bool _3746 = !_3608;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3746)
    {
        bool _3752 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3754 = isnan(_1905);
        bool _3756 = _3752 || _3754;
        bool _3758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3760 = _3756 || _3758;
        if (!_3760)
        {
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3764 = _1905 + _3762;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3766;
            float _3770 = 1.0 / _3768;
            float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3792 = _3764 * _3770;
            float _3794 = precise::clamp(_3792, 0.0, 1.0);
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3800 = fma(_3794, _3774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3802 = fma(_3794, _3798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3804 = fma(_3794, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3806 = fma(_3794, _3782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3808 = fma(_3794, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3810 = fma(_3794, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3718 = _3802;
            _3742 = _3808;
            _3724 = _3800;
            _3736 = _3806;
            _3730 = _3804;
            _3750 = _3810;
            _3812 = true;
        }
        else
        {
            bool _3814 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3816 = isnan(_1905);
            bool _3818 = _3814 || _3816;
            bool _3820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3822 = _3818 || _3820;
            if (!_3822)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3824 = _3722;
            _3724 = _3824;
            if (!_3822)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3826 = _3716;
            _3718 = _3826;
            if (!_3822)
            {
                _3728 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3828 = _3728;
            _3730 = _3828;
            if (!_3822)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3830 = _3734;
            _3736 = _3830;
            if (!_3822)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3832 = _3740;
            _3742 = _3832;
            if (!_3822)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3834 = _3748;
            bool _3836 = !_3822;
            _3750 = _3834;
            if (!_3836)
            {
                bool _3838 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3840 = isnan(_1905);
                bool _3842 = _3838 || _3840;
                bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3846 = _3842 || _3844;
                if (!_3846)
                {
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3850 = _1905 + _3848;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3852;
                    float _3856 = 1.0 / _3854;
                    float _3858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3878 = _3850 * _3856;
                    float _3880 = precise::clamp(_3878, 0.0, 1.0);
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3886 = fma(_3880, _3860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3888 = fma(_3880, _3884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3890 = fma(_3880, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3892 = fma(_3880, _3868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3894 = fma(_3880, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3896 = fma(_3880, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3718 = _3888;
                    _3742 = _3894;
                    _3724 = _3886;
                    _3736 = _3892;
                    _3730 = _3890;
                    _3750 = _3896;
                    _3812 = true;
                }
                else
                {
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3730 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3812 = false;
    float _3898 = _3718;
    float _3900 = _3742;
    float _3902 = _3724;
    float _3904 = _3736;
    float _3906 = _3730;
    float _3908 = _3750;
    float _3910 = fma(_3424, -0.5, 0.5);
    float _3912 = precise::clamp(_3910, 0.0, 1.0);
    float _3914 = -_3898;
    float _3916 = _3914 + _3900;
    float _3918 = -_3902;
    float _3920 = _3918 + _3904;
    float _3922 = -_3906;
    float _3924 = _3922 + _3908;
    bool _3926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3928 = fma(_3912, _3916, _3898);
    float _3930 = fma(_3912, _3920, _3902);
    float _3932 = fma(_3912, _3924, _3906);
    float _3934 = _3928 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _3936 = fma(_3930, 0.298911988735198974609375, _3934);
    float _3938 = fma(_3932, 0.114477999508380889892578125, _3936);
    float _3940 = -_3938;
    float _3942 = _3930 + _3940;
    float _3944 = -_3938;
    float _3946 = _3928 + _3944;
    float _3948 = -_3938;
    float _3950 = _3932 + _3948;
    float _3952 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3954 = fma(_3942, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    float _3956 = fma(_3946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    float _3958 = fma(_3950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    out.m_51.x = _3952;
    out.m_101.x = _3954;
    out.m_101.y = _3956;
    out.m_101.z = _3958;
    if (!_3926)
    {
        return out;
    }
    float _3960 = -_1891;
    float _3962 = _3960 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3964 = -_1875;
    float _3966 = _3964 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3968 = -_1500;
    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3972 = _3962 * _3962;
    float _3974 = fma(_3966, _3966, _3972);
    float _3976 = fma(_3970, _3970, _3974);
    float _3978 = sqrt(_3976);
    float _3980 = rsqrt(_3976);
    float _3982 = -_3978;
    float _3984 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3986 = _3984 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3988 = precise::clamp(_3986, 0.0, 1.0);
    float _3990 = _3966 * _3980;
    float _3992 = _3962 * _3980;
    float _3994 = abs(_3988);
    float _3996 = log2(_3994);
    float _3998 = _3970 * _3980;
    float _4000 = _3990 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4002 = _3424 * _3992;
    float _4004 = -_3992;
    float _4006 = -_4000;
    float _4008 = fma(_4004, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4006);
    float _4010 = fma(_3414, _3990, _4002);
    float _4012 = -_3998;
    float _4014 = fma(_4012, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4008);
    float _4016 = fma(_3428, _3998, _4010);
    float _4018 = precise::clamp(_4016, 0.0, 1.0);
    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4022 = _4014 + _4020;
    float _4024 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4026 = _4022 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4028 = precise::clamp(_4026, 0.0, 1.0);
    float _4030 = exp2(_4024);
    float _4032 = _4030 * _4028;
    float _4034 = _4018 * _4032;
    float _4036 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4038 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4040 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _4036;
    out.m_99.y = _4038;
    out.m_99.z = _4040;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3812 = false;
    bool _358 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _115 = in.m_48.w;
    float _117 = trunc(_115);
    int _120 = int(_117);
    bool _124 = _120 >= 1;
    float _126 = 0.0;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _126;
    float _130 = _128;
    if (!_124)
    {
        out.m_51.x = 0.0;
    }
    int _132 = 0;
    if (!_124)
    {
        float _134 = _128 * 5.0;
        _132 = as_type<int>(_134);
    }
    int _136 = _132;
    int _138 = _136;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4097 = as_type<float>(_136);
        out.gl_Position.z = _4097;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _140 = in.m_53.w;
    bool _142 = _140 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_140);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = -_140;
    float _154 = _152 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _156 = _154;
    if (_150)
    {
        float _158 = float(_120);
        _130 = _158;
    }
    float _160 = _130;
    bool _162 = _154 >= _160;
    bool _164 = !_150;
    bool _166 = _162 || _164;
    float _168 = _160;
    if (_166)
    {
        _168 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _170 = _168;
    if (_166)
    {
        out.m_51.x = 0.0;
    }
    if (_166)
    {
        float _172 = _170 * 5.0;
        _138 = as_type<int>(_172);
    }
    int _174 = _138;
    if (_166)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4167 = as_type<float>(_174);
        out.gl_Position.z = _4167;
    }
    if (_166)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _176 = in.m_55.x;
    float _178 = in.m_55.y;
    float _180 = in.m_55.z;
    float _182 = in.m_57.x;
    float _184 = in.m_57.y;
    float _186 = in.m_57.z;
    float _188 = in.m_59.x;
    float _190 = in.m_59.y;
    float _192 = in.m_59.z;
    float _194 = _176 * _176;
    float _196 = _178 * _178;
    float _198 = _180 * _180;
    float _200 = fma(_182, _182, _194);
    float _202 = fma(_184, _184, _196);
    float _204 = fma(_186, _186, _198);
    float _206 = fma(_188, _188, _200);
    float _208 = fma(_190, _190, _202);
    float _210 = fma(_192, _192, _204);
    float _212 = sqrt(_206);
    float _214 = sqrt(_208);
    float _216 = sqrt(_210);
    bool _218 = _212 > 0.0;
    bool _220 = _214 > 0.0;
    float _222 = _214;
    float _224 = _208;
    float _226 = _206;
    int _228 = as_type<int>(_188);
    float _230 = _192;
    if (_218)
    {
        float _232 = rsqrt(_206);
        _222 = _232;
    }
    float _234 = _222;
    float _236 = 0.0;
    if (!_218)
    {
        _236 = 0.0;
    }
    float _238 = _236;
    bool _240 = _216 > 0.0;
    float _242 = 0.0;
    float _244 = _238;
    if (!_218)
    {
        _242 = 0.0;
    }
    float _246 = _242;
    float _248 = 0.0;
    float _250 = _246;
    if (!_218)
    {
        _248 = 0.0;
    }
    float _252 = _248;
    float _254 = _216;
    float _256 = _252;
    if (_220)
    {
        float _258 = rsqrt(_208);
        _254 = _258;
    }
    float _260 = _254;
    float _262 = 0.0;
    if (!_220)
    {
        _262 = 0.0;
    }
    float _264 = _262;
    float _266 = 0.0;
    float _268 = _264;
    if (!_220)
    {
        _266 = 0.0;
    }
    float _270 = _266;
    float _272 = 0.0;
    float _274 = _270;
    if (!_220)
    {
        _272 = 0.0;
    }
    float _276 = _272;
    float _278 = _212;
    float _280 = _276;
    if (_240)
    {
        float _282 = rsqrt(_210);
        _278 = _282;
    }
    float _284 = _278;
    float _286 = _234;
    if (_218)
    {
        float _288 = _234 * _176;
        _244 = _288;
    }
    float _290 = _244;
    if (_218)
    {
        float _292 = _234 * _182;
        _250 = _292;
    }
    float _294 = _250;
    if (_218)
    {
        float _296 = _234 * _188;
        _256 = _296;
    }
    float _298 = _256;
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    if (!_240)
    {
        _224 = 0.0;
    }
    float _302 = _224;
    float _304 = _302;
    if (!_240)
    {
        _286 = 0.0;
    }
    float _306 = _286;
    float _308 = _306;
    if (_220)
    {
        float _310 = _260 * _178;
        _268 = _310;
    }
    float _312 = _268;
    if (!_240)
    {
        _226 = 0.0;
    }
    float _314 = _226;
    float _316 = _314;
    if (_220)
    {
        float _318 = _260 * _184;
        _274 = _318;
    }
    float _320 = _274;
    if (_220)
    {
        float _322 = _260 * _190;
        _280 = _322;
    }
    float _324 = _280;
    if (_240)
    {
        float _326 = _284 * _180;
        _304 = _326;
    }
    float _328 = _304;
    if (_240)
    {
        float _330 = _284 * _186;
        _308 = _330;
    }
    float _332 = _308;
    if (_240)
    {
        float _334 = _284 * _192;
        _316 = _334;
    }
    float _336 = _316;
    bool _338 = !_300;
    float _356;
    if (!_338)
    {
        float _340 = in.m_61.x;
        float _342 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _344 = _340 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _346 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[12].x, _154);
        float _348 = _346 * _342;
        float _350 = floor(_348);
        float _352 = -_350;
        float _354 = _348 + _352;
        _356 = _354;
        _358 = true;
    }
    else
    {
        float _360 = float(_120);
        float _362 = 1.0 / _360;
        float _364 = _154 * _362;
        _356 = _364;
    }
    _358 = false;
    float _366 = _356;
    float _368 = in.m_48.x;
    float _370 = in.m_48.y;
    float _372 = in.m_48.z;
    float _374 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _376 = int(_374);
    float _378 = in.m_63.y;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _380;
    int _384 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _386 = _384 != 0;
    float _388 = in.m_61.x;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _394 = 1.0 / _382;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _398 = _366 + _396;
    float _400 = in.m_61.y;
    float _402 = in.m_57.w;
    float _404 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _406 = int(_404);
    float _408 = float(_376);
    float _410 = in.m_61.z;
    float _412 = _190 * _370;
    float _414 = _184 * _370;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _418 = fma(_188, _368, _412);
    float _420 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    if (_386)
    {
        _228 = 0;
    }
    int _422 = _228;
    float _424 = _370 + _378;
    int _426 = _422;
    if (!_386)
    {
        _426 = 1;
    }
    int _428 = _426;
    float _430 = _388 * 2.0;
    float _432 = fma(_182, _368, _414);
    float _434 = _388 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _436 = _428 != 1;
    float _438 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _440 = log2(_438);
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _444 = _366 + _442;
    float _446 = -_416;
    float _448 = fma(_434, 2.0, _446);
    float _450 = fma(_186, _372, _432);
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _454 = _400 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _456 = floor(_430);
    float _458 = _444 * _394;
    float _460 = fma(_454, -2.0, _452);
    float _462 = _444;
    if (!_436)
    {
        _462 = _410;
    }
    float _464 = _462;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _468 = _464;
    if (_436)
    {
        _468 = _400;
    }
    float _470 = _468;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _472;
    float _476 = 1.0 / _392;
    float _478 = fma(_192, _372, _418);
    float _480 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[83].w, _466);
    float _482 = _440 * _154;
    float _484 = _474;
    float _486 = _470;
    if (!_436)
    {
        _230 = _400;
    }
    float _488 = _230;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _496 = 1.0 / _474;
    bool _498 = _456 > 0.0;
    float _500 = _400 * 2.0;
    bool _502 = _456 >= 0.0;
    bool _504 = isnan(_456);
    bool _506 = _502 || _504;
    bool _508 = isnan(0.0);
    bool _510 = _506 || _508;
    float _512 = -_154;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _448);
    float _516 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[76].y, _460);
    float _518 = _488;
    if (_436)
    {
        _518 = _388;
    }
    float _520 = _518;
    float _522 = exp2(_482);
    if (!_436)
    {
        _484 = _400;
    }
    float _524 = _484;
    float _526 = _398 * _476;
    float _528 = _524;
    if (_436)
    {
        _528 = _388;
    }
    float _530 = _528;
    float _532 = _520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (!_436)
    {
        _486 = _410;
    }
    float _534 = _486;
    float _536 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].w, _480);
    float _538 = 1.0 / _492;
    float _540 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[83].z, _494);
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _544 = _534;
    if (_436)
    {
        _544 = _400;
    }
    float _546 = _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _550 = 1.0 + _548;
    float _552 = float(_406);
    float _554 = -_542;
    float _556 = fma(_532, 2.0, _554);
    float _558 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _560 = int(_558);
    float _562 = _546 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _564 = -_522;
    float _566 = _564 + 1.0;
    bool _568 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _570 = isnan(1.0);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _576 = _572 || _574;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _580 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _588 = _584 || _586;
    float _590 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _592 = int(_590);
    float _594 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[82].z, _540);
    float _596 = fma(_562, -2.0, _578);
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _602 = _588 ? _566 : 0.0;
    float _604 = -_154;
    float _606 = fma(_604, (*spvDescriptorSet0.vp_c9)._m0[81].x, _556);
    float _608 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[78].z, _598);
    float _610 = 1.0 / _408;
    float _612 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[78].w, _600);
    int _614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _616 = _614 != 0;
    int _618 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _620 = _618 != 0;
    int _622 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _624 = _622 != 0;
    float _626 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].z, _608);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _630 = _366 + _628;
    float _632 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[77].w, _612);
    int _634 = _510 ? 0 : 1;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _638 = _366 + _636;
    float _640 = 1.0 / _552;
    float _642 = float(_560);
    float _644 = fma(_154, (*spvDescriptorSet0.vp_c9)._m0[81].y, _596);
    float _646 = float(_592);
    float _648 = _638 * _538;
    int _650 = ~_634;
    int _652 = _650 + 1;
    int _654 = _652 + 1;
    float _656 = _642 * _154;
    int _658 = _654;
    if (!_498)
    {
        int _660 = ~_634;
        int _662 = _660 + 1;
        _658 = _662;
    }
    int _664 = _658;
    float _666 = 1.0 / _550;
    float _668 = _610 * _154;
    float _670 = _646 * _154;
    float _672 = _410 * 2.0;
    float _674 = _388 + _410;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _676;
    bool _680 = !_624;
    int _682 = _680 ? 0 : 1;
    float _684 = floor(_500);
    float _686 = _640 * _154;
    float _688 = _630 * _496;
    float _690 = _388 + _400;
    float _692 = _674 + (-1.0);
    float _694 = in.m_59.w;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _698 = _696 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _700 = _690 + (-1.0);
    if (_576)
    {
        float _702 = _602 * _666;
        _156 = _702;
    }
    float _704 = _156;
    int _706 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _708 = _706 != 0;
    int _710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _712 = _710 != 0;
    float _714 = floor(_672);
    int _716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 32768;
    bool _718 = _716 != 0;
    float _720 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _722 = fma(_698, _648, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _724 = !_712;
    int _726 = _724 ? 0 : 1;
    float _728 = fma(_678, _688, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    bool _730 = _684 >= 0.0;
    bool _732 = isnan(_684);
    bool _734 = _730 || _732;
    bool _736 = isnan(0.0);
    bool _738 = _734 || _736;
    float _740 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _742 = !_708;
    int _744 = _742 ? 0 : 1;
    float _746 = _400 + _410;
    int _748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 65536;
    bool _750 = _748 != 0;
    int _752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 131072;
    bool _754 = _752 != 0;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _756;
    int _760 = _738 ? 0 : 1;
    float _762 = _746 + (-1.0);
    bool _764 = _684 > 0.0;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _770 = fma(_758, _458, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _772 = !_620;
    int _774 = _772 ? 0 : 1;
    float _776 = _450 + _402;
    int _778 = ~_760;
    int _780 = _778 + 1;
    int _782 = _780 + 1;
    float _784 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _786 = _704 + (*spvDescriptorSet0.vp_c9)._m0[202].y;
    bool _788 = !_616;
    int _790 = _788 ? 0 : 1;
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _794 = _424 + _792;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _806 = _804 != 0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _810 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _808;
    int _812 = _782;
    if (!_764)
    {
        int _814 = ~_760;
        int _816 = _814 + 1;
        _812 = _816;
    }
    int _818 = _812;
    float _820 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _822 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _820;
    bool _824 = _714 >= 0.0;
    bool _826 = isnan(_714);
    bool _828 = _824 || _826;
    bool _830 = isnan(0.0);
    bool _832 = _828 || _830;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _836 = _834 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _842 = fma(_822, _458, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    int _844 = _832 ? 0 : 1;
    float _846 = fma(_836, _526, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _848 = _714 > 0.0;
    float _850 = fma(_840, _526, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _852 = fma(_768, _526, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _854 = fma(_810, _458, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _856 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[201].y;
    float _858 = _478 + _694;
    float _860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _862 = _776 + _860;
    bool _864 = !_802;
    int _866 = _864 ? 0 : 1;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _868;
    float _872 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _874 = _872 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _876;
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _882 = _880 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    bool _884 = !_798;
    int _886 = _884 ? 0 : 1;
    float _888 = fma(_874, _648, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    int _890 = ~_844;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    float _896 = fma(_882, _648, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    int _898 = _894;
    if (!_848)
    {
        int _900 = ~_844;
        int _902 = _900 + 1;
        _898 = _902;
    }
    int _904 = _898;
    float _906 = fma(_870, _688, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _908 = _786 * _856;
    int _910 = abs(_866);
    float _912 = fma(_878, _688, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    int _914 = abs(_886);
    float _916 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _918 = _858 + _916;
    float _920 = in.m_65.x;
    float _922 = in.m_65.y;
    float _924 = in.m_65.z;
    bool _926 = !_806;
    int _928 = _926 ? 0 : 1;
    float _930 = float(_664);
    int _932 = abs(_928);
    float _934 = fma(_388, (*spvDescriptorSet0.vp_c9)._m0[203].y, _908);
    float _936 = float(_914);
    float _938 = float(_904);
    float _940 = floor(_934);
    float _942 = float(_818);
    float _944 = _794 * _794;
    float _946 = float(_910);
    float _948 = _936 * _938;
    float _950 = float(_932);
    float _952 = fma(_862, _862, _944);
    float _954 = _948 * (-2.0);
    float _956 = _946 * _930;
    float _958 = _950 * _942;
    float _960 = _934 + 0.25;
    float _962 = fma(_740, _954, _740);
    float _964 = fma(_954, _920, _920);
    float _966 = fma(_918, _918, _952);
    float _968 = floor(_960);
    float _970 = _958 * (-2.0);
    float _972 = _934 * 6.283185482025146484375;
    float _974 = -_940;
    float _976 = _934 + _974;
    bool _978 = !_750;
    int _980 = _978 ? 0 : 1;
    float _982 = _388 + (-0.5);
    float _984 = _972 * 0.15915493667125701904296875;
    float _986 = fma(_970, _924, _924);
    float _988 = rsqrt(_966);
    bool _990 = _976 >= 0.5;
    bool _992 = isnan(_976);
    bool _994 = _990 || _992;
    bool _996 = isnan(0.5);
    bool _998 = _994 || _996;
    float _1000 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[196].x, _964);
    int _1002 = abs(_980);
    float _1004 = fma(_720, _970, _720);
    bool _1006 = !_998;
    float _1008 = _1006 ? 0.5 : (-0.5);
    float _1010 = _984 * 6.283185482025146484375;
    float _1012 = sin(_1010);
    float _1014 = -_968;
    float _1016 = _960 + _1014;
    float _1018 = float(_1002);
    float _1020 = fma(_962, _704, _1000);
    float _1022 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1024 = _1022 * 2.0;
    bool _1026 = !_718;
    int _1028 = _1026 ? 0 : 1;
    bool _1030 = _1016 > 0.5;
    float _1032 = _794 * _988;
    float _1034 = _1018 * _1024;
    int _1036 = abs(_1028);
    float _1038 = _410 + (-0.5);
    float _1040 = -_1032;
    float _1042 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[18].w, _794);
    float _1044 = _862 * _988;
    float _1046 = float(_1036);
    float _1048 = _1020 * 0.15915493667125701904296875;
    float _1050 = _1042 * _1042;
    float _1052 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1054 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[196].z, _986);
    bool _1056 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _1058 = isnan(_366);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -_1044;
    float _1070 = fma(_1068, (*spvDescriptorSet0.vp_c9)._m0[18].w, _862);
    bool _1072 = !_754;
    int _1074 = _1072 ? 0 : 1;
    float _1076 = fma(_1046, _1052, _1034);
    bool _1078 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _1080 = isnan(_366);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = -_1066;
    float _1092 = _1090 + 1.0;
    int _1094 = abs(_1074);
    float _1096 = _1016;
    if (_1030)
    {
        float _1098 = -_1016;
        float _1100 = _1098 + 1.0;
        _1096 = _1100;
    }
    float _1102 = _1096;
    bool _1104 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1106 = isnan(_366);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1112 = _1108 || _1110;
    float _1114 = float(_1112);
    float _1116 = fma(_1070, _1070, _1050);
    float _1118 = _1088 * _1092;
    float _1120 = fma(_1102, 4.0, -1.0);
    bool _1122 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1124 = isnan(_366);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1130 = _1126 || _1128;
    float _1132 = float(_1130);
    float _1134 = -_1088;
    float _1136 = _1134 + 1.0;
    float _1138 = -_1114;
    float _1140 = _1138 + 1.0;
    float _1142 = float(_1094);
    float _1144 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[200].y;
    float _1146 = _1114 * _1136;
    bool _1148 = _366 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1150 = isnan(_366);
    bool _1152 = _1148 || _1150;
    bool _1154 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1156 = _1152 || _1154;
    float _1158 = float(_1156);
    float _1160 = _1132 * _1140;
    float _1162 = -_1132;
    float _1164 = _1162 + 1.0;
    float _1166 = fma(_1142, _1144, _1076);
    float _1168 = _956 * (-2.0);
    float _1170 = _918 * _988;
    float _1172 = _1158 * _1164;
    float _1174 = fma(_1166, 3.1415927410125732421875, _922);
    float _1176 = _400 + (-0.5);
    float _1178 = -_1170;
    float _1180 = fma(_1178, (*spvDescriptorSet0.vp_c9)._m0[18].w, _918);
    float _1182 = _842 * _1172;
    float _1184 = fma(_1174, _1168, _1174);
    float _1186 = _854 * _1172;
    float _1188 = fma(_784, _1168, _784);
    float _1190 = _770 * _1172;
    float _1192 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1184);
    float _1194 = -_1158;
    float _1196 = _1194 + 1.0;
    float _1198 = in.m_67.x;
    float _1200 = in.m_67.y;
    float _1202 = in.m_67.z;
    float _1204 = fma(_1004, _704, _1054);
    float _1206 = fma(_1180, _1180, _1116);
    float _1208 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1182);
    float _1210 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].z, _1190);
    float _1212 = fma(_1196, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1186);
    float _1214 = in.m_69.x;
    float _1216 = in.m_69.y;
    float _1218 = in.m_69.z;
    float _1220 = fma(_846, _1160, _1208);
    float _1222 = fma(_852, _1160, _1210);
    float _1224 = fma(_850, _1160, _1212);
    float _1226 = sqrt(_1206);
    float _1228 = fma(_906, _1146, _1220);
    float _1230 = fma(_1188, _704, _1192);
    float _1232 = fma(_728, _1146, _1222);
    float _1234 = fma(_912, _1146, _1224);
    float _1236 = fma(_888, _1118, _1228);
    float _1238 = _1204 * 0.15915493667125701904296875;
    float _1240 = _1230 * 0.15915493667125701904296875;
    float _1242 = fma(_722, _1118, _1232);
    float _1244 = fma(_896, _1118, _1234);
    float _1246 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].x, _1236);
    float _1248 = _1048 * 6.283185482025146484375;
    float _1250 = sin(_1248);
    float _1252 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].z, _1242);
    float _1254 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[147].y, _1244);
    float _1256 = _1246 * _1198;
    float _1258 = _1252 * _1202;
    float _1260 = _1254 * _1200;
    float _1262 = _988 * _1226;
    float _1264 = _1048 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = _1256 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1270 = _1258 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1214);
    float _1274 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1218);
    float _1276 = _1262 * _1268;
    float _1278 = _1262 * _1270;
    float _1280 = _1260 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1282 = _1238 * 6.283185482025146484375;
    float _1284 = cos(_1282);
    float _1286 = _1272 * _1276;
    float _1288 = _1274 * _1278;
    float _1290 = _1262 * _1280;
    float _1292 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1216);
    float _1294 = _1240 * 6.283185482025146484375;
    float _1296 = sin(_1294);
    float _1298 = _1292 * _1290;
    float _1300 = _1240 * 6.283185482025146484375;
    float _1302 = cos(_1300);
    float _1304 = _1266 * _1284;
    float _1306 = _1250 * _1284;
    float _1308 = _1304 * _1288;
    float _1310 = _1238 * 6.283185482025146484375;
    float _1312 = sin(_1310);
    float _1314 = _1250 * _1296;
    float _1316 = _1266 * _1296;
    float _1318 = _1296 * _1284;
    float _1320 = _1266 * _1302;
    float _1322 = _1250 * _1302;
    float _1324 = _1302 * _1284;
    float _1326 = fma(_1312, _1320, _1314);
    float _1328 = -_1288;
    float _1330 = _1312 * _1328;
    float _1332 = -_1322;
    float _1334 = fma(_1312, _1316, _1332);
    float _1336 = -_1316;
    float _1338 = fma(_1312, _1322, _1336);
    float _1340 = fma(_1326, _1286, _1308);
    float _1342 = _1306 * _1288;
    float _1344 = fma(_1324, _1286, _1330);
    float _1346 = fma(_1312, _1314, _1320);
    float _1348 = -_1298;
    float _1350 = fma(_1334, _1348, _1340);
    float _1352 = fma(_1338, _1286, _1342);
    float _1354 = -_1298;
    float _1356 = fma(_1318, _1354, _1344);
    float _1358 = _1350 * _324;
    float _1360 = -_1298;
    float _1362 = fma(_1346, _1360, _1352);
    float _1364 = _1350 * _320;
    float _1366 = fma(_1356, _298, _1358);
    float _1368 = fma(_1356, _294, _1364);
    float _1370 = fma(_1362, _336, _1366);
    float _1372 = fma(_1362, _332, _1368);
    float _1374 = _858 + _1370;
    float _1376 = _776 + _1372;
    float _1378 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1380 = _1374 + _1378;
    float _1382 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1384 = _1376 + _1382;
    float _1386 = _1380 * _1380;
    float _1388 = fma(_1384, _1384, _1386);
    float _1390 = _1350 * _312;
    float _1392 = sqrt(_1388);
    float _1394 = fma(_1356, _290, _1390);
    float _1396 = fma(_1362, _328, _1394);
    float _1398 = _424 + _1396;
    bool _1400 = _1392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1404 = _1402 != 0;
    int _1406 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1408 = _1406 != 0;
    bool _1410 = !_1404;
    int _1412 = _1410 ? 0 : 1;
    bool _1414 = !_1408;
    int _1416 = _1414 ? 0 : 1;
    float _1418 = _1350;
    float _1420 = _1308;
    float _1422 = _1376;
    if (!_1400)
    {
        _1418 = _1374;
    }
    float _1424 = _1418;
    float _1426 = _1424;
    if (!_1400)
    {
        _1420 = _1398;
    }
    float _1428 = _1420;
    bool _1430 = !_1400;
    float _1432 = _1428;
    if (!_1430)
    {
        float _1434 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1436 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1438 = _1392 + _1436;
        float _1440 = rsqrt(_1388);
        float _1442 = _1438 * _1434;
        float _1444 = _1398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1446 = _1442 * 0.15915493667125701904296875;
        float _1448 = _1446 * 6.283185482025146484375;
        float _1450 = cos(_1448);
        float _1452 = _1446 * 6.283185482025146484375;
        float _1454 = sin(_1452);
        float _1456 = _1450 + (-1.0);
        float _1458 = fma(_1454, _1444, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1460 = _1456 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1462 = _1440 * _1458;
        float _1464 = fma(_1398, _1450, _1460);
        float _1466 = fma(_1384, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1468 = fma(_1380, _1462, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1422 = _1466;
        _1426 = _1468;
        _1432 = _1464;
    }
    float _1470 = _1422;
    float _1472 = _1426;
    float _1474 = _1432;
    float _1476 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1478 = _1470 + _1476;
    float _1480 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1482 = _1472 + _1480;
    float _1484 = fma(_1478, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1486 = fma(_1482, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _6157 = float2(_1484, _1486);
    float _1488 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_6157, float2(0.0), isnan(_6157)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_6157, float2(0.0), isnan(_6157)), level(0.0)).x;
    float _1490 = float(uint(_560));
    float _1492 = trunc(_668);
    int _1494 = int(_1492);
    float _1496 = float(uint(_592));
    float _1498 = -_1170;
    float _1500 = fma(_1498, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1472);
    float _1502 = float(_120);
    float _1504 = -_1044;
    float _1506 = fma(_1504, (*spvDescriptorSet0.vp_c9)._m0[18].w, _776);
    int _1508 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1510 = _1508 != 0;
    float _1512 = -_1170;
    float _1514 = fma(_1512, (*spvDescriptorSet0.vp_c9)._m0[18].w, _858);
    int _1516 = ~_592;
    int _1518 = _1516 + 1;
    float _1520 = 1.0 / _1490;
    bool _1522 = _560 == 0;
    float _1524 = in.m_71.x;
    int _1526 = abs(_774);
    int _1528 = abs(_726);
    int _1530 = abs(_744);
    float _1532 = 1.0 / _1496;
    float _1534 = float(uint(_1494));
    float _1536 = trunc(_686);
    int _1538 = int(_1536);
    int _1540 = as_type<int>(_1520) + (-2);
    int _1542 = ~_560;
    int _1544 = _1542 + 1;
    int _1546 = ~_592;
    int _1548 = _1546 + 1;
    float _1550 = as_type<float>(_1540) * _1534;
    float _1552 = _1524;
    if (_1510)
    {
        _420 = 1.0;
    }
    float _1554 = _420;
    float _1556 = 1.0 / _1502;
    int _1558 = as_type<int>(_1532) + (-2);
    float _1560 = _1554;
    if (!_1510)
    {
        _1560 = 7.345489978790283203125;
    }
    float _1562 = _1560;
    int _1564 = abs(_1412);
    float _1566 = trunc(_1550);
    float _1568 = precise::max(_1566, 0.0);
    uint _1571 = uint(_1568);
    float _1573 = float(uint(_1538));
    float _1575 = _1562 * _388;
    int _1577 = ~_560;
    int _1579 = _1577 + 1;
    float _1581 = as_type<float>(_1558) * _1573;
    int _1583 = abs(_682);
    float _1585 = trunc(_1581);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    int _1591 = _1544 * int(_1571);
    int _1593 = _1591 + _1494;
    float _1595 = float(uint(_1593));
    float _1597 = as_type<float>(_1540) * _1595;
    float _1599 = _1595;
    if (_1510)
    {
        _1599 = _388;
    }
    float _1601 = _1599;
    int _1603 = _1548 * int(_1589);
    int _1605 = _1603 + _1538;
    float _1607 = _1601;
    float _1609 = as_type<float>(_1605);
    if (!_1510)
    {
        _1607 = _400;
    }
    float _1611 = _1607;
    float _1613 = trunc(_1597);
    float _1615 = precise::max(_1613, 0.0);
    uint _1617 = uint(_1615);
    float _1619 = float(uint(_1605));
    if (_1510)
    {
        _1609 = 1.0;
    }
    float _1621 = _1609;
    float _1623 = _1621;
    if (!_1510)
    {
        _1623 = 1.2345600128173828125;
    }
    float _1625 = _1623;
    float _1627 = as_type<float>(_1558) * _1619;
    float _1629 = floor(_1575);
    float _1631 = _1611 * _1625;
    float _1633 = float(_1494);
    int _1635 = int(_1571) + int(_1617);
    float _1637 = trunc(_1627);
    float _1639 = precise::max(_1637, 0.0);
    uint _1641 = uint(_1639);
    bool _1643 = _1633 >= _642;
    bool _1645 = isnan(_1633);
    bool _1647 = _1643 || _1645;
    bool _1649 = isnan(_642);
    bool _1651 = _1647 || _1649;
    float _1653 = float(_1651);
    int _1655 = _1579 * _1635;
    int _1657 = _1655 + _1494;
    float _1659 = floor(_1631);
    float _1661 = -_1629;
    float _1663 = _1575 + _1661;
    bool _1665 = uint(_1657) >= uint(_560);
    float _1667 = float(_1538);
    float _1669 = trunc(_1653);
    int _1671 = int(_1669);
    int _1673 = int(_1589) + int(_1641);
    bool _1675 = !_1665;
    int _1677 = _1675 ? 0 : (-1);
    int _1679 = ~_1635;
    int _1681 = _1679 + _1677;
    int _1683 = _1681 + 1;
    float _1685 = _656 * _1556;
    bool _1687 = _1667 >= _646;
    bool _1689 = isnan(_1667);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(_646);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    int _1699 = _1518 * _1673;
    int _1701 = _1699 + _1538;
    int _1703 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1705 = _1703 != 0;
    int _1707 = _560 * _1683;
    int _1709 = _1707 + _1494;
    float _1711 = _670 * _1556;
    float _1713 = _1663 * _642;
    bool _1715 = uint(_1701) >= uint(_592);
    float _1717 = trunc(_1697);
    int _1719 = int(_1717);
    int _1721 = ~_1671;
    int _1723 = _1721 + 1;
    int _1725 = _1723 + 1;
    float _1727 = -_1659;
    float _1729 = _1631 + _1727;
    bool _1731 = !_1522;
    int _1733 = _1731 ? _1709 : (-1);
    float _1735 = in.m_71.y;
    bool _1737 = !_1715;
    int _1739 = _1737 ? 0 : (-1);
    float _1741 = _646 * _1729;
    int _1743 = _1733 * _1725;
    int _1745 = _560 + (-1);
    float _1747 = trunc(_1685);
    int _1749 = int(_1747);
    int _1751 = ~_1673;
    int _1753 = _1751 + _1739;
    int _1755 = _1753 + 1;
    float _1757 = in.m_61.w;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1761 = _1759 != 0;
    int _1763 = _1671 * _1745;
    int _1765 = _1763 + _1743;
    bool _1767 = _592 == 0;
    int _1769 = _592 * _1755;
    int _1771 = _1769 + _1538;
    bool _1773 = !_1761;
    int _1775 = _1773 ? 0 : 1;
    float _1777 = trunc(_1741);
    int _1779 = int(_1777);
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1783 = _1781 != 0;
    int _1785 = ~_1719;
    int _1787 = _1785 + 1;
    int _1789 = _1787 + 1;
    bool _1791 = !_1767;
    int _1793 = _1791 ? _1771 : (-1);
    int _1795 = abs(_1775);
    float _1797 = trunc(_1713);
    int _1799 = int(_1797);
    bool _1801 = !_1783;
    int _1803 = _1801 ? 0 : 1;
    int _1805 = _1789 * _1793;
    int _1807 = _592 + (-1);
    int _1809 = abs(_1803);
    float _1811 = trunc(_1711);
    int _1813 = int(_1811);
    int _1815 = _1719 * _1807;
    int _1817 = _1815 + _1805;
    int _1819 = abs(_790);
    int _1821 = _1765 * _1526;
    int _1823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1825 = _1823 != 0;
    int _1827 = _1817 * _1528;
    int _1829 = _1749 * _1819;
    int _1831 = _1829 + _1821;
    int _1833 = abs(_1416);
    int _1835 = _1779 * _1809;
    int _1837 = _1835 + _1538;
    bool _1839 = !_1705;
    int _1841 = _1839 ? 0 : 1;
    int _1843 = _1799 * _1795;
    int _1845 = _1843 + _1494;
    int _1847 = abs(_1841);
    int _1849 = _1813 * _1530;
    int _1851 = _1849 + _1827;
    int _1853 = _1845 * _1583;
    int _1855 = _1853 + _1831;
    int _1857 = _1837 * _1564;
    int _1859 = _1857 + _1851;
    float _1861 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1863 = _1500 + _1861;
    int _1865 = _1779 * _1833;
    int _1867 = _1865 + _1859;
    int _1869 = _1799 * _1847;
    int _1871 = _1869 + _1855;
    float _1873 = -_1044;
    float _1875 = fma(_1873, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1470);
    float _1877 = float(uint(_1867));
    float _1879 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1881 = _1875 + _1879;
    float _1883 = float(uint(_1871));
    float _1885 = as_type<float>(_1558) * _1877;
    float _1887 = fma(_1488, 100.0, _1474);
    float _1889 = -_1032;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1887);
    float _1893 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1895 = _1891 + _1893;
    float _1897 = _1895 * _1895;
    float _1899 = fma(_1881, _1881, _1897);
    float _1901 = fma(_1863, _1863, _1899);
    float _1903 = rsqrt(_1901);
    float _1905 = sqrt(_1901);
    float _1907 = _1903 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1909 = _1881 * _1907;
    float _1911 = _1863 * _1907;
    float _1913 = _1909 * _1909;
    float _1915 = _1911 * _1911;
    float _1917 = _1913 + _1915;
    float _1919 = sqrt(_1917);
    bool _1921 = _1919 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1925 = _1919 + _1923;
    float _1927 = _1863;
    float _1929 = _1899;
    float _1931 = _1925;
    float _1933 = as_type<float>(_1831);
    float _1935 = _1907;
    float _1937 = _1735;
    if (_1921)
    {
        float _1939 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1927 = _1939;
    }
    float _1941 = _1927;
    if (_1921)
    {
        float _1943 = rsqrt(_1917);
        _1929 = _1943;
    }
    float _1945 = _1929;
    float _1947 = _1945;
    if (_1921)
    {
        float _1949 = _1925 * _1941;
        _1931 = _1949;
    }
    float _1951 = _1931;
    if (_1921)
    {
        float _1953 = _1951 * 0.15915493667125701904296875;
        _1933 = _1953;
    }
    float _1955 = _1933;
    float _1957 = _1941;
    float _1959 = _1955;
    if (_1921)
    {
        float _1961 = _1955 * 6.283185482025146484375;
        float _1963 = sin(_1961);
        _1957 = _1963;
    }
    float _1965 = _1957;
    float _1967 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1969 = precise::max(0.0, _1967);
    float _1971 = _1903;
    float _1973 = _1969;
    if (_1921)
    {
        float _1975 = _1955 * 6.283185482025146484375;
        float _1977 = cos(_1975);
        _1971 = _1977;
    }
    float _1979 = _1971;
    float _1981 = -_1907;
    float _1983 = -_1969;
    float _1985 = fma(_1895, _1981, _1983);
    float _1987 = _1985;
    if (_1921)
    {
        float _1989 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1973 = _1989;
    }
    float _1991 = _1973;
    float _1993 = _1965;
    float _1995 = _1991;
    if (_1921)
    {
        float _1997 = fma(_1965, _1991, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1993 = _1997;
    }
    float _1999 = _1993;
    float _2001 = _1999;
    float _2003 = _1979;
    if (_1921)
    {
        float _2005 = _1979 + (-1.0);
        _1995 = _2005;
    }
    float _2007 = _1995;
    float _2009 = _2007;
    if (_1921)
    {
        float _2011 = _1945 * _1999;
        _1935 = _2011;
    }
    float _2013 = _1935;
    if (!_1921)
    {
        _2001 = _1909;
    }
    float _2015 = _2001;
    float _2017 = _2015;
    if (_1921)
    {
        float _2019 = _2007 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1959 = _2019;
    }
    float _2021 = _1959;
    if (_1921)
    {
        float _2023 = _1909 * _2013;
        _2017 = _2023;
    }
    float _2025 = _2017;
    if (!_1921)
    {
        _2009 = _1911;
    }
    float _2027 = _2009;
    float _2029 = _2027;
    if (_1921)
    {
        float _2031 = _1911 * _2013;
        _2029 = _2031;
    }
    float _2033 = _2029;
    if (!_1921)
    {
        _1947 = _1913;
    }
    float _2035 = _1947;
    float _2037 = _2035;
    if (_1921)
    {
        float _2039 = fma(_1985, _1979, _2021);
        _1987 = _2039;
    }
    float _2041 = _1987;
    if (_1921)
    {
        float _2043 = _2025 * _2025;
        _2037 = _2043;
    }
    float _2045 = _2037;
    if (!_1921)
    {
        _2003 = _1915;
    }
    float _2047 = _2003;
    float _2049 = _2047;
    if (_1921)
    {
        float _2051 = _2033 * _2033;
        _2049 = _2051;
    }
    float _2053 = _2049;
    float _2055 = fma(_2041, _2041, _2045);
    float _2057 = _2055 + _2053;
    float _2059 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2061 = fma(_1905, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2059);
    float _2063 = precise::clamp(_2061, 0.0, 1.0);
    float _2065 = rsqrt(_2057);
    float _2067 = fma(_1506, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2069 = -_2063;
    float _2071 = _2069 + 1.0;
    float _2073 = fma(_1514, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2075 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2077 = abs(_2071);
    float _2079 = log2(_2077);
    float _2081 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2075);
    float _2083 = _2065 * _2025;
    float _2085 = floor(_2073);
    float _2087 = _2065 * _2041;
    float _2089 = _2065 * _2033;
    float _2091 = _2083 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2093 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2081);
    float _2095 = -_2091;
    float _2097 = fma(_2087, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2095);
    float _2099 = _2093 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2101 = floor(_2067);
    float _2103 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2105 = -_2089;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2097);
    float _2109 = _2099 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2111 = fma(_2107, -0.5, 0.5);
    float _2113 = fma(_2107, 0.5, 0.5);
    float _2115 = -_2085;
    float _2117 = _2073 + _2115;
    float _2119 = -_2109;
    float _2121 = fma(_2119, _2103, 1.0);
    float _2123 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2125 = fma(_2113, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2127 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2129 = sqrt(_2111);
    float _2131 = fma(_2113, _2125, -0.212114393711090087890625);
    float _2133 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2135 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2127);
    float _2137 = -_2101;
    float _2139 = _2067 + _2137;
    float _2141 = fma(_2113, _2131, 1.570728778839111328125);
    float _2143 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2133);
    float _2145 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2135);
    float _2147 = exp2(_2123);
    float _2149 = _1891 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2151 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2143);
    float _2153 = _2145 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2155 = as_type<float>(_1540) * _1883;
    float _2157 = fma(_1875, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2149);
    float _2159 = _2151 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2161 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2163 = _2087 + 1.0;
    float _2165 = fma(_1500, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2157);
    float _2167 = trunc(_2155);
    float _2169 = precise::max(_2167, 0.0);
    uint _2171 = uint(_2169);
    float _2173 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2161);
    float _2175 = _2129 * 0.636619746685028076171875;
    float _2177 = _2165 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2179 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2181 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2173);
    float _2183 = -_2087;
    float _2185 = fma(_2147, _2163, _2183);
    float _2187 = -_2141;
    float _2189 = fma(_2175, _2187, 1.0);
    float _2191 = log2(_2121);
    float _2193 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2181);
    float _2195 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2197 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2179);
    int _2199 = ~_560;
    int _2201 = _2199 + 1;
    float _2203 = fma(_2185, 0.5, 0.5);
    float _2205 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2195);
    float _2207 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2197);
    float _2209 = 1.0 / _2193;
    int _2211 = _2201 * int(_2171);
    int _2213 = _2211 + _1871;
    float _2215 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2205);
    float _2217 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2207);
    float2 _7242 = float2(_2139, _2117);
    float _2219 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7242, float2(0.0), isnan(_7242)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7242, float2(0.0), isnan(_7242)), level(0.0)).x;
    float _2221 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2215);
    float _2223 = float(uint(_2213));
    float _2225 = _2191 * 0.693147182464599609375;
    float _2227 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2229 = as_type<float>(_1540) * _2223;
    float _2231 = _2217 * _2209;
    float _2233 = _2221 * _2209;
    float _2235 = trunc(_2229);
    float _2237 = precise::max(_2235, 0.0);
    uint _2239 = uint(_2237);
    float _2241 = fma(_2231, 0.5, 0.5);
    float _2243 = fma(_2233, -0.5, 0.5);
    float3 _7286 = float3(_2241, _2243, _2227);
    float _2245 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7286, float3(0.0), isnan(_7286)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7286, float3(0.0), isnan(_7286)), level(0.0)).x;
    float3 _7297 = float3(_2241, _2243, _2227);
    float4 _2248 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7297, float3(0.0), isnan(_7297)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7297, float3(0.0), isnan(_7297)), level(0.0)).xyzw;
    float _2250 = _2248.x;
    float _2252 = _2248.y;
    float _2254 = _2248.z;
    float _2256 = _2248.w;
    float2 _7313 = float2(_2189, _2203);
    float3 _2260 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7313, float2(0.0), isnan(_7313)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7313, float2(0.0), isnan(_7313)), level(0.0)).xyz;
    float _2262 = _2260.x;
    float _2264 = _2260.y;
    float _2266 = _2260.z;
    float _2268 = trunc(_1885);
    float _2270 = precise::max(_2268, 0.0);
    uint _2272 = uint(_2270);
    int _2274 = ~_592;
    int _2276 = _2274 + 1;
    out.m_73.x = 1.0;
    out.m_73.y = 1.0;
    out.m_73.z = 1.0;
    int _2278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2280 = _2278 != 0;
    float _2282 = fma(_1488, 100.0, _424);
    bool _2284 = _400 > 0.5;
    float _2286 = _2079 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2288 = int(_2171) + int(_2239);
    float _2290 = -_1032;
    float _2292 = fma(_2290, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2282);
    bool _2294 = _1757 > 0.5;
    float _2296 = _2153 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2298 = float(uint(_1845));
    float _2300 = exp2(_2286);
    float _2302 = -_1735;
    float _2304 = _2302 + 1.0;
    int _2306 = ~_560;
    int _2308 = _2306 + 1;
    float _2310 = as_type<float>(_1540) * _2298;
    int _2312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2314 = _2312 != 0;
    int _2316 = _2276 * int(_2272);
    int _2318 = _2316 + _1867;
    float _2320 = fma(_2159, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2296);
    int _2322 = _2284 ? as_type<int>(_2304) : as_type<int>(_1735);
    float _2324 = trunc(_2310);
    float _2326 = precise::max(_2324, 0.0);
    uint _2328 = uint(_2326);
    int _2330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2332 = _2330 != 0;
    int _2334 = _2308 * _2288;
    int _2336 = _2334 + _1871;
    float _2338 = float(uint(_2318));
    int _2340 = _2318;
    bool _2342 = _2294;
    float _2344 = _2229;
    float _2346 = as_type<float>(_2239);
    float _2348 = _2217;
    if (_1825)
    {
        float _2350 = -_1524;
        float _2352 = _2350 + 1.0;
        _2340 = as_type<int>(_2352);
    }
    int _2354 = _2340;
    float _2356 = _2314 ? as_type<float>(_2322) : _1735;
    float _2358 = -_2300;
    float _2360 = _2358 + 1.0;
    int _2362 = _2354;
    if (_2280)
    {
        float _2364 = _2294 ? _2304 : _1735;
        _1937 = _2364;
    }
    float _2366 = _1937;
    float _2368 = as_type<float>(_1558) * _2338;
    bool _2370 = uint(_2336) >= uint(_560);
    float _2372 = _2360 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2374 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _2376 = trunc(_2368);
    float _2378 = precise::max(_2376, 0.0);
    uint _2380 = uint(_2378);
    bool _2382 = _2370;
    if (_1825)
    {
        bool _2384 = _388 > 0.5;
        _2342 = _2384;
    }
    bool _2386 = _2342;
    out.m_75.x = _1875;
    out.m_75.y = _1891;
    out.m_75.z = _1500;
    bool _2388 = !_2370;
    int _2390 = _2388 ? 0 : (-1);
    float _2392 = _2374 * _388;
    if (!_1825)
    {
        _2344 = _1524;
    }
    float _2394 = _2344;
    int _2396 = _2308 * int(_2328);
    int _2398 = _2396 + _1845;
    float _2400 = _2394;
    if (_1825)
    {
        float _2402 = _2386 ? as_type<float>(_2354) : _1524;
        _2400 = _2402;
    }
    float _2404 = _2400;
    if (_2332)
    {
        float _2406 = -_1524;
        float _2408 = _2406 + 1.0;
        _2362 = as_type<int>(_2408);
    }
    int _2410 = _2362;
    int _2412 = ~_2288;
    int _2414 = _2412 + _2390;
    int _2416 = _2414 + 1;
    float _2418 = trunc(_2392);
    int _2420 = int(_2418);
    if (_2332)
    {
        bool _2422 = _410 > 0.5;
        _2382 = _2422;
    }
    bool _2424 = _2382;
    float _2426 = float(uint(_2398));
    int _2428 = _560 * _2416;
    int _2430 = _2428 + _1871;
    if (_2332)
    {
        float _2432 = _2424 ? as_type<float>(_2410) : _1524;
        _1552 = _2432;
    }
    float _2434 = _1552;
    float _2436 = in.m_77.x;
    float _2438 = in.m_77.y;
    float _2440 = in.m_77.z;
    int _2442 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2444 = _2442 != 0;
    float _2446 = as_type<float>(_1540) * _2426;
    int _2448 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2450 = _2448 != 0;
    bool _2452 = _1216 != 0.0;
    bool _2454 = isnan(_1216);
    bool _2456 = _2452 || _2454;
    bool _2458 = isnan(0.0);
    bool _2460 = _2456 || _2458;
    float _2462 = trunc(_2446);
    float _2464 = precise::max(_2462, 0.0);
    uint _2466 = uint(_2464);
    bool _2468 = !_1522;
    int _2470 = _2468 ? _2430 : (-1);
    float _2472 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _2474 = _2472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2476 = int(_2272) + int(_2380);
    float _2478 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2480 = _1214 == 0.0;
    bool _2482 = !_2460;
    bool _2484 = _2480 && _2482;
    float _2486 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    int _2488 = _2470 & 3;
    bool _2490 = _2488 != 0;
    float _2492 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2494 = _2470 & 3;
    bool _2496 = _2494 != 0;
    bool _2498 = _1218 == 0.0;
    bool _2500 = _2498 && _2484;
    float _2502 = _2490 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _2504 = uint(_2494) > 1u;
    int _2506 = _2420 << 4;
    int _2508 = _2506 + 1968;
    float _2510 = float(uint(_1837));
    int _2512 = _2508 + 8;
    uint _2514 = uint(int(uint(_2512) >> uint(2)));
    uint _2516 = uint(int(uint(int(_2514)) >> uint(2)));
    int _2518 = int(_2514) & 3;
    float _2520 = (*spvDescriptorSet0.vp_c9)._m0[int(_2516)][_2518];
    int _2522 = ~_592;
    int _2524 = _2522 + 1;
    float _2526 = as_type<float>(_1558) * _2510;
    int _2528 = ~as_type<int>(_2502);
    int _2530 = _2528 + 1;
    int _2532 = _2530 + 1;
    float _2534 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2536 = _2532;
    float _2538 = _2502;
    float _2540 = _2526;
    if (_2500)
    {
        _2346 = _2436;
    }
    float _2542 = _2346;
    int _2544 = _2524 * _2476;
    int _2546 = _2544 + _1867;
    float _2548 = _2542;
    if (!_2504)
    {
        int _2550 = ~as_type<int>(_2502);
        int _2552 = _2550 + 1;
        _2536 = _2552;
    }
    int _2554 = _2536;
    float _2556 = trunc(_2526);
    float _2558 = precise::max(_2556, 0.0);
    uint _2560 = uint(_2558);
    bool _2562 = uint(_2494) >= 2u;
    float _2564 = _2534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (_2500)
    {
        _2538 = _2542;
    }
    float _2566 = _2538;
    uint _2568 = uint(int(uint(_2508) >> uint(2)));
    uint _2570 = uint(int(uint(int(_2568)) >> uint(2)));
    int _2572 = int(_2568) & 3;
    float _2574 = (*spvDescriptorSet0.vp_c9)._m0[int(_2570)][_2572];
    int _2576 = int(_2568) + 1;
    uint _2578 = uint(int(uint(_2576) >> uint(2)));
    int _2580 = _2576 & 3;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[int(_2578)][_2580];
    float _2584 = _2566;
    if (!_2500)
    {
        _2548 = _2436;
    }
    float _2586 = _2548;
    int _2588 = _2562 ? 0 : 1;
    out.m_79.x = _2564;
    out.m_79.y = _2474;
    out.m_79.z = _2492;
    out.m_79.w = _2486;
    bool _2590 = uint(_2546) >= uint(_592);
    if (!_2500)
    {
        float _2592 = fma(_1214, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2586);
        _2584 = _2592;
    }
    float _2594 = _2584;
    float _2596 = 0.0;
    if (_2500)
    {
        _2596 = _2438;
    }
    float _2598 = _2596;
    int _2600 = ~_592;
    int _2602 = _2600 + 1;
    float _2604 = _2598;
    if (_2500)
    {
        _2540 = _2598;
    }
    float _2606 = _2540;
    int _2608 = int(_2328) + int(_2466);
    float _2610 = _2606;
    if (!_2500)
    {
        _2604 = _2438;
    }
    float _2612 = _2604;
    int _2614 = _2470 >> 31;
    int _2616 = _2602 * int(_2560);
    int _2618 = _2616 + _1837;
    bool _2620 = !_2590;
    int _2622 = _2620 ? 0 : (-1);
    if (!_2500)
    {
        float _2624 = fma(_1216, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2612);
        _2610 = _2624;
    }
    float _2626 = _2610;
    bool _2628 = _2494 != 3;
    int _2630 = ~_2476;
    int _2632 = _2630 + _2622;
    int _2634 = _2632 + 1;
    int _2636 = ~_560;
    int _2638 = _2636 + 1;
    float _2640 = float(uint(_2618));
    int _2642 = _592 * _2634;
    int _2644 = _2642 + _1867;
    int _2646 = _2614 & 3;
    int _2648 = _2638 * _2608;
    int _2650 = _2648 + _1845;
    int _2652 = ~_2588;
    int _2654 = _2652 + 1;
    int _2656 = _2654 + 1;
    float _2658 = as_type<float>(_1558) * _2640;
    bool _2660 = !_1767;
    int _2662 = _2660 ? _2644 : (-1);
    float _2664 = _2520 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2666 = _2656;
    if (_2628)
    {
        int _2668 = ~_2588;
        int _2670 = _2668 + 1;
        _2666 = _2670;
    }
    int _2672 = _2666;
    float _2674 = trunc(_2658);
    float _2676 = precise::max(_2674, 0.0);
    uint _2678 = uint(_2676);
    int _2680 = _2662 >> 31;
    float _2682 = _2664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2684 = uint(_2650) >= uint(_560);
    int _2686 = _2470 + _2646;
    float _2688 = in.m_81.x;
    float _2690 = in.m_81.y;
    float _2692 = in.m_81.z;
    float _2694 = in.m_81.w;
    int _2696 = _2680 & 3;
    bool _2698 = !_2684;
    int _2700 = _2698 ? 0 : (-1);
    int _2702 = _2662 + _2696;
    float _2704 = _2574 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2706 = _2662 & 3;
    bool _2708 = _2706 != 0;
    float _2710 = _2582 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _2712 = _2686 >> 2;
    float _2714 = _2704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2716 = _2702 >> 2;
    float _2718 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2720 = _2708 ? 0 : 1;
    int _2722 = _2712 << 4;
    int _2724 = _2722 + 368;
    bool _2726 = uint(_2706) >= 2u;
    out.m_83.x = _2714;
    out.m_83.y = _2718;
    out.m_83.z = _2682;
    int _2728 = _2716 << 4;
    int _2730 = _2728 + 512;
    float _2732 = 0.0;
    if (_2500)
    {
        _2732 = _2440;
    }
    float _2734 = _2732;
    uint _2736 = uint(int(uint(_2724) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    int _2752 = _2726 ? 0 : 1;
    bool _2754 = uint(_2706) > 1u;
    int _2756 = int(_2560) + int(_2678);
    float _2758 = as_type<float>(_2678);
    float _2760 = _2734;
    if (_2500)
    {
        _2758 = _2734;
    }
    float _2762 = _2758;
    uint _2764 = uint(int(uint(_2730) >> uint(2)));
    uint _2766 = uint(int(uint(int(_2764)) >> uint(2)));
    int _2768 = int(_2764) & 3;
    float _2770 = (*spvDescriptorSet0.vp_c9)._m0[int(_2766)][_2768];
    int _2772 = int(_2764) + 1;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    int _2776 = _2772 & 3;
    float _2778 = (*spvDescriptorSet0.vp_c9)._m0[int(_2774)][_2776];
    int _2780 = ~_592;
    int _2782 = _2780 + 1;
    float _2784 = _2762;
    if (!_2500)
    {
        _2760 = _2440;
    }
    float _2786 = _2760;
    float _2788 = _2688 * _2612;
    int _2790 = ~_2720;
    int _2792 = _2790 + 1;
    int _2794 = _2792 + 1;
    int _2796 = _2782 * _2756;
    int _2798 = _2796 + _1837;
    int _2800 = abs(_2672);
    float _2802 = _2690 * _2786;
    int _2804 = _2794;
    if (!_2754)
    {
        int _2806 = ~_2720;
        int _2808 = _2806 + 1;
        _2804 = _2808;
    }
    int _2810 = _2804;
    int _2812 = _2730 + 8;
    uint _2814 = uint(int(uint(_2812) >> uint(2)));
    uint _2816 = uint(int(uint(int(_2814)) >> uint(2)));
    int _2818 = int(_2814) & 3;
    float _2820 = (*spvDescriptorSet0.vp_c9)._m0[int(_2816)][_2818];
    int _2822 = int(_2814) + 1;
    uint _2824 = uint(int(uint(_2822) >> uint(2)));
    int _2826 = _2822 & 3;
    float _2828 = (*spvDescriptorSet0.vp_c9)._m0[int(_2824)][_2826];
    bool _2830 = uint(_2798) >= uint(_592);
    float _2832 = -_2802;
    float _2834 = fma(_2692, _2612, _2832);
    float _2836 = _2692 * _2586;
    if (!_2500)
    {
        float _2838 = fma(_1218, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2786);
        _2784 = _2838;
    }
    float _2840 = _2784;
    bool _2842 = !_2830;
    int _2844 = _2842 ? 0 : (-1);
    float _2846 = -_2788;
    float _2848 = fma(_2690, _2586, _2846);
    bool _2850 = _2706 != 3;
    int _2852 = _2724 + 8;
    uint _2854 = uint(int(uint(_2852) >> uint(2)));
    uint _2856 = uint(int(uint(int(_2854)) >> uint(2)));
    int _2858 = int(_2854) & 3;
    float _2860 = (*spvDescriptorSet0.vp_c9)._m0[int(_2856)][_2858];
    int _2862 = int(_2854) + 1;
    uint _2864 = uint(int(uint(_2862) >> uint(2)));
    int _2866 = _2862 & 3;
    float _2868 = (*spvDescriptorSet0.vp_c9)._m0[int(_2864)][_2866];
    bool _2870 = !_2496;
    int _2872 = _2870 ? 0 : 1;
    float _2874 = -_2836;
    float _2876 = fma(_2688, _2786, _2874);
    int _2878 = _2662 & 3;
    bool _2880 = _2878 != 0;
    float _2882 = _2834 * _2694;
    int _2884 = abs(_2554);
    float _2886 = _2876 * _2694;
    int _2888 = abs(_2872);
    float _2890 = _2848 * _2694;
    int _2892 = ~_2752;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    int _2898 = _2896;
    if (_2850)
    {
        int _2900 = ~_2752;
        int _2902 = _2900 + 1;
        _2898 = _2902;
    }
    int _2904 = _2898;
    int _2906 = abs(_2810);
    bool _2908 = _2494 != 3;
    int _2910 = ~_2884;
    int _2912 = _2910 + 1;
    int _2914 = _2912 + 1;
    float _2916 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2918 = int(_2916);
    bool _2920 = !_2880;
    int _2922 = _2920 ? 0 : 1;
    int _2924 = _2914 * as_type<int>(_2750);
    int _2926 = ~_2888;
    int _2928 = _2926 + 1;
    int _2930 = _2928 + 1;
    int _2932 = ~_2906;
    int _2934 = _2932 + 1;
    int _2936 = _2934 + 1;
    int _2938 = abs(_2922);
    int _2940 = _2930 * as_type<int>(_2742);
    int _2942 = _2940 + _2924;
    bool _2944 = !_2908;
    int _2946 = _2944 ? 0 : (-1);
    float _2948 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2950 = int(_2948);
    bool _2952 = _2706 != 3;
    int _2954 = _2936 * as_type<int>(_2778);
    int _2956 = ~_2938;
    int _2958 = _2956 + 1;
    int _2960 = _2958 + 1;
    int _2962 = abs(_2946);
    bool _2964 = !_2952;
    int _2966 = _2964 ? 0 : (-1);
    int _2968 = _2960 * as_type<int>(_2770);
    int _2970 = _2968 + _2954;
    int _2972 = ~_2800;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    int _2978 = abs(_2904);
    int _2980 = _2976 * as_type<int>(_2860);
    int _2982 = _2980 + _2942;
    int _2984 = abs(_2966);
    float _2986 = _1306 * _2890;
    int _2988 = ~_2962;
    int _2990 = _2988 + 1;
    int _2992 = _2990 + 1;
    float _2994 = _1304 * _2890;
    int _2996 = ~_2978;
    int _2998 = _2996 + 1;
    int _3000 = _2998 + 1;
    int _3002 = _2992 * as_type<int>(_2868);
    int _3004 = _3002 + _2982;
    int _3006 = ~_2608;
    int _3008 = _3006 + _2700;
    int _3010 = _3008 + 1;
    float _3012 = fma(_1326, _2882, _2994);
    bool _3014 = !_2444;
    int _3016 = _3014 ? 0 : 1;
    int _3018 = _3000 * as_type<int>(_2820);
    int _3020 = _3018 + _2970;
    int _3022 = ~_2984;
    int _3024 = _3022 + 1;
    int _3026 = _3024 + 1;
    int _3028 = _560 * _3010;
    int _3030 = _3028 + _1845;
    float _3032 = float(uint(_2918));
    float _3034 = _1306 * _2692;
    int _3036 = abs(_3016);
    int _3038 = _3026 * as_type<int>(_2828);
    int _3040 = _3038 + _3020;
    int _3042 = abs(_2918);
    float _3044 = fma(_1338, _2882, _2986);
    float _3046 = float(uint(_2950));
    float _3048 = 1.0 / _3032;
    bool _3050 = !_2450;
    int _3052 = _3050 ? 0 : 1;
    float _3054 = -_2886;
    float _3056 = fma(_1334, _3054, _3012);
    int _3058 = ~_3036;
    int _3060 = _3058 + 1;
    int _3062 = _3060 + 1;
    int _3064 = ~_2756;
    int _3066 = _3064 + _2844;
    int _3068 = _3066 + 1;
    float _3070 = 1.0 / _3046;
    int _3072 = abs(_3052);
    int _3074 = _3004 * _3062;
    bool _3076 = !_1522;
    int _3078 = _3076 ? _3030 : (-1);
    int _3080 = _592 * _3068;
    int _3082 = _3080 + _1837;
    float _3084 = float(uint(_3042));
    float _3086 = -_2692;
    float _3088 = _1312 * _3086;
    int _3090 = ~_3072;
    int _3092 = _3090 + 1;
    int _3094 = _3092 + 1;
    int _3096 = _3078 * _3036;
    int _3098 = _3096 + _3074;
    float _3100 = _1304 * _2692;
    bool _3102 = !_1767;
    int _3104 = _3102 ? _3082 : (-1);
    float _3106 = 1.0 / _3084;
    int _3108 = abs(_2950);
    int _3110 = _3094 * _3040;
    float _3112 = -_2840;
    float _3114 = _1312 * _3112;
    int _3116 = as_type<int>(_3048) + (-2);
    float _3118 = -_2890;
    float _3120 = _1312 * _3118;
    float _3122 = float(uint(_3108));
    int _3124 = _3104 * _3072;
    int _3126 = _3124 + _3110;
    float _3128 = float(uint(_3098));
    float _3130 = fma(_1324, _2594, _3114);
    float _3132 = 1.0 / _3122;
    int _3134 = abs(_3098);
    float _3136 = fma(_1324, _2688, _3088);
    float _3138 = float(uint(_3126));
    float _3140 = as_type<float>(_3116) * _3128;
    float _3142 = fma(_1324, _2882, _3120);
    int _3144 = ~_2918;
    int _3146 = _3144 + 1;
    float _3148 = _1304 * _2840;
    float _3150 = _1306 * _2840;
    int _3152 = as_type<int>(_3070) + (-2);
    float _3154 = trunc(_3140);
    float _3156 = precise::max(_3154, 0.0);
    uint _3158 = uint(_3156);
    int _3160 = as_type<int>(_3106) + (-2);
    float _3162 = fma(_1338, _2594, _3150);
    int _3164 = abs(_3126);
    float _3166 = as_type<float>(_3152) * _3138;
    float _3168 = float(uint(_3134));
    float _3170 = fma(_1338, _2688, _3034);
    int _3172 = as_type<int>(_3132) + (-2);
    float _3174 = -_2886;
    float _3176 = fma(_1318, _3174, _3142);
    float _3178 = float(uint(_3164));
    float _3180 = trunc(_3166);
    float _3182 = precise::max(_3180, 0.0);
    uint _3184 = uint(_3182);
    float _3186 = as_type<float>(_3160) * _3168;
    int _3188 = ~_2950;
    int _3190 = _3188 + 1;
    float _3192 = -_2219;
    float _3194 = _3192 + 1.0;
    float _3196 = fma(_1326, _2594, _3148);
    float _3198 = as_type<float>(_3172) * _3178;
    float _3200 = trunc(_3186);
    float _3202 = precise::max(_3200, 0.0);
    uint _3204 = uint(_3202);
    int _3206 = _3146 * int(_3158);
    int _3208 = _3206 + _3098;
    int _3210 = ~_3042;
    int _3212 = _3210 + 1;
    float _3214 = fma(_1326, _2688, _3100);
    float _3216 = _2372 * _2245;
    float _3218 = -_2372;
    float _3220 = _3218 + 1.0;
    float _3222 = float(uint(_3208));
    float _3224 = trunc(_3198);
    float _3226 = precise::max(_3224, 0.0);
    uint _3228 = uint(_3226);
    int _3230 = _3190 * int(_3184);
    int _3232 = _3230 + _3126;
    float _3234 = as_type<float>(_3116) * _3222;
    int _3236 = ~_3108;
    int _3238 = _3236 + 1;
    float _3240 = float(uint(_3232));
    int _3242 = _3212 * int(_3204);
    int _3244 = _3242 + _3134;
    float _3246 = trunc(_3234);
    float _3248 = precise::max(_3246, 0.0);
    uint _3250 = uint(_3248);
    float _3252 = as_type<float>(_3152) * _3240;
    float _3254 = -_2626;
    float _3256 = fma(_1318, _3254, _3130);
    float _3258 = float(uint(_3244));
    float _3260 = -_2690;
    float _3262 = fma(_1318, _3260, _3136);
    float _3264 = -_2690;
    float _3266 = fma(_1334, _3264, _3214);
    int _3268 = _3238 * int(_3228);
    int _3270 = _3268 + _3164;
    float _3272 = -_2626;
    float _3274 = fma(_1334, _3272, _3196);
    float _3276 = as_type<float>(_3160) * _3258;
    float _3278 = trunc(_3252);
    float _3280 = precise::max(_3278, 0.0);
    uint _3282 = uint(_3280);
    float _3284 = -_2690;
    float _3286 = fma(_1346, _3284, _3170);
    float _3288 = float(uint(_3270));
    float _3290 = -_2626;
    float _3292 = fma(_1346, _3290, _3162);
    float _3294 = _3266 * _320;
    float _3296 = _3266 * _312;
    float _3298 = _3266 * _324;
    float _3300 = as_type<float>(_3172) * _3288;
    float _3302 = trunc(_3276);
    float _3304 = precise::max(_3302, 0.0);
    uint _3306 = uint(_3304);
    float _3308 = _3274 * _312;
    float _3310 = _3056 * _312;
    int _3312 = ~_2918;
    int _3314 = _3312 + 1;
    float _3316 = fma(_3262, _294, _3294);
    float _3318 = fma(_3262, _290, _3296);
    float _3320 = fma(_3262, _298, _3298);
    int _3322 = int(_3158) + int(_3250);
    float _3324 = trunc(_3300);
    float _3326 = precise::max(_3324, 0.0);
    uint _3328 = uint(_3326);
    int _3330 = ~_2950;
    int _3332 = _3330 + 1;
    float _3334 = _3274 * _320;
    float _3336 = _3056 * _320;
    int _3338 = int(_3184) + int(_3282);
    float _3340 = _3274 * _324;
    int _3342 = ~_3108;
    int _3344 = _3342 + 1;
    float _3346 = fma(_3176, _294, _3336);
    int _3348 = int(_3204) + int(_3306);
    float _3350 = _3056 * _324;
    float _3352 = fma(_3256, _294, _3334);
    int _3354 = ~_3042;
    int _3356 = _3354 + 1;
    float _3358 = fma(_3176, _290, _3310);
    float _3360 = fma(_3176, _298, _3350);
    int _3362 = _3314 * _3322;
    int _3364 = _3362 + _3098;
    int _3366 = int(_3228) + int(_3328);
    int _3368 = _3356 * _3348;
    int _3370 = _3368 + _3134;
    float _3372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3374 = uint(_3364) >= uint(_2918);
    int _3376 = _3344 * _3366;
    int _3378 = _3376 + _3164;
    bool _3380 = uint(_3370) >= uint(_3042);
    int _3382 = _3332 * _3338;
    int _3384 = _3382 + _3126;
    bool _3386 = !_3374;
    int _3388 = _3386 ? 0 : (-1);
    float _3390 = fma(_3256, _290, _3308);
    bool _3392 = uint(_3378) >= uint(_3108);
    float _3394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3396 = uint(_3384) >= uint(_2950);
    float _3398 = -_2886;
    float _3400 = fma(_1346, _3398, _3044);
    int _3402 = ~_3322;
    int _3404 = _3402 + _3388;
    int _3406 = _3404 + 1;
    float _3408 = fma(_3256, _298, _3340);
    bool _3410 = !_3396;
    int _3412 = _3410 ? 0 : (-1);
    float _3414 = fma(_3292, _332, _3352);
    bool _3416 = _2918 == 0;
    int _3418 = _2918 * _3406;
    int _3420 = _3418 + _3098;
    bool _3422 = _2918 == 0;
    float _3424 = fma(_3292, _328, _3390);
    int _3426 = _3098 ^ _2918;
    float _3428 = fma(_3292, _336, _3408);
    int _3430 = _3126 ^ _2950;
    float _3432 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3434 = !_3380;
    int _3436 = _3434 ? 0 : (-1);
    bool _3438 = !_3392;
    int _3440 = _3438 ? 0 : (-1);
    float _3442 = _2266 * _3216;
    uint _3444 = uint(int(uint(_3430) >> uint(31)));
    out.m_85.x = _3414;
    out.m_85.y = _3424;
    out.m_85.z = _3428;
    int _3446 = ~_3338;
    int _3448 = _3446 + _3412;
    int _3450 = _3448 + 1;
    float _3452 = fma(_2256, _3442, _2254);
    bool _3454 = !_3416;
    int _3456 = _3454 ? _3420 : (-1);
    int _3458 = ~_3436;
    int _3460 = _3348 + _3458;
    int _3462 = _3460 + 1;
    int _3464 = _2950 * _3450;
    int _3466 = _3464 + _3126;
    float _3468 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _3470 = ~_3440;
    int _3472 = _3366 + _3470;
    int _3474 = _3472 + 1;
    float _3476 = _3394 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _3478 = uint(int(uint(_3426) >> uint(31)));
    int _3480 = ~int(_3444);
    int _3482 = _3480 + 1;
    float _3484 = fma(_3476, _2404, -0.5);
    float _3486 = float(_3456);
    bool _3488 = _2950 == 0;
    int _3490 = ~int(_3478);
    int _3492 = _3490 + 1;
    float _3494 = fma(_3476, _3486, _514);
    int _3496 = _3474 ^ _3482;
    bool _3498 = !_3488;
    int _3500 = _3498 ? _3466 : (-1);
    float _3502 = _3468 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3504 = _2950 == 0;
    float _3506 = _3432 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _3508 = _3462 ^ _3492;
    float _3510 = fma(_626, _3484, _3494);
    int _3512 = ~_3482;
    int _3514 = _3512 + _3496;
    int _3516 = _3514 + 1;
    float _3518 = _3372 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3520 = float(_3500);
    float _3522 = fma(_3506, _2434, -0.5);
    int _3524 = ~_3492;
    int _3526 = _3524 + _3508;
    int _3528 = _3526 + 1;
    float _3530 = fma(_3518, _2356, -0.5);
    bool _3532 = !_3504;
    int _3534 = _3532 ? _3516 : (-1);
    float _3536 = fma(_3506, _3520, _606);
    bool _3538 = !_3422;
    int _3540 = _3538 ? _3528 : (-1);
    float _3542 = fma(_3400, _332, _3346);
    float _3544 = float(_3534);
    float _3546 = fma(_3502, _2366, -0.5);
    float _3548 = float(_3540);
    float _3550 = fma(_594, _3522, _3536);
    float _3552 = _2256 * _3220;
    float _3554 = -_644;
    float _3556 = fma(_3502, _3544, _3554);
    float _3558 = fma(_3400, _328, _3358);
    float _3560 = -_516;
    float _3562 = fma(_3518, _3548, _3560);
    float _3564 = fma(_3286, _332, _3316);
    float _3566 = fma(_536, _3546, _3556);
    float _3568 = fma(_3286, _328, _3318);
    float _3570 = fma(_3286, _336, _3320);
    float _3572 = fma(_3400, _336, _3360);
    float _3574 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3576 = _2292 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_87.x = _3564;
    out.m_87.y = _3568;
    out.m_87.z = _3570;
    float _3578 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3574);
    float _3580 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3576);
    float _3582 = fma(_632, _3530, _3562);
    float _3584 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3578);
    float _3586 = fma(_1514, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3580);
    float _3588 = _3550 + 0.5;
    float _3590 = _3510 + 0.5;
    float _3592 = _3566 + 0.5;
    float _3594 = _3586 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3596 = _3582 + 0.5;
    float _3598 = _3584 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    out.m_89.x = _3542;
    out.m_89.y = _3558;
    out.m_89.z = _3572;
    bool _3600 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3602 = isnan(_1905);
    bool _3604 = _3600 || _3602;
    bool _3606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3608 = _3604 || _3606;
    float _3610 = 1.0 / _3598;
    float _3612 = _3594 + _3598;
    out.m_91.x = _3590;
    out.m_91.y = _3596;
    out.m_91.z = _3588;
    out.m_91.w = _3592;
    float _3614 = in.m_63.x;
    float _3616 = _2193 * 0.5;
    float _3618 = _3612 * _3610;
    float _3620 = _3618 * 0.5;
    float _3622 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3624 = fma(_3620, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3622);
    float _3626 = fma(_2099, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2320);
    float _3628 = 1.0 / _3624;
    float _3630 = fma(_2177, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3626);
    out.gl_Position.x = _2217;
    out.gl_Position.y = _2221;
    out.gl_Position.z = _3630;
    out.gl_Position.w = _2193;
    float _3632 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3634 = _3628 * _3632;
    float _3636 = abs(_3634);
    float _3638 = log2(_3636);
    float _3640 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3642 = exp2(_3640);
    float _3644 = fma(_3642, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3646 = precise::clamp(_3644, 0.0, 1.0);
    float _3648 = _3630 + _2193;
    float _3650 = fma(_3646, -2.0, 3.0);
    float _3652 = _3646 * _3646;
    bool _3654 = _3634 <= 8000.0;
    bool _3656 = isnan(_3634);
    bool _3658 = _3654 || _3656;
    bool _3660 = isnan(8000.0);
    bool _3662 = _3658 || _3660;
    float _3664 = float(_3662);
    float _3666 = fma(_2221, -0.5, _3616);
    float _3668 = _3652 * _3650;
    float _3670 = _3648 * 0.5;
    float _3672 = -_3668;
    float _3674 = _3672 + 1.0;
    float _3676 = fma(_3674, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3668);
    float _3678 = _2217 + _2193;
    float _3680 = _3664 * _3676;
    float _3682 = _3678 * 0.5;
    float _3684 = _2193;
    float _3686 = _3670;
    float _3688 = _3666;
    float _3690 = _3682;
    if (!_3608)
    {
        _2348 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3692 = _2348;
    float _3694 = _3680 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_93.x = _3682;
    out.m_93.y = _3666;
    out.m_93.z = _3670;
    out.m_93.w = _2193;
    float _3696 = _3194 * _3694;
    float _3698 = precise::clamp(_3696, 0.0, 1.0);
    float _3700 = -_3698;
    float _3702 = fma(_3700, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3704 = _2256 * _3216;
    float _3706 = _3702 * _3614;
    float _3708 = fma(_2262, _3704, _2250);
    float _3710 = fma(_2264, _3704, _2252);
    float _3712 = _3706 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3714 = _3706;
    float _3716 = _3692;
    float _3718 = _3692;
    if (!_3608)
    {
        _3714 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3720 = _3714;
    out.m_95.x = _3708;
    out.m_95.y = _3710;
    out.m_95.z = _3452;
    out.m_95.w = _3552;
    float _3722 = _3720;
    float _3724 = _3720;
    if (!_3608)
    {
        _3684 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3726 = _3684;
    float _3728 = _3726;
    float _3730 = _3726;
    if (!_3608)
    {
        _3686 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3732 = _3686;
    out.m_97.x = _3712;
    float _3734 = _3732;
    float _3736 = _3732;
    if (!_3608)
    {
        _3688 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3738 = _3688;
    float _3740 = _3738;
    float _3742 = _3738;
    if (!_3608)
    {
        _3690 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3744 = _3690;
    bool _3746 = !_3608;
    float _3748 = _3744;
    float _3750 = _3744;
    if (!_3746)
    {
        bool _3752 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3754 = isnan(_1905);
        bool _3756 = _3752 || _3754;
        bool _3758 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3760 = _3756 || _3758;
        if (!_3760)
        {
            float _3762 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3764 = _1905 + _3762;
            float _3766 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3768 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3766;
            float _3770 = 1.0 / _3768;
            float _3772 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3774 = _3772 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3776 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3778 = _3776 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3780 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3782 = _3780 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3784 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3786 = _3784 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3788 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3790 = _3788 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3792 = _3764 * _3770;
            float _3794 = precise::clamp(_3792, 0.0, 1.0);
            float _3796 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3798 = _3796 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3800 = fma(_3794, _3774, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3802 = fma(_3794, _3798, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3804 = fma(_3794, _3778, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3806 = fma(_3794, _3782, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3808 = fma(_3794, _3786, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3810 = fma(_3794, _3790, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3718 = _3802;
            _3742 = _3808;
            _3724 = _3800;
            _3736 = _3806;
            _3730 = _3804;
            _3750 = _3810;
            _3812 = true;
        }
        else
        {
            bool _3814 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3816 = isnan(_1905);
            bool _3818 = _3814 || _3816;
            bool _3820 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3822 = _3818 || _3820;
            if (!_3822)
            {
                _3722 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3824 = _3722;
            _3724 = _3824;
            if (!_3822)
            {
                _3716 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3826 = _3716;
            _3718 = _3826;
            if (!_3822)
            {
                _3728 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3828 = _3728;
            _3730 = _3828;
            if (!_3822)
            {
                _3734 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3830 = _3734;
            _3736 = _3830;
            if (!_3822)
            {
                _3740 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3832 = _3740;
            _3742 = _3832;
            if (!_3822)
            {
                _3748 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3834 = _3748;
            bool _3836 = !_3822;
            _3750 = _3834;
            if (!_3836)
            {
                bool _3838 = _1905 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3840 = isnan(_1905);
                bool _3842 = _3838 || _3840;
                bool _3844 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3846 = _3842 || _3844;
                if (!_3846)
                {
                    float _3848 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3850 = _1905 + _3848;
                    float _3852 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3854 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3852;
                    float _3856 = 1.0 / _3854;
                    float _3858 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3860 = _3858 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3862 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3864 = _3862 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3866 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3868 = _3866 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3870 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3872 = _3870 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3874 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3876 = _3874 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3878 = _3850 * _3856;
                    float _3880 = precise::clamp(_3878, 0.0, 1.0);
                    float _3882 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3884 = _3882 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3886 = fma(_3880, _3860, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3888 = fma(_3880, _3884, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3890 = fma(_3880, _3864, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3892 = fma(_3880, _3868, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3894 = fma(_3880, _3872, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3896 = fma(_3880, _3876, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3718 = _3888;
                    _3742 = _3894;
                    _3724 = _3886;
                    _3736 = _3892;
                    _3730 = _3890;
                    _3750 = _3896;
                    _3812 = true;
                }
                else
                {
                    _3718 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3742 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3724 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3736 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3730 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3750 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3812 = false;
    float _3898 = _3718;
    float _3900 = _3742;
    float _3902 = _3724;
    float _3904 = _3736;
    float _3906 = _3730;
    float _3908 = _3750;
    float _3910 = fma(_3424, -0.5, 0.5);
    float _3912 = precise::clamp(_3910, 0.0, 1.0);
    float _3914 = -_3898;
    float _3916 = _3914 + _3900;
    float _3918 = -_3902;
    float _3920 = _3918 + _3904;
    float _3922 = -_3906;
    float _3924 = _3922 + _3908;
    bool _3926 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3928 = fma(_3912, _3916, _3898);
    float _3930 = fma(_3912, _3920, _3902);
    float _3932 = fma(_3912, _3924, _3906);
    float _3934 = _3928 * 0.586610972881317138671875;
    out.m_99.x = 0.0;
    float _3936 = fma(_3930, 0.298911988735198974609375, _3934);
    float _3938 = fma(_3932, 0.114477999508380889892578125, _3936);
    float _3940 = -_3938;
    float _3942 = _3930 + _3940;
    float _3944 = -_3938;
    float _3946 = _3928 + _3944;
    float _3948 = -_3938;
    float _3950 = _3932 + _3948;
    float _3952 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3954 = fma(_3942, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    float _3956 = fma(_3946, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    float _3958 = fma(_3950, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3938);
    out.m_51.x = _3952;
    out.m_101.x = _3954;
    out.m_101.y = _3956;
    out.m_101.z = _3958;
    if (!_3926)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3960 = -_1891;
    float _3962 = _3960 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _3964 = -_1875;
    float _3966 = _3964 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _3968 = -_1500;
    float _3970 = _3968 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _3972 = _3962 * _3962;
    float _3974 = fma(_3966, _3966, _3972);
    float _3976 = fma(_3970, _3970, _3974);
    float _3978 = sqrt(_3976);
    float _3980 = rsqrt(_3976);
    float _3982 = -_3978;
    float _3984 = _3982 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3986 = _3984 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _3988 = precise::clamp(_3986, 0.0, 1.0);
    float _3990 = _3966 * _3980;
    float _3992 = _3962 * _3980;
    float _3994 = abs(_3988);
    float _3996 = log2(_3994);
    float _3998 = _3970 * _3980;
    float _4000 = _3990 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4002 = _3424 * _3992;
    float _4004 = -_3992;
    float _4006 = -_4000;
    float _4008 = fma(_4004, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4006);
    float _4010 = fma(_3414, _3990, _4002);
    float _4012 = -_3998;
    float _4014 = fma(_4012, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4008);
    float _4016 = fma(_3428, _3998, _4010);
    float _4018 = precise::clamp(_4016, 0.0, 1.0);
    float _4020 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4022 = _4014 + _4020;
    float _4024 = _3996 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4026 = _4022 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4028 = precise::clamp(_4026, 0.0, 1.0);
    float _4030 = exp2(_4024);
    float _4032 = _4030 * _4028;
    float _4034 = _4018 * _4032;
    float _4036 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4038 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4040 = _4034 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_99.x = _4036;
    out.m_99.y = _4038;
    out.m_99.z = _4040;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

