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
    float4 m_61 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_63 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_49 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1246 = as_type<float>(_100);
        out.gl_Position.z = _1246;
    }
    if (!_88)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_45.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_136);
        out.gl_Position.z = _1315;
    }
    if (_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _138 = in.m_49.x;
    float _140 = in.m_49.y;
    float _142 = in.m_49.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _146);
    float _156 = in.m_51.w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = sqrt(_168);
    float _178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _180 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = _176 * _138;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _190 = _182;
    float _192 = _180;
    if (!_166)
    {
        _190 = _144;
    }
    float _194 = _190;
    float _196 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _186);
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = _196 * 0.15915493667125701904296875;
    float _206 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _208 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _210 = _194;
    if (!_166)
    {
        float _212 = _144 * _144;
        float _214 = _212 * 0.5;
        _192 = _214;
    }
    float _216 = _192;
    float _218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _206);
    float _220 = _204 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = _208 * _178;
    float _226 = _216;
    if (!_166)
    {
        float _228 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = _188 * _218;
    bool _234 = !_166;
    float _236 = _230;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _144 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _144);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _268;
    }
    float _270 = _236;
    bool _272 = !_166;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _144 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _210 = _292;
    }
    float _294 = _210;
    float _296 = _222 + _142;
    float _298 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _304 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _306 = fma(_294, _200, _298);
    float _308 = fma(_294, _198, _300);
    float _310 = _296 * 0.125;
    float _312 = fma(_294, _202, _302);
    float _314 = fma(_306, _156, _172);
    float _316 = fma(_308, _156, _170);
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _310);
    float _320 = fma(_312, _156, _174);
    float _322 = _314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _324 = _314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _326 = _232 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _328 = _304 * _318;
    float _330 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].x, _322);
    float _332 = _232 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].x, _324);
    float _336 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _326);
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _340 = _314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _332);
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[4].z, _334);
    float _346 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[10].z, _336);
    float _348 = _338 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _350 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _352 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[8].z, _342);
    float _354 = _344 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = _348 + _346;
    float _358 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[5].z, _350);
    bool _360 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _362 = isnan(0.5);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _368 = _364 || _366;
    float _370 = _354 + _352;
    float _372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _374 = _356 + _372;
    float _376 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _380 = _370 + _378;
    float _382 = _374 * _374;
    float _384 = _376 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _386 = fma(_380, _380, _382);
    float _388 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[11].x, _384);
    float _390 = _376 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _392 = sqrt(_386);
    float _394 = fma(_348, (*spvDescriptorSet0.vp_c8)._m0[11].z, _388);
    float _396 = _394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _398 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[10].x, _390);
    float _400 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _402 = 1.0 / _396;
    float _404 = fma(_348, (*spvDescriptorSet0.vp_c8)._m0[10].z, _398);
    float _406 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _400);
    float _408 = _404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _410 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[9].z, _406);
    bool _412 = _392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _414 = _408 + _396;
    float _416 = _376 + _410;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    float _426 = _410;
    float _428 = _376;
    float _430 = _396;
    float _432 = _374;
    if (_368)
    {
        _426 = 1.0;
    }
    float _434 = _426;
    float _436 = _414 * _402;
    float _438 = _436 * 0.5;
    bool _440 = !_420;
    int _442 = _440 ? 0 : 1;
    bool _444 = !_424;
    int _446 = _444 ? 0 : 1;
    float _448 = _434;
    if (!_412)
    {
        _428 = _370;
    }
    float _450 = _428;
    float _452 = _450;
    if (!_412)
    {
        _430 = _356;
    }
    float _454 = _430;
    float _456 = _454;
    if (!_412)
    {
        _238 = _416;
    }
    float _458 = _238;
    bool _460 = !_412;
    float _462 = _458;
    if (!_460)
    {
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _468 = _392 + _466;
        float _470 = _416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _472 = _468 * _464;
        float _474 = rsqrt(_386);
        float _476 = _472 * 0.15915493667125701904296875;
        float _478 = _476 * 6.283185482025146484375;
        float _480 = cos(_478);
        float _482 = _476 * 6.283185482025146484375;
        float _484 = sin(_482);
        float _486 = _480 + (-1.0);
        float _488 = _486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = fma(_484, _470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _492 = fma(_416, _480, _488);
        float _494 = _474 * _490;
        float _496 = fma(_380, _494, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _498 = fma(_374, _494, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _462 = _492;
        _452 = _496;
        _456 = _498;
    }
    float _500 = _462;
    float _502 = _452;
    float _504 = _456;
    if (!_368)
    {
        float _506 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _508 = _506 * 0.15915493667125701904296875;
        float _510 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _512 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _514 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _512);
        float _516 = _508 * 6.283185482025146484375;
        float _518 = cos(_516);
        float _520 = _510 * 0.15915493667125701904296875;
        float _522 = _508 * 6.283185482025146484375;
        float _524 = sin(_522);
        float _526 = 1.0 / _518;
        float _528 = _520 * 6.283185482025146484375;
        float _530 = cos(_528);
        float _532 = _524 * _526;
        float _534 = _520 * 6.283185482025146484375;
        float _536 = sin(_534);
        float _538 = _530 * _532;
        float _540 = 1.0 / _514;
        float _542 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _544 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _542;
        float _546 = 1.0 / _538;
        float _548 = 1.0 / _544;
        float _550 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _552 = _540 * _550;
        float _554 = _536 * _546;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _558 = fma(_554, _552, _556);
        float _560 = _558 * _548;
        float _562 = precise::clamp(_560, 0.0, 1.0);
        float _564 = -_562;
        float _566 = _564 + 1.0;
        _432 = _548;
        _448 = _566;
    }
    float _568 = _432;
    float _570 = _448;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _574 = _500 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _578 = _502 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _582 = _504 + _580;
    float _584 = _574 * _574;
    float _586 = fma(_578, _578, _584);
    float _588 = fma(_582, _582, _586);
    float _590 = rsqrt(_588);
    float _592 = sqrt(_588);
    float _594 = _590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _596 = _578 * _594;
    float _598 = _582 * _594;
    float _600 = _596 * _596;
    float _602 = _598 * _598;
    float _604 = _600 + _602;
    float _606 = sqrt(_604);
    bool _608 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _612 = _606 + _610;
    float _614 = _416;
    float _616 = _604;
    float _618 = _612;
    float _620 = _574;
    float _622 = _594;
    float _624 = _596;
    if (_608)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _614 = _626;
    }
    float _628 = _614;
    if (_608)
    {
        float _630 = rsqrt(_604);
        _616 = _630;
    }
    float _632 = _616;
    float _634 = _628;
    float _636 = _632;
    if (_608)
    {
        float _638 = _612 * _628;
        _618 = _638;
    }
    float _640 = _618;
    if (_608)
    {
        float _642 = _640 * 0.15915493667125701904296875;
        _634 = _642;
    }
    float _644 = _634;
    float _646 = _582;
    float _648 = _644;
    if (_608)
    {
        float _650 = _644 * 6.283185482025146484375;
        float _652 = sin(_650);
        _646 = _652;
    }
    float _654 = _646;
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _658 = precise::max(0.0, _656);
    float _660 = _568;
    float _662 = _658;
    if (_608)
    {
        float _664 = _644 * 6.283185482025146484375;
        float _666 = cos(_664);
        _660 = _666;
    }
    float _668 = _660;
    float _670 = -_594;
    float _672 = -_658;
    float _674 = fma(_574, _670, _672);
    if (_608)
    {
        float _676 = _674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _676;
    }
    float _678 = _620;
    float _680 = _654;
    float _682 = _678;
    if (_608)
    {
        float _684 = fma(_654, _678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = _686;
    if (!_608)
    {
        _682 = _598;
    }
    float _690 = _682;
    float _692 = _690;
    if (_608)
    {
        float _694 = _668 + (-1.0);
        _662 = _694;
    }
    float _696 = _662;
    float _698 = _696;
    if (_608)
    {
        float _700 = _632 * _686;
        _622 = _700;
    }
    float _702 = _622;
    if (!_608)
    {
        _688 = _674;
    }
    float _704 = _688;
    float _706 = _704;
    if (_608)
    {
        float _708 = _696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _648 = _708;
    }
    float _710 = _648;
    if (_608)
    {
        float _712 = _596 * _702;
        _624 = _712;
    }
    float _714 = _624;
    if (!_608)
    {
        _636 = _600;
    }
    float _716 = _636;
    float _718 = _716;
    if (_608)
    {
        float _720 = _598 * _702;
        _692 = _720;
    }
    float _722 = _692;
    if (_608)
    {
        float _724 = fma(_674, _668, _710);
        _706 = _724;
    }
    float _726 = _706;
    if (_608)
    {
        float _728 = _714 * _714;
        _718 = _728;
    }
    float _730 = _718;
    if (!_608)
    {
        _698 = _602;
    }
    float _732 = _698;
    float _734 = _732;
    if (_608)
    {
        float _736 = _722 * _722;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = fma(_726, _726, _730);
    float _742 = _740 + _738;
    float _744 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _748 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _746);
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _754 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _756 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _744);
    float _758 = rsqrt(_742);
    float _760 = -_750;
    float _762 = _760 + 1.0;
    float _764 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _766 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _752);
    float _768 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _770 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _756);
    float _772 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _764);
    float _774 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _766);
    float _776 = abs(_762);
    float _778 = log2(_776);
    float _780 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _768);
    float _782 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _772);
    float _784 = _774 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _786 = _770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _788 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _780);
    float _790 = _782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _792 = _784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _794 = _758 * _714;
    float _796 = _758 * _722;
    float _798 = _786 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _792);
    float _802 = _758 * _726;
    float _804 = _794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _806 = _788 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[7].z, _800);
    float _810 = _778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _812 = -_804;
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[21].y, _812);
    float _816 = -_798;
    float _818 = fma(_816, _754, 1.0);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[7].w, _808);
    float _822 = _784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _824 = -_796;
    float _826 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _814);
    float _828 = exp2(_810);
    float _830 = _784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _832 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _822);
    float _834 = fma(_826, -0.5, 0.5);
    float _836 = fma(_826, 0.5, 0.5);
    float _838 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _830);
    float _840 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[5].z, _832);
    float _842 = _802 + 1.0;
    float _844 = log2(_818);
    float _846 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[4].z, _838);
    float _848 = fma(_836, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _850 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[4].w, _846);
    float _852 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[5].w, _840);
    float _854 = fma(_836, _848, -0.212114393711090087890625);
    float _856 = 1.0 / _820;
    float _858 = -_802;
    float _860 = fma(_828, _842, _858);
    float _862 = fma(_836, _854, 1.570728778839111328125);
    float _864 = sqrt(_834);
    float _866 = _844 * 0.693147182464599609375;
    float _868 = _866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _870 = _850 * _856;
    float _872 = _852 * _856;
    float _874 = fma(_870, 0.5, 0.5);
    float _876 = fma(_872, -0.5, 0.5);
    float _878 = _864 * 0.636619746685028076171875;
    float3 _2529 = float3(_874, _876, _868);
    float _880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2529, float3(0.0), isnan(_2529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2529, float3(0.0), isnan(_2529)), level(0.0)).x;
    float _882 = -_862;
    float _884 = fma(_878, _882, 1.0);
    float _886 = fma(_860, 0.5, 0.5);
    float3 _2547 = float3(_874, _876, _868);
    float4 _889 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2547, float3(0.0), isnan(_2547)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2547, float3(0.0), isnan(_2547)), level(0.0)).xyzw;
    float _891 = _889.x;
    float _893 = _889.y;
    float _895 = _889.z;
    float _897 = _889.w;
    float2 _2564 = float2(_884, _886);
    float3 _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2564, float2(0.0), isnan(_2564)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2564, float2(0.0), isnan(_2564)), level(0.0)).xyz;
    float _903 = _901.x;
    float _905 = _901.y;
    float _907 = _901.z;
    float _909 = in.m_53.x;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _913 = _778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _915 = in.m_55.y;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _919 = _917 != 0;
    float _921 = _784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _925 = _923 != 0;
    float _927 = in.m_53.w;
    float _929 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    float _937 = in.m_53.y;
    int _939 = abs(_446);
    float _941 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _921);
    float _943 = _929 * _911;
    out.m_57.x = _138;
    float _945 = in.m_55.x;
    float _947 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[20].x, _943);
    float _949 = 0.0;
    if (_919)
    {
        float _951 = in.m_53.z;
        _949 = _951;
    }
    float _953 = _949;
    float _955 = exp2(_913);
    float _957 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[6].z, _941);
    int _959 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _961 = _959 != 0;
    float _963 = _911;
    if (!_925)
    {
        float _965 = in.m_53.z;
        _963 = _965;
    }
    float _967 = _963;
    float _969 = -_915;
    float _971 = _969 + 1.0;
    float _973 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[6].w, _957);
    bool _975 = _927 > 0.5;
    out.m_59.y = _915;
    float _977 = floor(_947);
    float _979 = _973 + _820;
    int _981 = _975 ? as_type<int>(_971) : as_type<int>(_915);
    float _983 = 0.0;
    float _985 = _927;
    if (!_925)
    {
        _983 = _937;
    }
    float _987 = _983;
    float _989 = _979 * 0.5;
    float _991 = _935 ? as_type<float>(_981) : _915;
    float _993 = _987;
    if (_925)
    {
        _993 = _909;
    }
    float _995 = _993;
    float _997 = -_955;
    float _999 = _997 + 1.0;
    float _1001 = 0.0;
    if (_919)
    {
        _1001 = _945;
    }
    float _1003 = _1001;
    float _1005 = _999 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1007 = _953 > 0.5;
    bool _1009 = _1007 && _919;
    float _1011 = -_977;
    float _1013 = _947 + _1011;
    float _1015 = _947 * 6.283185482025146484375;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1021 = _967;
    float _1023 = _1003;
    if (!_925)
    {
        _985 = _967;
    }
    float _1025 = _985;
    float _1027 = _1015 * 0.15915493667125701904296875;
    float _1029 = _1025;
    if (_925)
    {
        _1029 = _937;
    }
    float _1031 = _1029;
    float _1033 = fma(_1017, _991, -0.5);
    if (_925)
    {
        _1021 = _937;
    }
    float _1035 = _1021;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1039 = _1027 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1045 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1037);
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (_1009)
    {
        float _1049 = -_1003;
        float _1051 = _1049 + 1.0;
        _1023 = _1051;
    }
    float _1053 = _1023;
    float _1055 = _995 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_919)
    {
        _1047 = _945;
    }
    float _1059 = _1047;
    float _1061 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1063 = -_1043;
    float _1065 = fma(_1055, 2.0, _1063);
    float _1067 = _1059;
    if (_919)
    {
        _1067 = _1053;
    }
    float _1069 = _1067;
    float _1071 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1057);
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1077 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1045);
    float _1079 = fma(_1071, _1069, -0.5);
    float _1081 = fma(_1041, 0.5, 0.5);
    float _1083 = -_118;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1065);
    float _1087 = fma(_1061, -2.0, _1075);
    float _1089 = fma(_1077, _1079, _1085);
    float _1091 = -_1081;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1095 = _1013 < 0.5;
    float _1097 = float(_1095);
    float _1099 = -_1013;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1107 = -_1097;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1113 = abs(_442);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1117 = !_961;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = float(_1113);
    float _1129 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1087);
    int _1131 = abs(_1119);
    float _1133 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1073);
    bool _1135 = _570 > 0.0;
    bool _1137 = isnan(_570);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan(0.0);
    bool _1143 = _1139 || _1141;
    float _1145 = abs(_1101);
    float _1147 = _1127 * _1145;
    out.m_61.x = _1121;
    out.m_61.y = _1123;
    out.m_61.z = _1125;
    out.m_61.w = _1115;
    float _1149 = -_1129;
    float _1151 = fma(_1133, _1033, _1149);
    float _1153 = _1089 + 0.5;
    float _1155 = float(_1131);
    float _1157 = _1151 + 0.5;
    out.m_59.z = _1153;
    float _1159 = fma(_1155, _1093, _1147);
    float _1161 = float(_939);
    out.m_59.w = _1157;
    float _1163 = abs(_1109);
    float _1165 = fma(_1161, _1163, _1159);
    out.gl_Position.x = _850;
    out.gl_Position.y = _852;
    out.gl_Position.z = _973;
    out.gl_Position.w = _820;
    float _1167 = _1165 * _570;
    out.m_63.z = _989;
    out.m_63.w = _820;
    float _1169 = _1167 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1169;
    float _1171 = _1005 * _880;
    float _1173 = -_1005;
    float _1175 = _1173 + 1.0;
    float _1177 = _897 * _1171;
    float _1179 = _907 * _1171;
    float _1181 = fma(_903, _1177, _891);
    float _1183 = fma(_905, _1177, _893);
    float _1185 = _897 * _1175;
    float _1187 = fma(_897, _1179, _895);
    out.m_65.x = _1181;
    out.m_65.y = _1183;
    out.m_65.z = _1187;
    out.m_65.w = _1185;
    if (_1143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1189;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1246 = as_type<float>(_100);
        out.gl_Position.z = _1246;
    }
    if (!_88)
    {
        return out;
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_45.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_136);
        out.gl_Position.z = _1315;
    }
    if (_128)
    {
        return out;
    }
    float _138 = in.m_49.x;
    float _140 = in.m_49.y;
    float _142 = in.m_49.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _146);
    float _156 = in.m_51.w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = sqrt(_168);
    float _178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _180 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = _176 * _138;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _190 = _182;
    float _192 = _180;
    if (!_166)
    {
        _190 = _144;
    }
    float _194 = _190;
    float _196 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _186);
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = _196 * 0.15915493667125701904296875;
    float _206 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _208 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _210 = _194;
    if (!_166)
    {
        float _212 = _144 * _144;
        float _214 = _212 * 0.5;
        _192 = _214;
    }
    float _216 = _192;
    float _218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _206);
    float _220 = _204 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = _208 * _178;
    float _226 = _216;
    if (!_166)
    {
        float _228 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = _188 * _218;
    bool _234 = !_166;
    float _236 = _230;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _144 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _144);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _268;
    }
    float _270 = _236;
    bool _272 = !_166;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _144 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _210 = _292;
    }
    float _294 = _210;
    float _296 = _222 + _142;
    float _298 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _304 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _306 = fma(_294, _200, _298);
    float _308 = fma(_294, _198, _300);
    float _310 = _296 * 0.125;
    float _312 = fma(_294, _202, _302);
    float _314 = fma(_306, _156, _172);
    float _316 = fma(_308, _156, _170);
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _310);
    float _320 = fma(_312, _156, _174);
    float _322 = _314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _324 = _314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _326 = _232 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _328 = _304 * _318;
    float _330 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].x, _322);
    float _332 = _232 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].x, _324);
    float _336 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _326);
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _340 = _314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _332);
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[4].z, _334);
    float _346 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[10].z, _336);
    float _348 = _338 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _350 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _352 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[8].z, _342);
    float _354 = _344 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = _348 + _346;
    float _358 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[5].z, _350);
    bool _360 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _362 = isnan(0.5);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _368 = _364 || _366;
    float _370 = _354 + _352;
    float _372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _374 = _356 + _372;
    float _376 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _380 = _370 + _378;
    float _382 = _374 * _374;
    float _384 = _376 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _386 = fma(_380, _380, _382);
    float _388 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[11].x, _384);
    float _390 = _376 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _392 = sqrt(_386);
    float _394 = fma(_348, (*spvDescriptorSet0.vp_c8)._m0[11].z, _388);
    float _396 = _394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _398 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[10].x, _390);
    float _400 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _402 = 1.0 / _396;
    float _404 = fma(_348, (*spvDescriptorSet0.vp_c8)._m0[10].z, _398);
    float _406 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _400);
    float _408 = _404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _410 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[9].z, _406);
    bool _412 = _392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _414 = _408 + _396;
    float _416 = _376 + _410;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    float _426 = _410;
    float _428 = _376;
    float _430 = _396;
    float _432 = _374;
    if (_368)
    {
        _426 = 1.0;
    }
    float _434 = _426;
    float _436 = _414 * _402;
    float _438 = _436 * 0.5;
    bool _440 = !_420;
    int _442 = _440 ? 0 : 1;
    bool _444 = !_424;
    int _446 = _444 ? 0 : 1;
    float _448 = _434;
    if (!_412)
    {
        _428 = _370;
    }
    float _450 = _428;
    float _452 = _450;
    if (!_412)
    {
        _430 = _356;
    }
    float _454 = _430;
    float _456 = _454;
    if (!_412)
    {
        _238 = _416;
    }
    float _458 = _238;
    bool _460 = !_412;
    float _462 = _458;
    if (!_460)
    {
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _468 = _392 + _466;
        float _470 = _416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _472 = _468 * _464;
        float _474 = rsqrt(_386);
        float _476 = _472 * 0.15915493667125701904296875;
        float _478 = _476 * 6.283185482025146484375;
        float _480 = cos(_478);
        float _482 = _476 * 6.283185482025146484375;
        float _484 = sin(_482);
        float _486 = _480 + (-1.0);
        float _488 = _486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = fma(_484, _470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _492 = fma(_416, _480, _488);
        float _494 = _474 * _490;
        float _496 = fma(_380, _494, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _498 = fma(_374, _494, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _462 = _492;
        _452 = _496;
        _456 = _498;
    }
    float _500 = _462;
    float _502 = _452;
    float _504 = _456;
    if (!_368)
    {
        float _506 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _508 = _506 * 0.15915493667125701904296875;
        float _510 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _512 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _514 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _512);
        float _516 = _508 * 6.283185482025146484375;
        float _518 = cos(_516);
        float _520 = _510 * 0.15915493667125701904296875;
        float _522 = _508 * 6.283185482025146484375;
        float _524 = sin(_522);
        float _526 = 1.0 / _518;
        float _528 = _520 * 6.283185482025146484375;
        float _530 = cos(_528);
        float _532 = _524 * _526;
        float _534 = _520 * 6.283185482025146484375;
        float _536 = sin(_534);
        float _538 = _530 * _532;
        float _540 = 1.0 / _514;
        float _542 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _544 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _542;
        float _546 = 1.0 / _538;
        float _548 = 1.0 / _544;
        float _550 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _552 = _540 * _550;
        float _554 = _536 * _546;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _558 = fma(_554, _552, _556);
        float _560 = _558 * _548;
        float _562 = precise::clamp(_560, 0.0, 1.0);
        float _564 = -_562;
        float _566 = _564 + 1.0;
        _432 = _548;
        _448 = _566;
    }
    float _568 = _432;
    float _570 = _448;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _574 = _500 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _578 = _502 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _582 = _504 + _580;
    float _584 = _574 * _574;
    float _586 = fma(_578, _578, _584);
    float _588 = fma(_582, _582, _586);
    float _590 = rsqrt(_588);
    float _592 = sqrt(_588);
    float _594 = _590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _596 = _578 * _594;
    float _598 = _582 * _594;
    float _600 = _596 * _596;
    float _602 = _598 * _598;
    float _604 = _600 + _602;
    float _606 = sqrt(_604);
    bool _608 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _612 = _606 + _610;
    float _614 = _416;
    float _616 = _604;
    float _618 = _612;
    float _620 = _574;
    float _622 = _594;
    float _624 = _596;
    if (_608)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _614 = _626;
    }
    float _628 = _614;
    if (_608)
    {
        float _630 = rsqrt(_604);
        _616 = _630;
    }
    float _632 = _616;
    float _634 = _628;
    float _636 = _632;
    if (_608)
    {
        float _638 = _612 * _628;
        _618 = _638;
    }
    float _640 = _618;
    if (_608)
    {
        float _642 = _640 * 0.15915493667125701904296875;
        _634 = _642;
    }
    float _644 = _634;
    float _646 = _582;
    float _648 = _644;
    if (_608)
    {
        float _650 = _644 * 6.283185482025146484375;
        float _652 = sin(_650);
        _646 = _652;
    }
    float _654 = _646;
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _658 = precise::max(0.0, _656);
    float _660 = _568;
    float _662 = _658;
    if (_608)
    {
        float _664 = _644 * 6.283185482025146484375;
        float _666 = cos(_664);
        _660 = _666;
    }
    float _668 = _660;
    float _670 = -_594;
    float _672 = -_658;
    float _674 = fma(_574, _670, _672);
    if (_608)
    {
        float _676 = _674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _676;
    }
    float _678 = _620;
    float _680 = _654;
    float _682 = _678;
    if (_608)
    {
        float _684 = fma(_654, _678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = _686;
    if (!_608)
    {
        _682 = _598;
    }
    float _690 = _682;
    float _692 = _690;
    if (_608)
    {
        float _694 = _668 + (-1.0);
        _662 = _694;
    }
    float _696 = _662;
    float _698 = _696;
    if (_608)
    {
        float _700 = _632 * _686;
        _622 = _700;
    }
    float _702 = _622;
    if (!_608)
    {
        _688 = _674;
    }
    float _704 = _688;
    float _706 = _704;
    if (_608)
    {
        float _708 = _696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _648 = _708;
    }
    float _710 = _648;
    if (_608)
    {
        float _712 = _596 * _702;
        _624 = _712;
    }
    float _714 = _624;
    if (!_608)
    {
        _636 = _600;
    }
    float _716 = _636;
    float _718 = _716;
    if (_608)
    {
        float _720 = _598 * _702;
        _692 = _720;
    }
    float _722 = _692;
    if (_608)
    {
        float _724 = fma(_674, _668, _710);
        _706 = _724;
    }
    float _726 = _706;
    if (_608)
    {
        float _728 = _714 * _714;
        _718 = _728;
    }
    float _730 = _718;
    if (!_608)
    {
        _698 = _602;
    }
    float _732 = _698;
    float _734 = _732;
    if (_608)
    {
        float _736 = _722 * _722;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = fma(_726, _726, _730);
    float _742 = _740 + _738;
    float _744 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _748 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _746);
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _754 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _756 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _744);
    float _758 = rsqrt(_742);
    float _760 = -_750;
    float _762 = _760 + 1.0;
    float _764 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _766 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _752);
    float _768 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _770 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _756);
    float _772 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _764);
    float _774 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _766);
    float _776 = abs(_762);
    float _778 = log2(_776);
    float _780 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _768);
    float _782 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _772);
    float _784 = _774 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _786 = _770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _788 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _780);
    float _790 = _782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _792 = _784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _794 = _758 * _714;
    float _796 = _758 * _722;
    float _798 = _786 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _792);
    float _802 = _758 * _726;
    float _804 = _794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _806 = _788 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[7].z, _800);
    float _810 = _778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _812 = -_804;
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[21].y, _812);
    float _816 = -_798;
    float _818 = fma(_816, _754, 1.0);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[7].w, _808);
    float _822 = _784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _824 = -_796;
    float _826 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _814);
    float _828 = exp2(_810);
    float _830 = _784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _832 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _822);
    float _834 = fma(_826, -0.5, 0.5);
    float _836 = fma(_826, 0.5, 0.5);
    float _838 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _830);
    float _840 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[5].z, _832);
    float _842 = _802 + 1.0;
    float _844 = log2(_818);
    float _846 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[4].z, _838);
    float _848 = fma(_836, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _850 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[4].w, _846);
    float _852 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[5].w, _840);
    float _854 = fma(_836, _848, -0.212114393711090087890625);
    float _856 = 1.0 / _820;
    float _858 = -_802;
    float _860 = fma(_828, _842, _858);
    float _862 = fma(_836, _854, 1.570728778839111328125);
    float _864 = sqrt(_834);
    float _866 = _844 * 0.693147182464599609375;
    float _868 = _866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _870 = _850 * _856;
    float _872 = _852 * _856;
    float _874 = fma(_870, 0.5, 0.5);
    float _876 = fma(_872, -0.5, 0.5);
    float _878 = _864 * 0.636619746685028076171875;
    float3 _2529 = float3(_874, _876, _868);
    float _880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2529, float3(0.0), isnan(_2529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2529, float3(0.0), isnan(_2529)), level(0.0)).x;
    float _882 = -_862;
    float _884 = fma(_878, _882, 1.0);
    float _886 = fma(_860, 0.5, 0.5);
    float3 _2547 = float3(_874, _876, _868);
    float4 _889 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2547, float3(0.0), isnan(_2547)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2547, float3(0.0), isnan(_2547)), level(0.0)).xyzw;
    float _891 = _889.x;
    float _893 = _889.y;
    float _895 = _889.z;
    float _897 = _889.w;
    float2 _2564 = float2(_884, _886);
    float3 _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2564, float2(0.0), isnan(_2564)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2564, float2(0.0), isnan(_2564)), level(0.0)).xyz;
    float _903 = _901.x;
    float _905 = _901.y;
    float _907 = _901.z;
    float _909 = in.m_53.x;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _913 = _778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _915 = in.m_55.y;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _919 = _917 != 0;
    float _921 = _784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _925 = _923 != 0;
    float _927 = in.m_53.w;
    float _929 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    float _937 = in.m_53.y;
    int _939 = abs(_446);
    float _941 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _921);
    float _943 = _929 * _911;
    out.m_57.x = _138;
    float _945 = in.m_55.x;
    float _947 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[20].x, _943);
    float _949 = 0.0;
    if (_919)
    {
        float _951 = in.m_53.z;
        _949 = _951;
    }
    float _953 = _949;
    float _955 = exp2(_913);
    float _957 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[6].z, _941);
    int _959 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _961 = _959 != 0;
    float _963 = _911;
    if (!_925)
    {
        float _965 = in.m_53.z;
        _963 = _965;
    }
    float _967 = _963;
    float _969 = -_915;
    float _971 = _969 + 1.0;
    float _973 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[6].w, _957);
    bool _975 = _927 > 0.5;
    out.m_59.y = _915;
    float _977 = floor(_947);
    float _979 = _973 + _820;
    int _981 = _975 ? as_type<int>(_971) : as_type<int>(_915);
    float _983 = 0.0;
    float _985 = _927;
    if (!_925)
    {
        _983 = _937;
    }
    float _987 = _983;
    float _989 = _979 * 0.5;
    float _991 = _935 ? as_type<float>(_981) : _915;
    float _993 = _987;
    if (_925)
    {
        _993 = _909;
    }
    float _995 = _993;
    float _997 = -_955;
    float _999 = _997 + 1.0;
    float _1001 = 0.0;
    if (_919)
    {
        _1001 = _945;
    }
    float _1003 = _1001;
    float _1005 = _999 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1007 = _953 > 0.5;
    bool _1009 = _1007 && _919;
    float _1011 = -_977;
    float _1013 = _947 + _1011;
    float _1015 = _947 * 6.283185482025146484375;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1021 = _967;
    float _1023 = _1003;
    if (!_925)
    {
        _985 = _967;
    }
    float _1025 = _985;
    float _1027 = _1015 * 0.15915493667125701904296875;
    float _1029 = _1025;
    if (_925)
    {
        _1029 = _937;
    }
    float _1031 = _1029;
    float _1033 = fma(_1017, _991, -0.5);
    if (_925)
    {
        _1021 = _937;
    }
    float _1035 = _1021;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1039 = _1027 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1045 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1037);
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (_1009)
    {
        float _1049 = -_1003;
        float _1051 = _1049 + 1.0;
        _1023 = _1051;
    }
    float _1053 = _1023;
    float _1055 = _995 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_919)
    {
        _1047 = _945;
    }
    float _1059 = _1047;
    float _1061 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1063 = -_1043;
    float _1065 = fma(_1055, 2.0, _1063);
    float _1067 = _1059;
    if (_919)
    {
        _1067 = _1053;
    }
    float _1069 = _1067;
    float _1071 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1057);
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1077 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1045);
    float _1079 = fma(_1071, _1069, -0.5);
    float _1081 = fma(_1041, 0.5, 0.5);
    float _1083 = -_118;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1065);
    float _1087 = fma(_1061, -2.0, _1075);
    float _1089 = fma(_1077, _1079, _1085);
    float _1091 = -_1081;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1095 = _1013 < 0.5;
    float _1097 = float(_1095);
    float _1099 = -_1013;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1107 = -_1097;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1113 = abs(_442);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1117 = !_961;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = float(_1113);
    float _1129 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1087);
    int _1131 = abs(_1119);
    float _1133 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1073);
    bool _1135 = _570 > 0.0;
    bool _1137 = isnan(_570);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan(0.0);
    bool _1143 = _1139 || _1141;
    float _1145 = abs(_1101);
    float _1147 = _1127 * _1145;
    out.m_61.x = _1121;
    out.m_61.y = _1123;
    out.m_61.z = _1125;
    out.m_61.w = _1115;
    float _1149 = -_1129;
    float _1151 = fma(_1133, _1033, _1149);
    float _1153 = _1089 + 0.5;
    float _1155 = float(_1131);
    float _1157 = _1151 + 0.5;
    out.m_59.z = _1153;
    float _1159 = fma(_1155, _1093, _1147);
    float _1161 = float(_939);
    out.m_59.w = _1157;
    float _1163 = abs(_1109);
    float _1165 = fma(_1161, _1163, _1159);
    out.gl_Position.x = _850;
    out.gl_Position.y = _852;
    out.gl_Position.z = _973;
    out.gl_Position.w = _820;
    float _1167 = _1165 * _570;
    out.m_63.z = _989;
    out.m_63.w = _820;
    float _1169 = _1167 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1169;
    float _1171 = _1005 * _880;
    float _1173 = -_1005;
    float _1175 = _1173 + 1.0;
    float _1177 = _897 * _1171;
    float _1179 = _907 * _1171;
    float _1181 = fma(_903, _1177, _891);
    float _1183 = fma(_905, _1177, _893);
    float _1185 = _897 * _1175;
    float _1187 = fma(_897, _1179, _895);
    out.m_65.x = _1181;
    out.m_65.y = _1183;
    out.m_65.z = _1187;
    out.m_65.w = _1185;
    if (_1143)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1189;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _79 = in.m_42.w;
    float _81 = trunc(_79);
    int _84 = int(_81);
    bool _88 = _84 >= 1;
    float _90 = 0.0;
    float _92 = as_type<float>(_84);
    if (!_88)
    {
        _90 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _94 = _90;
    if (!_88)
    {
        out.m_45.x = 0.0;
    }
    int _96 = 0;
    if (!_88)
    {
        float _98 = _94 * 5.0;
        _96 = as_type<int>(_98);
    }
    int _100 = _96;
    int _102 = _100;
    if (!_88)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1246 = as_type<float>(_100);
        out.gl_Position.z = _1246;
    }
    if (!_88)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _104 = in.m_47.w;
    bool _106 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _108 = isnan(_104);
    bool _110 = _106 || _108;
    bool _112 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _114 = _110 || _112;
    float _116 = -_104;
    float _118 = _116 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_114)
    {
        float _120 = float(_84);
        _92 = _120;
    }
    float _122 = _92;
    bool _124 = _118 >= _122;
    bool _126 = !_114;
    bool _128 = _124 || _126;
    float _130 = _122;
    if (_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _130;
    if (_128)
    {
        out.m_45.x = 0.0;
    }
    if (_128)
    {
        float _134 = _132 * 5.0;
        _102 = as_type<int>(_134);
    }
    int _136 = _102;
    if (_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1315 = as_type<float>(_136);
        out.gl_Position.z = _1315;
    }
    if (_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _138 = in.m_49.x;
    float _140 = in.m_49.y;
    float _142 = in.m_49.z;
    float _144 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _146 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    float _154 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _146);
    float _156 = in.m_51.w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _154);
    float _170 = in.m_42.x;
    float _172 = in.m_42.y;
    float _174 = in.m_42.z;
    float _176 = sqrt(_168);
    float _178 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _138);
    float _180 = _148 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _182 = _150 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _184 = _152 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _186 = _176 * _138;
    float _188 = _182 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _190 = _182;
    float _192 = _180;
    if (!_166)
    {
        _190 = _144;
    }
    float _194 = _190;
    float _196 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.033333338797092437744140625, _186);
    float _198 = in.m_47.x;
    float _200 = in.m_47.y;
    float _202 = in.m_47.z;
    float _204 = _196 * 0.15915493667125701904296875;
    float _206 = _140 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _208 = _180 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _210 = _194;
    if (!_166)
    {
        float _212 = _144 * _144;
        float _214 = _212 * 0.5;
        _192 = _214;
    }
    float _216 = _192;
    float _218 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _206);
    float _220 = _204 * 6.283185482025146484375;
    float _222 = sin(_220);
    float _224 = _208 * _178;
    float _226 = _216;
    if (!_166)
    {
        float _228 = _216 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _226 = _228;
    }
    float _230 = _226;
    float _232 = _188 * _218;
    bool _234 = !_166;
    float _236 = _230;
    float _238 = _232;
    if (!_234)
    {
        float _240 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _242 = log2(_240);
        float _244 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _246 = _244 + 1.0;
        float _248 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _250 = _144 * _242;
        float _252 = 1.0 / _246;
        float _254 = _248 * 0.693147182464599609375;
        float _256 = exp2(_250);
        float _258 = 1.0 / _254;
        float _260 = _256 + (-1.0);
        float _262 = -_260;
        float _264 = fma(_262, _258, _144);
        float _266 = _264 * _252;
        float _268 = _266 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _236 = _268;
    }
    float _270 = _236;
    bool _272 = !_166;
    if (!_272)
    {
        float _274 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _276 = log2(_274);
        float _278 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _280 = _278 + 1.0;
        float _282 = 1.0 / _280;
        float _284 = _144 * _276;
        float _286 = exp2(_284);
        float _288 = -_286;
        float _290 = _288 + 1.0;
        float _292 = _290 * _282;
        _210 = _292;
    }
    float _294 = _210;
    float _296 = _222 + _142;
    float _298 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _300 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _302 = _270 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _304 = _184 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _306 = fma(_294, _200, _298);
    float _308 = fma(_294, _198, _300);
    float _310 = _296 * 0.125;
    float _312 = fma(_294, _202, _302);
    float _314 = fma(_306, _156, _172);
    float _316 = fma(_308, _156, _170);
    float _318 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _310);
    float _320 = fma(_312, _156, _174);
    float _322 = _314 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _324 = _314 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _326 = _232 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _328 = _304 * _318;
    float _330 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[6].x, _322);
    float _332 = _232 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _334 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[4].x, _324);
    float _336 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[10].x, _326);
    float _338 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[6].z, _330);
    float _340 = _314 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _342 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[8].x, _332);
    float _344 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[4].z, _334);
    float _346 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[10].z, _336);
    float _348 = _338 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _350 = fma(_316, (*spvDescriptorSet0.vp_c10)._m0[5].x, _340);
    float _352 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[8].z, _342);
    float _354 = _344 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _356 = _348 + _346;
    float _358 = fma(_320, (*spvDescriptorSet0.vp_c10)._m0[5].z, _350);
    bool _360 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _362 = isnan(0.5);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _368 = _364 || _366;
    float _370 = _354 + _352;
    float _372 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _374 = _356 + _372;
    float _376 = _358 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _378 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _380 = _370 + _378;
    float _382 = _374 * _374;
    float _384 = _376 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _386 = fma(_380, _380, _382);
    float _388 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[11].x, _384);
    float _390 = _376 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _392 = sqrt(_386);
    float _394 = fma(_348, (*spvDescriptorSet0.vp_c8)._m0[11].z, _388);
    float _396 = _394 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _398 = fma(_354, (*spvDescriptorSet0.vp_c8)._m0[10].x, _390);
    float _400 = _232 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _402 = 1.0 / _396;
    float _404 = fma(_348, (*spvDescriptorSet0.vp_c8)._m0[10].z, _398);
    float _406 = fma(_224, (*spvDescriptorSet0.vp_c10)._m0[9].x, _400);
    float _408 = _404 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _410 = fma(_328, (*spvDescriptorSet0.vp_c10)._m0[9].z, _406);
    bool _412 = _392 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _414 = _408 + _396;
    float _416 = _376 + _410;
    int _418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _420 = _418 != 0;
    int _422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _424 = _422 != 0;
    float _426 = _410;
    float _428 = _376;
    float _430 = _396;
    float _432 = _374;
    if (_368)
    {
        _426 = 1.0;
    }
    float _434 = _426;
    float _436 = _414 * _402;
    float _438 = _436 * 0.5;
    bool _440 = !_420;
    int _442 = _440 ? 0 : 1;
    bool _444 = !_424;
    int _446 = _444 ? 0 : 1;
    float _448 = _434;
    if (!_412)
    {
        _428 = _370;
    }
    float _450 = _428;
    float _452 = _450;
    if (!_412)
    {
        _430 = _356;
    }
    float _454 = _430;
    float _456 = _454;
    if (!_412)
    {
        _238 = _416;
    }
    float _458 = _238;
    bool _460 = !_412;
    float _462 = _458;
    if (!_460)
    {
        float _464 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _466 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _468 = _392 + _466;
        float _470 = _416 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _472 = _468 * _464;
        float _474 = rsqrt(_386);
        float _476 = _472 * 0.15915493667125701904296875;
        float _478 = _476 * 6.283185482025146484375;
        float _480 = cos(_478);
        float _482 = _476 * 6.283185482025146484375;
        float _484 = sin(_482);
        float _486 = _480 + (-1.0);
        float _488 = _486 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _490 = fma(_484, _470, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _492 = fma(_416, _480, _488);
        float _494 = _474 * _490;
        float _496 = fma(_380, _494, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _498 = fma(_374, _494, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _462 = _492;
        _452 = _496;
        _456 = _498;
    }
    float _500 = _462;
    float _502 = _452;
    float _504 = _456;
    if (!_368)
    {
        float _506 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _508 = _506 * 0.15915493667125701904296875;
        float _510 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _512 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _514 = fma(_438, (*spvDescriptorSet0.vp_c8)._m0[30].w, _512);
        float _516 = _508 * 6.283185482025146484375;
        float _518 = cos(_516);
        float _520 = _510 * 0.15915493667125701904296875;
        float _522 = _508 * 6.283185482025146484375;
        float _524 = sin(_522);
        float _526 = 1.0 / _518;
        float _528 = _520 * 6.283185482025146484375;
        float _530 = cos(_528);
        float _532 = _524 * _526;
        float _534 = _520 * 6.283185482025146484375;
        float _536 = sin(_534);
        float _538 = _530 * _532;
        float _540 = 1.0 / _514;
        float _542 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _544 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _542;
        float _546 = 1.0 / _538;
        float _548 = 1.0 / _544;
        float _550 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _552 = _540 * _550;
        float _554 = _536 * _546;
        float _556 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _558 = fma(_554, _552, _556);
        float _560 = _558 * _548;
        float _562 = precise::clamp(_560, 0.0, 1.0);
        float _564 = -_562;
        float _566 = _564 + 1.0;
        _432 = _548;
        _448 = _566;
    }
    float _568 = _432;
    float _570 = _448;
    float _572 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _574 = _500 + _572;
    float _576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _578 = _502 + _576;
    float _580 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _582 = _504 + _580;
    float _584 = _574 * _574;
    float _586 = fma(_578, _578, _584);
    float _588 = fma(_582, _582, _586);
    float _590 = rsqrt(_588);
    float _592 = sqrt(_588);
    float _594 = _590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _596 = _578 * _594;
    float _598 = _582 * _594;
    float _600 = _596 * _596;
    float _602 = _598 * _598;
    float _604 = _600 + _602;
    float _606 = sqrt(_604);
    bool _608 = _606 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _610 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _612 = _606 + _610;
    float _614 = _416;
    float _616 = _604;
    float _618 = _612;
    float _620 = _574;
    float _622 = _594;
    float _624 = _596;
    if (_608)
    {
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _614 = _626;
    }
    float _628 = _614;
    if (_608)
    {
        float _630 = rsqrt(_604);
        _616 = _630;
    }
    float _632 = _616;
    float _634 = _628;
    float _636 = _632;
    if (_608)
    {
        float _638 = _612 * _628;
        _618 = _638;
    }
    float _640 = _618;
    if (_608)
    {
        float _642 = _640 * 0.15915493667125701904296875;
        _634 = _642;
    }
    float _644 = _634;
    float _646 = _582;
    float _648 = _644;
    if (_608)
    {
        float _650 = _644 * 6.283185482025146484375;
        float _652 = sin(_650);
        _646 = _652;
    }
    float _654 = _646;
    float _656 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _658 = precise::max(0.0, _656);
    float _660 = _568;
    float _662 = _658;
    if (_608)
    {
        float _664 = _644 * 6.283185482025146484375;
        float _666 = cos(_664);
        _660 = _666;
    }
    float _668 = _660;
    float _670 = -_594;
    float _672 = -_658;
    float _674 = fma(_574, _670, _672);
    if (_608)
    {
        float _676 = _674 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _620 = _676;
    }
    float _678 = _620;
    float _680 = _654;
    float _682 = _678;
    if (_608)
    {
        float _684 = fma(_654, _678, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _680 = _684;
    }
    float _686 = _680;
    float _688 = _686;
    if (!_608)
    {
        _682 = _598;
    }
    float _690 = _682;
    float _692 = _690;
    if (_608)
    {
        float _694 = _668 + (-1.0);
        _662 = _694;
    }
    float _696 = _662;
    float _698 = _696;
    if (_608)
    {
        float _700 = _632 * _686;
        _622 = _700;
    }
    float _702 = _622;
    if (!_608)
    {
        _688 = _674;
    }
    float _704 = _688;
    float _706 = _704;
    if (_608)
    {
        float _708 = _696 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _648 = _708;
    }
    float _710 = _648;
    if (_608)
    {
        float _712 = _596 * _702;
        _624 = _712;
    }
    float _714 = _624;
    if (!_608)
    {
        _636 = _600;
    }
    float _716 = _636;
    float _718 = _716;
    if (_608)
    {
        float _720 = _598 * _702;
        _692 = _720;
    }
    float _722 = _692;
    if (_608)
    {
        float _724 = fma(_674, _668, _710);
        _706 = _724;
    }
    float _726 = _706;
    if (_608)
    {
        float _728 = _714 * _714;
        _718 = _728;
    }
    float _730 = _718;
    if (!_608)
    {
        _698 = _602;
    }
    float _732 = _698;
    float _734 = _732;
    if (_608)
    {
        float _736 = _722 * _722;
        _734 = _736;
    }
    float _738 = _734;
    float _740 = fma(_726, _726, _730);
    float _742 = _740 + _738;
    float _744 = _500 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _748 = fma(_592, (*spvDescriptorSet0.vp_c15)._m0[23].w, _746);
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float _752 = _500 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _754 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _756 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[2].x, _744);
    float _758 = rsqrt(_742);
    float _760 = -_750;
    float _762 = _760 + 1.0;
    float _764 = _500 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _766 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[1].x, _752);
    float _768 = _500 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _770 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[2].z, _756);
    float _772 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[0].x, _764);
    float _774 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[1].z, _766);
    float _776 = abs(_762);
    float _778 = log2(_776);
    float _780 = fma(_502, (*spvDescriptorSet0.vp_c8)._m0[3].x, _768);
    float _782 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[0].z, _772);
    float _784 = _774 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _786 = _770 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _788 = fma(_504, (*spvDescriptorSet0.vp_c8)._m0[3].z, _780);
    float _790 = _782 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _792 = _784 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _794 = _758 * _714;
    float _796 = _758 * _722;
    float _798 = _786 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _792);
    float _802 = _758 * _726;
    float _804 = _794 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _806 = _788 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _808 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[7].z, _800);
    float _810 = _778 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _812 = -_804;
    float _814 = fma(_802, (*spvDescriptorSet0.vp_c15)._m0[21].y, _812);
    float _816 = -_798;
    float _818 = fma(_816, _754, 1.0);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[7].w, _808);
    float _822 = _784 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _824 = -_796;
    float _826 = fma(_824, (*spvDescriptorSet0.vp_c15)._m0[21].z, _814);
    float _828 = exp2(_810);
    float _830 = _784 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _832 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _822);
    float _834 = fma(_826, -0.5, 0.5);
    float _836 = fma(_826, 0.5, 0.5);
    float _838 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _830);
    float _840 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[5].z, _832);
    float _842 = _802 + 1.0;
    float _844 = log2(_818);
    float _846 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[4].z, _838);
    float _848 = fma(_836, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _850 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[4].w, _846);
    float _852 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[5].w, _840);
    float _854 = fma(_836, _848, -0.212114393711090087890625);
    float _856 = 1.0 / _820;
    float _858 = -_802;
    float _860 = fma(_828, _842, _858);
    float _862 = fma(_836, _854, 1.570728778839111328125);
    float _864 = sqrt(_834);
    float _866 = _844 * 0.693147182464599609375;
    float _868 = _866 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _870 = _850 * _856;
    float _872 = _852 * _856;
    float _874 = fma(_870, 0.5, 0.5);
    float _876 = fma(_872, -0.5, 0.5);
    float _878 = _864 * 0.636619746685028076171875;
    float3 _2529 = float3(_874, _876, _868);
    float _880 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2529, float3(0.0), isnan(_2529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2529, float3(0.0), isnan(_2529)), level(0.0)).x;
    float _882 = -_862;
    float _884 = fma(_878, _882, 1.0);
    float _886 = fma(_860, 0.5, 0.5);
    float3 _2547 = float3(_874, _876, _868);
    float4 _889 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2547, float3(0.0), isnan(_2547)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2547, float3(0.0), isnan(_2547)), level(0.0)).xyzw;
    float _891 = _889.x;
    float _893 = _889.y;
    float _895 = _889.z;
    float _897 = _889.w;
    float2 _2564 = float2(_884, _886);
    float3 _901 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2564, float2(0.0), isnan(_2564)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2564, float2(0.0), isnan(_2564)), level(0.0)).xyz;
    float _903 = _901.x;
    float _905 = _901.y;
    float _907 = _901.z;
    float _909 = in.m_53.x;
    float _911 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _913 = _778 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _915 = in.m_55.y;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _919 = _917 != 0;
    float _921 = _784 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _925 = _923 != 0;
    float _927 = in.m_53.w;
    float _929 = _118 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _931 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _935 = _933 != 0;
    float _937 = in.m_53.y;
    int _939 = abs(_446);
    float _941 = fma(_790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _921);
    float _943 = _929 * _911;
    out.m_57.x = _138;
    float _945 = in.m_55.x;
    float _947 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[20].x, _943);
    float _949 = 0.0;
    if (_919)
    {
        float _951 = in.m_53.z;
        _949 = _951;
    }
    float _953 = _949;
    float _955 = exp2(_913);
    float _957 = fma(_786, (*spvDescriptorSet0.vp_c8)._m0[6].z, _941);
    int _959 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _961 = _959 != 0;
    float _963 = _911;
    if (!_925)
    {
        float _965 = in.m_53.z;
        _963 = _965;
    }
    float _967 = _963;
    float _969 = -_915;
    float _971 = _969 + 1.0;
    float _973 = fma(_806, (*spvDescriptorSet0.vp_c8)._m0[6].w, _957);
    bool _975 = _927 > 0.5;
    out.m_59.y = _915;
    float _977 = floor(_947);
    float _979 = _973 + _820;
    int _981 = _975 ? as_type<int>(_971) : as_type<int>(_915);
    float _983 = 0.0;
    float _985 = _927;
    if (!_925)
    {
        _983 = _937;
    }
    float _987 = _983;
    float _989 = _979 * 0.5;
    float _991 = _935 ? as_type<float>(_981) : _915;
    float _993 = _987;
    if (_925)
    {
        _993 = _909;
    }
    float _995 = _993;
    float _997 = -_955;
    float _999 = _997 + 1.0;
    float _1001 = 0.0;
    if (_919)
    {
        _1001 = _945;
    }
    float _1003 = _1001;
    float _1005 = _999 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _1007 = _953 > 0.5;
    bool _1009 = _1007 && _919;
    float _1011 = -_977;
    float _1013 = _947 + _1011;
    float _1015 = _947 * 6.283185482025146484375;
    float _1017 = _931 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1021 = _967;
    float _1023 = _1003;
    if (!_925)
    {
        _985 = _967;
    }
    float _1025 = _985;
    float _1027 = _1015 * 0.15915493667125701904296875;
    float _1029 = _1025;
    if (_925)
    {
        _1029 = _937;
    }
    float _1031 = _1029;
    float _1033 = fma(_1017, _991, -0.5);
    if (_925)
    {
        _1021 = _937;
    }
    float _1035 = _1021;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1039 = _1027 * 6.283185482025146484375;
    float _1041 = cos(_1039);
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1045 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1037);
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[83].w;
    if (_1009)
    {
        float _1049 = -_1003;
        float _1051 = _1049 + 1.0;
        _1023 = _1051;
    }
    float _1053 = _1023;
    float _1055 = _995 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1057 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    if (!_919)
    {
        _1047 = _945;
    }
    float _1059 = _1047;
    float _1061 = _1031 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1063 = -_1043;
    float _1065 = fma(_1055, 2.0, _1063);
    float _1067 = _1059;
    if (_919)
    {
        _1067 = _1053;
    }
    float _1069 = _1067;
    float _1071 = _1019 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1073 = fma(_1035, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1057);
    float _1075 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1077 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1045);
    float _1079 = fma(_1071, _1069, -0.5);
    float _1081 = fma(_1041, 0.5, 0.5);
    float _1083 = -_118;
    float _1085 = fma(_1083, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1065);
    float _1087 = fma(_1061, -2.0, _1075);
    float _1089 = fma(_1077, _1079, _1085);
    float _1091 = -_1081;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _1095 = _1013 < 0.5;
    float _1097 = float(_1095);
    float _1099 = -_1013;
    float _1101 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1107 = -_1097;
    float _1109 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _1111 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    int _1113 = abs(_442);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _1117 = !_961;
    int _1119 = _1117 ? 0 : 1;
    float _1121 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1127 = float(_1113);
    float _1129 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1087);
    int _1131 = abs(_1119);
    float _1133 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1073);
    bool _1135 = _570 > 0.0;
    bool _1137 = isnan(_570);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan(0.0);
    bool _1143 = _1139 || _1141;
    float _1145 = abs(_1101);
    float _1147 = _1127 * _1145;
    out.m_61.x = _1121;
    out.m_61.y = _1123;
    out.m_61.z = _1125;
    out.m_61.w = _1115;
    float _1149 = -_1129;
    float _1151 = fma(_1133, _1033, _1149);
    float _1153 = _1089 + 0.5;
    float _1155 = float(_1131);
    float _1157 = _1151 + 0.5;
    out.m_59.z = _1153;
    float _1159 = fma(_1155, _1093, _1147);
    float _1161 = float(_939);
    out.m_59.w = _1157;
    float _1163 = abs(_1109);
    float _1165 = fma(_1161, _1163, _1159);
    out.gl_Position.x = _850;
    out.gl_Position.y = _852;
    out.gl_Position.z = _973;
    out.gl_Position.w = _820;
    float _1167 = _1165 * _570;
    out.m_63.z = _989;
    out.m_63.w = _820;
    float _1169 = _1167 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _1169;
    float _1171 = _1005 * _880;
    float _1173 = -_1005;
    float _1175 = _1173 + 1.0;
    float _1177 = _897 * _1171;
    float _1179 = _907 * _1171;
    float _1181 = fma(_903, _1177, _891);
    float _1183 = fma(_905, _1177, _893);
    float _1185 = _897 * _1175;
    float _1187 = fma(_897, _1179, _895);
    out.m_65.x = _1181;
    out.m_65.y = _1183;
    out.m_65.z = _1187;
    out.m_65.w = _1185;
    if (_1143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1189 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1189;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

