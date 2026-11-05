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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_59 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _814 = false;
    bool _410 = false;
    bool _284 = false;
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
        float _1302 = as_type<float>(_104);
        out.gl_Position.z = _1302;
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
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_140);
        out.gl_Position.z = _1371;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _164);
    float _260 = fma(_254, _142, _162);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -_308;
    float _316 = _314 + 1.0;
    bool _318 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_292);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _312;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _336;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = _296 * _330;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = in.m_51.x;
    float _350 = in.m_51.y;
    float _352 = in.m_51.z;
    float _354 = _328 * _316;
    float _356 = fma(_334, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = fma(_338, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = -_328;
    float _364 = _362 + 1.0;
    float _366 = _356 * _354;
    float _368 = _358 * _354;
    float _370 = _360 * _354;
    float _372 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _378 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _372);
    float _380 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _382 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    float _384 = _378 * _348;
    float _386 = _380 * _350;
    float _388 = _382 * _352;
    bool _390 = !_340;
    float _408;
    if (!_390)
    {
        float _392 = in.m_53.x;
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _396 = _392 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = true;
    }
    else
    {
        float _412 = float(_88);
        float _414 = 1.0 / _412;
        float _416 = _122 * _414;
        _408 = _416;
    }
    _410 = false;
    float _418 = _408;
    float _420 = in.m_55.x;
    float _422 = in.m_55.y;
    float _424 = in.m_55.z;
    float _426 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _428 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _430 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _432 = in.m_53.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    float _438 = in.m_57.x;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _442 = _440 != 0;
    float _444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _422);
    float _446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _420);
    float _448 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _424);
    float _450 = _426 * _444;
    float _452 = _428 * _446;
    float _454 = _430 * _448;
    float _456 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _458 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _460 = _450 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _462 = _450 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _464 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _456);
    float _466 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _458);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[24].x, _460);
    float _470 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _462);
    float _472 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _464);
    float _474 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _476 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[24].z, _468);
    float _478 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[26].z, _470);
    float _480 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _482 = _474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _484 = _476 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _486 = _478 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _488 = _450 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _490 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = isnan(_418);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _480 + _484;
    float _504 = _482 + _486;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _512 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _504 + _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _438;
    if (_436)
    {
        float _524 = in.m_53.x;
        _520 = _524;
    }
    float _526 = _520;
    float _528 = 1.0 / _508;
    float _530 = _514 * _514;
    float _532 = _518 * _518;
    float _534 = in.m_57.y;
    float _536 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _510);
    float _538 = _530 + _532;
    float _540 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[25].x, _488);
    bool _542 = _432 > 0.5;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    float _548 = sqrt(_538);
    float _550 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _536);
    float _552 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[25].z, _540);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _418 + _554;
    bool _558 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_418);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_500;
    float _572 = _570 + 1.0;
    float _574 = _546 * _528;
    float _576 = _550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _580 = _552 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _582 = fma(_574, _556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _568 * _572;
    bool _586 = _526 > 0.5;
    bool _588 = _586 && _436;
    float _590 = _576 + _580;
    float _592 = _582 * _584;
    bool _594 = _548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _598 = -_534;
    float _600 = _598 + 1.0;
    float _602 = _580;
    float _604 = _534;
    float _606 = _576;
    float _608 = _600;
    float _610 = _572;
    float _612 = _582;
    float _614 = _584;
    if (!_436)
    {
        _602 = _438;
    }
    float _616 = _602;
    float _618 = _616;
    if (_442)
    {
        float _620 = _542 ? _600 : _534;
        _604 = _620;
    }
    float _622 = _604;
    if (_588)
    {
        float _624 = -_438;
        float _626 = _624 + 1.0;
        _522 = _626;
    }
    float _628 = _522;
    if (!_594)
    {
        _606 = _532;
    }
    float _630 = _606;
    float _632 = _630;
    if (!_594)
    {
        _608 = _530;
    }
    float _634 = _608;
    float _636 = _634;
    if (!_594)
    {
        _610 = _502;
    }
    float _638 = _610;
    float _640 = _638;
    if (!_594)
    {
        _612 = _504;
    }
    float _642 = _612;
    float _644 = _642;
    if (!_594)
    {
        _614 = _590;
    }
    float _646 = _614;
    bool _648 = !_594;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _548 + _654;
        float _658 = _590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = rsqrt(_538);
        float _662 = _656 * _652;
        float _664 = _662 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = sin(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = cos(_670);
        float _674 = fma(_668, _658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _676 = _660 * _674;
        float _678 = _672 + (-1.0);
        float _680 = fma(_514, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _682 = fma(_518, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _688 = _680 + _686;
        float _690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _692 = _682 + _690;
        float _694 = fma(_590, _672, _684);
        float _696 = _688 * _688;
        float _698 = _692 * _692;
        _650 = _694;
        _636 = _696;
        _632 = _698;
        _640 = _680;
        _644 = _682;
    }
    float _700 = _650;
    float _702 = _636;
    float _704 = _632;
    float _706 = _640;
    float _708 = _644;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _712 = _700 + _710;
    float _714 = -_568;
    float _716 = _714 + 1.0;
    if (_436)
    {
        _618 = _628;
    }
    float _718 = _618;
    float _720 = _622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _722 = fma(_712, _712, _702);
    float _724 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _726 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _728 = _722 + _704;
    float _730 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[116].x, _724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _734 = sqrt(_728);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = _720 * _596;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _748 = _726 * _578;
    float _750 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _748;
    out.m_59.y = _744;
    bool _764 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _766 = isnan(_734);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _772 = _768 || _770;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _758;
    out.m_63.y = _750;
    out.m_63.z = _752;
    out.m_65.x = _754;
    out.m_65.y = _756;
    out.m_65.z = _760;
    out.m_65.w = _762;
    float _774 = _738;
    float _776 = _730;
    float _778 = _734;
    if (!_772)
    {
        _774 = 1.0;
    }
    float _780 = _774;
    bool _782 = !_772;
    float _784 = _780;
    if (!_782)
    {
        bool _786 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _788 = isnan(_734);
        bool _790 = _786 || _788;
        bool _792 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _794 = _790 || _792;
        if (!_794)
        {
            float _796 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _798 = _734 + _796;
            float _800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _802 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _800;
            float _804 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _806 = _804 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _808 = 1.0 / _802;
            float _810 = _798 * _808;
            float _812 = fma(_810, _806, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _784 = _812;
            _814 = true;
        }
        else
        {
            bool _816 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _818 = isnan(_734);
            bool _820 = _816 || _818;
            bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _824 = _820 || _822;
            if (!_824)
            {
                float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _828 = _734 + _826;
                float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _832 = _830 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _838 = 1.0 / _832;
                float _840 = _828 * _838;
                float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _784 = _842;
                _814 = true;
            }
            else
            {
                _784 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _814 = false;
    float _844 = _784;
    float _846 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _848 = _700 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _852 = _706 + _850;
    float _854 = fma(_848, _844, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _856 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _858 = _708 + _856;
    float _860 = fma(_852, _844, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _864 = _854 + _862;
    float _866 = fma(_858, _844, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = _860 + _868;
    float _872 = _864 * _864;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _866 + _874;
    float _878 = fma(_870, _870, _872);
    float _880 = fma(_876, _876, _878);
    float _882 = rsqrt(_880);
    float _884 = _882 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _886 = _870 * _884;
    float _888 = _876 * _884;
    float _890 = _886 * _886;
    float _892 = _888 * _888;
    float _894 = _890 + _892;
    float _896 = sqrt(_894);
    bool _898 = _896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _896 + _900;
    float _904 = _876;
    float _906 = _894;
    float _908 = _902;
    float _910 = _864;
    float _912 = _886;
    if (_898)
    {
        float _914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _914;
    }
    float _916 = _904;
    if (_898)
    {
        float _918 = rsqrt(_894);
        _906 = _918;
    }
    float _920 = _906;
    if (_898)
    {
        float _922 = _902 * _916;
        _908 = _922;
    }
    float _924 = _908;
    if (_898)
    {
        float _926 = _924 * 0.15915493667125701904296875;
        _776 = _926;
    }
    float _928 = _776;
    float _930 = _882;
    if (_898)
    {
        float _932 = _928 * 6.283185482025146484375;
        float _934 = sin(_932);
        _930 = _934;
    }
    float _936 = _930;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _742;
    float _944 = _940;
    float _946 = _938;
    if (_898)
    {
        float _948 = _928 * 6.283185482025146484375;
        float _950 = cos(_948);
        _942 = _950;
    }
    float _952 = _942;
    float _954 = -_884;
    float _956 = -_940;
    float _958 = fma(_864, _954, _956);
    if (!_898)
    {
        _944 = _888;
    }
    float _960 = _944;
    float _962 = _960;
    if (_898)
    {
        float _964 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _946 = _964;
    }
    float _966 = _946;
    float _968 = _936;
    float _970 = _966;
    if (_898)
    {
        float _972 = fma(_936, _966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _974;
    if (_898)
    {
        float _978 = _952 + (-1.0);
        _970 = _978;
    }
    float _980 = _970;
    float _982 = _980;
    if (_898)
    {
        float _984 = _920 * _974;
        _778 = _984;
    }
    float _986 = _778;
    if (!_898)
    {
        _976 = _958;
    }
    float _988 = _976;
    float _990 = sqrt(_880);
    float _992 = _988;
    if (_898)
    {
        float _994 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _994;
    }
    float _996 = _910;
    float _998 = _996;
    if (_898)
    {
        float _1000 = _886 * _986;
        _912 = _1000;
    }
    float _1002 = _912;
    if (!_898)
    {
        _982 = _890;
    }
    float _1004 = _982;
    float _1006 = _1004;
    if (_898)
    {
        float _1008 = _888 * _986;
        _962 = _1008;
    }
    float _1010 = _962;
    if (_898)
    {
        float _1012 = fma(_958, _952, _996);
        _992 = _1012;
    }
    float _1014 = _992;
    if (_898)
    {
        float _1016 = _1002 * _1002;
        _1006 = _1016;
    }
    float _1018 = _1006;
    if (!_898)
    {
        _998 = _892;
    }
    float _1020 = _998;
    float _1022 = _1020;
    if (_898)
    {
        float _1024 = _1010 * _1010;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = fma(_1014, _1014, _1018);
    float _1030 = _854 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1032 = _1028 + _1026;
    float _1034 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1030);
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1038 = fma(_990, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1036);
    float _1040 = precise::clamp(_1038, 0.0, 1.0);
    float _1042 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1044 = rsqrt(_1032);
    float _1046 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1048 = -_1040;
    float _1050 = _1048 + 1.0;
    float _1052 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1054 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1042);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1058 = _854 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1060 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1052);
    float _1062 = abs(_1050);
    float _1064 = log2(_1062);
    float _1066 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1054);
    float _1068 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1058);
    float _1070 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1060);
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1074 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1076 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1080 = _1044 * _1002;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1084 = _1044 * _1014;
    float _1086 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1082);
    float _1092 = _1044 * _1010;
    float _1094 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1098 = -_1088;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1098);
    float _1102 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1090);
    float _1104 = -_1086;
    float _1106 = fma(_1104, _1072, 1.0);
    float _1108 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1110 = -_1092;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1100);
    float _1114 = exp2(_1096);
    float _1116 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1102);
    float _1118 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1120 = fma(_1112, -0.5, 0.5);
    float _1122 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1108);
    float _1124 = fma(_1112, 0.5, 0.5);
    float _1126 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1118);
    float _1128 = _1084 + 1.0;
    float _1130 = log2(_1106);
    float _1132 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1122);
    float _1134 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = fma(_1124, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1138 = fma(_1124, _1136, -0.212114393711090087890625);
    float _1140 = 1.0 / _1116;
    float _1142 = -_1084;
    float _1144 = fma(_1114, _1128, _1142);
    float _1146 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1148 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1132);
    float _1150 = fma(_1124, _1138, 1.570728778839111328125);
    float _1152 = fma(_1144, 0.5, 0.5);
    float _1154 = sqrt(_1120);
    float _1156 = _1130 * 0.693147182464599609375;
    float _1158 = _1146 * _1140;
    float _1160 = _1148 * _1140;
    float _1162 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1164 = fma(_1158, 0.5, 0.5);
    float _1166 = fma(_1160, -0.5, 0.5);
    float _1168 = _1154 * 0.636619746685028076171875;
    float3 _3082 = float3(_1164, _1166, _1162);
    float _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3082, float3(0.0), isnan(_3082)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3082, float3(0.0), isnan(_3082)), level(0.0)).x;
    float3 _3093 = float3(_1164, _1166, _1162);
    float4 _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3093, float3(0.0), isnan(_3093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3093, float3(0.0), isnan(_3093)), level(0.0)).xyzw;
    float _1175 = _1173.x;
    float _1177 = _1173.y;
    float _1179 = _1173.z;
    float _1181 = _1173.w;
    float _1183 = -_1150;
    float _1185 = fma(_1168, _1183, 1.0);
    float2 _3115 = float2(_1185, _1152);
    float3 _1189 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3115, float2(0.0), isnan(_3115)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3115, float2(0.0), isnan(_3115)), level(0.0)).xyz;
    float _1191 = _1189.x;
    float _1193 = _1189.y;
    float _1195 = _1189.z;
    float _1197 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1199 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1201 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1199);
    float _1203 = exp2(_1197);
    float _1205 = _1116 * 0.5;
    float _1207 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1201);
    float _1209 = fma(_1148, -0.5, _1205);
    float _1211 = _1146 + _1116;
    float _1213 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1207);
    float _1215 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1217 = _1211 * 0.5;
    float _1219 = _1213 + _1116;
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1148;
    out.gl_Position.z = _1213;
    out.gl_Position.w = _1116;
    float _1221 = _1219 * 0.5;
    float _1223 = -_1203;
    float _1225 = _1223 + 1.0;
    out.m_47.x = _1215;
    float _1227 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1217;
    out.m_67.y = _1209;
    out.m_67.z = _1221;
    out.m_67.w = _1116;
    float _1229 = -_1227;
    float _1231 = _1229 + 1.0;
    float _1233 = _1227 * _1170;
    float _1235 = _1181 * _1233;
    float _1237 = _1195 * _1233;
    float _1239 = fma(_1191, _1235, _1175);
    float _1241 = fma(_1193, _1235, _1177);
    float _1243 = _1181 * _1231;
    float _1245 = fma(_1181, _1237, _1179);
    out.m_69.x = _1239;
    out.m_69.y = _1241;
    out.m_69.z = _1245;
    out.m_69.w = _1243;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _814 = false;
    bool _410 = false;
    bool _284 = false;
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
        float _1302 = as_type<float>(_104);
        out.gl_Position.z = _1302;
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
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_140);
        out.gl_Position.z = _1371;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _164);
    float _260 = fma(_254, _142, _162);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -_308;
    float _316 = _314 + 1.0;
    bool _318 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_292);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _312;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _336;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = _296 * _330;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = in.m_51.x;
    float _350 = in.m_51.y;
    float _352 = in.m_51.z;
    float _354 = _328 * _316;
    float _356 = fma(_334, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = fma(_338, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = -_328;
    float _364 = _362 + 1.0;
    float _366 = _356 * _354;
    float _368 = _358 * _354;
    float _370 = _360 * _354;
    float _372 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _378 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _372);
    float _380 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _382 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    float _384 = _378 * _348;
    float _386 = _380 * _350;
    float _388 = _382 * _352;
    bool _390 = !_340;
    float _408;
    if (!_390)
    {
        float _392 = in.m_53.x;
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _396 = _392 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = true;
    }
    else
    {
        float _412 = float(_88);
        float _414 = 1.0 / _412;
        float _416 = _122 * _414;
        _408 = _416;
    }
    _410 = false;
    float _418 = _408;
    float _420 = in.m_55.x;
    float _422 = in.m_55.y;
    float _424 = in.m_55.z;
    float _426 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _428 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _430 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _432 = in.m_53.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    float _438 = in.m_57.x;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _442 = _440 != 0;
    float _444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _422);
    float _446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _420);
    float _448 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _424);
    float _450 = _426 * _444;
    float _452 = _428 * _446;
    float _454 = _430 * _448;
    float _456 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _458 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _460 = _450 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _462 = _450 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _464 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _456);
    float _466 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _458);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[24].x, _460);
    float _470 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _462);
    float _472 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _464);
    float _474 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _476 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[24].z, _468);
    float _478 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[26].z, _470);
    float _480 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _482 = _474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _484 = _476 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _486 = _478 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _488 = _450 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _490 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = isnan(_418);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _480 + _484;
    float _504 = _482 + _486;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _512 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _504 + _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _438;
    if (_436)
    {
        float _524 = in.m_53.x;
        _520 = _524;
    }
    float _526 = _520;
    float _528 = 1.0 / _508;
    float _530 = _514 * _514;
    float _532 = _518 * _518;
    float _534 = in.m_57.y;
    float _536 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _510);
    float _538 = _530 + _532;
    float _540 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[25].x, _488);
    bool _542 = _432 > 0.5;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    float _548 = sqrt(_538);
    float _550 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _536);
    float _552 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[25].z, _540);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _418 + _554;
    bool _558 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_418);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_500;
    float _572 = _570 + 1.0;
    float _574 = _546 * _528;
    float _576 = _550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _580 = _552 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _582 = fma(_574, _556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _568 * _572;
    bool _586 = _526 > 0.5;
    bool _588 = _586 && _436;
    float _590 = _576 + _580;
    float _592 = _582 * _584;
    bool _594 = _548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _598 = -_534;
    float _600 = _598 + 1.0;
    float _602 = _580;
    float _604 = _534;
    float _606 = _576;
    float _608 = _600;
    float _610 = _572;
    float _612 = _582;
    float _614 = _584;
    if (!_436)
    {
        _602 = _438;
    }
    float _616 = _602;
    float _618 = _616;
    if (_442)
    {
        float _620 = _542 ? _600 : _534;
        _604 = _620;
    }
    float _622 = _604;
    if (_588)
    {
        float _624 = -_438;
        float _626 = _624 + 1.0;
        _522 = _626;
    }
    float _628 = _522;
    if (!_594)
    {
        _606 = _532;
    }
    float _630 = _606;
    float _632 = _630;
    if (!_594)
    {
        _608 = _530;
    }
    float _634 = _608;
    float _636 = _634;
    if (!_594)
    {
        _610 = _502;
    }
    float _638 = _610;
    float _640 = _638;
    if (!_594)
    {
        _612 = _504;
    }
    float _642 = _612;
    float _644 = _642;
    if (!_594)
    {
        _614 = _590;
    }
    float _646 = _614;
    bool _648 = !_594;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _548 + _654;
        float _658 = _590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = rsqrt(_538);
        float _662 = _656 * _652;
        float _664 = _662 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = sin(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = cos(_670);
        float _674 = fma(_668, _658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _676 = _660 * _674;
        float _678 = _672 + (-1.0);
        float _680 = fma(_514, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _682 = fma(_518, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _688 = _680 + _686;
        float _690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _692 = _682 + _690;
        float _694 = fma(_590, _672, _684);
        float _696 = _688 * _688;
        float _698 = _692 * _692;
        _650 = _694;
        _636 = _696;
        _632 = _698;
        _640 = _680;
        _644 = _682;
    }
    float _700 = _650;
    float _702 = _636;
    float _704 = _632;
    float _706 = _640;
    float _708 = _644;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _712 = _700 + _710;
    float _714 = -_568;
    float _716 = _714 + 1.0;
    if (_436)
    {
        _618 = _628;
    }
    float _718 = _618;
    float _720 = _622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _722 = fma(_712, _712, _702);
    float _724 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _726 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _728 = _722 + _704;
    float _730 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[116].x, _724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _734 = sqrt(_728);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = _720 * _596;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _748 = _726 * _578;
    float _750 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _748;
    out.m_59.y = _744;
    bool _764 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _766 = isnan(_734);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _772 = _768 || _770;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _758;
    out.m_63.y = _750;
    out.m_63.z = _752;
    out.m_65.x = _754;
    out.m_65.y = _756;
    out.m_65.z = _760;
    out.m_65.w = _762;
    float _774 = _738;
    float _776 = _730;
    float _778 = _734;
    if (!_772)
    {
        _774 = 1.0;
    }
    float _780 = _774;
    bool _782 = !_772;
    float _784 = _780;
    if (!_782)
    {
        bool _786 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _788 = isnan(_734);
        bool _790 = _786 || _788;
        bool _792 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _794 = _790 || _792;
        if (!_794)
        {
            float _796 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _798 = _734 + _796;
            float _800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _802 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _800;
            float _804 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _806 = _804 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _808 = 1.0 / _802;
            float _810 = _798 * _808;
            float _812 = fma(_810, _806, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _784 = _812;
            _814 = true;
        }
        else
        {
            bool _816 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _818 = isnan(_734);
            bool _820 = _816 || _818;
            bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _824 = _820 || _822;
            if (!_824)
            {
                float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _828 = _734 + _826;
                float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _832 = _830 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _838 = 1.0 / _832;
                float _840 = _828 * _838;
                float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _784 = _842;
                _814 = true;
            }
            else
            {
                _784 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _814 = false;
    float _844 = _784;
    float _846 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _848 = _700 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _852 = _706 + _850;
    float _854 = fma(_848, _844, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _856 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _858 = _708 + _856;
    float _860 = fma(_852, _844, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _864 = _854 + _862;
    float _866 = fma(_858, _844, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = _860 + _868;
    float _872 = _864 * _864;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _866 + _874;
    float _878 = fma(_870, _870, _872);
    float _880 = fma(_876, _876, _878);
    float _882 = rsqrt(_880);
    float _884 = _882 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _886 = _870 * _884;
    float _888 = _876 * _884;
    float _890 = _886 * _886;
    float _892 = _888 * _888;
    float _894 = _890 + _892;
    float _896 = sqrt(_894);
    bool _898 = _896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _896 + _900;
    float _904 = _876;
    float _906 = _894;
    float _908 = _902;
    float _910 = _864;
    float _912 = _886;
    if (_898)
    {
        float _914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _914;
    }
    float _916 = _904;
    if (_898)
    {
        float _918 = rsqrt(_894);
        _906 = _918;
    }
    float _920 = _906;
    if (_898)
    {
        float _922 = _902 * _916;
        _908 = _922;
    }
    float _924 = _908;
    if (_898)
    {
        float _926 = _924 * 0.15915493667125701904296875;
        _776 = _926;
    }
    float _928 = _776;
    float _930 = _882;
    if (_898)
    {
        float _932 = _928 * 6.283185482025146484375;
        float _934 = sin(_932);
        _930 = _934;
    }
    float _936 = _930;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _742;
    float _944 = _940;
    float _946 = _938;
    if (_898)
    {
        float _948 = _928 * 6.283185482025146484375;
        float _950 = cos(_948);
        _942 = _950;
    }
    float _952 = _942;
    float _954 = -_884;
    float _956 = -_940;
    float _958 = fma(_864, _954, _956);
    if (!_898)
    {
        _944 = _888;
    }
    float _960 = _944;
    float _962 = _960;
    if (_898)
    {
        float _964 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _946 = _964;
    }
    float _966 = _946;
    float _968 = _936;
    float _970 = _966;
    if (_898)
    {
        float _972 = fma(_936, _966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _974;
    if (_898)
    {
        float _978 = _952 + (-1.0);
        _970 = _978;
    }
    float _980 = _970;
    float _982 = _980;
    if (_898)
    {
        float _984 = _920 * _974;
        _778 = _984;
    }
    float _986 = _778;
    if (!_898)
    {
        _976 = _958;
    }
    float _988 = _976;
    float _990 = sqrt(_880);
    float _992 = _988;
    if (_898)
    {
        float _994 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _994;
    }
    float _996 = _910;
    float _998 = _996;
    if (_898)
    {
        float _1000 = _886 * _986;
        _912 = _1000;
    }
    float _1002 = _912;
    if (!_898)
    {
        _982 = _890;
    }
    float _1004 = _982;
    float _1006 = _1004;
    if (_898)
    {
        float _1008 = _888 * _986;
        _962 = _1008;
    }
    float _1010 = _962;
    if (_898)
    {
        float _1012 = fma(_958, _952, _996);
        _992 = _1012;
    }
    float _1014 = _992;
    if (_898)
    {
        float _1016 = _1002 * _1002;
        _1006 = _1016;
    }
    float _1018 = _1006;
    if (!_898)
    {
        _998 = _892;
    }
    float _1020 = _998;
    float _1022 = _1020;
    if (_898)
    {
        float _1024 = _1010 * _1010;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = fma(_1014, _1014, _1018);
    float _1030 = _854 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1032 = _1028 + _1026;
    float _1034 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1030);
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1038 = fma(_990, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1036);
    float _1040 = precise::clamp(_1038, 0.0, 1.0);
    float _1042 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1044 = rsqrt(_1032);
    float _1046 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1048 = -_1040;
    float _1050 = _1048 + 1.0;
    float _1052 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1054 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1042);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1058 = _854 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1060 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1052);
    float _1062 = abs(_1050);
    float _1064 = log2(_1062);
    float _1066 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1054);
    float _1068 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1058);
    float _1070 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1060);
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1074 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1076 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1080 = _1044 * _1002;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1084 = _1044 * _1014;
    float _1086 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1082);
    float _1092 = _1044 * _1010;
    float _1094 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1098 = -_1088;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1098);
    float _1102 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1090);
    float _1104 = -_1086;
    float _1106 = fma(_1104, _1072, 1.0);
    float _1108 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1110 = -_1092;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1100);
    float _1114 = exp2(_1096);
    float _1116 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1102);
    float _1118 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1120 = fma(_1112, -0.5, 0.5);
    float _1122 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1108);
    float _1124 = fma(_1112, 0.5, 0.5);
    float _1126 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1118);
    float _1128 = _1084 + 1.0;
    float _1130 = log2(_1106);
    float _1132 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1122);
    float _1134 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = fma(_1124, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1138 = fma(_1124, _1136, -0.212114393711090087890625);
    float _1140 = 1.0 / _1116;
    float _1142 = -_1084;
    float _1144 = fma(_1114, _1128, _1142);
    float _1146 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1148 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1132);
    float _1150 = fma(_1124, _1138, 1.570728778839111328125);
    float _1152 = fma(_1144, 0.5, 0.5);
    float _1154 = sqrt(_1120);
    float _1156 = _1130 * 0.693147182464599609375;
    float _1158 = _1146 * _1140;
    float _1160 = _1148 * _1140;
    float _1162 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1164 = fma(_1158, 0.5, 0.5);
    float _1166 = fma(_1160, -0.5, 0.5);
    float _1168 = _1154 * 0.636619746685028076171875;
    float3 _3082 = float3(_1164, _1166, _1162);
    float _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3082, float3(0.0), isnan(_3082)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3082, float3(0.0), isnan(_3082)), level(0.0)).x;
    float3 _3093 = float3(_1164, _1166, _1162);
    float4 _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3093, float3(0.0), isnan(_3093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3093, float3(0.0), isnan(_3093)), level(0.0)).xyzw;
    float _1175 = _1173.x;
    float _1177 = _1173.y;
    float _1179 = _1173.z;
    float _1181 = _1173.w;
    float _1183 = -_1150;
    float _1185 = fma(_1168, _1183, 1.0);
    float2 _3115 = float2(_1185, _1152);
    float3 _1189 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3115, float2(0.0), isnan(_3115)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3115, float2(0.0), isnan(_3115)), level(0.0)).xyz;
    float _1191 = _1189.x;
    float _1193 = _1189.y;
    float _1195 = _1189.z;
    float _1197 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1199 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1201 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1199);
    float _1203 = exp2(_1197);
    float _1205 = _1116 * 0.5;
    float _1207 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1201);
    float _1209 = fma(_1148, -0.5, _1205);
    float _1211 = _1146 + _1116;
    float _1213 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1207);
    float _1215 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1217 = _1211 * 0.5;
    float _1219 = _1213 + _1116;
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1148;
    out.gl_Position.z = _1213;
    out.gl_Position.w = _1116;
    float _1221 = _1219 * 0.5;
    float _1223 = -_1203;
    float _1225 = _1223 + 1.0;
    out.m_47.x = _1215;
    float _1227 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1217;
    out.m_67.y = _1209;
    out.m_67.z = _1221;
    out.m_67.w = _1116;
    float _1229 = -_1227;
    float _1231 = _1229 + 1.0;
    float _1233 = _1227 * _1170;
    float _1235 = _1181 * _1233;
    float _1237 = _1195 * _1233;
    float _1239 = fma(_1191, _1235, _1175);
    float _1241 = fma(_1193, _1235, _1177);
    float _1243 = _1181 * _1231;
    float _1245 = fma(_1181, _1237, _1179);
    out.m_69.x = _1239;
    out.m_69.y = _1241;
    out.m_69.z = _1245;
    out.m_69.w = _1243;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _814 = false;
    bool _410 = false;
    bool _284 = false;
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
        float _1302 = as_type<float>(_104);
        out.gl_Position.z = _1302;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_49.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_118)
    {
        float _124 = float(_88);
        _98 = _124;
    }
    float _126 = _98;
    bool _128 = _122 >= _126;
    bool _130 = !_118;
    bool _132 = _128 || _130;
    float _134 = _126;
    if (_132)
    {
        _134 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _134;
    if (_132)
    {
        out.m_47.x = 0.0;
    }
    if (_132)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_132)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1371 = as_type<float>(_140);
        out.gl_Position.z = _1371;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    float _144 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _146 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _148 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _150 = _146 || _148;
    bool _152 = isnan(1.0);
    bool _154 = _150 || _152;
    float _156 = in.m_49.x;
    float _158 = in.m_49.y;
    float _160 = in.m_49.z;
    float _162 = in.m_44.x;
    float _164 = in.m_44.y;
    float _166 = in.m_44.z;
    float _168 = 0.0;
    float _170 = _144;
    if (!_154)
    {
        float _172 = _144 * _144;
        float _174 = _172 * 0.5;
        _168 = _174;
    }
    float _176 = _168;
    float _178 = _176;
    if (!_154)
    {
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _178 = _180;
    }
    float _182 = _178;
    bool _184 = !_154;
    float _186 = _182;
    if (!_184)
    {
        float _188 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _190 = log2(_188);
        float _192 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _194 = _192 + 1.0;
        float _196 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = _144 * _190;
        float _200 = 1.0 / _194;
        float _202 = _196 * 0.693147182464599609375;
        float _204 = exp2(_198);
        float _206 = 1.0 / _202;
        float _208 = _204 + (-1.0);
        float _210 = -_208;
        float _212 = fma(_210, _206, _144);
        float _214 = _212 * _200;
        float _216 = _214 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _216;
    }
    float _218 = _186;
    bool _220 = !_154;
    if (!_220)
    {
        float _222 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _224 = log2(_222);
        float _226 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _228 = _226 + 1.0;
        float _230 = 1.0 / _228;
        float _232 = _144 * _224;
        float _234 = exp2(_232);
        float _236 = -_234;
        float _238 = _236 + 1.0;
        float _240 = _238 * _230;
        _170 = _240;
    }
    float _242 = _170;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _246 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _248 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _250 = _218 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _252 = fma(_242, _158, _246);
    float _254 = fma(_242, _156, _248);
    float _256 = fma(_242, _160, _250);
    float _258 = fma(_252, _142, _164);
    float _260 = fma(_254, _142, _162);
    float _262 = fma(_256, _142, _166);
    bool _264 = !_244;
    float _282;
    if (!_264)
    {
        float _266 = in.m_53.x;
        float _268 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _270 = _266 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _272 = fma(_270, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _274 = _272 * _268;
        float _276 = floor(_274);
        float _278 = -_276;
        float _280 = _274 + _278;
        _282 = _280;
        _284 = true;
    }
    else
    {
        float _286 = float(_88);
        float _288 = 1.0 / _286;
        float _290 = _122 * _288;
        _282 = _290;
    }
    _284 = false;
    float _292 = _282;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _292 + _294;
    bool _298 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _300 = isnan(_292);
    bool _302 = _298 || _300;
    bool _304 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _306 = _302 || _304;
    float _308 = float(_306);
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -_308;
    float _316 = _314 + 1.0;
    bool _318 = _292 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_292);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = 1.0 / _312;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _336;
    bool _340 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _342 = _296 * _330;
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _344;
    float _348 = in.m_51.x;
    float _350 = in.m_51.y;
    float _352 = in.m_51.z;
    float _354 = _328 * _316;
    float _356 = fma(_334, _342, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_346, _342, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = fma(_338, _342, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _362 = -_328;
    float _364 = _362 + 1.0;
    float _366 = _356 * _354;
    float _368 = _358 * _354;
    float _370 = _360 * _354;
    float _372 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _374 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].y, _368);
    float _376 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[143].z, _370);
    float _378 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].x, _372);
    float _380 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].y, _374);
    float _382 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[144].z, _376);
    float _384 = _378 * _348;
    float _386 = _380 * _350;
    float _388 = _382 * _352;
    bool _390 = !_340;
    float _408;
    if (!_390)
    {
        float _392 = in.m_53.x;
        float _394 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _396 = _392 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _398 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _400 = _398 * _394;
        float _402 = floor(_400);
        float _404 = -_402;
        float _406 = _400 + _404;
        _408 = _406;
        _410 = true;
    }
    else
    {
        float _412 = float(_88);
        float _414 = 1.0 / _412;
        float _416 = _122 * _414;
        _408 = _416;
    }
    _410 = false;
    float _418 = _408;
    float _420 = in.m_55.x;
    float _422 = in.m_55.y;
    float _424 = in.m_55.z;
    float _426 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _428 = _384 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _430 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _432 = in.m_53.y;
    int _434 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _436 = _434 != 0;
    float _438 = in.m_57.x;
    int _440 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _442 = _440 != 0;
    float _444 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _422);
    float _446 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _420);
    float _448 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _424);
    float _450 = _426 * _444;
    float _452 = _428 * _446;
    float _454 = _430 * _448;
    float _456 = _258 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _458 = _258 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _460 = _450 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _462 = _450 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _464 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[4].x, _456);
    float _466 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[6].x, _458);
    float _468 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[24].x, _460);
    float _470 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[26].x, _462);
    float _472 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[4].z, _464);
    float _474 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[6].z, _466);
    float _476 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[24].z, _468);
    float _478 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[26].z, _470);
    float _480 = _472 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _482 = _474 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _484 = _476 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _486 = _478 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _488 = _450 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _490 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _492 = isnan(_418);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _480 + _484;
    float _504 = _482 + _486;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _258 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _512 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _514 = _502 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _518 = _504 + _516;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _522 = _438;
    if (_436)
    {
        float _524 = in.m_53.x;
        _520 = _524;
    }
    float _526 = _520;
    float _528 = 1.0 / _508;
    float _530 = _514 * _514;
    float _532 = _518 * _518;
    float _534 = in.m_57.y;
    float _536 = fma(_260, (*spvDescriptorSet0.vp_c10)._m0[5].x, _510);
    float _538 = _530 + _532;
    float _540 = fma(_452, (*spvDescriptorSet0.vp_c8)._m0[25].x, _488);
    bool _542 = _432 > 0.5;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _546 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _544;
    float _548 = sqrt(_538);
    float _550 = fma(_262, (*spvDescriptorSet0.vp_c10)._m0[5].z, _536);
    float _552 = fma(_454, (*spvDescriptorSet0.vp_c8)._m0[25].z, _540);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _556 = _418 + _554;
    bool _558 = _418 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_418);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = -_500;
    float _572 = _570 + 1.0;
    float _574 = _546 * _528;
    float _576 = _550 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _580 = _552 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _582 = fma(_574, _556, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _568 * _572;
    bool _586 = _526 > 0.5;
    bool _588 = _586 && _436;
    float _590 = _576 + _580;
    float _592 = _582 * _584;
    bool _594 = _548 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _596 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _598 = -_534;
    float _600 = _598 + 1.0;
    float _602 = _580;
    float _604 = _534;
    float _606 = _576;
    float _608 = _600;
    float _610 = _572;
    float _612 = _582;
    float _614 = _584;
    if (!_436)
    {
        _602 = _438;
    }
    float _616 = _602;
    float _618 = _616;
    if (_442)
    {
        float _620 = _542 ? _600 : _534;
        _604 = _620;
    }
    float _622 = _604;
    if (_588)
    {
        float _624 = -_438;
        float _626 = _624 + 1.0;
        _522 = _626;
    }
    float _628 = _522;
    if (!_594)
    {
        _606 = _532;
    }
    float _630 = _606;
    float _632 = _630;
    if (!_594)
    {
        _608 = _530;
    }
    float _634 = _608;
    float _636 = _634;
    if (!_594)
    {
        _610 = _502;
    }
    float _638 = _610;
    float _640 = _638;
    if (!_594)
    {
        _612 = _504;
    }
    float _642 = _612;
    float _644 = _642;
    if (!_594)
    {
        _614 = _590;
    }
    float _646 = _614;
    bool _648 = !_594;
    float _650 = _646;
    if (!_648)
    {
        float _652 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _654 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _656 = _548 + _654;
        float _658 = _590 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _660 = rsqrt(_538);
        float _662 = _656 * _652;
        float _664 = _662 * 0.15915493667125701904296875;
        float _666 = _664 * 6.283185482025146484375;
        float _668 = sin(_666);
        float _670 = _664 * 6.283185482025146484375;
        float _672 = cos(_670);
        float _674 = fma(_668, _658, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _676 = _660 * _674;
        float _678 = _672 + (-1.0);
        float _680 = fma(_514, _676, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _682 = fma(_518, _676, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _684 = _678 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _688 = _680 + _686;
        float _690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _692 = _682 + _690;
        float _694 = fma(_590, _672, _684);
        float _696 = _688 * _688;
        float _698 = _692 * _692;
        _650 = _694;
        _636 = _696;
        _632 = _698;
        _640 = _680;
        _644 = _682;
    }
    float _700 = _650;
    float _702 = _636;
    float _704 = _632;
    float _706 = _640;
    float _708 = _644;
    float _710 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _712 = _700 + _710;
    float _714 = -_568;
    float _716 = _714 + 1.0;
    if (_436)
    {
        _618 = _628;
    }
    float _718 = _618;
    float _720 = _622 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _722 = fma(_712, _712, _702);
    float _724 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[115].x, _592);
    float _726 = _718 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _728 = _722 + _704;
    float _730 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[116].x, _724);
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _734 = sqrt(_728);
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _744 = _720 * _596;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _748 = _726 * _578;
    float _750 = _732 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _754 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _756 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _758 = _746 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _760 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _762 = _730 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _748;
    out.m_59.y = _744;
    bool _764 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _766 = isnan(_734);
    bool _768 = _764 || _766;
    bool _770 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _772 = _768 || _770;
    out.m_61.x = 1.0;
    out.m_61.y = 1.0;
    out.m_61.z = 1.0;
    out.m_63.x = _758;
    out.m_63.y = _750;
    out.m_63.z = _752;
    out.m_65.x = _754;
    out.m_65.y = _756;
    out.m_65.z = _760;
    out.m_65.w = _762;
    float _774 = _738;
    float _776 = _730;
    float _778 = _734;
    if (!_772)
    {
        _774 = 1.0;
    }
    float _780 = _774;
    bool _782 = !_772;
    float _784 = _780;
    if (!_782)
    {
        bool _786 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _788 = isnan(_734);
        bool _790 = _786 || _788;
        bool _792 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _794 = _790 || _792;
        if (!_794)
        {
            float _796 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _798 = _734 + _796;
            float _800 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _802 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _800;
            float _804 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _806 = _804 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _808 = 1.0 / _802;
            float _810 = _798 * _808;
            float _812 = fma(_810, _806, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _784 = _812;
            _814 = true;
        }
        else
        {
            bool _816 = _734 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _818 = isnan(_734);
            bool _820 = _816 || _818;
            bool _822 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _824 = _820 || _822;
            if (!_824)
            {
                float _826 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _828 = _734 + _826;
                float _830 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _832 = _830 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _834 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _836 = _834 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _838 = 1.0 / _832;
                float _840 = _828 * _838;
                float _842 = fma(_840, _836, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _784 = _842;
                _814 = true;
            }
            else
            {
                _784 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _814 = false;
    float _844 = _784;
    float _846 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _848 = _700 + _846;
    float _850 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _852 = _706 + _850;
    float _854 = fma(_848, _844, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _856 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _858 = _708 + _856;
    float _860 = fma(_852, _844, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _862 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _864 = _854 + _862;
    float _866 = fma(_858, _844, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _868 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _870 = _860 + _868;
    float _872 = _864 * _864;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _876 = _866 + _874;
    float _878 = fma(_870, _870, _872);
    float _880 = fma(_876, _876, _878);
    float _882 = rsqrt(_880);
    float _884 = _882 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _886 = _870 * _884;
    float _888 = _876 * _884;
    float _890 = _886 * _886;
    float _892 = _888 * _888;
    float _894 = _890 + _892;
    float _896 = sqrt(_894);
    bool _898 = _896 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _900 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _902 = _896 + _900;
    float _904 = _876;
    float _906 = _894;
    float _908 = _902;
    float _910 = _864;
    float _912 = _886;
    if (_898)
    {
        float _914 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _914;
    }
    float _916 = _904;
    if (_898)
    {
        float _918 = rsqrt(_894);
        _906 = _918;
    }
    float _920 = _906;
    if (_898)
    {
        float _922 = _902 * _916;
        _908 = _922;
    }
    float _924 = _908;
    if (_898)
    {
        float _926 = _924 * 0.15915493667125701904296875;
        _776 = _926;
    }
    float _928 = _776;
    float _930 = _882;
    if (_898)
    {
        float _932 = _928 * 6.283185482025146484375;
        float _934 = sin(_932);
        _930 = _934;
    }
    float _936 = _930;
    float _938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _940 = precise::max(0.0, _938);
    float _942 = _742;
    float _944 = _940;
    float _946 = _938;
    if (_898)
    {
        float _948 = _928 * 6.283185482025146484375;
        float _950 = cos(_948);
        _942 = _950;
    }
    float _952 = _942;
    float _954 = -_884;
    float _956 = -_940;
    float _958 = fma(_864, _954, _956);
    if (!_898)
    {
        _944 = _888;
    }
    float _960 = _944;
    float _962 = _960;
    if (_898)
    {
        float _964 = _958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _946 = _964;
    }
    float _966 = _946;
    float _968 = _936;
    float _970 = _966;
    if (_898)
    {
        float _972 = fma(_936, _966, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _968 = _972;
    }
    float _974 = _968;
    float _976 = _974;
    if (_898)
    {
        float _978 = _952 + (-1.0);
        _970 = _978;
    }
    float _980 = _970;
    float _982 = _980;
    if (_898)
    {
        float _984 = _920 * _974;
        _778 = _984;
    }
    float _986 = _778;
    if (!_898)
    {
        _976 = _958;
    }
    float _988 = _976;
    float _990 = sqrt(_880);
    float _992 = _988;
    if (_898)
    {
        float _994 = _980 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _910 = _994;
    }
    float _996 = _910;
    float _998 = _996;
    if (_898)
    {
        float _1000 = _886 * _986;
        _912 = _1000;
    }
    float _1002 = _912;
    if (!_898)
    {
        _982 = _890;
    }
    float _1004 = _982;
    float _1006 = _1004;
    if (_898)
    {
        float _1008 = _888 * _986;
        _962 = _1008;
    }
    float _1010 = _962;
    if (_898)
    {
        float _1012 = fma(_958, _952, _996);
        _992 = _1012;
    }
    float _1014 = _992;
    if (_898)
    {
        float _1016 = _1002 * _1002;
        _1006 = _1016;
    }
    float _1018 = _1006;
    if (!_898)
    {
        _998 = _892;
    }
    float _1020 = _998;
    float _1022 = _1020;
    if (_898)
    {
        float _1024 = _1010 * _1010;
        _1022 = _1024;
    }
    float _1026 = _1022;
    float _1028 = fma(_1014, _1014, _1018);
    float _1030 = _854 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1032 = _1028 + _1026;
    float _1034 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1030);
    float _1036 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1038 = fma(_990, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1036);
    float _1040 = precise::clamp(_1038, 0.0, 1.0);
    float _1042 = _854 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1044 = rsqrt(_1032);
    float _1046 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1034);
    float _1048 = -_1040;
    float _1050 = _1048 + 1.0;
    float _1052 = _854 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1054 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1042);
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1058 = _854 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1060 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1052);
    float _1062 = abs(_1050);
    float _1064 = log2(_1062);
    float _1066 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1054);
    float _1068 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1058);
    float _1070 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1060);
    float _1072 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1074 = _1066 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1076 = fma(_866, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1068);
    float _1078 = _1070 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1080 = _1044 * _1002;
    float _1082 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1084 = _1044 * _1014;
    float _1086 = _1056 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1088 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1090 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1082);
    float _1092 = _1044 * _1010;
    float _1094 = _1076 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1096 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1098 = -_1088;
    float _1100 = fma(_1084, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1098);
    float _1102 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1090);
    float _1104 = -_1086;
    float _1106 = fma(_1104, _1072, 1.0);
    float _1108 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1110 = -_1092;
    float _1112 = fma(_1110, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1100);
    float _1114 = exp2(_1096);
    float _1116 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1102);
    float _1118 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1120 = fma(_1112, -0.5, 0.5);
    float _1122 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1108);
    float _1124 = fma(_1112, 0.5, 0.5);
    float _1126 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1118);
    float _1128 = _1084 + 1.0;
    float _1130 = log2(_1106);
    float _1132 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1122);
    float _1134 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1126);
    float _1136 = fma(_1124, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1138 = fma(_1124, _1136, -0.212114393711090087890625);
    float _1140 = 1.0 / _1116;
    float _1142 = -_1084;
    float _1144 = fma(_1114, _1128, _1142);
    float _1146 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1134);
    float _1148 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1132);
    float _1150 = fma(_1124, _1138, 1.570728778839111328125);
    float _1152 = fma(_1144, 0.5, 0.5);
    float _1154 = sqrt(_1120);
    float _1156 = _1130 * 0.693147182464599609375;
    float _1158 = _1146 * _1140;
    float _1160 = _1148 * _1140;
    float _1162 = _1156 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1164 = fma(_1158, 0.5, 0.5);
    float _1166 = fma(_1160, -0.5, 0.5);
    float _1168 = _1154 * 0.636619746685028076171875;
    float3 _3082 = float3(_1164, _1166, _1162);
    float _1170 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3082, float3(0.0), isnan(_3082)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3082, float3(0.0), isnan(_3082)), level(0.0)).x;
    float3 _3093 = float3(_1164, _1166, _1162);
    float4 _1173 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3093, float3(0.0), isnan(_3093)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3093, float3(0.0), isnan(_3093)), level(0.0)).xyzw;
    float _1175 = _1173.x;
    float _1177 = _1173.y;
    float _1179 = _1173.z;
    float _1181 = _1173.w;
    float _1183 = -_1150;
    float _1185 = fma(_1168, _1183, 1.0);
    float2 _3115 = float2(_1185, _1152);
    float3 _1189 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3115, float2(0.0), isnan(_3115)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3115, float2(0.0), isnan(_3115)), level(0.0)).xyz;
    float _1191 = _1189.x;
    float _1193 = _1189.y;
    float _1195 = _1189.z;
    float _1197 = _1064 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1199 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1201 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1199);
    float _1203 = exp2(_1197);
    float _1205 = _1116 * 0.5;
    float _1207 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1201);
    float _1209 = fma(_1148, -0.5, _1205);
    float _1211 = _1146 + _1116;
    float _1213 = fma(_1094, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1207);
    float _1215 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1217 = _1211 * 0.5;
    float _1219 = _1213 + _1116;
    out.gl_Position.x = _1146;
    out.gl_Position.y = _1148;
    out.gl_Position.z = _1213;
    out.gl_Position.w = _1116;
    float _1221 = _1219 * 0.5;
    float _1223 = -_1203;
    float _1225 = _1223 + 1.0;
    out.m_47.x = _1215;
    float _1227 = _1225 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1217;
    out.m_67.y = _1209;
    out.m_67.z = _1221;
    out.m_67.w = _1116;
    float _1229 = -_1227;
    float _1231 = _1229 + 1.0;
    float _1233 = _1227 * _1170;
    float _1235 = _1181 * _1233;
    float _1237 = _1195 * _1233;
    float _1239 = fma(_1191, _1235, _1175);
    float _1241 = fma(_1193, _1235, _1177);
    float _1243 = _1181 * _1231;
    float _1245 = fma(_1181, _1237, _1179);
    out.m_69.x = _1239;
    out.m_69.y = _1241;
    out.m_69.z = _1245;
    out.m_69.w = _1243;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

