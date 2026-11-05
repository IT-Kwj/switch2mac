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
    float4 m_69 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_81 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_79 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_59 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_67 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_63 [[attribute(10)]];
    float4 m_55 [[attribute(11)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2113 = false;
    bool _310 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_114);
        out.gl_Position.z = _2411;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _118 = in.m_49.w;
    float _120 = float(_100);
    float _122 = -_118;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_118);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    bool _136 = _124 >= _120;
    bool _138 = !_134;
    bool _140 = _136 || _138;
    float _142 = _118;
    float _144 = _124;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2476 = as_type<float>(_150);
        out.gl_Position.z = _2476;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _120;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _124 * _158;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    bool _182 = !_160;
    float _200;
    if (!_182)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _162;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    bool _226 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_204);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -_220;
    float _240 = _238 + 1.0;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    float _246 = 1.0 / _224;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _250 = _236 * _240;
    float _252 = -_236;
    float _254 = _252 + 1.0;
    float _256 = _208 * _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _258;
    float _262 = fma(_244, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _264;
    float _268 = fma(_260, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _262 * _250;
    float _272 = fma(_266, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _276 = _272 * _250;
    float _278 = _268 * _250;
    float _280 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _284 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _278);
    float _286 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _288 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _290 = !_248;
    float _308;
    if (!_290)
    {
        float _292 = in.m_53.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _162;
    }
    _310 = false;
    float _312 = _308;
    float _314 = in.m_53.z;
    float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _318 = log2(_316);
    float _320 = in.m_55.x;
    float _322 = in.m_55.y;
    float _324 = in.m_55.z;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _336 = _334 != 0;
    float _338 = in.m_53.x;
    float _340 = abs(_162);
    float _342 = log2(_340);
    float _344 = in.m_53.y;
    float _346 = in.m_57.x;
    float _348 = in.m_57.y;
    float _350 = in.m_57.z;
    float _352 = _318 * _124;
    float _354 = in.m_44.x;
    float _356 = in.m_44.y;
    float _358 = in.m_44.z;
    float _360 = _314 * 2.0;
    float _362 = exp2(_352);
    float _364 = fma(_320, 2.0, -1.0);
    float _366 = fma(_322, 2.0, -1.0);
    float _368 = fma(_324, 2.0, -1.0);
    float _370 = _338 * 2.0;
    float _372 = floor(_360);
    float _374 = _344 * 2.0;
    float _376 = _288 * _350;
    float _378 = floor(_370);
    float _380 = _344 + _314;
    float _382 = -_362;
    float _384 = _382 + 1.0;
    float _386 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = _380 + (-1.0);
    float _392 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = floor(_374);
    bool _398 = _372 > 0.0;
    float _400 = _338 + _344;
    bool _402 = _372 >= 0.0;
    bool _404 = isnan(_372);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _414 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    float _416 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    int _418 = _410 ? 0 : 1;
    float _420 = _400 + (-1.0);
    float _422 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    int _424 = ~_418;
    int _426 = _424 + 1;
    int _428 = _426 + 1;
    float _430 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _414);
    bool _432 = _378 > 0.0;
    float _434 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _428;
    if (!_398)
    {
        int _438 = ~_418;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    bool _446 = _378 >= 0.0;
    bool _448 = isnan(_378);
    bool _450 = _446 || _448;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    float _456 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _458 = _396 > 0.0;
    float _460 = _422 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _462 = _396 >= 0.0;
    bool _464 = isnan(_396);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -_456;
    float _474 = _472 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _476 = in.m_59.x;
    float _478 = in.m_59.y;
    float _480 = in.m_59.z;
    float _482 = _286 * _348;
    bool _484 = !_328;
    int _486 = _484 ? 0 : 1;
    float _488 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = float(_442);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _494 = 1.0 + _492;
    int _496 = abs(_486);
    float _498 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _500 = _454 ? 0 : 1;
    float _502 = 1.0 / _494;
    float _504 = float(_496);
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    bool _516 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _524 = _520 || _522;
    float _526 = _504 * _490;
    bool _528 = !_332;
    int _530 = _528 ? 0 : 1;
    float _532 = _524 ? _384 : 0.0;
    float _534 = _526 * (-2.0);
    int _536 = ~_500;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = _338 + (-0.5);
    int _544 = _540;
    float _546 = _460;
    if (!_432)
    {
        int _548 = ~_500;
        int _550 = _548 + 1;
        _544 = _550;
    }
    int _552 = _544;
    float _554 = fma(_534, _476, _476);
    int _556 = abs(_530);
    if (_514)
    {
        float _558 = _532 * _502;
        _144 = _558;
    }
    float _560 = _144;
    float _562 = fma(_434, _534, _434);
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _566 = _342 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _568 = _444 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = -_460;
    float _572 = _570 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = float(_556);
    float _576 = _474 * _474;
    float _578 = float(_552);
    float _580 = -_568;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _584 = fma(_562, _560, _564);
    float _586 = fma(_572, _572, _576);
    bool _588 = !_336;
    int _590 = _588 ? 0 : 1;
    float _592 = _574 * _578;
    int _594 = _470 ? 0 : 1;
    float _596 = fma(_582, _582, _586);
    int _598 = abs(_590);
    float _600 = _592 * (-2.0);
    int _602 = ~_594;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = in.m_61.x;
    float _610 = in.m_61.y;
    float _612 = in.m_61.z;
    int _614 = _606;
    float _616 = _568;
    if (!_458)
    {
        int _618 = ~_594;
        int _620 = _618 + 1;
        _614 = _620;
    }
    int _622 = _614;
    float _624 = rsqrt(_596);
    float _626 = fma(_412, _600, _412);
    float _628 = fma(_600, _478, _478);
    float _630 = _344 + (-0.5);
    float _632 = float(_598);
    float _634 = _584 * 0.15915493667125701904296875;
    float _636 = float(_622);
    float _638 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].y, _628);
    float _640 = exp2(_566);
    float _642 = _338 + _314;
    float _644 = _280 * _346;
    float _646 = fma(_626, _560, _638);
    float _648 = _632 * _636;
    float _650 = _642 + (-1.0);
    float _652 = _314 + (-0.5);
    float _654 = _572 * _624;
    float _656 = _648 * (-2.0);
    float _658 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _660 = _582 * _624;
    float _662 = _474 * _624;
    float _664 = fma(_656, _480, _480);
    float _666 = -_610;
    float _668 = _366 + _666;
    float _670 = fma(_658, _656, _658);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _674 = _654 * _672;
    float _676 = -_608;
    float _678 = _364 + _676;
    float _680 = fma(_640, _668, _610);
    float _682 = -_612;
    float _684 = _368 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _688 = _660 * _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _692 = -_674;
    float _694 = fma(_660, _690, _692);
    float _696 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[196].z, _664);
    float _698 = fma(_640, _678, _608);
    float _700 = fma(_640, _684, _612);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _704 = _662 * _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _708 = -_688;
    float _710 = fma(_662, _706, _708);
    float _712 = _694 * _694;
    float _714 = fma(_670, _560, _696);
    float _716 = _646 * 0.15915493667125701904296875;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_704;
    float _722 = fma(_654, _718, _720);
    float _724 = fma(_710, _710, _712);
    float _726 = _714 * 0.15915493667125701904296875;
    float _728 = _716 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _698);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _700);
    float _738 = _716 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _732 * _734;
    float _744 = _488 * _736;
    float _746 = _634 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_722, _722, _724);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _680);
    float _754 = _498 * _752;
    float _756 = _634 * 6.283185482025146484375;
    float _758 = cos(_756);
    float _760 = _726 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _748 * _730;
    float _766 = _748 * _740;
    float _768 = _726 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _758 * _740;
    float _774 = _758 * _730;
    float _776 = rsqrt(_750);
    float _778 = _758 * _762;
    float _780 = _748 * _762;
    float _782 = _740 * _762;
    float _784 = _730 * _762;
    float _786 = _780 * _754;
    float _788 = fma(_770, _772, _764);
    float _790 = fma(_770, _764, _772);
    float _792 = _778 * _754;
    float _794 = -_774;
    float _796 = fma(_770, _766, _794);
    float _798 = -_754;
    float _800 = _770 * _798;
    float _802 = -_766;
    float _804 = fma(_770, _774, _802);
    float _806 = fma(_788, _742, _792);
    float _808 = fma(_796, _742, _786);
    float _810 = _710 * _776;
    float _812 = _694 * _776;
    float _814 = fma(_782, _742, _800);
    float _816 = _722 * _776;
    float _818 = _662 * _810;
    float _820 = fma(_804, _744, _806);
    float _822 = _660 * _812;
    float _824 = fma(_784, _744, _814);
    float _826 = -_818;
    float _828 = fma(_654, _812, _826);
    float _830 = fma(_790, _744, _808);
    float _832 = -_822;
    float _834 = fma(_662, _816, _832);
    float _836 = _828 * _820;
    float _838 = _834 * _820;
    float _840 = fma(_816, _824, _836);
    float _842 = fma(_810, _824, _838);
    float _844 = fma(_660, _830, _840);
    float _846 = fma(_654, _830, _842);
    float _848 = _568 + _844;
    float _850 = _460 + _846;
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _854 = _848 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _858 = _850 + _856;
    float _860 = _854 * _854;
    float _862 = fma(_858, _858, _860);
    float _864 = _654 * _816;
    float _866 = sqrt(_862);
    float _868 = -_864;
    float _870 = fma(_660, _810, _868);
    float _872 = _870 * _820;
    float _874 = fma(_812, _824, _872);
    float _876 = fma(_662, _830, _874);
    bool _878 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _880 = _456 + _876;
    float _882 = _872;
    float _884 = _874;
    float _886 = _850;
    float _888 = _754;
    if (!_878)
    {
        _882 = _848;
    }
    float _890 = _882;
    float _892 = _890;
    if (!_878)
    {
        _884 = _880;
    }
    float _894 = _884;
    bool _896 = !_878;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _866 + _902;
        float _906 = _880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = rsqrt(_862);
        float _910 = _904 * _900;
        float _912 = _910 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = sin(_918);
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_920, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = fma(_880, _916, _924);
        float _930 = _908 * _926;
        float _932 = fma(_858, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _934 = fma(_854, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _898 = _928;
        _886 = _932;
        _892 = _934;
    }
    float _936 = _898;
    float _938 = _886;
    float _940 = _892;
    float _942 = -_456;
    float _944 = _942 + _936;
    float _946 = -_460;
    float _948 = _946 + _938;
    float _950 = -_568;
    float _952 = _950 + _940;
    float _954 = _456 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _956 = _944 * _944;
    bool _958 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _960 = isnan(0.5);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _966 = _962 || _964;
    float _968 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].x, _954);
    float _970 = fma(_948, _948, _956);
    bool _972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _974 = isnan(0.5);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _980 = _976 || _978;
    float _982 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[11].z, _968);
    float _984 = fma(_952, _952, _970);
    float _986 = _456 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _988 = _982 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _990 = sqrt(_984);
    float _992 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].x, _986);
    float _994 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[10].z, _992);
    float _996 = 1.0 / _988;
    float _998 = _994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1000 = _998 + _988;
    bool _1002 = _990 > 0.0;
    float _1004 = _1000 * _996;
    float _1006 = _1004 * 0.5;
    bool _1008 = !_1002;
    float _1010 = _938;
    float _1012 = _936;
    float _1014 = _940;
    float _1016 = _990;
    float _1018 = _948;
    float _1020 = _944;
    float _1022 = _998;
    if (!_1008)
    {
        float _1024 = _176 * _176;
        float _1026 = fma(_178, _178, _1024);
        float _1028 = fma(_180, _180, _1026);
        float _1030 = rsqrt(_984);
        float _1032 = sqrt(_1028);
        float _1034 = _948 * _1030;
        float _1036 = _944 * _1030;
        float _1038 = _952 * _1030;
        bool _1040 = _1032 > 0.0;
        bool _1042 = !_1040;
        _1016 = _1038;
        _1018 = _1034;
        _1020 = _1036;
        _1022 = _1028;
        if (!_1042)
        {
            float _1044 = rsqrt(_1028);
            float _1046 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1048 = _176 * _1044;
            float _1050 = _178 * _1044;
            float _1052 = _180 * _1044;
            float _1054 = _1036 * _1048;
            float _1056 = fma(_1034, _1050, _1054);
            float _1058 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1060 = fma(_1038, _1052, _1056);
            float _1062 = _1060 * _1058;
            float _1064 = fma(_178, _1062, _938);
            float _1066 = fma(_176, _1062, _936);
            float _1068 = fma(_180, _1062, _940);
            _1010 = _1064;
            _1012 = _1066;
            _1014 = _1068;
        }
    }
    float _1070 = _1010;
    float _1072 = _1012;
    float _1074 = _1014;
    float _1076 = _1016;
    float _1078 = _1018;
    float _1080 = _1020;
    float _1082 = _1022;
    float _1084 = _1076;
    float _1086 = _1078;
    float _1088 = _1080;
    float _1090 = _1082;
    if (_980)
    {
        _1084 = 1.0;
    }
    float _1092 = _1084;
    float _1094 = _1092;
    if (_966)
    {
        _1086 = _1070;
    }
    float _1096 = _1086;
    float _1098 = _1096;
    if (_966)
    {
        _888 = _1072;
    }
    float _1100 = _888;
    float _1102 = _1100;
    if (_966)
    {
        _1088 = _1074;
    }
    float _1104 = _1088;
    float _1106 = _1104;
    if (!_966)
    {
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1110 = _456 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1114 = _460 + _1112;
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = -_460;
        float _1120 = _1118 + _1070;
        float _1122 = _1110 * _1110;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1126 = _568 + _1124;
        float _1128 = -_456;
        float _1130 = _1128 + _1072;
        float _1132 = -_568;
        float _1134 = _1132 + _1074;
        float _1136 = fma(_1114, _1114, _1122);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = fma(_1126, _1126, _1136);
        float _1142 = sqrt(_1140);
        float _1144 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1138;
        float _1150 = _1144 * _1148;
        float _1152 = fma(_1120, _1150, _460);
        float _1154 = fma(_1130, _1150, _456);
        float _1156 = fma(_1134, _1150, _568);
        _1102 = _1154;
        _1098 = _1152;
        _1106 = _1156;
    }
    float _1158 = _1102;
    float _1160 = _1098;
    float _1162 = _1106;
    if (!_980)
    {
        float _1164 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1172 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1170);
        float _1174 = _1166 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        float _1178 = _1168 * 0.15915493667125701904296875;
        float _1180 = _1166 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = 1.0 / _1176;
        float _1186 = _1178 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1182 * _1184;
        float _1192 = _1178 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1188 * _1190;
        float _1198 = 1.0 / _1172;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = 1.0 / _1196;
        float _1206 = 1.0 / _1202;
        float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1210 = _1198 * _1208;
        float _1212 = _1194 * _1204;
        float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1216 = fma(_1212, _1210, _1214);
        float _1218 = _1216 * _1206;
        float _1220 = precise::clamp(_1218, 0.0, 1.0);
        _616 = _1204;
        _546 = _1178;
        _1094 = _1220;
    }
    float _1222 = _616;
    float _1224 = _546;
    float _1226 = _1094;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1158 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1160 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1162 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1222;
    float _1278 = _1230;
    float _1280 = _1224;
    if (_1264)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1282;
    }
    float _1284 = _1270;
    if (_1264)
    {
        float _1286 = rsqrt(_1260);
        _1272 = _1286;
    }
    float _1288 = _1272;
    float _1290 = _1288;
    if (_1264)
    {
        float _1292 = _1268 * _1284;
        _1274 = _1292;
    }
    float _1294 = _1274;
    if (_1264)
    {
        float _1296 = _1294 * 0.15915493667125701904296875;
        _1276 = _1296;
    }
    float _1298 = _1276;
    float _1300 = _1284;
    if (_1264)
    {
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1246;
    float _1314 = _1310;
    if (_1264)
    {
        float _1316 = _1298 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1250;
    float _1324 = -_1310;
    float _1326 = fma(_1230, _1322, _1324);
    if (_1264)
    {
        float _1328 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1328;
    }
    float _1330 = _1314;
    float _1332 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1330;
    float _1336 = _1306;
    if (_1264)
    {
        float _1338 = fma(_1306, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    if (!_1264)
    {
        _1336 = _1252;
    }
    float _1344 = _1336;
    float _1346 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1348 = _1344;
    float _1350 = _1320;
    if (_1264)
    {
        float _1352 = _1320 + (-1.0);
        _1278 = _1352;
    }
    float _1354 = _1278;
    float _1356 = _1354;
    if (_1264)
    {
        float _1358 = _1288 * _1340;
        _1090 = _1358;
    }
    float _1360 = _1090;
    if (!_1264)
    {
        _1342 = _1326;
    }
    float _1362 = _1342;
    float _1364 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1346);
    float _1366 = _1362;
    if (_1264)
    {
        float _1368 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1368;
    }
    float _1370 = _1280;
    if (_1264)
    {
        float _1372 = _1252 * _1360;
        _1348 = _1372;
    }
    float _1374 = _1348;
    if (!_1264)
    {
        _1356 = _1254;
    }
    float _1376 = _1356;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = _1254 * _1360;
        _1378 = _1380;
    }
    float _1382 = _1378;
    if (!_1264)
    {
        _1290 = _1256;
    }
    float _1384 = _1290;
    float _1386 = _1384;
    if (_1264)
    {
        float _1388 = fma(_1326, _1320, _1370);
        _1366 = _1388;
    }
    float _1390 = _1366;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (!_1264)
    {
        _1350 = _1258;
    }
    float _1396 = _1350;
    float _1398 = _1396;
    if (_1264)
    {
        float _1400 = _1382 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = fma(_1390, _1390, _1394);
    float _1406 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1408 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1410 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1412 = _1404 + _1402;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1416 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1414);
    float _1418 = precise::clamp(_1416, 0.0, 1.0);
    float _1420 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1406);
    float _1422 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1408);
    float _1424 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1426 = -_1418;
    float _1428 = _1426 + 1.0;
    float _1430 = rsqrt(_1412);
    float _1432 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1434 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1436 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1424);
    float _1438 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1446 = abs(_1428);
    float _1448 = log2(_1446);
    float _1450 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1452 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1454 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1456 = -_1452;
    float _1458 = fma(_1456, _1410, 1.0);
    float _1460 = _1430 * _1374;
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1450);
    float _1464 = _1430 * _1390;
    float _1466 = _1430 * _1382;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1462);
    float _1472 = log2(_1458);
    float _1474 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1476 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = -_1468;
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1478);
    float _1482 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1474);
    float _1486 = -_1466;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1480);
    float _1490 = exp2(_1476);
    float _1492 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1494 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1484);
    float _1496 = fma(_1488, -0.5, 0.5);
    float _1498 = fma(_1488, 0.5, 0.5);
    float _1500 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1492);
    float _1502 = _1464 + 1.0;
    float _1504 = 1.0 / _1482;
    float _1506 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1508 = fma(_1498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1510 = _1472 * 0.693147182464599609375;
    float _1512 = fma(_1498, _1508, -0.212114393711090087890625);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = sqrt(_1496);
    float _1518 = -_1464;
    float _1520 = fma(_1490, _1502, _1518);
    float _1522 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1506);
    float _1524 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1526 = fma(_1498, _1512, 1.570728778839111328125);
    float _1528 = fma(_1520, 0.5, 0.5);
    float _1530 = _1522 * _1504;
    float _1532 = _1524 * _1504;
    float _1534 = fma(_1530, 0.5, 0.5);
    float _1536 = fma(_1532, -0.5, 0.5);
    float _1538 = _1516 * 0.636619746685028076171875;
    float3 _4599 = float3(_1534, _1536, _1514);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4599, float3(0.0), isnan(_4599)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4599, float3(0.0), isnan(_4599)), level(0.0)).x;
    float _1542 = -_1526;
    float _1544 = fma(_1538, _1542, 1.0);
    float3 _4615 = float3(_1534, _1536, _1514);
    float4 _1547 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4615, float3(0.0), isnan(_4615)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4615, float3(0.0), isnan(_4615)), level(0.0)).xyzw;
    float _1549 = _1547.x;
    float _1551 = _1547.y;
    float _1553 = _1547.z;
    float _1555 = _1547.w;
    float2 _4632 = float2(_1544, _1528);
    float3 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4632, float2(0.0), isnan(_4632)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4632, float2(0.0), isnan(_4632)), level(0.0)).xyz;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _312 + _1567;
    float _1571 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1573 = _344 > 0.5;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1579;
    bool _1583 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1585 = isnan(_312);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1599 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1601 = isnan(_312);
    bool _1603 = _1599 || _1601;
    bool _1605 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1607 = _1603 || _1605;
    float _1609 = float(_1607);
    float _1611 = 1.0 / _1577;
    float _1613 = -_1593;
    float _1615 = _1613 + 1.0;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1621 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1623 = isnan(_312);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = _1609 * _1615;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1637 = _1635 != 0;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1645 = _1643 != 0;
    float _1647 = -_1631;
    float _1649 = _1647 + 1.0;
    float _1651 = 1.0 / _1619;
    bool _1653 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1655 = isnan(_312);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1667 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1669 = isnan(_312);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = _1581 * _1611;
    float _1681 = -_1609;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1689 = in.m_63.x;
    float _1691 = 1.0 / _1641;
    float _1693 = _1631 * _1683;
    float _1695 = _1663 * _1649;
    float _1697 = in.m_63.y;
    float _1699 = -_1663;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_1679, _1569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1705 = _338 > 0.5;
    bool _1707 = _1705 && _1637;
    float _1709 = 1.0 / _1687;
    float _1711 = _1677 * _1701;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1713;
    float _1717 = _1597 * _1651;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1721 = _312 + _1719;
    float _1723 = _1703 * _1711;
    float _1725 = -_1677;
    float _1727 = _1725 + 1.0;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1733 = _1715 * _1691;
    float _1735 = fma(_1717, _1721, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1741 = _312 + _1739;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = _778 * _828;
    float _1747 = fma(_1735, _1695, _1737);
    float _1749 = _1721;
    float _1751 = _1689;
    float _1753 = _1482;
    float _1755 = _1524;
    float _1757 = _1522;
    if (_1637)
    {
        _1749 = _1689;
    }
    float _1759 = _1749;
    float _1761 = _1731 * _1709;
    float _1763 = fma(_1733, _1741, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1767 = _312 + _1765;
    float _1769 = -_1697;
    float _1771 = _1769 + 1.0;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1775 = _1759;
    float _1777 = _1697;
    if (_1707)
    {
        float _1779 = -_1759;
        float _1781 = _1779 + 1.0;
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = fma(_1761, _1767, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1787 = fma(_1763, _1693, _1747);
    if (_1645)
    {
        float _1789 = _1573 ? _1771 : _1697;
        _1777 = _1789;
    }
    float _1791 = _1777;
    float _1793 = _778 * _834;
    if (_1637)
    {
        _1751 = _1783;
    }
    float _1795 = _1751;
    float _1797 = fma(_1785, _1633, _1787);
    bool _1799 = _680 != 0.0;
    bool _1801 = isnan(_680);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.0);
    bool _1807 = _1803 || _1805;
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1811 = exp2(_1571);
    float _1813 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1815 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1797);
    float _1817 = _1809 * _1743;
    float _1819 = _778 * _870;
    float _1821 = _1813 * _1773;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1827 = _698 == 0.0;
    bool _1829 = !_1807;
    bool _1831 = _1827 && _1829;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1837 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1843 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1845 = _788 * _834;
    out.m_65.x = _1835;
    out.m_65.y = _1839;
    out.m_65.z = _1841;
    out.m_65.w = _1837;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1849 = _700 == 0.0;
    bool _1851 = _1849 && _1831;
    float _1853 = in.m_67.x;
    float _1855 = in.m_67.y;
    float _1857 = in.m_67.z;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1863 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1865 = _788 * _870;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1871 = -_770;
    float _1873 = fma(_1871, _810, _1793);
    float _1875 = _788 * _828;
    float _1877 = -_1811;
    float _1879 = _1877 + 1.0;
    float _1881 = -_770;
    float _1883 = fma(_1881, _812, _1819);
    float _1885 = -_770;
    float _1887 = fma(_1885, _816, _1745);
    out.m_69.x = _1863;
    out.m_69.y = _1867;
    out.m_69.z = _1869;
    out.m_69.w = _1843;
    float _1889 = _804 * _834;
    float _1891 = _804 * _870;
    float _1893 = fma(_782, _812, _1865);
    out.m_71.x = _1821;
    out.m_71.y = _1817;
    float _1895 = fma(_780, _654, _1873);
    float _1897 = _804 * _828;
    float _1899 = fma(_782, _816, _1875);
    float _1901 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1903 = fma(_784, _812, _1891);
    float _1905 = fma(_784, _816, _1897);
    float _1907 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1665);
    float _1909 = _1855;
    float _1911 = _1853;
    float _1913 = _1857;
    if (!_1851)
    {
        float _1915 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _1909 = _1915;
    }
    float _1917 = _1909;
    if (!_1851)
    {
        float _1919 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1853);
        _1911 = _1919;
    }
    float _1921 = _1911;
    float _1923 = fma(_782, _810, _1845);
    float _1925 = fma(_780, _662, _1883);
    float _1927 = fma(_780, _660, _1887);
    float _1929 = fma(_784, _810, _1889);
    float _1931 = fma(_796, _654, _1923);
    float _1933 = fma(_796, _662, _1893);
    float _1935 = _1895 * _1917;
    float _1937 = _1925 * _1917;
    float _1939 = fma(_796, _660, _1899);
    float _1941 = _1927 * _1917;
    float _1943 = fma(_790, _654, _1929);
    float _1945 = fma(_790, _662, _1903);
    float _1947 = fma(_1931, _1921, _1935);
    if (!_1851)
    {
        float _1949 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _1913 = _1949;
    }
    float _1951 = _1913;
    float _1953 = fma(_1933, _1921, _1937);
    float _1955 = fma(_790, _660, _1905);
    float _1957 = fma(_1939, _1921, _1941);
    float _1959 = fma(_1943, _1951, _1947);
    float _1961 = fma(_1945, _1951, _1953);
    float _1963 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1965 = fma(_1955, _1951, _1957);
    bool _1967 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1969 = isnan(_1248);
    bool _1971 = _1967 || _1969;
    bool _1973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1975 = _1971 || _1973;
    float _1977 = _1522 + _1482;
    float _1979 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1963);
    float _1981 = _1482 * 0.5;
    out.m_73.x = _1959;
    out.m_73.y = _1961;
    out.m_73.z = _1965;
    float _1983 = _1979 + _1482;
    float _1985 = _1977 * 0.5;
    float _1987 = fma(_1524, -0.5, _1981);
    float _1989 = _1983 * 0.5;
    out.gl_Position.x = _1522;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1482;
    out.m_75.x = _1985;
    out.m_75.y = _1987;
    out.m_75.z = _1989;
    out.m_75.w = _1482;
    float _1991 = _1979;
    float _1993 = _1985;
    if (!_1975)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1995 = _1753;
    float _1997 = _1995;
    float _1999 = _1995;
    if (!_1975)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2001 = _1991;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1975)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    float _2011 = _2007;
    if (!_1975)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2013 = _1755;
    float _2015 = _2013;
    float _2017 = _2013;
    if (!_1975)
    {
        _1757 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2019 = _1757;
    float _2021 = _1901 * _1540;
    float _2023 = -_1901;
    float _2025 = _2023 + 1.0;
    float _2027 = _1555 * _2021;
    float _2029 = _1555 * _2025;
    float _2031 = _1565 * _2021;
    float _2033 = fma(_1561, _2027, _1549);
    float _2035 = fma(_1563, _2027, _1551);
    float _2037 = _2027;
    float _2039 = _2019;
    float _2041 = _2019;
    if (!_1975)
    {
        _2037 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2043 = _2037;
    float _2045 = fma(_1555, _2031, _1553);
    out.m_77.x = _2033;
    out.m_77.y = _2035;
    out.m_77.z = _2045;
    out.m_77.w = _2029;
    bool _2047 = !_1975;
    float _2049 = _2043;
    float _2051 = _2043;
    if (!_2047)
    {
        bool _2053 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2055 = isnan(_1248);
        bool _2057 = _2053 || _2055;
        bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2061 = _2057 || _2059;
        if (!_2061)
        {
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2065 = _1248 + _2063;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2067;
            float _2071 = 1.0 / _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2093 = _2065 * _2071;
            float _2095 = precise::clamp(_2093, 0.0, 1.0);
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2101 = fma(_2095, _2075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2103 = fma(_2095, _2099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2105 = fma(_2095, _2079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2107 = fma(_2095, _2083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2109 = fma(_2095, _2087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2111 = fma(_2095, _2091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2011 = _2103;
            _2017 = _2109;
            _2051 = _2101;
            _2005 = _2107;
            _1999 = _2105;
            _2041 = _2111;
            _2113 = true;
        }
        else
        {
            bool _2115 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2117 = isnan(_1248);
            bool _2119 = _2115 || _2117;
            bool _2121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2123 = _2119 || _2121;
            if (!_2123)
            {
                _2049 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2125 = _2049;
            _2051 = _2125;
            if (!_2123)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2127 = _2009;
            _2011 = _2127;
            if (!_2123)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2129 = _1997;
            _1999 = _2129;
            if (!_2123)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2131 = _2003;
            _2005 = _2131;
            if (!_2123)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2133 = _2015;
            _2017 = _2133;
            if (!_2123)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2135 = _2039;
            bool _2137 = !_2123;
            _2041 = _2135;
            if (!_2137)
            {
                bool _2139 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2141 = isnan(_1248);
                bool _2143 = _2139 || _2141;
                bool _2145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2147 = _2143 || _2145;
                if (!_2147)
                {
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2151 = _1248 + _2149;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2153;
                    float _2157 = 1.0 / _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2179 = _2151 * _2157;
                    float _2181 = precise::clamp(_2179, 0.0, 1.0);
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2187 = fma(_2181, _2161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2189 = fma(_2181, _2185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2191 = fma(_2181, _2165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2193 = fma(_2181, _2169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2195 = fma(_2181, _2173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2197 = fma(_2181, _2177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2011 = _2189;
                    _2017 = _2195;
                    _2051 = _2187;
                    _2005 = _2193;
                    _1999 = _2191;
                    _2041 = _2197;
                    _2113 = true;
                }
                else
                {
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2051 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2113 = false;
    float _2199 = _2011;
    float _2201 = _2017;
    float _2203 = _2051;
    float _2205 = _2005;
    float _2207 = _1999;
    float _2209 = _2041;
    float _2211 = fma(_1961, -0.5, 0.5);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = -_2199;
    float _2217 = _2215 + _2201;
    float _2219 = _1226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2221 = -_2203;
    float _2223 = _2221 + _2205;
    float _2225 = fma(_2213, _2217, _2199);
    out.m_79.x = 0.0;
    float _2227 = -_2207;
    float _2229 = _2227 + _2209;
    float _2231 = fma(_2213, _2223, _2203);
    float _2233 = _2225 * 0.586610972881317138671875;
    out.m_47.x = _2219;
    bool _2235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2237 = fma(_2213, _2229, _2207);
    float _2239 = fma(_2231, 0.298911988735198974609375, _2233);
    bool _2241 = _1226 > 0.0;
    bool _2243 = isnan(_1226);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = fma(_2237, 0.114477999508380889892578125, _2239);
    float _2253 = -_2251;
    float _2255 = _2231 + _2253;
    float _2257 = -_2251;
    float _2259 = _2225 + _2257;
    float _2261 = -_2251;
    float _2263 = _2237 + _2261;
    float _2265 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2267 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2269 = fma(_2263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    bool _2271 = !_2235;
    if (!_2271)
    {
        float _2273 = -_1158;
        float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2277 = -_1160;
        float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2281 = -_1162;
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2285 = _2275 * _2275;
        float _2287 = fma(_2279, _2279, _2285);
        float _2289 = fma(_2283, _2283, _2287);
        float _2291 = sqrt(_2289);
        float _2293 = rsqrt(_2289);
        float _2295 = -_2291;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2299 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = _2279 * _2293;
        float _2305 = _2275 * _2293;
        float _2307 = abs(_2301);
        float _2309 = log2(_2307);
        float _2311 = _2283 * _2293;
        float _2313 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2315 = _1961 * _2305;
        float _2317 = -_2305;
        float _2319 = -_2313;
        float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2319);
        float _2323 = fma(_1959, _2303, _2315);
        float _2325 = -_2311;
        float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2321);
        float _2329 = fma(_1965, _2311, _2323);
        float _2331 = precise::clamp(_2329, 0.0, 1.0);
        float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2335 = _2327 + _2333;
        float _2337 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2341 = precise::clamp(_2339, 0.0, 1.0);
        float _2343 = exp2(_2337);
        float _2345 = _2343 * _2341;
        float _2347 = _2331 * _2345;
        float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2353 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2349;
        out.m_79.y = _2351;
        out.m_79.z = _2353;
    }
    out.m_81.x = _2265;
    out.m_81.y = _2267;
    out.m_81.z = _2269;
    if (_2249)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2355;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2113 = false;
    bool _310 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_114);
        out.gl_Position.z = _2411;
    }
    if (!_104)
    {
        return out;
    }
    float _118 = in.m_49.w;
    float _120 = float(_100);
    float _122 = -_118;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_118);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    bool _136 = _124 >= _120;
    bool _138 = !_134;
    bool _140 = _136 || _138;
    float _142 = _118;
    float _144 = _124;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2476 = as_type<float>(_150);
        out.gl_Position.z = _2476;
    }
    if (_140)
    {
        return out;
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _120;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _124 * _158;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    bool _182 = !_160;
    float _200;
    if (!_182)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _162;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    bool _226 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_204);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -_220;
    float _240 = _238 + 1.0;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    float _246 = 1.0 / _224;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _250 = _236 * _240;
    float _252 = -_236;
    float _254 = _252 + 1.0;
    float _256 = _208 * _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _258;
    float _262 = fma(_244, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _264;
    float _268 = fma(_260, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _262 * _250;
    float _272 = fma(_266, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _276 = _272 * _250;
    float _278 = _268 * _250;
    float _280 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _284 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _278);
    float _286 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _288 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _290 = !_248;
    float _308;
    if (!_290)
    {
        float _292 = in.m_53.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _162;
    }
    _310 = false;
    float _312 = _308;
    float _314 = in.m_53.z;
    float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _318 = log2(_316);
    float _320 = in.m_55.x;
    float _322 = in.m_55.y;
    float _324 = in.m_55.z;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _336 = _334 != 0;
    float _338 = in.m_53.x;
    float _340 = abs(_162);
    float _342 = log2(_340);
    float _344 = in.m_53.y;
    float _346 = in.m_57.x;
    float _348 = in.m_57.y;
    float _350 = in.m_57.z;
    float _352 = _318 * _124;
    float _354 = in.m_44.x;
    float _356 = in.m_44.y;
    float _358 = in.m_44.z;
    float _360 = _314 * 2.0;
    float _362 = exp2(_352);
    float _364 = fma(_320, 2.0, -1.0);
    float _366 = fma(_322, 2.0, -1.0);
    float _368 = fma(_324, 2.0, -1.0);
    float _370 = _338 * 2.0;
    float _372 = floor(_360);
    float _374 = _344 * 2.0;
    float _376 = _288 * _350;
    float _378 = floor(_370);
    float _380 = _344 + _314;
    float _382 = -_362;
    float _384 = _382 + 1.0;
    float _386 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = _380 + (-1.0);
    float _392 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = floor(_374);
    bool _398 = _372 > 0.0;
    float _400 = _338 + _344;
    bool _402 = _372 >= 0.0;
    bool _404 = isnan(_372);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _414 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    float _416 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    int _418 = _410 ? 0 : 1;
    float _420 = _400 + (-1.0);
    float _422 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    int _424 = ~_418;
    int _426 = _424 + 1;
    int _428 = _426 + 1;
    float _430 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _414);
    bool _432 = _378 > 0.0;
    float _434 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _428;
    if (!_398)
    {
        int _438 = ~_418;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    bool _446 = _378 >= 0.0;
    bool _448 = isnan(_378);
    bool _450 = _446 || _448;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    float _456 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _458 = _396 > 0.0;
    float _460 = _422 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _462 = _396 >= 0.0;
    bool _464 = isnan(_396);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -_456;
    float _474 = _472 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _476 = in.m_59.x;
    float _478 = in.m_59.y;
    float _480 = in.m_59.z;
    float _482 = _286 * _348;
    bool _484 = !_328;
    int _486 = _484 ? 0 : 1;
    float _488 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = float(_442);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _494 = 1.0 + _492;
    int _496 = abs(_486);
    float _498 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _500 = _454 ? 0 : 1;
    float _502 = 1.0 / _494;
    float _504 = float(_496);
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    bool _516 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _524 = _520 || _522;
    float _526 = _504 * _490;
    bool _528 = !_332;
    int _530 = _528 ? 0 : 1;
    float _532 = _524 ? _384 : 0.0;
    float _534 = _526 * (-2.0);
    int _536 = ~_500;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = _338 + (-0.5);
    int _544 = _540;
    float _546 = _460;
    if (!_432)
    {
        int _548 = ~_500;
        int _550 = _548 + 1;
        _544 = _550;
    }
    int _552 = _544;
    float _554 = fma(_534, _476, _476);
    int _556 = abs(_530);
    if (_514)
    {
        float _558 = _532 * _502;
        _144 = _558;
    }
    float _560 = _144;
    float _562 = fma(_434, _534, _434);
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _566 = _342 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _568 = _444 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = -_460;
    float _572 = _570 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = float(_556);
    float _576 = _474 * _474;
    float _578 = float(_552);
    float _580 = -_568;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _584 = fma(_562, _560, _564);
    float _586 = fma(_572, _572, _576);
    bool _588 = !_336;
    int _590 = _588 ? 0 : 1;
    float _592 = _574 * _578;
    int _594 = _470 ? 0 : 1;
    float _596 = fma(_582, _582, _586);
    int _598 = abs(_590);
    float _600 = _592 * (-2.0);
    int _602 = ~_594;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = in.m_61.x;
    float _610 = in.m_61.y;
    float _612 = in.m_61.z;
    int _614 = _606;
    float _616 = _568;
    if (!_458)
    {
        int _618 = ~_594;
        int _620 = _618 + 1;
        _614 = _620;
    }
    int _622 = _614;
    float _624 = rsqrt(_596);
    float _626 = fma(_412, _600, _412);
    float _628 = fma(_600, _478, _478);
    float _630 = _344 + (-0.5);
    float _632 = float(_598);
    float _634 = _584 * 0.15915493667125701904296875;
    float _636 = float(_622);
    float _638 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].y, _628);
    float _640 = exp2(_566);
    float _642 = _338 + _314;
    float _644 = _280 * _346;
    float _646 = fma(_626, _560, _638);
    float _648 = _632 * _636;
    float _650 = _642 + (-1.0);
    float _652 = _314 + (-0.5);
    float _654 = _572 * _624;
    float _656 = _648 * (-2.0);
    float _658 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _660 = _582 * _624;
    float _662 = _474 * _624;
    float _664 = fma(_656, _480, _480);
    float _666 = -_610;
    float _668 = _366 + _666;
    float _670 = fma(_658, _656, _658);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _674 = _654 * _672;
    float _676 = -_608;
    float _678 = _364 + _676;
    float _680 = fma(_640, _668, _610);
    float _682 = -_612;
    float _684 = _368 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _688 = _660 * _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _692 = -_674;
    float _694 = fma(_660, _690, _692);
    float _696 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[196].z, _664);
    float _698 = fma(_640, _678, _608);
    float _700 = fma(_640, _684, _612);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _704 = _662 * _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _708 = -_688;
    float _710 = fma(_662, _706, _708);
    float _712 = _694 * _694;
    float _714 = fma(_670, _560, _696);
    float _716 = _646 * 0.15915493667125701904296875;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_704;
    float _722 = fma(_654, _718, _720);
    float _724 = fma(_710, _710, _712);
    float _726 = _714 * 0.15915493667125701904296875;
    float _728 = _716 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _698);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _700);
    float _738 = _716 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _732 * _734;
    float _744 = _488 * _736;
    float _746 = _634 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_722, _722, _724);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _680);
    float _754 = _498 * _752;
    float _756 = _634 * 6.283185482025146484375;
    float _758 = cos(_756);
    float _760 = _726 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _748 * _730;
    float _766 = _748 * _740;
    float _768 = _726 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _758 * _740;
    float _774 = _758 * _730;
    float _776 = rsqrt(_750);
    float _778 = _758 * _762;
    float _780 = _748 * _762;
    float _782 = _740 * _762;
    float _784 = _730 * _762;
    float _786 = _780 * _754;
    float _788 = fma(_770, _772, _764);
    float _790 = fma(_770, _764, _772);
    float _792 = _778 * _754;
    float _794 = -_774;
    float _796 = fma(_770, _766, _794);
    float _798 = -_754;
    float _800 = _770 * _798;
    float _802 = -_766;
    float _804 = fma(_770, _774, _802);
    float _806 = fma(_788, _742, _792);
    float _808 = fma(_796, _742, _786);
    float _810 = _710 * _776;
    float _812 = _694 * _776;
    float _814 = fma(_782, _742, _800);
    float _816 = _722 * _776;
    float _818 = _662 * _810;
    float _820 = fma(_804, _744, _806);
    float _822 = _660 * _812;
    float _824 = fma(_784, _744, _814);
    float _826 = -_818;
    float _828 = fma(_654, _812, _826);
    float _830 = fma(_790, _744, _808);
    float _832 = -_822;
    float _834 = fma(_662, _816, _832);
    float _836 = _828 * _820;
    float _838 = _834 * _820;
    float _840 = fma(_816, _824, _836);
    float _842 = fma(_810, _824, _838);
    float _844 = fma(_660, _830, _840);
    float _846 = fma(_654, _830, _842);
    float _848 = _568 + _844;
    float _850 = _460 + _846;
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _854 = _848 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _858 = _850 + _856;
    float _860 = _854 * _854;
    float _862 = fma(_858, _858, _860);
    float _864 = _654 * _816;
    float _866 = sqrt(_862);
    float _868 = -_864;
    float _870 = fma(_660, _810, _868);
    float _872 = _870 * _820;
    float _874 = fma(_812, _824, _872);
    float _876 = fma(_662, _830, _874);
    bool _878 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _880 = _456 + _876;
    float _882 = _872;
    float _884 = _874;
    float _886 = _850;
    float _888 = _754;
    if (!_878)
    {
        _882 = _848;
    }
    float _890 = _882;
    float _892 = _890;
    if (!_878)
    {
        _884 = _880;
    }
    float _894 = _884;
    bool _896 = !_878;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _866 + _902;
        float _906 = _880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = rsqrt(_862);
        float _910 = _904 * _900;
        float _912 = _910 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = sin(_918);
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_920, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = fma(_880, _916, _924);
        float _930 = _908 * _926;
        float _932 = fma(_858, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _934 = fma(_854, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _898 = _928;
        _886 = _932;
        _892 = _934;
    }
    float _936 = _898;
    float _938 = _886;
    float _940 = _892;
    float _942 = -_456;
    float _944 = _942 + _936;
    float _946 = -_460;
    float _948 = _946 + _938;
    float _950 = -_568;
    float _952 = _950 + _940;
    float _954 = _456 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _956 = _944 * _944;
    bool _958 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _960 = isnan(0.5);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _966 = _962 || _964;
    float _968 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].x, _954);
    float _970 = fma(_948, _948, _956);
    bool _972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _974 = isnan(0.5);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _980 = _976 || _978;
    float _982 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[11].z, _968);
    float _984 = fma(_952, _952, _970);
    float _986 = _456 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _988 = _982 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _990 = sqrt(_984);
    float _992 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].x, _986);
    float _994 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[10].z, _992);
    float _996 = 1.0 / _988;
    float _998 = _994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1000 = _998 + _988;
    bool _1002 = _990 > 0.0;
    float _1004 = _1000 * _996;
    float _1006 = _1004 * 0.5;
    bool _1008 = !_1002;
    float _1010 = _938;
    float _1012 = _936;
    float _1014 = _940;
    float _1016 = _990;
    float _1018 = _948;
    float _1020 = _944;
    float _1022 = _998;
    if (!_1008)
    {
        float _1024 = _176 * _176;
        float _1026 = fma(_178, _178, _1024);
        float _1028 = fma(_180, _180, _1026);
        float _1030 = rsqrt(_984);
        float _1032 = sqrt(_1028);
        float _1034 = _948 * _1030;
        float _1036 = _944 * _1030;
        float _1038 = _952 * _1030;
        bool _1040 = _1032 > 0.0;
        bool _1042 = !_1040;
        _1016 = _1038;
        _1018 = _1034;
        _1020 = _1036;
        _1022 = _1028;
        if (!_1042)
        {
            float _1044 = rsqrt(_1028);
            float _1046 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1048 = _176 * _1044;
            float _1050 = _178 * _1044;
            float _1052 = _180 * _1044;
            float _1054 = _1036 * _1048;
            float _1056 = fma(_1034, _1050, _1054);
            float _1058 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1060 = fma(_1038, _1052, _1056);
            float _1062 = _1060 * _1058;
            float _1064 = fma(_178, _1062, _938);
            float _1066 = fma(_176, _1062, _936);
            float _1068 = fma(_180, _1062, _940);
            _1010 = _1064;
            _1012 = _1066;
            _1014 = _1068;
        }
    }
    float _1070 = _1010;
    float _1072 = _1012;
    float _1074 = _1014;
    float _1076 = _1016;
    float _1078 = _1018;
    float _1080 = _1020;
    float _1082 = _1022;
    float _1084 = _1076;
    float _1086 = _1078;
    float _1088 = _1080;
    float _1090 = _1082;
    if (_980)
    {
        _1084 = 1.0;
    }
    float _1092 = _1084;
    float _1094 = _1092;
    if (_966)
    {
        _1086 = _1070;
    }
    float _1096 = _1086;
    float _1098 = _1096;
    if (_966)
    {
        _888 = _1072;
    }
    float _1100 = _888;
    float _1102 = _1100;
    if (_966)
    {
        _1088 = _1074;
    }
    float _1104 = _1088;
    float _1106 = _1104;
    if (!_966)
    {
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1110 = _456 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1114 = _460 + _1112;
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = -_460;
        float _1120 = _1118 + _1070;
        float _1122 = _1110 * _1110;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1126 = _568 + _1124;
        float _1128 = -_456;
        float _1130 = _1128 + _1072;
        float _1132 = -_568;
        float _1134 = _1132 + _1074;
        float _1136 = fma(_1114, _1114, _1122);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = fma(_1126, _1126, _1136);
        float _1142 = sqrt(_1140);
        float _1144 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1138;
        float _1150 = _1144 * _1148;
        float _1152 = fma(_1120, _1150, _460);
        float _1154 = fma(_1130, _1150, _456);
        float _1156 = fma(_1134, _1150, _568);
        _1102 = _1154;
        _1098 = _1152;
        _1106 = _1156;
    }
    float _1158 = _1102;
    float _1160 = _1098;
    float _1162 = _1106;
    if (!_980)
    {
        float _1164 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1172 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1170);
        float _1174 = _1166 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        float _1178 = _1168 * 0.15915493667125701904296875;
        float _1180 = _1166 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = 1.0 / _1176;
        float _1186 = _1178 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1182 * _1184;
        float _1192 = _1178 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1188 * _1190;
        float _1198 = 1.0 / _1172;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = 1.0 / _1196;
        float _1206 = 1.0 / _1202;
        float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1210 = _1198 * _1208;
        float _1212 = _1194 * _1204;
        float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1216 = fma(_1212, _1210, _1214);
        float _1218 = _1216 * _1206;
        float _1220 = precise::clamp(_1218, 0.0, 1.0);
        _616 = _1204;
        _546 = _1178;
        _1094 = _1220;
    }
    float _1222 = _616;
    float _1224 = _546;
    float _1226 = _1094;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1158 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1160 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1162 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1222;
    float _1278 = _1230;
    float _1280 = _1224;
    if (_1264)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1282;
    }
    float _1284 = _1270;
    if (_1264)
    {
        float _1286 = rsqrt(_1260);
        _1272 = _1286;
    }
    float _1288 = _1272;
    float _1290 = _1288;
    if (_1264)
    {
        float _1292 = _1268 * _1284;
        _1274 = _1292;
    }
    float _1294 = _1274;
    if (_1264)
    {
        float _1296 = _1294 * 0.15915493667125701904296875;
        _1276 = _1296;
    }
    float _1298 = _1276;
    float _1300 = _1284;
    if (_1264)
    {
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1246;
    float _1314 = _1310;
    if (_1264)
    {
        float _1316 = _1298 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1250;
    float _1324 = -_1310;
    float _1326 = fma(_1230, _1322, _1324);
    if (_1264)
    {
        float _1328 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1328;
    }
    float _1330 = _1314;
    float _1332 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1330;
    float _1336 = _1306;
    if (_1264)
    {
        float _1338 = fma(_1306, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    if (!_1264)
    {
        _1336 = _1252;
    }
    float _1344 = _1336;
    float _1346 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1348 = _1344;
    float _1350 = _1320;
    if (_1264)
    {
        float _1352 = _1320 + (-1.0);
        _1278 = _1352;
    }
    float _1354 = _1278;
    float _1356 = _1354;
    if (_1264)
    {
        float _1358 = _1288 * _1340;
        _1090 = _1358;
    }
    float _1360 = _1090;
    if (!_1264)
    {
        _1342 = _1326;
    }
    float _1362 = _1342;
    float _1364 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1346);
    float _1366 = _1362;
    if (_1264)
    {
        float _1368 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1368;
    }
    float _1370 = _1280;
    if (_1264)
    {
        float _1372 = _1252 * _1360;
        _1348 = _1372;
    }
    float _1374 = _1348;
    if (!_1264)
    {
        _1356 = _1254;
    }
    float _1376 = _1356;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = _1254 * _1360;
        _1378 = _1380;
    }
    float _1382 = _1378;
    if (!_1264)
    {
        _1290 = _1256;
    }
    float _1384 = _1290;
    float _1386 = _1384;
    if (_1264)
    {
        float _1388 = fma(_1326, _1320, _1370);
        _1366 = _1388;
    }
    float _1390 = _1366;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (!_1264)
    {
        _1350 = _1258;
    }
    float _1396 = _1350;
    float _1398 = _1396;
    if (_1264)
    {
        float _1400 = _1382 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = fma(_1390, _1390, _1394);
    float _1406 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1408 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1410 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1412 = _1404 + _1402;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1416 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1414);
    float _1418 = precise::clamp(_1416, 0.0, 1.0);
    float _1420 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1406);
    float _1422 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1408);
    float _1424 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1426 = -_1418;
    float _1428 = _1426 + 1.0;
    float _1430 = rsqrt(_1412);
    float _1432 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1434 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1436 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1424);
    float _1438 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1446 = abs(_1428);
    float _1448 = log2(_1446);
    float _1450 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1452 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1454 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1456 = -_1452;
    float _1458 = fma(_1456, _1410, 1.0);
    float _1460 = _1430 * _1374;
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1450);
    float _1464 = _1430 * _1390;
    float _1466 = _1430 * _1382;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1462);
    float _1472 = log2(_1458);
    float _1474 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1476 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = -_1468;
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1478);
    float _1482 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1474);
    float _1486 = -_1466;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1480);
    float _1490 = exp2(_1476);
    float _1492 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1494 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1484);
    float _1496 = fma(_1488, -0.5, 0.5);
    float _1498 = fma(_1488, 0.5, 0.5);
    float _1500 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1492);
    float _1502 = _1464 + 1.0;
    float _1504 = 1.0 / _1482;
    float _1506 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1508 = fma(_1498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1510 = _1472 * 0.693147182464599609375;
    float _1512 = fma(_1498, _1508, -0.212114393711090087890625);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = sqrt(_1496);
    float _1518 = -_1464;
    float _1520 = fma(_1490, _1502, _1518);
    float _1522 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1506);
    float _1524 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1526 = fma(_1498, _1512, 1.570728778839111328125);
    float _1528 = fma(_1520, 0.5, 0.5);
    float _1530 = _1522 * _1504;
    float _1532 = _1524 * _1504;
    float _1534 = fma(_1530, 0.5, 0.5);
    float _1536 = fma(_1532, -0.5, 0.5);
    float _1538 = _1516 * 0.636619746685028076171875;
    float3 _4599 = float3(_1534, _1536, _1514);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4599, float3(0.0), isnan(_4599)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4599, float3(0.0), isnan(_4599)), level(0.0)).x;
    float _1542 = -_1526;
    float _1544 = fma(_1538, _1542, 1.0);
    float3 _4615 = float3(_1534, _1536, _1514);
    float4 _1547 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4615, float3(0.0), isnan(_4615)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4615, float3(0.0), isnan(_4615)), level(0.0)).xyzw;
    float _1549 = _1547.x;
    float _1551 = _1547.y;
    float _1553 = _1547.z;
    float _1555 = _1547.w;
    float2 _4632 = float2(_1544, _1528);
    float3 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4632, float2(0.0), isnan(_4632)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4632, float2(0.0), isnan(_4632)), level(0.0)).xyz;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _312 + _1567;
    float _1571 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1573 = _344 > 0.5;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1579;
    bool _1583 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1585 = isnan(_312);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1599 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1601 = isnan(_312);
    bool _1603 = _1599 || _1601;
    bool _1605 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1607 = _1603 || _1605;
    float _1609 = float(_1607);
    float _1611 = 1.0 / _1577;
    float _1613 = -_1593;
    float _1615 = _1613 + 1.0;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1621 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1623 = isnan(_312);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = _1609 * _1615;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1637 = _1635 != 0;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1645 = _1643 != 0;
    float _1647 = -_1631;
    float _1649 = _1647 + 1.0;
    float _1651 = 1.0 / _1619;
    bool _1653 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1655 = isnan(_312);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1667 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1669 = isnan(_312);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = _1581 * _1611;
    float _1681 = -_1609;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1689 = in.m_63.x;
    float _1691 = 1.0 / _1641;
    float _1693 = _1631 * _1683;
    float _1695 = _1663 * _1649;
    float _1697 = in.m_63.y;
    float _1699 = -_1663;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_1679, _1569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1705 = _338 > 0.5;
    bool _1707 = _1705 && _1637;
    float _1709 = 1.0 / _1687;
    float _1711 = _1677 * _1701;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1713;
    float _1717 = _1597 * _1651;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1721 = _312 + _1719;
    float _1723 = _1703 * _1711;
    float _1725 = -_1677;
    float _1727 = _1725 + 1.0;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1733 = _1715 * _1691;
    float _1735 = fma(_1717, _1721, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1741 = _312 + _1739;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = _778 * _828;
    float _1747 = fma(_1735, _1695, _1737);
    float _1749 = _1721;
    float _1751 = _1689;
    float _1753 = _1482;
    float _1755 = _1524;
    float _1757 = _1522;
    if (_1637)
    {
        _1749 = _1689;
    }
    float _1759 = _1749;
    float _1761 = _1731 * _1709;
    float _1763 = fma(_1733, _1741, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1767 = _312 + _1765;
    float _1769 = -_1697;
    float _1771 = _1769 + 1.0;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1775 = _1759;
    float _1777 = _1697;
    if (_1707)
    {
        float _1779 = -_1759;
        float _1781 = _1779 + 1.0;
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = fma(_1761, _1767, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1787 = fma(_1763, _1693, _1747);
    if (_1645)
    {
        float _1789 = _1573 ? _1771 : _1697;
        _1777 = _1789;
    }
    float _1791 = _1777;
    float _1793 = _778 * _834;
    if (_1637)
    {
        _1751 = _1783;
    }
    float _1795 = _1751;
    float _1797 = fma(_1785, _1633, _1787);
    bool _1799 = _680 != 0.0;
    bool _1801 = isnan(_680);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.0);
    bool _1807 = _1803 || _1805;
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1811 = exp2(_1571);
    float _1813 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1815 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1797);
    float _1817 = _1809 * _1743;
    float _1819 = _778 * _870;
    float _1821 = _1813 * _1773;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1827 = _698 == 0.0;
    bool _1829 = !_1807;
    bool _1831 = _1827 && _1829;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1837 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1843 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1845 = _788 * _834;
    out.m_65.x = _1835;
    out.m_65.y = _1839;
    out.m_65.z = _1841;
    out.m_65.w = _1837;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1849 = _700 == 0.0;
    bool _1851 = _1849 && _1831;
    float _1853 = in.m_67.x;
    float _1855 = in.m_67.y;
    float _1857 = in.m_67.z;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1863 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1865 = _788 * _870;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1871 = -_770;
    float _1873 = fma(_1871, _810, _1793);
    float _1875 = _788 * _828;
    float _1877 = -_1811;
    float _1879 = _1877 + 1.0;
    float _1881 = -_770;
    float _1883 = fma(_1881, _812, _1819);
    float _1885 = -_770;
    float _1887 = fma(_1885, _816, _1745);
    out.m_69.x = _1863;
    out.m_69.y = _1867;
    out.m_69.z = _1869;
    out.m_69.w = _1843;
    float _1889 = _804 * _834;
    float _1891 = _804 * _870;
    float _1893 = fma(_782, _812, _1865);
    out.m_71.x = _1821;
    out.m_71.y = _1817;
    float _1895 = fma(_780, _654, _1873);
    float _1897 = _804 * _828;
    float _1899 = fma(_782, _816, _1875);
    float _1901 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1903 = fma(_784, _812, _1891);
    float _1905 = fma(_784, _816, _1897);
    float _1907 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1665);
    float _1909 = _1855;
    float _1911 = _1853;
    float _1913 = _1857;
    if (!_1851)
    {
        float _1915 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _1909 = _1915;
    }
    float _1917 = _1909;
    if (!_1851)
    {
        float _1919 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1853);
        _1911 = _1919;
    }
    float _1921 = _1911;
    float _1923 = fma(_782, _810, _1845);
    float _1925 = fma(_780, _662, _1883);
    float _1927 = fma(_780, _660, _1887);
    float _1929 = fma(_784, _810, _1889);
    float _1931 = fma(_796, _654, _1923);
    float _1933 = fma(_796, _662, _1893);
    float _1935 = _1895 * _1917;
    float _1937 = _1925 * _1917;
    float _1939 = fma(_796, _660, _1899);
    float _1941 = _1927 * _1917;
    float _1943 = fma(_790, _654, _1929);
    float _1945 = fma(_790, _662, _1903);
    float _1947 = fma(_1931, _1921, _1935);
    if (!_1851)
    {
        float _1949 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _1913 = _1949;
    }
    float _1951 = _1913;
    float _1953 = fma(_1933, _1921, _1937);
    float _1955 = fma(_790, _660, _1905);
    float _1957 = fma(_1939, _1921, _1941);
    float _1959 = fma(_1943, _1951, _1947);
    float _1961 = fma(_1945, _1951, _1953);
    float _1963 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1965 = fma(_1955, _1951, _1957);
    bool _1967 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1969 = isnan(_1248);
    bool _1971 = _1967 || _1969;
    bool _1973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1975 = _1971 || _1973;
    float _1977 = _1522 + _1482;
    float _1979 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1963);
    float _1981 = _1482 * 0.5;
    out.m_73.x = _1959;
    out.m_73.y = _1961;
    out.m_73.z = _1965;
    float _1983 = _1979 + _1482;
    float _1985 = _1977 * 0.5;
    float _1987 = fma(_1524, -0.5, _1981);
    float _1989 = _1983 * 0.5;
    out.gl_Position.x = _1522;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1482;
    out.m_75.x = _1985;
    out.m_75.y = _1987;
    out.m_75.z = _1989;
    out.m_75.w = _1482;
    float _1991 = _1979;
    float _1993 = _1985;
    if (!_1975)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1995 = _1753;
    float _1997 = _1995;
    float _1999 = _1995;
    if (!_1975)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2001 = _1991;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1975)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    float _2011 = _2007;
    if (!_1975)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2013 = _1755;
    float _2015 = _2013;
    float _2017 = _2013;
    if (!_1975)
    {
        _1757 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2019 = _1757;
    float _2021 = _1901 * _1540;
    float _2023 = -_1901;
    float _2025 = _2023 + 1.0;
    float _2027 = _1555 * _2021;
    float _2029 = _1555 * _2025;
    float _2031 = _1565 * _2021;
    float _2033 = fma(_1561, _2027, _1549);
    float _2035 = fma(_1563, _2027, _1551);
    float _2037 = _2027;
    float _2039 = _2019;
    float _2041 = _2019;
    if (!_1975)
    {
        _2037 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2043 = _2037;
    float _2045 = fma(_1555, _2031, _1553);
    out.m_77.x = _2033;
    out.m_77.y = _2035;
    out.m_77.z = _2045;
    out.m_77.w = _2029;
    bool _2047 = !_1975;
    float _2049 = _2043;
    float _2051 = _2043;
    if (!_2047)
    {
        bool _2053 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2055 = isnan(_1248);
        bool _2057 = _2053 || _2055;
        bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2061 = _2057 || _2059;
        if (!_2061)
        {
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2065 = _1248 + _2063;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2067;
            float _2071 = 1.0 / _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2093 = _2065 * _2071;
            float _2095 = precise::clamp(_2093, 0.0, 1.0);
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2101 = fma(_2095, _2075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2103 = fma(_2095, _2099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2105 = fma(_2095, _2079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2107 = fma(_2095, _2083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2109 = fma(_2095, _2087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2111 = fma(_2095, _2091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2011 = _2103;
            _2017 = _2109;
            _2051 = _2101;
            _2005 = _2107;
            _1999 = _2105;
            _2041 = _2111;
            _2113 = true;
        }
        else
        {
            bool _2115 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2117 = isnan(_1248);
            bool _2119 = _2115 || _2117;
            bool _2121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2123 = _2119 || _2121;
            if (!_2123)
            {
                _2049 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2125 = _2049;
            _2051 = _2125;
            if (!_2123)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2127 = _2009;
            _2011 = _2127;
            if (!_2123)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2129 = _1997;
            _1999 = _2129;
            if (!_2123)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2131 = _2003;
            _2005 = _2131;
            if (!_2123)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2133 = _2015;
            _2017 = _2133;
            if (!_2123)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2135 = _2039;
            bool _2137 = !_2123;
            _2041 = _2135;
            if (!_2137)
            {
                bool _2139 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2141 = isnan(_1248);
                bool _2143 = _2139 || _2141;
                bool _2145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2147 = _2143 || _2145;
                if (!_2147)
                {
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2151 = _1248 + _2149;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2153;
                    float _2157 = 1.0 / _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2179 = _2151 * _2157;
                    float _2181 = precise::clamp(_2179, 0.0, 1.0);
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2187 = fma(_2181, _2161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2189 = fma(_2181, _2185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2191 = fma(_2181, _2165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2193 = fma(_2181, _2169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2195 = fma(_2181, _2173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2197 = fma(_2181, _2177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2011 = _2189;
                    _2017 = _2195;
                    _2051 = _2187;
                    _2005 = _2193;
                    _1999 = _2191;
                    _2041 = _2197;
                    _2113 = true;
                }
                else
                {
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2051 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2113 = false;
    float _2199 = _2011;
    float _2201 = _2017;
    float _2203 = _2051;
    float _2205 = _2005;
    float _2207 = _1999;
    float _2209 = _2041;
    float _2211 = fma(_1961, -0.5, 0.5);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = -_2199;
    float _2217 = _2215 + _2201;
    float _2219 = _1226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2221 = -_2203;
    float _2223 = _2221 + _2205;
    float _2225 = fma(_2213, _2217, _2199);
    out.m_79.x = 0.0;
    float _2227 = -_2207;
    float _2229 = _2227 + _2209;
    float _2231 = fma(_2213, _2223, _2203);
    float _2233 = _2225 * 0.586610972881317138671875;
    out.m_47.x = _2219;
    bool _2235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2237 = fma(_2213, _2229, _2207);
    float _2239 = fma(_2231, 0.298911988735198974609375, _2233);
    bool _2241 = _1226 > 0.0;
    bool _2243 = isnan(_1226);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = fma(_2237, 0.114477999508380889892578125, _2239);
    float _2253 = -_2251;
    float _2255 = _2231 + _2253;
    float _2257 = -_2251;
    float _2259 = _2225 + _2257;
    float _2261 = -_2251;
    float _2263 = _2237 + _2261;
    float _2265 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2267 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2269 = fma(_2263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    bool _2271 = !_2235;
    if (!_2271)
    {
        float _2273 = -_1158;
        float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2277 = -_1160;
        float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2281 = -_1162;
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2285 = _2275 * _2275;
        float _2287 = fma(_2279, _2279, _2285);
        float _2289 = fma(_2283, _2283, _2287);
        float _2291 = sqrt(_2289);
        float _2293 = rsqrt(_2289);
        float _2295 = -_2291;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2299 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = _2279 * _2293;
        float _2305 = _2275 * _2293;
        float _2307 = abs(_2301);
        float _2309 = log2(_2307);
        float _2311 = _2283 * _2293;
        float _2313 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2315 = _1961 * _2305;
        float _2317 = -_2305;
        float _2319 = -_2313;
        float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2319);
        float _2323 = fma(_1959, _2303, _2315);
        float _2325 = -_2311;
        float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2321);
        float _2329 = fma(_1965, _2311, _2323);
        float _2331 = precise::clamp(_2329, 0.0, 1.0);
        float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2335 = _2327 + _2333;
        float _2337 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2341 = precise::clamp(_2339, 0.0, 1.0);
        float _2343 = exp2(_2337);
        float _2345 = _2343 * _2341;
        float _2347 = _2331 * _2345;
        float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2353 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2349;
        out.m_79.y = _2351;
        out.m_79.z = _2353;
    }
    out.m_81.x = _2265;
    out.m_81.y = _2267;
    out.m_81.z = _2269;
    if (_2249)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2355;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2113 = false;
    bool _310 = false;
    bool _202 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = trunc(_95);
    int _100 = int(_97);
    bool _104 = _100 >= 1;
    float _106 = 0.0;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _106;
    if (!_104)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_104)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2411 = as_type<float>(_114);
        out.gl_Position.z = _2411;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _118 = in.m_49.w;
    float _120 = float(_100);
    float _122 = -_118;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = _118 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _128 = isnan(_118);
    bool _130 = _126 || _128;
    bool _132 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _134 = _130 || _132;
    bool _136 = _124 >= _120;
    bool _138 = !_134;
    bool _140 = _136 || _138;
    float _142 = _118;
    float _144 = _124;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _148 = _146 * 5.0;
        _116 = as_type<int>(_148);
    }
    int _150 = _116;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2476 = as_type<float>(_150);
        out.gl_Position.z = _2476;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_51.x;
    float _154 = in.m_51.y;
    float _156 = in.m_51.z;
    float _158 = 1.0 / _120;
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _162 = _124 * _158;
    float _164 = _154 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _166 = _154 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _168 = _154 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _170 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[5].x, _164);
    float _172 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[4].x, _166);
    float _174 = fma(_152, (*spvDescriptorSet0.vp_c10)._m0[6].x, _168);
    float _176 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[5].z, _170);
    float _178 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[4].z, _172);
    float _180 = fma(_156, (*spvDescriptorSet0.vp_c10)._m0[6].z, _174);
    bool _182 = !_160;
    float _200;
    if (!_182)
    {
        float _184 = in.m_53.x;
        float _186 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _190 = fma(_188, (*spvDescriptorSet0.vp_c9)._m0[12].x, _124);
        float _192 = _190 * _186;
        float _194 = floor(_192);
        float _196 = -_194;
        float _198 = _192 + _196;
        _200 = _198;
        _202 = true;
    }
    else
    {
        _200 = _162;
    }
    _202 = false;
    float _204 = _200;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = _204 + _206;
    bool _210 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _212 = isnan(_204);
    bool _214 = _210 || _212;
    bool _216 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _218 = _214 || _216;
    float _220 = float(_218);
    float _222 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _224 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _222;
    bool _226 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _228 = isnan(_204);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = -_220;
    float _240 = _238 + 1.0;
    float _242 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _244 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _242;
    float _246 = 1.0 / _224;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _250 = _236 * _240;
    float _252 = -_236;
    float _254 = _252 + 1.0;
    float _256 = _208 * _246;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _258;
    float _262 = fma(_244, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _264;
    float _268 = fma(_260, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _270 = _262 * _250;
    float _272 = fma(_266, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _274 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].x, _270);
    float _276 = _272 * _250;
    float _278 = _268 * _250;
    float _280 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].y, _276);
    float _284 = fma(_254, (*spvDescriptorSet0.vp_c9)._m0[143].z, _278);
    float _286 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].y, _282);
    float _288 = fma(_220, (*spvDescriptorSet0.vp_c9)._m0[144].z, _284);
    bool _290 = !_248;
    float _308;
    if (!_290)
    {
        float _292 = in.m_53.x;
        float _294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _296 = _292 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _300 = _298 * _294;
        float _302 = floor(_300);
        float _304 = -_302;
        float _306 = _300 + _304;
        _308 = _306;
        _310 = true;
    }
    else
    {
        _308 = _162;
    }
    _310 = false;
    float _312 = _308;
    float _314 = in.m_53.z;
    float _316 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _318 = log2(_316);
    float _320 = in.m_55.x;
    float _322 = in.m_55.y;
    float _324 = in.m_55.z;
    int _326 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _328 = _326 != 0;
    int _330 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _332 = _330 != 0;
    int _334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _336 = _334 != 0;
    float _338 = in.m_53.x;
    float _340 = abs(_162);
    float _342 = log2(_340);
    float _344 = in.m_53.y;
    float _346 = in.m_57.x;
    float _348 = in.m_57.y;
    float _350 = in.m_57.z;
    float _352 = _318 * _124;
    float _354 = in.m_44.x;
    float _356 = in.m_44.y;
    float _358 = in.m_44.z;
    float _360 = _314 * 2.0;
    float _362 = exp2(_352);
    float _364 = fma(_320, 2.0, -1.0);
    float _366 = fma(_322, 2.0, -1.0);
    float _368 = fma(_324, 2.0, -1.0);
    float _370 = _338 * 2.0;
    float _372 = floor(_360);
    float _374 = _344 * 2.0;
    float _376 = _288 * _350;
    float _378 = floor(_370);
    float _380 = _344 + _314;
    float _382 = -_362;
    float _384 = _382 + 1.0;
    float _386 = _356 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _388 = _356 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _390 = _380 + (-1.0);
    float _392 = _356 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _394 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[4].x, _386);
    float _396 = floor(_374);
    bool _398 = _372 > 0.0;
    float _400 = _338 + _344;
    bool _402 = _372 >= 0.0;
    bool _404 = isnan(_372);
    bool _406 = _402 || _404;
    bool _408 = isnan(0.0);
    bool _410 = _406 || _408;
    float _412 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _414 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[5].x, _388);
    float _416 = fma(_354, (*spvDescriptorSet0.vp_c10)._m0[6].x, _392);
    int _418 = _410 ? 0 : 1;
    float _420 = _400 + (-1.0);
    float _422 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[4].z, _394);
    int _424 = ~_418;
    int _426 = _424 + 1;
    int _428 = _426 + 1;
    float _430 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[5].z, _414);
    bool _432 = _378 > 0.0;
    float _434 = fma(_420, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _436 = _428;
    if (!_398)
    {
        int _438 = ~_418;
        int _440 = _438 + 1;
        _436 = _440;
    }
    int _442 = _436;
    float _444 = fma(_358, (*spvDescriptorSet0.vp_c10)._m0[6].z, _416);
    bool _446 = _378 >= 0.0;
    bool _448 = isnan(_378);
    bool _450 = _446 || _448;
    bool _452 = isnan(0.0);
    bool _454 = _450 || _452;
    float _456 = _430 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _458 = _396 > 0.0;
    float _460 = _422 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _462 = _396 >= 0.0;
    bool _464 = isnan(_396);
    bool _466 = _462 || _464;
    bool _468 = isnan(0.0);
    bool _470 = _466 || _468;
    float _472 = -_456;
    float _474 = _472 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _476 = in.m_59.x;
    float _478 = in.m_59.y;
    float _480 = in.m_59.z;
    float _482 = _286 * _348;
    bool _484 = !_328;
    int _486 = _484 ? 0 : 1;
    float _488 = _376 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _490 = float(_442);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _494 = 1.0 + _492;
    int _496 = abs(_486);
    float _498 = _482 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _500 = _454 ? 0 : 1;
    float _502 = 1.0 / _494;
    float _504 = float(_496);
    bool _506 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _508 = isnan(1.0);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _514 = _510 || _512;
    bool _516 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _518 = isnan(0.0);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _524 = _520 || _522;
    float _526 = _504 * _490;
    bool _528 = !_332;
    int _530 = _528 ? 0 : 1;
    float _532 = _524 ? _384 : 0.0;
    float _534 = _526 * (-2.0);
    int _536 = ~_500;
    int _538 = _536 + 1;
    int _540 = _538 + 1;
    float _542 = _338 + (-0.5);
    int _544 = _540;
    float _546 = _460;
    if (!_432)
    {
        int _548 = ~_500;
        int _550 = _548 + 1;
        _544 = _550;
    }
    int _552 = _544;
    float _554 = fma(_534, _476, _476);
    int _556 = abs(_530);
    if (_514)
    {
        float _558 = _532 * _502;
        _144 = _558;
    }
    float _560 = _144;
    float _562 = fma(_434, _534, _434);
    float _564 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[196].x, _554);
    float _566 = _342 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _568 = _444 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = -_460;
    float _572 = _570 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = float(_556);
    float _576 = _474 * _474;
    float _578 = float(_552);
    float _580 = -_568;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _584 = fma(_562, _560, _564);
    float _586 = fma(_572, _572, _576);
    bool _588 = !_336;
    int _590 = _588 ? 0 : 1;
    float _592 = _574 * _578;
    int _594 = _470 ? 0 : 1;
    float _596 = fma(_582, _582, _586);
    int _598 = abs(_590);
    float _600 = _592 * (-2.0);
    int _602 = ~_594;
    int _604 = _602 + 1;
    int _606 = _604 + 1;
    float _608 = in.m_61.x;
    float _610 = in.m_61.y;
    float _612 = in.m_61.z;
    int _614 = _606;
    float _616 = _568;
    if (!_458)
    {
        int _618 = ~_594;
        int _620 = _618 + 1;
        _614 = _620;
    }
    int _622 = _614;
    float _624 = rsqrt(_596);
    float _626 = fma(_412, _600, _412);
    float _628 = fma(_600, _478, _478);
    float _630 = _344 + (-0.5);
    float _632 = float(_598);
    float _634 = _584 * 0.15915493667125701904296875;
    float _636 = float(_622);
    float _638 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[196].y, _628);
    float _640 = exp2(_566);
    float _642 = _338 + _314;
    float _644 = _280 * _346;
    float _646 = fma(_626, _560, _638);
    float _648 = _632 * _636;
    float _650 = _642 + (-1.0);
    float _652 = _314 + (-0.5);
    float _654 = _572 * _624;
    float _656 = _648 * (-2.0);
    float _658 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _660 = _582 * _624;
    float _662 = _474 * _624;
    float _664 = fma(_656, _480, _480);
    float _666 = -_610;
    float _668 = _366 + _666;
    float _670 = fma(_658, _656, _658);
    float _672 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _674 = _654 * _672;
    float _676 = -_608;
    float _678 = _364 + _676;
    float _680 = fma(_640, _668, _610);
    float _682 = -_612;
    float _684 = _368 + _682;
    float _686 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _688 = _660 * _686;
    float _690 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _692 = -_674;
    float _694 = fma(_660, _690, _692);
    float _696 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[196].z, _664);
    float _698 = fma(_640, _678, _608);
    float _700 = fma(_640, _684, _612);
    float _702 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _704 = _662 * _702;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _708 = -_688;
    float _710 = fma(_662, _706, _708);
    float _712 = _694 * _694;
    float _714 = fma(_670, _560, _696);
    float _716 = _646 * 0.15915493667125701904296875;
    float _718 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _720 = -_704;
    float _722 = fma(_654, _718, _720);
    float _724 = fma(_710, _710, _712);
    float _726 = _714 * 0.15915493667125701904296875;
    float _728 = _716 * 6.283185482025146484375;
    float _730 = sin(_728);
    float _732 = _644 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _734 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _698);
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _700);
    float _738 = _716 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _732 * _734;
    float _744 = _488 * _736;
    float _746 = _634 * 6.283185482025146484375;
    float _748 = sin(_746);
    float _750 = fma(_722, _722, _724);
    float _752 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _680);
    float _754 = _498 * _752;
    float _756 = _634 * 6.283185482025146484375;
    float _758 = cos(_756);
    float _760 = _726 * 6.283185482025146484375;
    float _762 = cos(_760);
    float _764 = _748 * _730;
    float _766 = _748 * _740;
    float _768 = _726 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = _758 * _740;
    float _774 = _758 * _730;
    float _776 = rsqrt(_750);
    float _778 = _758 * _762;
    float _780 = _748 * _762;
    float _782 = _740 * _762;
    float _784 = _730 * _762;
    float _786 = _780 * _754;
    float _788 = fma(_770, _772, _764);
    float _790 = fma(_770, _764, _772);
    float _792 = _778 * _754;
    float _794 = -_774;
    float _796 = fma(_770, _766, _794);
    float _798 = -_754;
    float _800 = _770 * _798;
    float _802 = -_766;
    float _804 = fma(_770, _774, _802);
    float _806 = fma(_788, _742, _792);
    float _808 = fma(_796, _742, _786);
    float _810 = _710 * _776;
    float _812 = _694 * _776;
    float _814 = fma(_782, _742, _800);
    float _816 = _722 * _776;
    float _818 = _662 * _810;
    float _820 = fma(_804, _744, _806);
    float _822 = _660 * _812;
    float _824 = fma(_784, _744, _814);
    float _826 = -_818;
    float _828 = fma(_654, _812, _826);
    float _830 = fma(_790, _744, _808);
    float _832 = -_822;
    float _834 = fma(_662, _816, _832);
    float _836 = _828 * _820;
    float _838 = _834 * _820;
    float _840 = fma(_816, _824, _836);
    float _842 = fma(_810, _824, _838);
    float _844 = fma(_660, _830, _840);
    float _846 = fma(_654, _830, _842);
    float _848 = _568 + _844;
    float _850 = _460 + _846;
    float _852 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _854 = _848 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _858 = _850 + _856;
    float _860 = _854 * _854;
    float _862 = fma(_858, _858, _860);
    float _864 = _654 * _816;
    float _866 = sqrt(_862);
    float _868 = -_864;
    float _870 = fma(_660, _810, _868);
    float _872 = _870 * _820;
    float _874 = fma(_812, _824, _872);
    float _876 = fma(_662, _830, _874);
    bool _878 = _866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _880 = _456 + _876;
    float _882 = _872;
    float _884 = _874;
    float _886 = _850;
    float _888 = _754;
    if (!_878)
    {
        _882 = _848;
    }
    float _890 = _882;
    float _892 = _890;
    if (!_878)
    {
        _884 = _880;
    }
    float _894 = _884;
    bool _896 = !_878;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _866 + _902;
        float _906 = _880 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = rsqrt(_862);
        float _910 = _904 * _900;
        float _912 = _910 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = cos(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = sin(_918);
        float _922 = _916 + (-1.0);
        float _924 = _922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _926 = fma(_920, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _928 = fma(_880, _916, _924);
        float _930 = _908 * _926;
        float _932 = fma(_858, _930, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _934 = fma(_854, _930, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _898 = _928;
        _886 = _932;
        _892 = _934;
    }
    float _936 = _898;
    float _938 = _886;
    float _940 = _892;
    float _942 = -_456;
    float _944 = _942 + _936;
    float _946 = -_460;
    float _948 = _946 + _938;
    float _950 = -_568;
    float _952 = _950 + _940;
    float _954 = _456 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _956 = _944 * _944;
    bool _958 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _960 = isnan(0.5);
    bool _962 = _958 || _960;
    bool _964 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _966 = _962 || _964;
    float _968 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[11].x, _954);
    float _970 = fma(_948, _948, _956);
    bool _972 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _974 = isnan(0.5);
    bool _976 = _972 || _974;
    bool _978 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _980 = _976 || _978;
    float _982 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[11].z, _968);
    float _984 = fma(_952, _952, _970);
    float _986 = _456 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _988 = _982 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _990 = sqrt(_984);
    float _992 = fma(_460, (*spvDescriptorSet0.vp_c8)._m0[10].x, _986);
    float _994 = fma(_568, (*spvDescriptorSet0.vp_c8)._m0[10].z, _992);
    float _996 = 1.0 / _988;
    float _998 = _994 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1000 = _998 + _988;
    bool _1002 = _990 > 0.0;
    float _1004 = _1000 * _996;
    float _1006 = _1004 * 0.5;
    bool _1008 = !_1002;
    float _1010 = _938;
    float _1012 = _936;
    float _1014 = _940;
    float _1016 = _990;
    float _1018 = _948;
    float _1020 = _944;
    float _1022 = _998;
    if (!_1008)
    {
        float _1024 = _176 * _176;
        float _1026 = fma(_178, _178, _1024);
        float _1028 = fma(_180, _180, _1026);
        float _1030 = rsqrt(_984);
        float _1032 = sqrt(_1028);
        float _1034 = _948 * _1030;
        float _1036 = _944 * _1030;
        float _1038 = _952 * _1030;
        bool _1040 = _1032 > 0.0;
        bool _1042 = !_1040;
        _1016 = _1038;
        _1018 = _1034;
        _1020 = _1036;
        _1022 = _1028;
        if (!_1042)
        {
            float _1044 = rsqrt(_1028);
            float _1046 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1048 = _176 * _1044;
            float _1050 = _178 * _1044;
            float _1052 = _180 * _1044;
            float _1054 = _1036 * _1048;
            float _1056 = fma(_1034, _1050, _1054);
            float _1058 = _1046 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1060 = fma(_1038, _1052, _1056);
            float _1062 = _1060 * _1058;
            float _1064 = fma(_178, _1062, _938);
            float _1066 = fma(_176, _1062, _936);
            float _1068 = fma(_180, _1062, _940);
            _1010 = _1064;
            _1012 = _1066;
            _1014 = _1068;
        }
    }
    float _1070 = _1010;
    float _1072 = _1012;
    float _1074 = _1014;
    float _1076 = _1016;
    float _1078 = _1018;
    float _1080 = _1020;
    float _1082 = _1022;
    float _1084 = _1076;
    float _1086 = _1078;
    float _1088 = _1080;
    float _1090 = _1082;
    if (_980)
    {
        _1084 = 1.0;
    }
    float _1092 = _1084;
    float _1094 = _1092;
    if (_966)
    {
        _1086 = _1070;
    }
    float _1096 = _1086;
    float _1098 = _1096;
    if (_966)
    {
        _888 = _1072;
    }
    float _1100 = _888;
    float _1102 = _1100;
    if (_966)
    {
        _1088 = _1074;
    }
    float _1104 = _1088;
    float _1106 = _1104;
    if (!_966)
    {
        float _1108 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1110 = _456 + _1108;
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1114 = _460 + _1112;
        float _1116 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1118 = -_460;
        float _1120 = _1118 + _1070;
        float _1122 = _1110 * _1110;
        float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1126 = _568 + _1124;
        float _1128 = -_456;
        float _1130 = _1128 + _1072;
        float _1132 = -_568;
        float _1134 = _1132 + _1074;
        float _1136 = fma(_1114, _1114, _1122);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = fma(_1126, _1126, _1136);
        float _1142 = sqrt(_1140);
        float _1144 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1138;
        float _1150 = _1144 * _1148;
        float _1152 = fma(_1120, _1150, _460);
        float _1154 = fma(_1130, _1150, _456);
        float _1156 = fma(_1134, _1150, _568);
        _1102 = _1154;
        _1098 = _1152;
        _1106 = _1156;
    }
    float _1158 = _1102;
    float _1160 = _1098;
    float _1162 = _1106;
    if (!_980)
    {
        float _1164 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1166 = _1164 * 0.15915493667125701904296875;
        float _1168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1170 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1172 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1170);
        float _1174 = _1166 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        float _1178 = _1168 * 0.15915493667125701904296875;
        float _1180 = _1166 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = 1.0 / _1176;
        float _1186 = _1178 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1182 * _1184;
        float _1192 = _1178 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1188 * _1190;
        float _1198 = 1.0 / _1172;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = 1.0 / _1196;
        float _1206 = 1.0 / _1202;
        float _1208 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1210 = _1198 * _1208;
        float _1212 = _1194 * _1204;
        float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1216 = fma(_1212, _1210, _1214);
        float _1218 = _1216 * _1206;
        float _1220 = precise::clamp(_1218, 0.0, 1.0);
        _616 = _1204;
        _546 = _1178;
        _1094 = _1220;
    }
    float _1222 = _616;
    float _1224 = _546;
    float _1226 = _1094;
    float _1228 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1230 = _1158 + _1228;
    float _1232 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1234 = _1160 + _1232;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1162 + _1236;
    float _1240 = _1230 * _1230;
    float _1242 = fma(_1234, _1234, _1240);
    float _1244 = fma(_1238, _1238, _1242);
    float _1246 = rsqrt(_1244);
    float _1248 = sqrt(_1244);
    float _1250 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1252 = _1234 * _1250;
    float _1254 = _1238 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 * _1254;
    float _1260 = _1256 + _1258;
    float _1262 = sqrt(_1260);
    bool _1264 = _1262 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1268 = _1262 + _1266;
    float _1270 = _1238;
    float _1272 = _1260;
    float _1274 = _1268;
    float _1276 = _1222;
    float _1278 = _1230;
    float _1280 = _1224;
    if (_1264)
    {
        float _1282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1270 = _1282;
    }
    float _1284 = _1270;
    if (_1264)
    {
        float _1286 = rsqrt(_1260);
        _1272 = _1286;
    }
    float _1288 = _1272;
    float _1290 = _1288;
    if (_1264)
    {
        float _1292 = _1268 * _1284;
        _1274 = _1292;
    }
    float _1294 = _1274;
    if (_1264)
    {
        float _1296 = _1294 * 0.15915493667125701904296875;
        _1276 = _1296;
    }
    float _1298 = _1276;
    float _1300 = _1284;
    if (_1264)
    {
        float _1302 = _1298 * 6.283185482025146484375;
        float _1304 = sin(_1302);
        _1300 = _1304;
    }
    float _1306 = _1300;
    float _1308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1310 = precise::max(0.0, _1308);
    float _1312 = _1246;
    float _1314 = _1310;
    if (_1264)
    {
        float _1316 = _1298 * 6.283185482025146484375;
        float _1318 = cos(_1316);
        _1312 = _1318;
    }
    float _1320 = _1312;
    float _1322 = -_1250;
    float _1324 = -_1310;
    float _1326 = fma(_1230, _1322, _1324);
    if (_1264)
    {
        float _1328 = _1326 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1314 = _1328;
    }
    float _1330 = _1314;
    float _1332 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1334 = _1330;
    float _1336 = _1306;
    if (_1264)
    {
        float _1338 = fma(_1306, _1330, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1334 = _1338;
    }
    float _1340 = _1334;
    float _1342 = _1340;
    if (!_1264)
    {
        _1336 = _1252;
    }
    float _1344 = _1336;
    float _1346 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1332);
    float _1348 = _1344;
    float _1350 = _1320;
    if (_1264)
    {
        float _1352 = _1320 + (-1.0);
        _1278 = _1352;
    }
    float _1354 = _1278;
    float _1356 = _1354;
    if (_1264)
    {
        float _1358 = _1288 * _1340;
        _1090 = _1358;
    }
    float _1360 = _1090;
    if (!_1264)
    {
        _1342 = _1326;
    }
    float _1362 = _1342;
    float _1364 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1346);
    float _1366 = _1362;
    if (_1264)
    {
        float _1368 = _1354 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1280 = _1368;
    }
    float _1370 = _1280;
    if (_1264)
    {
        float _1372 = _1252 * _1360;
        _1348 = _1372;
    }
    float _1374 = _1348;
    if (!_1264)
    {
        _1356 = _1254;
    }
    float _1376 = _1356;
    float _1378 = _1376;
    if (_1264)
    {
        float _1380 = _1254 * _1360;
        _1378 = _1380;
    }
    float _1382 = _1378;
    if (!_1264)
    {
        _1290 = _1256;
    }
    float _1384 = _1290;
    float _1386 = _1384;
    if (_1264)
    {
        float _1388 = fma(_1326, _1320, _1370);
        _1366 = _1388;
    }
    float _1390 = _1366;
    if (_1264)
    {
        float _1392 = _1374 * _1374;
        _1386 = _1392;
    }
    float _1394 = _1386;
    if (!_1264)
    {
        _1350 = _1258;
    }
    float _1396 = _1350;
    float _1398 = _1396;
    if (_1264)
    {
        float _1400 = _1382 * _1382;
        _1398 = _1400;
    }
    float _1402 = _1398;
    float _1404 = fma(_1390, _1390, _1394);
    float _1406 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1408 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1410 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1412 = _1404 + _1402;
    float _1414 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1416 = fma(_1248, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1414);
    float _1418 = precise::clamp(_1416, 0.0, 1.0);
    float _1420 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1406);
    float _1422 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1408);
    float _1424 = _1158 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1426 = -_1418;
    float _1428 = _1426 + 1.0;
    float _1430 = rsqrt(_1412);
    float _1432 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1420);
    float _1434 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1422);
    float _1436 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1424);
    float _1438 = _1364 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1440 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1442 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = fma(_1162, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1436);
    float _1446 = abs(_1428);
    float _1448 = log2(_1446);
    float _1450 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1452 = _1438 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1454 = _1444 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1456 = -_1452;
    float _1458 = fma(_1456, _1410, 1.0);
    float _1460 = _1430 * _1374;
    float _1462 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1450);
    float _1464 = _1430 * _1390;
    float _1466 = _1430 * _1382;
    float _1468 = _1460 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1470 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1462);
    float _1472 = log2(_1458);
    float _1474 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1476 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1478 = -_1468;
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1478);
    float _1482 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1470);
    float _1484 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1474);
    float _1486 = -_1466;
    float _1488 = fma(_1486, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1480);
    float _1490 = exp2(_1476);
    float _1492 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1494 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1484);
    float _1496 = fma(_1488, -0.5, 0.5);
    float _1498 = fma(_1488, 0.5, 0.5);
    float _1500 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1492);
    float _1502 = _1464 + 1.0;
    float _1504 = 1.0 / _1482;
    float _1506 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1500);
    float _1508 = fma(_1498, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1510 = _1472 * 0.693147182464599609375;
    float _1512 = fma(_1498, _1508, -0.212114393711090087890625);
    float _1514 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = sqrt(_1496);
    float _1518 = -_1464;
    float _1520 = fma(_1490, _1502, _1518);
    float _1522 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1506);
    float _1524 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1494);
    float _1526 = fma(_1498, _1512, 1.570728778839111328125);
    float _1528 = fma(_1520, 0.5, 0.5);
    float _1530 = _1522 * _1504;
    float _1532 = _1524 * _1504;
    float _1534 = fma(_1530, 0.5, 0.5);
    float _1536 = fma(_1532, -0.5, 0.5);
    float _1538 = _1516 * 0.636619746685028076171875;
    float3 _4599 = float3(_1534, _1536, _1514);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4599, float3(0.0), isnan(_4599)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4599, float3(0.0), isnan(_4599)), level(0.0)).x;
    float _1542 = -_1526;
    float _1544 = fma(_1538, _1542, 1.0);
    float3 _4615 = float3(_1534, _1536, _1514);
    float4 _1547 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4615, float3(0.0), isnan(_4615)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4615, float3(0.0), isnan(_4615)), level(0.0)).xyzw;
    float _1549 = _1547.x;
    float _1551 = _1547.y;
    float _1553 = _1547.z;
    float _1555 = _1547.w;
    float2 _4632 = float2(_1544, _1528);
    float3 _1559 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4632, float2(0.0), isnan(_4632)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4632, float2(0.0), isnan(_4632)), level(0.0)).xyz;
    float _1561 = _1559.x;
    float _1563 = _1559.y;
    float _1565 = _1559.z;
    float _1567 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1569 = _312 + _1567;
    float _1571 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1573 = _344 > 0.5;
    float _1575 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1577 = _1575 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1581 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1579;
    bool _1583 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1585 = isnan(_312);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1597 = _1595 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    bool _1599 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1601 = isnan(_312);
    bool _1603 = _1599 || _1601;
    bool _1605 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1607 = _1603 || _1605;
    float _1609 = float(_1607);
    float _1611 = 1.0 / _1577;
    float _1613 = -_1593;
    float _1615 = _1613 + 1.0;
    float _1617 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1619 = _1617 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1621 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1623 = isnan(_312);
    bool _1625 = _1621 || _1623;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1629 = _1625 || _1627;
    float _1631 = float(_1629);
    float _1633 = _1609 * _1615;
    int _1635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1637 = _1635 != 0;
    float _1639 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1641 = _1639 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    int _1643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1645 = _1643 != 0;
    float _1647 = -_1631;
    float _1649 = _1647 + 1.0;
    float _1651 = 1.0 / _1619;
    bool _1653 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1655 = isnan(_312);
    bool _1657 = _1653 || _1655;
    bool _1659 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1661 = _1657 || _1659;
    float _1663 = float(_1661);
    float _1665 = _1440 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _1667 = _312 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1669 = isnan(_312);
    bool _1671 = _1667 || _1669;
    bool _1673 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1675 = _1671 || _1673;
    float _1677 = float(_1675);
    float _1679 = _1581 * _1611;
    float _1681 = -_1609;
    float _1683 = _1681 + 1.0;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    float _1689 = in.m_63.x;
    float _1691 = 1.0 / _1641;
    float _1693 = _1631 * _1683;
    float _1695 = _1663 * _1649;
    float _1697 = in.m_63.y;
    float _1699 = -_1663;
    float _1701 = _1699 + 1.0;
    float _1703 = fma(_1679, _1569, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1705 = _338 > 0.5;
    bool _1707 = _1705 && _1637;
    float _1709 = 1.0 / _1687;
    float _1711 = _1677 * _1701;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1715 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1713;
    float _1717 = _1597 * _1651;
    float _1719 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1721 = _312 + _1719;
    float _1723 = _1703 * _1711;
    float _1725 = -_1677;
    float _1727 = _1725 + 1.0;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _1733 = _1715 * _1691;
    float _1735 = fma(_1717, _1721, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1737 = fma(_1727, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1723);
    float _1739 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1741 = _312 + _1739;
    float _1743 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1745 = _778 * _828;
    float _1747 = fma(_1735, _1695, _1737);
    float _1749 = _1721;
    float _1751 = _1689;
    float _1753 = _1482;
    float _1755 = _1524;
    float _1757 = _1522;
    if (_1637)
    {
        _1749 = _1689;
    }
    float _1759 = _1749;
    float _1761 = _1731 * _1709;
    float _1763 = fma(_1733, _1741, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1765 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1767 = _312 + _1765;
    float _1769 = -_1697;
    float _1771 = _1769 + 1.0;
    float _1773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1775 = _1759;
    float _1777 = _1697;
    if (_1707)
    {
        float _1779 = -_1759;
        float _1781 = _1779 + 1.0;
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = fma(_1761, _1767, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _1787 = fma(_1763, _1693, _1747);
    if (_1645)
    {
        float _1789 = _1573 ? _1771 : _1697;
        _1777 = _1789;
    }
    float _1791 = _1777;
    float _1793 = _778 * _834;
    if (_1637)
    {
        _1751 = _1783;
    }
    float _1795 = _1751;
    float _1797 = fma(_1785, _1633, _1787);
    bool _1799 = _680 != 0.0;
    bool _1801 = isnan(_680);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.0);
    bool _1807 = _1803 || _1805;
    float _1809 = _1791 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1811 = exp2(_1571);
    float _1813 = _1795 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1815 = fma(_1593, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1797);
    float _1817 = _1809 * _1743;
    float _1819 = _778 * _870;
    float _1821 = _1813 * _1773;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1825 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1827 = _698 == 0.0;
    bool _1829 = !_1807;
    bool _1831 = _1827 && _1829;
    float _1833 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1835 = _1823 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1837 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1839 = _1825 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1841 = _1833 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1843 = _1815 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1845 = _788 * _834;
    out.m_65.x = _1835;
    out.m_65.y = _1839;
    out.m_65.z = _1841;
    out.m_65.w = _1837;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    bool _1849 = _700 == 0.0;
    bool _1851 = _1849 && _1831;
    float _1853 = in.m_67.x;
    float _1855 = in.m_67.y;
    float _1857 = in.m_67.z;
    float _1859 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1863 = _1847 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1865 = _788 * _870;
    float _1867 = _1859 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1869 = _1861 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1871 = -_770;
    float _1873 = fma(_1871, _810, _1793);
    float _1875 = _788 * _828;
    float _1877 = -_1811;
    float _1879 = _1877 + 1.0;
    float _1881 = -_770;
    float _1883 = fma(_1881, _812, _1819);
    float _1885 = -_770;
    float _1887 = fma(_1885, _816, _1745);
    out.m_69.x = _1863;
    out.m_69.y = _1867;
    out.m_69.z = _1869;
    out.m_69.w = _1843;
    float _1889 = _804 * _834;
    float _1891 = _804 * _870;
    float _1893 = fma(_782, _812, _1865);
    out.m_71.x = _1821;
    out.m_71.y = _1817;
    float _1895 = fma(_780, _654, _1873);
    float _1897 = _804 * _828;
    float _1899 = fma(_782, _816, _1875);
    float _1901 = _1879 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1903 = fma(_784, _812, _1891);
    float _1905 = fma(_784, _816, _1897);
    float _1907 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1665);
    float _1909 = _1855;
    float _1911 = _1853;
    float _1913 = _1857;
    if (!_1851)
    {
        float _1915 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1855);
        _1909 = _1915;
    }
    float _1917 = _1909;
    if (!_1851)
    {
        float _1919 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1853);
        _1911 = _1919;
    }
    float _1921 = _1911;
    float _1923 = fma(_782, _810, _1845);
    float _1925 = fma(_780, _662, _1883);
    float _1927 = fma(_780, _660, _1887);
    float _1929 = fma(_784, _810, _1889);
    float _1931 = fma(_796, _654, _1923);
    float _1933 = fma(_796, _662, _1893);
    float _1935 = _1895 * _1917;
    float _1937 = _1925 * _1917;
    float _1939 = fma(_796, _660, _1899);
    float _1941 = _1927 * _1917;
    float _1943 = fma(_790, _654, _1929);
    float _1945 = fma(_790, _662, _1903);
    float _1947 = fma(_1931, _1921, _1935);
    if (!_1851)
    {
        float _1949 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1857);
        _1913 = _1949;
    }
    float _1951 = _1913;
    float _1953 = fma(_1933, _1921, _1937);
    float _1955 = fma(_790, _660, _1905);
    float _1957 = fma(_1939, _1921, _1941);
    float _1959 = fma(_1943, _1951, _1947);
    float _1961 = fma(_1945, _1951, _1953);
    float _1963 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1907);
    float _1965 = fma(_1955, _1951, _1957);
    bool _1967 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1969 = isnan(_1248);
    bool _1971 = _1967 || _1969;
    bool _1973 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1975 = _1971 || _1973;
    float _1977 = _1522 + _1482;
    float _1979 = fma(_1454, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1963);
    float _1981 = _1482 * 0.5;
    out.m_73.x = _1959;
    out.m_73.y = _1961;
    out.m_73.z = _1965;
    float _1983 = _1979 + _1482;
    float _1985 = _1977 * 0.5;
    float _1987 = fma(_1524, -0.5, _1981);
    float _1989 = _1983 * 0.5;
    out.gl_Position.x = _1522;
    out.gl_Position.y = _1524;
    out.gl_Position.z = _1979;
    out.gl_Position.w = _1482;
    out.m_75.x = _1985;
    out.m_75.y = _1987;
    out.m_75.z = _1989;
    out.m_75.w = _1482;
    float _1991 = _1979;
    float _1993 = _1985;
    if (!_1975)
    {
        _1753 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1995 = _1753;
    float _1997 = _1995;
    float _1999 = _1995;
    if (!_1975)
    {
        _1991 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2001 = _1991;
    float _2003 = _2001;
    float _2005 = _2001;
    if (!_1975)
    {
        _1993 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2007 = _1993;
    float _2009 = _2007;
    float _2011 = _2007;
    if (!_1975)
    {
        _1755 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2013 = _1755;
    float _2015 = _2013;
    float _2017 = _2013;
    if (!_1975)
    {
        _1757 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2019 = _1757;
    float _2021 = _1901 * _1540;
    float _2023 = -_1901;
    float _2025 = _2023 + 1.0;
    float _2027 = _1555 * _2021;
    float _2029 = _1555 * _2025;
    float _2031 = _1565 * _2021;
    float _2033 = fma(_1561, _2027, _1549);
    float _2035 = fma(_1563, _2027, _1551);
    float _2037 = _2027;
    float _2039 = _2019;
    float _2041 = _2019;
    if (!_1975)
    {
        _2037 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2043 = _2037;
    float _2045 = fma(_1555, _2031, _1553);
    out.m_77.x = _2033;
    out.m_77.y = _2035;
    out.m_77.z = _2045;
    out.m_77.w = _2029;
    bool _2047 = !_1975;
    float _2049 = _2043;
    float _2051 = _2043;
    if (!_2047)
    {
        bool _2053 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2055 = isnan(_1248);
        bool _2057 = _2053 || _2055;
        bool _2059 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2061 = _2057 || _2059;
        if (!_2061)
        {
            float _2063 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2065 = _1248 + _2063;
            float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2069 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2067;
            float _2071 = 1.0 / _2069;
            float _2073 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2075 = _2073 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2077 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2079 = _2077 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2081 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2083 = _2081 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2085 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2087 = _2085 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2089 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2091 = _2089 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2093 = _2065 * _2071;
            float _2095 = precise::clamp(_2093, 0.0, 1.0);
            float _2097 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2099 = _2097 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2101 = fma(_2095, _2075, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2103 = fma(_2095, _2099, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2105 = fma(_2095, _2079, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2107 = fma(_2095, _2083, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2109 = fma(_2095, _2087, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2111 = fma(_2095, _2091, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2011 = _2103;
            _2017 = _2109;
            _2051 = _2101;
            _2005 = _2107;
            _1999 = _2105;
            _2041 = _2111;
            _2113 = true;
        }
        else
        {
            bool _2115 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2117 = isnan(_1248);
            bool _2119 = _2115 || _2117;
            bool _2121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2123 = _2119 || _2121;
            if (!_2123)
            {
                _2049 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2125 = _2049;
            _2051 = _2125;
            if (!_2123)
            {
                _2009 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2127 = _2009;
            _2011 = _2127;
            if (!_2123)
            {
                _1997 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2129 = _1997;
            _1999 = _2129;
            if (!_2123)
            {
                _2003 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2131 = _2003;
            _2005 = _2131;
            if (!_2123)
            {
                _2015 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2133 = _2015;
            _2017 = _2133;
            if (!_2123)
            {
                _2039 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2135 = _2039;
            bool _2137 = !_2123;
            _2041 = _2135;
            if (!_2137)
            {
                bool _2139 = _1248 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2141 = isnan(_1248);
                bool _2143 = _2139 || _2141;
                bool _2145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2147 = _2143 || _2145;
                if (!_2147)
                {
                    float _2149 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2151 = _1248 + _2149;
                    float _2153 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2155 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2153;
                    float _2157 = 1.0 / _2155;
                    float _2159 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2161 = _2159 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2163 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2165 = _2163 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2167 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2169 = _2167 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2179 = _2151 * _2157;
                    float _2181 = precise::clamp(_2179, 0.0, 1.0);
                    float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2187 = fma(_2181, _2161, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2189 = fma(_2181, _2185, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2191 = fma(_2181, _2165, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2193 = fma(_2181, _2169, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2195 = fma(_2181, _2173, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2197 = fma(_2181, _2177, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2011 = _2189;
                    _2017 = _2195;
                    _2051 = _2187;
                    _2005 = _2193;
                    _1999 = _2191;
                    _2041 = _2197;
                    _2113 = true;
                }
                else
                {
                    _2011 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2017 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2051 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2005 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1999 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2041 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2113 = false;
    float _2199 = _2011;
    float _2201 = _2017;
    float _2203 = _2051;
    float _2205 = _2005;
    float _2207 = _1999;
    float _2209 = _2041;
    float _2211 = fma(_1961, -0.5, 0.5);
    float _2213 = precise::clamp(_2211, 0.0, 1.0);
    float _2215 = -_2199;
    float _2217 = _2215 + _2201;
    float _2219 = _1226 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2221 = -_2203;
    float _2223 = _2221 + _2205;
    float _2225 = fma(_2213, _2217, _2199);
    out.m_79.x = 0.0;
    float _2227 = -_2207;
    float _2229 = _2227 + _2209;
    float _2231 = fma(_2213, _2223, _2203);
    float _2233 = _2225 * 0.586610972881317138671875;
    out.m_47.x = _2219;
    bool _2235 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2237 = fma(_2213, _2229, _2207);
    float _2239 = fma(_2231, 0.298911988735198974609375, _2233);
    bool _2241 = _1226 > 0.0;
    bool _2243 = isnan(_1226);
    bool _2245 = _2241 || _2243;
    bool _2247 = isnan(0.0);
    bool _2249 = _2245 || _2247;
    float _2251 = fma(_2237, 0.114477999508380889892578125, _2239);
    float _2253 = -_2251;
    float _2255 = _2231 + _2253;
    float _2257 = -_2251;
    float _2259 = _2225 + _2257;
    float _2261 = -_2251;
    float _2263 = _2237 + _2261;
    float _2265 = fma(_2255, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2267 = fma(_2259, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    float _2269 = fma(_2263, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2251);
    bool _2271 = !_2235;
    if (!_2271)
    {
        float _2273 = -_1158;
        float _2275 = _2273 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2277 = -_1160;
        float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2281 = -_1162;
        float _2283 = _2281 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2285 = _2275 * _2275;
        float _2287 = fma(_2279, _2279, _2285);
        float _2289 = fma(_2283, _2283, _2287);
        float _2291 = sqrt(_2289);
        float _2293 = rsqrt(_2289);
        float _2295 = -_2291;
        float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2299 = _2297 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2301 = precise::clamp(_2299, 0.0, 1.0);
        float _2303 = _2279 * _2293;
        float _2305 = _2275 * _2293;
        float _2307 = abs(_2301);
        float _2309 = log2(_2307);
        float _2311 = _2283 * _2293;
        float _2313 = _2303 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2315 = _1961 * _2305;
        float _2317 = -_2305;
        float _2319 = -_2313;
        float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2319);
        float _2323 = fma(_1959, _2303, _2315);
        float _2325 = -_2311;
        float _2327 = fma(_2325, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2321);
        float _2329 = fma(_1965, _2311, _2323);
        float _2331 = precise::clamp(_2329, 0.0, 1.0);
        float _2333 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2335 = _2327 + _2333;
        float _2337 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2339 = _2335 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2341 = precise::clamp(_2339, 0.0, 1.0);
        float _2343 = exp2(_2337);
        float _2345 = _2343 * _2341;
        float _2347 = _2331 * _2345;
        float _2349 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2351 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2353 = _2347 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_79.x = _2349;
        out.m_79.y = _2351;
        out.m_79.z = _2353;
    }
    out.m_81.x = _2265;
    out.m_81.y = _2267;
    out.m_81.z = _2269;
    if (_2249)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2355 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2355;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

