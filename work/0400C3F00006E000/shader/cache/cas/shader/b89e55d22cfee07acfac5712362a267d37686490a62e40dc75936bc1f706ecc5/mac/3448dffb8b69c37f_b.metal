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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_65 [[user(locn0)]];
    float4 m_81 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_53 [[user(locn7)]];
    float4 m_57 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_83 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 m_85 [[user(locn14)]];
    float4 m_97 [[user(locn15)]];
    float4 m_93 [[user(locn16)]];
    float4 m_95 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(0)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_59 [[attribute(6)]];
    float4 m_61 [[attribute(7)]];
    float4 m_73 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3340 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = in.m_48.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3655 = as_type<float>(_140);
        out.gl_Position.z = _3655;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _144 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_115);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_120);
    bool _156 = _124 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _132;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_166);
        out.gl_Position.z = _3710;
    }
    if (_160)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _168 = in.m_55.y;
    float _170 = 1.0 / _154;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = _124 * _170;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.y = _168;
    bool _190 = !_172;
    float _192 = _186;
    if (!_190)
    {
        float _194 = in.m_59.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _192 = _208;
    }
    float _210 = _192;
    float _212 = in.m_59.y;
    float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _216 = log2(_214);
    float _218 = in.m_59.z;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _222 = _220 != 0;
    float _224 = in.m_46.x;
    float _226 = in.m_46.y;
    float _228 = in.m_46.z;
    float _230 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _232 = -_230;
    float _234 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _232);
    float _236 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _238 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _240 = 0.0;
    float _242 = _228;
    float _244 = _224;
    if (_222)
    {
        float _246 = in.m_59.x;
        _240 = _246;
    }
    float _248 = _240;
    float _250 = _124 * _216;
    float _252 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _238);
    float _254 = -_236;
    float _256 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _254);
    bool _258 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _266 = _262 || _264;
    float _268 = _212 * 2.0;
    float _270 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _252);
    float _272 = exp2(_250);
    int _274 = 0;
    float _276 = _212;
    if (_222)
    {
        _274 = 0;
    }
    int _278 = _274;
    float _280 = _218 * 2.0;
    float _282 = _212 + _218;
    int _284 = 0;
    int _286 = _278;
    float _288 = _218;
    if (_222)
    {
        _284 = 0;
    }
    int _290 = _284;
    float _292 = 0.0;
    int _294 = _290;
    if (_222)
    {
        _292 = 1.0;
    }
    float _296 = _292;
    float _298 = _282 + (-1.0);
    float _300 = floor(_268);
    float _302 = 0.0;
    float _304 = _296;
    if (_222)
    {
        _302 = _212;
    }
    float _306 = _302;
    float _308 = floor(_280);
    float _310 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _312 = -_272;
    float _314 = _312 + 1.0;
    float _316 = 0.0;
    float _318 = _248;
    float _320 = _306;
    if (_222)
    {
        _316 = _248;
    }
    float _322 = _316;
    float _324 = -_310;
    float _326 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _324);
    float _328 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _330 = _300 > 0.0;
    bool _332 = _300 >= 0.0;
    bool _334 = isnan(_300);
    bool _336 = _332 || _334;
    bool _338 = isnan(0.0);
    bool _340 = _336 || _338;
    float _342 = _234 * _234;
    bool _344 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _346 = isnan(1.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _352 = _348 || _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _356 = 1.0 + _354;
    float _358 = _266 ? _314 : 0.0;
    float _360 = fma(_256, _256, _342);
    bool _362 = _308 > 0.0;
    float _364 = 1.0 / _356;
    bool _366 = _308 >= 0.0;
    bool _368 = isnan(_308);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = fma(_326, _326, _360);
    float _378 = _226 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _226 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = 0.0;
    float _384 = _322;
    int _386 = as_type<int>(_328);
    if (_222)
    {
        _382 = _322;
    }
    float _388 = _382;
    float _390 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _392 = rsqrt(_376);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[4].z, _390);
    float _398 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    float _400 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _402 = _388;
    if (!_222)
    {
        float _404 = in.m_59.x;
        float _406 = _212 * 3.1415927410125732421875;
        float _408 = _406 * 0.15915493667125701904296875;
        float _410 = _408 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _404 * 3.1415927410125732421875;
        float _416 = _414 * 0.15915493667125701904296875;
        float _418 = _416 * 6.283185482025146484375;
        float _420 = sin(_418);
        _318 = _404;
        _402 = _212;
        _304 = 1.2345600128173828125;
        _294 = 2;
        _286 = 1;
        _384 = _420;
        _320 = _412;
    }
    float _422 = _318;
    float _424 = _402;
    float _426 = _304;
    int _428 = _294;
    int _430 = _286;
    float _432 = _384;
    float _434 = _320;
    float _436 = _422 * 2.0;
    float _438 = _358 * _364;
    float _440 = _398 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _442 = floor(_436);
    int _444 = _340 ? 0 : 1;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _400 + _446;
    int _450 = _374 ? 0 : 1;
    float _452 = -_440;
    float _454 = _452 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _466 = _464 != 0;
    int _468 = ~_444;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = abs(_448);
    float _476 = abs(_454);
    float _478 = precise::max(_474, _476);
    bool _480 = !_458;
    int _482 = _480 ? 0 : 1;
    int _484 = ~_450;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    int _490 = _472;
    int _492 = _488;
    float _494 = _448;
    float _496 = _426;
    float _498 = _424;
    if (!_330)
    {
        int _500 = ~_444;
        int _502 = _500 + 1;
        _490 = _502;
    }
    int _504 = _490;
    if (!_362)
    {
        int _506 = ~_450;
        int _508 = _506 + 1;
        _492 = _508;
    }
    int _510 = _492;
    float _512 = rsqrt(_270);
    bool _514 = _478 >= 16.0;
    float _516 = _256 * _392;
    int _518 = abs(_482);
    float _520 = _422 + _218;
    bool _522 = _442 > 0.0;
    float _524 = _234 * _392;
    bool _526 = _442 >= 0.0;
    bool _528 = isnan(_442);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = _326 * _392;
    bool _538 = !_466;
    int _540 = _538 ? 0 : 1;
    float _542 = _520 + (-1.0);
    float _544 = float(_510);
    float _546 = _212 + _422;
    int _548 = abs(_540);
    float _550 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _552 = _546 + (-1.0);
    float _554 = float(_518);
    if (_514)
    {
        float _556 = _448 * 0.0625;
        _494 = _556;
    }
    float _558 = _494;
    float _560 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _562 = float(_504);
    float _564 = _554 * _544;
    float _566 = float(_548);
    float _568 = _512 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _570 = !_462;
    int _572 = _570 ? 0 : 1;
    float _574 = _564 * (-2.0);
    int _576 = _534 ? 0 : 1;
    float _578 = _566 * _562;
    int _580 = abs(_572);
    float _582 = _524 * _524;
    int _584 = ~_576;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = fma(_560, _574, _560);
    int _592 = _588;
    if (!_522)
    {
        int _594 = ~_576;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = fma(_516, _516, _582);
    float _602 = float(_580);
    float _604 = _422 + (-0.5);
    float _606 = float(_598);
    float _608 = _454 * 0.0625;
    float _610 = abs(_558);
    bool _612 = _610 != 0.0;
    bool _614 = isnan(_610);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = fma(_536, _536, _600);
    bool _624 = !_352;
    float _626 = _624 ? _124 : _438;
    float _628 = _604 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _630 = _514 ? _608 : _454;
    float _632 = _602 * _606;
    float _634 = _568 * (-0.699999988079071044921875);
    float _636 = fma(_626, _590, _628);
    float _638 = abs(_630);
    bool _640 = _638 == 0.0;
    bool _642 = !_620;
    bool _644 = _640 && _642;
    float _646 = in.m_61.x;
    float _648 = in.m_61.y;
    float _650 = in.m_61.z;
    float _652 = _634 * 0.15915493667125701904296875;
    float _654 = _636 * 0.15915493667125701904296875;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _662 = _660 != 0;
    float _664 = _578 * (-2.0);
    float _666 = _632 * (-2.0);
    float _668 = abs(_630);
    bool _670 = _668 == 0.0;
    float _672 = _652 * 6.283185482025146484375;
    float _674 = cos(_672);
    bool _676 = !_662;
    int _678 = _676 ? 0 : 1;
    float _680 = fma(_550, _664, _550);
    float _682 = fma(_328, _666, _328);
    float _684 = _218 + (-0.5);
    bool _686 = _662;
    if (_644)
    {
        bool _688 = as_type<int>(_630) >= 0;
        _686 = _688;
    }
    bool _690 = _686;
    float _692 = _212 + (-0.5);
    bool _694 = !_658;
    int _696 = _694 ? 0 : 1;
    float _698 = _654 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = _684 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    if (_644)
    {
        int _706 = _690 ? 0 : 1078530011;
        _386 = _706;
    }
    int _708 = _386;
    int _710 = _708;
    if (_644)
    {
        int _712 = int(0x80000000) & as_type<int>(_558);
        int _714 = _708 | _712;
        _710 = _714;
    }
    int _716 = _710;
    float _718 = _654 * 6.283185482025146484375;
    float _720 = cos(_718);
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _728 = _726 != 0;
    bool _730 = !_724;
    int _732 = _730 ? 0 : 1;
    float _734 = rsqrt(_622);
    bool _736 = !_728;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(_626, _680, _702);
    float _742 = fma(_626, _682, _704);
    bool _744 = !_620;
    bool _746 = _744 && _670;
    int _748 = _724 ? (-1) : 0;
    int _750 = _716;
    float _752 = as_type<float>(_716);
    bool _754 = _690;
    if (!_746)
    {
        float _756 = abs(_558);
        bool _758 = _756 != as_type<float>(0x7f800000u /* inf */);
        bool _760 = isnan(_756);
        bool _762 = _758 || _760;
        bool _764 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _766 = _762 || _764;
        float _768 = abs(_630);
        bool _770 = _768 == as_type<float>(0x7f800000u /* inf */);
        float _772 = abs(_630);
        bool _774 = _772 == as_type<float>(0x7f800000u /* inf */);
        bool _776 = !_766;
        bool _778 = _774 && _776;
        _754 = _766;
        if (_778)
        {
            bool _780 = as_type<int>(_630) >= 0;
            _748 = _780 ? (-1) : 0;
        }
        int _782 = _748;
        if (_778)
        {
            _750 = 1075235812;
        }
        int _784 = _750;
        int _786 = _784;
        if (_778)
        {
            int _788 = ~_782;
            int _790 = (_788 != 0) ? _784 : 1061752795;
            _786 = _790;
        }
        int _792 = _786;
        float _794 = as_type<float>(_792);
        if (_778)
        {
            int _796 = int(0x80000000) & as_type<int>(_558);
            int _798 = _792 | _796;
            _794 = as_type<float>(_798);
        }
        float _800 = _794;
        bool _802 = !_766;
        bool _804 = _802 && _770;
        _752 = _800;
        if (!_804)
        {
            float _806 = abs(_558);
            float _808 = abs(_630);
            float _810 = precise::max(_806, _808);
            float _812 = abs(_558);
            float _814 = abs(_630);
            float _816 = precise::min(_812, _814);
            float _818 = 1.0 / _810;
            float _820 = abs(_558);
            float _822 = abs(_630);
            bool _824 = _820 > _822;
            bool _826 = as_type<int>(_630) >= 0;
            float _828 = _816 * _818;
            float _830 = abs(_558);
            float _832 = abs(_630);
            float _834 = _830 + _832;
            float _836 = _828 * _828;
            bool _838 = _834 > as_type<float>(0x7f800000u /* inf */);
            bool _840 = isnan(_834);
            bool _842 = _838 || _840;
            bool _844 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _846 = _842 || _844;
            float _848 = _836 + 11.33538818359375;
            float _850 = fma(_836, _848, 28.84246826171875);
            float _852 = fma(_836, _850, 19.6966705322265625);
            float _854 = fma(_836, -0.82336294651031494140625, -5.674867153167724609375);
            float _856 = fma(_836, _854, -6.565555095672607421875);
            float _858 = 1.0 / _852;
            float _860 = _836 * _856;
            float _862 = _828 * _860;
            float _864 = fma(_862, _858, _828);
            int _866 = as_type<int>(_558) & int(0x80000000);
            float _868 = _864;
            _752 = _834;
            _754 = _846;
            if (_824)
            {
                float _870 = -_864;
                float _872 = _870 + 1.57079637050628662109375;
                _868 = _872;
            }
            float _874 = _868;
            int _876 = as_type<int>(_874);
            if (!_826)
            {
                float _878 = -_874;
                float _880 = _878 + 3.1415927410125732421875;
                _876 = as_type<int>(_880);
            }
            int _882 = _876;
            if (!_846)
            {
                int _884 = _866 | _882;
                _752 = as_type<float>(_884);
            }
        }
    }
    float _886 = _752;
    bool _888 = _754;
    float _890 = -_886;
    float _892 = _742 + _890;
    float _894 = _740 * 0.15915493667125701904296875;
    float _896 = _226 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _892 * 0.15915493667125701904296875;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _902 = _900 != 0;
    float _904 = in.m_63.x;
    float _906 = in.m_63.y;
    float _908 = in.m_63.z;
    float _910 = _894 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _916 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _918 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _920 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _922 = _898 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _928 = fma(_926, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _930 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[5].z, _914);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[193].y;
    bool _934 = _888;
    if (!_902)
    {
        _242 = 0.0;
    }
    float _936 = _242;
    float _938 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _940 = _936;
    if (!_902)
    {
        _932 = 0.0;
    }
    float _942 = _932;
    float _944 = _898 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _942;
    if (!_902)
    {
        _244 = 0.0;
    }
    float _950 = _244;
    bool _952 = !_902;
    float _954 = _950;
    if (!_952)
    {
        float _956 = -_938;
        float _958 = _956 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _960 = -_400;
        float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _964 = _958 * _958;
        float _966 = fma(_962, _962, _964);
        float _968 = fma(_454, _454, _966);
        float _970 = rsqrt(_968);
        float _972 = _970 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _974 = _962 * _972;
        float _976 = _958 * _972;
        float _978 = _454 * _972;
        _948 = _976;
        _940 = _974;
        _954 = _978;
    }
    float _980 = _948;
    float _982 = _940;
    float _984 = _954;
    float _986 = _422 * 6.283185482025146484375;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    float _990 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _992 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _994 = fma(_124, 0.02999999932944774627685546875, _986);
    float _996 = _894 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = _988 * _990;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _908);
    float _1004 = _994 * 0.15915493667125701904296875;
    float _1006 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _1010 = _720 * _924;
    float _1012 = _720 * _946;
    float _1014 = _1002 * _1006;
    float _1016 = _1004 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _700 * _946;
    float _1022 = _1008 * _992;
    float _1024 = _700 * _924;
    float _1026 = _720 * _912;
    float _1028 = _700 * _912;
    float _1030 = _946 * _912;
    float _1032 = -_1010;
    float _1034 = fma(_998, _1020, _1032);
    float _1036 = fma(_998, _1012, _1024);
    float _1038 = -_1020;
    float _1040 = fma(_998, _1010, _1038);
    float _1042 = fma(_998, _1024, _1012);
    float _1044 = _1026 * _1022;
    float _1046 = -_1022;
    float _1048 = _998 * _1046;
    float _1050 = _924 * _912;
    float _1052 = _652 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = -_168;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1060 = fma(_1036, _1000, _1044);
    float _1062 = fma(_1030, _1000, _1048);
    float _1064 = _1028 * _1022;
    float _1066 = _1018 * _1058;
    float _1068 = fma(_1040, _1014, _1060);
    float _1070 = fma(_1050, _1014, _1062);
    float _1072 = fma(_1034, _1000, _1064);
    float _1074 = _928 * _1066;
    float _1076 = _938 + _1068;
    float _1078 = _400 + _1070;
    float _1080 = _516 * _734;
    float _1082 = _524 * _734;
    float _1084 = -_674;
    float _1086 = _1084 + 1.0;
    float _1088 = _536 * _734;
    float _1090 = fma(_516, _1074, _1078);
    float _1092 = fma(_1042, _1014, _1072);
    float _1094 = fma(_524, _1074, _1076);
    float _1096 = _1080 * _1086;
    float _1098 = _1088 * _1054;
    float _1100 = _1082 * _1086;
    float _1102 = _1080 * _1054;
    float _1104 = _1082 * _1054;
    float _1106 = fma(_1082, _1096, _1098);
    float _1108 = fma(_1082, _1100, _674);
    float _1110 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1112 = _1094 + _1110;
    float _1114 = _440 + _1092;
    float _1116 = -_1098;
    float _1118 = fma(_1082, _1096, _1116);
    float _1120 = fma(_1080, _1096, _674);
    float _1122 = -_1104;
    float _1124 = fma(_1088, _1096, _1122);
    float _1126 = fma(_1088, _1096, _1104);
    float _1128 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1130 = _1090 + _1128;
    float _1132 = _1108 * _1112;
    float _1134 = fma(_536, _1074, _1114);
    float _1136 = fma(_1088, _1100, _1102);
    float _1138 = _1118 * _1112;
    float _1140 = -_1102;
    float _1142 = fma(_1088, _1100, _1140);
    float _1144 = fma(_1106, _1130, _1132);
    float _1146 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1148 = _1134 + _1146;
    float _1150 = fma(_1120, _1130, _1138);
    float _1152 = _1088 * _1088;
    float _1154 = _1136 * _1112;
    float _1156 = fma(_1142, _1148, _1144);
    float _1158 = fma(_1126, _1148, _1150);
    float _1160 = fma(_1086, _1152, _674);
    float _1162 = fma(_1124, _1130, _1154);
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1166 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1170 = fma(_1160, _1148, _1162);
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1164);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1168);
    float _1178 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1172);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1174);
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1176);
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1186 = _1180 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1188 = _1182 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1190 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1194 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1190);
    float _1196 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1192);
    float _1198 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1196);
    float _1202 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1202 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1212 = _1204 + _1210;
    float _1214 = _1208 * _1208;
    float _1216 = fma(_1212, _1212, _1214);
    float _1218 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1220 = sqrt(_1216);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1218);
    float _1224 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1222);
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1228 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1224;
    float _1232 = _1202;
    float _1234 = _1204;
    float _1236 = _1188;
    float _1238 = _982;
    float _1240 = _1212;
    float _1242 = _1208;
    if (!_1228)
    {
        _1230 = _1202;
    }
    float _1244 = _1230;
    float _1246 = _1244;
    if (!_1228)
    {
        _1232 = _1226;
    }
    float _1248 = _1232;
    bool _1250 = !_1228;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1220 + _1256;
        float _1260 = rsqrt(_1216);
        float _1262 = _1258 * _1254;
        float _1264 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1260 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = fma(_1212, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1286 = fma(_1208, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1288 = fma(_1226, _1274, _1282);
        _1252 = _1288;
        _1234 = _1284;
        _1246 = _1286;
        _1236 = _1266;
    }
    float _1290 = _1252;
    float _1292 = _1234;
    float _1294 = _1246;
    float _1296 = _1236;
    float _1298 = _980 + _1290;
    float _1300 = _982 + _1292;
    float _1302 = _984 + _1294;
    float _1304 = _400 + _982;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1308 = _1298 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1312 = _1300 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1316 = _1302 + _1314;
    float _1318 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = _1308 * _1308;
    float _1322 = _440 + _984;
    float _1324 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1326 = fma(_1312, _1312, _1320);
    float _1328 = fma(_1316, _1316, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1332 = rsqrt(_1328);
    float _1334 = sqrt(_1328);
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1338 = _1312 * _1336;
    float _1340 = _1316 * _1336;
    float _1342 = _1338 * _1338;
    float _1344 = _1340 * _1340;
    float _1346 = _1342 + _1344;
    float _1348 = sqrt(_1346);
    bool _1350 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1354 = _1348 + _1352;
    float _1356 = _1296;
    float _1358 = _1354;
    bool _1360 = _1350;
    float _1362 = _1308;
    if (_1350)
    {
        float _1364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1356 = _1364;
    }
    float _1366 = _1356;
    if (!_1350)
    {
        _1238 = _1344;
    }
    float _1368 = _1238;
    float _1370 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1372 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1370);
    float _1374 = _1368;
    if (_1350)
    {
        float _1376 = rsqrt(_1346);
        _1240 = _1376;
    }
    float _1378 = _1240;
    float _1380 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1372);
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = _1378;
    if (_1350)
    {
        float _1386 = _1354 * _1366;
        _1358 = _1386;
    }
    float _1388 = _1358;
    if (_1350)
    {
        float _1390 = _1388 * 0.15915493667125701904296875;
        _1242 = _1390;
    }
    float _1392 = _1242;
    float _1394 = _1290;
    if (_1350)
    {
        float _1396 = _1392 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        _1394 = _1398;
    }
    float _1400 = _1394;
    float _1402 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1404 = precise::max(0.0, _1402);
    float _1406 = _1226;
    float _1408 = _1404;
    float _1410 = _1402;
    if (_1350)
    {
        float _1412 = _1392 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = -_1336;
    float _1420 = -_1404;
    float _1422 = fma(_1308, _1418, _1420);
    if (_1350)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1424;
    }
    float _1426 = _1408;
    float _1428 = _1400;
    float _1430 = _1426;
    if (_1350)
    {
        float _1432 = fma(_1400, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = _1434;
    if (!_1350)
    {
        _1430 = _1422;
    }
    float _1438 = _1430;
    float _1440 = _1438;
    float _1442 = _1416;
    if (_1350)
    {
        float _1444 = _1416 + (-1.0);
        _1410 = _1444;
    }
    float _1446 = _1410;
    float _1448 = 0.0;
    float _1450 = _1446;
    if (_1350)
    {
        float _1452 = _1378 * _1434;
        _1448 = _1452;
    }
    float _1454 = _1448;
    if (!_1350)
    {
        _1436 = _1338;
    }
    float _1456 = _1436;
    float _1458 = _1456;
    if (_1350)
    {
        float _1460 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1460;
    }
    float _1462 = _1384;
    if (_1350)
    {
        float _1464 = _1338 * _1454;
        _1458 = _1464;
    }
    float _1466 = _1458;
    if (!_1350)
    {
        _1450 = _1340;
    }
    float _1468 = _1450;
    float _1470 = _1468;
    if (_1350)
    {
        float _1472 = _1340 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (_1350)
    {
        float _1476 = fma(_1422, _1416, _1462);
        _1440 = _1476;
    }
    float _1478 = _1440;
    if (!_1350)
    {
        _1442 = _1342;
    }
    float _1480 = _1442;
    float _1482 = _1480;
    if (_1350)
    {
        float _1484 = _1466 * _1466;
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1350)
    {
        float _1488 = _1474 * _1474;
        _1374 = _1488;
    }
    float _1490 = _1374;
    float _1492 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1494 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1496 = fma(_1478, _1478, _1486);
    float _1498 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1492);
    float _1500 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1494);
    float _1502 = _1496 + _1490;
    float _1504 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1506 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1508 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1510 = fma(_1322, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1512 = rsqrt(_1502);
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1516 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1514);
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1522 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1524 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1526 = -_1518;
    float _1528 = _1526 + 1.0;
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1534 = floor(_1508);
    float _1536 = -_1524;
    float _1538 = fma(_1536, _1330, 1.0);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1542 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1544 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1546 = abs(_1528);
    float _1548 = log2(_1546);
    float _1550 = _1512 * _1466;
    float _1552 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1544);
    float _1554 = _1512 * _1478;
    float _1556 = _1512 * _1474;
    float _1558 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1560 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1562 = floor(_1510);
    float _1564 = -_1558;
    float _1566 = fma(_1554, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1564);
    float _1568 = -_1534;
    float _1570 = _1508 + _1568;
    float _1572 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1574 = -_1556;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1566);
    float _1578 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1560);
    float _1580 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1582 = fma(_1576, -0.5, 0.5);
    float _1584 = log2(_1538);
    float _1586 = fma(_1576, 0.5, 0.5);
    float _1588 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1590 = -_1562;
    float _1592 = _1510 + _1590;
    float _1594 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1572);
    float _1596 = exp2(_1580);
    float _1598 = _1554 + 1.0;
    float _1600 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1594);
    float _1602 = 1.0 / _1552;
    float _1604 = fma(_1586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1606 = _1584 * 0.693147182464599609375;
    float _1608 = fma(_1586, _1604, -0.212114393711090087890625);
    float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1612 = sqrt(_1582);
    float _1614 = -_1554;
    float _1616 = fma(_1596, _1598, _1614);
    float _1618 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1620 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1600);
    float _1622 = fma(_1586, _1608, 1.570728778839111328125);
    float _1624 = fma(_1616, 0.5, 0.5);
    float _1626 = _1618 * _1602;
    float _1628 = _1620 * _1602;
    float _1630 = fma(_1626, 0.5, 0.5);
    float _1632 = fma(_1628, -0.5, 0.5);
    float _1634 = _1612 * 0.636619746685028076171875;
    float2 _5955 = float2(_1570, _1592);
    float _1636 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5955, float2(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5955, float2(0.0), isnan(_5955)), level(0.0)).x;
    float3 _5966 = float3(_1630, _1632, _1610);
    float _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5966, float3(0.0), isnan(_5966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5966, float3(0.0), isnan(_5966)), level(0.0)).x;
    float _1640 = -_1622;
    float _1642 = fma(_1634, _1640, 1.0);
    float3 _5982 = float3(_1630, _1632, _1610);
    float4 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5982, float3(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5982, float3(0.0), isnan(_5982)), level(0.0)).xyzw;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1645.w;
    float2 _5998 = float2(_1642, _1624);
    float3 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1667 = _1665 != 0;
    float _1669 = in.m_55.x;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1673 = _1671 != 0;
    float _1675 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1677 = int(_1675);
    bool _1679 = _218 > 0.5;
    float _1681 = in.m_59.w;
    float _1683 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1685 = _212 > 0.5;
    out.m_65.x = _180;
    out.m_65.y = _184;
    out.m_65.z = _188;
    out.m_65.w = _182;
    float _1687 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1689 = int(_1687);
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1695 = 0;
    float _1697 = _1610;
    float _1699 = _1618;
    float _1701 = _1620;
    if (_1667)
    {
        float _1703 = in.m_59.x;
        _1695 = as_type<int>(_1703);
    }
    int _1705 = _1695;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1711 = as_type<int>(_1616);
    if (_1673)
    {
        float _1713 = in.m_59.z;
        _1711 = as_type<int>(_1713);
    }
    int _1715 = _1711;
    float _1717 = 1.0 / _1693;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1725 = -_168;
    float _1727 = _1725 + 1.0;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1733 = _1669;
    if (!_1673)
    {
        _1697 = _1669;
    }
    float _1735 = _1697;
    float _1737 = 1.0 / _1709;
    int _1739 = _1679 ? as_type<int>(_1727) : as_type<int>(_168);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    int _1745 = _1685 ? as_type<int>(_1727) : as_type<int>(_168);
    out.m_67.x = _1312;
    out.m_67.y = _1308;
    out.m_67.z = _1316;
    bool _1747 = _1681 > 0.5;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1751 = _1749 != 0;
    float _1753 = 1.0 / _1723;
    int _1755 = _1747 ? as_type<int>(_1727) : as_type<int>(_168);
    float _1757 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1759 = _1705;
    float _1761 = _1735;
    if (_1667)
    {
        bool _1763 = as_type<float>(_1705) > 0.5;
        _1360 = _1763;
    }
    bool _1765 = _1360;
    if (_1673)
    {
        float _1767 = -_1669;
        float _1769 = _1767 + 1.0;
        _1759 = as_type<int>(_1769);
    }
    int _1771 = _1759;
    float _1773 = _1751 ? as_type<float>(_1739) : _168;
    float _1775 = fma(_1757, -2.0, _1719);
    int _1777 = _1715;
    int _1779 = as_type<int>(_1775);
    if (_1673)
    {
        bool _1781 = as_type<float>(_1715) > 0.5;
        _934 = _1781;
    }
    bool _1783 = _934;
    if (_1667)
    {
        float _1785 = -_1669;
        float _1787 = _1785 + 1.0;
        _1777 = as_type<int>(_1787);
    }
    int _1789 = _1777;
    float _1791 = 1.0 / _1731;
    if (_1673)
    {
        float _1793 = _1783 ? as_type<float>(_1771) : _1669;
        _1761 = _1793;
    }
    float _1795 = _1761;
    float _1797 = in.m_69.x;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1801 = _1799 != 0;
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1805 = _1801 ? as_type<float>(_1739) : _168;
    float _1807 = 1.0 / _1743;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1811 = _1809 != 0;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1817 = float(uint(_1677));
    float _1819 = _1811 ? as_type<float>(_1745) : _168;
    bool _1821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(0.5);
    bool _1829 = _1825 || _1827;
    float _1831 = 1.0 / _1815;
    float _1833 = float(_1689);
    float _1835 = 0.0;
    float _1837 = _1797;
    if (!_1667)
    {
        _1835 = _1669;
    }
    float _1839 = _1835;
    float _1841 = _1839;
    if (_1667)
    {
        float _1843 = _1765 ? as_type<float>(_1789) : _1669;
        _1841 = _1843;
    }
    float _1845 = _1841;
    float _1847 = 1.0 / _1833;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1855 = _1853 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1859 = _1857 != 0;
    float _1861 = _1851 * _1717;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1863;
    float _1867 = _1855 * _1791;
    float _1869 = 1.0 / _1817;
    float _1871 = _1859 ? as_type<float>(_1755) : _168;
    float _1873 = _1865 * _1737;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1881 = _210 + _1879;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1885 = _1883 != 0;
    float _1887 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1889 = _1877 * _1831;
    float _1891 = _124 * _1847;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _1901 = fma(_1861, _1881, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1905 = _1895 * _1807;
    float _1907 = _1899 * _1753;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1911 = _210 + _1909;
    int _1913 = as_type<int>(_1869) + (-2);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _210 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1921 = _210 + _1919;
    float _1923 = fma(_1907, _1911, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1925 = trunc(_1891);
    int _1927 = int(_1925);
    float _1929 = fma(_1867, _1917, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1933 = _210 + _1931;
    bool _1935 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _1937 = isnan(_210);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = fma(_1873, _1921, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1951 = _1949 != 0;
    float _1953 = fma(_1905, _1933, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1957 = _1955 != 0;
    float _1959 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1963 = _1961 != 0;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1967 = _210 + _1965;
    bool _1969 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1971 = isnan(_210);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1977 = _1973 || _1975;
    int _1979 = _1977 ? 1065353216 : 0;
    float _1981 = -_1945;
    float _1983 = _1981 + 1.0;
    float _1985 = fma(_1959, _1805, -0.5);
    float _1987 = fma(_1889, _1967, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _1989 = ~_1677;
    int _1991 = _1989 + 1;
    float _1993 = as_type<float>(_1979) * _1983;
    float _1995 = float(uint(_1927));
    float _1997 = -as_type<float>(_1979);
    float _1999 = _1997 + 1.0;
    bool _2001 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2003 = isnan(_210);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    int _2013 = _1979;
    float _2015 = _1987;
    if (_1885)
    {
        float _2017 = -_1669;
        float _2019 = _2017 + 1.0;
        _2013 = as_type<int>(_2019);
    }
    int _2021 = _2013;
    float _2023 = 0.0;
    if (!_1885)
    {
        _2023 = _1669;
    }
    float _2025 = _2023;
    float _2027 = as_type<float>(_1913) * _1995;
    bool _2029 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2031 = isnan(_210);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = -_2011;
    float _2043 = _2041 + 1.0;
    float _2045 = _2025;
    if (_1885)
    {
        float _2047 = _1685 ? as_type<float>(_2021) : _1669;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2053 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2055 = isnan(_210);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = -_2039;
    float _2067 = _2065 + 1.0;
    float _2069 = _2039 * _1999;
    bool _2071 = _906 != 0.0;
    bool _2073 = isnan(_906);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.0);
    bool _2079 = _2075 || _2077;
    float _2081 = _2011 * _2067;
    bool _2083 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2085 = isnan(_210);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = trunc(_2027);
    float _2097 = precise::max(_2095, 0.0);
    uint _2100 = uint(_2097);
    float _2102 = in.m_71.x;
    float _2104 = in.m_71.y;
    float _2106 = in.m_71.z;
    float _2108 = _2063 * _2043;
    float _2110 = -_2063;
    float _2112 = _2110 + 1.0;
    bool _2114 = _904 == 0.0;
    bool _2116 = !_2079;
    bool _2118 = _2114 && _2116;
    float _2120 = _2093 * _2112;
    bool _2122 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2124 = isnan(_210);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = -_2093;
    float _2136 = _2134 + 1.0;
    float _2138 = float(_1677);
    float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _2142 = _908 == 0.0;
    bool _2144 = _2142 && _2118;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2148 = _2132 * _2136;
    float _2150 = _124 * _2138;
    int _2152 = _1991 * int(_2100);
    int _2154 = _2152 + _1927;
    float _2156 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2146);
    float _2158 = _2051 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2160 = _1901 * _2148;
    float _2162 = -_2132;
    float _2164 = _2162 + 1.0;
    float _2166 = float(uint(_2154));
    float _2168 = _2150 * _170;
    float _2170 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1775);
    float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2174 = _2164;
    float _2176 = as_type<float>(_2100);
    float _2178 = _2172;
    if (_1951)
    {
        float _2180 = -_1669;
        float _2182 = _2180 + 1.0;
        _1779 = as_type<int>(_2182);
    }
    int _2184 = _1779;
    float _2186 = as_type<float>(_1913) * _2166;
    float _2188 = fma(_2158, _1819, -0.5);
    float _2190 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2156);
    float _2192 = fma(_2164, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2160);
    if (_2144)
    {
        _2174 = _2102;
    }
    float _2194 = _2174;
    float _2196 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2198 = trunc(_2186);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    float _2204 = _2194;
    if (_1951)
    {
        float _2206 = _1685 ? as_type<float>(_2184) : _1669;
        _1733 = _2206;
    }
    float _2208 = _1733;
    float _2210 = -_2170;
    float _2212 = fma(_2190, _2188, _2210);
    float _2214 = _424 * _426;
    int _2216 = ~_1677;
    int _2218 = _2216 + 1;
    float _2220 = fma(_2196, _1773, -0.5);
    if (_2144)
    {
        _496 = _2194;
    }
    float _2222 = _496;
    float _2224 = fma(_1929, _2120, _2192);
    float _2226 = _2222;
    if (!_2144)
    {
        _2204 = _2102;
    }
    float _2228 = _2204;
    float _2230 = floor(_2214);
    float _2232 = float(_1927);
    float _2234 = fma(_1947, _2108, _2224);
    bool _2236 = _428 != 2;
    float _2238 = _2228;
    if (!_2144)
    {
        float _2240 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2228);
        _2226 = _2240;
    }
    float _2242 = _2226;
    bool _2244 = _2232 >= _2138;
    bool _2246 = isnan(_2232);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(_2138);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    int _2256 = int(_2100) + int(_2202);
    float _2258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2260 = as_type<float>(_2202);
    if (_2144)
    {
        _2176 = _2104;
    }
    float _2262 = _2176;
    float _2264 = _2262;
    if (_2144)
    {
        _2260 = _2106;
    }
    float _2266 = _2260;
    int _2268 = _2218 * _2256;
    int _2270 = _2268 + _1927;
    float _2272 = _2266;
    if (_2144)
    {
        _498 = _2262;
    }
    float _2274 = _498;
    float _2276 = _2274;
    if (!_2144)
    {
        _2264 = _2104;
    }
    float _2278 = _2264;
    float _2280 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2282 = uint(_2270) >= uint(_1677);
    float _2284 = trunc(_2254);
    int _2286 = int(_2284);
    if (_2144)
    {
        _2178 = _2266;
    }
    float _2288 = _2178;
    float _2290 = fma(_2280, _1845, -0.5);
    bool _2292 = !_2282;
    int _2294 = _2292 ? 0 : (-1);
    float _2296 = -_2230;
    float _2298 = _2214 + _2296;
    float _2300 = _2288;
    if (!_2144)
    {
        _2272 = _2106;
    }
    float _2302 = _2272;
    float _2304 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _2306 = ~_2256;
    int _2308 = _2306 + _2294;
    int _2310 = _2308 + 1;
    float _2312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2314 = _1677 == 0;
    float _2316 = _2138 * _2298;
    int _2318 = abs(_678);
    int _2320 = _1677 * _2310;
    int _2322 = _2320 + _1927;
    bool _2324 = !_1957;
    int _2326 = _2324 ? 0 : 1;
    float _2328 = fma(_2304, _2208, -0.5);
    float _2330 = trunc(_2316);
    int _2332 = int(_2330);
    int _2334 = ~_2286;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    if (!_2144)
    {
        float _2340 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2278);
        _2276 = _2340;
    }
    float _2342 = _2276;
    bool _2344 = !_2314;
    int _2346 = _2344 ? _2322 : (-1);
    if (!_2144)
    {
        float _2348 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2302);
        _2300 = _2348;
    }
    float _2350 = _2300;
    bool _2352 = _430 != 1;
    int _2354 = abs(_2326);
    int _2356 = _2346 * _2338;
    int _2358 = _1677 + (-1);
    float _2360 = trunc(_2168);
    int _2362 = int(_2360);
    float _2364 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2366 = _422 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2368 = _2286 * _2358;
    int _2370 = _2368 + _2356;
    float _2372 = fma(_2364, _2049, -0.5);
    int _2374 = abs(_732);
    int _2376 = _2332 * _2354;
    int _2378 = _2376 + _1927;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2382 = _2370 * _2318;
    int _2384 = abs(_696);
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2388 = exp2(_1683);
    float _2390 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2386);
    float _2392 = _432 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2396 = _2362 * _2384;
    int _2398 = _2396 + _2382;
    float _2400 = -_2380;
    float _2402 = fma(_2392, 2.0, _2400);
    int _2404 = abs(_738);
    float _2406 = fma(_1987, _2081, _2234);
    int _2408 = _2378 * _2374;
    int _2410 = _2408 + _2398;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2414 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2394);
    float _2416 = _434 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2418 = -_2412;
    float _2420 = fma(_2366, 2.0, _2418);
    float _2422 = in.m_73.x;
    float _2424 = in.m_73.y;
    float _2426 = in.m_73.z;
    float _2428 = in.m_73.w;
    int _2430 = _2332 * _2404;
    int _2432 = _2430 + _2410;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2436 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2434);
    float _2440 = float(uint(_2432));
    float _2442 = fma(_2416, -2.0, _2436);
    int _2444 = ~_1677;
    int _2446 = _2444 + 1;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2452 = as_type<float>(_1913) * _2440;
    float _2454 = _2440;
    float _2456 = _2448;
    if (_2236)
    {
        _2015 = _422;
    }
    float _2458 = _2015;
    float _2460 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2448);
    float _2462 = _2458;
    if (!_2236)
    {
        _2462 = _218;
    }
    float _2464 = _2462;
    float _2466 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2450);
    if (!_2352)
    {
        _2454 = _218;
    }
    float _2468 = _2454;
    float _2470 = trunc(_2452);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = _2468;
    if (_2352)
    {
        _288 = _212;
    }
    float _2478 = _288;
    float _2480 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2438);
    if (_2352)
    {
        _2476 = _212;
    }
    float _2482 = _2476;
    float _2484 = -_124;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2402);
    if (_2236)
    {
        _2456 = _212;
    }
    float _2488 = _2456;
    float _2490 = _2422 * _2278;
    float _2492 = _2426 * _2228;
    float _2494 = _2424 * _2302;
    float _2496 = _2488;
    if (!_2236)
    {
        _2496 = _422;
    }
    float _2498 = _2496;
    float _2500 = -_2490;
    float _2502 = fma(_2424, _2228, _2500);
    float _2504 = -_2492;
    float _2506 = fma(_2422, _2302, _2504);
    float _2508 = -_2494;
    float _2510 = fma(_2426, _2278, _2508);
    float _2512 = fma(_1953, _2069, _2406);
    if (!_2352)
    {
        _2238 = _212;
    }
    float _2514 = _2238;
    float _2516 = _2506 * _2428;
    float _2518 = _2514;
    if (_2352)
    {
        _276 = _422;
    }
    float _2520 = _276;
    float _2522 = _2510 * _2428;
    if (_2352)
    {
        _2518 = _422;
    }
    float _2524 = _2518;
    float _2526 = _2502 * _2428;
    float _2528 = -_124;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2420);
    int _2532 = _2446 * int(_2474);
    int _2534 = _2532 + _2432;
    float _2536 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2390);
    float _2538 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2442);
    float _2540 = fma(_2480, _2290, _2530);
    float _2542 = fma(_2536, _2328, _2486);
    float _2544 = float(uint(_2534));
    float _2546 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2414);
    float _2548 = fma(_1923, _1993, _2512);
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2552 = as_type<float>(_1913) * _2544;
    float _2554 = -_2538;
    float _2556 = fma(_2546, _2220, _2554);
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2560 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2562 = float(uint(_2378));
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2566 = trunc(_2552);
    float _2568 = precise::max(_2566, 0.0);
    uint _2570 = uint(_2568);
    float _2572 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2558);
    float _2574 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2576 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2578 = ~_1677;
    int _2580 = _2578 + 1;
    float _2582 = -_2550;
    float _2584 = fma(_2574, 2.0, _2582);
    float _2586 = _2556 + 0.5;
    float _2588 = fma(_1945, (*spvDescriptorSet0.vp_c9)._m0[137].x, _2548);
    int _2590 = ~_1677;
    int _2592 = _2590 + 1;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2596 = _2588 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2600 = int(_2474) + int(_2570);
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2604 = _2542 + 0.5;
    float _2606 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2598);
    float _2608 = -_2594;
    float _2610 = fma(_2564, 2.0, _2608);
    float _2612 = fma(_2560, -2.0, _2602);
    float _2614 = as_type<float>(_1913) * _2562;
    int _2616 = _2580 * _2600;
    int _2618 = _2616 + _2432;
    out.m_75.x = _2604;
    out.m_75.y = _2586;
    float _2620 = -_124;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2610);
    float _2624 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2466);
    float _2626 = trunc(_2614);
    float _2628 = precise::max(_2626, 0.0);
    uint _2630 = uint(_2628);
    bool _2632 = uint(_2618) >= uint(_1677);
    float _2634 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2606);
    float _2636 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2638 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2572);
    float _2640 = -_124;
    float _2642 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2584);
    bool _2644 = !_2632;
    int _2646 = _2644 ? 0 : (-1);
    float _2648 = fma(_2634, _1803, _2622);
    float _2650 = fma(_2576, -2.0, _2636);
    float _2652 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2460);
    int _2654 = ~_2600;
    int _2656 = _2654 + _2646;
    int _2658 = _2656 + 1;
    float _2660 = _2540 + 0.5;
    float _2662 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2650);
    float _2664 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2612);
    float _2666 = fma(_2652, _2372, _2642);
    int _2668 = _1677 * _2658;
    int _2670 = _2668 + _2432;
    float _2672 = _938 + _980;
    int _2674 = _2592 * int(_2630);
    int _2676 = _2674 + _2378;
    float _2678 = -_2664;
    float _2680 = fma(_2638, _1887, _2678);
    float _2682 = _2648 + 0.5;
    bool _2684 = !_2314;
    int _2686 = _2684 ? _2670 : (-1);
    float _2688 = -_2662;
    float _2690 = fma(_2624, _1985, _2688);
    float _2692 = float(uint(_2676));
    float _2694 = _2680 + 0.5;
    int _2696 = _2686 >> 31;
    float _2698 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2700 = _2686 & 3;
    bool _2702 = _2700 != 0;
    float _2704 = as_type<float>(_1913) * _2692;
    int _2706 = _2696 & 3;
    float _2708 = _2212 + 0.5;
    int _2710 = _2686 & 3;
    float _2712 = trunc(_2704);
    float _2714 = precise::max(_2712, 0.0);
    uint _2716 = uint(_2714);
    int _2718 = _2686 + _2706;
    float _2720 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2698);
    float _2722 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_77.x = _2660;
    out.m_77.y = _2708;
    out.m_77.z = _2682;
    out.m_77.w = _2694;
    int _2724 = _2718 >> 2;
    float _2726 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2720);
    float _2728 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2722);
    bool _2730 = uint(_2710) > 1u;
    float _2732 = _1028 * _2516;
    int _2734 = _2724 << 4;
    int _2736 = _2734 + 512;
    float _2738 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2740 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2728);
    float _2742 = _1026 * _2516;
    float _2744 = 1.0 / _2738;
    float _2746 = _2740 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2748 = _2702 ? 0 : 1;
    uint _2750 = uint(int(uint(_2736) >> uint(2)));
    uint _2752 = uint(int(uint(int(_2750)) >> uint(2)));
    int _2754 = int(_2750) & 3;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[int(_2752)][_2754];
    int _2758 = int(_2750) + 1;
    uint _2760 = uint(int(uint(_2758) >> uint(2)));
    int _2762 = _2758 & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = ~_1677;
    int _2768 = _2766 + 1;
    float _2770 = _2746 + _2738;
    int _2772 = ~_2748;
    int _2774 = _2772 + 1;
    int _2776 = _2774 + 1;
    float _2778 = _2666 + 0.5;
    float _2780 = _2690 + 0.5;
    int _2782 = _2776;
    if (!_2730)
    {
        int _2784 = ~_2748;
        int _2786 = _2784 + 1;
        _2782 = _2786;
    }
    int _2788 = _2782;
    int _2790 = _2736 + 8;
    uint _2792 = uint(int(uint(_2790) >> uint(2)));
    uint _2794 = uint(int(uint(int(_2792)) >> uint(2)));
    int _2796 = int(_2792) & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    int _2800 = int(_2792) + 1;
    uint _2802 = uint(int(uint(_2800) >> uint(2)));
    int _2804 = _2800 & 3;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[int(_2802)][_2804];
    bool _2808 = _2710 != 3;
    float _2810 = fma(_1036, _2522, _2742);
    int _2812 = int(_2630) + int(_2716);
    float _2814 = fma(_1034, _2522, _2732);
    float _2816 = _2770 * _2744;
    float _2818 = _2816 * 0.5;
    float _2820 = -_2516;
    float _2822 = _998 * _2820;
    bool _2824 = uint(_2710) >= 2u;
    int _2826 = _2768 * _2812;
    int _2828 = _2826 + _2378;
    float _2830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2832 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2830);
    float _2834 = fma(_1030, _2522, _2822);
    int _2836 = _2824 ? 0 : 1;
    float _2838 = -_2424;
    float _2840 = _998 * _2838;
    float _2842 = _1026 * _2424;
    float _2844 = _1028 * _2424;
    float _2846 = 1.0 / _2832;
    bool _2848 = !_2702;
    int _2850 = _2848 ? 0 : 1;
    out.m_79.x = _2778;
    out.m_79.y = _2780;
    bool _2852 = uint(_2828) >= uint(_1677);
    float _2854 = fma(_1036, _2422, _2842);
    int _2856 = ~_2836;
    int _2858 = _2856 + 1;
    int _2860 = _2858 + 1;
    float _2862 = fma(_1034, _2422, _2844);
    int _2864 = _2860;
    if (_2808)
    {
        int _2866 = ~_2836;
        int _2868 = _2866 + 1;
        _2864 = _2868;
    }
    int _2870 = _2864;
    out.m_81.w = _2596;
    int _2872 = abs(_2850);
    float _2874 = -_2342;
    float _2876 = _998 * _2874;
    bool _2878 = !_2852;
    int _2880 = _2878 ? 0 : (-1);
    float _2882 = fma(_1030, _2422, _2840);
    int _2884 = abs(_2788);
    float _2886 = _1026 * _2342;
    int _2888 = abs(_2870);
    float _2890 = _1028 * _2342;
    int _2892 = ~_2884;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    float _2898 = fma(_1030, _2242, _2876);
    bool _2900 = _2710 != 3;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2904 = _2846 * _2902;
    int _2906 = ~_2812;
    int _2908 = _2906 + _2880;
    int _2910 = _2908 + 1;
    float _2912 = fma(_1036, _2242, _2886);
    int _2914 = ~_2872;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    float _2920 = abs(_2904);
    float _2922 = log2(_2920);
    int _2924 = _2896 * as_type<int>(_2764);
    bool _2926 = !_1963;
    int _2928 = _2926 ? 0 : 1;
    int _2930 = _1677 * _2910;
    int _2932 = _2930 + _2378;
    int _2934 = ~_2888;
    int _2936 = _2934 + 1;
    int _2938 = _2936 + 1;
    int _2940 = _2918 * as_type<int>(_2756);
    int _2942 = _2940 + _2924;
    bool _2944 = !_2900;
    int _2946 = _2944 ? 0 : (-1);
    float _2948 = fma(_1040, _2526, _2810);
    int _2950 = abs(_2928);
    int _2952 = _2938 * as_type<int>(_2798);
    int _2954 = _2952 + _2942;
    int _2956 = abs(_2946);
    float _2958 = fma(_1050, _2526, _2834);
    float _2960 = fma(_1042, _2526, _2814);
    float _2962 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2964 = ~_2956;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2972 = ~_2950;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2962);
    float _2980 = fma(_1050, _2426, _2882);
    int _2982 = _2968 * as_type<int>(_2806);
    int _2984 = _2982 + _2954;
    bool _2986 = !_2314;
    int _2988 = _2986 ? _2932 : (-1);
    float _2990 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2978);
    float _2992 = exp2(_2970);
    int _2994 = _2984 * _2976;
    float _2996 = _1618 + _1552;
    float _2998 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2990);
    float _3000 = fma(_1040, _2426, _2854);
    int _3002 = _2988 * _2950;
    int _3004 = _3002 + _2994;
    float _3006 = _1552 * 0.5;
    float _3008 = _2998 + _1552;
    out.m_83.x = _2958;
    out.m_83.y = _2948;
    out.m_83.z = _2960;
    float _3010 = fma(_1042, _2426, _2862);
    float _3012 = float(_3004);
    float _3014 = fma(_1034, _2242, _2890);
    out.gl_Position.x = _1618;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _2998;
    out.gl_Position.w = _1552;
    out.m_85.x = _2980;
    out.m_85.y = _3000;
    out.m_85.z = _3010;
    float _3016 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3018 = precise::clamp(_3016, 0.0, 1.0);
    float _3020 = _3008 * 0.5;
    float _3022 = _2996 * 0.5;
    float _3024 = fma(_1620, -0.5, _3006);
    out.m_87.y = _3012;
    float _3026 = fma(_3018, -2.0, 3.0);
    float _3028 = _3018 * _3018;
    out.m_89.x = _3022;
    out.m_89.y = _3024;
    out.m_89.z = _3020;
    out.m_89.w = _1552;
    if (_1829)
    {
        _1699 = 1.0;
    }
    float _3030 = _1699;
    float _3032 = _3028 * _3026;
    float _3034 = _3030;
    if (_1829)
    {
        _1701 = 1.0;
    }
    float _3036 = _1701;
    float _3038 = -_3032;
    float _3040 = _3038 + 1.0;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3032);
    bool _3044 = _2904 <= 8000.0;
    bool _3046 = isnan(_2904);
    bool _3048 = _3044 || _3046;
    bool _3050 = isnan(8000.0);
    bool _3052 = _3048 || _3050;
    float _3054 = float(_3052);
    float _3056 = _3036;
    float _3058 = _3042;
    if (!_1829)
    {
        float _3060 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3062;
        float _3066 = _3060 * 0.15915493667125701904296875;
        float _3068 = _3066 * 6.283185482025146484375;
        float _3070 = cos(_3068);
        float _3072 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3074 = _3072 * 0.15915493667125701904296875;
        float _3076 = _3066 * 6.283185482025146484375;
        float _3078 = sin(_3076);
        float _3080 = 1.0 / _3070;
        float _3082 = _3074 * 6.283185482025146484375;
        float _3084 = cos(_3082);
        float _3086 = _3078 * _3080;
        float _3088 = _3074 * 6.283185482025146484375;
        float _3090 = sin(_3088);
        float _3092 = _3084 * _3086;
        float _3094 = 1.0 / _3064;
        float _3096 = 1.0 / _3092;
        float _3098 = _3090 * _3096;
        float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3102 = fma(_2904, _3098, _3100);
        float _3104 = _3102 * _3094;
        float _3106 = precise::clamp(_3104, 0.0, 1.0);
        _3056 = _3106;
        _1362 = _3064;
    }
    float _3108 = _3056;
    float _3110 = _1362;
    float _3112 = _3110;
    if (!_1829)
    {
        float _3114 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3116 = _3114 * 0.15915493667125701904296875;
        float _3118 = _3116 * 6.283185482025146484375;
        float _3120 = cos(_3118);
        float _3122 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3124 = _3122 * 0.15915493667125701904296875;
        float _3126 = _3116 * 6.283185482025146484375;
        float _3128 = sin(_3126);
        float _3130 = 1.0 / _3120;
        float _3132 = _3124 * 6.283185482025146484375;
        float _3134 = cos(_3132);
        float _3136 = _3128 * _3130;
        float _3138 = _3124 * 6.283185482025146484375;
        float _3140 = sin(_3138);
        float _3142 = _3134 * _3136;
        float _3144 = 1.0 / _3142;
        float _3146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3148 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3146;
        float _3150 = 1.0 / _3148;
        float _3152 = _3140 * _3144;
        float _3154 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3156 = fma(_2904, _3152, _3154);
        float _3158 = _3156 * _3150;
        float _3160 = precise::clamp(_3158, 0.0, 1.0);
        float _3162 = -_3160;
        float _3164 = _3162 + 1.0;
        _3034 = _3164;
        _3112 = _3152;
    }
    float _3166 = _3034;
    float _3168 = _3112;
    float _3170 = _3054 * _3042;
    float _3172 = -_2388;
    float _3174 = _3172 + 1.0;
    float _3176 = -_1636;
    float _3178 = _3176 + 1.0;
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3182 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3184 = fma(_1050, _2350, _2898);
    float _3186 = fma(_1040, _2350, _2912);
    float _3188 = _3178 * _3180;
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = _3182 * _1638;
    float _3194 = -_3182;
    float _3196 = _3194 + 1.0;
    float _3198 = fma(_1042, _2350, _3014);
    float _3200 = -_3190;
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3204 = _1653 * _3192;
    float _3206 = _1663 * _3192;
    float _3208 = _1653 * _3196;
    float _3210 = _3202 * _1797;
    float _3212 = fma(_1659, _3204, _1647);
    float _3214 = fma(_1661, _3204, _1649);
    float _3216 = fma(_1653, _3206, _1651);
    float _3218 = _3210 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _3184;
    out.m_91.y = _3186;
    out.m_91.z = _3198;
    bool _3220 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3222 = isnan(_1334);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3228 = _3224 || _3226;
    float _3230 = _3108 * _3166;
    out.m_93.x = _3218;
    float _3232 = _3230 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3212;
    out.m_95.y = _3214;
    out.m_95.z = _3216;
    out.m_95.w = _3208;
    float _3234 = _3192;
    float _3236 = _3168;
    float _3238 = _3210;
    float _3240 = _3204;
    if (!_3228)
    {
        _3058 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3242 = _3058;
    float _3244 = _3242;
    float _3246 = _3242;
    if (!_3228)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3248 = _3234;
    float _3250 = _3248;
    float _3252 = _3248;
    if (!_3228)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3254 = _3236;
    float _3256 = _3254;
    float _3258 = _3254;
    if (!_3228)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3260 = _1837;
    float _3262 = _3260;
    float _3264 = _3260;
    if (!_3228)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3266 = _3238;
    float _3268 = _3266;
    float _3270 = _3266;
    if (!_3228)
    {
        _3240 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3272 = _3240;
    bool _3274 = !_3228;
    float _3276 = _3272;
    float _3278 = _3272;
    if (!_3274)
    {
        bool _3280 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3282 = isnan(_1334);
        bool _3284 = _3280 || _3282;
        bool _3286 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3288 = _3284 || _3286;
        if (!_3288)
        {
            float _3290 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3292 = _1334 + _3290;
            float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3296 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3294;
            float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3302 = 1.0 / _3296;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3320 = _3292 * _3302;
            float _3322 = precise::clamp(_3320, 0.0, 1.0);
            float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3328 = fma(_3322, _3300, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3330 = fma(_3322, _3326, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3332 = fma(_3322, _3306, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3334 = fma(_3322, _3310, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3336 = fma(_3322, _3314, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3338 = fma(_3322, _3318, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3252 = _3332;
            _3270 = _3336;
            _3246 = _3328;
            _3264 = _3334;
            _3258 = _3330;
            _3278 = _3338;
            _3340 = true;
        }
        else
        {
            bool _3342 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3344 = isnan(_1334);
            bool _3346 = _3342 || _3344;
            bool _3348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3350 = _3346 || _3348;
            if (!_3350)
            {
                _3244 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3352 = _3244;
            _3246 = _3352;
            if (!_3350)
            {
                _3250 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3354 = _3250;
            _3252 = _3354;
            if (!_3350)
            {
                _3256 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3356 = _3256;
            _3258 = _3356;
            if (!_3350)
            {
                _3262 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3358 = _3262;
            _3264 = _3358;
            if (!_3350)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3360 = _3268;
            _3270 = _3360;
            if (!_3350)
            {
                _3276 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3362 = _3276;
            bool _3364 = !_3350;
            _3278 = _3362;
            if (!_3364)
            {
                bool _3366 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3368 = isnan(_1334);
                bool _3370 = _3366 || _3368;
                bool _3372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3374 = _3370 || _3372;
                if (!_3374)
                {
                    float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3378 = _1334 + _3376;
                    float _3380 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3382 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3380;
                    float _3384 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3386 = _3384 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3388 = 1.0 / _3382;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3398 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3400 = _3398 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3404 = _3402 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3406 = _3378 * _3388;
                    float _3408 = precise::clamp(_3406, 0.0, 1.0);
                    float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3412 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3414 = fma(_3408, _3386, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3416 = fma(_3408, _3412, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3418 = fma(_3408, _3392, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3420 = fma(_3408, _3396, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3422 = fma(_3408, _3400, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3424 = fma(_3408, _3404, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3252 = _3418;
                    _3270 = _3422;
                    _3246 = _3414;
                    _3264 = _3420;
                    _3258 = _3416;
                    _3278 = _3424;
                    _3340 = true;
                }
                else
                {
                    _3252 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3246 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3264 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3258 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3278 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3340 = false;
    float _3426 = _3252;
    float _3428 = _3270;
    float _3430 = _3246;
    float _3432 = _3264;
    float _3434 = _3258;
    float _3436 = _3278;
    float _3438 = fma(_3186, -0.5, 0.5);
    float _3440 = precise::clamp(_3438, 0.0, 1.0);
    float _3442 = -_3426;
    float _3444 = _3442 + _3428;
    float _3446 = _3232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3448 = -_3430;
    float _3450 = _3448 + _3432;
    out.m_97.x = 0.0;
    float _3452 = fma(_3440, _3444, _3426);
    float _3454 = fma(_3440, _3450, _3430);
    out.m_53.x = _3446;
    float _3456 = -_3434;
    float _3458 = _3456 + _3436;
    float _3460 = _3452 * 0.586610972881317138671875;
    bool _3462 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3464 = fma(_3440, _3458, _3434);
    float _3466 = fma(_3454, 0.298911988735198974609375, _3460);
    bool _3468 = _3108 > 0.0;
    bool _3470 = isnan(_3108);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan(0.0);
    bool _3476 = _3472 || _3474;
    float _3478 = fma(_3464, 0.114477999508380889892578125, _3466);
    bool _3480 = _3166 <= 0.0;
    bool _3482 = !_3476;
    bool _3484 = _3480 || _3482;
    float _3486 = -_3478;
    float _3488 = _3454 + _3486;
    float _3490 = -_3478;
    float _3492 = _3452 + _3490;
    float _3494 = -_3478;
    float _3496 = _3464 + _3494;
    float _3498 = fma(_3488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    float _3500 = fma(_3492, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    float _3502 = fma(_3496, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    bool _3504 = !_3462;
    if (!_3504)
    {
        float _3506 = -_1298;
        float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3510 = -_1300;
        float _3512 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3514 = -_1302;
        float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3518 = _3508 * _3508;
        float _3520 = fma(_3512, _3512, _3518);
        float _3522 = fma(_3516, _3516, _3520);
        float _3524 = sqrt(_3522);
        float _3526 = rsqrt(_3522);
        float _3528 = -_3524;
        float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3532 = _3530 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3534 = precise::clamp(_3532, 0.0, 1.0);
        float _3536 = _3512 * _3526;
        float _3538 = _3508 * _3526;
        float _3540 = abs(_3534);
        float _3542 = log2(_3540);
        float _3544 = _3516 * _3526;
        float _3546 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3548 = _3186 * _3538;
        float _3550 = -_3538;
        float _3552 = -_3546;
        float _3554 = fma(_3550, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3552);
        float _3556 = fma(_3184, _3536, _3548);
        float _3558 = -_3544;
        float _3560 = fma(_3558, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3554);
        float _3562 = fma(_3198, _3544, _3556);
        float _3564 = precise::clamp(_3562, 0.0, 1.0);
        float _3566 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3568 = _3560 + _3566;
        float _3570 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3572 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = exp2(_3570);
        float _3578 = _3576 * _3574;
        float _3580 = _3564 * _3578;
        float _3582 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3584 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3586 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3582;
        out.m_97.y = _3584;
        out.m_97.z = _3586;
    }
    out.m_99.x = _3498;
    out.m_99.y = _3500;
    out.m_99.z = _3502;
    if (!_3484)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3588 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3588;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3340 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = in.m_48.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3655 = as_type<float>(_140);
        out.gl_Position.z = _3655;
    }
    if (!_128)
    {
        return out;
    }
    bool _144 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_115);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_120);
    bool _156 = _124 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _132;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_166);
        out.gl_Position.z = _3710;
    }
    if (_160)
    {
        return out;
    }
    float _168 = in.m_55.y;
    float _170 = 1.0 / _154;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = _124 * _170;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.y = _168;
    bool _190 = !_172;
    float _192 = _186;
    if (!_190)
    {
        float _194 = in.m_59.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _192 = _208;
    }
    float _210 = _192;
    float _212 = in.m_59.y;
    float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _216 = log2(_214);
    float _218 = in.m_59.z;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _222 = _220 != 0;
    float _224 = in.m_46.x;
    float _226 = in.m_46.y;
    float _228 = in.m_46.z;
    float _230 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _232 = -_230;
    float _234 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _232);
    float _236 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _238 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _240 = 0.0;
    float _242 = _228;
    float _244 = _224;
    if (_222)
    {
        float _246 = in.m_59.x;
        _240 = _246;
    }
    float _248 = _240;
    float _250 = _124 * _216;
    float _252 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _238);
    float _254 = -_236;
    float _256 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _254);
    bool _258 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _266 = _262 || _264;
    float _268 = _212 * 2.0;
    float _270 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _252);
    float _272 = exp2(_250);
    int _274 = 0;
    float _276 = _212;
    if (_222)
    {
        _274 = 0;
    }
    int _278 = _274;
    float _280 = _218 * 2.0;
    float _282 = _212 + _218;
    int _284 = 0;
    int _286 = _278;
    float _288 = _218;
    if (_222)
    {
        _284 = 0;
    }
    int _290 = _284;
    float _292 = 0.0;
    int _294 = _290;
    if (_222)
    {
        _292 = 1.0;
    }
    float _296 = _292;
    float _298 = _282 + (-1.0);
    float _300 = floor(_268);
    float _302 = 0.0;
    float _304 = _296;
    if (_222)
    {
        _302 = _212;
    }
    float _306 = _302;
    float _308 = floor(_280);
    float _310 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _312 = -_272;
    float _314 = _312 + 1.0;
    float _316 = 0.0;
    float _318 = _248;
    float _320 = _306;
    if (_222)
    {
        _316 = _248;
    }
    float _322 = _316;
    float _324 = -_310;
    float _326 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _324);
    float _328 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _330 = _300 > 0.0;
    bool _332 = _300 >= 0.0;
    bool _334 = isnan(_300);
    bool _336 = _332 || _334;
    bool _338 = isnan(0.0);
    bool _340 = _336 || _338;
    float _342 = _234 * _234;
    bool _344 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _346 = isnan(1.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _352 = _348 || _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _356 = 1.0 + _354;
    float _358 = _266 ? _314 : 0.0;
    float _360 = fma(_256, _256, _342);
    bool _362 = _308 > 0.0;
    float _364 = 1.0 / _356;
    bool _366 = _308 >= 0.0;
    bool _368 = isnan(_308);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = fma(_326, _326, _360);
    float _378 = _226 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _226 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = 0.0;
    float _384 = _322;
    int _386 = as_type<int>(_328);
    if (_222)
    {
        _382 = _322;
    }
    float _388 = _382;
    float _390 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _392 = rsqrt(_376);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[4].z, _390);
    float _398 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    float _400 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _402 = _388;
    if (!_222)
    {
        float _404 = in.m_59.x;
        float _406 = _212 * 3.1415927410125732421875;
        float _408 = _406 * 0.15915493667125701904296875;
        float _410 = _408 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _404 * 3.1415927410125732421875;
        float _416 = _414 * 0.15915493667125701904296875;
        float _418 = _416 * 6.283185482025146484375;
        float _420 = sin(_418);
        _318 = _404;
        _402 = _212;
        _304 = 1.2345600128173828125;
        _294 = 2;
        _286 = 1;
        _384 = _420;
        _320 = _412;
    }
    float _422 = _318;
    float _424 = _402;
    float _426 = _304;
    int _428 = _294;
    int _430 = _286;
    float _432 = _384;
    float _434 = _320;
    float _436 = _422 * 2.0;
    float _438 = _358 * _364;
    float _440 = _398 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _442 = floor(_436);
    int _444 = _340 ? 0 : 1;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _400 + _446;
    int _450 = _374 ? 0 : 1;
    float _452 = -_440;
    float _454 = _452 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _466 = _464 != 0;
    int _468 = ~_444;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = abs(_448);
    float _476 = abs(_454);
    float _478 = precise::max(_474, _476);
    bool _480 = !_458;
    int _482 = _480 ? 0 : 1;
    int _484 = ~_450;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    int _490 = _472;
    int _492 = _488;
    float _494 = _448;
    float _496 = _426;
    float _498 = _424;
    if (!_330)
    {
        int _500 = ~_444;
        int _502 = _500 + 1;
        _490 = _502;
    }
    int _504 = _490;
    if (!_362)
    {
        int _506 = ~_450;
        int _508 = _506 + 1;
        _492 = _508;
    }
    int _510 = _492;
    float _512 = rsqrt(_270);
    bool _514 = _478 >= 16.0;
    float _516 = _256 * _392;
    int _518 = abs(_482);
    float _520 = _422 + _218;
    bool _522 = _442 > 0.0;
    float _524 = _234 * _392;
    bool _526 = _442 >= 0.0;
    bool _528 = isnan(_442);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = _326 * _392;
    bool _538 = !_466;
    int _540 = _538 ? 0 : 1;
    float _542 = _520 + (-1.0);
    float _544 = float(_510);
    float _546 = _212 + _422;
    int _548 = abs(_540);
    float _550 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _552 = _546 + (-1.0);
    float _554 = float(_518);
    if (_514)
    {
        float _556 = _448 * 0.0625;
        _494 = _556;
    }
    float _558 = _494;
    float _560 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _562 = float(_504);
    float _564 = _554 * _544;
    float _566 = float(_548);
    float _568 = _512 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _570 = !_462;
    int _572 = _570 ? 0 : 1;
    float _574 = _564 * (-2.0);
    int _576 = _534 ? 0 : 1;
    float _578 = _566 * _562;
    int _580 = abs(_572);
    float _582 = _524 * _524;
    int _584 = ~_576;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = fma(_560, _574, _560);
    int _592 = _588;
    if (!_522)
    {
        int _594 = ~_576;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = fma(_516, _516, _582);
    float _602 = float(_580);
    float _604 = _422 + (-0.5);
    float _606 = float(_598);
    float _608 = _454 * 0.0625;
    float _610 = abs(_558);
    bool _612 = _610 != 0.0;
    bool _614 = isnan(_610);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = fma(_536, _536, _600);
    bool _624 = !_352;
    float _626 = _624 ? _124 : _438;
    float _628 = _604 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _630 = _514 ? _608 : _454;
    float _632 = _602 * _606;
    float _634 = _568 * (-0.699999988079071044921875);
    float _636 = fma(_626, _590, _628);
    float _638 = abs(_630);
    bool _640 = _638 == 0.0;
    bool _642 = !_620;
    bool _644 = _640 && _642;
    float _646 = in.m_61.x;
    float _648 = in.m_61.y;
    float _650 = in.m_61.z;
    float _652 = _634 * 0.15915493667125701904296875;
    float _654 = _636 * 0.15915493667125701904296875;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _662 = _660 != 0;
    float _664 = _578 * (-2.0);
    float _666 = _632 * (-2.0);
    float _668 = abs(_630);
    bool _670 = _668 == 0.0;
    float _672 = _652 * 6.283185482025146484375;
    float _674 = cos(_672);
    bool _676 = !_662;
    int _678 = _676 ? 0 : 1;
    float _680 = fma(_550, _664, _550);
    float _682 = fma(_328, _666, _328);
    float _684 = _218 + (-0.5);
    bool _686 = _662;
    if (_644)
    {
        bool _688 = as_type<int>(_630) >= 0;
        _686 = _688;
    }
    bool _690 = _686;
    float _692 = _212 + (-0.5);
    bool _694 = !_658;
    int _696 = _694 ? 0 : 1;
    float _698 = _654 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = _684 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    if (_644)
    {
        int _706 = _690 ? 0 : 1078530011;
        _386 = _706;
    }
    int _708 = _386;
    int _710 = _708;
    if (_644)
    {
        int _712 = int(0x80000000) & as_type<int>(_558);
        int _714 = _708 | _712;
        _710 = _714;
    }
    int _716 = _710;
    float _718 = _654 * 6.283185482025146484375;
    float _720 = cos(_718);
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _728 = _726 != 0;
    bool _730 = !_724;
    int _732 = _730 ? 0 : 1;
    float _734 = rsqrt(_622);
    bool _736 = !_728;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(_626, _680, _702);
    float _742 = fma(_626, _682, _704);
    bool _744 = !_620;
    bool _746 = _744 && _670;
    int _748 = _724 ? (-1) : 0;
    int _750 = _716;
    float _752 = as_type<float>(_716);
    bool _754 = _690;
    if (!_746)
    {
        float _756 = abs(_558);
        bool _758 = _756 != as_type<float>(0x7f800000u /* inf */);
        bool _760 = isnan(_756);
        bool _762 = _758 || _760;
        bool _764 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _766 = _762 || _764;
        float _768 = abs(_630);
        bool _770 = _768 == as_type<float>(0x7f800000u /* inf */);
        float _772 = abs(_630);
        bool _774 = _772 == as_type<float>(0x7f800000u /* inf */);
        bool _776 = !_766;
        bool _778 = _774 && _776;
        _754 = _766;
        if (_778)
        {
            bool _780 = as_type<int>(_630) >= 0;
            _748 = _780 ? (-1) : 0;
        }
        int _782 = _748;
        if (_778)
        {
            _750 = 1075235812;
        }
        int _784 = _750;
        int _786 = _784;
        if (_778)
        {
            int _788 = ~_782;
            int _790 = (_788 != 0) ? _784 : 1061752795;
            _786 = _790;
        }
        int _792 = _786;
        float _794 = as_type<float>(_792);
        if (_778)
        {
            int _796 = int(0x80000000) & as_type<int>(_558);
            int _798 = _792 | _796;
            _794 = as_type<float>(_798);
        }
        float _800 = _794;
        bool _802 = !_766;
        bool _804 = _802 && _770;
        _752 = _800;
        if (!_804)
        {
            float _806 = abs(_558);
            float _808 = abs(_630);
            float _810 = precise::max(_806, _808);
            float _812 = abs(_558);
            float _814 = abs(_630);
            float _816 = precise::min(_812, _814);
            float _818 = 1.0 / _810;
            float _820 = abs(_558);
            float _822 = abs(_630);
            bool _824 = _820 > _822;
            bool _826 = as_type<int>(_630) >= 0;
            float _828 = _816 * _818;
            float _830 = abs(_558);
            float _832 = abs(_630);
            float _834 = _830 + _832;
            float _836 = _828 * _828;
            bool _838 = _834 > as_type<float>(0x7f800000u /* inf */);
            bool _840 = isnan(_834);
            bool _842 = _838 || _840;
            bool _844 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _846 = _842 || _844;
            float _848 = _836 + 11.33538818359375;
            float _850 = fma(_836, _848, 28.84246826171875);
            float _852 = fma(_836, _850, 19.6966705322265625);
            float _854 = fma(_836, -0.82336294651031494140625, -5.674867153167724609375);
            float _856 = fma(_836, _854, -6.565555095672607421875);
            float _858 = 1.0 / _852;
            float _860 = _836 * _856;
            float _862 = _828 * _860;
            float _864 = fma(_862, _858, _828);
            int _866 = as_type<int>(_558) & int(0x80000000);
            float _868 = _864;
            _752 = _834;
            _754 = _846;
            if (_824)
            {
                float _870 = -_864;
                float _872 = _870 + 1.57079637050628662109375;
                _868 = _872;
            }
            float _874 = _868;
            int _876 = as_type<int>(_874);
            if (!_826)
            {
                float _878 = -_874;
                float _880 = _878 + 3.1415927410125732421875;
                _876 = as_type<int>(_880);
            }
            int _882 = _876;
            if (!_846)
            {
                int _884 = _866 | _882;
                _752 = as_type<float>(_884);
            }
        }
    }
    float _886 = _752;
    bool _888 = _754;
    float _890 = -_886;
    float _892 = _742 + _890;
    float _894 = _740 * 0.15915493667125701904296875;
    float _896 = _226 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _892 * 0.15915493667125701904296875;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _902 = _900 != 0;
    float _904 = in.m_63.x;
    float _906 = in.m_63.y;
    float _908 = in.m_63.z;
    float _910 = _894 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _916 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _918 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _920 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _922 = _898 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _928 = fma(_926, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _930 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[5].z, _914);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[193].y;
    bool _934 = _888;
    if (!_902)
    {
        _242 = 0.0;
    }
    float _936 = _242;
    float _938 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _940 = _936;
    if (!_902)
    {
        _932 = 0.0;
    }
    float _942 = _932;
    float _944 = _898 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _942;
    if (!_902)
    {
        _244 = 0.0;
    }
    float _950 = _244;
    bool _952 = !_902;
    float _954 = _950;
    if (!_952)
    {
        float _956 = -_938;
        float _958 = _956 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _960 = -_400;
        float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _964 = _958 * _958;
        float _966 = fma(_962, _962, _964);
        float _968 = fma(_454, _454, _966);
        float _970 = rsqrt(_968);
        float _972 = _970 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _974 = _962 * _972;
        float _976 = _958 * _972;
        float _978 = _454 * _972;
        _948 = _976;
        _940 = _974;
        _954 = _978;
    }
    float _980 = _948;
    float _982 = _940;
    float _984 = _954;
    float _986 = _422 * 6.283185482025146484375;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    float _990 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _992 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _994 = fma(_124, 0.02999999932944774627685546875, _986);
    float _996 = _894 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = _988 * _990;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _908);
    float _1004 = _994 * 0.15915493667125701904296875;
    float _1006 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _1010 = _720 * _924;
    float _1012 = _720 * _946;
    float _1014 = _1002 * _1006;
    float _1016 = _1004 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _700 * _946;
    float _1022 = _1008 * _992;
    float _1024 = _700 * _924;
    float _1026 = _720 * _912;
    float _1028 = _700 * _912;
    float _1030 = _946 * _912;
    float _1032 = -_1010;
    float _1034 = fma(_998, _1020, _1032);
    float _1036 = fma(_998, _1012, _1024);
    float _1038 = -_1020;
    float _1040 = fma(_998, _1010, _1038);
    float _1042 = fma(_998, _1024, _1012);
    float _1044 = _1026 * _1022;
    float _1046 = -_1022;
    float _1048 = _998 * _1046;
    float _1050 = _924 * _912;
    float _1052 = _652 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = -_168;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1060 = fma(_1036, _1000, _1044);
    float _1062 = fma(_1030, _1000, _1048);
    float _1064 = _1028 * _1022;
    float _1066 = _1018 * _1058;
    float _1068 = fma(_1040, _1014, _1060);
    float _1070 = fma(_1050, _1014, _1062);
    float _1072 = fma(_1034, _1000, _1064);
    float _1074 = _928 * _1066;
    float _1076 = _938 + _1068;
    float _1078 = _400 + _1070;
    float _1080 = _516 * _734;
    float _1082 = _524 * _734;
    float _1084 = -_674;
    float _1086 = _1084 + 1.0;
    float _1088 = _536 * _734;
    float _1090 = fma(_516, _1074, _1078);
    float _1092 = fma(_1042, _1014, _1072);
    float _1094 = fma(_524, _1074, _1076);
    float _1096 = _1080 * _1086;
    float _1098 = _1088 * _1054;
    float _1100 = _1082 * _1086;
    float _1102 = _1080 * _1054;
    float _1104 = _1082 * _1054;
    float _1106 = fma(_1082, _1096, _1098);
    float _1108 = fma(_1082, _1100, _674);
    float _1110 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1112 = _1094 + _1110;
    float _1114 = _440 + _1092;
    float _1116 = -_1098;
    float _1118 = fma(_1082, _1096, _1116);
    float _1120 = fma(_1080, _1096, _674);
    float _1122 = -_1104;
    float _1124 = fma(_1088, _1096, _1122);
    float _1126 = fma(_1088, _1096, _1104);
    float _1128 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1130 = _1090 + _1128;
    float _1132 = _1108 * _1112;
    float _1134 = fma(_536, _1074, _1114);
    float _1136 = fma(_1088, _1100, _1102);
    float _1138 = _1118 * _1112;
    float _1140 = -_1102;
    float _1142 = fma(_1088, _1100, _1140);
    float _1144 = fma(_1106, _1130, _1132);
    float _1146 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1148 = _1134 + _1146;
    float _1150 = fma(_1120, _1130, _1138);
    float _1152 = _1088 * _1088;
    float _1154 = _1136 * _1112;
    float _1156 = fma(_1142, _1148, _1144);
    float _1158 = fma(_1126, _1148, _1150);
    float _1160 = fma(_1086, _1152, _674);
    float _1162 = fma(_1124, _1130, _1154);
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1166 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1170 = fma(_1160, _1148, _1162);
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1164);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1168);
    float _1178 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1172);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1174);
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1176);
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1186 = _1180 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1188 = _1182 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1190 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1194 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1190);
    float _1196 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1192);
    float _1198 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1196);
    float _1202 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1202 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1212 = _1204 + _1210;
    float _1214 = _1208 * _1208;
    float _1216 = fma(_1212, _1212, _1214);
    float _1218 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1220 = sqrt(_1216);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1218);
    float _1224 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1222);
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1228 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1224;
    float _1232 = _1202;
    float _1234 = _1204;
    float _1236 = _1188;
    float _1238 = _982;
    float _1240 = _1212;
    float _1242 = _1208;
    if (!_1228)
    {
        _1230 = _1202;
    }
    float _1244 = _1230;
    float _1246 = _1244;
    if (!_1228)
    {
        _1232 = _1226;
    }
    float _1248 = _1232;
    bool _1250 = !_1228;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1220 + _1256;
        float _1260 = rsqrt(_1216);
        float _1262 = _1258 * _1254;
        float _1264 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1260 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = fma(_1212, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1286 = fma(_1208, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1288 = fma(_1226, _1274, _1282);
        _1252 = _1288;
        _1234 = _1284;
        _1246 = _1286;
        _1236 = _1266;
    }
    float _1290 = _1252;
    float _1292 = _1234;
    float _1294 = _1246;
    float _1296 = _1236;
    float _1298 = _980 + _1290;
    float _1300 = _982 + _1292;
    float _1302 = _984 + _1294;
    float _1304 = _400 + _982;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1308 = _1298 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1312 = _1300 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1316 = _1302 + _1314;
    float _1318 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = _1308 * _1308;
    float _1322 = _440 + _984;
    float _1324 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1326 = fma(_1312, _1312, _1320);
    float _1328 = fma(_1316, _1316, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1332 = rsqrt(_1328);
    float _1334 = sqrt(_1328);
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1338 = _1312 * _1336;
    float _1340 = _1316 * _1336;
    float _1342 = _1338 * _1338;
    float _1344 = _1340 * _1340;
    float _1346 = _1342 + _1344;
    float _1348 = sqrt(_1346);
    bool _1350 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1354 = _1348 + _1352;
    float _1356 = _1296;
    float _1358 = _1354;
    bool _1360 = _1350;
    float _1362 = _1308;
    if (_1350)
    {
        float _1364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1356 = _1364;
    }
    float _1366 = _1356;
    if (!_1350)
    {
        _1238 = _1344;
    }
    float _1368 = _1238;
    float _1370 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1372 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1370);
    float _1374 = _1368;
    if (_1350)
    {
        float _1376 = rsqrt(_1346);
        _1240 = _1376;
    }
    float _1378 = _1240;
    float _1380 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1372);
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = _1378;
    if (_1350)
    {
        float _1386 = _1354 * _1366;
        _1358 = _1386;
    }
    float _1388 = _1358;
    if (_1350)
    {
        float _1390 = _1388 * 0.15915493667125701904296875;
        _1242 = _1390;
    }
    float _1392 = _1242;
    float _1394 = _1290;
    if (_1350)
    {
        float _1396 = _1392 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        _1394 = _1398;
    }
    float _1400 = _1394;
    float _1402 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1404 = precise::max(0.0, _1402);
    float _1406 = _1226;
    float _1408 = _1404;
    float _1410 = _1402;
    if (_1350)
    {
        float _1412 = _1392 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = -_1336;
    float _1420 = -_1404;
    float _1422 = fma(_1308, _1418, _1420);
    if (_1350)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1424;
    }
    float _1426 = _1408;
    float _1428 = _1400;
    float _1430 = _1426;
    if (_1350)
    {
        float _1432 = fma(_1400, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = _1434;
    if (!_1350)
    {
        _1430 = _1422;
    }
    float _1438 = _1430;
    float _1440 = _1438;
    float _1442 = _1416;
    if (_1350)
    {
        float _1444 = _1416 + (-1.0);
        _1410 = _1444;
    }
    float _1446 = _1410;
    float _1448 = 0.0;
    float _1450 = _1446;
    if (_1350)
    {
        float _1452 = _1378 * _1434;
        _1448 = _1452;
    }
    float _1454 = _1448;
    if (!_1350)
    {
        _1436 = _1338;
    }
    float _1456 = _1436;
    float _1458 = _1456;
    if (_1350)
    {
        float _1460 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1460;
    }
    float _1462 = _1384;
    if (_1350)
    {
        float _1464 = _1338 * _1454;
        _1458 = _1464;
    }
    float _1466 = _1458;
    if (!_1350)
    {
        _1450 = _1340;
    }
    float _1468 = _1450;
    float _1470 = _1468;
    if (_1350)
    {
        float _1472 = _1340 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (_1350)
    {
        float _1476 = fma(_1422, _1416, _1462);
        _1440 = _1476;
    }
    float _1478 = _1440;
    if (!_1350)
    {
        _1442 = _1342;
    }
    float _1480 = _1442;
    float _1482 = _1480;
    if (_1350)
    {
        float _1484 = _1466 * _1466;
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1350)
    {
        float _1488 = _1474 * _1474;
        _1374 = _1488;
    }
    float _1490 = _1374;
    float _1492 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1494 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1496 = fma(_1478, _1478, _1486);
    float _1498 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1492);
    float _1500 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1494);
    float _1502 = _1496 + _1490;
    float _1504 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1506 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1508 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1510 = fma(_1322, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1512 = rsqrt(_1502);
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1516 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1514);
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1522 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1524 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1526 = -_1518;
    float _1528 = _1526 + 1.0;
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1534 = floor(_1508);
    float _1536 = -_1524;
    float _1538 = fma(_1536, _1330, 1.0);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1542 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1544 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1546 = abs(_1528);
    float _1548 = log2(_1546);
    float _1550 = _1512 * _1466;
    float _1552 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1544);
    float _1554 = _1512 * _1478;
    float _1556 = _1512 * _1474;
    float _1558 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1560 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1562 = floor(_1510);
    float _1564 = -_1558;
    float _1566 = fma(_1554, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1564);
    float _1568 = -_1534;
    float _1570 = _1508 + _1568;
    float _1572 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1574 = -_1556;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1566);
    float _1578 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1560);
    float _1580 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1582 = fma(_1576, -0.5, 0.5);
    float _1584 = log2(_1538);
    float _1586 = fma(_1576, 0.5, 0.5);
    float _1588 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1590 = -_1562;
    float _1592 = _1510 + _1590;
    float _1594 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1572);
    float _1596 = exp2(_1580);
    float _1598 = _1554 + 1.0;
    float _1600 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1594);
    float _1602 = 1.0 / _1552;
    float _1604 = fma(_1586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1606 = _1584 * 0.693147182464599609375;
    float _1608 = fma(_1586, _1604, -0.212114393711090087890625);
    float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1612 = sqrt(_1582);
    float _1614 = -_1554;
    float _1616 = fma(_1596, _1598, _1614);
    float _1618 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1620 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1600);
    float _1622 = fma(_1586, _1608, 1.570728778839111328125);
    float _1624 = fma(_1616, 0.5, 0.5);
    float _1626 = _1618 * _1602;
    float _1628 = _1620 * _1602;
    float _1630 = fma(_1626, 0.5, 0.5);
    float _1632 = fma(_1628, -0.5, 0.5);
    float _1634 = _1612 * 0.636619746685028076171875;
    float2 _5955 = float2(_1570, _1592);
    float _1636 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5955, float2(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5955, float2(0.0), isnan(_5955)), level(0.0)).x;
    float3 _5966 = float3(_1630, _1632, _1610);
    float _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5966, float3(0.0), isnan(_5966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5966, float3(0.0), isnan(_5966)), level(0.0)).x;
    float _1640 = -_1622;
    float _1642 = fma(_1634, _1640, 1.0);
    float3 _5982 = float3(_1630, _1632, _1610);
    float4 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5982, float3(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5982, float3(0.0), isnan(_5982)), level(0.0)).xyzw;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1645.w;
    float2 _5998 = float2(_1642, _1624);
    float3 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1667 = _1665 != 0;
    float _1669 = in.m_55.x;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1673 = _1671 != 0;
    float _1675 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1677 = int(_1675);
    bool _1679 = _218 > 0.5;
    float _1681 = in.m_59.w;
    float _1683 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1685 = _212 > 0.5;
    out.m_65.x = _180;
    out.m_65.y = _184;
    out.m_65.z = _188;
    out.m_65.w = _182;
    float _1687 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1689 = int(_1687);
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1695 = 0;
    float _1697 = _1610;
    float _1699 = _1618;
    float _1701 = _1620;
    if (_1667)
    {
        float _1703 = in.m_59.x;
        _1695 = as_type<int>(_1703);
    }
    int _1705 = _1695;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1711 = as_type<int>(_1616);
    if (_1673)
    {
        float _1713 = in.m_59.z;
        _1711 = as_type<int>(_1713);
    }
    int _1715 = _1711;
    float _1717 = 1.0 / _1693;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1725 = -_168;
    float _1727 = _1725 + 1.0;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1733 = _1669;
    if (!_1673)
    {
        _1697 = _1669;
    }
    float _1735 = _1697;
    float _1737 = 1.0 / _1709;
    int _1739 = _1679 ? as_type<int>(_1727) : as_type<int>(_168);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    int _1745 = _1685 ? as_type<int>(_1727) : as_type<int>(_168);
    out.m_67.x = _1312;
    out.m_67.y = _1308;
    out.m_67.z = _1316;
    bool _1747 = _1681 > 0.5;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1751 = _1749 != 0;
    float _1753 = 1.0 / _1723;
    int _1755 = _1747 ? as_type<int>(_1727) : as_type<int>(_168);
    float _1757 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1759 = _1705;
    float _1761 = _1735;
    if (_1667)
    {
        bool _1763 = as_type<float>(_1705) > 0.5;
        _1360 = _1763;
    }
    bool _1765 = _1360;
    if (_1673)
    {
        float _1767 = -_1669;
        float _1769 = _1767 + 1.0;
        _1759 = as_type<int>(_1769);
    }
    int _1771 = _1759;
    float _1773 = _1751 ? as_type<float>(_1739) : _168;
    float _1775 = fma(_1757, -2.0, _1719);
    int _1777 = _1715;
    int _1779 = as_type<int>(_1775);
    if (_1673)
    {
        bool _1781 = as_type<float>(_1715) > 0.5;
        _934 = _1781;
    }
    bool _1783 = _934;
    if (_1667)
    {
        float _1785 = -_1669;
        float _1787 = _1785 + 1.0;
        _1777 = as_type<int>(_1787);
    }
    int _1789 = _1777;
    float _1791 = 1.0 / _1731;
    if (_1673)
    {
        float _1793 = _1783 ? as_type<float>(_1771) : _1669;
        _1761 = _1793;
    }
    float _1795 = _1761;
    float _1797 = in.m_69.x;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1801 = _1799 != 0;
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1805 = _1801 ? as_type<float>(_1739) : _168;
    float _1807 = 1.0 / _1743;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1811 = _1809 != 0;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1817 = float(uint(_1677));
    float _1819 = _1811 ? as_type<float>(_1745) : _168;
    bool _1821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(0.5);
    bool _1829 = _1825 || _1827;
    float _1831 = 1.0 / _1815;
    float _1833 = float(_1689);
    float _1835 = 0.0;
    float _1837 = _1797;
    if (!_1667)
    {
        _1835 = _1669;
    }
    float _1839 = _1835;
    float _1841 = _1839;
    if (_1667)
    {
        float _1843 = _1765 ? as_type<float>(_1789) : _1669;
        _1841 = _1843;
    }
    float _1845 = _1841;
    float _1847 = 1.0 / _1833;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1855 = _1853 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1859 = _1857 != 0;
    float _1861 = _1851 * _1717;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1863;
    float _1867 = _1855 * _1791;
    float _1869 = 1.0 / _1817;
    float _1871 = _1859 ? as_type<float>(_1755) : _168;
    float _1873 = _1865 * _1737;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1881 = _210 + _1879;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1885 = _1883 != 0;
    float _1887 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1889 = _1877 * _1831;
    float _1891 = _124 * _1847;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _1901 = fma(_1861, _1881, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1905 = _1895 * _1807;
    float _1907 = _1899 * _1753;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1911 = _210 + _1909;
    int _1913 = as_type<int>(_1869) + (-2);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _210 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1921 = _210 + _1919;
    float _1923 = fma(_1907, _1911, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1925 = trunc(_1891);
    int _1927 = int(_1925);
    float _1929 = fma(_1867, _1917, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1933 = _210 + _1931;
    bool _1935 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _1937 = isnan(_210);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = fma(_1873, _1921, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1951 = _1949 != 0;
    float _1953 = fma(_1905, _1933, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1957 = _1955 != 0;
    float _1959 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1963 = _1961 != 0;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1967 = _210 + _1965;
    bool _1969 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1971 = isnan(_210);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1977 = _1973 || _1975;
    int _1979 = _1977 ? 1065353216 : 0;
    float _1981 = -_1945;
    float _1983 = _1981 + 1.0;
    float _1985 = fma(_1959, _1805, -0.5);
    float _1987 = fma(_1889, _1967, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _1989 = ~_1677;
    int _1991 = _1989 + 1;
    float _1993 = as_type<float>(_1979) * _1983;
    float _1995 = float(uint(_1927));
    float _1997 = -as_type<float>(_1979);
    float _1999 = _1997 + 1.0;
    bool _2001 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2003 = isnan(_210);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    int _2013 = _1979;
    float _2015 = _1987;
    if (_1885)
    {
        float _2017 = -_1669;
        float _2019 = _2017 + 1.0;
        _2013 = as_type<int>(_2019);
    }
    int _2021 = _2013;
    float _2023 = 0.0;
    if (!_1885)
    {
        _2023 = _1669;
    }
    float _2025 = _2023;
    float _2027 = as_type<float>(_1913) * _1995;
    bool _2029 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2031 = isnan(_210);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = -_2011;
    float _2043 = _2041 + 1.0;
    float _2045 = _2025;
    if (_1885)
    {
        float _2047 = _1685 ? as_type<float>(_2021) : _1669;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2053 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2055 = isnan(_210);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = -_2039;
    float _2067 = _2065 + 1.0;
    float _2069 = _2039 * _1999;
    bool _2071 = _906 != 0.0;
    bool _2073 = isnan(_906);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.0);
    bool _2079 = _2075 || _2077;
    float _2081 = _2011 * _2067;
    bool _2083 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2085 = isnan(_210);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = trunc(_2027);
    float _2097 = precise::max(_2095, 0.0);
    uint _2100 = uint(_2097);
    float _2102 = in.m_71.x;
    float _2104 = in.m_71.y;
    float _2106 = in.m_71.z;
    float _2108 = _2063 * _2043;
    float _2110 = -_2063;
    float _2112 = _2110 + 1.0;
    bool _2114 = _904 == 0.0;
    bool _2116 = !_2079;
    bool _2118 = _2114 && _2116;
    float _2120 = _2093 * _2112;
    bool _2122 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2124 = isnan(_210);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = -_2093;
    float _2136 = _2134 + 1.0;
    float _2138 = float(_1677);
    float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _2142 = _908 == 0.0;
    bool _2144 = _2142 && _2118;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2148 = _2132 * _2136;
    float _2150 = _124 * _2138;
    int _2152 = _1991 * int(_2100);
    int _2154 = _2152 + _1927;
    float _2156 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2146);
    float _2158 = _2051 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2160 = _1901 * _2148;
    float _2162 = -_2132;
    float _2164 = _2162 + 1.0;
    float _2166 = float(uint(_2154));
    float _2168 = _2150 * _170;
    float _2170 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1775);
    float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2174 = _2164;
    float _2176 = as_type<float>(_2100);
    float _2178 = _2172;
    if (_1951)
    {
        float _2180 = -_1669;
        float _2182 = _2180 + 1.0;
        _1779 = as_type<int>(_2182);
    }
    int _2184 = _1779;
    float _2186 = as_type<float>(_1913) * _2166;
    float _2188 = fma(_2158, _1819, -0.5);
    float _2190 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2156);
    float _2192 = fma(_2164, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2160);
    if (_2144)
    {
        _2174 = _2102;
    }
    float _2194 = _2174;
    float _2196 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2198 = trunc(_2186);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    float _2204 = _2194;
    if (_1951)
    {
        float _2206 = _1685 ? as_type<float>(_2184) : _1669;
        _1733 = _2206;
    }
    float _2208 = _1733;
    float _2210 = -_2170;
    float _2212 = fma(_2190, _2188, _2210);
    float _2214 = _424 * _426;
    int _2216 = ~_1677;
    int _2218 = _2216 + 1;
    float _2220 = fma(_2196, _1773, -0.5);
    if (_2144)
    {
        _496 = _2194;
    }
    float _2222 = _496;
    float _2224 = fma(_1929, _2120, _2192);
    float _2226 = _2222;
    if (!_2144)
    {
        _2204 = _2102;
    }
    float _2228 = _2204;
    float _2230 = floor(_2214);
    float _2232 = float(_1927);
    float _2234 = fma(_1947, _2108, _2224);
    bool _2236 = _428 != 2;
    float _2238 = _2228;
    if (!_2144)
    {
        float _2240 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2228);
        _2226 = _2240;
    }
    float _2242 = _2226;
    bool _2244 = _2232 >= _2138;
    bool _2246 = isnan(_2232);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(_2138);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    int _2256 = int(_2100) + int(_2202);
    float _2258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2260 = as_type<float>(_2202);
    if (_2144)
    {
        _2176 = _2104;
    }
    float _2262 = _2176;
    float _2264 = _2262;
    if (_2144)
    {
        _2260 = _2106;
    }
    float _2266 = _2260;
    int _2268 = _2218 * _2256;
    int _2270 = _2268 + _1927;
    float _2272 = _2266;
    if (_2144)
    {
        _498 = _2262;
    }
    float _2274 = _498;
    float _2276 = _2274;
    if (!_2144)
    {
        _2264 = _2104;
    }
    float _2278 = _2264;
    float _2280 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2282 = uint(_2270) >= uint(_1677);
    float _2284 = trunc(_2254);
    int _2286 = int(_2284);
    if (_2144)
    {
        _2178 = _2266;
    }
    float _2288 = _2178;
    float _2290 = fma(_2280, _1845, -0.5);
    bool _2292 = !_2282;
    int _2294 = _2292 ? 0 : (-1);
    float _2296 = -_2230;
    float _2298 = _2214 + _2296;
    float _2300 = _2288;
    if (!_2144)
    {
        _2272 = _2106;
    }
    float _2302 = _2272;
    float _2304 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _2306 = ~_2256;
    int _2308 = _2306 + _2294;
    int _2310 = _2308 + 1;
    float _2312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2314 = _1677 == 0;
    float _2316 = _2138 * _2298;
    int _2318 = abs(_678);
    int _2320 = _1677 * _2310;
    int _2322 = _2320 + _1927;
    bool _2324 = !_1957;
    int _2326 = _2324 ? 0 : 1;
    float _2328 = fma(_2304, _2208, -0.5);
    float _2330 = trunc(_2316);
    int _2332 = int(_2330);
    int _2334 = ~_2286;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    if (!_2144)
    {
        float _2340 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2278);
        _2276 = _2340;
    }
    float _2342 = _2276;
    bool _2344 = !_2314;
    int _2346 = _2344 ? _2322 : (-1);
    if (!_2144)
    {
        float _2348 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2302);
        _2300 = _2348;
    }
    float _2350 = _2300;
    bool _2352 = _430 != 1;
    int _2354 = abs(_2326);
    int _2356 = _2346 * _2338;
    int _2358 = _1677 + (-1);
    float _2360 = trunc(_2168);
    int _2362 = int(_2360);
    float _2364 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2366 = _422 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2368 = _2286 * _2358;
    int _2370 = _2368 + _2356;
    float _2372 = fma(_2364, _2049, -0.5);
    int _2374 = abs(_732);
    int _2376 = _2332 * _2354;
    int _2378 = _2376 + _1927;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2382 = _2370 * _2318;
    int _2384 = abs(_696);
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2388 = exp2(_1683);
    float _2390 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2386);
    float _2392 = _432 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2396 = _2362 * _2384;
    int _2398 = _2396 + _2382;
    float _2400 = -_2380;
    float _2402 = fma(_2392, 2.0, _2400);
    int _2404 = abs(_738);
    float _2406 = fma(_1987, _2081, _2234);
    int _2408 = _2378 * _2374;
    int _2410 = _2408 + _2398;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2414 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2394);
    float _2416 = _434 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2418 = -_2412;
    float _2420 = fma(_2366, 2.0, _2418);
    float _2422 = in.m_73.x;
    float _2424 = in.m_73.y;
    float _2426 = in.m_73.z;
    float _2428 = in.m_73.w;
    int _2430 = _2332 * _2404;
    int _2432 = _2430 + _2410;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2436 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2434);
    float _2440 = float(uint(_2432));
    float _2442 = fma(_2416, -2.0, _2436);
    int _2444 = ~_1677;
    int _2446 = _2444 + 1;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2452 = as_type<float>(_1913) * _2440;
    float _2454 = _2440;
    float _2456 = _2448;
    if (_2236)
    {
        _2015 = _422;
    }
    float _2458 = _2015;
    float _2460 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2448);
    float _2462 = _2458;
    if (!_2236)
    {
        _2462 = _218;
    }
    float _2464 = _2462;
    float _2466 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2450);
    if (!_2352)
    {
        _2454 = _218;
    }
    float _2468 = _2454;
    float _2470 = trunc(_2452);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = _2468;
    if (_2352)
    {
        _288 = _212;
    }
    float _2478 = _288;
    float _2480 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2438);
    if (_2352)
    {
        _2476 = _212;
    }
    float _2482 = _2476;
    float _2484 = -_124;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2402);
    if (_2236)
    {
        _2456 = _212;
    }
    float _2488 = _2456;
    float _2490 = _2422 * _2278;
    float _2492 = _2426 * _2228;
    float _2494 = _2424 * _2302;
    float _2496 = _2488;
    if (!_2236)
    {
        _2496 = _422;
    }
    float _2498 = _2496;
    float _2500 = -_2490;
    float _2502 = fma(_2424, _2228, _2500);
    float _2504 = -_2492;
    float _2506 = fma(_2422, _2302, _2504);
    float _2508 = -_2494;
    float _2510 = fma(_2426, _2278, _2508);
    float _2512 = fma(_1953, _2069, _2406);
    if (!_2352)
    {
        _2238 = _212;
    }
    float _2514 = _2238;
    float _2516 = _2506 * _2428;
    float _2518 = _2514;
    if (_2352)
    {
        _276 = _422;
    }
    float _2520 = _276;
    float _2522 = _2510 * _2428;
    if (_2352)
    {
        _2518 = _422;
    }
    float _2524 = _2518;
    float _2526 = _2502 * _2428;
    float _2528 = -_124;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2420);
    int _2532 = _2446 * int(_2474);
    int _2534 = _2532 + _2432;
    float _2536 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2390);
    float _2538 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2442);
    float _2540 = fma(_2480, _2290, _2530);
    float _2542 = fma(_2536, _2328, _2486);
    float _2544 = float(uint(_2534));
    float _2546 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2414);
    float _2548 = fma(_1923, _1993, _2512);
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2552 = as_type<float>(_1913) * _2544;
    float _2554 = -_2538;
    float _2556 = fma(_2546, _2220, _2554);
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2560 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2562 = float(uint(_2378));
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2566 = trunc(_2552);
    float _2568 = precise::max(_2566, 0.0);
    uint _2570 = uint(_2568);
    float _2572 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2558);
    float _2574 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2576 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2578 = ~_1677;
    int _2580 = _2578 + 1;
    float _2582 = -_2550;
    float _2584 = fma(_2574, 2.0, _2582);
    float _2586 = _2556 + 0.5;
    float _2588 = fma(_1945, (*spvDescriptorSet0.vp_c9)._m0[137].x, _2548);
    int _2590 = ~_1677;
    int _2592 = _2590 + 1;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2596 = _2588 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2600 = int(_2474) + int(_2570);
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2604 = _2542 + 0.5;
    float _2606 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2598);
    float _2608 = -_2594;
    float _2610 = fma(_2564, 2.0, _2608);
    float _2612 = fma(_2560, -2.0, _2602);
    float _2614 = as_type<float>(_1913) * _2562;
    int _2616 = _2580 * _2600;
    int _2618 = _2616 + _2432;
    out.m_75.x = _2604;
    out.m_75.y = _2586;
    float _2620 = -_124;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2610);
    float _2624 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2466);
    float _2626 = trunc(_2614);
    float _2628 = precise::max(_2626, 0.0);
    uint _2630 = uint(_2628);
    bool _2632 = uint(_2618) >= uint(_1677);
    float _2634 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2606);
    float _2636 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2638 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2572);
    float _2640 = -_124;
    float _2642 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2584);
    bool _2644 = !_2632;
    int _2646 = _2644 ? 0 : (-1);
    float _2648 = fma(_2634, _1803, _2622);
    float _2650 = fma(_2576, -2.0, _2636);
    float _2652 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2460);
    int _2654 = ~_2600;
    int _2656 = _2654 + _2646;
    int _2658 = _2656 + 1;
    float _2660 = _2540 + 0.5;
    float _2662 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2650);
    float _2664 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2612);
    float _2666 = fma(_2652, _2372, _2642);
    int _2668 = _1677 * _2658;
    int _2670 = _2668 + _2432;
    float _2672 = _938 + _980;
    int _2674 = _2592 * int(_2630);
    int _2676 = _2674 + _2378;
    float _2678 = -_2664;
    float _2680 = fma(_2638, _1887, _2678);
    float _2682 = _2648 + 0.5;
    bool _2684 = !_2314;
    int _2686 = _2684 ? _2670 : (-1);
    float _2688 = -_2662;
    float _2690 = fma(_2624, _1985, _2688);
    float _2692 = float(uint(_2676));
    float _2694 = _2680 + 0.5;
    int _2696 = _2686 >> 31;
    float _2698 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2700 = _2686 & 3;
    bool _2702 = _2700 != 0;
    float _2704 = as_type<float>(_1913) * _2692;
    int _2706 = _2696 & 3;
    float _2708 = _2212 + 0.5;
    int _2710 = _2686 & 3;
    float _2712 = trunc(_2704);
    float _2714 = precise::max(_2712, 0.0);
    uint _2716 = uint(_2714);
    int _2718 = _2686 + _2706;
    float _2720 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2698);
    float _2722 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_77.x = _2660;
    out.m_77.y = _2708;
    out.m_77.z = _2682;
    out.m_77.w = _2694;
    int _2724 = _2718 >> 2;
    float _2726 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2720);
    float _2728 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2722);
    bool _2730 = uint(_2710) > 1u;
    float _2732 = _1028 * _2516;
    int _2734 = _2724 << 4;
    int _2736 = _2734 + 512;
    float _2738 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2740 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2728);
    float _2742 = _1026 * _2516;
    float _2744 = 1.0 / _2738;
    float _2746 = _2740 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2748 = _2702 ? 0 : 1;
    uint _2750 = uint(int(uint(_2736) >> uint(2)));
    uint _2752 = uint(int(uint(int(_2750)) >> uint(2)));
    int _2754 = int(_2750) & 3;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[int(_2752)][_2754];
    int _2758 = int(_2750) + 1;
    uint _2760 = uint(int(uint(_2758) >> uint(2)));
    int _2762 = _2758 & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = ~_1677;
    int _2768 = _2766 + 1;
    float _2770 = _2746 + _2738;
    int _2772 = ~_2748;
    int _2774 = _2772 + 1;
    int _2776 = _2774 + 1;
    float _2778 = _2666 + 0.5;
    float _2780 = _2690 + 0.5;
    int _2782 = _2776;
    if (!_2730)
    {
        int _2784 = ~_2748;
        int _2786 = _2784 + 1;
        _2782 = _2786;
    }
    int _2788 = _2782;
    int _2790 = _2736 + 8;
    uint _2792 = uint(int(uint(_2790) >> uint(2)));
    uint _2794 = uint(int(uint(int(_2792)) >> uint(2)));
    int _2796 = int(_2792) & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    int _2800 = int(_2792) + 1;
    uint _2802 = uint(int(uint(_2800) >> uint(2)));
    int _2804 = _2800 & 3;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[int(_2802)][_2804];
    bool _2808 = _2710 != 3;
    float _2810 = fma(_1036, _2522, _2742);
    int _2812 = int(_2630) + int(_2716);
    float _2814 = fma(_1034, _2522, _2732);
    float _2816 = _2770 * _2744;
    float _2818 = _2816 * 0.5;
    float _2820 = -_2516;
    float _2822 = _998 * _2820;
    bool _2824 = uint(_2710) >= 2u;
    int _2826 = _2768 * _2812;
    int _2828 = _2826 + _2378;
    float _2830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2832 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2830);
    float _2834 = fma(_1030, _2522, _2822);
    int _2836 = _2824 ? 0 : 1;
    float _2838 = -_2424;
    float _2840 = _998 * _2838;
    float _2842 = _1026 * _2424;
    float _2844 = _1028 * _2424;
    float _2846 = 1.0 / _2832;
    bool _2848 = !_2702;
    int _2850 = _2848 ? 0 : 1;
    out.m_79.x = _2778;
    out.m_79.y = _2780;
    bool _2852 = uint(_2828) >= uint(_1677);
    float _2854 = fma(_1036, _2422, _2842);
    int _2856 = ~_2836;
    int _2858 = _2856 + 1;
    int _2860 = _2858 + 1;
    float _2862 = fma(_1034, _2422, _2844);
    int _2864 = _2860;
    if (_2808)
    {
        int _2866 = ~_2836;
        int _2868 = _2866 + 1;
        _2864 = _2868;
    }
    int _2870 = _2864;
    out.m_81.w = _2596;
    int _2872 = abs(_2850);
    float _2874 = -_2342;
    float _2876 = _998 * _2874;
    bool _2878 = !_2852;
    int _2880 = _2878 ? 0 : (-1);
    float _2882 = fma(_1030, _2422, _2840);
    int _2884 = abs(_2788);
    float _2886 = _1026 * _2342;
    int _2888 = abs(_2870);
    float _2890 = _1028 * _2342;
    int _2892 = ~_2884;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    float _2898 = fma(_1030, _2242, _2876);
    bool _2900 = _2710 != 3;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2904 = _2846 * _2902;
    int _2906 = ~_2812;
    int _2908 = _2906 + _2880;
    int _2910 = _2908 + 1;
    float _2912 = fma(_1036, _2242, _2886);
    int _2914 = ~_2872;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    float _2920 = abs(_2904);
    float _2922 = log2(_2920);
    int _2924 = _2896 * as_type<int>(_2764);
    bool _2926 = !_1963;
    int _2928 = _2926 ? 0 : 1;
    int _2930 = _1677 * _2910;
    int _2932 = _2930 + _2378;
    int _2934 = ~_2888;
    int _2936 = _2934 + 1;
    int _2938 = _2936 + 1;
    int _2940 = _2918 * as_type<int>(_2756);
    int _2942 = _2940 + _2924;
    bool _2944 = !_2900;
    int _2946 = _2944 ? 0 : (-1);
    float _2948 = fma(_1040, _2526, _2810);
    int _2950 = abs(_2928);
    int _2952 = _2938 * as_type<int>(_2798);
    int _2954 = _2952 + _2942;
    int _2956 = abs(_2946);
    float _2958 = fma(_1050, _2526, _2834);
    float _2960 = fma(_1042, _2526, _2814);
    float _2962 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2964 = ~_2956;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2972 = ~_2950;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2962);
    float _2980 = fma(_1050, _2426, _2882);
    int _2982 = _2968 * as_type<int>(_2806);
    int _2984 = _2982 + _2954;
    bool _2986 = !_2314;
    int _2988 = _2986 ? _2932 : (-1);
    float _2990 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2978);
    float _2992 = exp2(_2970);
    int _2994 = _2984 * _2976;
    float _2996 = _1618 + _1552;
    float _2998 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2990);
    float _3000 = fma(_1040, _2426, _2854);
    int _3002 = _2988 * _2950;
    int _3004 = _3002 + _2994;
    float _3006 = _1552 * 0.5;
    float _3008 = _2998 + _1552;
    out.m_83.x = _2958;
    out.m_83.y = _2948;
    out.m_83.z = _2960;
    float _3010 = fma(_1042, _2426, _2862);
    float _3012 = float(_3004);
    float _3014 = fma(_1034, _2242, _2890);
    out.gl_Position.x = _1618;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _2998;
    out.gl_Position.w = _1552;
    out.m_85.x = _2980;
    out.m_85.y = _3000;
    out.m_85.z = _3010;
    float _3016 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3018 = precise::clamp(_3016, 0.0, 1.0);
    float _3020 = _3008 * 0.5;
    float _3022 = _2996 * 0.5;
    float _3024 = fma(_1620, -0.5, _3006);
    out.m_87.y = _3012;
    float _3026 = fma(_3018, -2.0, 3.0);
    float _3028 = _3018 * _3018;
    out.m_89.x = _3022;
    out.m_89.y = _3024;
    out.m_89.z = _3020;
    out.m_89.w = _1552;
    if (_1829)
    {
        _1699 = 1.0;
    }
    float _3030 = _1699;
    float _3032 = _3028 * _3026;
    float _3034 = _3030;
    if (_1829)
    {
        _1701 = 1.0;
    }
    float _3036 = _1701;
    float _3038 = -_3032;
    float _3040 = _3038 + 1.0;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3032);
    bool _3044 = _2904 <= 8000.0;
    bool _3046 = isnan(_2904);
    bool _3048 = _3044 || _3046;
    bool _3050 = isnan(8000.0);
    bool _3052 = _3048 || _3050;
    float _3054 = float(_3052);
    float _3056 = _3036;
    float _3058 = _3042;
    if (!_1829)
    {
        float _3060 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3062;
        float _3066 = _3060 * 0.15915493667125701904296875;
        float _3068 = _3066 * 6.283185482025146484375;
        float _3070 = cos(_3068);
        float _3072 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3074 = _3072 * 0.15915493667125701904296875;
        float _3076 = _3066 * 6.283185482025146484375;
        float _3078 = sin(_3076);
        float _3080 = 1.0 / _3070;
        float _3082 = _3074 * 6.283185482025146484375;
        float _3084 = cos(_3082);
        float _3086 = _3078 * _3080;
        float _3088 = _3074 * 6.283185482025146484375;
        float _3090 = sin(_3088);
        float _3092 = _3084 * _3086;
        float _3094 = 1.0 / _3064;
        float _3096 = 1.0 / _3092;
        float _3098 = _3090 * _3096;
        float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3102 = fma(_2904, _3098, _3100);
        float _3104 = _3102 * _3094;
        float _3106 = precise::clamp(_3104, 0.0, 1.0);
        _3056 = _3106;
        _1362 = _3064;
    }
    float _3108 = _3056;
    float _3110 = _1362;
    float _3112 = _3110;
    if (!_1829)
    {
        float _3114 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3116 = _3114 * 0.15915493667125701904296875;
        float _3118 = _3116 * 6.283185482025146484375;
        float _3120 = cos(_3118);
        float _3122 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3124 = _3122 * 0.15915493667125701904296875;
        float _3126 = _3116 * 6.283185482025146484375;
        float _3128 = sin(_3126);
        float _3130 = 1.0 / _3120;
        float _3132 = _3124 * 6.283185482025146484375;
        float _3134 = cos(_3132);
        float _3136 = _3128 * _3130;
        float _3138 = _3124 * 6.283185482025146484375;
        float _3140 = sin(_3138);
        float _3142 = _3134 * _3136;
        float _3144 = 1.0 / _3142;
        float _3146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3148 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3146;
        float _3150 = 1.0 / _3148;
        float _3152 = _3140 * _3144;
        float _3154 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3156 = fma(_2904, _3152, _3154);
        float _3158 = _3156 * _3150;
        float _3160 = precise::clamp(_3158, 0.0, 1.0);
        float _3162 = -_3160;
        float _3164 = _3162 + 1.0;
        _3034 = _3164;
        _3112 = _3152;
    }
    float _3166 = _3034;
    float _3168 = _3112;
    float _3170 = _3054 * _3042;
    float _3172 = -_2388;
    float _3174 = _3172 + 1.0;
    float _3176 = -_1636;
    float _3178 = _3176 + 1.0;
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3182 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3184 = fma(_1050, _2350, _2898);
    float _3186 = fma(_1040, _2350, _2912);
    float _3188 = _3178 * _3180;
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = _3182 * _1638;
    float _3194 = -_3182;
    float _3196 = _3194 + 1.0;
    float _3198 = fma(_1042, _2350, _3014);
    float _3200 = -_3190;
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3204 = _1653 * _3192;
    float _3206 = _1663 * _3192;
    float _3208 = _1653 * _3196;
    float _3210 = _3202 * _1797;
    float _3212 = fma(_1659, _3204, _1647);
    float _3214 = fma(_1661, _3204, _1649);
    float _3216 = fma(_1653, _3206, _1651);
    float _3218 = _3210 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _3184;
    out.m_91.y = _3186;
    out.m_91.z = _3198;
    bool _3220 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3222 = isnan(_1334);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3228 = _3224 || _3226;
    float _3230 = _3108 * _3166;
    out.m_93.x = _3218;
    float _3232 = _3230 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3212;
    out.m_95.y = _3214;
    out.m_95.z = _3216;
    out.m_95.w = _3208;
    float _3234 = _3192;
    float _3236 = _3168;
    float _3238 = _3210;
    float _3240 = _3204;
    if (!_3228)
    {
        _3058 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3242 = _3058;
    float _3244 = _3242;
    float _3246 = _3242;
    if (!_3228)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3248 = _3234;
    float _3250 = _3248;
    float _3252 = _3248;
    if (!_3228)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3254 = _3236;
    float _3256 = _3254;
    float _3258 = _3254;
    if (!_3228)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3260 = _1837;
    float _3262 = _3260;
    float _3264 = _3260;
    if (!_3228)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3266 = _3238;
    float _3268 = _3266;
    float _3270 = _3266;
    if (!_3228)
    {
        _3240 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3272 = _3240;
    bool _3274 = !_3228;
    float _3276 = _3272;
    float _3278 = _3272;
    if (!_3274)
    {
        bool _3280 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3282 = isnan(_1334);
        bool _3284 = _3280 || _3282;
        bool _3286 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3288 = _3284 || _3286;
        if (!_3288)
        {
            float _3290 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3292 = _1334 + _3290;
            float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3296 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3294;
            float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3302 = 1.0 / _3296;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3320 = _3292 * _3302;
            float _3322 = precise::clamp(_3320, 0.0, 1.0);
            float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3328 = fma(_3322, _3300, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3330 = fma(_3322, _3326, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3332 = fma(_3322, _3306, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3334 = fma(_3322, _3310, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3336 = fma(_3322, _3314, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3338 = fma(_3322, _3318, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3252 = _3332;
            _3270 = _3336;
            _3246 = _3328;
            _3264 = _3334;
            _3258 = _3330;
            _3278 = _3338;
            _3340 = true;
        }
        else
        {
            bool _3342 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3344 = isnan(_1334);
            bool _3346 = _3342 || _3344;
            bool _3348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3350 = _3346 || _3348;
            if (!_3350)
            {
                _3244 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3352 = _3244;
            _3246 = _3352;
            if (!_3350)
            {
                _3250 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3354 = _3250;
            _3252 = _3354;
            if (!_3350)
            {
                _3256 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3356 = _3256;
            _3258 = _3356;
            if (!_3350)
            {
                _3262 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3358 = _3262;
            _3264 = _3358;
            if (!_3350)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3360 = _3268;
            _3270 = _3360;
            if (!_3350)
            {
                _3276 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3362 = _3276;
            bool _3364 = !_3350;
            _3278 = _3362;
            if (!_3364)
            {
                bool _3366 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3368 = isnan(_1334);
                bool _3370 = _3366 || _3368;
                bool _3372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3374 = _3370 || _3372;
                if (!_3374)
                {
                    float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3378 = _1334 + _3376;
                    float _3380 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3382 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3380;
                    float _3384 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3386 = _3384 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3388 = 1.0 / _3382;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3398 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3400 = _3398 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3404 = _3402 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3406 = _3378 * _3388;
                    float _3408 = precise::clamp(_3406, 0.0, 1.0);
                    float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3412 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3414 = fma(_3408, _3386, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3416 = fma(_3408, _3412, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3418 = fma(_3408, _3392, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3420 = fma(_3408, _3396, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3422 = fma(_3408, _3400, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3424 = fma(_3408, _3404, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3252 = _3418;
                    _3270 = _3422;
                    _3246 = _3414;
                    _3264 = _3420;
                    _3258 = _3416;
                    _3278 = _3424;
                    _3340 = true;
                }
                else
                {
                    _3252 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3246 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3264 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3258 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3278 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3340 = false;
    float _3426 = _3252;
    float _3428 = _3270;
    float _3430 = _3246;
    float _3432 = _3264;
    float _3434 = _3258;
    float _3436 = _3278;
    float _3438 = fma(_3186, -0.5, 0.5);
    float _3440 = precise::clamp(_3438, 0.0, 1.0);
    float _3442 = -_3426;
    float _3444 = _3442 + _3428;
    float _3446 = _3232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3448 = -_3430;
    float _3450 = _3448 + _3432;
    out.m_97.x = 0.0;
    float _3452 = fma(_3440, _3444, _3426);
    float _3454 = fma(_3440, _3450, _3430);
    out.m_53.x = _3446;
    float _3456 = -_3434;
    float _3458 = _3456 + _3436;
    float _3460 = _3452 * 0.586610972881317138671875;
    bool _3462 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3464 = fma(_3440, _3458, _3434);
    float _3466 = fma(_3454, 0.298911988735198974609375, _3460);
    bool _3468 = _3108 > 0.0;
    bool _3470 = isnan(_3108);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan(0.0);
    bool _3476 = _3472 || _3474;
    float _3478 = fma(_3464, 0.114477999508380889892578125, _3466);
    bool _3480 = _3166 <= 0.0;
    bool _3482 = !_3476;
    bool _3484 = _3480 || _3482;
    float _3486 = -_3478;
    float _3488 = _3454 + _3486;
    float _3490 = -_3478;
    float _3492 = _3452 + _3490;
    float _3494 = -_3478;
    float _3496 = _3464 + _3494;
    float _3498 = fma(_3488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    float _3500 = fma(_3492, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    float _3502 = fma(_3496, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    bool _3504 = !_3462;
    if (!_3504)
    {
        float _3506 = -_1298;
        float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3510 = -_1300;
        float _3512 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3514 = -_1302;
        float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3518 = _3508 * _3508;
        float _3520 = fma(_3512, _3512, _3518);
        float _3522 = fma(_3516, _3516, _3520);
        float _3524 = sqrt(_3522);
        float _3526 = rsqrt(_3522);
        float _3528 = -_3524;
        float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3532 = _3530 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3534 = precise::clamp(_3532, 0.0, 1.0);
        float _3536 = _3512 * _3526;
        float _3538 = _3508 * _3526;
        float _3540 = abs(_3534);
        float _3542 = log2(_3540);
        float _3544 = _3516 * _3526;
        float _3546 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3548 = _3186 * _3538;
        float _3550 = -_3538;
        float _3552 = -_3546;
        float _3554 = fma(_3550, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3552);
        float _3556 = fma(_3184, _3536, _3548);
        float _3558 = -_3544;
        float _3560 = fma(_3558, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3554);
        float _3562 = fma(_3198, _3544, _3556);
        float _3564 = precise::clamp(_3562, 0.0, 1.0);
        float _3566 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3568 = _3560 + _3566;
        float _3570 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3572 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = exp2(_3570);
        float _3578 = _3576 * _3574;
        float _3580 = _3564 * _3578;
        float _3582 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3584 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3586 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3582;
        out.m_97.y = _3584;
        out.m_97.z = _3586;
    }
    out.m_99.x = _3498;
    out.m_99.y = _3500;
    out.m_99.z = _3502;
    if (!_3484)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3588 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3588;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3340 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_46.w;
    float _115 = in.m_48.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _130;
    if (!_128)
    {
        out.m_53.x = 0.0;
    }
    int _136 = 0;
    if (!_128)
    {
        float _138 = _134 * 5.0;
        _136 = as_type<int>(_138);
    }
    int _140 = _136;
    int _142 = _140;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3655 = as_type<float>(_140);
        out.gl_Position.z = _3655;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _144 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_115);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = float(_120);
    bool _156 = _124 >= _154;
    bool _158 = !_152;
    bool _160 = _156 || _158;
    if (_160)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _132;
    if (_160)
    {
        out.m_53.x = 0.0;
    }
    if (_160)
    {
        float _164 = _162 * 5.0;
        _142 = as_type<int>(_164);
    }
    int _166 = _142;
    if (_160)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3710 = as_type<float>(_166);
        out.gl_Position.z = _3710;
    }
    if (_160)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _168 = in.m_55.y;
    float _170 = 1.0 / _154;
    bool _172 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _174 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _176 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _178 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _180 = _174 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _182 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _184 = _176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _186 = _124 * _170;
    float _188 = _178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_57.y = _168;
    bool _190 = !_172;
    float _192 = _186;
    if (!_190)
    {
        float _194 = in.m_59.x;
        float _196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _200 = fma(_198, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _202 = _200 * _196;
        float _204 = floor(_202);
        float _206 = -_204;
        float _208 = _202 + _206;
        _192 = _208;
    }
    float _210 = _192;
    float _212 = in.m_59.y;
    float _214 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _216 = log2(_214);
    float _218 = in.m_59.z;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _222 = _220 != 0;
    float _224 = in.m_46.x;
    float _226 = in.m_46.y;
    float _228 = in.m_46.z;
    float _230 = (*spvDescriptorSet0.vp_c8)._m0[28].z * (*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _232 = -_230;
    float _234 = fma((*spvDescriptorSet0.vp_c8)._m0[1].z, (*spvDescriptorSet0.vp_c8)._m0[28].x, _232);
    float _236 = (*spvDescriptorSet0.vp_c8)._m0[1].z * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _238 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _240 = 0.0;
    float _242 = _228;
    float _244 = _224;
    if (_222)
    {
        float _246 = in.m_59.x;
        _240 = _246;
    }
    float _248 = _240;
    float _250 = _124 * _216;
    float _252 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _238);
    float _254 = -_236;
    float _256 = fma((*spvDescriptorSet0.vp_c8)._m0[1].y, (*spvDescriptorSet0.vp_c8)._m0[28].z, _254);
    bool _258 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _260 = isnan(0.0);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _266 = _262 || _264;
    float _268 = _212 * 2.0;
    float _270 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _252);
    float _272 = exp2(_250);
    int _274 = 0;
    float _276 = _212;
    if (_222)
    {
        _274 = 0;
    }
    int _278 = _274;
    float _280 = _218 * 2.0;
    float _282 = _212 + _218;
    int _284 = 0;
    int _286 = _278;
    float _288 = _218;
    if (_222)
    {
        _284 = 0;
    }
    int _290 = _284;
    float _292 = 0.0;
    int _294 = _290;
    if (_222)
    {
        _292 = 1.0;
    }
    float _296 = _292;
    float _298 = _282 + (-1.0);
    float _300 = floor(_268);
    float _302 = 0.0;
    float _304 = _296;
    if (_222)
    {
        _302 = _212;
    }
    float _306 = _302;
    float _308 = floor(_280);
    float _310 = (*spvDescriptorSet0.vp_c8)._m0[1].y * (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _312 = -_272;
    float _314 = _312 + 1.0;
    float _316 = 0.0;
    float _318 = _248;
    float _320 = _306;
    if (_222)
    {
        _316 = _248;
    }
    float _322 = _316;
    float _324 = -_310;
    float _326 = fma((*spvDescriptorSet0.vp_c8)._m0[1].x, (*spvDescriptorSet0.vp_c8)._m0[28].y, _324);
    float _328 = fma(_298, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _330 = _300 > 0.0;
    bool _332 = _300 >= 0.0;
    bool _334 = isnan(_300);
    bool _336 = _332 || _334;
    bool _338 = isnan(0.0);
    bool _340 = _336 || _338;
    float _342 = _234 * _234;
    bool _344 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _346 = isnan(1.0);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _352 = _348 || _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _356 = 1.0 + _354;
    float _358 = _266 ? _314 : 0.0;
    float _360 = fma(_256, _256, _342);
    bool _362 = _308 > 0.0;
    float _364 = 1.0 / _356;
    bool _366 = _308 >= 0.0;
    bool _368 = isnan(_308);
    bool _370 = _366 || _368;
    bool _372 = isnan(0.0);
    bool _374 = _370 || _372;
    float _376 = fma(_326, _326, _360);
    float _378 = _226 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _380 = _226 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _382 = 0.0;
    float _384 = _322;
    int _386 = as_type<int>(_328);
    if (_222)
    {
        _382 = _322;
    }
    float _388 = _382;
    float _390 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[4].x, _378);
    float _392 = rsqrt(_376);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[6].x, _380);
    float _396 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[4].z, _390);
    float _398 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[6].z, _394);
    float _400 = _396 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _402 = _388;
    if (!_222)
    {
        float _404 = in.m_59.x;
        float _406 = _212 * 3.1415927410125732421875;
        float _408 = _406 * 0.15915493667125701904296875;
        float _410 = _408 * 6.283185482025146484375;
        float _412 = sin(_410);
        float _414 = _404 * 3.1415927410125732421875;
        float _416 = _414 * 0.15915493667125701904296875;
        float _418 = _416 * 6.283185482025146484375;
        float _420 = sin(_418);
        _318 = _404;
        _402 = _212;
        _304 = 1.2345600128173828125;
        _294 = 2;
        _286 = 1;
        _384 = _420;
        _320 = _412;
    }
    float _422 = _318;
    float _424 = _402;
    float _426 = _304;
    int _428 = _294;
    int _430 = _286;
    float _432 = _384;
    float _434 = _320;
    float _436 = _422 * 2.0;
    float _438 = _358 * _364;
    float _440 = _398 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _442 = floor(_436);
    int _444 = _340 ? 0 : 1;
    float _446 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _448 = _400 + _446;
    int _450 = _374 ? 0 : 1;
    float _452 = -_440;
    float _454 = _452 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _456 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _458 = _456 != 0;
    int _460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _462 = _460 != 0;
    int _464 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _466 = _464 != 0;
    int _468 = ~_444;
    int _470 = _468 + 1;
    int _472 = _470 + 1;
    float _474 = abs(_448);
    float _476 = abs(_454);
    float _478 = precise::max(_474, _476);
    bool _480 = !_458;
    int _482 = _480 ? 0 : 1;
    int _484 = ~_450;
    int _486 = _484 + 1;
    int _488 = _486 + 1;
    int _490 = _472;
    int _492 = _488;
    float _494 = _448;
    float _496 = _426;
    float _498 = _424;
    if (!_330)
    {
        int _500 = ~_444;
        int _502 = _500 + 1;
        _490 = _502;
    }
    int _504 = _490;
    if (!_362)
    {
        int _506 = ~_450;
        int _508 = _506 + 1;
        _492 = _508;
    }
    int _510 = _492;
    float _512 = rsqrt(_270);
    bool _514 = _478 >= 16.0;
    float _516 = _256 * _392;
    int _518 = abs(_482);
    float _520 = _422 + _218;
    bool _522 = _442 > 0.0;
    float _524 = _234 * _392;
    bool _526 = _442 >= 0.0;
    bool _528 = isnan(_442);
    bool _530 = _526 || _528;
    bool _532 = isnan(0.0);
    bool _534 = _530 || _532;
    float _536 = _326 * _392;
    bool _538 = !_466;
    int _540 = _538 ? 0 : 1;
    float _542 = _520 + (-1.0);
    float _544 = float(_510);
    float _546 = _212 + _422;
    int _548 = abs(_540);
    float _550 = fma(_542, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _552 = _546 + (-1.0);
    float _554 = float(_518);
    if (_514)
    {
        float _556 = _448 * 0.0625;
        _494 = _556;
    }
    float _558 = _494;
    float _560 = fma(_552, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _562 = float(_504);
    float _564 = _554 * _544;
    float _566 = float(_548);
    float _568 = _512 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _570 = !_462;
    int _572 = _570 ? 0 : 1;
    float _574 = _564 * (-2.0);
    int _576 = _534 ? 0 : 1;
    float _578 = _566 * _562;
    int _580 = abs(_572);
    float _582 = _524 * _524;
    int _584 = ~_576;
    int _586 = _584 + 1;
    int _588 = _586 + 1;
    float _590 = fma(_560, _574, _560);
    int _592 = _588;
    if (!_522)
    {
        int _594 = ~_576;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = fma(_516, _516, _582);
    float _602 = float(_580);
    float _604 = _422 + (-0.5);
    float _606 = float(_598);
    float _608 = _454 * 0.0625;
    float _610 = abs(_558);
    bool _612 = _610 != 0.0;
    bool _614 = isnan(_610);
    bool _616 = _612 || _614;
    bool _618 = isnan(0.0);
    bool _620 = _616 || _618;
    float _622 = fma(_536, _536, _600);
    bool _624 = !_352;
    float _626 = _624 ? _124 : _438;
    float _628 = _604 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _630 = _514 ? _608 : _454;
    float _632 = _602 * _606;
    float _634 = _568 * (-0.699999988079071044921875);
    float _636 = fma(_626, _590, _628);
    float _638 = abs(_630);
    bool _640 = _638 == 0.0;
    bool _642 = !_620;
    bool _644 = _640 && _642;
    float _646 = in.m_61.x;
    float _648 = in.m_61.y;
    float _650 = in.m_61.z;
    float _652 = _634 * 0.15915493667125701904296875;
    float _654 = _636 * 0.15915493667125701904296875;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _658 = _656 != 0;
    int _660 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _662 = _660 != 0;
    float _664 = _578 * (-2.0);
    float _666 = _632 * (-2.0);
    float _668 = abs(_630);
    bool _670 = _668 == 0.0;
    float _672 = _652 * 6.283185482025146484375;
    float _674 = cos(_672);
    bool _676 = !_662;
    int _678 = _676 ? 0 : 1;
    float _680 = fma(_550, _664, _550);
    float _682 = fma(_328, _666, _328);
    float _684 = _218 + (-0.5);
    bool _686 = _662;
    if (_644)
    {
        bool _688 = as_type<int>(_630) >= 0;
        _686 = _688;
    }
    bool _690 = _686;
    float _692 = _212 + (-0.5);
    bool _694 = !_658;
    int _696 = _694 ? 0 : 1;
    float _698 = _654 * 6.283185482025146484375;
    float _700 = sin(_698);
    float _702 = _684 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _704 = _692 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    if (_644)
    {
        int _706 = _690 ? 0 : 1078530011;
        _386 = _706;
    }
    int _708 = _386;
    int _710 = _708;
    if (_644)
    {
        int _712 = int(0x80000000) & as_type<int>(_558);
        int _714 = _708 | _712;
        _710 = _714;
    }
    int _716 = _710;
    float _718 = _654 * 6.283185482025146484375;
    float _720 = cos(_718);
    int _722 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _724 = _722 != 0;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _728 = _726 != 0;
    bool _730 = !_724;
    int _732 = _730 ? 0 : 1;
    float _734 = rsqrt(_622);
    bool _736 = !_728;
    int _738 = _736 ? 0 : 1;
    float _740 = fma(_626, _680, _702);
    float _742 = fma(_626, _682, _704);
    bool _744 = !_620;
    bool _746 = _744 && _670;
    int _748 = _724 ? (-1) : 0;
    int _750 = _716;
    float _752 = as_type<float>(_716);
    bool _754 = _690;
    if (!_746)
    {
        float _756 = abs(_558);
        bool _758 = _756 != as_type<float>(0x7f800000u /* inf */);
        bool _760 = isnan(_756);
        bool _762 = _758 || _760;
        bool _764 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _766 = _762 || _764;
        float _768 = abs(_630);
        bool _770 = _768 == as_type<float>(0x7f800000u /* inf */);
        float _772 = abs(_630);
        bool _774 = _772 == as_type<float>(0x7f800000u /* inf */);
        bool _776 = !_766;
        bool _778 = _774 && _776;
        _754 = _766;
        if (_778)
        {
            bool _780 = as_type<int>(_630) >= 0;
            _748 = _780 ? (-1) : 0;
        }
        int _782 = _748;
        if (_778)
        {
            _750 = 1075235812;
        }
        int _784 = _750;
        int _786 = _784;
        if (_778)
        {
            int _788 = ~_782;
            int _790 = (_788 != 0) ? _784 : 1061752795;
            _786 = _790;
        }
        int _792 = _786;
        float _794 = as_type<float>(_792);
        if (_778)
        {
            int _796 = int(0x80000000) & as_type<int>(_558);
            int _798 = _792 | _796;
            _794 = as_type<float>(_798);
        }
        float _800 = _794;
        bool _802 = !_766;
        bool _804 = _802 && _770;
        _752 = _800;
        if (!_804)
        {
            float _806 = abs(_558);
            float _808 = abs(_630);
            float _810 = precise::max(_806, _808);
            float _812 = abs(_558);
            float _814 = abs(_630);
            float _816 = precise::min(_812, _814);
            float _818 = 1.0 / _810;
            float _820 = abs(_558);
            float _822 = abs(_630);
            bool _824 = _820 > _822;
            bool _826 = as_type<int>(_630) >= 0;
            float _828 = _816 * _818;
            float _830 = abs(_558);
            float _832 = abs(_630);
            float _834 = _830 + _832;
            float _836 = _828 * _828;
            bool _838 = _834 > as_type<float>(0x7f800000u /* inf */);
            bool _840 = isnan(_834);
            bool _842 = _838 || _840;
            bool _844 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _846 = _842 || _844;
            float _848 = _836 + 11.33538818359375;
            float _850 = fma(_836, _848, 28.84246826171875);
            float _852 = fma(_836, _850, 19.6966705322265625);
            float _854 = fma(_836, -0.82336294651031494140625, -5.674867153167724609375);
            float _856 = fma(_836, _854, -6.565555095672607421875);
            float _858 = 1.0 / _852;
            float _860 = _836 * _856;
            float _862 = _828 * _860;
            float _864 = fma(_862, _858, _828);
            int _866 = as_type<int>(_558) & int(0x80000000);
            float _868 = _864;
            _752 = _834;
            _754 = _846;
            if (_824)
            {
                float _870 = -_864;
                float _872 = _870 + 1.57079637050628662109375;
                _868 = _872;
            }
            float _874 = _868;
            int _876 = as_type<int>(_874);
            if (!_826)
            {
                float _878 = -_874;
                float _880 = _878 + 3.1415927410125732421875;
                _876 = as_type<int>(_880);
            }
            int _882 = _876;
            if (!_846)
            {
                int _884 = _866 | _882;
                _752 = as_type<float>(_884);
            }
        }
    }
    float _886 = _752;
    bool _888 = _754;
    float _890 = -_886;
    float _892 = _742 + _890;
    float _894 = _740 * 0.15915493667125701904296875;
    float _896 = _226 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _898 = _892 * 0.15915493667125701904296875;
    int _900 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1048576;
    bool _902 = _900 != 0;
    float _904 = in.m_63.x;
    float _906 = in.m_63.y;
    float _908 = in.m_63.z;
    float _910 = _894 * 6.283185482025146484375;
    float _912 = cos(_910);
    float _914 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[5].x, _896);
    float _916 = _646 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _918 = _648 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _920 = _650 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _922 = _898 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[193].y;
    float _928 = fma(_926, 0.100000001490116119384765625, 0.100000001490116119384765625);
    float _930 = fma(_228, (*spvDescriptorSet0.vp_c10)._m0[5].z, _914);
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[193].y;
    bool _934 = _888;
    if (!_902)
    {
        _242 = 0.0;
    }
    float _936 = _242;
    float _938 = _930 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _940 = _936;
    if (!_902)
    {
        _932 = 0.0;
    }
    float _942 = _932;
    float _944 = _898 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = _942;
    if (!_902)
    {
        _244 = 0.0;
    }
    float _950 = _244;
    bool _952 = !_902;
    float _954 = _950;
    if (!_952)
    {
        float _956 = -_938;
        float _958 = _956 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _960 = -_400;
        float _962 = _960 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _964 = _958 * _958;
        float _966 = fma(_962, _962, _964);
        float _968 = fma(_454, _454, _966);
        float _970 = rsqrt(_968);
        float _972 = _970 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
        float _974 = _962 * _972;
        float _976 = _958 * _972;
        float _978 = _454 * _972;
        _948 = _976;
        _940 = _974;
        _954 = _978;
    }
    float _980 = _948;
    float _982 = _940;
    float _984 = _954;
    float _986 = _422 * 6.283185482025146484375;
    float _988 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _904);
    float _990 = _916 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _992 = _918 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _994 = fma(_124, 0.02999999932944774627685546875, _986);
    float _996 = _894 * 6.283185482025146484375;
    float _998 = sin(_996);
    float _1000 = _988 * _990;
    float _1002 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _908);
    float _1004 = _994 * 0.15915493667125701904296875;
    float _1006 = _920 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1008 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _906);
    float _1010 = _720 * _924;
    float _1012 = _720 * _946;
    float _1014 = _1002 * _1006;
    float _1016 = _1004 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = _700 * _946;
    float _1022 = _1008 * _992;
    float _1024 = _700 * _924;
    float _1026 = _720 * _912;
    float _1028 = _700 * _912;
    float _1030 = _946 * _912;
    float _1032 = -_1010;
    float _1034 = fma(_998, _1020, _1032);
    float _1036 = fma(_998, _1012, _1024);
    float _1038 = -_1020;
    float _1040 = fma(_998, _1010, _1038);
    float _1042 = fma(_998, _1024, _1012);
    float _1044 = _1026 * _1022;
    float _1046 = -_1022;
    float _1048 = _998 * _1046;
    float _1050 = _924 * _912;
    float _1052 = _652 * 6.283185482025146484375;
    float _1054 = sin(_1052);
    float _1056 = -_168;
    float _1058 = _1056 + (*spvDescriptorSet0.vp_c9)._m0[193].x;
    float _1060 = fma(_1036, _1000, _1044);
    float _1062 = fma(_1030, _1000, _1048);
    float _1064 = _1028 * _1022;
    float _1066 = _1018 * _1058;
    float _1068 = fma(_1040, _1014, _1060);
    float _1070 = fma(_1050, _1014, _1062);
    float _1072 = fma(_1034, _1000, _1064);
    float _1074 = _928 * _1066;
    float _1076 = _938 + _1068;
    float _1078 = _400 + _1070;
    float _1080 = _516 * _734;
    float _1082 = _524 * _734;
    float _1084 = -_674;
    float _1086 = _1084 + 1.0;
    float _1088 = _536 * _734;
    float _1090 = fma(_516, _1074, _1078);
    float _1092 = fma(_1042, _1014, _1072);
    float _1094 = fma(_524, _1074, _1076);
    float _1096 = _1080 * _1086;
    float _1098 = _1088 * _1054;
    float _1100 = _1082 * _1086;
    float _1102 = _1080 * _1054;
    float _1104 = _1082 * _1054;
    float _1106 = fma(_1082, _1096, _1098);
    float _1108 = fma(_1082, _1100, _674);
    float _1110 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1112 = _1094 + _1110;
    float _1114 = _440 + _1092;
    float _1116 = -_1098;
    float _1118 = fma(_1082, _1096, _1116);
    float _1120 = fma(_1080, _1096, _674);
    float _1122 = -_1104;
    float _1124 = fma(_1088, _1096, _1122);
    float _1126 = fma(_1088, _1096, _1104);
    float _1128 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1130 = _1090 + _1128;
    float _1132 = _1108 * _1112;
    float _1134 = fma(_536, _1074, _1114);
    float _1136 = fma(_1088, _1100, _1102);
    float _1138 = _1118 * _1112;
    float _1140 = -_1102;
    float _1142 = fma(_1088, _1100, _1140);
    float _1144 = fma(_1106, _1130, _1132);
    float _1146 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1148 = _1134 + _1146;
    float _1150 = fma(_1120, _1130, _1138);
    float _1152 = _1088 * _1088;
    float _1154 = _1136 * _1112;
    float _1156 = fma(_1142, _1148, _1144);
    float _1158 = fma(_1126, _1148, _1150);
    float _1160 = fma(_1086, _1152, _674);
    float _1162 = fma(_1124, _1130, _1154);
    float _1164 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1166 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _1168 = _1156 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1170 = fma(_1160, _1148, _1162);
    float _1172 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1164);
    float _1174 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1166);
    float _1176 = fma(_1158, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1168);
    float _1178 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1172);
    float _1180 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1174);
    float _1182 = fma(_1170, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1176);
    float _1184 = _1178 * (*spvDescriptorSet0.vp_c7)._m0[0].y;
    float _1186 = _1180 * (*spvDescriptorSet0.vp_c7)._m0[0].x;
    float _1188 = _1182 * (*spvDescriptorSet0.vp_c7)._m0[0].z;
    float _1190 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1192 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1194 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1190);
    float _1196 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1192);
    float _1198 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1194);
    float _1200 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1196);
    float _1202 = _1198 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _1206 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1208 = _1202 + _1206;
    float _1210 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1212 = _1204 + _1210;
    float _1214 = _1208 * _1208;
    float _1216 = fma(_1212, _1212, _1214);
    float _1218 = _1184 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1220 = sqrt(_1216);
    float _1222 = fma(_1186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1218);
    float _1224 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1222);
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    bool _1228 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1230 = _1224;
    float _1232 = _1202;
    float _1234 = _1204;
    float _1236 = _1188;
    float _1238 = _982;
    float _1240 = _1212;
    float _1242 = _1208;
    if (!_1228)
    {
        _1230 = _1202;
    }
    float _1244 = _1230;
    float _1246 = _1244;
    if (!_1228)
    {
        _1232 = _1226;
    }
    float _1248 = _1232;
    bool _1250 = !_1228;
    float _1252 = _1248;
    if (!_1250)
    {
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1256 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1258 = _1220 + _1256;
        float _1260 = rsqrt(_1216);
        float _1262 = _1258 * _1254;
        float _1264 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1266 = _1262 * 0.15915493667125701904296875;
        float _1268 = _1266 * 6.283185482025146484375;
        float _1270 = sin(_1268);
        float _1272 = _1266 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        float _1276 = fma(_1270, _1264, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1278 = _1260 * _1276;
        float _1280 = _1274 + (-1.0);
        float _1282 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = fma(_1212, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1286 = fma(_1208, _1278, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1288 = fma(_1226, _1274, _1282);
        _1252 = _1288;
        _1234 = _1284;
        _1246 = _1286;
        _1236 = _1266;
    }
    float _1290 = _1252;
    float _1292 = _1234;
    float _1294 = _1246;
    float _1296 = _1236;
    float _1298 = _980 + _1290;
    float _1300 = _982 + _1292;
    float _1302 = _984 + _1294;
    float _1304 = _400 + _982;
    float _1306 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1308 = _1298 + _1306;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1312 = _1300 + _1310;
    float _1314 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1316 = _1302 + _1314;
    float _1318 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1320 = _1308 * _1308;
    float _1322 = _440 + _984;
    float _1324 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1318);
    float _1326 = fma(_1312, _1312, _1320);
    float _1328 = fma(_1316, _1316, _1326);
    float _1330 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1332 = rsqrt(_1328);
    float _1334 = sqrt(_1328);
    float _1336 = _1332 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1338 = _1312 * _1336;
    float _1340 = _1316 * _1336;
    float _1342 = _1338 * _1338;
    float _1344 = _1340 * _1340;
    float _1346 = _1342 + _1344;
    float _1348 = sqrt(_1346);
    bool _1350 = _1348 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1352 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1354 = _1348 + _1352;
    float _1356 = _1296;
    float _1358 = _1354;
    bool _1360 = _1350;
    float _1362 = _1308;
    if (_1350)
    {
        float _1364 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1356 = _1364;
    }
    float _1366 = _1356;
    if (!_1350)
    {
        _1238 = _1344;
    }
    float _1368 = _1238;
    float _1370 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1372 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1370);
    float _1374 = _1368;
    if (_1350)
    {
        float _1376 = rsqrt(_1346);
        _1240 = _1376;
    }
    float _1378 = _1240;
    float _1380 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1372);
    float _1382 = _1380 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1384 = _1378;
    if (_1350)
    {
        float _1386 = _1354 * _1366;
        _1358 = _1386;
    }
    float _1388 = _1358;
    if (_1350)
    {
        float _1390 = _1388 * 0.15915493667125701904296875;
        _1242 = _1390;
    }
    float _1392 = _1242;
    float _1394 = _1290;
    if (_1350)
    {
        float _1396 = _1392 * 6.283185482025146484375;
        float _1398 = sin(_1396);
        _1394 = _1398;
    }
    float _1400 = _1394;
    float _1402 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1404 = precise::max(0.0, _1402);
    float _1406 = _1226;
    float _1408 = _1404;
    float _1410 = _1402;
    if (_1350)
    {
        float _1412 = _1392 * 6.283185482025146484375;
        float _1414 = cos(_1412);
        _1406 = _1414;
    }
    float _1416 = _1406;
    float _1418 = -_1336;
    float _1420 = -_1404;
    float _1422 = fma(_1308, _1418, _1420);
    if (_1350)
    {
        float _1424 = _1422 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1408 = _1424;
    }
    float _1426 = _1408;
    float _1428 = _1400;
    float _1430 = _1426;
    if (_1350)
    {
        float _1432 = fma(_1400, _1426, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1428 = _1432;
    }
    float _1434 = _1428;
    float _1436 = _1434;
    if (!_1350)
    {
        _1430 = _1422;
    }
    float _1438 = _1430;
    float _1440 = _1438;
    float _1442 = _1416;
    if (_1350)
    {
        float _1444 = _1416 + (-1.0);
        _1410 = _1444;
    }
    float _1446 = _1410;
    float _1448 = 0.0;
    float _1450 = _1446;
    if (_1350)
    {
        float _1452 = _1378 * _1434;
        _1448 = _1452;
    }
    float _1454 = _1448;
    if (!_1350)
    {
        _1436 = _1338;
    }
    float _1456 = _1436;
    float _1458 = _1456;
    if (_1350)
    {
        float _1460 = _1446 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1384 = _1460;
    }
    float _1462 = _1384;
    if (_1350)
    {
        float _1464 = _1338 * _1454;
        _1458 = _1464;
    }
    float _1466 = _1458;
    if (!_1350)
    {
        _1450 = _1340;
    }
    float _1468 = _1450;
    float _1470 = _1468;
    if (_1350)
    {
        float _1472 = _1340 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (_1350)
    {
        float _1476 = fma(_1422, _1416, _1462);
        _1440 = _1476;
    }
    float _1478 = _1440;
    if (!_1350)
    {
        _1442 = _1342;
    }
    float _1480 = _1442;
    float _1482 = _1480;
    if (_1350)
    {
        float _1484 = _1466 * _1466;
        _1482 = _1484;
    }
    float _1486 = _1482;
    if (_1350)
    {
        float _1488 = _1474 * _1474;
        _1374 = _1488;
    }
    float _1490 = _1374;
    float _1492 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1494 = _1298 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1496 = fma(_1478, _1478, _1486);
    float _1498 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1492);
    float _1500 = fma(_1300, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1494);
    float _1502 = _1496 + _1490;
    float _1504 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1498);
    float _1506 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1500);
    float _1508 = fma(_1304, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1510 = fma(_1322, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1512 = rsqrt(_1502);
    float _1514 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1516 = fma(_1334, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1514);
    float _1518 = precise::clamp(_1516, 0.0, 1.0);
    float _1520 = _1504 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1522 = _1506 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1524 = _1382 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1526 = -_1518;
    float _1528 = _1526 + 1.0;
    float _1530 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1532 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1324);
    float _1534 = floor(_1508);
    float _1536 = -_1524;
    float _1538 = fma(_1536, _1330, 1.0);
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1530);
    float _1542 = _1532 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1544 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1540);
    float _1546 = abs(_1528);
    float _1548 = log2(_1546);
    float _1550 = _1512 * _1466;
    float _1552 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1544);
    float _1554 = _1512 * _1478;
    float _1556 = _1512 * _1474;
    float _1558 = _1550 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1560 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1562 = floor(_1510);
    float _1564 = -_1558;
    float _1566 = fma(_1554, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1564);
    float _1568 = -_1534;
    float _1570 = _1508 + _1568;
    float _1572 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1574 = -_1556;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1566);
    float _1578 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1560);
    float _1580 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1582 = fma(_1576, -0.5, 0.5);
    float _1584 = log2(_1538);
    float _1586 = fma(_1576, 0.5, 0.5);
    float _1588 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1578);
    float _1590 = -_1562;
    float _1592 = _1510 + _1590;
    float _1594 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1572);
    float _1596 = exp2(_1580);
    float _1598 = _1554 + 1.0;
    float _1600 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1594);
    float _1602 = 1.0 / _1552;
    float _1604 = fma(_1586, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1606 = _1584 * 0.693147182464599609375;
    float _1608 = fma(_1586, _1604, -0.212114393711090087890625);
    float _1610 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1612 = sqrt(_1582);
    float _1614 = -_1554;
    float _1616 = fma(_1596, _1598, _1614);
    float _1618 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1588);
    float _1620 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1600);
    float _1622 = fma(_1586, _1608, 1.570728778839111328125);
    float _1624 = fma(_1616, 0.5, 0.5);
    float _1626 = _1618 * _1602;
    float _1628 = _1620 * _1602;
    float _1630 = fma(_1626, 0.5, 0.5);
    float _1632 = fma(_1628, -0.5, 0.5);
    float _1634 = _1612 * 0.636619746685028076171875;
    float2 _5955 = float2(_1570, _1592);
    float _1636 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5955, float2(0.0), isnan(_5955)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5955, float2(0.0), isnan(_5955)), level(0.0)).x;
    float3 _5966 = float3(_1630, _1632, _1610);
    float _1638 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5966, float3(0.0), isnan(_5966)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5966, float3(0.0), isnan(_5966)), level(0.0)).x;
    float _1640 = -_1622;
    float _1642 = fma(_1634, _1640, 1.0);
    float3 _5982 = float3(_1630, _1632, _1610);
    float4 _1645 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5982, float3(0.0), isnan(_5982)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5982, float3(0.0), isnan(_5982)), level(0.0)).xyzw;
    float _1647 = _1645.x;
    float _1649 = _1645.y;
    float _1651 = _1645.z;
    float _1653 = _1645.w;
    float2 _5998 = float2(_1642, _1624);
    float3 _1657 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5998, float2(0.0), isnan(_5998)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5998, float2(0.0), isnan(_5998)), level(0.0)).xyz;
    float _1659 = _1657.x;
    float _1661 = _1657.y;
    float _1663 = _1657.z;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1667 = _1665 != 0;
    float _1669 = in.m_55.x;
    int _1671 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1673 = _1671 != 0;
    float _1675 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1677 = int(_1675);
    bool _1679 = _218 > 0.5;
    float _1681 = in.m_59.w;
    float _1683 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _1685 = _212 > 0.5;
    out.m_65.x = _180;
    out.m_65.y = _184;
    out.m_65.z = _188;
    out.m_65.w = _182;
    float _1687 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1689 = int(_1687);
    float _1691 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1693 = _1691 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1695 = 0;
    float _1697 = _1610;
    float _1699 = _1618;
    float _1701 = _1620;
    if (_1667)
    {
        float _1703 = in.m_59.x;
        _1695 = as_type<int>(_1703);
    }
    int _1705 = _1695;
    float _1707 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1709 = _1707 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    int _1711 = as_type<int>(_1616);
    if (_1673)
    {
        float _1713 = in.m_59.z;
        _1711 = as_type<int>(_1713);
    }
    int _1715 = _1711;
    float _1717 = 1.0 / _1693;
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1721 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1723 = _1721 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1725 = -_168;
    float _1727 = _1725 + 1.0;
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1731 = _1729 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1733 = _1669;
    if (!_1673)
    {
        _1697 = _1669;
    }
    float _1735 = _1697;
    float _1737 = 1.0 / _1709;
    int _1739 = _1679 ? as_type<int>(_1727) : as_type<int>(_168);
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1743 = _1741 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    int _1745 = _1685 ? as_type<int>(_1727) : as_type<int>(_168);
    out.m_67.x = _1312;
    out.m_67.y = _1308;
    out.m_67.z = _1316;
    bool _1747 = _1681 > 0.5;
    int _1749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1751 = _1749 != 0;
    float _1753 = 1.0 / _1723;
    int _1755 = _1747 ? as_type<int>(_1727) : as_type<int>(_168);
    float _1757 = _212 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1759 = _1705;
    float _1761 = _1735;
    if (_1667)
    {
        bool _1763 = as_type<float>(_1705) > 0.5;
        _1360 = _1763;
    }
    bool _1765 = _1360;
    if (_1673)
    {
        float _1767 = -_1669;
        float _1769 = _1767 + 1.0;
        _1759 = as_type<int>(_1769);
    }
    int _1771 = _1759;
    float _1773 = _1751 ? as_type<float>(_1739) : _168;
    float _1775 = fma(_1757, -2.0, _1719);
    int _1777 = _1715;
    int _1779 = as_type<int>(_1775);
    if (_1673)
    {
        bool _1781 = as_type<float>(_1715) > 0.5;
        _934 = _1781;
    }
    bool _1783 = _934;
    if (_1667)
    {
        float _1785 = -_1669;
        float _1787 = _1785 + 1.0;
        _1777 = as_type<int>(_1787);
    }
    int _1789 = _1777;
    float _1791 = 1.0 / _1731;
    if (_1673)
    {
        float _1793 = _1783 ? as_type<float>(_1771) : _1669;
        _1761 = _1793;
    }
    float _1795 = _1761;
    float _1797 = in.m_69.x;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1801 = _1799 != 0;
    float _1803 = fma(_1795, (*spvDescriptorSet0.vp_c9)._m0[85].x, -0.5);
    float _1805 = _1801 ? as_type<float>(_1739) : _168;
    float _1807 = 1.0 / _1743;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1811 = _1809 != 0;
    float _1813 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1815 = _1813 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1817 = float(uint(_1677));
    float _1819 = _1811 ? as_type<float>(_1745) : _168;
    bool _1821 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1823 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1825 = _1821 || _1823;
    bool _1827 = isnan(0.5);
    bool _1829 = _1825 || _1827;
    float _1831 = 1.0 / _1815;
    float _1833 = float(_1689);
    float _1835 = 0.0;
    float _1837 = _1797;
    if (!_1667)
    {
        _1835 = _1669;
    }
    float _1839 = _1835;
    float _1841 = _1839;
    if (_1667)
    {
        float _1843 = _1765 ? as_type<float>(_1789) : _1669;
        _1841 = _1843;
    }
    float _1845 = _1841;
    float _1847 = 1.0 / _1833;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1849;
    float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1855 = _1853 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    int _1857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1859 = _1857 != 0;
    float _1861 = _1851 * _1717;
    float _1863 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1863;
    float _1867 = _1855 * _1791;
    float _1869 = 1.0 / _1817;
    float _1871 = _1859 ? as_type<float>(_1755) : _168;
    float _1873 = _1865 * _1737;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1879 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1881 = _210 + _1879;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1885 = _1883 != 0;
    float _1887 = fma(_1871, (*spvDescriptorSet0.vp_c9)._m0[85].y, -0.5);
    float _1889 = _1877 * _1831;
    float _1891 = _124 * _1847;
    float _1893 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1895 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1893;
    float _1897 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _1901 = fma(_1861, _1881, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1905 = _1895 * _1807;
    float _1907 = _1899 * _1753;
    float _1909 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1911 = _210 + _1909;
    int _1913 = as_type<int>(_1869) + (-2);
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1917 = _210 + _1915;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1921 = _210 + _1919;
    float _1923 = fma(_1907, _1911, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1925 = trunc(_1891);
    int _1927 = int(_1925);
    float _1929 = fma(_1867, _1917, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1933 = _210 + _1931;
    bool _1935 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _1937 = isnan(_210);
    bool _1939 = _1935 || _1937;
    bool _1941 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _1943 = _1939 || _1941;
    float _1945 = float(_1943);
    float _1947 = fma(_1873, _1921, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _1949 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1951 = _1949 != 0;
    float _1953 = fma(_1905, _1933, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1957 = _1955 != 0;
    float _1959 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1963 = _1961 != 0;
    float _1965 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1967 = _210 + _1965;
    bool _1969 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1971 = isnan(_210);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1977 = _1973 || _1975;
    int _1979 = _1977 ? 1065353216 : 0;
    float _1981 = -_1945;
    float _1983 = _1981 + 1.0;
    float _1985 = fma(_1959, _1805, -0.5);
    float _1987 = fma(_1889, _1967, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    int _1989 = ~_1677;
    int _1991 = _1989 + 1;
    float _1993 = as_type<float>(_1979) * _1983;
    float _1995 = float(uint(_1927));
    float _1997 = -as_type<float>(_1979);
    float _1999 = _1997 + 1.0;
    bool _2001 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2003 = isnan(_210);
    bool _2005 = _2001 || _2003;
    bool _2007 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2009 = _2005 || _2007;
    float _2011 = float(_2009);
    int _2013 = _1979;
    float _2015 = _1987;
    if (_1885)
    {
        float _2017 = -_1669;
        float _2019 = _2017 + 1.0;
        _2013 = as_type<int>(_2019);
    }
    int _2021 = _2013;
    float _2023 = 0.0;
    if (!_1885)
    {
        _2023 = _1669;
    }
    float _2025 = _2023;
    float _2027 = as_type<float>(_1913) * _1995;
    bool _2029 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _2031 = isnan(_210);
    bool _2033 = _2029 || _2031;
    bool _2035 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _2037 = _2033 || _2035;
    float _2039 = float(_2037);
    float _2041 = -_2011;
    float _2043 = _2041 + 1.0;
    float _2045 = _2025;
    if (_1885)
    {
        float _2047 = _1685 ? as_type<float>(_2021) : _1669;
        _2045 = _2047;
    }
    float _2049 = _2045;
    float _2051 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2053 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2055 = isnan(_210);
    bool _2057 = _2053 || _2055;
    bool _2059 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2061 = _2057 || _2059;
    float _2063 = float(_2061);
    float _2065 = -_2039;
    float _2067 = _2065 + 1.0;
    float _2069 = _2039 * _1999;
    bool _2071 = _906 != 0.0;
    bool _2073 = isnan(_906);
    bool _2075 = _2071 || _2073;
    bool _2077 = isnan(0.0);
    bool _2079 = _2075 || _2077;
    float _2081 = _2011 * _2067;
    bool _2083 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2085 = isnan(_210);
    bool _2087 = _2083 || _2085;
    bool _2089 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2091 = _2087 || _2089;
    float _2093 = float(_2091);
    float _2095 = trunc(_2027);
    float _2097 = precise::max(_2095, 0.0);
    uint _2100 = uint(_2097);
    float _2102 = in.m_71.x;
    float _2104 = in.m_71.y;
    float _2106 = in.m_71.z;
    float _2108 = _2063 * _2043;
    float _2110 = -_2063;
    float _2112 = _2110 + 1.0;
    bool _2114 = _904 == 0.0;
    bool _2116 = !_2079;
    bool _2118 = _2114 && _2116;
    float _2120 = _2093 * _2112;
    bool _2122 = _210 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2124 = isnan(_210);
    bool _2126 = _2122 || _2124;
    bool _2128 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2130 = _2126 || _2128;
    float _2132 = float(_2130);
    float _2134 = -_2093;
    float _2136 = _2134 + 1.0;
    float _2138 = float(_1677);
    float _2140 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _2142 = _908 == 0.0;
    bool _2144 = _2142 && _2118;
    float _2146 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2148 = _2132 * _2136;
    float _2150 = _124 * _2138;
    int _2152 = _1991 * int(_2100);
    int _2154 = _2152 + _1927;
    float _2156 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2146);
    float _2158 = _2051 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2160 = _1901 * _2148;
    float _2162 = -_2132;
    float _2164 = _2162 + 1.0;
    float _2166 = float(uint(_2154));
    float _2168 = _2150 * _170;
    float _2170 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1775);
    float _2172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2174 = _2164;
    float _2176 = as_type<float>(_2100);
    float _2178 = _2172;
    if (_1951)
    {
        float _2180 = -_1669;
        float _2182 = _2180 + 1.0;
        _1779 = as_type<int>(_2182);
    }
    int _2184 = _1779;
    float _2186 = as_type<float>(_1913) * _2166;
    float _2188 = fma(_2158, _1819, -0.5);
    float _2190 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2156);
    float _2192 = fma(_2164, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2160);
    if (_2144)
    {
        _2174 = _2102;
    }
    float _2194 = _2174;
    float _2196 = _2140 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _2198 = trunc(_2186);
    float _2200 = precise::max(_2198, 0.0);
    uint _2202 = uint(_2200);
    float _2204 = _2194;
    if (_1951)
    {
        float _2206 = _1685 ? as_type<float>(_2184) : _1669;
        _1733 = _2206;
    }
    float _2208 = _1733;
    float _2210 = -_2170;
    float _2212 = fma(_2190, _2188, _2210);
    float _2214 = _424 * _426;
    int _2216 = ~_1677;
    int _2218 = _2216 + 1;
    float _2220 = fma(_2196, _1773, -0.5);
    if (_2144)
    {
        _496 = _2194;
    }
    float _2222 = _496;
    float _2224 = fma(_1929, _2120, _2192);
    float _2226 = _2222;
    if (!_2144)
    {
        _2204 = _2102;
    }
    float _2228 = _2204;
    float _2230 = floor(_2214);
    float _2232 = float(_1927);
    float _2234 = fma(_1947, _2108, _2224);
    bool _2236 = _428 != 2;
    float _2238 = _2228;
    if (!_2144)
    {
        float _2240 = fma(_904, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2228);
        _2226 = _2240;
    }
    float _2242 = _2226;
    bool _2244 = _2232 >= _2138;
    bool _2246 = isnan(_2232);
    bool _2248 = _2244 || _2246;
    bool _2250 = isnan(_2138);
    bool _2252 = _2248 || _2250;
    float _2254 = float(_2252);
    int _2256 = int(_2100) + int(_2202);
    float _2258 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _2260 = as_type<float>(_2202);
    if (_2144)
    {
        _2176 = _2104;
    }
    float _2262 = _2176;
    float _2264 = _2262;
    if (_2144)
    {
        _2260 = _2106;
    }
    float _2266 = _2260;
    int _2268 = _2218 * _2256;
    int _2270 = _2268 + _1927;
    float _2272 = _2266;
    if (_2144)
    {
        _498 = _2262;
    }
    float _2274 = _498;
    float _2276 = _2274;
    if (!_2144)
    {
        _2264 = _2104;
    }
    float _2278 = _2264;
    float _2280 = _2172 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2282 = uint(_2270) >= uint(_1677);
    float _2284 = trunc(_2254);
    int _2286 = int(_2284);
    if (_2144)
    {
        _2178 = _2266;
    }
    float _2288 = _2178;
    float _2290 = fma(_2280, _1845, -0.5);
    bool _2292 = !_2282;
    int _2294 = _2292 ? 0 : (-1);
    float _2296 = -_2230;
    float _2298 = _2214 + _2296;
    float _2300 = _2288;
    if (!_2144)
    {
        _2272 = _2106;
    }
    float _2302 = _2272;
    float _2304 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _2306 = ~_2256;
    int _2308 = _2306 + _2294;
    int _2310 = _2308 + 1;
    float _2312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2314 = _1677 == 0;
    float _2316 = _2138 * _2298;
    int _2318 = abs(_678);
    int _2320 = _1677 * _2310;
    int _2322 = _2320 + _1927;
    bool _2324 = !_1957;
    int _2326 = _2324 ? 0 : 1;
    float _2328 = fma(_2304, _2208, -0.5);
    float _2330 = trunc(_2316);
    int _2332 = int(_2330);
    int _2334 = ~_2286;
    int _2336 = _2334 + 1;
    int _2338 = _2336 + 1;
    if (!_2144)
    {
        float _2340 = fma(_906, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2278);
        _2276 = _2340;
    }
    float _2342 = _2276;
    bool _2344 = !_2314;
    int _2346 = _2344 ? _2322 : (-1);
    if (!_2144)
    {
        float _2348 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2302);
        _2300 = _2348;
    }
    float _2350 = _2300;
    bool _2352 = _430 != 1;
    int _2354 = abs(_2326);
    int _2356 = _2346 * _2338;
    int _2358 = _1677 + (-1);
    float _2360 = trunc(_2168);
    int _2362 = int(_2360);
    float _2364 = _2312 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _2366 = _422 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _2368 = _2286 * _2358;
    int _2370 = _2368 + _2356;
    float _2372 = fma(_2364, _2049, -0.5);
    int _2374 = abs(_732);
    int _2376 = _2332 * _2354;
    int _2378 = _2376 + _1927;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _2382 = _2370 * _2318;
    int _2384 = abs(_696);
    float _2386 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2388 = exp2(_1683);
    float _2390 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2386);
    float _2392 = _432 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2394 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _2396 = _2362 * _2384;
    int _2398 = _2396 + _2382;
    float _2400 = -_2380;
    float _2402 = fma(_2392, 2.0, _2400);
    int _2404 = abs(_738);
    float _2406 = fma(_1987, _2081, _2234);
    int _2408 = _2378 * _2374;
    int _2410 = _2408 + _2398;
    float _2412 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2414 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2394);
    float _2416 = _434 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2418 = -_2412;
    float _2420 = fma(_2366, 2.0, _2418);
    float _2422 = in.m_73.x;
    float _2424 = in.m_73.y;
    float _2426 = in.m_73.z;
    float _2428 = in.m_73.w;
    int _2430 = _2332 * _2404;
    int _2432 = _2430 + _2410;
    float _2434 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2436 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2438 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2434);
    float _2440 = float(uint(_2432));
    float _2442 = fma(_2416, -2.0, _2436);
    int _2444 = ~_1677;
    int _2446 = _2444 + 1;
    float _2448 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2450 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2452 = as_type<float>(_1913) * _2440;
    float _2454 = _2440;
    float _2456 = _2448;
    if (_2236)
    {
        _2015 = _422;
    }
    float _2458 = _2015;
    float _2460 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2448);
    float _2462 = _2458;
    if (!_2236)
    {
        _2462 = _218;
    }
    float _2464 = _2462;
    float _2466 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2450);
    if (!_2352)
    {
        _2454 = _218;
    }
    float _2468 = _2454;
    float _2470 = trunc(_2452);
    float _2472 = precise::max(_2470, 0.0);
    uint _2474 = uint(_2472);
    float _2476 = _2468;
    if (_2352)
    {
        _288 = _212;
    }
    float _2478 = _288;
    float _2480 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2438);
    if (_2352)
    {
        _2476 = _212;
    }
    float _2482 = _2476;
    float _2484 = -_124;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2402);
    if (_2236)
    {
        _2456 = _212;
    }
    float _2488 = _2456;
    float _2490 = _2422 * _2278;
    float _2492 = _2426 * _2228;
    float _2494 = _2424 * _2302;
    float _2496 = _2488;
    if (!_2236)
    {
        _2496 = _422;
    }
    float _2498 = _2496;
    float _2500 = -_2490;
    float _2502 = fma(_2424, _2228, _2500);
    float _2504 = -_2492;
    float _2506 = fma(_2422, _2302, _2504);
    float _2508 = -_2494;
    float _2510 = fma(_2426, _2278, _2508);
    float _2512 = fma(_1953, _2069, _2406);
    if (!_2352)
    {
        _2238 = _212;
    }
    float _2514 = _2238;
    float _2516 = _2506 * _2428;
    float _2518 = _2514;
    if (_2352)
    {
        _276 = _422;
    }
    float _2520 = _276;
    float _2522 = _2510 * _2428;
    if (_2352)
    {
        _2518 = _422;
    }
    float _2524 = _2518;
    float _2526 = _2502 * _2428;
    float _2528 = -_124;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2420);
    int _2532 = _2446 * int(_2474);
    int _2534 = _2532 + _2432;
    float _2536 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2390);
    float _2538 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2442);
    float _2540 = fma(_2480, _2290, _2530);
    float _2542 = fma(_2536, _2328, _2486);
    float _2544 = float(uint(_2534));
    float _2546 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2414);
    float _2548 = fma(_1923, _1993, _2512);
    float _2550 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2552 = as_type<float>(_1913) * _2544;
    float _2554 = -_2538;
    float _2556 = fma(_2546, _2220, _2554);
    float _2558 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2560 = _2478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2562 = float(uint(_2378));
    float _2564 = _2520 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2566 = trunc(_2552);
    float _2568 = precise::max(_2566, 0.0);
    uint _2570 = uint(_2568);
    float _2572 = fma(_2482, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2558);
    float _2574 = _2464 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2576 = _2498 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2578 = ~_1677;
    int _2580 = _2578 + 1;
    float _2582 = -_2550;
    float _2584 = fma(_2574, 2.0, _2582);
    float _2586 = _2556 + 0.5;
    float _2588 = fma(_1945, (*spvDescriptorSet0.vp_c9)._m0[137].x, _2548);
    int _2590 = ~_1677;
    int _2592 = _2590 + 1;
    float _2594 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2596 = _2588 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2598 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2600 = int(_2474) + int(_2570);
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2604 = _2542 + 0.5;
    float _2606 = fma(_2524, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2598);
    float _2608 = -_2594;
    float _2610 = fma(_2564, 2.0, _2608);
    float _2612 = fma(_2560, -2.0, _2602);
    float _2614 = as_type<float>(_1913) * _2562;
    int _2616 = _2580 * _2600;
    int _2618 = _2616 + _2432;
    out.m_75.x = _2604;
    out.m_75.y = _2586;
    float _2620 = -_124;
    float _2622 = fma(_2620, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2610);
    float _2624 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2466);
    float _2626 = trunc(_2614);
    float _2628 = precise::max(_2626, 0.0);
    uint _2630 = uint(_2628);
    bool _2632 = uint(_2618) >= uint(_1677);
    float _2634 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2606);
    float _2636 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2638 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2572);
    float _2640 = -_124;
    float _2642 = fma(_2640, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2584);
    bool _2644 = !_2632;
    int _2646 = _2644 ? 0 : (-1);
    float _2648 = fma(_2634, _1803, _2622);
    float _2650 = fma(_2576, -2.0, _2636);
    float _2652 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2460);
    int _2654 = ~_2600;
    int _2656 = _2654 + _2646;
    int _2658 = _2656 + 1;
    float _2660 = _2540 + 0.5;
    float _2662 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2650);
    float _2664 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2612);
    float _2666 = fma(_2652, _2372, _2642);
    int _2668 = _1677 * _2658;
    int _2670 = _2668 + _2432;
    float _2672 = _938 + _980;
    int _2674 = _2592 * int(_2630);
    int _2676 = _2674 + _2378;
    float _2678 = -_2664;
    float _2680 = fma(_2638, _1887, _2678);
    float _2682 = _2648 + 0.5;
    bool _2684 = !_2314;
    int _2686 = _2684 ? _2670 : (-1);
    float _2688 = -_2662;
    float _2690 = fma(_2624, _1985, _2688);
    float _2692 = float(uint(_2676));
    float _2694 = _2680 + 0.5;
    int _2696 = _2686 >> 31;
    float _2698 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    int _2700 = _2686 & 3;
    bool _2702 = _2700 != 0;
    float _2704 = as_type<float>(_1913) * _2692;
    int _2706 = _2696 & 3;
    float _2708 = _2212 + 0.5;
    int _2710 = _2686 & 3;
    float _2712 = trunc(_2704);
    float _2714 = precise::max(_2712, 0.0);
    uint _2716 = uint(_2714);
    int _2718 = _2686 + _2706;
    float _2720 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2698);
    float _2722 = _2672 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    out.m_77.x = _2660;
    out.m_77.y = _2708;
    out.m_77.z = _2682;
    out.m_77.w = _2694;
    int _2724 = _2718 >> 2;
    float _2726 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2720);
    float _2728 = fma(_1304, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2722);
    bool _2730 = uint(_2710) > 1u;
    float _2732 = _1028 * _2516;
    int _2734 = _2724 << 4;
    int _2736 = _2734 + 512;
    float _2738 = _2726 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2740 = fma(_1322, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2728);
    float _2742 = _1026 * _2516;
    float _2744 = 1.0 / _2738;
    float _2746 = _2740 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    int _2748 = _2702 ? 0 : 1;
    uint _2750 = uint(int(uint(_2736) >> uint(2)));
    uint _2752 = uint(int(uint(int(_2750)) >> uint(2)));
    int _2754 = int(_2750) & 3;
    float _2756 = (*spvDescriptorSet0.vp_c9)._m0[int(_2752)][_2754];
    int _2758 = int(_2750) + 1;
    uint _2760 = uint(int(uint(_2758) >> uint(2)));
    int _2762 = _2758 & 3;
    float _2764 = (*spvDescriptorSet0.vp_c9)._m0[int(_2760)][_2762];
    int _2766 = ~_1677;
    int _2768 = _2766 + 1;
    float _2770 = _2746 + _2738;
    int _2772 = ~_2748;
    int _2774 = _2772 + 1;
    int _2776 = _2774 + 1;
    float _2778 = _2666 + 0.5;
    float _2780 = _2690 + 0.5;
    int _2782 = _2776;
    if (!_2730)
    {
        int _2784 = ~_2748;
        int _2786 = _2784 + 1;
        _2782 = _2786;
    }
    int _2788 = _2782;
    int _2790 = _2736 + 8;
    uint _2792 = uint(int(uint(_2790) >> uint(2)));
    uint _2794 = uint(int(uint(int(_2792)) >> uint(2)));
    int _2796 = int(_2792) & 3;
    float _2798 = (*spvDescriptorSet0.vp_c9)._m0[int(_2794)][_2796];
    int _2800 = int(_2792) + 1;
    uint _2802 = uint(int(uint(_2800) >> uint(2)));
    int _2804 = _2800 & 3;
    float _2806 = (*spvDescriptorSet0.vp_c9)._m0[int(_2802)][_2804];
    bool _2808 = _2710 != 3;
    float _2810 = fma(_1036, _2522, _2742);
    int _2812 = int(_2630) + int(_2716);
    float _2814 = fma(_1034, _2522, _2732);
    float _2816 = _2770 * _2744;
    float _2818 = _2816 * 0.5;
    float _2820 = -_2516;
    float _2822 = _998 * _2820;
    bool _2824 = uint(_2710) >= 2u;
    int _2826 = _2768 * _2812;
    int _2828 = _2826 + _2378;
    float _2830 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2832 = fma(_2818, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2830);
    float _2834 = fma(_1030, _2522, _2822);
    int _2836 = _2824 ? 0 : 1;
    float _2838 = -_2424;
    float _2840 = _998 * _2838;
    float _2842 = _1026 * _2424;
    float _2844 = _1028 * _2424;
    float _2846 = 1.0 / _2832;
    bool _2848 = !_2702;
    int _2850 = _2848 ? 0 : 1;
    out.m_79.x = _2778;
    out.m_79.y = _2780;
    bool _2852 = uint(_2828) >= uint(_1677);
    float _2854 = fma(_1036, _2422, _2842);
    int _2856 = ~_2836;
    int _2858 = _2856 + 1;
    int _2860 = _2858 + 1;
    float _2862 = fma(_1034, _2422, _2844);
    int _2864 = _2860;
    if (_2808)
    {
        int _2866 = ~_2836;
        int _2868 = _2866 + 1;
        _2864 = _2868;
    }
    int _2870 = _2864;
    out.m_81.w = _2596;
    int _2872 = abs(_2850);
    float _2874 = -_2342;
    float _2876 = _998 * _2874;
    bool _2878 = !_2852;
    int _2880 = _2878 ? 0 : (-1);
    float _2882 = fma(_1030, _2422, _2840);
    int _2884 = abs(_2788);
    float _2886 = _1026 * _2342;
    int _2888 = abs(_2870);
    float _2890 = _1028 * _2342;
    int _2892 = ~_2884;
    int _2894 = _2892 + 1;
    int _2896 = _2894 + 1;
    float _2898 = fma(_1030, _2242, _2876);
    bool _2900 = _2710 != 3;
    float _2902 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2904 = _2846 * _2902;
    int _2906 = ~_2812;
    int _2908 = _2906 + _2880;
    int _2910 = _2908 + 1;
    float _2912 = fma(_1036, _2242, _2886);
    int _2914 = ~_2872;
    int _2916 = _2914 + 1;
    int _2918 = _2916 + 1;
    float _2920 = abs(_2904);
    float _2922 = log2(_2920);
    int _2924 = _2896 * as_type<int>(_2764);
    bool _2926 = !_1963;
    int _2928 = _2926 ? 0 : 1;
    int _2930 = _1677 * _2910;
    int _2932 = _2930 + _2378;
    int _2934 = ~_2888;
    int _2936 = _2934 + 1;
    int _2938 = _2936 + 1;
    int _2940 = _2918 * as_type<int>(_2756);
    int _2942 = _2940 + _2924;
    bool _2944 = !_2900;
    int _2946 = _2944 ? 0 : (-1);
    float _2948 = fma(_1040, _2526, _2810);
    int _2950 = abs(_2928);
    int _2952 = _2938 * as_type<int>(_2798);
    int _2954 = _2952 + _2942;
    int _2956 = abs(_2946);
    float _2958 = fma(_1050, _2526, _2834);
    float _2960 = fma(_1042, _2526, _2814);
    float _2962 = _1520 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2964 = ~_2956;
    int _2966 = _2964 + 1;
    int _2968 = _2966 + 1;
    float _2970 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2972 = ~_2950;
    int _2974 = _2972 + 1;
    int _2976 = _2974 + 1;
    float _2978 = fma(_1522, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2962);
    float _2980 = fma(_1050, _2426, _2882);
    int _2982 = _2968 * as_type<int>(_2806);
    int _2984 = _2982 + _2954;
    bool _2986 = !_2314;
    int _2988 = _2986 ? _2932 : (-1);
    float _2990 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2978);
    float _2992 = exp2(_2970);
    int _2994 = _2984 * _2976;
    float _2996 = _1618 + _1552;
    float _2998 = fma(_1542, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2990);
    float _3000 = fma(_1040, _2426, _2854);
    int _3002 = _2988 * _2950;
    int _3004 = _3002 + _2994;
    float _3006 = _1552 * 0.5;
    float _3008 = _2998 + _1552;
    out.m_83.x = _2958;
    out.m_83.y = _2948;
    out.m_83.z = _2960;
    float _3010 = fma(_1042, _2426, _2862);
    float _3012 = float(_3004);
    float _3014 = fma(_1034, _2242, _2890);
    out.gl_Position.x = _1618;
    out.gl_Position.y = _1620;
    out.gl_Position.z = _2998;
    out.gl_Position.w = _1552;
    out.m_85.x = _2980;
    out.m_85.y = _3000;
    out.m_85.z = _3010;
    float _3016 = fma(_2992, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3018 = precise::clamp(_3016, 0.0, 1.0);
    float _3020 = _3008 * 0.5;
    float _3022 = _2996 * 0.5;
    float _3024 = fma(_1620, -0.5, _3006);
    out.m_87.y = _3012;
    float _3026 = fma(_3018, -2.0, 3.0);
    float _3028 = _3018 * _3018;
    out.m_89.x = _3022;
    out.m_89.y = _3024;
    out.m_89.z = _3020;
    out.m_89.w = _1552;
    if (_1829)
    {
        _1699 = 1.0;
    }
    float _3030 = _1699;
    float _3032 = _3028 * _3026;
    float _3034 = _3030;
    if (_1829)
    {
        _1701 = 1.0;
    }
    float _3036 = _1701;
    float _3038 = -_3032;
    float _3040 = _3038 + 1.0;
    float _3042 = fma(_3040, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3032);
    bool _3044 = _2904 <= 8000.0;
    bool _3046 = isnan(_2904);
    bool _3048 = _3044 || _3046;
    bool _3050 = isnan(8000.0);
    bool _3052 = _3048 || _3050;
    float _3054 = float(_3052);
    float _3056 = _3036;
    float _3058 = _3042;
    if (!_1829)
    {
        float _3060 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3062 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3064 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3062;
        float _3066 = _3060 * 0.15915493667125701904296875;
        float _3068 = _3066 * 6.283185482025146484375;
        float _3070 = cos(_3068);
        float _3072 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3074 = _3072 * 0.15915493667125701904296875;
        float _3076 = _3066 * 6.283185482025146484375;
        float _3078 = sin(_3076);
        float _3080 = 1.0 / _3070;
        float _3082 = _3074 * 6.283185482025146484375;
        float _3084 = cos(_3082);
        float _3086 = _3078 * _3080;
        float _3088 = _3074 * 6.283185482025146484375;
        float _3090 = sin(_3088);
        float _3092 = _3084 * _3086;
        float _3094 = 1.0 / _3064;
        float _3096 = 1.0 / _3092;
        float _3098 = _3090 * _3096;
        float _3100 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3102 = fma(_2904, _3098, _3100);
        float _3104 = _3102 * _3094;
        float _3106 = precise::clamp(_3104, 0.0, 1.0);
        _3056 = _3106;
        _1362 = _3064;
    }
    float _3108 = _3056;
    float _3110 = _1362;
    float _3112 = _3110;
    if (!_1829)
    {
        float _3114 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3116 = _3114 * 0.15915493667125701904296875;
        float _3118 = _3116 * 6.283185482025146484375;
        float _3120 = cos(_3118);
        float _3122 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3124 = _3122 * 0.15915493667125701904296875;
        float _3126 = _3116 * 6.283185482025146484375;
        float _3128 = sin(_3126);
        float _3130 = 1.0 / _3120;
        float _3132 = _3124 * 6.283185482025146484375;
        float _3134 = cos(_3132);
        float _3136 = _3128 * _3130;
        float _3138 = _3124 * 6.283185482025146484375;
        float _3140 = sin(_3138);
        float _3142 = _3134 * _3136;
        float _3144 = 1.0 / _3142;
        float _3146 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3148 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3146;
        float _3150 = 1.0 / _3148;
        float _3152 = _3140 * _3144;
        float _3154 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3156 = fma(_2904, _3152, _3154);
        float _3158 = _3156 * _3150;
        float _3160 = precise::clamp(_3158, 0.0, 1.0);
        float _3162 = -_3160;
        float _3164 = _3162 + 1.0;
        _3034 = _3164;
        _3112 = _3152;
    }
    float _3166 = _3034;
    float _3168 = _3112;
    float _3170 = _3054 * _3042;
    float _3172 = -_2388;
    float _3174 = _3172 + 1.0;
    float _3176 = -_1636;
    float _3178 = _3176 + 1.0;
    float _3180 = _3170 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3182 = _3174 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3184 = fma(_1050, _2350, _2898);
    float _3186 = fma(_1040, _2350, _2912);
    float _3188 = _3178 * _3180;
    float _3190 = precise::clamp(_3188, 0.0, 1.0);
    float _3192 = _3182 * _1638;
    float _3194 = -_3182;
    float _3196 = _3194 + 1.0;
    float _3198 = fma(_1042, _2350, _3014);
    float _3200 = -_3190;
    float _3202 = fma(_3200, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3204 = _1653 * _3192;
    float _3206 = _1663 * _3192;
    float _3208 = _1653 * _3196;
    float _3210 = _3202 * _1797;
    float _3212 = fma(_1659, _3204, _1647);
    float _3214 = fma(_1661, _3204, _1649);
    float _3216 = fma(_1653, _3206, _1651);
    float _3218 = _3210 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_91.x = _3184;
    out.m_91.y = _3186;
    out.m_91.z = _3198;
    bool _3220 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3222 = isnan(_1334);
    bool _3224 = _3220 || _3222;
    bool _3226 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3228 = _3224 || _3226;
    float _3230 = _3108 * _3166;
    out.m_93.x = _3218;
    float _3232 = _3230 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_95.x = _3212;
    out.m_95.y = _3214;
    out.m_95.z = _3216;
    out.m_95.w = _3208;
    float _3234 = _3192;
    float _3236 = _3168;
    float _3238 = _3210;
    float _3240 = _3204;
    if (!_3228)
    {
        _3058 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3242 = _3058;
    float _3244 = _3242;
    float _3246 = _3242;
    if (!_3228)
    {
        _3234 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3248 = _3234;
    float _3250 = _3248;
    float _3252 = _3248;
    if (!_3228)
    {
        _3236 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3254 = _3236;
    float _3256 = _3254;
    float _3258 = _3254;
    if (!_3228)
    {
        _1837 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3260 = _1837;
    float _3262 = _3260;
    float _3264 = _3260;
    if (!_3228)
    {
        _3238 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3266 = _3238;
    float _3268 = _3266;
    float _3270 = _3266;
    if (!_3228)
    {
        _3240 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3272 = _3240;
    bool _3274 = !_3228;
    float _3276 = _3272;
    float _3278 = _3272;
    if (!_3274)
    {
        bool _3280 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3282 = isnan(_1334);
        bool _3284 = _3280 || _3282;
        bool _3286 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3288 = _3284 || _3286;
        if (!_3288)
        {
            float _3290 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3292 = _1334 + _3290;
            float _3294 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3296 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3294;
            float _3298 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3300 = _3298 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3302 = 1.0 / _3296;
            float _3304 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3306 = _3304 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3308 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3310 = _3308 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3312 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3314 = _3312 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3316 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3318 = _3316 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3320 = _3292 * _3302;
            float _3322 = precise::clamp(_3320, 0.0, 1.0);
            float _3324 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3326 = _3324 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3328 = fma(_3322, _3300, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3330 = fma(_3322, _3326, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3332 = fma(_3322, _3306, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3334 = fma(_3322, _3310, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3336 = fma(_3322, _3314, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3338 = fma(_3322, _3318, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3252 = _3332;
            _3270 = _3336;
            _3246 = _3328;
            _3264 = _3334;
            _3258 = _3330;
            _3278 = _3338;
            _3340 = true;
        }
        else
        {
            bool _3342 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3344 = isnan(_1334);
            bool _3346 = _3342 || _3344;
            bool _3348 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3350 = _3346 || _3348;
            if (!_3350)
            {
                _3244 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3352 = _3244;
            _3246 = _3352;
            if (!_3350)
            {
                _3250 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3354 = _3250;
            _3252 = _3354;
            if (!_3350)
            {
                _3256 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3356 = _3256;
            _3258 = _3356;
            if (!_3350)
            {
                _3262 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3358 = _3262;
            _3264 = _3358;
            if (!_3350)
            {
                _3268 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3360 = _3268;
            _3270 = _3360;
            if (!_3350)
            {
                _3276 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3362 = _3276;
            bool _3364 = !_3350;
            _3278 = _3362;
            if (!_3364)
            {
                bool _3366 = _1334 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3368 = isnan(_1334);
                bool _3370 = _3366 || _3368;
                bool _3372 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3374 = _3370 || _3372;
                if (!_3374)
                {
                    float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3378 = _1334 + _3376;
                    float _3380 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3382 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3380;
                    float _3384 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3386 = _3384 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3388 = 1.0 / _3382;
                    float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3398 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3400 = _3398 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3402 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3404 = _3402 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3406 = _3378 * _3388;
                    float _3408 = precise::clamp(_3406, 0.0, 1.0);
                    float _3410 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3412 = _3410 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3414 = fma(_3408, _3386, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3416 = fma(_3408, _3412, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3418 = fma(_3408, _3392, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3420 = fma(_3408, _3396, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3422 = fma(_3408, _3400, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3424 = fma(_3408, _3404, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3252 = _3418;
                    _3270 = _3422;
                    _3246 = _3414;
                    _3264 = _3420;
                    _3258 = _3416;
                    _3278 = _3424;
                    _3340 = true;
                }
                else
                {
                    _3252 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3270 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3246 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3264 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3258 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3278 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3340 = false;
    float _3426 = _3252;
    float _3428 = _3270;
    float _3430 = _3246;
    float _3432 = _3264;
    float _3434 = _3258;
    float _3436 = _3278;
    float _3438 = fma(_3186, -0.5, 0.5);
    float _3440 = precise::clamp(_3438, 0.0, 1.0);
    float _3442 = -_3426;
    float _3444 = _3442 + _3428;
    float _3446 = _3232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3448 = -_3430;
    float _3450 = _3448 + _3432;
    out.m_97.x = 0.0;
    float _3452 = fma(_3440, _3444, _3426);
    float _3454 = fma(_3440, _3450, _3430);
    out.m_53.x = _3446;
    float _3456 = -_3434;
    float _3458 = _3456 + _3436;
    float _3460 = _3452 * 0.586610972881317138671875;
    bool _3462 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3464 = fma(_3440, _3458, _3434);
    float _3466 = fma(_3454, 0.298911988735198974609375, _3460);
    bool _3468 = _3108 > 0.0;
    bool _3470 = isnan(_3108);
    bool _3472 = _3468 || _3470;
    bool _3474 = isnan(0.0);
    bool _3476 = _3472 || _3474;
    float _3478 = fma(_3464, 0.114477999508380889892578125, _3466);
    bool _3480 = _3166 <= 0.0;
    bool _3482 = !_3476;
    bool _3484 = _3480 || _3482;
    float _3486 = -_3478;
    float _3488 = _3454 + _3486;
    float _3490 = -_3478;
    float _3492 = _3452 + _3490;
    float _3494 = -_3478;
    float _3496 = _3464 + _3494;
    float _3498 = fma(_3488, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    float _3500 = fma(_3492, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    float _3502 = fma(_3496, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3478);
    bool _3504 = !_3462;
    if (!_3504)
    {
        float _3506 = -_1298;
        float _3508 = _3506 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3510 = -_1300;
        float _3512 = _3510 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3514 = -_1302;
        float _3516 = _3514 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3518 = _3508 * _3508;
        float _3520 = fma(_3512, _3512, _3518);
        float _3522 = fma(_3516, _3516, _3520);
        float _3524 = sqrt(_3522);
        float _3526 = rsqrt(_3522);
        float _3528 = -_3524;
        float _3530 = _3528 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3532 = _3530 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3534 = precise::clamp(_3532, 0.0, 1.0);
        float _3536 = _3512 * _3526;
        float _3538 = _3508 * _3526;
        float _3540 = abs(_3534);
        float _3542 = log2(_3540);
        float _3544 = _3516 * _3526;
        float _3546 = _3536 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3548 = _3186 * _3538;
        float _3550 = -_3538;
        float _3552 = -_3546;
        float _3554 = fma(_3550, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3552);
        float _3556 = fma(_3184, _3536, _3548);
        float _3558 = -_3544;
        float _3560 = fma(_3558, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3554);
        float _3562 = fma(_3198, _3544, _3556);
        float _3564 = precise::clamp(_3562, 0.0, 1.0);
        float _3566 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3568 = _3560 + _3566;
        float _3570 = _3542 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3572 = _3568 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3574 = precise::clamp(_3572, 0.0, 1.0);
        float _3576 = exp2(_3570);
        float _3578 = _3576 * _3574;
        float _3580 = _3564 * _3578;
        float _3582 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3584 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3586 = _3580 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _3582;
        out.m_97.y = _3584;
        out.m_97.z = _3586;
    }
    out.m_99.x = _3498;
    out.m_99.y = _3500;
    out.m_99.z = _3502;
    if (!_3484)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3588 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3588;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

