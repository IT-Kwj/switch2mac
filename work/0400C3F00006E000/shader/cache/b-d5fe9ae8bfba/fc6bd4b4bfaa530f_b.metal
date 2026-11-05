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
    float4 m_61 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_65 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_55 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1168 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1650 = as_type<float>(_104);
        out.gl_Position.z = _1650;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1720 = as_type<float>(_142);
        out.gl_Position.z = _1720;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _144 = in.m_51.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = in.m_53.x;
    float _298 = in.m_53.y;
    float _300 = in.m_53.z;
    float _302 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _306 = log2(_304);
    float _308 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _310 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].w, _302);
    float _312 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].y, _308);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _328 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _330 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].y, _312);
    float _332 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].x, _326);
    float _334 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].z, _328);
    float _336 = _306 * _122;
    float _338 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].z, _334);
    float _340 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].w, _310);
    float _342 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].x, _332);
    float _344 = _300 * 2.0;
    float _346 = _300 + _296;
    float _348 = _298 + _296;
    float _350 = _296 + (-0.5);
    float _352 = _296 * 2.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = floor(_344);
    float _360 = _298 + _300;
    float _362 = _298 + (-0.5);
    float _364 = _298 * 2.0;
    float _366 = _300 + (-0.5);
    float _368 = _360 + (-1.0);
    float _370 = 1.0 / _356;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _374 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _376 = _346 + (-1.0);
    bool _378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _372);
    float _392 = exp2(_336);
    bool _394 = _358 > 0.0;
    float _396 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _374);
    float _398 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _388);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _294 + _400;
    bool _404 = _358 >= 0.0;
    bool _406 = isnan(_358);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = floor(_364);
    float _416 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _390);
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _396);
    float _420 = _402 * _370;
    float _422 = _348 + (-1.0);
    int _424 = _412 ? 0 : 1;
    float _426 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _428 = floor(_352);
    float _430 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _432 = ~_424;
    int _434 = _432 + 1;
    int _436 = _434 + 1;
    float _438 = -_392;
    float _440 = _438 + 1.0;
    int _442 = _436;
    if (!_394)
    {
        int _444 = ~_424;
        int _446 = _444 + 1;
        _442 = _446;
    }
    int _448 = _442;
    float _450 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _398);
    bool _452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _454 = isnan(1.0);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _460 = _456 || _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _464 = 1.0 + _462;
    bool _466 = !_316;
    int _468 = _466 ? 0 : 1;
    float _470 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _472 = _386 ? _440 : 0.0;
    float _474 = 1.0 / _464;
    int _476 = abs(_468);
    float _478 = _340 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _480 = in.m_55.x;
    float _482 = in.m_55.y;
    float _484 = in.m_55.z;
    bool _486 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_294);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = _414 > 0.0;
    bool _500 = _414 >= 0.0;
    bool _502 = isnan(_414);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = sqrt(_416);
    bool _512 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_294);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    bool _528 = _428 > 0.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _530;
    bool _534 = _428 >= 0.0;
    bool _536 = isnan(_428);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = -_522;
    float _546 = _544 + 1.0;
    float _548 = float(_476);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _550;
    float _554 = float(_448);
    float _556 = fma(_526, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _558 = _496 * _546;
    float _560 = fma(_532, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _562 = fma(_552, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _564 = _548 * _554;
    int _566 = _508 ? 0 : 1;
    if (_460)
    {
        float _568 = _472 * _474;
        _124 = _568;
    }
    float _570 = _124;
    bool _572 = !_324;
    int _574 = _572 ? 0 : 1;
    float _576 = _556 * _558;
    float _578 = _560 * _558;
    int _580 = ~_566;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _562 * _558;
    int _588 = abs(_574);
    float _590 = _564 * (-2.0);
    int _592 = _584;
    if (!_498)
    {
        int _594 = ~_566;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = -_496;
    float _602 = _600 + 1.0;
    float _604 = float(_588);
    float _606 = fma(_430, _590, _430);
    float _608 = float(_598);
    float _610 = fma(_590, _480, _480);
    int _612 = _542 ? 0 : 1;
    float _614 = sqrt(_450);
    bool _616 = !_320;
    int _618 = _616 ? 0 : 1;
    float _620 = _604 * _608;
    float _622 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _610);
    int _624 = ~_612;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].y, _578);
    int _632 = abs(_618);
    float _634 = fma(_606, _570, _622);
    int _636 = _628;
    if (!_528)
    {
        int _638 = ~_612;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    float _644 = _620 * (-2.0);
    float _646 = _342 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _648 = sqrt(_418);
    float _650 = float(_632);
    float _652 = fma(_644, _484, _484);
    float _654 = float(_642);
    float _656 = fma(_470, _644, _470);
    float _658 = _330 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _660 = _634 * 0.15915493667125701904296875;
    float _662 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _664 = _650 * _654;
    float _666 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].z, _652);
    float _668 = in.m_51.x;
    float _670 = in.m_51.y;
    float _672 = in.m_51.z;
    float _674 = _510 * _646;
    float _676 = _664 * (-2.0);
    float _678 = fma(_656, _570, _666);
    float _680 = in.m_57.x;
    float _682 = in.m_57.y;
    float _684 = in.m_57.z;
    float _686 = _660 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _648 * _662;
    float _692 = fma(_676, _482, _482);
    float _694 = fma(_426, _676, _426);
    float _696 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].x, _576);
    float _698 = _678 * 0.15915493667125701904296875;
    float _700 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _702 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].z, _586);
    float _704 = _660 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].x, _696);
    float _710 = fma(_694, _570, _700);
    float _712 = _614 * _658;
    float _714 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].y, _630);
    float _716 = _710 * 0.15915493667125701904296875;
    float _718 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].z, _702);
    float _720 = _698 * 6.283185482025146484375;
    float _722 = sin(_720);
    float _724 = _712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _726 = _712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _728 = _708 * _668;
    float _730 = _714 * _670;
    float _732 = _718 * _672;
    float _734 = _712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _680);
    float _738 = _698 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _724);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _682);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _684);
    float _750 = _742 * _736;
    float _752 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _754 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _756 = _716 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _688 * _722;
    float _762 = _706 * _722;
    float _764 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _726);
    float _766 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _734);
    float _768 = _752 * _746;
    float _770 = _754 * _748;
    bool _772 = _682 != 0.0;
    bool _774 = isnan(_682);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _716 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _706 * _740;
    float _788 = _688 * _740;
    bool _790 = _680 == 0.0;
    bool _792 = !_780;
    bool _794 = _790 && _792;
    bool _796 = _684 == 0.0;
    bool _798 = _796 && _794;
    float _800 = fma(_758, _760, _786);
    float _802 = -_762;
    float _804 = fma(_758, _788, _802);
    float _806 = fma(_758, _786, _760);
    float _808 = _688 * _784;
    float _810 = _784 * _722;
    float _812 = _784 * _740;
    float _814 = _706 * _784;
    float _816 = -_788;
    float _818 = fma(_758, _762, _816);
    float _820 = _800 * _768;
    float _822 = _808 * _768;
    float _824 = _804 * _768;
    float _826 = _800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _828 = fma(_810, _750, _820);
    float _830 = -_758;
    float _832 = fma(_830, _750, _822);
    float _834 = fma(_812, _750, _824);
    float _836 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _744);
    float _838 = in.m_59.x;
    float _840 = in.m_59.y;
    float _842 = in.m_59.z;
    float _844 = fma(_818, _770, _828);
    float _846 = fma(_806, _770, _834);
    float _848 = fma(_814, _770, _832);
    float _850 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _766);
    float _852 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _854 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _856 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[24].w, _836);
    float _858 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[26].w, _850);
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _852);
    float _862 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _854);
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _866 = _858 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _860);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _862);
    float _872 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _764);
    float _874 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _876 = _868 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _878 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[25].w, _872);
    float _882 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _874);
    float _884 = _864 + _876;
    float _886 = _866 + _878;
    float _888 = _810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = _838;
    float _892 = _840;
    float _894 = _842;
    float _896 = _818;
    float _898 = _806;
    float _900 = _808;
    if (!_798)
    {
        float _902 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _838);
        _890 = _902;
    }
    float _904 = _890;
    if (!_798)
    {
        float _906 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[17].y, _840);
        _892 = _906;
    }
    float _908 = _892;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _884 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _916 = _886 + _914;
    if (!_798)
    {
        float _918 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[17].y, _842);
        _894 = _918;
    }
    float _920 = _894;
    float _922 = _810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _924 = _912 * _912;
    float _926 = _916 * _916;
    float _928 = _810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _930 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _932 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _922);
    float _934 = _924 + _926;
    float _936 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _928);
    float _938 = _800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _940 = _800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _942 = sqrt(_934);
    float _944 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _882);
    float _946 = -_758;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[25].z, _930);
    float _950 = -_758;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _932);
    float _954 = -_758;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _936);
    float _958 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _938);
    float _960 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _940);
    float _962 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _826);
    float _964 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _966 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _968 = _880 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _970 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _972 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _964);
    float _976 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _966);
    float _978 = _968 + _970;
    bool _980 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _984 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[24].z, _958);
    float _986 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[25].z, _960);
    float _988 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[26].z, _962);
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _974);
    float _992 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _976);
    float _994 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    float _996 = _976;
    float _998 = _974;
    float _1000 = _994;
    if (!_980)
    {
        _896 = _926;
    }
    float _1002 = _896;
    float _1004 = _1002;
    if (!_980)
    {
        _898 = _924;
    }
    float _1006 = _898;
    float _1008 = _1006;
    if (!_980)
    {
        _996 = _884;
    }
    float _1010 = _996;
    float _1012 = _1010;
    if (!_980)
    {
        _998 = _886;
    }
    float _1014 = _998;
    float _1016 = _1014;
    if (!_980)
    {
        _900 = _978;
    }
    float _1018 = _900;
    bool _1020 = !_980;
    float _1022 = _1018;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1028 = _942 + _1026;
        float _1030 = rsqrt(_934);
        float _1032 = _1028 * _1024;
        float _1034 = _978 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = _1032 * 0.15915493667125701904296875;
        float _1038 = _1036 * 6.283185482025146484375;
        float _1040 = sin(_1038);
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = cos(_1042);
        float _1046 = fma(_1040, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1048 = _1030 * _1046;
        float _1050 = _1044 + (-1.0);
        float _1052 = fma(_912, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1054 = fma(_916, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1056 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1060 = _1052 + _1058;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1064 = _1054 + _1062;
        float _1066 = fma(_978, _1044, _1056);
        float _1068 = _1060 * _1060;
        float _1070 = _1064 * _1064;
        _1022 = _1066;
        _1008 = _1068;
        _1004 = _1070;
        _1012 = _1052;
        _1016 = _1054;
    }
    float _1072 = _1022;
    float _1074 = _1008;
    float _1076 = _1004;
    float _1078 = _1012;
    float _1080 = _1016;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1084 = _1072 + _1082;
    float _1086 = _984 * _908;
    float _1088 = _986 * _908;
    float _1090 = _988 * _908;
    float _1092 = fma(_1084, _1084, _1074);
    float _1094 = fma(_952, _904, _1086);
    float _1096 = fma(_948, _904, _1088);
    float _1098 = _1092 + _1076;
    float _1100 = fma(_956, _904, _1090);
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1104 = fma(_990, _920, _1094);
    float _1106 = sqrt(_1098);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1112 = fma(_992, _920, _1096);
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1120 = fma(_994, _920, _1100);
    out.m_61.x = _1114;
    out.m_61.y = _1116;
    out.m_61.z = _1118;
    out.m_63.x = _1104;
    out.m_63.y = _1112;
    out.m_63.z = _1120;
    bool _1122 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1124 = isnan(_1106);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1130 = _1126 || _1128;
    float _1132 = _1102;
    if (!_1130)
    {
        _1132 = 1.0;
    }
    float _1134 = _1132;
    bool _1136 = !_1130;
    float _1138 = _1134;
    if (!_1136)
    {
        bool _1140 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1142 = isnan(_1106);
        bool _1144 = _1140 || _1142;
        bool _1146 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1148 = _1144 || _1146;
        if (!_1148)
        {
            float _1150 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1152 = _1106 + _1150;
            float _1154 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1156 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1154;
            float _1158 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1160 = _1158 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1162 = 1.0 / _1156;
            float _1164 = _1152 * _1162;
            float _1166 = fma(_1164, _1160, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1138 = _1166;
            _1168 = true;
        }
        else
        {
            bool _1170 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1172 = isnan(_1106);
            bool _1174 = _1170 || _1172;
            bool _1176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1178 = _1174 || _1176;
            if (!_1178)
            {
                float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1182 = _1106 + _1180;
                float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1186 = _1184 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1190 = _1188 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1192 = 1.0 / _1186;
                float _1194 = _1182 * _1192;
                float _1196 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1138 = _1196;
                _1168 = true;
            }
            else
            {
                _1138 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1168 = false;
    float _1198 = _1138;
    float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1202 = _1072 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1206 = _1078 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1210 = _1080 + _1208;
    float _1212 = fma(_1202, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1214 = fma(_1206, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1216 = fma(_1210, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1212 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1214 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1216 + _1226;
    float _1230 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1232 = _1220 * _1220;
    float _1234 = fma(_1224, _1224, _1232);
    float _1236 = fma(_1228, _1228, _1234);
    float _1238 = rsqrt(_1236);
    float _1240 = sqrt(_1236);
    float _1242 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1244 = _1224 * _1242;
    float _1246 = _1228 * _1242;
    float _1248 = _1244 * _1244;
    float _1250 = _1246 * _1246;
    float _1252 = _1248 + _1250;
    float _1254 = sqrt(_1252);
    bool _1256 = _1254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = _1254 + _1258;
    float _1262 = _1238;
    float _1264 = _1252;
    float _1266 = _1260;
    float _1268 = _1220;
    float _1270 = _1242;
    float _1272 = _1244;
    if (_1256)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1274;
    }
    float _1276 = _1262;
    if (_1256)
    {
        float _1278 = rsqrt(_1252);
        _1264 = _1278;
    }
    float _1280 = _1264;
    if (_1256)
    {
        float _1282 = _1260 * _1276;
        _1266 = _1282;
    }
    float _1284 = _1266;
    if (_1256)
    {
        float _1286 = _1284 * 0.15915493667125701904296875;
        _1000 = _1286;
    }
    float _1288 = _1000;
    float _1290 = _1276;
    float _1292 = _1288;
    if (_1256)
    {
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1302 = precise::max(0.0, _1300);
    float _1304 = _1228;
    float _1306 = _1302;
    if (_1256)
    {
        float _1308 = _1288 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        _1304 = _1310;
    }
    float _1312 = _1304;
    float _1314 = -_1242;
    float _1316 = -_1302;
    float _1318 = fma(_1220, _1314, _1316);
    if (!_1256)
    {
        _1268 = _1246;
    }
    float _1320 = _1268;
    float _1322 = _1320;
    if (_1256)
    {
        float _1324 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1306 = _1324;
    }
    float _1326 = _1306;
    float _1328 = _1298;
    float _1330 = _1326;
    if (_1256)
    {
        float _1332 = fma(_1298, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    float _1338 = _1312;
    if (_1256)
    {
        float _1340 = _1312 + (-1.0);
        _1330 = _1340;
    }
    float _1342 = _1330;
    float _1344 = _1342;
    if (_1256)
    {
        float _1346 = _1280 * _1334;
        _1270 = _1346;
    }
    float _1348 = _1270;
    if (!_1256)
    {
        _1336 = _1318;
    }
    float _1350 = _1336;
    float _1352 = _1350;
    if (_1256)
    {
        float _1354 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1354;
    }
    float _1356 = _1292;
    if (_1256)
    {
        float _1358 = _1244 * _1348;
        _1272 = _1358;
    }
    float _1360 = _1272;
    if (!_1256)
    {
        _1344 = _1248;
    }
    float _1362 = _1344;
    float _1364 = _1362;
    if (_1256)
    {
        float _1366 = _1246 * _1348;
        _1322 = _1366;
    }
    float _1368 = _1322;
    if (_1256)
    {
        float _1370 = fma(_1318, _1312, _1356);
        _1352 = _1370;
    }
    float _1372 = _1352;
    if (_1256)
    {
        float _1374 = _1360 * _1360;
        _1364 = _1374;
    }
    float _1376 = _1364;
    if (!_1256)
    {
        _1338 = _1250;
    }
    float _1378 = _1338;
    float _1380 = _1378;
    if (_1256)
    {
        float _1382 = _1368 * _1368;
        _1380 = _1382;
    }
    float _1384 = _1380;
    float _1386 = fma(_1372, _1372, _1376);
    float _1388 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1390 = _1386 + _1384;
    float _1392 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1396 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1394);
    float _1398 = precise::clamp(_1396, 0.0, 1.0);
    float _1400 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1402 = rsqrt(_1390);
    float _1404 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1392);
    float _1406 = -_1398;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1400);
    float _1412 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1388);
    float _1414 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1404);
    float _1416 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1418 = abs(_1408);
    float _1420 = log2(_1418);
    float _1422 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1424 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1416);
    float _1426 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1410);
    float _1428 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1436 = _1402 * _1360;
    float _1438 = -_1430;
    float _1440 = fma(_1438, _1230, 1.0);
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1448 = _1402 * _1372;
    float _1450 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1452 = _1402 * _1368;
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    float _1456 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1458 = -_1450;
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1458);
    float _1462 = log2(_1440);
    float _1464 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1454);
    float _1466 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1452;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1460);
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1474 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1464);
    float _1476 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1478 = fma(_1470, -0.5, 0.5);
    float _1480 = exp2(_1456);
    float _1482 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1472);
    float _1484 = fma(_1470, 0.5, 0.5);
    float _1486 = _1448 + 1.0;
    float _1488 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1490 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1482);
    float _1492 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1494 = 1.0 / _1474;
    float _1496 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1490);
    float _1498 = _1462 * 0.693147182464599609375;
    float _1500 = sqrt(_1478);
    float _1502 = -_1448;
    float _1504 = fma(_1480, _1486, _1502);
    float _1506 = fma(_1484, _1492, -0.212114393711090087890625);
    float _1508 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1510 = fma(_1504, 0.5, 0.5);
    float _1512 = fma(_1484, _1506, 1.570728778839111328125);
    float _1514 = _1496 * _1494;
    float _1516 = _1508 * _1494;
    float _1518 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1520 = fma(_1514, 0.5, 0.5);
    float _1522 = fma(_1516, -0.5, 0.5);
    float _1524 = _1500 * 0.636619746685028076171875;
    float3 _3995 = float3(_1520, _1522, _1518);
    float _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3995, float3(0.0), isnan(_3995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3995, float3(0.0), isnan(_3995)), level(0.0)).x;
    float3 _4006 = float3(_1520, _1522, _1518);
    float4 _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).xyzw;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    float _1537 = _1529.w;
    float _1539 = -_1512;
    float _1541 = fma(_1524, _1539, 1.0);
    float2 _4028 = float2(_1541, _1510);
    float3 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4028, float2(0.0), isnan(_4028)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4028, float2(0.0), isnan(_4028)), level(0.0)).xyz;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1555 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _1214;
    out.m_65.y = _1212;
    out.m_65.z = _1216;
    float _1557 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1555);
    float _1559 = exp2(_1553);
    float _1561 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1557);
    float _1563 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1561);
    float _1565 = _1563 + _1474;
    out.gl_Position.x = _1496;
    out.gl_Position.y = _1508;
    out.gl_Position.z = _1563;
    out.gl_Position.w = _1474;
    float _1567 = _1565 * 0.5;
    float _1569 = -_1559;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1575 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.z = _1567;
    out.m_67.w = _1474;
    out.m_47.x = _1575;
    float _1577 = _1573 * _1526;
    float _1579 = -_1573;
    float _1581 = _1579 + 1.0;
    float _1583 = _1537 * _1577;
    float _1585 = _1537 * _1581;
    float _1587 = _1551 * _1577;
    float _1589 = fma(_1547, _1583, _1531);
    float _1591 = fma(_1549, _1583, _1533);
    float _1593 = fma(_1537, _1587, _1535);
    out.m_69.x = _1589;
    out.m_69.y = _1591;
    out.m_69.z = _1593;
    out.m_69.w = _1585;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1168 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1650 = as_type<float>(_104);
        out.gl_Position.z = _1650;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1720 = as_type<float>(_142);
        out.gl_Position.z = _1720;
    }
    if (_134)
    {
        return out;
    }
    float _144 = in.m_51.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = in.m_53.x;
    float _298 = in.m_53.y;
    float _300 = in.m_53.z;
    float _302 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _306 = log2(_304);
    float _308 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _310 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].w, _302);
    float _312 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].y, _308);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _328 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _330 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].y, _312);
    float _332 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].x, _326);
    float _334 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].z, _328);
    float _336 = _306 * _122;
    float _338 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].z, _334);
    float _340 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].w, _310);
    float _342 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].x, _332);
    float _344 = _300 * 2.0;
    float _346 = _300 + _296;
    float _348 = _298 + _296;
    float _350 = _296 + (-0.5);
    float _352 = _296 * 2.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = floor(_344);
    float _360 = _298 + _300;
    float _362 = _298 + (-0.5);
    float _364 = _298 * 2.0;
    float _366 = _300 + (-0.5);
    float _368 = _360 + (-1.0);
    float _370 = 1.0 / _356;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _374 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _376 = _346 + (-1.0);
    bool _378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _372);
    float _392 = exp2(_336);
    bool _394 = _358 > 0.0;
    float _396 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _374);
    float _398 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _388);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _294 + _400;
    bool _404 = _358 >= 0.0;
    bool _406 = isnan(_358);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = floor(_364);
    float _416 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _390);
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _396);
    float _420 = _402 * _370;
    float _422 = _348 + (-1.0);
    int _424 = _412 ? 0 : 1;
    float _426 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _428 = floor(_352);
    float _430 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _432 = ~_424;
    int _434 = _432 + 1;
    int _436 = _434 + 1;
    float _438 = -_392;
    float _440 = _438 + 1.0;
    int _442 = _436;
    if (!_394)
    {
        int _444 = ~_424;
        int _446 = _444 + 1;
        _442 = _446;
    }
    int _448 = _442;
    float _450 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _398);
    bool _452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _454 = isnan(1.0);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _460 = _456 || _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _464 = 1.0 + _462;
    bool _466 = !_316;
    int _468 = _466 ? 0 : 1;
    float _470 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _472 = _386 ? _440 : 0.0;
    float _474 = 1.0 / _464;
    int _476 = abs(_468);
    float _478 = _340 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _480 = in.m_55.x;
    float _482 = in.m_55.y;
    float _484 = in.m_55.z;
    bool _486 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_294);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = _414 > 0.0;
    bool _500 = _414 >= 0.0;
    bool _502 = isnan(_414);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = sqrt(_416);
    bool _512 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_294);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    bool _528 = _428 > 0.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _530;
    bool _534 = _428 >= 0.0;
    bool _536 = isnan(_428);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = -_522;
    float _546 = _544 + 1.0;
    float _548 = float(_476);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _550;
    float _554 = float(_448);
    float _556 = fma(_526, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _558 = _496 * _546;
    float _560 = fma(_532, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _562 = fma(_552, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _564 = _548 * _554;
    int _566 = _508 ? 0 : 1;
    if (_460)
    {
        float _568 = _472 * _474;
        _124 = _568;
    }
    float _570 = _124;
    bool _572 = !_324;
    int _574 = _572 ? 0 : 1;
    float _576 = _556 * _558;
    float _578 = _560 * _558;
    int _580 = ~_566;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _562 * _558;
    int _588 = abs(_574);
    float _590 = _564 * (-2.0);
    int _592 = _584;
    if (!_498)
    {
        int _594 = ~_566;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = -_496;
    float _602 = _600 + 1.0;
    float _604 = float(_588);
    float _606 = fma(_430, _590, _430);
    float _608 = float(_598);
    float _610 = fma(_590, _480, _480);
    int _612 = _542 ? 0 : 1;
    float _614 = sqrt(_450);
    bool _616 = !_320;
    int _618 = _616 ? 0 : 1;
    float _620 = _604 * _608;
    float _622 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _610);
    int _624 = ~_612;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].y, _578);
    int _632 = abs(_618);
    float _634 = fma(_606, _570, _622);
    int _636 = _628;
    if (!_528)
    {
        int _638 = ~_612;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    float _644 = _620 * (-2.0);
    float _646 = _342 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _648 = sqrt(_418);
    float _650 = float(_632);
    float _652 = fma(_644, _484, _484);
    float _654 = float(_642);
    float _656 = fma(_470, _644, _470);
    float _658 = _330 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _660 = _634 * 0.15915493667125701904296875;
    float _662 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _664 = _650 * _654;
    float _666 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].z, _652);
    float _668 = in.m_51.x;
    float _670 = in.m_51.y;
    float _672 = in.m_51.z;
    float _674 = _510 * _646;
    float _676 = _664 * (-2.0);
    float _678 = fma(_656, _570, _666);
    float _680 = in.m_57.x;
    float _682 = in.m_57.y;
    float _684 = in.m_57.z;
    float _686 = _660 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _648 * _662;
    float _692 = fma(_676, _482, _482);
    float _694 = fma(_426, _676, _426);
    float _696 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].x, _576);
    float _698 = _678 * 0.15915493667125701904296875;
    float _700 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _702 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].z, _586);
    float _704 = _660 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].x, _696);
    float _710 = fma(_694, _570, _700);
    float _712 = _614 * _658;
    float _714 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].y, _630);
    float _716 = _710 * 0.15915493667125701904296875;
    float _718 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].z, _702);
    float _720 = _698 * 6.283185482025146484375;
    float _722 = sin(_720);
    float _724 = _712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _726 = _712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _728 = _708 * _668;
    float _730 = _714 * _670;
    float _732 = _718 * _672;
    float _734 = _712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _680);
    float _738 = _698 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _724);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _682);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _684);
    float _750 = _742 * _736;
    float _752 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _754 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _756 = _716 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _688 * _722;
    float _762 = _706 * _722;
    float _764 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _726);
    float _766 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _734);
    float _768 = _752 * _746;
    float _770 = _754 * _748;
    bool _772 = _682 != 0.0;
    bool _774 = isnan(_682);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _716 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _706 * _740;
    float _788 = _688 * _740;
    bool _790 = _680 == 0.0;
    bool _792 = !_780;
    bool _794 = _790 && _792;
    bool _796 = _684 == 0.0;
    bool _798 = _796 && _794;
    float _800 = fma(_758, _760, _786);
    float _802 = -_762;
    float _804 = fma(_758, _788, _802);
    float _806 = fma(_758, _786, _760);
    float _808 = _688 * _784;
    float _810 = _784 * _722;
    float _812 = _784 * _740;
    float _814 = _706 * _784;
    float _816 = -_788;
    float _818 = fma(_758, _762, _816);
    float _820 = _800 * _768;
    float _822 = _808 * _768;
    float _824 = _804 * _768;
    float _826 = _800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _828 = fma(_810, _750, _820);
    float _830 = -_758;
    float _832 = fma(_830, _750, _822);
    float _834 = fma(_812, _750, _824);
    float _836 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _744);
    float _838 = in.m_59.x;
    float _840 = in.m_59.y;
    float _842 = in.m_59.z;
    float _844 = fma(_818, _770, _828);
    float _846 = fma(_806, _770, _834);
    float _848 = fma(_814, _770, _832);
    float _850 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _766);
    float _852 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _854 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _856 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[24].w, _836);
    float _858 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[26].w, _850);
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _852);
    float _862 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _854);
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _866 = _858 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _860);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _862);
    float _872 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _764);
    float _874 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _876 = _868 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _878 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[25].w, _872);
    float _882 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _874);
    float _884 = _864 + _876;
    float _886 = _866 + _878;
    float _888 = _810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = _838;
    float _892 = _840;
    float _894 = _842;
    float _896 = _818;
    float _898 = _806;
    float _900 = _808;
    if (!_798)
    {
        float _902 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _838);
        _890 = _902;
    }
    float _904 = _890;
    if (!_798)
    {
        float _906 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[17].y, _840);
        _892 = _906;
    }
    float _908 = _892;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _884 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _916 = _886 + _914;
    if (!_798)
    {
        float _918 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[17].y, _842);
        _894 = _918;
    }
    float _920 = _894;
    float _922 = _810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _924 = _912 * _912;
    float _926 = _916 * _916;
    float _928 = _810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _930 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _932 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _922);
    float _934 = _924 + _926;
    float _936 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _928);
    float _938 = _800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _940 = _800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _942 = sqrt(_934);
    float _944 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _882);
    float _946 = -_758;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[25].z, _930);
    float _950 = -_758;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _932);
    float _954 = -_758;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _936);
    float _958 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _938);
    float _960 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _940);
    float _962 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _826);
    float _964 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _966 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _968 = _880 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _970 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _972 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _964);
    float _976 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _966);
    float _978 = _968 + _970;
    bool _980 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _984 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[24].z, _958);
    float _986 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[25].z, _960);
    float _988 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[26].z, _962);
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _974);
    float _992 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _976);
    float _994 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    float _996 = _976;
    float _998 = _974;
    float _1000 = _994;
    if (!_980)
    {
        _896 = _926;
    }
    float _1002 = _896;
    float _1004 = _1002;
    if (!_980)
    {
        _898 = _924;
    }
    float _1006 = _898;
    float _1008 = _1006;
    if (!_980)
    {
        _996 = _884;
    }
    float _1010 = _996;
    float _1012 = _1010;
    if (!_980)
    {
        _998 = _886;
    }
    float _1014 = _998;
    float _1016 = _1014;
    if (!_980)
    {
        _900 = _978;
    }
    float _1018 = _900;
    bool _1020 = !_980;
    float _1022 = _1018;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1028 = _942 + _1026;
        float _1030 = rsqrt(_934);
        float _1032 = _1028 * _1024;
        float _1034 = _978 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = _1032 * 0.15915493667125701904296875;
        float _1038 = _1036 * 6.283185482025146484375;
        float _1040 = sin(_1038);
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = cos(_1042);
        float _1046 = fma(_1040, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1048 = _1030 * _1046;
        float _1050 = _1044 + (-1.0);
        float _1052 = fma(_912, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1054 = fma(_916, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1056 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1060 = _1052 + _1058;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1064 = _1054 + _1062;
        float _1066 = fma(_978, _1044, _1056);
        float _1068 = _1060 * _1060;
        float _1070 = _1064 * _1064;
        _1022 = _1066;
        _1008 = _1068;
        _1004 = _1070;
        _1012 = _1052;
        _1016 = _1054;
    }
    float _1072 = _1022;
    float _1074 = _1008;
    float _1076 = _1004;
    float _1078 = _1012;
    float _1080 = _1016;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1084 = _1072 + _1082;
    float _1086 = _984 * _908;
    float _1088 = _986 * _908;
    float _1090 = _988 * _908;
    float _1092 = fma(_1084, _1084, _1074);
    float _1094 = fma(_952, _904, _1086);
    float _1096 = fma(_948, _904, _1088);
    float _1098 = _1092 + _1076;
    float _1100 = fma(_956, _904, _1090);
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1104 = fma(_990, _920, _1094);
    float _1106 = sqrt(_1098);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1112 = fma(_992, _920, _1096);
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1120 = fma(_994, _920, _1100);
    out.m_61.x = _1114;
    out.m_61.y = _1116;
    out.m_61.z = _1118;
    out.m_63.x = _1104;
    out.m_63.y = _1112;
    out.m_63.z = _1120;
    bool _1122 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1124 = isnan(_1106);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1130 = _1126 || _1128;
    float _1132 = _1102;
    if (!_1130)
    {
        _1132 = 1.0;
    }
    float _1134 = _1132;
    bool _1136 = !_1130;
    float _1138 = _1134;
    if (!_1136)
    {
        bool _1140 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1142 = isnan(_1106);
        bool _1144 = _1140 || _1142;
        bool _1146 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1148 = _1144 || _1146;
        if (!_1148)
        {
            float _1150 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1152 = _1106 + _1150;
            float _1154 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1156 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1154;
            float _1158 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1160 = _1158 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1162 = 1.0 / _1156;
            float _1164 = _1152 * _1162;
            float _1166 = fma(_1164, _1160, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1138 = _1166;
            _1168 = true;
        }
        else
        {
            bool _1170 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1172 = isnan(_1106);
            bool _1174 = _1170 || _1172;
            bool _1176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1178 = _1174 || _1176;
            if (!_1178)
            {
                float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1182 = _1106 + _1180;
                float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1186 = _1184 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1190 = _1188 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1192 = 1.0 / _1186;
                float _1194 = _1182 * _1192;
                float _1196 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1138 = _1196;
                _1168 = true;
            }
            else
            {
                _1138 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1168 = false;
    float _1198 = _1138;
    float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1202 = _1072 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1206 = _1078 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1210 = _1080 + _1208;
    float _1212 = fma(_1202, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1214 = fma(_1206, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1216 = fma(_1210, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1212 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1214 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1216 + _1226;
    float _1230 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1232 = _1220 * _1220;
    float _1234 = fma(_1224, _1224, _1232);
    float _1236 = fma(_1228, _1228, _1234);
    float _1238 = rsqrt(_1236);
    float _1240 = sqrt(_1236);
    float _1242 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1244 = _1224 * _1242;
    float _1246 = _1228 * _1242;
    float _1248 = _1244 * _1244;
    float _1250 = _1246 * _1246;
    float _1252 = _1248 + _1250;
    float _1254 = sqrt(_1252);
    bool _1256 = _1254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = _1254 + _1258;
    float _1262 = _1238;
    float _1264 = _1252;
    float _1266 = _1260;
    float _1268 = _1220;
    float _1270 = _1242;
    float _1272 = _1244;
    if (_1256)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1274;
    }
    float _1276 = _1262;
    if (_1256)
    {
        float _1278 = rsqrt(_1252);
        _1264 = _1278;
    }
    float _1280 = _1264;
    if (_1256)
    {
        float _1282 = _1260 * _1276;
        _1266 = _1282;
    }
    float _1284 = _1266;
    if (_1256)
    {
        float _1286 = _1284 * 0.15915493667125701904296875;
        _1000 = _1286;
    }
    float _1288 = _1000;
    float _1290 = _1276;
    float _1292 = _1288;
    if (_1256)
    {
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1302 = precise::max(0.0, _1300);
    float _1304 = _1228;
    float _1306 = _1302;
    if (_1256)
    {
        float _1308 = _1288 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        _1304 = _1310;
    }
    float _1312 = _1304;
    float _1314 = -_1242;
    float _1316 = -_1302;
    float _1318 = fma(_1220, _1314, _1316);
    if (!_1256)
    {
        _1268 = _1246;
    }
    float _1320 = _1268;
    float _1322 = _1320;
    if (_1256)
    {
        float _1324 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1306 = _1324;
    }
    float _1326 = _1306;
    float _1328 = _1298;
    float _1330 = _1326;
    if (_1256)
    {
        float _1332 = fma(_1298, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    float _1338 = _1312;
    if (_1256)
    {
        float _1340 = _1312 + (-1.0);
        _1330 = _1340;
    }
    float _1342 = _1330;
    float _1344 = _1342;
    if (_1256)
    {
        float _1346 = _1280 * _1334;
        _1270 = _1346;
    }
    float _1348 = _1270;
    if (!_1256)
    {
        _1336 = _1318;
    }
    float _1350 = _1336;
    float _1352 = _1350;
    if (_1256)
    {
        float _1354 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1354;
    }
    float _1356 = _1292;
    if (_1256)
    {
        float _1358 = _1244 * _1348;
        _1272 = _1358;
    }
    float _1360 = _1272;
    if (!_1256)
    {
        _1344 = _1248;
    }
    float _1362 = _1344;
    float _1364 = _1362;
    if (_1256)
    {
        float _1366 = _1246 * _1348;
        _1322 = _1366;
    }
    float _1368 = _1322;
    if (_1256)
    {
        float _1370 = fma(_1318, _1312, _1356);
        _1352 = _1370;
    }
    float _1372 = _1352;
    if (_1256)
    {
        float _1374 = _1360 * _1360;
        _1364 = _1374;
    }
    float _1376 = _1364;
    if (!_1256)
    {
        _1338 = _1250;
    }
    float _1378 = _1338;
    float _1380 = _1378;
    if (_1256)
    {
        float _1382 = _1368 * _1368;
        _1380 = _1382;
    }
    float _1384 = _1380;
    float _1386 = fma(_1372, _1372, _1376);
    float _1388 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1390 = _1386 + _1384;
    float _1392 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1396 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1394);
    float _1398 = precise::clamp(_1396, 0.0, 1.0);
    float _1400 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1402 = rsqrt(_1390);
    float _1404 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1392);
    float _1406 = -_1398;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1400);
    float _1412 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1388);
    float _1414 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1404);
    float _1416 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1418 = abs(_1408);
    float _1420 = log2(_1418);
    float _1422 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1424 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1416);
    float _1426 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1410);
    float _1428 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1436 = _1402 * _1360;
    float _1438 = -_1430;
    float _1440 = fma(_1438, _1230, 1.0);
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1448 = _1402 * _1372;
    float _1450 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1452 = _1402 * _1368;
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    float _1456 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1458 = -_1450;
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1458);
    float _1462 = log2(_1440);
    float _1464 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1454);
    float _1466 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1452;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1460);
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1474 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1464);
    float _1476 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1478 = fma(_1470, -0.5, 0.5);
    float _1480 = exp2(_1456);
    float _1482 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1472);
    float _1484 = fma(_1470, 0.5, 0.5);
    float _1486 = _1448 + 1.0;
    float _1488 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1490 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1482);
    float _1492 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1494 = 1.0 / _1474;
    float _1496 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1490);
    float _1498 = _1462 * 0.693147182464599609375;
    float _1500 = sqrt(_1478);
    float _1502 = -_1448;
    float _1504 = fma(_1480, _1486, _1502);
    float _1506 = fma(_1484, _1492, -0.212114393711090087890625);
    float _1508 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1510 = fma(_1504, 0.5, 0.5);
    float _1512 = fma(_1484, _1506, 1.570728778839111328125);
    float _1514 = _1496 * _1494;
    float _1516 = _1508 * _1494;
    float _1518 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1520 = fma(_1514, 0.5, 0.5);
    float _1522 = fma(_1516, -0.5, 0.5);
    float _1524 = _1500 * 0.636619746685028076171875;
    float3 _3995 = float3(_1520, _1522, _1518);
    float _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3995, float3(0.0), isnan(_3995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3995, float3(0.0), isnan(_3995)), level(0.0)).x;
    float3 _4006 = float3(_1520, _1522, _1518);
    float4 _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).xyzw;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    float _1537 = _1529.w;
    float _1539 = -_1512;
    float _1541 = fma(_1524, _1539, 1.0);
    float2 _4028 = float2(_1541, _1510);
    float3 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4028, float2(0.0), isnan(_4028)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4028, float2(0.0), isnan(_4028)), level(0.0)).xyz;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1555 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _1214;
    out.m_65.y = _1212;
    out.m_65.z = _1216;
    float _1557 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1555);
    float _1559 = exp2(_1553);
    float _1561 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1557);
    float _1563 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1561);
    float _1565 = _1563 + _1474;
    out.gl_Position.x = _1496;
    out.gl_Position.y = _1508;
    out.gl_Position.z = _1563;
    out.gl_Position.w = _1474;
    float _1567 = _1565 * 0.5;
    float _1569 = -_1559;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1575 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.z = _1567;
    out.m_67.w = _1474;
    out.m_47.x = _1575;
    float _1577 = _1573 * _1526;
    float _1579 = -_1573;
    float _1581 = _1579 + 1.0;
    float _1583 = _1537 * _1577;
    float _1585 = _1537 * _1581;
    float _1587 = _1551 * _1577;
    float _1589 = fma(_1547, _1583, _1531);
    float _1591 = fma(_1549, _1583, _1533);
    float _1593 = fma(_1537, _1587, _1535);
    out.m_69.x = _1589;
    out.m_69.y = _1591;
    out.m_69.z = _1593;
    out.m_69.w = _1585;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1168 = false;
    bool _286 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_44.w;
    float _85 = trunc(_83);
    int _88 = int(_85);
    bool _92 = _88 >= 1;
    float _94 = 0.0;
    if (!_92)
    {
        _94 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _96 = _94;
    float _98 = _96;
    if (!_92)
    {
        out.m_47.x = 0.0;
    }
    int _100 = 0;
    if (!_92)
    {
        float _102 = _96 * 5.0;
        _100 = as_type<int>(_102);
    }
    int _104 = _100;
    int _106 = _104;
    if (!_92)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1650 = as_type<float>(_104);
        out.gl_Position.z = _1650;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = _122;
    if (_118)
    {
        float _126 = float(_88);
        _98 = _126;
    }
    float _128 = _98;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    float _136 = _128;
    if (_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _140 = _138 * 5.0;
        _106 = as_type<int>(_140);
    }
    int _142 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1720 = as_type<float>(_142);
        out.gl_Position.z = _1720;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _144 = in.m_51.w;
    float _146 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    float _158 = in.m_49.x;
    float _160 = in.m_49.y;
    float _162 = in.m_49.z;
    float _164 = in.m_44.x;
    float _166 = in.m_44.y;
    float _168 = in.m_44.z;
    float _170 = 0.0;
    float _172 = _146;
    if (!_156)
    {
        float _174 = _146 * _146;
        float _176 = _174 * 0.5;
        _170 = _176;
    }
    float _178 = _170;
    float _180 = _178;
    if (!_156)
    {
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _180 = _182;
    }
    float _184 = _180;
    bool _186 = !_156;
    float _188 = _184;
    if (!_186)
    {
        float _190 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _192 = log2(_190);
        float _194 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _196 = _194 + 1.0;
        float _198 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _200 = _146 * _192;
        float _202 = 1.0 / _196;
        float _204 = _198 * 0.693147182464599609375;
        float _206 = exp2(_200);
        float _208 = 1.0 / _204;
        float _210 = _206 + (-1.0);
        float _212 = -_210;
        float _214 = fma(_212, _208, _146);
        float _216 = _214 * _202;
        float _218 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _188 = _218;
    }
    float _220 = _188;
    bool _222 = !_156;
    if (!_222)
    {
        float _224 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _226 = log2(_224);
        float _228 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _230 = _228 + 1.0;
        float _232 = 1.0 / _230;
        float _234 = _146 * _226;
        float _236 = exp2(_234);
        float _238 = -_236;
        float _240 = _238 + 1.0;
        float _242 = _240 * _232;
        _172 = _242;
    }
    float _244 = _172;
    bool _246 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _248 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _252 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _254 = fma(_244, _158, _248);
    float _256 = fma(_244, _160, _250);
    float _258 = fma(_244, _162, _252);
    float _260 = fma(_254, _144, _164);
    float _262 = fma(_256, _144, _166);
    float _264 = fma(_258, _144, _168);
    bool _266 = !_246;
    float _284;
    if (!_266)
    {
        float _268 = in.m_53.x;
        float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _272 = _268 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _274 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _276 = _274 * _270;
        float _278 = floor(_276);
        float _280 = -_278;
        float _282 = _276 + _280;
        _284 = _282;
        _286 = true;
    }
    else
    {
        float _288 = float(_88);
        float _290 = 1.0 / _288;
        float _292 = _122 * _290;
        _284 = _292;
    }
    _286 = false;
    float _294 = _284;
    float _296 = in.m_53.x;
    float _298 = in.m_53.y;
    float _300 = in.m_53.z;
    float _302 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _304 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _306 = log2(_304);
    float _308 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _310 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].w, _302);
    float _312 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].y, _308);
    int _314 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _316 = _314 != 0;
    int _318 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _320 = _318 != 0;
    int _322 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _324 = _322 != 0;
    float _326 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _328 = _262 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _330 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].y, _312);
    float _332 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].x, _326);
    float _334 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[14].z, _328);
    float _336 = _306 * _122;
    float _338 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].z, _334);
    float _340 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].w, _310);
    float _342 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[16].x, _332);
    float _344 = _300 * 2.0;
    float _346 = _300 + _296;
    float _348 = _298 + _296;
    float _350 = _296 + (-0.5);
    float _352 = _296 * 2.0;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _354;
    float _358 = floor(_344);
    float _360 = _298 + _300;
    float _362 = _298 + (-0.5);
    float _364 = _298 * 2.0;
    float _366 = _300 + (-0.5);
    float _368 = _360 + (-1.0);
    float _370 = 1.0 / _356;
    float _372 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _374 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _376 = _346 + (-1.0);
    bool _378 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _386 = _382 || _384;
    float _388 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _390 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _372);
    float _392 = exp2(_336);
    bool _394 = _358 > 0.0;
    float _396 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _374);
    float _398 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _388);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _402 = _294 + _400;
    bool _404 = _358 >= 0.0;
    bool _406 = isnan(_358);
    bool _408 = _404 || _406;
    bool _410 = isnan(0.0);
    bool _412 = _408 || _410;
    float _414 = floor(_364);
    float _416 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _390);
    float _418 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _396);
    float _420 = _402 * _370;
    float _422 = _348 + (-1.0);
    int _424 = _412 ? 0 : 1;
    float _426 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _428 = floor(_352);
    float _430 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _432 = ~_424;
    int _434 = _432 + 1;
    int _436 = _434 + 1;
    float _438 = -_392;
    float _440 = _438 + 1.0;
    int _442 = _436;
    if (!_394)
    {
        int _444 = ~_424;
        int _446 = _444 + 1;
        _442 = _446;
    }
    int _448 = _442;
    float _450 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _398);
    bool _452 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _454 = isnan(1.0);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _460 = _456 || _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _464 = 1.0 + _462;
    bool _466 = !_316;
    int _468 = _466 ? 0 : 1;
    float _470 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _472 = _386 ? _440 : 0.0;
    float _474 = 1.0 / _464;
    int _476 = abs(_468);
    float _478 = _340 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _480 = in.m_55.x;
    float _482 = in.m_55.y;
    float _484 = in.m_55.z;
    bool _486 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _488 = isnan(_294);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    bool _498 = _414 > 0.0;
    bool _500 = _414 >= 0.0;
    bool _502 = isnan(_414);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = sqrt(_416);
    bool _512 = _294 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _514 = isnan(_294);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _524;
    bool _528 = _428 > 0.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _530;
    bool _534 = _428 >= 0.0;
    bool _536 = isnan(_428);
    bool _538 = _534 || _536;
    bool _540 = isnan(0.0);
    bool _542 = _538 || _540;
    float _544 = -_522;
    float _546 = _544 + 1.0;
    float _548 = float(_476);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _550;
    float _554 = float(_448);
    float _556 = fma(_526, _420, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _558 = _496 * _546;
    float _560 = fma(_532, _420, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _562 = fma(_552, _420, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _564 = _548 * _554;
    int _566 = _508 ? 0 : 1;
    if (_460)
    {
        float _568 = _472 * _474;
        _124 = _568;
    }
    float _570 = _124;
    bool _572 = !_324;
    int _574 = _572 ? 0 : 1;
    float _576 = _556 * _558;
    float _578 = _560 * _558;
    int _580 = ~_566;
    int _582 = _580 + 1;
    int _584 = _582 + 1;
    float _586 = _562 * _558;
    int _588 = abs(_574);
    float _590 = _564 * (-2.0);
    int _592 = _584;
    if (!_498)
    {
        int _594 = ~_566;
        int _596 = _594 + 1;
        _592 = _596;
    }
    int _598 = _592;
    float _600 = -_496;
    float _602 = _600 + 1.0;
    float _604 = float(_588);
    float _606 = fma(_430, _590, _430);
    float _608 = float(_598);
    float _610 = fma(_590, _480, _480);
    int _612 = _542 ? 0 : 1;
    float _614 = sqrt(_450);
    bool _616 = !_320;
    int _618 = _616 ? 0 : 1;
    float _620 = _604 * _608;
    float _622 = fma(_350, (*spvDescriptorSet0.vp_c9)._m0[196].x, _610);
    int _624 = ~_612;
    int _626 = _624 + 1;
    int _628 = _626 + 1;
    float _630 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].y, _578);
    int _632 = abs(_618);
    float _634 = fma(_606, _570, _622);
    int _636 = _628;
    if (!_528)
    {
        int _638 = ~_612;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    float _644 = _620 * (-2.0);
    float _646 = _342 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _648 = sqrt(_418);
    float _650 = float(_632);
    float _652 = fma(_644, _484, _484);
    float _654 = float(_642);
    float _656 = fma(_470, _644, _470);
    float _658 = _330 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    float _660 = _634 * 0.15915493667125701904296875;
    float _662 = _338 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _664 = _650 * _654;
    float _666 = fma(_366, (*spvDescriptorSet0.vp_c9)._m0[196].z, _652);
    float _668 = in.m_51.x;
    float _670 = in.m_51.y;
    float _672 = in.m_51.z;
    float _674 = _510 * _646;
    float _676 = _664 * (-2.0);
    float _678 = fma(_656, _570, _666);
    float _680 = in.m_57.x;
    float _682 = in.m_57.y;
    float _684 = in.m_57.z;
    float _686 = _660 * 6.283185482025146484375;
    float _688 = sin(_686);
    float _690 = _648 * _662;
    float _692 = fma(_676, _482, _482);
    float _694 = fma(_426, _676, _426);
    float _696 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].x, _576);
    float _698 = _678 * 0.15915493667125701904296875;
    float _700 = fma(_362, (*spvDescriptorSet0.vp_c9)._m0[196].y, _692);
    float _702 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[143].z, _586);
    float _704 = _660 * 6.283185482025146484375;
    float _706 = cos(_704);
    float _708 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].x, _696);
    float _710 = fma(_694, _570, _700);
    float _712 = _614 * _658;
    float _714 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].y, _630);
    float _716 = _710 * 0.15915493667125701904296875;
    float _718 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[144].z, _702);
    float _720 = _698 * 6.283185482025146484375;
    float _722 = sin(_720);
    float _724 = _712 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _726 = _712 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _728 = _708 * _668;
    float _730 = _714 * _670;
    float _732 = _718 * _672;
    float _734 = _712 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _736 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _680);
    float _738 = _698 * 6.283185482025146484375;
    float _740 = cos(_738);
    float _742 = _728 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _744 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[24].x, _724);
    float _746 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _682);
    float _748 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _684);
    float _750 = _742 * _736;
    float _752 = _730 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _754 = _732 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _756 = _716 * 6.283185482025146484375;
    float _758 = sin(_756);
    float _760 = _688 * _722;
    float _762 = _706 * _722;
    float _764 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[25].x, _726);
    float _766 = fma(_674, (*spvDescriptorSet0.vp_c8)._m0[26].x, _734);
    float _768 = _752 * _746;
    float _770 = _754 * _748;
    bool _772 = _682 != 0.0;
    bool _774 = isnan(_682);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = _716 * 6.283185482025146484375;
    float _784 = cos(_782);
    float _786 = _706 * _740;
    float _788 = _688 * _740;
    bool _790 = _680 == 0.0;
    bool _792 = !_780;
    bool _794 = _790 && _792;
    bool _796 = _684 == 0.0;
    bool _798 = _796 && _794;
    float _800 = fma(_758, _760, _786);
    float _802 = -_762;
    float _804 = fma(_758, _788, _802);
    float _806 = fma(_758, _786, _760);
    float _808 = _688 * _784;
    float _810 = _784 * _722;
    float _812 = _784 * _740;
    float _814 = _706 * _784;
    float _816 = -_788;
    float _818 = fma(_758, _762, _816);
    float _820 = _800 * _768;
    float _822 = _808 * _768;
    float _824 = _804 * _768;
    float _826 = _800 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _828 = fma(_810, _750, _820);
    float _830 = -_758;
    float _832 = fma(_830, _750, _822);
    float _834 = fma(_812, _750, _824);
    float _836 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[24].z, _744);
    float _838 = in.m_59.x;
    float _840 = in.m_59.y;
    float _842 = in.m_59.z;
    float _844 = fma(_818, _770, _828);
    float _846 = fma(_806, _770, _834);
    float _848 = fma(_814, _770, _832);
    float _850 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[26].z, _766);
    float _852 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _854 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _856 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[24].w, _836);
    float _858 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[26].w, _850);
    float _860 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[24].x, _852);
    float _862 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[26].x, _854);
    float _864 = _856 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _866 = _858 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _868 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _860);
    float _870 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _862);
    float _872 = fma(_690, (*spvDescriptorSet0.vp_c8)._m0[25].z, _764);
    float _874 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _876 = _868 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _878 = _870 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _880 = fma(_478, (*spvDescriptorSet0.vp_c8)._m0[25].w, _872);
    float _882 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[25].x, _874);
    float _884 = _864 + _876;
    float _886 = _866 + _878;
    float _888 = _810 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _890 = _838;
    float _892 = _840;
    float _894 = _842;
    float _896 = _818;
    float _898 = _806;
    float _900 = _808;
    if (!_798)
    {
        float _902 = fma(_680, (*spvDescriptorSet0.vp_c9)._m0[17].y, _838);
        _890 = _902;
    }
    float _904 = _890;
    if (!_798)
    {
        float _906 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[17].y, _840);
        _892 = _906;
    }
    float _908 = _892;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _912 = _884 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _916 = _886 + _914;
    if (!_798)
    {
        float _918 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[17].y, _842);
        _894 = _918;
    }
    float _920 = _894;
    float _922 = _810 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _924 = _912 * _912;
    float _926 = _916 * _916;
    float _928 = _810 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _930 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[25].x, _888);
    float _932 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[24].x, _922);
    float _934 = _924 + _926;
    float _936 = fma(_812, (*spvDescriptorSet0.vp_c8)._m0[26].x, _928);
    float _938 = _800 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _940 = _800 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _942 = sqrt(_934);
    float _944 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _882);
    float _946 = -_758;
    float _948 = fma(_946, (*spvDescriptorSet0.vp_c8)._m0[25].z, _930);
    float _950 = -_758;
    float _952 = fma(_950, (*spvDescriptorSet0.vp_c8)._m0[24].z, _932);
    float _954 = -_758;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c8)._m0[26].z, _936);
    float _958 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[24].x, _938);
    float _960 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[25].x, _940);
    float _962 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[26].x, _826);
    float _964 = _818 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _966 = _818 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _968 = _880 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    float _970 = _944 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _972 = _818 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _974 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[24].x, _964);
    float _976 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[25].x, _966);
    float _978 = _968 + _970;
    bool _980 = _942 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _982 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[26].x, _972);
    float _984 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[24].z, _958);
    float _986 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[25].z, _960);
    float _988 = fma(_808, (*spvDescriptorSet0.vp_c8)._m0[26].z, _962);
    float _990 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[24].z, _974);
    float _992 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[25].z, _976);
    float _994 = fma(_814, (*spvDescriptorSet0.vp_c8)._m0[26].z, _982);
    float _996 = _976;
    float _998 = _974;
    float _1000 = _994;
    if (!_980)
    {
        _896 = _926;
    }
    float _1002 = _896;
    float _1004 = _1002;
    if (!_980)
    {
        _898 = _924;
    }
    float _1006 = _898;
    float _1008 = _1006;
    if (!_980)
    {
        _996 = _884;
    }
    float _1010 = _996;
    float _1012 = _1010;
    if (!_980)
    {
        _998 = _886;
    }
    float _1014 = _998;
    float _1016 = _1014;
    if (!_980)
    {
        _900 = _978;
    }
    float _1018 = _900;
    bool _1020 = !_980;
    float _1022 = _1018;
    if (!_1020)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1026 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1028 = _942 + _1026;
        float _1030 = rsqrt(_934);
        float _1032 = _1028 * _1024;
        float _1034 = _978 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1036 = _1032 * 0.15915493667125701904296875;
        float _1038 = _1036 * 6.283185482025146484375;
        float _1040 = sin(_1038);
        float _1042 = _1036 * 6.283185482025146484375;
        float _1044 = cos(_1042);
        float _1046 = fma(_1040, _1034, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1048 = _1030 * _1046;
        float _1050 = _1044 + (-1.0);
        float _1052 = fma(_912, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1054 = fma(_916, _1048, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1056 = _1050 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1058 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1060 = _1052 + _1058;
        float _1062 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1064 = _1054 + _1062;
        float _1066 = fma(_978, _1044, _1056);
        float _1068 = _1060 * _1060;
        float _1070 = _1064 * _1064;
        _1022 = _1066;
        _1008 = _1068;
        _1004 = _1070;
        _1012 = _1052;
        _1016 = _1054;
    }
    float _1072 = _1022;
    float _1074 = _1008;
    float _1076 = _1004;
    float _1078 = _1012;
    float _1080 = _1016;
    float _1082 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1084 = _1072 + _1082;
    float _1086 = _984 * _908;
    float _1088 = _986 * _908;
    float _1090 = _988 * _908;
    float _1092 = fma(_1084, _1084, _1074);
    float _1094 = fma(_952, _904, _1086);
    float _1096 = fma(_948, _904, _1088);
    float _1098 = _1092 + _1076;
    float _1100 = fma(_956, _904, _1090);
    float _1102 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1104 = fma(_990, _920, _1094);
    float _1106 = sqrt(_1098);
    float _1108 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1112 = fma(_992, _920, _1096);
    float _1114 = _1102 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1116 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1118 = _1110 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1120 = fma(_994, _920, _1100);
    out.m_61.x = _1114;
    out.m_61.y = _1116;
    out.m_61.z = _1118;
    out.m_63.x = _1104;
    out.m_63.y = _1112;
    out.m_63.z = _1120;
    bool _1122 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1124 = isnan(_1106);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1130 = _1126 || _1128;
    float _1132 = _1102;
    if (!_1130)
    {
        _1132 = 1.0;
    }
    float _1134 = _1132;
    bool _1136 = !_1130;
    float _1138 = _1134;
    if (!_1136)
    {
        bool _1140 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1142 = isnan(_1106);
        bool _1144 = _1140 || _1142;
        bool _1146 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1148 = _1144 || _1146;
        if (!_1148)
        {
            float _1150 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1152 = _1106 + _1150;
            float _1154 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1156 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1154;
            float _1158 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1160 = _1158 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1162 = 1.0 / _1156;
            float _1164 = _1152 * _1162;
            float _1166 = fma(_1164, _1160, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1138 = _1166;
            _1168 = true;
        }
        else
        {
            bool _1170 = _1106 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1172 = isnan(_1106);
            bool _1174 = _1170 || _1172;
            bool _1176 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1178 = _1174 || _1176;
            if (!_1178)
            {
                float _1180 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1182 = _1106 + _1180;
                float _1184 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1186 = _1184 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1188 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1190 = _1188 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1192 = 1.0 / _1186;
                float _1194 = _1182 * _1192;
                float _1196 = fma(_1194, _1190, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1138 = _1196;
                _1168 = true;
            }
            else
            {
                _1138 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1168 = false;
    float _1198 = _1138;
    float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1202 = _1072 + _1200;
    float _1204 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1206 = _1078 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1210 = _1080 + _1208;
    float _1212 = fma(_1202, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1214 = fma(_1206, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1216 = fma(_1210, _1198, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1212 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1214 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1216 + _1226;
    float _1230 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1232 = _1220 * _1220;
    float _1234 = fma(_1224, _1224, _1232);
    float _1236 = fma(_1228, _1228, _1234);
    float _1238 = rsqrt(_1236);
    float _1240 = sqrt(_1236);
    float _1242 = _1238 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1244 = _1224 * _1242;
    float _1246 = _1228 * _1242;
    float _1248 = _1244 * _1244;
    float _1250 = _1246 * _1246;
    float _1252 = _1248 + _1250;
    float _1254 = sqrt(_1252);
    bool _1256 = _1254 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1258 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1260 = _1254 + _1258;
    float _1262 = _1238;
    float _1264 = _1252;
    float _1266 = _1260;
    float _1268 = _1220;
    float _1270 = _1242;
    float _1272 = _1244;
    if (_1256)
    {
        float _1274 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1262 = _1274;
    }
    float _1276 = _1262;
    if (_1256)
    {
        float _1278 = rsqrt(_1252);
        _1264 = _1278;
    }
    float _1280 = _1264;
    if (_1256)
    {
        float _1282 = _1260 * _1276;
        _1266 = _1282;
    }
    float _1284 = _1266;
    if (_1256)
    {
        float _1286 = _1284 * 0.15915493667125701904296875;
        _1000 = _1286;
    }
    float _1288 = _1000;
    float _1290 = _1276;
    float _1292 = _1288;
    if (_1256)
    {
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = sin(_1294);
        _1290 = _1296;
    }
    float _1298 = _1290;
    float _1300 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1302 = precise::max(0.0, _1300);
    float _1304 = _1228;
    float _1306 = _1302;
    if (_1256)
    {
        float _1308 = _1288 * 6.283185482025146484375;
        float _1310 = cos(_1308);
        _1304 = _1310;
    }
    float _1312 = _1304;
    float _1314 = -_1242;
    float _1316 = -_1302;
    float _1318 = fma(_1220, _1314, _1316);
    if (!_1256)
    {
        _1268 = _1246;
    }
    float _1320 = _1268;
    float _1322 = _1320;
    if (_1256)
    {
        float _1324 = _1318 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1306 = _1324;
    }
    float _1326 = _1306;
    float _1328 = _1298;
    float _1330 = _1326;
    if (_1256)
    {
        float _1332 = fma(_1298, _1326, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = _1334;
    float _1338 = _1312;
    if (_1256)
    {
        float _1340 = _1312 + (-1.0);
        _1330 = _1340;
    }
    float _1342 = _1330;
    float _1344 = _1342;
    if (_1256)
    {
        float _1346 = _1280 * _1334;
        _1270 = _1346;
    }
    float _1348 = _1270;
    if (!_1256)
    {
        _1336 = _1318;
    }
    float _1350 = _1336;
    float _1352 = _1350;
    if (_1256)
    {
        float _1354 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1292 = _1354;
    }
    float _1356 = _1292;
    if (_1256)
    {
        float _1358 = _1244 * _1348;
        _1272 = _1358;
    }
    float _1360 = _1272;
    if (!_1256)
    {
        _1344 = _1248;
    }
    float _1362 = _1344;
    float _1364 = _1362;
    if (_1256)
    {
        float _1366 = _1246 * _1348;
        _1322 = _1366;
    }
    float _1368 = _1322;
    if (_1256)
    {
        float _1370 = fma(_1318, _1312, _1356);
        _1352 = _1370;
    }
    float _1372 = _1352;
    if (_1256)
    {
        float _1374 = _1360 * _1360;
        _1364 = _1374;
    }
    float _1376 = _1364;
    if (!_1256)
    {
        _1338 = _1250;
    }
    float _1378 = _1338;
    float _1380 = _1378;
    if (_1256)
    {
        float _1382 = _1368 * _1368;
        _1380 = _1382;
    }
    float _1384 = _1380;
    float _1386 = fma(_1372, _1372, _1376);
    float _1388 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1390 = _1386 + _1384;
    float _1392 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1394 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1396 = fma(_1240, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1394);
    float _1398 = precise::clamp(_1396, 0.0, 1.0);
    float _1400 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1402 = rsqrt(_1390);
    float _1404 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1392);
    float _1406 = -_1398;
    float _1408 = _1406 + 1.0;
    float _1410 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1400);
    float _1412 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1388);
    float _1414 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1404);
    float _1416 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1418 = abs(_1408);
    float _1420 = log2(_1418);
    float _1422 = _1414 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1424 = fma(_1214, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1416);
    float _1426 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1410);
    float _1428 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1412);
    float _1430 = _1422 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1216, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1424);
    float _1434 = _1426 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1436 = _1402 * _1360;
    float _1438 = -_1430;
    float _1440 = fma(_1438, _1230, 1.0);
    float _1442 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1444 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1448 = _1402 * _1372;
    float _1450 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1452 = _1402 * _1368;
    float _1454 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1446);
    float _1456 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1458 = -_1450;
    float _1460 = fma(_1448, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1458);
    float _1462 = log2(_1440);
    float _1464 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1454);
    float _1466 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1468 = -_1452;
    float _1470 = fma(_1468, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1460);
    float _1472 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1474 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1464);
    float _1476 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1466);
    float _1478 = fma(_1470, -0.5, 0.5);
    float _1480 = exp2(_1456);
    float _1482 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1472);
    float _1484 = fma(_1470, 0.5, 0.5);
    float _1486 = _1448 + 1.0;
    float _1488 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1476);
    float _1490 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1482);
    float _1492 = fma(_1484, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1494 = 1.0 / _1474;
    float _1496 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1490);
    float _1498 = _1462 * 0.693147182464599609375;
    float _1500 = sqrt(_1478);
    float _1502 = -_1448;
    float _1504 = fma(_1480, _1486, _1502);
    float _1506 = fma(_1484, _1492, -0.212114393711090087890625);
    float _1508 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1488);
    float _1510 = fma(_1504, 0.5, 0.5);
    float _1512 = fma(_1484, _1506, 1.570728778839111328125);
    float _1514 = _1496 * _1494;
    float _1516 = _1508 * _1494;
    float _1518 = _1498 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1520 = fma(_1514, 0.5, 0.5);
    float _1522 = fma(_1516, -0.5, 0.5);
    float _1524 = _1500 * 0.636619746685028076171875;
    float3 _3995 = float3(_1520, _1522, _1518);
    float _1526 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3995, float3(0.0), isnan(_3995)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3995, float3(0.0), isnan(_3995)), level(0.0)).x;
    float3 _4006 = float3(_1520, _1522, _1518);
    float4 _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4006, float3(0.0), isnan(_4006)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4006, float3(0.0), isnan(_4006)), level(0.0)).xyzw;
    float _1531 = _1529.x;
    float _1533 = _1529.y;
    float _1535 = _1529.z;
    float _1537 = _1529.w;
    float _1539 = -_1512;
    float _1541 = fma(_1524, _1539, 1.0);
    float2 _4028 = float2(_1541, _1510);
    float3 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4028, float2(0.0), isnan(_4028)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4028, float2(0.0), isnan(_4028)), level(0.0)).xyz;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1420 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1555 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_65.x = _1214;
    out.m_65.y = _1212;
    out.m_65.z = _1216;
    float _1557 = fma(_1442, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1555);
    float _1559 = exp2(_1553);
    float _1561 = fma(_1422, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1557);
    float _1563 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1561);
    float _1565 = _1563 + _1474;
    out.gl_Position.x = _1496;
    out.gl_Position.y = _1508;
    out.gl_Position.z = _1563;
    out.gl_Position.w = _1474;
    float _1567 = _1565 * 0.5;
    float _1569 = -_1559;
    float _1571 = _1569 + 1.0;
    float _1573 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1575 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_67.z = _1567;
    out.m_67.w = _1474;
    out.m_47.x = _1575;
    float _1577 = _1573 * _1526;
    float _1579 = -_1573;
    float _1581 = _1579 + 1.0;
    float _1583 = _1537 * _1577;
    float _1585 = _1537 * _1581;
    float _1587 = _1551 * _1577;
    float _1589 = fma(_1547, _1583, _1531);
    float _1591 = fma(_1549, _1583, _1533);
    float _1593 = fma(_1537, _1587, _1535);
    out.m_69.x = _1589;
    out.m_69.y = _1591;
    out.m_69.z = _1593;
    out.m_69.w = _1585;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

