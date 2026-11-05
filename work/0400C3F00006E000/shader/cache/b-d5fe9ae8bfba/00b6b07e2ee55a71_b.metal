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
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_57 [[user(locn6)]];
    float4 m_61 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_53 [[attribute(8)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1194 = as_type<float>(_108);
        out.gl_Position.z = _1194;
    }
    if (!_96)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    float _114 = in.m_49.x;
    bool _116 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_112);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_112;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _114;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_92);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1266 = as_type<float>(_146);
        out.gl_Position.z = _1266;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_53.y;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_55.w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _150;
    if (!_162)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_57.y = _148;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _150);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _152, _170);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    bool _272 = !_252;
    float _288;
    if (!_272)
    {
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _276 = _114 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _302 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _300);
    float _308 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _310 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _312 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _306);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _316 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _310);
    float _318 = _312 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _320 = _314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _322 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _326 = _318 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _330 = _320 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _334 = _322 + _332;
    float _336 = _326 * _326;
    float _338 = fma(_330, _330, _336);
    float _340 = fma(_334, _334, _338);
    float _342 = in.m_55.x;
    float _344 = in.m_55.y;
    float _346 = in.m_55.z;
    float _348 = rsqrt(_340);
    float _350 = _326 * _348;
    float _352 = _330 * _348;
    float _354 = _334 * _348;
    float _356 = -_350;
    float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _326);
    float _360 = -_352;
    float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _330);
    float _364 = -_354;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _334);
    float _368 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = _358 * _358;
    float _372 = _342 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = fma(_362, _362, _370);
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _382 = in.m_59.x;
    float _384 = in.m_59.y;
    float _386 = in.m_59.z;
    float _388 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _390 = fma(_366, _366, _378);
    float _392 = sqrt(_390);
    float _394 = _348 * _392;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _384);
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _382);
    float _400 = _376 * _394;
    float _402 = _380 * _394;
    float _404 = _388 * _394;
    float _406 = _400 * _396;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _386);
    float _410 = _402 * _398;
    float _412 = _406 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _414 = _404 * _408;
    float _416 = _406 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _418 = _406 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].x, _412);
    float _422 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[8].x, _416);
    float _424 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[9].x, _418);
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _424);
    float _432 = _322 + _426;
    float _434 = _320 + _428;
    float _436 = _318 + _430;
    float _438 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _440 = _432 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _444 = _434 + _442;
    float _446 = _440 * _440;
    float _448 = fma(_444, _444, _446);
    float _450 = sqrt(_448);
    bool _452 = _450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _454 = _430;
    float _456 = _434;
    float _458 = _446;
    float _460 = _444;
    float _462 = _448;
    float _464 = _440;
    float _466 = 0.5;
    if (!_452)
    {
        _454 = _434;
    }
    float _468 = _454;
    float _470 = _468;
    if (!_452)
    {
        _456 = _432;
    }
    float _472 = _456;
    float _474 = _472;
    if (!_452)
    {
        _458 = _436;
    }
    float _476 = _458;
    bool _478 = !_452;
    float _480 = _476;
    if (!_478)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _486 = _450 + _484;
        float _488 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = rsqrt(_448);
        float _492 = _486 * _482;
        float _494 = _492 * 0.15915493667125701904296875;
        float _496 = _494 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = fma(_498, _488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = _490 * _504;
        float _508 = _502 + (-1.0);
        float _510 = fma(_444, _506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_440, _506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _514 = _508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _516 = fma(_436, _502, _514);
        _480 = _516;
        _470 = _510;
        _474 = _512;
    }
    float _518 = _480;
    float _520 = _470;
    float _522 = _474;
    float _524 = -_350;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _518);
    float _528 = -_352;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _520);
    float _532 = -_354;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _522);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _538 = _526 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _542 = _530 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _546 = _534 + _544;
    float _548 = _538 * _538;
    float _550 = fma(_542, _542, _548);
    float _552 = fma(_546, _546, _550);
    float _554 = rsqrt(_552);
    float _556 = _554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _542 * _556;
    float _560 = _546 * _556;
    float _562 = _558 * _558;
    float _564 = _560 * _560;
    float _566 = _562 + _564;
    float _568 = sqrt(_566);
    bool _570 = _568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = _568 + _572;
    float _576 = _554;
    float _578 = _574;
    float _580 = _538;
    float _582 = _558;
    if (_570)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _584;
    }
    float _586 = _576;
    if (_570)
    {
        float _588 = rsqrt(_566);
        _460 = _588;
    }
    float _590 = _460;
    float _592 = _590;
    if (_570)
    {
        float _594 = _574 * _586;
        _578 = _594;
    }
    float _596 = _578;
    if (_570)
    {
        float _598 = _596 * 0.15915493667125701904296875;
        _462 = _598;
    }
    float _600 = _462;
    float _602 = _586;
    if (_570)
    {
        float _604 = _600 * 6.283185482025146484375;
        float _606 = sin(_604);
        _602 = _606;
    }
    float _608 = _602;
    float _610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _612 = precise::max(0.0, _610);
    float _614 = _546;
    float _616 = _612;
    if (_570)
    {
        float _618 = _600 * 6.283185482025146484375;
        float _620 = cos(_618);
        _614 = _620;
    }
    float _622 = _614;
    float _624 = -_556;
    float _626 = -_612;
    float _628 = fma(_538, _624, _626);
    if (!_570)
    {
        _580 = _560;
    }
    float _630 = _580;
    float _632 = _630;
    if (_570)
    {
        float _634 = _628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _616 = _634;
    }
    float _636 = _616;
    float _638 = sqrt(_552);
    float _640 = _608;
    float _642 = _636;
    if (_570)
    {
        float _644 = fma(_608, _636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _464 = _644;
    }
    float _646 = _464;
    float _648 = _646;
    if (!_570)
    {
        _640 = _628;
    }
    float _650 = _640;
    float _652 = _650;
    float _654 = _622;
    if (_570)
    {
        float _656 = _622 + (-1.0);
        _642 = _656;
    }
    float _658 = _642;
    float _660 = _658;
    if (_570)
    {
        float _662 = _590 * _646;
        _648 = _662;
    }
    float _664 = _648;
    if (_570)
    {
        float _666 = _658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _592 = _666;
    }
    float _668 = _592;
    if (_570)
    {
        float _670 = _558 * _664;
        _582 = _670;
    }
    float _672 = _582;
    if (!_570)
    {
        _660 = _562;
    }
    float _674 = _660;
    float _676 = _674;
    if (_570)
    {
        float _678 = _560 * _664;
        _632 = _678;
    }
    float _680 = _632;
    if (_570)
    {
        float _682 = fma(_628, _622, _668);
        _652 = _682;
    }
    float _684 = _652;
    if (_570)
    {
        float _686 = _672 * _672;
        _676 = _686;
    }
    float _688 = _676;
    if (!_570)
    {
        _654 = _564;
    }
    float _690 = _654;
    float _692 = _690;
    if (_570)
    {
        float _694 = _680 * _680;
        _692 = _694;
    }
    float _696 = _692;
    float _698 = _526 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _700 = fma(_684, _684, _688);
    float _702 = _700 + _696;
    float _704 = _526 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _708 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _706);
    float _710 = precise::clamp(_708, 0.0, 1.0);
    float _712 = _526 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = rsqrt(_702);
    float _716 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _704);
    float _718 = -_710;
    float _720 = _718 + 1.0;
    float _722 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _724 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _698);
    float _726 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _716);
    float _728 = _526 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _730 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _722);
    float _732 = abs(_720);
    float _734 = log2(_732);
    float _736 = _726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _738 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _728);
    float _740 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _742 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _724);
    float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _746 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _748 = _730 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = _714 * _672;
    float _752 = -_744;
    float _754 = fma(_752, _740, 1.0);
    float _756 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _758 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _760 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _762 = _714 * _684;
    float _764 = _750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _766 = _714 * _680;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].x, _760);
    float _770 = _734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _772 = -_764;
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _772);
    float _776 = log2(_754);
    float _778 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _780 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _782 = -_766;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _774);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _788 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _778);
    float _790 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].x, _780);
    float _792 = fma(_784, -0.5, 0.5);
    float _794 = exp2(_770);
    float _796 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].x, _786);
    float _798 = fma(_784, 0.5, 0.5);
    float _800 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _790);
    float _802 = _762 + 1.0;
    float _804 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _796);
    float _806 = fma(_798, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _808 = 1.0 / _788;
    float _810 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _804);
    float _812 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _800);
    float _814 = fma(_798, _806, -0.212114393711090087890625);
    float _816 = _776 * 0.693147182464599609375;
    float _818 = fma(_798, _814, 1.570728778839111328125);
    float _820 = sqrt(_792);
    float _822 = -_762;
    float _824 = fma(_794, _802, _822);
    float _826 = _816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _828 = fma(_824, 0.5, 0.5);
    float _830 = _810 * _808;
    float _832 = _812 * _808;
    float _834 = fma(_830, 0.5, 0.5);
    float _836 = fma(_832, -0.5, 0.5);
    float _838 = _820 * 0.636619746685028076171875;
    float _840 = -_818;
    float _842 = fma(_838, _840, 1.0);
    float3 _2414 = float3(_834, _836, _826);
    float _844 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2414, float3(0.0), isnan(_2414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2414, float3(0.0), isnan(_2414)), level(0.0)).x;
    float3 _2425 = float3(_834, _836, _826);
    float4 _847 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2425, float3(0.0), isnan(_2425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2425, float3(0.0), isnan(_2425)), level(0.0)).xyzw;
    float _849 = _847.x;
    float _851 = _847.y;
    float _853 = _847.z;
    float _855 = _847.w;
    float2 _2442 = float2(_842, _828);
    float3 _859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2442, float2(0.0), isnan(_2442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2442, float2(0.0), isnan(_2442)), level(0.0)).xyz;
    float _861 = _859.x;
    float _863 = _859.y;
    float _865 = _859.z;
    float _867 = -_350;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _871 = -_352;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _320);
    float _875 = -_354;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _322);
    bool _879 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    float _889 = _869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _891 = _869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _530;
    out.m_61.y = _526;
    out.m_61.z = _534;
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _889);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _899 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].x, _893);
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _897);
    bool _905 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _907 = isnan(_298);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _899);
    float _919 = _901 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _921 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _923 = _826;
    float _925 = _734;
    if (!_887)
    {
        _466 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _927 = _466;
    float _929 = -_915;
    float _931 = _929 + 1.0;
    float _933 = 1.0 / _919;
    float _935 = _921 + _919;
    bool _937 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _939 = isnan(_298);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = 0.0;
    float _951 = _931;
    if (!_887)
    {
        _949 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _953 = _949;
    float _955 = _947 * _931;
    float _957 = in.m_63.x;
    float _959 = _935 * _933;
    float _961 = _959 * 0.5;
    float _963 = -_947;
    float _965 = _963 + 1.0;
    bool _967 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _969 = isnan(_298);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    if (!_887)
    {
        float _979 = -_953;
        float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _923 = _981;
    }
    float _983 = _923;
    bool _985 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _987 = isnan(_298);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    if (!_887)
    {
        float _997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _999 = fma(_961, _927, _997);
        _951 = _999;
    }
    float _1001 = _951;
    bool _1003 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1005 = isnan(_298);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = -_977;
    float _1017 = _1015 + 1.0;
    float _1019 = _995 * _965;
    float _1021 = -_995;
    float _1023 = _1021 + 1.0;
    float _1025 = _915 * _1017;
    float _1027 = -_1013;
    float _1029 = _1027 + 1.0;
    float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1033 = _1001;
    float _1035 = _1013;
    if (!_887)
    {
        float _1037 = 1.0 / _1001;
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = _977 * _1029;
    float _1043 = _734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1045 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1031);
    out.m_65.x = _957;
    float _1047 = exp2(_1043);
    float _1049 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1045);
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1049);
    float _1053 = _983;
    if (!_887)
    {
        float _1055 = 1.0 / _983;
        _1053 = _1055;
    }
    float _1057 = _1053;
    if (!_887)
    {
        float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1061 = -_953;
        float _1063 = fma(_1039, _1059, _1061);
        _925 = _1063;
    }
    float _1065 = _925;
    float _1067 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1051);
    float _1069 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1067);
    float _1071 = _1065;
    if (_887)
    {
        _1035 = 1.0;
    }
    float _1073 = _1035;
    float _1075 = -_1047;
    float _1077 = _1075 + 1.0;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1081 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1083 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.w = _1079;
    float _1085 = _1073;
    if (!_887)
    {
        float _1087 = _1065 * _1057;
        float _1089 = precise::clamp(_1087, 0.0, 1.0);
        _1071 = _1089;
    }
    float _1091 = _1071;
    out.m_69.w = _1081;
    if (!_887)
    {
        float _1093 = -_1091;
        float _1095 = _1093 + 1.0;
        _1085 = _1095;
    }
    float _1097 = _1085;
    float _1099 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _917);
    float _1101 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1103 = _1097 > 0.0;
    bool _1105 = isnan(_1097);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(0.0);
    bool _1111 = _1107 || _1109;
    float _1113 = _1099 + _788;
    out.gl_Position.x = _810;
    out.gl_Position.y = _812;
    out.gl_Position.z = _1099;
    out.gl_Position.w = _788;
    float _1115 = _1101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1117 = _1113 * 0.5;
    out.m_45.x = _1115;
    out.m_71.z = _1117;
    out.m_71.w = _788;
    float _1119 = _1083 * _844;
    float _1121 = -_1083;
    float _1123 = _1121 + 1.0;
    float _1125 = _855 * _1119;
    float _1127 = _865 * _1119;
    float _1129 = _855 * _1123;
    float _1131 = fma(_861, _1125, _849);
    float _1133 = fma(_863, _1125, _851);
    float _1135 = fma(_855, _1127, _853);
    out.m_73.x = _1131;
    out.m_73.y = _1133;
    out.m_73.z = _1135;
    out.m_73.w = _1129;
    if (_1111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1137;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1194 = as_type<float>(_108);
        out.gl_Position.z = _1194;
    }
    if (!_96)
    {
        return out;
    }
    float _112 = in.m_47.w;
    float _114 = in.m_49.x;
    bool _116 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_112);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_112;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _114;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_92);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1266 = as_type<float>(_146);
        out.gl_Position.z = _1266;
    }
    if (_140)
    {
        return out;
    }
    float _148 = in.m_53.y;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_55.w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _150;
    if (!_162)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_57.y = _148;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _150);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _152, _170);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    bool _272 = !_252;
    float _288;
    if (!_272)
    {
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _276 = _114 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _302 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _300);
    float _308 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _310 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _312 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _306);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _316 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _310);
    float _318 = _312 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _320 = _314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _322 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _326 = _318 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _330 = _320 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _334 = _322 + _332;
    float _336 = _326 * _326;
    float _338 = fma(_330, _330, _336);
    float _340 = fma(_334, _334, _338);
    float _342 = in.m_55.x;
    float _344 = in.m_55.y;
    float _346 = in.m_55.z;
    float _348 = rsqrt(_340);
    float _350 = _326 * _348;
    float _352 = _330 * _348;
    float _354 = _334 * _348;
    float _356 = -_350;
    float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _326);
    float _360 = -_352;
    float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _330);
    float _364 = -_354;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _334);
    float _368 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = _358 * _358;
    float _372 = _342 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = fma(_362, _362, _370);
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _382 = in.m_59.x;
    float _384 = in.m_59.y;
    float _386 = in.m_59.z;
    float _388 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _390 = fma(_366, _366, _378);
    float _392 = sqrt(_390);
    float _394 = _348 * _392;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _384);
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _382);
    float _400 = _376 * _394;
    float _402 = _380 * _394;
    float _404 = _388 * _394;
    float _406 = _400 * _396;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _386);
    float _410 = _402 * _398;
    float _412 = _406 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _414 = _404 * _408;
    float _416 = _406 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _418 = _406 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].x, _412);
    float _422 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[8].x, _416);
    float _424 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[9].x, _418);
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _424);
    float _432 = _322 + _426;
    float _434 = _320 + _428;
    float _436 = _318 + _430;
    float _438 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _440 = _432 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _444 = _434 + _442;
    float _446 = _440 * _440;
    float _448 = fma(_444, _444, _446);
    float _450 = sqrt(_448);
    bool _452 = _450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _454 = _430;
    float _456 = _434;
    float _458 = _446;
    float _460 = _444;
    float _462 = _448;
    float _464 = _440;
    float _466 = 0.5;
    if (!_452)
    {
        _454 = _434;
    }
    float _468 = _454;
    float _470 = _468;
    if (!_452)
    {
        _456 = _432;
    }
    float _472 = _456;
    float _474 = _472;
    if (!_452)
    {
        _458 = _436;
    }
    float _476 = _458;
    bool _478 = !_452;
    float _480 = _476;
    if (!_478)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _486 = _450 + _484;
        float _488 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = rsqrt(_448);
        float _492 = _486 * _482;
        float _494 = _492 * 0.15915493667125701904296875;
        float _496 = _494 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = fma(_498, _488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = _490 * _504;
        float _508 = _502 + (-1.0);
        float _510 = fma(_444, _506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_440, _506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _514 = _508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _516 = fma(_436, _502, _514);
        _480 = _516;
        _470 = _510;
        _474 = _512;
    }
    float _518 = _480;
    float _520 = _470;
    float _522 = _474;
    float _524 = -_350;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _518);
    float _528 = -_352;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _520);
    float _532 = -_354;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _522);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _538 = _526 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _542 = _530 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _546 = _534 + _544;
    float _548 = _538 * _538;
    float _550 = fma(_542, _542, _548);
    float _552 = fma(_546, _546, _550);
    float _554 = rsqrt(_552);
    float _556 = _554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _542 * _556;
    float _560 = _546 * _556;
    float _562 = _558 * _558;
    float _564 = _560 * _560;
    float _566 = _562 + _564;
    float _568 = sqrt(_566);
    bool _570 = _568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = _568 + _572;
    float _576 = _554;
    float _578 = _574;
    float _580 = _538;
    float _582 = _558;
    if (_570)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _584;
    }
    float _586 = _576;
    if (_570)
    {
        float _588 = rsqrt(_566);
        _460 = _588;
    }
    float _590 = _460;
    float _592 = _590;
    if (_570)
    {
        float _594 = _574 * _586;
        _578 = _594;
    }
    float _596 = _578;
    if (_570)
    {
        float _598 = _596 * 0.15915493667125701904296875;
        _462 = _598;
    }
    float _600 = _462;
    float _602 = _586;
    if (_570)
    {
        float _604 = _600 * 6.283185482025146484375;
        float _606 = sin(_604);
        _602 = _606;
    }
    float _608 = _602;
    float _610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _612 = precise::max(0.0, _610);
    float _614 = _546;
    float _616 = _612;
    if (_570)
    {
        float _618 = _600 * 6.283185482025146484375;
        float _620 = cos(_618);
        _614 = _620;
    }
    float _622 = _614;
    float _624 = -_556;
    float _626 = -_612;
    float _628 = fma(_538, _624, _626);
    if (!_570)
    {
        _580 = _560;
    }
    float _630 = _580;
    float _632 = _630;
    if (_570)
    {
        float _634 = _628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _616 = _634;
    }
    float _636 = _616;
    float _638 = sqrt(_552);
    float _640 = _608;
    float _642 = _636;
    if (_570)
    {
        float _644 = fma(_608, _636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _464 = _644;
    }
    float _646 = _464;
    float _648 = _646;
    if (!_570)
    {
        _640 = _628;
    }
    float _650 = _640;
    float _652 = _650;
    float _654 = _622;
    if (_570)
    {
        float _656 = _622 + (-1.0);
        _642 = _656;
    }
    float _658 = _642;
    float _660 = _658;
    if (_570)
    {
        float _662 = _590 * _646;
        _648 = _662;
    }
    float _664 = _648;
    if (_570)
    {
        float _666 = _658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _592 = _666;
    }
    float _668 = _592;
    if (_570)
    {
        float _670 = _558 * _664;
        _582 = _670;
    }
    float _672 = _582;
    if (!_570)
    {
        _660 = _562;
    }
    float _674 = _660;
    float _676 = _674;
    if (_570)
    {
        float _678 = _560 * _664;
        _632 = _678;
    }
    float _680 = _632;
    if (_570)
    {
        float _682 = fma(_628, _622, _668);
        _652 = _682;
    }
    float _684 = _652;
    if (_570)
    {
        float _686 = _672 * _672;
        _676 = _686;
    }
    float _688 = _676;
    if (!_570)
    {
        _654 = _564;
    }
    float _690 = _654;
    float _692 = _690;
    if (_570)
    {
        float _694 = _680 * _680;
        _692 = _694;
    }
    float _696 = _692;
    float _698 = _526 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _700 = fma(_684, _684, _688);
    float _702 = _700 + _696;
    float _704 = _526 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _708 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _706);
    float _710 = precise::clamp(_708, 0.0, 1.0);
    float _712 = _526 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = rsqrt(_702);
    float _716 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _704);
    float _718 = -_710;
    float _720 = _718 + 1.0;
    float _722 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _724 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _698);
    float _726 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _716);
    float _728 = _526 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _730 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _722);
    float _732 = abs(_720);
    float _734 = log2(_732);
    float _736 = _726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _738 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _728);
    float _740 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _742 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _724);
    float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _746 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _748 = _730 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = _714 * _672;
    float _752 = -_744;
    float _754 = fma(_752, _740, 1.0);
    float _756 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _758 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _760 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _762 = _714 * _684;
    float _764 = _750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _766 = _714 * _680;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].x, _760);
    float _770 = _734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _772 = -_764;
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _772);
    float _776 = log2(_754);
    float _778 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _780 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _782 = -_766;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _774);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _788 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _778);
    float _790 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].x, _780);
    float _792 = fma(_784, -0.5, 0.5);
    float _794 = exp2(_770);
    float _796 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].x, _786);
    float _798 = fma(_784, 0.5, 0.5);
    float _800 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _790);
    float _802 = _762 + 1.0;
    float _804 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _796);
    float _806 = fma(_798, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _808 = 1.0 / _788;
    float _810 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _804);
    float _812 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _800);
    float _814 = fma(_798, _806, -0.212114393711090087890625);
    float _816 = _776 * 0.693147182464599609375;
    float _818 = fma(_798, _814, 1.570728778839111328125);
    float _820 = sqrt(_792);
    float _822 = -_762;
    float _824 = fma(_794, _802, _822);
    float _826 = _816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _828 = fma(_824, 0.5, 0.5);
    float _830 = _810 * _808;
    float _832 = _812 * _808;
    float _834 = fma(_830, 0.5, 0.5);
    float _836 = fma(_832, -0.5, 0.5);
    float _838 = _820 * 0.636619746685028076171875;
    float _840 = -_818;
    float _842 = fma(_838, _840, 1.0);
    float3 _2414 = float3(_834, _836, _826);
    float _844 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2414, float3(0.0), isnan(_2414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2414, float3(0.0), isnan(_2414)), level(0.0)).x;
    float3 _2425 = float3(_834, _836, _826);
    float4 _847 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2425, float3(0.0), isnan(_2425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2425, float3(0.0), isnan(_2425)), level(0.0)).xyzw;
    float _849 = _847.x;
    float _851 = _847.y;
    float _853 = _847.z;
    float _855 = _847.w;
    float2 _2442 = float2(_842, _828);
    float3 _859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2442, float2(0.0), isnan(_2442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2442, float2(0.0), isnan(_2442)), level(0.0)).xyz;
    float _861 = _859.x;
    float _863 = _859.y;
    float _865 = _859.z;
    float _867 = -_350;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _871 = -_352;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _320);
    float _875 = -_354;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _322);
    bool _879 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    float _889 = _869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _891 = _869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _530;
    out.m_61.y = _526;
    out.m_61.z = _534;
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _889);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _899 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].x, _893);
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _897);
    bool _905 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _907 = isnan(_298);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _899);
    float _919 = _901 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _921 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _923 = _826;
    float _925 = _734;
    if (!_887)
    {
        _466 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _927 = _466;
    float _929 = -_915;
    float _931 = _929 + 1.0;
    float _933 = 1.0 / _919;
    float _935 = _921 + _919;
    bool _937 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _939 = isnan(_298);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = 0.0;
    float _951 = _931;
    if (!_887)
    {
        _949 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _953 = _949;
    float _955 = _947 * _931;
    float _957 = in.m_63.x;
    float _959 = _935 * _933;
    float _961 = _959 * 0.5;
    float _963 = -_947;
    float _965 = _963 + 1.0;
    bool _967 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _969 = isnan(_298);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    if (!_887)
    {
        float _979 = -_953;
        float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _923 = _981;
    }
    float _983 = _923;
    bool _985 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _987 = isnan(_298);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    if (!_887)
    {
        float _997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _999 = fma(_961, _927, _997);
        _951 = _999;
    }
    float _1001 = _951;
    bool _1003 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1005 = isnan(_298);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = -_977;
    float _1017 = _1015 + 1.0;
    float _1019 = _995 * _965;
    float _1021 = -_995;
    float _1023 = _1021 + 1.0;
    float _1025 = _915 * _1017;
    float _1027 = -_1013;
    float _1029 = _1027 + 1.0;
    float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1033 = _1001;
    float _1035 = _1013;
    if (!_887)
    {
        float _1037 = 1.0 / _1001;
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = _977 * _1029;
    float _1043 = _734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1045 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1031);
    out.m_65.x = _957;
    float _1047 = exp2(_1043);
    float _1049 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1045);
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1049);
    float _1053 = _983;
    if (!_887)
    {
        float _1055 = 1.0 / _983;
        _1053 = _1055;
    }
    float _1057 = _1053;
    if (!_887)
    {
        float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1061 = -_953;
        float _1063 = fma(_1039, _1059, _1061);
        _925 = _1063;
    }
    float _1065 = _925;
    float _1067 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1051);
    float _1069 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1067);
    float _1071 = _1065;
    if (_887)
    {
        _1035 = 1.0;
    }
    float _1073 = _1035;
    float _1075 = -_1047;
    float _1077 = _1075 + 1.0;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1081 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1083 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.w = _1079;
    float _1085 = _1073;
    if (!_887)
    {
        float _1087 = _1065 * _1057;
        float _1089 = precise::clamp(_1087, 0.0, 1.0);
        _1071 = _1089;
    }
    float _1091 = _1071;
    out.m_69.w = _1081;
    if (!_887)
    {
        float _1093 = -_1091;
        float _1095 = _1093 + 1.0;
        _1085 = _1095;
    }
    float _1097 = _1085;
    float _1099 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _917);
    float _1101 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1103 = _1097 > 0.0;
    bool _1105 = isnan(_1097);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(0.0);
    bool _1111 = _1107 || _1109;
    float _1113 = _1099 + _788;
    out.gl_Position.x = _810;
    out.gl_Position.y = _812;
    out.gl_Position.z = _1099;
    out.gl_Position.w = _788;
    float _1115 = _1101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1117 = _1113 * 0.5;
    out.m_45.x = _1115;
    out.m_71.z = _1117;
    out.m_71.w = _788;
    float _1119 = _1083 * _844;
    float _1121 = -_1083;
    float _1123 = _1121 + 1.0;
    float _1125 = _855 * _1119;
    float _1127 = _865 * _1119;
    float _1129 = _855 * _1123;
    float _1131 = fma(_861, _1125, _849);
    float _1133 = fma(_863, _1125, _851);
    float _1135 = fma(_855, _1127, _853);
    out.m_73.x = _1131;
    out.m_73.y = _1133;
    out.m_73.z = _1135;
    out.m_73.w = _1129;
    if (_1111)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1137;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_42.w;
    float _89 = trunc(_87);
    int _92 = int(_89);
    bool _96 = _92 >= 1;
    float _98 = 0.0;
    if (!_96)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _100 = _98;
    float _102 = _100;
    if (!_96)
    {
        out.m_45.x = 0.0;
    }
    int _104 = 0;
    if (!_96)
    {
        float _106 = _100 * 5.0;
        _104 = as_type<int>(_106);
    }
    int _108 = _104;
    int _110 = _108;
    if (!_96)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1194 = as_type<float>(_108);
        out.gl_Position.z = _1194;
    }
    if (!_96)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    float _114 = in.m_49.x;
    bool _116 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_112);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_112;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.x = _114;
    float _130 = 0.0;
    if (_124)
    {
        float _132 = float(_92);
        _130 = _132;
    }
    float _134 = _130;
    bool _136 = _128 >= _134;
    bool _138 = !_124;
    bool _140 = _136 || _138;
    if (_140)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _102;
    if (_140)
    {
        out.m_45.x = 0.0;
    }
    if (_140)
    {
        float _144 = _142 * 5.0;
        _110 = as_type<int>(_144);
    }
    int _146 = _110;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1266 = as_type<float>(_146);
        out.gl_Position.z = _1266;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_53.y;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_55.w;
    bool _154 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _156 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _158 = _154 || _156;
    bool _160 = isnan(1.0);
    bool _162 = _158 || _160;
    float _164 = in.m_47.x;
    float _166 = in.m_47.y;
    float _168 = in.m_47.z;
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = 0.0;
    float _178 = _150;
    if (!_162)
    {
        float _180 = _150 * _150;
        float _182 = _180 * 0.5;
        _176 = _182;
    }
    float _184 = _176;
    float _186 = _184;
    if (!_162)
    {
        float _188 = _184 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _186 = _188;
    }
    float _190 = _186;
    out.m_57.y = _148;
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _150 * _198;
        float _208 = exp2(_206);
        float _210 = _204 * 0.693147182464599609375;
        float _212 = 1.0 / _210;
        float _214 = 1.0 / _202;
        float _216 = _208 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _212, _150);
        float _222 = _220 * _214;
        float _224 = _222 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _224;
    }
    float _226 = _194;
    bool _228 = !_162;
    if (!_228)
    {
        float _230 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _232 = log2(_230);
        float _234 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _236 = _234 + 1.0;
        float _238 = 1.0 / _236;
        float _240 = _150 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _152, _170);
    float _268 = fma(_262, _152, _172);
    float _270 = fma(_264, _152, _174);
    bool _272 = !_252;
    float _288;
    if (!_272)
    {
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _276 = _114 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_92);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _302 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _304 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _306 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _300);
    float _308 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _302);
    float _310 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _304);
    float _312 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _306);
    float _314 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _308);
    float _316 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _310);
    float _318 = _312 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _320 = _314 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _322 = _316 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _324 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _326 = _318 + _324;
    float _328 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _330 = _320 + _328;
    float _332 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _334 = _322 + _332;
    float _336 = _326 * _326;
    float _338 = fma(_330, _330, _336);
    float _340 = fma(_334, _334, _338);
    float _342 = in.m_55.x;
    float _344 = in.m_55.y;
    float _346 = in.m_55.z;
    float _348 = rsqrt(_340);
    float _350 = _326 * _348;
    float _352 = _330 * _348;
    float _354 = _334 * _348;
    float _356 = -_350;
    float _358 = fma(_356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _326);
    float _360 = -_352;
    float _362 = fma(_360, (*spvDescriptorSet0.vp_c9)._m0[18].w, _330);
    float _364 = -_354;
    float _366 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _334);
    float _368 = _344 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _370 = _358 * _358;
    float _372 = _342 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = _346 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _376 = _368 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _378 = fma(_362, _362, _370);
    float _380 = _372 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _382 = in.m_59.x;
    float _384 = in.m_59.y;
    float _386 = in.m_59.z;
    float _388 = _374 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _390 = fma(_366, _366, _378);
    float _392 = sqrt(_390);
    float _394 = _348 * _392;
    float _396 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _384);
    float _398 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _382);
    float _400 = _376 * _394;
    float _402 = _380 * _394;
    float _404 = _388 * _394;
    float _406 = _400 * _396;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _386);
    float _410 = _402 * _398;
    float _412 = _406 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _414 = _404 * _408;
    float _416 = _406 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _418 = _406 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _420 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[10].x, _412);
    float _422 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[8].x, _416);
    float _424 = fma(_410, (*spvDescriptorSet0.vp_c10)._m0[9].x, _418);
    float _426 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[10].z, _420);
    float _428 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[8].z, _422);
    float _430 = fma(_414, (*spvDescriptorSet0.vp_c10)._m0[9].z, _424);
    float _432 = _322 + _426;
    float _434 = _320 + _428;
    float _436 = _318 + _430;
    float _438 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _440 = _432 + _438;
    float _442 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _444 = _434 + _442;
    float _446 = _440 * _440;
    float _448 = fma(_444, _444, _446);
    float _450 = sqrt(_448);
    bool _452 = _450 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _454 = _430;
    float _456 = _434;
    float _458 = _446;
    float _460 = _444;
    float _462 = _448;
    float _464 = _440;
    float _466 = 0.5;
    if (!_452)
    {
        _454 = _434;
    }
    float _468 = _454;
    float _470 = _468;
    if (!_452)
    {
        _456 = _432;
    }
    float _472 = _456;
    float _474 = _472;
    if (!_452)
    {
        _458 = _436;
    }
    float _476 = _458;
    bool _478 = !_452;
    float _480 = _476;
    if (!_478)
    {
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _484 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _486 = _450 + _484;
        float _488 = _436 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = rsqrt(_448);
        float _492 = _486 * _482;
        float _494 = _492 * 0.15915493667125701904296875;
        float _496 = _494 * 6.283185482025146484375;
        float _498 = sin(_496);
        float _500 = _494 * 6.283185482025146484375;
        float _502 = cos(_500);
        float _504 = fma(_498, _488, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _506 = _490 * _504;
        float _508 = _502 + (-1.0);
        float _510 = fma(_444, _506, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _512 = fma(_440, _506, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _514 = _508 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _516 = fma(_436, _502, _514);
        _480 = _516;
        _470 = _510;
        _474 = _512;
    }
    float _518 = _480;
    float _520 = _470;
    float _522 = _474;
    float _524 = -_350;
    float _526 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[18].w, _518);
    float _528 = -_352;
    float _530 = fma(_528, (*spvDescriptorSet0.vp_c9)._m0[18].w, _520);
    float _532 = -_354;
    float _534 = fma(_532, (*spvDescriptorSet0.vp_c9)._m0[18].w, _522);
    float _536 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _538 = _526 + _536;
    float _540 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _542 = _530 + _540;
    float _544 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _546 = _534 + _544;
    float _548 = _538 * _538;
    float _550 = fma(_542, _542, _548);
    float _552 = fma(_546, _546, _550);
    float _554 = rsqrt(_552);
    float _556 = _554 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _558 = _542 * _556;
    float _560 = _546 * _556;
    float _562 = _558 * _558;
    float _564 = _560 * _560;
    float _566 = _562 + _564;
    float _568 = sqrt(_566);
    bool _570 = _568 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _572 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _574 = _568 + _572;
    float _576 = _554;
    float _578 = _574;
    float _580 = _538;
    float _582 = _558;
    if (_570)
    {
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _576 = _584;
    }
    float _586 = _576;
    if (_570)
    {
        float _588 = rsqrt(_566);
        _460 = _588;
    }
    float _590 = _460;
    float _592 = _590;
    if (_570)
    {
        float _594 = _574 * _586;
        _578 = _594;
    }
    float _596 = _578;
    if (_570)
    {
        float _598 = _596 * 0.15915493667125701904296875;
        _462 = _598;
    }
    float _600 = _462;
    float _602 = _586;
    if (_570)
    {
        float _604 = _600 * 6.283185482025146484375;
        float _606 = sin(_604);
        _602 = _606;
    }
    float _608 = _602;
    float _610 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _612 = precise::max(0.0, _610);
    float _614 = _546;
    float _616 = _612;
    if (_570)
    {
        float _618 = _600 * 6.283185482025146484375;
        float _620 = cos(_618);
        _614 = _620;
    }
    float _622 = _614;
    float _624 = -_556;
    float _626 = -_612;
    float _628 = fma(_538, _624, _626);
    if (!_570)
    {
        _580 = _560;
    }
    float _630 = _580;
    float _632 = _630;
    if (_570)
    {
        float _634 = _628 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _616 = _634;
    }
    float _636 = _616;
    float _638 = sqrt(_552);
    float _640 = _608;
    float _642 = _636;
    if (_570)
    {
        float _644 = fma(_608, _636, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _464 = _644;
    }
    float _646 = _464;
    float _648 = _646;
    if (!_570)
    {
        _640 = _628;
    }
    float _650 = _640;
    float _652 = _650;
    float _654 = _622;
    if (_570)
    {
        float _656 = _622 + (-1.0);
        _642 = _656;
    }
    float _658 = _642;
    float _660 = _658;
    if (_570)
    {
        float _662 = _590 * _646;
        _648 = _662;
    }
    float _664 = _648;
    if (_570)
    {
        float _666 = _658 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _592 = _666;
    }
    float _668 = _592;
    if (_570)
    {
        float _670 = _558 * _664;
        _582 = _670;
    }
    float _672 = _582;
    if (!_570)
    {
        _660 = _562;
    }
    float _674 = _660;
    float _676 = _674;
    if (_570)
    {
        float _678 = _560 * _664;
        _632 = _678;
    }
    float _680 = _632;
    if (_570)
    {
        float _682 = fma(_628, _622, _668);
        _652 = _682;
    }
    float _684 = _652;
    if (_570)
    {
        float _686 = _672 * _672;
        _676 = _686;
    }
    float _688 = _676;
    if (!_570)
    {
        _654 = _564;
    }
    float _690 = _654;
    float _692 = _690;
    if (_570)
    {
        float _694 = _680 * _680;
        _692 = _694;
    }
    float _696 = _692;
    float _698 = _526 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _700 = fma(_684, _684, _688);
    float _702 = _700 + _696;
    float _704 = _526 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _706 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _708 = fma(_638, (*spvDescriptorSet0.vp_c15)._m0[23].w, _706);
    float _710 = precise::clamp(_708, 0.0, 1.0);
    float _712 = _526 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _714 = rsqrt(_702);
    float _716 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[2].x, _704);
    float _718 = -_710;
    float _720 = _718 + 1.0;
    float _722 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[1].x, _712);
    float _724 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[3].x, _698);
    float _726 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[2].z, _716);
    float _728 = _526 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _730 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[1].z, _722);
    float _732 = abs(_720);
    float _734 = log2(_732);
    float _736 = _726 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _738 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[0].x, _728);
    float _740 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _742 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[3].z, _724);
    float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _746 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[0].z, _738);
    float _748 = _730 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _750 = _714 * _672;
    float _752 = -_744;
    float _754 = fma(_752, _740, 1.0);
    float _756 = _742 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _758 = _746 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _760 = _748 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _762 = _714 * _684;
    float _764 = _750 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _766 = _714 * _680;
    float _768 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[7].x, _760);
    float _770 = _734 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _772 = -_764;
    float _774 = fma(_762, (*spvDescriptorSet0.vp_c15)._m0[21].y, _772);
    float _776 = log2(_754);
    float _778 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[7].z, _768);
    float _780 = _748 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _782 = -_766;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c15)._m0[21].z, _774);
    float _786 = _748 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _788 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[7].w, _778);
    float _790 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[5].x, _780);
    float _792 = fma(_784, -0.5, 0.5);
    float _794 = exp2(_770);
    float _796 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[4].x, _786);
    float _798 = fma(_784, 0.5, 0.5);
    float _800 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[5].z, _790);
    float _802 = _762 + 1.0;
    float _804 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[4].z, _796);
    float _806 = fma(_798, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _808 = 1.0 / _788;
    float _810 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[4].w, _804);
    float _812 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[5].w, _800);
    float _814 = fma(_798, _806, -0.212114393711090087890625);
    float _816 = _776 * 0.693147182464599609375;
    float _818 = fma(_798, _814, 1.570728778839111328125);
    float _820 = sqrt(_792);
    float _822 = -_762;
    float _824 = fma(_794, _802, _822);
    float _826 = _816 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _828 = fma(_824, 0.5, 0.5);
    float _830 = _810 * _808;
    float _832 = _812 * _808;
    float _834 = fma(_830, 0.5, 0.5);
    float _836 = fma(_832, -0.5, 0.5);
    float _838 = _820 * 0.636619746685028076171875;
    float _840 = -_818;
    float _842 = fma(_838, _840, 1.0);
    float3 _2414 = float3(_834, _836, _826);
    float _844 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2414, float3(0.0), isnan(_2414)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2414, float3(0.0), isnan(_2414)), level(0.0)).x;
    float3 _2425 = float3(_834, _836, _826);
    float4 _847 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2425, float3(0.0), isnan(_2425)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2425, float3(0.0), isnan(_2425)), level(0.0)).xyzw;
    float _849 = _847.x;
    float _851 = _847.y;
    float _853 = _847.z;
    float _855 = _847.w;
    float2 _2442 = float2(_842, _828);
    float3 _859 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2442, float2(0.0), isnan(_2442)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2442, float2(0.0), isnan(_2442)), level(0.0)).xyz;
    float _861 = _859.x;
    float _863 = _859.y;
    float _865 = _859.z;
    float _867 = -_350;
    float _869 = fma(_867, (*spvDescriptorSet0.vp_c9)._m0[18].w, _318);
    float _871 = -_352;
    float _873 = fma(_871, (*spvDescriptorSet0.vp_c9)._m0[18].w, _320);
    float _875 = -_354;
    float _877 = fma(_875, (*spvDescriptorSet0.vp_c9)._m0[18].w, _322);
    bool _879 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _881 = isnan(0.5);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _887 = _883 || _885;
    float _889 = _869 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _891 = _869 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _893 = _748 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_61.x = _530;
    out.m_61.y = _526;
    out.m_61.z = _534;
    float _895 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[11].x, _889);
    float _897 = fma(_873, (*spvDescriptorSet0.vp_c8)._m0[10].x, _891);
    float _899 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[6].x, _893);
    float _901 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[11].z, _895);
    float _903 = fma(_877, (*spvDescriptorSet0.vp_c8)._m0[10].z, _897);
    bool _905 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _907 = isnan(_298);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = fma(_736, (*spvDescriptorSet0.vp_c8)._m0[6].z, _899);
    float _919 = _901 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _921 = _903 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _923 = _826;
    float _925 = _734;
    if (!_887)
    {
        _466 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _927 = _466;
    float _929 = -_915;
    float _931 = _929 + 1.0;
    float _933 = 1.0 / _919;
    float _935 = _921 + _919;
    bool _937 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _939 = isnan(_298);
    bool _941 = _937 || _939;
    bool _943 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _945 = _941 || _943;
    float _947 = float(_945);
    float _949 = 0.0;
    float _951 = _931;
    if (!_887)
    {
        _949 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _953 = _949;
    float _955 = _947 * _931;
    float _957 = in.m_63.x;
    float _959 = _935 * _933;
    float _961 = _959 * 0.5;
    float _963 = -_947;
    float _965 = _963 + 1.0;
    bool _967 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _969 = isnan(_298);
    bool _971 = _967 || _969;
    bool _973 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _975 = _971 || _973;
    float _977 = float(_975);
    if (!_887)
    {
        float _979 = -_953;
        float _981 = _979 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _923 = _981;
    }
    float _983 = _923;
    bool _985 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _987 = isnan(_298);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    if (!_887)
    {
        float _997 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _999 = fma(_961, _927, _997);
        _951 = _999;
    }
    float _1001 = _951;
    bool _1003 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _1005 = isnan(_298);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = -_977;
    float _1017 = _1015 + 1.0;
    float _1019 = _995 * _965;
    float _1021 = -_995;
    float _1023 = _1021 + 1.0;
    float _1025 = _915 * _1017;
    float _1027 = -_1013;
    float _1029 = _1027 + 1.0;
    float _1031 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1033 = _1001;
    float _1035 = _1013;
    if (!_887)
    {
        float _1037 = 1.0 / _1001;
        _1033 = _1037;
    }
    float _1039 = _1033;
    float _1041 = _977 * _1029;
    float _1043 = _734 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1045 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1031);
    out.m_65.x = _957;
    float _1047 = exp2(_1043);
    float _1049 = fma(_955, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1045);
    float _1051 = fma(_1025, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1049);
    float _1053 = _983;
    if (!_887)
    {
        float _1055 = 1.0 / _983;
        _1053 = _1055;
    }
    float _1057 = _1053;
    if (!_887)
    {
        float _1059 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1061 = -_953;
        float _1063 = fma(_1039, _1059, _1061);
        _925 = _1063;
    }
    float _1065 = _925;
    float _1067 = fma(_1041, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1051);
    float _1069 = fma(_1013, (*spvDescriptorSet0.vp_c9)._m0[119].x, _1067);
    float _1071 = _1065;
    if (_887)
    {
        _1035 = 1.0;
    }
    float _1073 = _1035;
    float _1075 = -_1047;
    float _1077 = _1075 + 1.0;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1081 = _1069 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1083 = _1077 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.w = _1079;
    float _1085 = _1073;
    if (!_887)
    {
        float _1087 = _1065 * _1057;
        float _1089 = precise::clamp(_1087, 0.0, 1.0);
        _1071 = _1089;
    }
    float _1091 = _1071;
    out.m_69.w = _1081;
    if (!_887)
    {
        float _1093 = -_1091;
        float _1095 = _1093 + 1.0;
        _1085 = _1095;
    }
    float _1097 = _1085;
    float _1099 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[6].w, _917);
    float _1101 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _1103 = _1097 > 0.0;
    bool _1105 = isnan(_1097);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan(0.0);
    bool _1111 = _1107 || _1109;
    float _1113 = _1099 + _788;
    out.gl_Position.x = _810;
    out.gl_Position.y = _812;
    out.gl_Position.z = _1099;
    out.gl_Position.w = _788;
    float _1115 = _1101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1117 = _1113 * 0.5;
    out.m_45.x = _1115;
    out.m_71.z = _1117;
    out.m_71.w = _788;
    float _1119 = _1083 * _844;
    float _1121 = -_1083;
    float _1123 = _1121 + 1.0;
    float _1125 = _855 * _1119;
    float _1127 = _865 * _1119;
    float _1129 = _855 * _1123;
    float _1131 = fma(_861, _1125, _849);
    float _1133 = fma(_863, _1125, _851);
    float _1135 = fma(_855, _1127, _853);
    out.m_73.x = _1131;
    out.m_73.y = _1133;
    out.m_73.z = _1135;
    out.m_73.w = _1129;
    if (_1111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1137 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1137;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

