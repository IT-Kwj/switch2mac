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
    float4 m_53 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_59 [[user(locn5)]];
    float4 m_65 [[user(locn6)]];
    float4 m_69 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
    float4 m_55 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _785 = false;
    bool _638 = false;
    bool _502 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2323 = as_type<float>(_104);
        out.gl_Position.z = _2323;
    }
    if (!_92)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2392 = as_type<float>(_140);
        out.gl_Position.z = _2392;
    }
    if (_132)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_51.w;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_42.x;
    float _154 = in.m_42.y;
    float _156 = in.m_42.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = _146 * _144;
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = _170 * 6.283185482025146484375;
    float _180 = floor(_170);
    float _182 = _178 * 0.15915493667125701904296875;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _182 * 6.283185482025146484375;
    float _190 = cos(_188);
    float _192 = -_180;
    float _194 = _170 + _192;
    float _196 = _180;
    float _198 = _150;
    if (!_166)
    {
        float _200 = _150 * _150;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    bool _206 = _194 < 0.5;
    float _208 = float(_206);
    float _210 = _204;
    if (!_166)
    {
        float _212 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_166;
    float _218 = _214;
    float _220 = _152;
    float _222 = _154;
    float _224 = _176;
    float _226 = _176;
    if (!_216)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = _150 * _230;
        float _240 = 1.0 / _234;
        float _242 = _236 * 0.693147182464599609375;
        float _244 = exp2(_238);
        float _246 = 1.0 / _242;
        float _248 = _244 + (-1.0);
        float _250 = -_248;
        float _252 = fma(_250, _246, _150);
        float _254 = _252 * _240;
        float _256 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _256;
    }
    float _258 = _218;
    bool _260 = !_166;
    if (!_260)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = 1.0 / _268;
        float _272 = _150 * _264;
        float _274 = exp2(_272);
        float _276 = -_274;
        float _278 = _276 + 1.0;
        float _280 = _278 * _270;
        _198 = _280;
    }
    float _282 = _198;
    float _284 = -_194;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = fma(_190, 0.5, 0.5);
    float _290 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _294 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = -_208;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _300 = -_288;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = fma(_282, _172, _290);
    float _306 = fma(_282, _174, _292);
    float _308 = fma(_282, _176, _294);
    float _310 = _292;
    if (!_166)
    {
        float _312 = _122 * _122;
        float _314 = _312 * 0.5;
        _310 = _314;
    }
    float _316 = _310;
    float _318 = fma(_304, _148, _152);
    float _320 = fma(_306, _148, _154);
    float _322 = fma(_308, _148, _156);
    if (!_166)
    {
        float _324 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _324;
    }
    float _326 = _220;
    float _328 = _326;
    if (!_166)
    {
        _222 = _122;
    }
    float _330 = _222;
    bool _332 = !_166;
    float _334 = _330;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _122 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _122);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _364;
    }
    float _366 = _328;
    bool _368 = !_166;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _122 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _334 = _388;
    }
    float _390 = _334;
    bool _392 = !_186;
    int _394 = _392 ? 0 : 1;
    float _396 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _400 = _398 != 0;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _404 = _402 != 0;
    float _406 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _408 = abs(_394);
    float _410 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _412 = fma(_390, _174, _396);
    bool _414 = !_400;
    int _416 = _414 ? 0 : 1;
    float _418 = fma(_390, _172, _406);
    float _420 = fma(_390, _176, _410);
    float _422 = -_412;
    float _424 = _306 + _422;
    bool _426 = !_404;
    int _428 = _426 ? 0 : 1;
    int _430 = abs(_416);
    float _432 = -_418;
    float _434 = _304 + _432;
    float _436 = _424 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _438 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _442 = _424 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _444 = abs(_428);
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].x, _436);
    float _448 = float(_430);
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].x, _438);
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _454 = float(_408);
    float _456 = -_420;
    float _458 = _308 + _456;
    float _460 = abs(_286);
    float _462 = _448 * _460;
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _466 = float(_444);
    float _468 = fma(_454, _302, _462);
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
    float _472 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[6].z, _452);
    float _474 = abs(_298);
    float _476 = fma(_466, _474, _468);
    bool _478 = !_440;
    float _480 = _470;
    float _482 = _464;
    float _484 = _472;
    float _500;
    if (!_478)
    {
        float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _488 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _490 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _492 = _490 * _486;
        float _494 = floor(_492);
        float _496 = -_494;
        float _498 = _492 + _496;
        _500 = _498;
        _502 = true;
    }
    else
    {
        float _504 = float(_88);
        float _506 = 1.0 / _504;
        float _508 = _122 * _506;
        _500 = _508;
    }
    _502 = false;
    float _510 = _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _514 = _510 + _512;
    float _516 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _518 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _520 = isnan(_510);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _530;
    bool _534 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _536 = isnan(_510);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = _516 * _142;
    float _548 = 1.0 / _532;
    float _550 = -_544;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = _528 * _552;
    float _562 = -_528;
    float _564 = _562 + 1.0;
    float _566 = trunc(_546);
    int _568 = int(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _574;
    float _578 = _514 * _548;
    float _580 = in.m_51.x;
    float _582 = in.m_51.y;
    float _584 = in.m_51.z;
    float _586 = fma(_556, _578, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _588 = fma(_572, _578, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _590 = fma(_576, _578, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _592 = _586 * _560;
    float _594 = _588 * _560;
    float _596 = _590 * _560;
    int _598 = _568 << 4;
    int _600 = _598 + 1712;
    float _602 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _604 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _606 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _608 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].x, _602);
    float _610 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].y, _604);
    float _612 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].z, _606);
    float _614 = _610 * _582;
    float _616 = _608 * _580;
    float _618 = _612 * _584;
    bool _620 = !_558;
    float _636;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _624 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_88);
        float _642 = 1.0 / _640;
        float _644 = _122 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    uint _649 = uint(int(uint(_600) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[int(_659)][_661];
    bool _665 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_646);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    int _683 = _600 + 8;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[int(_687)][_689];
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = 1.0 / _679;
    float _699 = -_675;
    float _701 = _699 + 1.0;
    float _703 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _705 = _703 * _142;
    float _707 = _695 * _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _646 + _709;
    bool _713 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _715 = isnan(_646);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = trunc(_705);
    int _727 = int(_725);
    float _729 = fma(_707, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _731 = _723 * _701;
    float _733 = -_723;
    float _735 = _733 + 1.0;
    float _737 = _729 * _731;
    float _739 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[115].x, _737);
    float _741 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[116].x, _739);
    int _743 = _727 << 4;
    int _745 = _743 + 1968;
    float _747 = _655 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _749 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _751 = _741 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _753 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _753;
    out.m_53.y = _755;
    out.m_53.z = _759;
    out.m_53.w = _751;
    bool _761 = !_681;
    int _763 = as_type<int>(_753);
    bool _765 = _681;
    float _767 = _751;
    float _783;
    if (!_761)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _771 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _763 = as_type<int>(_775);
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_88);
        float _789 = 1.0 / _787;
        float _791 = _122 * _789;
        _783 = _791;
    }
    _785 = false;
    int _793 = _763;
    float _795 = _783;
    float _797 = in.m_55.x;
    float _799 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _801 = in.m_55.y;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    float _807 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _811 = _809 != 0;
    float _813 = in.m_49.z;
    float _815 = in.m_49.w;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _819 = _817 != 0;
    float _821 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _825 = _823 != 0;
    float _827 = in.m_49.y;
    float _829 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _807);
    float _831 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _833 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _835 = _793;
    if (_805)
    {
        bool _837 = _142 > 0.5;
        _765 = _837;
    }
    bool _839 = _765;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    if (_805)
    {
        float _847 = -_797;
        float _849 = _847 + 1.0;
        _835 = as_type<int>(_849);
    }
    int _851 = _835;
    if (!_805)
    {
        _767 = _797;
    }
    float _853 = _767;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _857 = 1.0 / _845;
    float _859 = -_801;
    float _861 = _859 + 1.0;
    float _863 = _853;
    float _865 = _801;
    if (_805)
    {
        float _867 = _839 ? as_type<float>(_851) : _797;
        _863 = _867;
    }
    float _869 = _863;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _873 = in.m_57.x;
    float _875 = in.m_57.y;
    float _877 = in.m_57.z;
    bool _879 = _813 > 0.5;
    float _881 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].z, _855);
    bool _883 = _815 > 0.5;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _887 = _827 > 0.5;
    int _889 = _879 ? as_type<int>(_861) : as_type<int>(_801);
    int _891 = _887 ? as_type<int>(_861) : as_type<int>(_801);
    float _893 = _819 ? as_type<float>(_889) : _801;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _897 = _895 != 0;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    float _903 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _799);
    float _905 = _825 ? as_type<float>(_891) : _801;
    float _907 = _799;
    bool _909 = _883;
    float _911 = _893;
    float _913 = _827;
    if (_811)
    {
        float _915 = in.m_49.z;
        _907 = _915;
    }
    float _917 = _907;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _921 = _919 != 0;
    float _923 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _821);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _929 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _875);
    float _933 = 1.0 / _927;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _873);
    float _937 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _939 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _829);
    float _941 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _877);
    if (_901)
    {
        float _945 = _883 ? _861 : _801;
        _865 = _945;
    }
    float _947 = _865;
    float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _951 = _833 * _931;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _961 = _831 * _943;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _965 = _795 + _963;
    float _967 = _955 * _857;
    float _969 = _959 * _933;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _973 = _795 + _971;
    int _975 = as_type<int>(_961);
    if (_811)
    {
        bool _977 = _917 > 0.5;
        _909 = _977;
    }
    bool _979 = _909;
    float _981 = _937 * _935;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _985 = fma(_967, _973, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _987 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _989 = isnan(_795);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_969, _965, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1001 = _949 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1003 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1005 = isnan(_795);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1017 = -_997;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_893, _1001, -0.5);
    bool _1023 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1025 = isnan(_795);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1031 = _1027 || _1029;
    int _1033 = _1031 ? 1065353216 : 0;
    float _1035 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1037 = _1013 * _1019;
    float _1039 = _1015;
    int _1041 = _1033;
    float _1043 = _1035;
    if (_921)
    {
        _911 = _142;
    }
    float _1045 = _911;
    float _1047 = -_1013;
    float _1049 = _1047 + 1.0;
    float _1051 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = _1045;
    if (!_921)
    {
        _1053 = _813;
    }
    float _1055 = _1053;
    float _1057 = _983 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1059 = as_type<float>(_1033) * _1049;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1063 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1065 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1067 = fma(_1057, _947, -0.5);
    float _1069 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1015);
    float _1071 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1035);
    float _1073 = -_1061;
    float _1075 = fma(_1065, 2.0, _1073);
    float _1077 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1079 = _1057;
    float _1081 = _1071;
    float _1083 = _1077;
    if (!_921)
    {
        _1039 = _827;
    }
    float _1085 = _1039;
    float _1087 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1063);
    float _1089 = _1085;
    if (_921)
    {
        _1089 = _142;
    }
    float _1091 = _1089;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1095 = _985 * _1059;
    float _1097 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1099 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1071);
    float _1101 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1077);
    float _1103 = -as_type<float>(_1033);
    float _1105 = _1103 + 1.0;
    if (_811)
    {
        float _1107 = -_797;
        float _1109 = _1107 + 1.0;
        _975 = as_type<int>(_1109);
    }
    int _1111 = _975;
    if (_897)
    {
        float _1113 = -_797;
        float _1115 = _1113 + 1.0;
        _1041 = as_type<int>(_1115);
    }
    int _1117 = _1041;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1093);
    float _1121 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1123 = _941 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1125 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_811)
    {
        _1079 = _797;
    }
    float _1127 = _1079;
    float _1129 = _939 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1131 = _1127;
    if (!_897)
    {
        _1081 = _797;
    }
    float _1133 = _1081;
    float _1135 = _1123 + _1125;
    float _1137 = _1133;
    if (_811)
    {
        float _1139 = _979 ? as_type<float>(_1111) : _797;
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1095);
    if (_897)
    {
        float _1145 = _887 ? as_type<float>(_1117) : _797;
        _1137 = _1145;
    }
    float _1147 = _1137;
    float _1149 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_921)
    {
        _1083 = _813;
    }
    float _1151 = _1083;
    float _1153 = fma(_999, _1037, _1143);
    float _1155 = _1151;
    float _1157 = _1153;
    if (!_921)
    {
        _1043 = _813;
    }
    float _1159 = _1043;
    float _1161 = _1129 + _1149;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1165 = _1135 + _1163;
    int _1167 = _745 + 8;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    uint _1171 = uint(int(uint(int(_1169)) >> uint(2)));
    int _1173 = int(_1169) & 3;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[int(_1171)][_1173];
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1161 + _1177;
    float _1181 = _1165 * _1165;
    float _1183 = _1159;
    float _1185 = _1161;
    if (_921)
    {
        _1183 = _827;
    }
    float _1187 = _1183;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_921)
    {
        _1155 = _827;
    }
    float _1191 = _1155;
    float _1193 = fma(_1179, _1179, _1181);
    if (!_921)
    {
        _913 = _142;
    }
    float _1195 = _913;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[83].w, _871);
    float _1199 = _841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1201 = sqrt(_1193);
    float _1203 = _885 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1205 = -_1189;
    float _1207 = fma(_1121, 2.0, _1205);
    float _1209 = fma(_1199, _1141, -0.5);
    float _1211 = fma(_1203, _1147, -0.5);
    uint _1213 = uint(int(uint(_745) >> uint(2)));
    uint _1215 = uint(int(uint(int(_1213)) >> uint(2)));
    int _1217 = int(_1213) & 3;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[int(_1215)][_1217];
    int _1221 = int(_1213) + 1;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    int _1225 = _1221 & 3;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[int(_1223)][_1225];
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1231 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1233 = -_122;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1207);
    float _1237 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _881);
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1241 = fma(_1231, -2.0, _1229);
    float _1243 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1119);
    float _1245 = -_122;
    float _1247 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1075);
    bool _1249 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1253 = fma(_1243, _1209, _1235);
    float _1255 = fma(_1237, _1211, _1247);
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1259 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1261 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1265 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1197);
    float _1267 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1241);
    float _1269 = _1251 + _1261;
    float _1271 = fma(_1259, -2.0, _1263);
    float _1273 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1153);
    float _1275 = -_1267;
    float _1277 = fma(_1265, _1067, _1275);
    float _1279 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1069);
    float _1281 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1271);
    float _1283 = _1261;
    if (!_1249)
    {
        _1157 = _1135;
    }
    float _1285 = _1157;
    float _1287 = _1285;
    if (!_1249)
    {
        _1283 = _1269;
    }
    float _1289 = _1283;
    bool _1291 = !_1249;
    float _1293 = _1289;
    if (!_1291)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1299 = _1201 + _1297;
        float _1301 = rsqrt(_1193);
        float _1303 = _1299 * _1295;
        float _1305 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1307 = _1303 * 0.15915493667125701904296875;
        float _1309 = _1307 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = _1307 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = fma(_1311, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1319 = _1301 * _1317;
        float _1321 = _1315 + (-1.0);
        float _1323 = fma(_1179, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1325 = fma(_1165, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1327 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = fma(_1269, _1315, _1327);
        _1293 = _1329;
        _1185 = _1323;
        _1287 = _1325;
    }
    float _1331 = _1293;
    float _1333 = _1185;
    float _1335 = _1287;
    float _1337 = -_1251;
    float _1339 = _1337 + _1331;
    float _1341 = -_1129;
    float _1343 = _1341 + _1333;
    float _1345 = -_1281;
    float _1347 = fma(_1279, _1021, _1345);
    float _1349 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1351 = _1339 * _1339;
    float _1353 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = -_1123;
    float _1357 = _1355 + _1335;
    float _1359 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = fma(_1343, _1343, _1351);
    float _1363 = _1353 * _1257;
    float _1365 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1367 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = fma(_1357, _1357, _1361);
    float _1371 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1365 * _1239;
    float _1375 = _1255 + 0.5;
    float _1377 = sqrt(_1369);
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1385 = _1253 + 0.5;
    float _1387 = _1277 + 0.5;
    float _1389 = _1347 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1371;
    out.m_61.y = _1379;
    out.m_61.z = _1381;
    out.m_61.w = _1383;
    bool _1391 = _1377 > 0.0;
    out.m_63.x = _1373;
    out.m_63.y = _1363;
    out.m_63.z = _1385;
    out.m_63.w = _1387;
    out.m_65.x = _1375;
    out.m_65.y = _1389;
    bool _1393 = !_1391;
    float _1395 = _1373;
    float _1397 = _1387;
    float _1399 = _1363;
    float _1401 = _1331;
    float _1403 = _1333;
    float _1405 = _1335;
    float _1407 = _1373;
    if (!_1393)
    {
        bool _1409 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1411 = _1385;
        if (_1409)
        {
            float _1413 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1411 = _1413;
        }
        float _1415 = _1411;
        if (_1409)
        {
            float _1417 = _464 * _1415;
            _1395 = _1417;
        }
        float _1419 = _1395;
        float _1421 = _1419;
        float _1423 = _1419;
        if (_1409)
        {
            float _1425 = _470 * _1415;
            _1397 = _1425;
        }
        float _1427 = _1397;
        float _1429 = _1427;
        if (_1409)
        {
            float _1431 = _472 * _1415;
            _1399 = _1431;
        }
        float _1433 = _1399;
        float _1435 = _1433;
        if (!_1409)
        {
            float _1437 = _122 + 1.0;
            float _1439 = _1437;
            if (!_166)
            {
                float _1441 = _1437 * _1437;
                float _1443 = _1441 * 0.5;
                _1421 = _1443;
            }
            float _1445 = _1421;
            float _1447 = _1445;
            if (!_166)
            {
                float _1449 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1447 = _1449;
            }
            float _1451 = _1447;
            bool _1453 = !_166;
            float _1455 = _1451;
            if (!_1453)
            {
                float _1457 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1459 = log2(_1457);
                float _1461 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1463 = _1459 * _1437;
                float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1467 = 1.0 + _1465;
                float _1469 = 1.0 / _1467;
                float _1471 = _1461 * 0.693147182464599609375;
                float _1473 = exp2(_1463);
                float _1475 = 1.0 / _1471;
                float _1477 = _1473 + (-1.0);
                float _1479 = -_1477;
                float _1481 = fma(_1479, _1475, _1437);
                float _1483 = _1481 * _1469;
                float _1485 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1455 = _1485;
            }
            float _1487 = _1455;
            float _1489 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1491 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1493 = !_166;
            if (!_1493)
            {
                float _1495 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1497 = log2(_1495);
                float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1501 = 1.0 + _1499;
                float _1503 = 1.0 / _1501;
                float _1505 = _1497 * _1437;
                float _1507 = exp2(_1505);
                float _1509 = -_1507;
                float _1511 = _1509 + 1.0;
                float _1513 = _1511 * _1503;
                _1439 = _1513;
            }
            float _1515 = _1439;
            float _1517 = fma(_1515, _174, _1491);
            float _1519 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1521 = fma(_1515, _172, _1489);
            float _1523 = -_412;
            float _1525 = _1523 + _1517;
            float _1527 = fma(_1515, _176, _1519);
            float _1529 = -_418;
            float _1531 = _1529 + _1521;
            float _1533 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1535 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1537 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1539 = -_420;
            float _1541 = _1539 + _1527;
            float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1533);
            float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1535);
            float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1537);
            float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1543);
            float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1545);
            float _1553 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1547);
            _480 = _1551;
            _482 = _1549;
            _484 = _1553;
            _1423 = _1549;
            _1429 = _1551;
            _1435 = _1553;
            _224 = _1545;
        }
        float _1555 = _480;
        float _1557 = _482;
        float _1559 = _484;
        float _1561 = _1423;
        float _1563 = _1429;
        float _1565 = _1435;
        float _1567 = _224;
        float _1569 = _1555 * _1555;
        float _1571 = fma(_1557, _1557, _1569);
        float _1573 = fma(_1559, _1559, _1571);
        float _1575 = rsqrt(_1369);
        float _1577 = sqrt(_1573);
        float _1579 = _1343 * _1575;
        float _1581 = _1339 * _1575;
        float _1583 = _1357 * _1575;
        bool _1585 = _1577 > 0.0;
        bool _1587 = !_1585;
        _226 = _1567;
        _1407 = _1561;
        if (!_1587)
        {
            float _1589 = rsqrt(_1573);
            float _1591 = _1589 * _1555;
            float _1593 = _1589 * _1557;
            float _1595 = _1589 * _1559;
            float _1597 = _1581 * _1591;
            float _1599 = fma(_1579, _1593, _1597);
            float _1601 = fma(_1583, _1595, _1599);
            float _1603 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1605 = fma(_1561, _1603, _1333);
            float _1607 = fma(_1563, _1603, _1331);
            float _1609 = fma(_1565, _1603, _1335);
            _1401 = _1607;
            _1403 = _1605;
            _1405 = _1609;
            _226 = _1597;
        }
    }
    float _1611 = _1401;
    float _1613 = _1403;
    float _1615 = _1405;
    float _1617 = _226;
    float _1619 = _1407;
    float _1621 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1623 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1625 = isnan(0.5);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1631 = _1627 || _1629;
    float _1633 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1621);
    float _1635 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1639 = isnan(0.5);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    float _1647 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1633);
    float _1649 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1651 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1635);
    float _1653 = 1.0 / _1649;
    float _1655 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1651);
    float _1657 = _1617;
    float _1659 = _1619;
    if (_1631)
    {
        _1657 = _1611;
    }
    float _1661 = _1657;
    float _1663 = _1661;
    if (_1645)
    {
        _1659 = 1.0;
    }
    float _1665 = _1659;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1669 = _1667 + _1649;
    float _1671 = _1669 * _1653;
    float _1673 = _1671 * 0.5;
    float _1675 = _1653;
    float _1677 = _1673;
    float _1679 = _1665;
    if (_1631)
    {
        _1675 = _1613;
    }
    float _1681 = _1675;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1685 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1683);
    float _1687 = _1681;
    float _1689 = _1685;
    if (_1631)
    {
        _1677 = _1615;
    }
    float _1691 = _1677;
    float _1693 = 1.0 / _1685;
    float _1695 = _1691;
    if (!_1631)
    {
        float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1699 = _1251 + _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1703 = _1129 + _1701;
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1707 = -_1123;
        float _1709 = _1707 + _1615;
        float _1711 = _1699 * _1699;
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1715 = _1123 + _1713;
        float _1717 = fma(_1703, _1703, _1711);
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1721 = fma(_1715, _1715, _1717);
        float _1723 = sqrt(_1721);
        float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1727 = precise::min(_1723, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1729 = _1727 * _1719;
        float _1731 = -_1129;
        float _1733 = _1731 + _1613;
        float _1735 = _1725 * _1729;
        float _1737 = -_1251;
        float _1739 = _1737 + _1611;
        float _1741 = fma(_1733, _1735, _1129);
        float _1743 = fma(_1739, _1735, _1251);
        float _1745 = fma(_1709, _1735, _1123);
        _1663 = _1743;
        _1687 = _1741;
        _1695 = _1745;
    }
    float _1747 = _1663;
    float _1749 = _1687;
    float _1751 = _1695;
    if (_1645)
    {
        _1689 = 1.0;
    }
    float _1753 = _1689;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1757 = _1693 * _1755;
    float _1759 = _1753;
    float _1761 = _1757;
    if (!_1645)
    {
        float _1763 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1765 = _1763 * 0.15915493667125701904296875;
        float _1767 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1769 = _1765 * 6.283185482025146484375;
        float _1771 = cos(_1769);
        float _1773 = _1767 * 0.15915493667125701904296875;
        float _1775 = _1765 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        float _1779 = 1.0 / _1771;
        float _1781 = _1773 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = _1773 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1793 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1791;
        float _1795 = _1783 * _1785;
        float _1797 = 1.0 / _1795;
        float _1799 = 1.0 / _1793;
        float _1801 = _1789 * _1797;
        float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1805 = fma(_1757, _1801, _1803);
        float _1807 = _1805 * _1799;
        float _1809 = precise::clamp(_1807, 0.0, 1.0);
        _1679 = _1809;
    }
    float _1811 = _1679;
    if (!_1645)
    {
        float _1813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1815 = _1813 * 0.15915493667125701904296875;
        float _1817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1819 = _1815 * 6.283185482025146484375;
        float _1821 = cos(_1819);
        float _1823 = _1817 * 0.15915493667125701904296875;
        float _1825 = _1815 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        float _1829 = 1.0 / _1821;
        float _1831 = _1823 * 6.283185482025146484375;
        float _1833 = cos(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = _1823 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        float _1841 = _1833 * _1835;
        float _1843 = 1.0 / _1841;
        float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1847 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1845;
        float _1849 = 1.0 / _1847;
        float _1851 = _1839 * _1843;
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1855 = fma(_1757, _1851, _1853);
        float _1857 = _1855 * _1849;
        float _1859 = precise::clamp(_1857, 0.0, 1.0);
        float _1861 = -_1859;
        float _1863 = _1861 + 1.0;
        _1759 = _1863;
    }
    float _1865 = _1759;
    float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1869 = _1747 + _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1873 = _1749 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1877 = _1751 + _1875;
    float _1879 = _1869 * _1869;
    float _1881 = fma(_1873, _1873, _1879);
    float _1883 = fma(_1877, _1877, _1881);
    float _1885 = rsqrt(_1883);
    float _1887 = sqrt(_1883);
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1891 = _1873 * _1889;
    float _1893 = _1877 * _1889;
    float _1895 = _1891 * _1891;
    float _1897 = _1893 * _1893;
    float _1899 = _1895 + _1897;
    float _1901 = sqrt(_1899);
    bool _1903 = _1901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = _1901 + _1905;
    float _1909 = _1881;
    float _1911 = _1907;
    float _1913 = _1869;
    float _1915 = _1889;
    float _1917 = _1891;
    if (_1903)
    {
        float _1919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1919;
    }
    float _1921 = _1909;
    float _1923 = _1921;
    if (_1903)
    {
        float _1925 = _1907 * _1921;
        _1911 = _1925;
    }
    float _1927 = _1911;
    if (_1903)
    {
        float _1929 = rsqrt(_1899);
        _1923 = _1929;
    }
    float _1931 = _1923;
    float _1933 = _1931;
    if (_1903)
    {
        float _1935 = _1927 * 0.15915493667125701904296875;
        _1761 = _1935;
    }
    float _1937 = _1761;
    float _1939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1941 = _1885;
    if (_1903)
    {
        float _1943 = _1937 * 6.283185482025146484375;
        float _1945 = sin(_1943);
        _1941 = _1945;
    }
    float _1947 = _1941;
    float _1949 = precise::max(0.0, _1939);
    float _1951 = _1877;
    float _1953 = _1949;
    if (_1903)
    {
        float _1955 = _1937 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        _1951 = _1957;
    }
    float _1959 = _1951;
    float _1961 = -_1889;
    float _1963 = -_1949;
    float _1965 = fma(_1869, _1961, _1963);
    if (_1903)
    {
        float _1967 = _1965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1913 = _1967;
    }
    float _1969 = _1913;
    float _1971 = _1947;
    float _1973 = _1969;
    if (_1903)
    {
        float _1975 = fma(_1947, _1969, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = _1977;
    if (!_1903)
    {
        _1973 = _1895;
    }
    float _1981 = _1973;
    float _1983 = _1981;
    if (_1903)
    {
        float _1985 = _1931 * _1977;
        _1915 = _1985;
    }
    float _1987 = _1915;
    if (!_1903)
    {
        _1979 = _1965;
    }
    float _1989 = _1979;
    float _1991 = _1989;
    float _1993 = _1959;
    if (_1903)
    {
        float _1995 = _1959 + (-1.0);
        _1953 = _1995;
    }
    float _1997 = _1953;
    float _1999 = _1997;
    if (_1903)
    {
        float _2001 = _1891 * _1987;
        _1917 = _2001;
    }
    float _2003 = _1917;
    float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2007 = fma(_1887, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    if (_1903)
    {
        float _2011 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1933 = _2011;
    }
    float _2013 = _1933;
    if (!_1903)
    {
        _1999 = _1893;
    }
    float _2015 = _1999;
    float _2017 = _2015;
    if (_1903)
    {
        float _2019 = _1893 * _1987;
        _2017 = _2019;
    }
    float _2021 = _2017;
    if (_1903)
    {
        float _2023 = _2003 * _2003;
        _1983 = _2023;
    }
    float _2025 = _1983;
    if (_1903)
    {
        float _2027 = fma(_1965, _1959, _2013);
        _1991 = _2027;
    }
    float _2029 = _1991;
    if (!_1903)
    {
        _1993 = _1897;
    }
    float _2031 = _1993;
    float _2033 = _2031;
    if (_1903)
    {
        float _2035 = _2021 * _2021;
        _2033 = _2035;
    }
    float _2037 = _2033;
    float _2039 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2041 = fma(_2029, _2029, _2025);
    float _2043 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2045 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2047 = -_2009;
    float _2049 = _2047 + 1.0;
    float _2051 = _2041 + _2037;
    float _2053 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2043);
    float _2055 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2057 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2045);
    float _2061 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2053);
    float _2063 = rsqrt(_2051);
    float _2065 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2055);
    float _2067 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2057);
    float _2069 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2071 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2059);
    float _2073 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2075 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2077 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2079 = abs(_2049);
    float _2081 = log2(_2079);
    float _2083 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2085 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2087 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2089 = -_2077;
    float _2091 = fma(_2089, _2039, 1.0);
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2095 = _2063 * _2003;
    float _2097 = _2063 * _2029;
    float _2099 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    float _2101 = _2063 * _2021;
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2105 = log2(_2091);
    float _2107 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2099);
    float _2109 = -_2103;
    float _2111 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2109);
    float _2113 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2115 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2107);
    float _2117 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2119 = -_2101;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2111);
    float _2123 = exp2(_2113);
    float _2125 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2127 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2117);
    float _2129 = fma(_2121, -0.5, 0.5);
    float _2131 = fma(_2121, 0.5, 0.5);
    float _2133 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2125);
    float _2135 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2137 = _2097 + 1.0;
    float _2139 = 1.0 / _2115;
    float _2141 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2133);
    float _2143 = fma(_2131, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2145 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2135);
    float _2147 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2141);
    float _2149 = fma(_2131, _2143, -0.212114393711090087890625);
    float _2151 = _2105 * 0.693147182464599609375;
    float _2153 = sqrt(_2129);
    float _2155 = -_2097;
    float _2157 = fma(_2123, _2137, _2155);
    float _2159 = fma(_2131, _2149, 1.570728778839111328125);
    float _2161 = fma(_2157, 0.5, 0.5);
    float _2163 = _2145 * _2139;
    float _2165 = _2147 * _2139;
    float _2167 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2169 = fma(_2163, 0.5, 0.5);
    float _2171 = fma(_2165, -0.5, 0.5);
    float _2173 = _2153 * 0.636619746685028076171875;
    float3 _5639 = float3(_2169, _2171, _2167);
    float _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5639, float3(0.0), isnan(_5639)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5639, float3(0.0), isnan(_5639)), level(0.0)).x;
    float3 _5650 = float3(_2169, _2171, _2167);
    float4 _2178 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5650, float3(0.0), isnan(_5650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5650, float3(0.0), isnan(_5650)), level(0.0)).xyzw;
    float _2180 = _2178.x;
    float _2182 = _2178.y;
    float _2184 = _2178.z;
    float _2186 = _2178.w;
    float _2188 = -_2159;
    float _2190 = fma(_2173, _2188, 1.0);
    float2 _5672 = float2(_2190, _2161);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5672, float2(0.0), isnan(_5672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5672, float2(0.0), isnan(_5672)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    float _2202 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2204 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2206 = _1811 * _1865;
    bool _2208 = _1811 > 0.0;
    bool _2210 = isnan(_1811);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan(0.0);
    bool _2216 = _2212 || _2214;
    float _2218 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2204);
    float _2220 = exp2(_2202);
    float _2222 = _2206 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2224 = _1865 <= 0.0;
    bool _2226 = !_2216;
    bool _2228 = _2224 || _2226;
    float _2230 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2232 = _476 * _2222;
    float _2234 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2230);
    float _2236 = _2232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = _2234 + _2115;
    out.gl_Position.x = _2145;
    out.gl_Position.y = _2147;
    out.gl_Position.z = _2234;
    out.gl_Position.w = _2115;
    float _2240 = _2238 * 0.5;
    float _2242 = -_2220;
    float _2244 = _2242 + 1.0;
    out.m_45.x = _2236;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2240;
    out.m_67.w = _2115;
    float _2248 = _2246 * _2175;
    float _2250 = -_2246;
    float _2252 = _2250 + 1.0;
    float _2254 = _2186 * _2248;
    float _2256 = _2200 * _2248;
    float _2258 = fma(_2196, _2254, _2180);
    float _2260 = fma(_2198, _2254, _2182);
    float _2262 = _2186 * _2252;
    float _2264 = fma(_2186, _2256, _2184);
    out.m_69.x = _2258;
    out.m_69.y = _2260;
    out.m_69.z = _2264;
    out.m_69.w = _2262;
    if (!_2228)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2266;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _785 = false;
    bool _638 = false;
    bool _502 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2323 = as_type<float>(_104);
        out.gl_Position.z = _2323;
    }
    if (!_92)
    {
        return out;
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2392 = as_type<float>(_140);
        out.gl_Position.z = _2392;
    }
    if (_132)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_51.w;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_42.x;
    float _154 = in.m_42.y;
    float _156 = in.m_42.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = _146 * _144;
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = _170 * 6.283185482025146484375;
    float _180 = floor(_170);
    float _182 = _178 * 0.15915493667125701904296875;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _182 * 6.283185482025146484375;
    float _190 = cos(_188);
    float _192 = -_180;
    float _194 = _170 + _192;
    float _196 = _180;
    float _198 = _150;
    if (!_166)
    {
        float _200 = _150 * _150;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    bool _206 = _194 < 0.5;
    float _208 = float(_206);
    float _210 = _204;
    if (!_166)
    {
        float _212 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_166;
    float _218 = _214;
    float _220 = _152;
    float _222 = _154;
    float _224 = _176;
    float _226 = _176;
    if (!_216)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = _150 * _230;
        float _240 = 1.0 / _234;
        float _242 = _236 * 0.693147182464599609375;
        float _244 = exp2(_238);
        float _246 = 1.0 / _242;
        float _248 = _244 + (-1.0);
        float _250 = -_248;
        float _252 = fma(_250, _246, _150);
        float _254 = _252 * _240;
        float _256 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _256;
    }
    float _258 = _218;
    bool _260 = !_166;
    if (!_260)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = 1.0 / _268;
        float _272 = _150 * _264;
        float _274 = exp2(_272);
        float _276 = -_274;
        float _278 = _276 + 1.0;
        float _280 = _278 * _270;
        _198 = _280;
    }
    float _282 = _198;
    float _284 = -_194;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = fma(_190, 0.5, 0.5);
    float _290 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _294 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = -_208;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _300 = -_288;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = fma(_282, _172, _290);
    float _306 = fma(_282, _174, _292);
    float _308 = fma(_282, _176, _294);
    float _310 = _292;
    if (!_166)
    {
        float _312 = _122 * _122;
        float _314 = _312 * 0.5;
        _310 = _314;
    }
    float _316 = _310;
    float _318 = fma(_304, _148, _152);
    float _320 = fma(_306, _148, _154);
    float _322 = fma(_308, _148, _156);
    if (!_166)
    {
        float _324 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _324;
    }
    float _326 = _220;
    float _328 = _326;
    if (!_166)
    {
        _222 = _122;
    }
    float _330 = _222;
    bool _332 = !_166;
    float _334 = _330;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _122 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _122);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _364;
    }
    float _366 = _328;
    bool _368 = !_166;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _122 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _334 = _388;
    }
    float _390 = _334;
    bool _392 = !_186;
    int _394 = _392 ? 0 : 1;
    float _396 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _400 = _398 != 0;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _404 = _402 != 0;
    float _406 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _408 = abs(_394);
    float _410 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _412 = fma(_390, _174, _396);
    bool _414 = !_400;
    int _416 = _414 ? 0 : 1;
    float _418 = fma(_390, _172, _406);
    float _420 = fma(_390, _176, _410);
    float _422 = -_412;
    float _424 = _306 + _422;
    bool _426 = !_404;
    int _428 = _426 ? 0 : 1;
    int _430 = abs(_416);
    float _432 = -_418;
    float _434 = _304 + _432;
    float _436 = _424 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _438 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _442 = _424 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _444 = abs(_428);
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].x, _436);
    float _448 = float(_430);
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].x, _438);
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _454 = float(_408);
    float _456 = -_420;
    float _458 = _308 + _456;
    float _460 = abs(_286);
    float _462 = _448 * _460;
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _466 = float(_444);
    float _468 = fma(_454, _302, _462);
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
    float _472 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[6].z, _452);
    float _474 = abs(_298);
    float _476 = fma(_466, _474, _468);
    bool _478 = !_440;
    float _480 = _470;
    float _482 = _464;
    float _484 = _472;
    float _500;
    if (!_478)
    {
        float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _488 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _490 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _492 = _490 * _486;
        float _494 = floor(_492);
        float _496 = -_494;
        float _498 = _492 + _496;
        _500 = _498;
        _502 = true;
    }
    else
    {
        float _504 = float(_88);
        float _506 = 1.0 / _504;
        float _508 = _122 * _506;
        _500 = _508;
    }
    _502 = false;
    float _510 = _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _514 = _510 + _512;
    float _516 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _518 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _520 = isnan(_510);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _530;
    bool _534 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _536 = isnan(_510);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = _516 * _142;
    float _548 = 1.0 / _532;
    float _550 = -_544;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = _528 * _552;
    float _562 = -_528;
    float _564 = _562 + 1.0;
    float _566 = trunc(_546);
    int _568 = int(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _574;
    float _578 = _514 * _548;
    float _580 = in.m_51.x;
    float _582 = in.m_51.y;
    float _584 = in.m_51.z;
    float _586 = fma(_556, _578, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _588 = fma(_572, _578, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _590 = fma(_576, _578, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _592 = _586 * _560;
    float _594 = _588 * _560;
    float _596 = _590 * _560;
    int _598 = _568 << 4;
    int _600 = _598 + 1712;
    float _602 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _604 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _606 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _608 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].x, _602);
    float _610 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].y, _604);
    float _612 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].z, _606);
    float _614 = _610 * _582;
    float _616 = _608 * _580;
    float _618 = _612 * _584;
    bool _620 = !_558;
    float _636;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _624 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_88);
        float _642 = 1.0 / _640;
        float _644 = _122 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    uint _649 = uint(int(uint(_600) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[int(_659)][_661];
    bool _665 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_646);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    int _683 = _600 + 8;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[int(_687)][_689];
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = 1.0 / _679;
    float _699 = -_675;
    float _701 = _699 + 1.0;
    float _703 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _705 = _703 * _142;
    float _707 = _695 * _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _646 + _709;
    bool _713 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _715 = isnan(_646);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = trunc(_705);
    int _727 = int(_725);
    float _729 = fma(_707, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _731 = _723 * _701;
    float _733 = -_723;
    float _735 = _733 + 1.0;
    float _737 = _729 * _731;
    float _739 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[115].x, _737);
    float _741 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[116].x, _739);
    int _743 = _727 << 4;
    int _745 = _743 + 1968;
    float _747 = _655 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _749 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _751 = _741 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _753 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _753;
    out.m_53.y = _755;
    out.m_53.z = _759;
    out.m_53.w = _751;
    bool _761 = !_681;
    int _763 = as_type<int>(_753);
    bool _765 = _681;
    float _767 = _751;
    float _783;
    if (!_761)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _771 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _763 = as_type<int>(_775);
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_88);
        float _789 = 1.0 / _787;
        float _791 = _122 * _789;
        _783 = _791;
    }
    _785 = false;
    int _793 = _763;
    float _795 = _783;
    float _797 = in.m_55.x;
    float _799 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _801 = in.m_55.y;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    float _807 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _811 = _809 != 0;
    float _813 = in.m_49.z;
    float _815 = in.m_49.w;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _819 = _817 != 0;
    float _821 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _825 = _823 != 0;
    float _827 = in.m_49.y;
    float _829 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _807);
    float _831 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _833 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _835 = _793;
    if (_805)
    {
        bool _837 = _142 > 0.5;
        _765 = _837;
    }
    bool _839 = _765;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    if (_805)
    {
        float _847 = -_797;
        float _849 = _847 + 1.0;
        _835 = as_type<int>(_849);
    }
    int _851 = _835;
    if (!_805)
    {
        _767 = _797;
    }
    float _853 = _767;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _857 = 1.0 / _845;
    float _859 = -_801;
    float _861 = _859 + 1.0;
    float _863 = _853;
    float _865 = _801;
    if (_805)
    {
        float _867 = _839 ? as_type<float>(_851) : _797;
        _863 = _867;
    }
    float _869 = _863;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _873 = in.m_57.x;
    float _875 = in.m_57.y;
    float _877 = in.m_57.z;
    bool _879 = _813 > 0.5;
    float _881 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].z, _855);
    bool _883 = _815 > 0.5;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _887 = _827 > 0.5;
    int _889 = _879 ? as_type<int>(_861) : as_type<int>(_801);
    int _891 = _887 ? as_type<int>(_861) : as_type<int>(_801);
    float _893 = _819 ? as_type<float>(_889) : _801;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _897 = _895 != 0;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    float _903 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _799);
    float _905 = _825 ? as_type<float>(_891) : _801;
    float _907 = _799;
    bool _909 = _883;
    float _911 = _893;
    float _913 = _827;
    if (_811)
    {
        float _915 = in.m_49.z;
        _907 = _915;
    }
    float _917 = _907;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _921 = _919 != 0;
    float _923 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _821);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _929 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _875);
    float _933 = 1.0 / _927;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _873);
    float _937 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _939 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _829);
    float _941 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _877);
    if (_901)
    {
        float _945 = _883 ? _861 : _801;
        _865 = _945;
    }
    float _947 = _865;
    float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _951 = _833 * _931;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _961 = _831 * _943;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _965 = _795 + _963;
    float _967 = _955 * _857;
    float _969 = _959 * _933;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _973 = _795 + _971;
    int _975 = as_type<int>(_961);
    if (_811)
    {
        bool _977 = _917 > 0.5;
        _909 = _977;
    }
    bool _979 = _909;
    float _981 = _937 * _935;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _985 = fma(_967, _973, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _987 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _989 = isnan(_795);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_969, _965, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1001 = _949 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1003 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1005 = isnan(_795);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1017 = -_997;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_893, _1001, -0.5);
    bool _1023 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1025 = isnan(_795);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1031 = _1027 || _1029;
    int _1033 = _1031 ? 1065353216 : 0;
    float _1035 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1037 = _1013 * _1019;
    float _1039 = _1015;
    int _1041 = _1033;
    float _1043 = _1035;
    if (_921)
    {
        _911 = _142;
    }
    float _1045 = _911;
    float _1047 = -_1013;
    float _1049 = _1047 + 1.0;
    float _1051 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = _1045;
    if (!_921)
    {
        _1053 = _813;
    }
    float _1055 = _1053;
    float _1057 = _983 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1059 = as_type<float>(_1033) * _1049;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1063 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1065 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1067 = fma(_1057, _947, -0.5);
    float _1069 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1015);
    float _1071 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1035);
    float _1073 = -_1061;
    float _1075 = fma(_1065, 2.0, _1073);
    float _1077 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1079 = _1057;
    float _1081 = _1071;
    float _1083 = _1077;
    if (!_921)
    {
        _1039 = _827;
    }
    float _1085 = _1039;
    float _1087 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1063);
    float _1089 = _1085;
    if (_921)
    {
        _1089 = _142;
    }
    float _1091 = _1089;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1095 = _985 * _1059;
    float _1097 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1099 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1071);
    float _1101 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1077);
    float _1103 = -as_type<float>(_1033);
    float _1105 = _1103 + 1.0;
    if (_811)
    {
        float _1107 = -_797;
        float _1109 = _1107 + 1.0;
        _975 = as_type<int>(_1109);
    }
    int _1111 = _975;
    if (_897)
    {
        float _1113 = -_797;
        float _1115 = _1113 + 1.0;
        _1041 = as_type<int>(_1115);
    }
    int _1117 = _1041;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1093);
    float _1121 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1123 = _941 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1125 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_811)
    {
        _1079 = _797;
    }
    float _1127 = _1079;
    float _1129 = _939 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1131 = _1127;
    if (!_897)
    {
        _1081 = _797;
    }
    float _1133 = _1081;
    float _1135 = _1123 + _1125;
    float _1137 = _1133;
    if (_811)
    {
        float _1139 = _979 ? as_type<float>(_1111) : _797;
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1095);
    if (_897)
    {
        float _1145 = _887 ? as_type<float>(_1117) : _797;
        _1137 = _1145;
    }
    float _1147 = _1137;
    float _1149 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_921)
    {
        _1083 = _813;
    }
    float _1151 = _1083;
    float _1153 = fma(_999, _1037, _1143);
    float _1155 = _1151;
    float _1157 = _1153;
    if (!_921)
    {
        _1043 = _813;
    }
    float _1159 = _1043;
    float _1161 = _1129 + _1149;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1165 = _1135 + _1163;
    int _1167 = _745 + 8;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    uint _1171 = uint(int(uint(int(_1169)) >> uint(2)));
    int _1173 = int(_1169) & 3;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[int(_1171)][_1173];
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1161 + _1177;
    float _1181 = _1165 * _1165;
    float _1183 = _1159;
    float _1185 = _1161;
    if (_921)
    {
        _1183 = _827;
    }
    float _1187 = _1183;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_921)
    {
        _1155 = _827;
    }
    float _1191 = _1155;
    float _1193 = fma(_1179, _1179, _1181);
    if (!_921)
    {
        _913 = _142;
    }
    float _1195 = _913;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[83].w, _871);
    float _1199 = _841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1201 = sqrt(_1193);
    float _1203 = _885 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1205 = -_1189;
    float _1207 = fma(_1121, 2.0, _1205);
    float _1209 = fma(_1199, _1141, -0.5);
    float _1211 = fma(_1203, _1147, -0.5);
    uint _1213 = uint(int(uint(_745) >> uint(2)));
    uint _1215 = uint(int(uint(int(_1213)) >> uint(2)));
    int _1217 = int(_1213) & 3;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[int(_1215)][_1217];
    int _1221 = int(_1213) + 1;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    int _1225 = _1221 & 3;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[int(_1223)][_1225];
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1231 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1233 = -_122;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1207);
    float _1237 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _881);
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1241 = fma(_1231, -2.0, _1229);
    float _1243 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1119);
    float _1245 = -_122;
    float _1247 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1075);
    bool _1249 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1253 = fma(_1243, _1209, _1235);
    float _1255 = fma(_1237, _1211, _1247);
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1259 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1261 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1265 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1197);
    float _1267 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1241);
    float _1269 = _1251 + _1261;
    float _1271 = fma(_1259, -2.0, _1263);
    float _1273 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1153);
    float _1275 = -_1267;
    float _1277 = fma(_1265, _1067, _1275);
    float _1279 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1069);
    float _1281 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1271);
    float _1283 = _1261;
    if (!_1249)
    {
        _1157 = _1135;
    }
    float _1285 = _1157;
    float _1287 = _1285;
    if (!_1249)
    {
        _1283 = _1269;
    }
    float _1289 = _1283;
    bool _1291 = !_1249;
    float _1293 = _1289;
    if (!_1291)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1299 = _1201 + _1297;
        float _1301 = rsqrt(_1193);
        float _1303 = _1299 * _1295;
        float _1305 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1307 = _1303 * 0.15915493667125701904296875;
        float _1309 = _1307 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = _1307 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = fma(_1311, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1319 = _1301 * _1317;
        float _1321 = _1315 + (-1.0);
        float _1323 = fma(_1179, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1325 = fma(_1165, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1327 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = fma(_1269, _1315, _1327);
        _1293 = _1329;
        _1185 = _1323;
        _1287 = _1325;
    }
    float _1331 = _1293;
    float _1333 = _1185;
    float _1335 = _1287;
    float _1337 = -_1251;
    float _1339 = _1337 + _1331;
    float _1341 = -_1129;
    float _1343 = _1341 + _1333;
    float _1345 = -_1281;
    float _1347 = fma(_1279, _1021, _1345);
    float _1349 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1351 = _1339 * _1339;
    float _1353 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = -_1123;
    float _1357 = _1355 + _1335;
    float _1359 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = fma(_1343, _1343, _1351);
    float _1363 = _1353 * _1257;
    float _1365 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1367 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = fma(_1357, _1357, _1361);
    float _1371 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1365 * _1239;
    float _1375 = _1255 + 0.5;
    float _1377 = sqrt(_1369);
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1385 = _1253 + 0.5;
    float _1387 = _1277 + 0.5;
    float _1389 = _1347 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1371;
    out.m_61.y = _1379;
    out.m_61.z = _1381;
    out.m_61.w = _1383;
    bool _1391 = _1377 > 0.0;
    out.m_63.x = _1373;
    out.m_63.y = _1363;
    out.m_63.z = _1385;
    out.m_63.w = _1387;
    out.m_65.x = _1375;
    out.m_65.y = _1389;
    bool _1393 = !_1391;
    float _1395 = _1373;
    float _1397 = _1387;
    float _1399 = _1363;
    float _1401 = _1331;
    float _1403 = _1333;
    float _1405 = _1335;
    float _1407 = _1373;
    if (!_1393)
    {
        bool _1409 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1411 = _1385;
        if (_1409)
        {
            float _1413 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1411 = _1413;
        }
        float _1415 = _1411;
        if (_1409)
        {
            float _1417 = _464 * _1415;
            _1395 = _1417;
        }
        float _1419 = _1395;
        float _1421 = _1419;
        float _1423 = _1419;
        if (_1409)
        {
            float _1425 = _470 * _1415;
            _1397 = _1425;
        }
        float _1427 = _1397;
        float _1429 = _1427;
        if (_1409)
        {
            float _1431 = _472 * _1415;
            _1399 = _1431;
        }
        float _1433 = _1399;
        float _1435 = _1433;
        if (!_1409)
        {
            float _1437 = _122 + 1.0;
            float _1439 = _1437;
            if (!_166)
            {
                float _1441 = _1437 * _1437;
                float _1443 = _1441 * 0.5;
                _1421 = _1443;
            }
            float _1445 = _1421;
            float _1447 = _1445;
            if (!_166)
            {
                float _1449 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1447 = _1449;
            }
            float _1451 = _1447;
            bool _1453 = !_166;
            float _1455 = _1451;
            if (!_1453)
            {
                float _1457 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1459 = log2(_1457);
                float _1461 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1463 = _1459 * _1437;
                float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1467 = 1.0 + _1465;
                float _1469 = 1.0 / _1467;
                float _1471 = _1461 * 0.693147182464599609375;
                float _1473 = exp2(_1463);
                float _1475 = 1.0 / _1471;
                float _1477 = _1473 + (-1.0);
                float _1479 = -_1477;
                float _1481 = fma(_1479, _1475, _1437);
                float _1483 = _1481 * _1469;
                float _1485 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1455 = _1485;
            }
            float _1487 = _1455;
            float _1489 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1491 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1493 = !_166;
            if (!_1493)
            {
                float _1495 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1497 = log2(_1495);
                float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1501 = 1.0 + _1499;
                float _1503 = 1.0 / _1501;
                float _1505 = _1497 * _1437;
                float _1507 = exp2(_1505);
                float _1509 = -_1507;
                float _1511 = _1509 + 1.0;
                float _1513 = _1511 * _1503;
                _1439 = _1513;
            }
            float _1515 = _1439;
            float _1517 = fma(_1515, _174, _1491);
            float _1519 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1521 = fma(_1515, _172, _1489);
            float _1523 = -_412;
            float _1525 = _1523 + _1517;
            float _1527 = fma(_1515, _176, _1519);
            float _1529 = -_418;
            float _1531 = _1529 + _1521;
            float _1533 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1535 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1537 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1539 = -_420;
            float _1541 = _1539 + _1527;
            float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1533);
            float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1535);
            float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1537);
            float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1543);
            float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1545);
            float _1553 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1547);
            _480 = _1551;
            _482 = _1549;
            _484 = _1553;
            _1423 = _1549;
            _1429 = _1551;
            _1435 = _1553;
            _224 = _1545;
        }
        float _1555 = _480;
        float _1557 = _482;
        float _1559 = _484;
        float _1561 = _1423;
        float _1563 = _1429;
        float _1565 = _1435;
        float _1567 = _224;
        float _1569 = _1555 * _1555;
        float _1571 = fma(_1557, _1557, _1569);
        float _1573 = fma(_1559, _1559, _1571);
        float _1575 = rsqrt(_1369);
        float _1577 = sqrt(_1573);
        float _1579 = _1343 * _1575;
        float _1581 = _1339 * _1575;
        float _1583 = _1357 * _1575;
        bool _1585 = _1577 > 0.0;
        bool _1587 = !_1585;
        _226 = _1567;
        _1407 = _1561;
        if (!_1587)
        {
            float _1589 = rsqrt(_1573);
            float _1591 = _1589 * _1555;
            float _1593 = _1589 * _1557;
            float _1595 = _1589 * _1559;
            float _1597 = _1581 * _1591;
            float _1599 = fma(_1579, _1593, _1597);
            float _1601 = fma(_1583, _1595, _1599);
            float _1603 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1605 = fma(_1561, _1603, _1333);
            float _1607 = fma(_1563, _1603, _1331);
            float _1609 = fma(_1565, _1603, _1335);
            _1401 = _1607;
            _1403 = _1605;
            _1405 = _1609;
            _226 = _1597;
        }
    }
    float _1611 = _1401;
    float _1613 = _1403;
    float _1615 = _1405;
    float _1617 = _226;
    float _1619 = _1407;
    float _1621 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1623 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1625 = isnan(0.5);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1631 = _1627 || _1629;
    float _1633 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1621);
    float _1635 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1639 = isnan(0.5);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    float _1647 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1633);
    float _1649 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1651 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1635);
    float _1653 = 1.0 / _1649;
    float _1655 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1651);
    float _1657 = _1617;
    float _1659 = _1619;
    if (_1631)
    {
        _1657 = _1611;
    }
    float _1661 = _1657;
    float _1663 = _1661;
    if (_1645)
    {
        _1659 = 1.0;
    }
    float _1665 = _1659;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1669 = _1667 + _1649;
    float _1671 = _1669 * _1653;
    float _1673 = _1671 * 0.5;
    float _1675 = _1653;
    float _1677 = _1673;
    float _1679 = _1665;
    if (_1631)
    {
        _1675 = _1613;
    }
    float _1681 = _1675;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1685 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1683);
    float _1687 = _1681;
    float _1689 = _1685;
    if (_1631)
    {
        _1677 = _1615;
    }
    float _1691 = _1677;
    float _1693 = 1.0 / _1685;
    float _1695 = _1691;
    if (!_1631)
    {
        float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1699 = _1251 + _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1703 = _1129 + _1701;
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1707 = -_1123;
        float _1709 = _1707 + _1615;
        float _1711 = _1699 * _1699;
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1715 = _1123 + _1713;
        float _1717 = fma(_1703, _1703, _1711);
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1721 = fma(_1715, _1715, _1717);
        float _1723 = sqrt(_1721);
        float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1727 = precise::min(_1723, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1729 = _1727 * _1719;
        float _1731 = -_1129;
        float _1733 = _1731 + _1613;
        float _1735 = _1725 * _1729;
        float _1737 = -_1251;
        float _1739 = _1737 + _1611;
        float _1741 = fma(_1733, _1735, _1129);
        float _1743 = fma(_1739, _1735, _1251);
        float _1745 = fma(_1709, _1735, _1123);
        _1663 = _1743;
        _1687 = _1741;
        _1695 = _1745;
    }
    float _1747 = _1663;
    float _1749 = _1687;
    float _1751 = _1695;
    if (_1645)
    {
        _1689 = 1.0;
    }
    float _1753 = _1689;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1757 = _1693 * _1755;
    float _1759 = _1753;
    float _1761 = _1757;
    if (!_1645)
    {
        float _1763 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1765 = _1763 * 0.15915493667125701904296875;
        float _1767 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1769 = _1765 * 6.283185482025146484375;
        float _1771 = cos(_1769);
        float _1773 = _1767 * 0.15915493667125701904296875;
        float _1775 = _1765 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        float _1779 = 1.0 / _1771;
        float _1781 = _1773 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = _1773 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1793 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1791;
        float _1795 = _1783 * _1785;
        float _1797 = 1.0 / _1795;
        float _1799 = 1.0 / _1793;
        float _1801 = _1789 * _1797;
        float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1805 = fma(_1757, _1801, _1803);
        float _1807 = _1805 * _1799;
        float _1809 = precise::clamp(_1807, 0.0, 1.0);
        _1679 = _1809;
    }
    float _1811 = _1679;
    if (!_1645)
    {
        float _1813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1815 = _1813 * 0.15915493667125701904296875;
        float _1817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1819 = _1815 * 6.283185482025146484375;
        float _1821 = cos(_1819);
        float _1823 = _1817 * 0.15915493667125701904296875;
        float _1825 = _1815 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        float _1829 = 1.0 / _1821;
        float _1831 = _1823 * 6.283185482025146484375;
        float _1833 = cos(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = _1823 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        float _1841 = _1833 * _1835;
        float _1843 = 1.0 / _1841;
        float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1847 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1845;
        float _1849 = 1.0 / _1847;
        float _1851 = _1839 * _1843;
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1855 = fma(_1757, _1851, _1853);
        float _1857 = _1855 * _1849;
        float _1859 = precise::clamp(_1857, 0.0, 1.0);
        float _1861 = -_1859;
        float _1863 = _1861 + 1.0;
        _1759 = _1863;
    }
    float _1865 = _1759;
    float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1869 = _1747 + _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1873 = _1749 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1877 = _1751 + _1875;
    float _1879 = _1869 * _1869;
    float _1881 = fma(_1873, _1873, _1879);
    float _1883 = fma(_1877, _1877, _1881);
    float _1885 = rsqrt(_1883);
    float _1887 = sqrt(_1883);
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1891 = _1873 * _1889;
    float _1893 = _1877 * _1889;
    float _1895 = _1891 * _1891;
    float _1897 = _1893 * _1893;
    float _1899 = _1895 + _1897;
    float _1901 = sqrt(_1899);
    bool _1903 = _1901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = _1901 + _1905;
    float _1909 = _1881;
    float _1911 = _1907;
    float _1913 = _1869;
    float _1915 = _1889;
    float _1917 = _1891;
    if (_1903)
    {
        float _1919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1919;
    }
    float _1921 = _1909;
    float _1923 = _1921;
    if (_1903)
    {
        float _1925 = _1907 * _1921;
        _1911 = _1925;
    }
    float _1927 = _1911;
    if (_1903)
    {
        float _1929 = rsqrt(_1899);
        _1923 = _1929;
    }
    float _1931 = _1923;
    float _1933 = _1931;
    if (_1903)
    {
        float _1935 = _1927 * 0.15915493667125701904296875;
        _1761 = _1935;
    }
    float _1937 = _1761;
    float _1939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1941 = _1885;
    if (_1903)
    {
        float _1943 = _1937 * 6.283185482025146484375;
        float _1945 = sin(_1943);
        _1941 = _1945;
    }
    float _1947 = _1941;
    float _1949 = precise::max(0.0, _1939);
    float _1951 = _1877;
    float _1953 = _1949;
    if (_1903)
    {
        float _1955 = _1937 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        _1951 = _1957;
    }
    float _1959 = _1951;
    float _1961 = -_1889;
    float _1963 = -_1949;
    float _1965 = fma(_1869, _1961, _1963);
    if (_1903)
    {
        float _1967 = _1965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1913 = _1967;
    }
    float _1969 = _1913;
    float _1971 = _1947;
    float _1973 = _1969;
    if (_1903)
    {
        float _1975 = fma(_1947, _1969, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = _1977;
    if (!_1903)
    {
        _1973 = _1895;
    }
    float _1981 = _1973;
    float _1983 = _1981;
    if (_1903)
    {
        float _1985 = _1931 * _1977;
        _1915 = _1985;
    }
    float _1987 = _1915;
    if (!_1903)
    {
        _1979 = _1965;
    }
    float _1989 = _1979;
    float _1991 = _1989;
    float _1993 = _1959;
    if (_1903)
    {
        float _1995 = _1959 + (-1.0);
        _1953 = _1995;
    }
    float _1997 = _1953;
    float _1999 = _1997;
    if (_1903)
    {
        float _2001 = _1891 * _1987;
        _1917 = _2001;
    }
    float _2003 = _1917;
    float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2007 = fma(_1887, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    if (_1903)
    {
        float _2011 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1933 = _2011;
    }
    float _2013 = _1933;
    if (!_1903)
    {
        _1999 = _1893;
    }
    float _2015 = _1999;
    float _2017 = _2015;
    if (_1903)
    {
        float _2019 = _1893 * _1987;
        _2017 = _2019;
    }
    float _2021 = _2017;
    if (_1903)
    {
        float _2023 = _2003 * _2003;
        _1983 = _2023;
    }
    float _2025 = _1983;
    if (_1903)
    {
        float _2027 = fma(_1965, _1959, _2013);
        _1991 = _2027;
    }
    float _2029 = _1991;
    if (!_1903)
    {
        _1993 = _1897;
    }
    float _2031 = _1993;
    float _2033 = _2031;
    if (_1903)
    {
        float _2035 = _2021 * _2021;
        _2033 = _2035;
    }
    float _2037 = _2033;
    float _2039 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2041 = fma(_2029, _2029, _2025);
    float _2043 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2045 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2047 = -_2009;
    float _2049 = _2047 + 1.0;
    float _2051 = _2041 + _2037;
    float _2053 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2043);
    float _2055 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2057 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2045);
    float _2061 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2053);
    float _2063 = rsqrt(_2051);
    float _2065 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2055);
    float _2067 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2057);
    float _2069 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2071 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2059);
    float _2073 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2075 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2077 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2079 = abs(_2049);
    float _2081 = log2(_2079);
    float _2083 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2085 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2087 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2089 = -_2077;
    float _2091 = fma(_2089, _2039, 1.0);
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2095 = _2063 * _2003;
    float _2097 = _2063 * _2029;
    float _2099 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    float _2101 = _2063 * _2021;
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2105 = log2(_2091);
    float _2107 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2099);
    float _2109 = -_2103;
    float _2111 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2109);
    float _2113 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2115 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2107);
    float _2117 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2119 = -_2101;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2111);
    float _2123 = exp2(_2113);
    float _2125 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2127 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2117);
    float _2129 = fma(_2121, -0.5, 0.5);
    float _2131 = fma(_2121, 0.5, 0.5);
    float _2133 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2125);
    float _2135 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2137 = _2097 + 1.0;
    float _2139 = 1.0 / _2115;
    float _2141 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2133);
    float _2143 = fma(_2131, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2145 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2135);
    float _2147 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2141);
    float _2149 = fma(_2131, _2143, -0.212114393711090087890625);
    float _2151 = _2105 * 0.693147182464599609375;
    float _2153 = sqrt(_2129);
    float _2155 = -_2097;
    float _2157 = fma(_2123, _2137, _2155);
    float _2159 = fma(_2131, _2149, 1.570728778839111328125);
    float _2161 = fma(_2157, 0.5, 0.5);
    float _2163 = _2145 * _2139;
    float _2165 = _2147 * _2139;
    float _2167 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2169 = fma(_2163, 0.5, 0.5);
    float _2171 = fma(_2165, -0.5, 0.5);
    float _2173 = _2153 * 0.636619746685028076171875;
    float3 _5639 = float3(_2169, _2171, _2167);
    float _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5639, float3(0.0), isnan(_5639)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5639, float3(0.0), isnan(_5639)), level(0.0)).x;
    float3 _5650 = float3(_2169, _2171, _2167);
    float4 _2178 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5650, float3(0.0), isnan(_5650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5650, float3(0.0), isnan(_5650)), level(0.0)).xyzw;
    float _2180 = _2178.x;
    float _2182 = _2178.y;
    float _2184 = _2178.z;
    float _2186 = _2178.w;
    float _2188 = -_2159;
    float _2190 = fma(_2173, _2188, 1.0);
    float2 _5672 = float2(_2190, _2161);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5672, float2(0.0), isnan(_5672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5672, float2(0.0), isnan(_5672)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    float _2202 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2204 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2206 = _1811 * _1865;
    bool _2208 = _1811 > 0.0;
    bool _2210 = isnan(_1811);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan(0.0);
    bool _2216 = _2212 || _2214;
    float _2218 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2204);
    float _2220 = exp2(_2202);
    float _2222 = _2206 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2224 = _1865 <= 0.0;
    bool _2226 = !_2216;
    bool _2228 = _2224 || _2226;
    float _2230 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2232 = _476 * _2222;
    float _2234 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2230);
    float _2236 = _2232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = _2234 + _2115;
    out.gl_Position.x = _2145;
    out.gl_Position.y = _2147;
    out.gl_Position.z = _2234;
    out.gl_Position.w = _2115;
    float _2240 = _2238 * 0.5;
    float _2242 = -_2220;
    float _2244 = _2242 + 1.0;
    out.m_45.x = _2236;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2240;
    out.m_67.w = _2115;
    float _2248 = _2246 * _2175;
    float _2250 = -_2246;
    float _2252 = _2250 + 1.0;
    float _2254 = _2186 * _2248;
    float _2256 = _2200 * _2248;
    float _2258 = fma(_2196, _2254, _2180);
    float _2260 = fma(_2198, _2254, _2182);
    float _2262 = _2186 * _2252;
    float _2264 = fma(_2186, _2256, _2184);
    out.m_69.x = _2258;
    out.m_69.y = _2260;
    out.m_69.z = _2264;
    out.m_69.w = _2262;
    if (!_2228)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2266;
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
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _785 = false;
    bool _638 = false;
    bool _502 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _83 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _2323 = as_type<float>(_104);
        out.gl_Position.z = _2323;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
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
        out.m_45.x = 0.0;
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
        float _2392 = as_type<float>(_140);
        out.gl_Position.z = _2392;
    }
    if (_132)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _148 = in.m_51.w;
    float _150 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _152 = in.m_42.x;
    float _154 = in.m_42.y;
    float _156 = in.m_42.z;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = _146 * _144;
    float _170 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _168);
    float _172 = in.m_47.x;
    float _174 = in.m_47.y;
    float _176 = in.m_47.z;
    float _178 = _170 * 6.283185482025146484375;
    float _180 = floor(_170);
    float _182 = _178 * 0.15915493667125701904296875;
    int _184 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _186 = _184 != 0;
    float _188 = _182 * 6.283185482025146484375;
    float _190 = cos(_188);
    float _192 = -_180;
    float _194 = _170 + _192;
    float _196 = _180;
    float _198 = _150;
    if (!_166)
    {
        float _200 = _150 * _150;
        float _202 = _200 * 0.5;
        _196 = _202;
    }
    float _204 = _196;
    bool _206 = _194 < 0.5;
    float _208 = float(_206);
    float _210 = _204;
    if (!_166)
    {
        float _212 = _204 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _210 = _212;
    }
    float _214 = _210;
    bool _216 = !_166;
    float _218 = _214;
    float _220 = _152;
    float _222 = _154;
    float _224 = _176;
    float _226 = _176;
    if (!_216)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = _150 * _230;
        float _240 = 1.0 / _234;
        float _242 = _236 * 0.693147182464599609375;
        float _244 = exp2(_238);
        float _246 = 1.0 / _242;
        float _248 = _244 + (-1.0);
        float _250 = -_248;
        float _252 = fma(_250, _246, _150);
        float _254 = _252 * _240;
        float _256 = _254 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _218 = _256;
    }
    float _258 = _218;
    bool _260 = !_166;
    if (!_260)
    {
        float _262 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _264 = log2(_262);
        float _266 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _268 = _266 + 1.0;
        float _270 = 1.0 / _268;
        float _272 = _150 * _264;
        float _274 = exp2(_272);
        float _276 = -_274;
        float _278 = _276 + 1.0;
        float _280 = _278 * _270;
        _198 = _280;
    }
    float _282 = _198;
    float _284 = -_194;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _288 = fma(_190, 0.5, 0.5);
    float _290 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _292 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _294 = _258 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _296 = -_208;
    float _298 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _300 = -_288;
    float _302 = fma(_300, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _304 = fma(_282, _172, _290);
    float _306 = fma(_282, _174, _292);
    float _308 = fma(_282, _176, _294);
    float _310 = _292;
    if (!_166)
    {
        float _312 = _122 * _122;
        float _314 = _312 * 0.5;
        _310 = _314;
    }
    float _316 = _310;
    float _318 = fma(_304, _148, _152);
    float _320 = fma(_306, _148, _154);
    float _322 = fma(_308, _148, _156);
    if (!_166)
    {
        float _324 = _316 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _220 = _324;
    }
    float _326 = _220;
    float _328 = _326;
    if (!_166)
    {
        _222 = _122;
    }
    float _330 = _222;
    bool _332 = !_166;
    float _334 = _330;
    if (!_332)
    {
        float _336 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _338 = log2(_336);
        float _340 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _342 = _340 + 1.0;
        float _344 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _346 = _122 * _338;
        float _348 = 1.0 / _342;
        float _350 = _344 * 0.693147182464599609375;
        float _352 = exp2(_346);
        float _354 = 1.0 / _350;
        float _356 = _352 + (-1.0);
        float _358 = -_356;
        float _360 = fma(_358, _354, _122);
        float _362 = _360 * _348;
        float _364 = _362 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _328 = _364;
    }
    float _366 = _328;
    bool _368 = !_166;
    if (!_368)
    {
        float _370 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _372 = log2(_370);
        float _374 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _376 = _374 + 1.0;
        float _378 = 1.0 / _376;
        float _380 = _122 * _372;
        float _382 = exp2(_380);
        float _384 = -_382;
        float _386 = _384 + 1.0;
        float _388 = _386 * _378;
        _334 = _388;
    }
    float _390 = _334;
    bool _392 = !_186;
    int _394 = _392 ? 0 : 1;
    float _396 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    int _398 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _400 = _398 != 0;
    int _402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _404 = _402 != 0;
    float _406 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _408 = abs(_394);
    float _410 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _412 = fma(_390, _174, _396);
    bool _414 = !_400;
    int _416 = _414 ? 0 : 1;
    float _418 = fma(_390, _172, _406);
    float _420 = fma(_390, _176, _410);
    float _422 = -_412;
    float _424 = _306 + _422;
    bool _426 = !_404;
    int _428 = _426 ? 0 : 1;
    int _430 = abs(_416);
    float _432 = -_418;
    float _434 = _304 + _432;
    float _436 = _424 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _438 = _424 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _440 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _442 = _424 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _444 = abs(_428);
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[4].x, _436);
    float _448 = float(_430);
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[5].x, _438);
    float _452 = fma(_434, (*spvDescriptorSet0.vp_c10)._m0[6].x, _442);
    float _454 = float(_408);
    float _456 = -_420;
    float _458 = _308 + _456;
    float _460 = abs(_286);
    float _462 = _448 * _460;
    float _464 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[4].z, _446);
    float _466 = float(_444);
    float _468 = fma(_454, _302, _462);
    float _470 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[5].z, _450);
    float _472 = fma(_458, (*spvDescriptorSet0.vp_c10)._m0[6].z, _452);
    float _474 = abs(_298);
    float _476 = fma(_466, _474, _468);
    bool _478 = !_440;
    float _480 = _470;
    float _482 = _464;
    float _484 = _472;
    float _500;
    if (!_478)
    {
        float _486 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _488 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _490 = fma(_488, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _492 = _490 * _486;
        float _494 = floor(_492);
        float _496 = -_494;
        float _498 = _492 + _496;
        _500 = _498;
        _502 = true;
    }
    else
    {
        float _504 = float(_88);
        float _506 = 1.0 / _504;
        float _508 = _122 * _506;
        _500 = _508;
    }
    _502 = false;
    float _510 = _500;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _514 = _510 + _512;
    float _516 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    bool _518 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _520 = isnan(_510);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _530;
    bool _534 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _536 = isnan(_510);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = _516 * _142;
    float _548 = 1.0 / _532;
    float _550 = -_544;
    float _552 = _550 + 1.0;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _554;
    bool _558 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _560 = _528 * _552;
    float _562 = -_528;
    float _564 = _562 + 1.0;
    float _566 = trunc(_546);
    int _568 = int(_566);
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _570;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _574;
    float _578 = _514 * _548;
    float _580 = in.m_51.x;
    float _582 = in.m_51.y;
    float _584 = in.m_51.z;
    float _586 = fma(_556, _578, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _588 = fma(_572, _578, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _590 = fma(_576, _578, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _592 = _586 * _560;
    float _594 = _588 * _560;
    float _596 = _590 * _560;
    int _598 = _568 << 4;
    int _600 = _598 + 1712;
    float _602 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].x, _592);
    float _604 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].y, _594);
    float _606 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _608 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].x, _602);
    float _610 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].y, _604);
    float _612 = fma(_544, (*spvDescriptorSet0.vp_c9)._m0[144].z, _606);
    float _614 = _610 * _582;
    float _616 = _608 * _580;
    float _618 = _612 * _584;
    bool _620 = !_558;
    float _636;
    if (!_620)
    {
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _624 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_88);
        float _642 = 1.0 / _640;
        float _644 = _122 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    uint _649 = uint(int(uint(_600) >> uint(2)));
    uint _651 = uint(int(uint(int(_649)) >> uint(2)));
    int _653 = int(_649) & 3;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[int(_651)][_653];
    int _657 = int(_649) + 1;
    uint _659 = uint(int(uint(_657) >> uint(2)));
    int _661 = _657 & 3;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[int(_659)][_661];
    bool _665 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _667 = isnan(_646);
    bool _669 = _665 || _667;
    bool _671 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _673 = _669 || _671;
    float _675 = float(_673);
    float _677 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _679 = _677 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _681 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    int _683 = _600 + 8;
    uint _685 = uint(int(uint(_683) >> uint(2)));
    uint _687 = uint(int(uint(int(_685)) >> uint(2)));
    int _689 = int(_685) & 3;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[int(_687)][_689];
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _695 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _693;
    float _697 = 1.0 / _679;
    float _699 = -_675;
    float _701 = _699 + 1.0;
    float _703 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _705 = _703 * _142;
    float _707 = _695 * _697;
    float _709 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _711 = _646 + _709;
    bool _713 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _715 = isnan(_646);
    bool _717 = _713 || _715;
    bool _719 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _721 = _717 || _719;
    float _723 = float(_721);
    float _725 = trunc(_705);
    int _727 = int(_725);
    float _729 = fma(_707, _711, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _731 = _723 * _701;
    float _733 = -_723;
    float _735 = _733 + 1.0;
    float _737 = _729 * _731;
    float _739 = fma(_735, (*spvDescriptorSet0.vp_c9)._m0[115].x, _737);
    float _741 = fma(_675, (*spvDescriptorSet0.vp_c9)._m0[116].x, _739);
    int _743 = _727 << 4;
    int _745 = _743 + 1968;
    float _747 = _655 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _749 = _663 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _751 = _741 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _753 = _747 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _755 = _749 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _757 = _691 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _759 = _757 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _753;
    out.m_53.y = _755;
    out.m_53.z = _759;
    out.m_53.w = _751;
    bool _761 = !_681;
    int _763 = as_type<int>(_753);
    bool _765 = _681;
    float _767 = _751;
    float _783;
    if (!_761)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _771 = _142 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _763 = as_type<int>(_775);
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_88);
        float _789 = 1.0 / _787;
        float _791 = _122 * _789;
        _783 = _791;
    }
    _785 = false;
    int _793 = _763;
    float _795 = _783;
    float _797 = in.m_55.x;
    float _799 = _320 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _801 = in.m_55.y;
    int _803 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _805 = _803 != 0;
    float _807 = _320 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _811 = _809 != 0;
    float _813 = in.m_49.z;
    float _815 = in.m_49.w;
    int _817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _819 = _817 != 0;
    float _821 = _320 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _823 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _825 = _823 != 0;
    float _827 = in.m_49.y;
    float _829 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[4].x, _807);
    float _831 = _618 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _833 = _614 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _835 = _793;
    if (_805)
    {
        bool _837 = _142 > 0.5;
        _765 = _837;
    }
    bool _839 = _765;
    float _841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    if (_805)
    {
        float _847 = -_797;
        float _849 = _847 + 1.0;
        _835 = as_type<int>(_849);
    }
    int _851 = _835;
    if (!_805)
    {
        _767 = _797;
    }
    float _853 = _767;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _857 = 1.0 / _845;
    float _859 = -_801;
    float _861 = _859 + 1.0;
    float _863 = _853;
    float _865 = _801;
    if (_805)
    {
        float _867 = _839 ? as_type<float>(_851) : _797;
        _863 = _867;
    }
    float _869 = _863;
    float _871 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _873 = in.m_57.x;
    float _875 = in.m_57.y;
    float _877 = in.m_57.z;
    bool _879 = _813 > 0.5;
    float _881 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[88].z, _855);
    bool _883 = _815 > 0.5;
    float _885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _887 = _827 > 0.5;
    int _889 = _879 ? as_type<int>(_861) : as_type<int>(_801);
    int _891 = _887 ? as_type<int>(_861) : as_type<int>(_801);
    float _893 = _819 ? as_type<float>(_889) : _801;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _897 = _895 != 0;
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _901 = _899 != 0;
    float _903 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[5].x, _799);
    float _905 = _825 ? as_type<float>(_891) : _801;
    float _907 = _799;
    bool _909 = _883;
    float _911 = _893;
    float _913 = _827;
    if (_811)
    {
        float _915 = in.m_49.z;
        _907 = _915;
    }
    float _917 = _907;
    int _919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _921 = _919 != 0;
    float _923 = fma(_318, (*spvDescriptorSet0.vp_c10)._m0[6].x, _821);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _927 = _925 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _929 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[5].z, _903);
    float _931 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _875);
    float _933 = 1.0 / _927;
    float _935 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _873);
    float _937 = _616 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _939 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[4].z, _829);
    float _941 = fma(_322, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _943 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _877);
    if (_901)
    {
        float _945 = _883 ? _861 : _801;
        _865 = _945;
    }
    float _947 = _865;
    float _949 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _951 = _833 * _931;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _955 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _953;
    float _957 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _959 = _957 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _961 = _831 * _943;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _965 = _795 + _963;
    float _967 = _955 * _857;
    float _969 = _959 * _933;
    float _971 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _973 = _795 + _971;
    int _975 = as_type<int>(_961);
    if (_811)
    {
        bool _977 = _917 > 0.5;
        _909 = _977;
    }
    bool _979 = _909;
    float _981 = _937 * _935;
    float _983 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _985 = fma(_967, _973, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _987 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _989 = isnan(_795);
    bool _991 = _987 || _989;
    bool _993 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _995 = _991 || _993;
    float _997 = float(_995);
    float _999 = fma(_969, _965, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1001 = _949 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _1003 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1005 = isnan(_795);
    bool _1007 = _1003 || _1005;
    bool _1009 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1011 = _1007 || _1009;
    float _1013 = float(_1011);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1017 = -_997;
    float _1019 = _1017 + 1.0;
    float _1021 = fma(_893, _1001, -0.5);
    bool _1023 = _795 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1025 = isnan(_795);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1031 = _1027 || _1029;
    int _1033 = _1031 ? 1065353216 : 0;
    float _1035 = _951 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1037 = _1013 * _1019;
    float _1039 = _1015;
    int _1041 = _1033;
    float _1043 = _1035;
    if (_921)
    {
        _911 = _142;
    }
    float _1045 = _911;
    float _1047 = -_1013;
    float _1049 = _1047 + 1.0;
    float _1051 = _951 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1053 = _1045;
    if (!_921)
    {
        _1053 = _813;
    }
    float _1055 = _1053;
    float _1057 = _983 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1059 = as_type<float>(_1033) * _1049;
    float _1061 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1063 = _951 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1065 = _1055 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1067 = fma(_1057, _947, -0.5);
    float _1069 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1015);
    float _1071 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1035);
    float _1073 = -_1061;
    float _1075 = fma(_1065, 2.0, _1073);
    float _1077 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1051);
    float _1079 = _1057;
    float _1081 = _1071;
    float _1083 = _1077;
    if (!_921)
    {
        _1039 = _827;
    }
    float _1085 = _1039;
    float _1087 = fma(_981, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1063);
    float _1089 = _1085;
    if (_921)
    {
        _1089 = _142;
    }
    float _1091 = _1089;
    float _1093 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1095 = _985 * _1059;
    float _1097 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1087);
    float _1099 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1071);
    float _1101 = fma(_961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1077);
    float _1103 = -as_type<float>(_1033);
    float _1105 = _1103 + 1.0;
    if (_811)
    {
        float _1107 = -_797;
        float _1109 = _1107 + 1.0;
        _975 = as_type<int>(_1109);
    }
    int _1111 = _975;
    if (_897)
    {
        float _1113 = -_797;
        float _1115 = _1113 + 1.0;
        _1041 = as_type<int>(_1115);
    }
    int _1117 = _1041;
    float _1119 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1093);
    float _1121 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1123 = _941 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1125 = _1097 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_811)
    {
        _1079 = _797;
    }
    float _1127 = _1079;
    float _1129 = _939 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1131 = _1127;
    if (!_897)
    {
        _1081 = _797;
    }
    float _1133 = _1081;
    float _1135 = _1123 + _1125;
    float _1137 = _1133;
    if (_811)
    {
        float _1139 = _979 ? as_type<float>(_1111) : _797;
        _1131 = _1139;
    }
    float _1141 = _1131;
    float _1143 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1095);
    if (_897)
    {
        float _1145 = _887 ? as_type<float>(_1117) : _797;
        _1137 = _1145;
    }
    float _1147 = _1137;
    float _1149 = _1099 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    if (!_921)
    {
        _1083 = _813;
    }
    float _1151 = _1083;
    float _1153 = fma(_999, _1037, _1143);
    float _1155 = _1151;
    float _1157 = _1153;
    if (!_921)
    {
        _1043 = _813;
    }
    float _1159 = _1043;
    float _1161 = _1129 + _1149;
    float _1163 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1165 = _1135 + _1163;
    int _1167 = _745 + 8;
    uint _1169 = uint(int(uint(_1167) >> uint(2)));
    uint _1171 = uint(int(uint(int(_1169)) >> uint(2)));
    int _1173 = int(_1169) & 3;
    float _1175 = (*spvDescriptorSet0.vp_c9)._m0[int(_1171)][_1173];
    float _1177 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1179 = _1161 + _1177;
    float _1181 = _1165 * _1165;
    float _1183 = _1159;
    float _1185 = _1161;
    if (_921)
    {
        _1183 = _827;
    }
    float _1187 = _1183;
    float _1189 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    if (_921)
    {
        _1155 = _827;
    }
    float _1191 = _1155;
    float _1193 = fma(_1179, _1179, _1181);
    if (!_921)
    {
        _913 = _142;
    }
    float _1195 = _913;
    float _1197 = fma(_1187, (*spvDescriptorSet0.vp_c9)._m0[83].w, _871);
    float _1199 = _841 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1201 = sqrt(_1193);
    float _1203 = _885 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1205 = -_1189;
    float _1207 = fma(_1121, 2.0, _1205);
    float _1209 = fma(_1199, _1141, -0.5);
    float _1211 = fma(_1203, _1147, -0.5);
    uint _1213 = uint(int(uint(_745) >> uint(2)));
    uint _1215 = uint(int(uint(int(_1213)) >> uint(2)));
    int _1217 = int(_1213) & 3;
    float _1219 = (*spvDescriptorSet0.vp_c9)._m0[int(_1215)][_1217];
    int _1221 = int(_1213) + 1;
    uint _1223 = uint(int(uint(_1221) >> uint(2)));
    int _1225 = _1221 & 3;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[int(_1223)][_1225];
    float _1229 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1231 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1233 = -_122;
    float _1235 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1207);
    float _1237 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _881);
    float _1239 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1241 = fma(_1231, -2.0, _1229);
    float _1243 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1119);
    float _1245 = -_122;
    float _1247 = fma(_1245, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1075);
    bool _1249 = _1201 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = _929 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1253 = fma(_1243, _1209, _1235);
    float _1255 = fma(_1237, _1211, _1247);
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1259 = _1195 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1261 = _1101 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1263 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1265 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1197);
    float _1267 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1241);
    float _1269 = _1251 + _1261;
    float _1271 = fma(_1259, -2.0, _1263);
    float _1273 = fma(_997, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1153);
    float _1275 = -_1267;
    float _1277 = fma(_1265, _1067, _1275);
    float _1279 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1069);
    float _1281 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1271);
    float _1283 = _1261;
    if (!_1249)
    {
        _1157 = _1135;
    }
    float _1285 = _1157;
    float _1287 = _1285;
    if (!_1249)
    {
        _1283 = _1269;
    }
    float _1289 = _1283;
    bool _1291 = !_1249;
    float _1293 = _1289;
    if (!_1291)
    {
        float _1295 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1297 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1299 = _1201 + _1297;
        float _1301 = rsqrt(_1193);
        float _1303 = _1299 * _1295;
        float _1305 = _1269 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1307 = _1303 * 0.15915493667125701904296875;
        float _1309 = _1307 * 6.283185482025146484375;
        float _1311 = sin(_1309);
        float _1313 = _1307 * 6.283185482025146484375;
        float _1315 = cos(_1313);
        float _1317 = fma(_1311, _1305, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1319 = _1301 * _1317;
        float _1321 = _1315 + (-1.0);
        float _1323 = fma(_1179, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1325 = fma(_1165, _1319, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1327 = _1321 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1329 = fma(_1269, _1315, _1327);
        _1293 = _1329;
        _1185 = _1323;
        _1287 = _1325;
    }
    float _1331 = _1293;
    float _1333 = _1185;
    float _1335 = _1287;
    float _1337 = -_1251;
    float _1339 = _1337 + _1331;
    float _1341 = -_1129;
    float _1343 = _1341 + _1333;
    float _1345 = -_1281;
    float _1347 = fma(_1279, _1021, _1345);
    float _1349 = _1219 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1351 = _1339 * _1339;
    float _1353 = _905 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1355 = -_1123;
    float _1357 = _1355 + _1335;
    float _1359 = _1227 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1361 = fma(_1343, _1343, _1351);
    float _1363 = _1353 * _1257;
    float _1365 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1367 = _1175 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1369 = fma(_1357, _1357, _1361);
    float _1371 = _1349 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1373 = _1365 * _1239;
    float _1375 = _1255 + 0.5;
    float _1377 = sqrt(_1369);
    float _1379 = _1359 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1381 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1383 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1385 = _1253 + 0.5;
    float _1387 = _1277 + 0.5;
    float _1389 = _1347 + 0.5;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    out.m_61.x = _1371;
    out.m_61.y = _1379;
    out.m_61.z = _1381;
    out.m_61.w = _1383;
    bool _1391 = _1377 > 0.0;
    out.m_63.x = _1373;
    out.m_63.y = _1363;
    out.m_63.z = _1385;
    out.m_63.w = _1387;
    out.m_65.x = _1375;
    out.m_65.y = _1389;
    bool _1393 = !_1391;
    float _1395 = _1373;
    float _1397 = _1387;
    float _1399 = _1363;
    float _1401 = _1331;
    float _1403 = _1333;
    float _1405 = _1335;
    float _1407 = _1373;
    if (!_1393)
    {
        bool _1409 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1411 = _1385;
        if (_1409)
        {
            float _1413 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1411 = _1413;
        }
        float _1415 = _1411;
        if (_1409)
        {
            float _1417 = _464 * _1415;
            _1395 = _1417;
        }
        float _1419 = _1395;
        float _1421 = _1419;
        float _1423 = _1419;
        if (_1409)
        {
            float _1425 = _470 * _1415;
            _1397 = _1425;
        }
        float _1427 = _1397;
        float _1429 = _1427;
        if (_1409)
        {
            float _1431 = _472 * _1415;
            _1399 = _1431;
        }
        float _1433 = _1399;
        float _1435 = _1433;
        if (!_1409)
        {
            float _1437 = _122 + 1.0;
            float _1439 = _1437;
            if (!_166)
            {
                float _1441 = _1437 * _1437;
                float _1443 = _1441 * 0.5;
                _1421 = _1443;
            }
            float _1445 = _1421;
            float _1447 = _1445;
            if (!_166)
            {
                float _1449 = _1445 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1447 = _1449;
            }
            float _1451 = _1447;
            bool _1453 = !_166;
            float _1455 = _1451;
            if (!_1453)
            {
                float _1457 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1459 = log2(_1457);
                float _1461 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1463 = _1459 * _1437;
                float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1467 = 1.0 + _1465;
                float _1469 = 1.0 / _1467;
                float _1471 = _1461 * 0.693147182464599609375;
                float _1473 = exp2(_1463);
                float _1475 = 1.0 / _1471;
                float _1477 = _1473 + (-1.0);
                float _1479 = -_1477;
                float _1481 = fma(_1479, _1475, _1437);
                float _1483 = _1481 * _1469;
                float _1485 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1455 = _1485;
            }
            float _1487 = _1455;
            float _1489 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1491 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1493 = !_166;
            if (!_1493)
            {
                float _1495 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1497 = log2(_1495);
                float _1499 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1501 = 1.0 + _1499;
                float _1503 = 1.0 / _1501;
                float _1505 = _1497 * _1437;
                float _1507 = exp2(_1505);
                float _1509 = -_1507;
                float _1511 = _1509 + 1.0;
                float _1513 = _1511 * _1503;
                _1439 = _1513;
            }
            float _1515 = _1439;
            float _1517 = fma(_1515, _174, _1491);
            float _1519 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1521 = fma(_1515, _172, _1489);
            float _1523 = -_412;
            float _1525 = _1523 + _1517;
            float _1527 = fma(_1515, _176, _1519);
            float _1529 = -_418;
            float _1531 = _1529 + _1521;
            float _1533 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _1535 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _1537 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _1539 = -_420;
            float _1541 = _1539 + _1527;
            float _1543 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1533);
            float _1545 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1535);
            float _1547 = fma(_1531, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1537);
            float _1549 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1543);
            float _1551 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1545);
            float _1553 = fma(_1541, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1547);
            _480 = _1551;
            _482 = _1549;
            _484 = _1553;
            _1423 = _1549;
            _1429 = _1551;
            _1435 = _1553;
            _224 = _1545;
        }
        float _1555 = _480;
        float _1557 = _482;
        float _1559 = _484;
        float _1561 = _1423;
        float _1563 = _1429;
        float _1565 = _1435;
        float _1567 = _224;
        float _1569 = _1555 * _1555;
        float _1571 = fma(_1557, _1557, _1569);
        float _1573 = fma(_1559, _1559, _1571);
        float _1575 = rsqrt(_1369);
        float _1577 = sqrt(_1573);
        float _1579 = _1343 * _1575;
        float _1581 = _1339 * _1575;
        float _1583 = _1357 * _1575;
        bool _1585 = _1577 > 0.0;
        bool _1587 = !_1585;
        _226 = _1567;
        _1407 = _1561;
        if (!_1587)
        {
            float _1589 = rsqrt(_1573);
            float _1591 = _1589 * _1555;
            float _1593 = _1589 * _1557;
            float _1595 = _1589 * _1559;
            float _1597 = _1581 * _1591;
            float _1599 = fma(_1579, _1593, _1597);
            float _1601 = fma(_1583, _1595, _1599);
            float _1603 = _1601 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1605 = fma(_1561, _1603, _1333);
            float _1607 = fma(_1563, _1603, _1331);
            float _1609 = fma(_1565, _1603, _1335);
            _1401 = _1607;
            _1403 = _1605;
            _1405 = _1609;
            _226 = _1597;
        }
    }
    float _1611 = _1401;
    float _1613 = _1403;
    float _1615 = _1405;
    float _1617 = _226;
    float _1619 = _1407;
    float _1621 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1623 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1625 = isnan(0.5);
    bool _1627 = _1623 || _1625;
    bool _1629 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1631 = _1627 || _1629;
    float _1633 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1621);
    float _1635 = _1251 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _1637 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1639 = isnan(0.5);
    bool _1641 = _1637 || _1639;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    float _1647 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1633);
    float _1649 = _1647 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1651 = fma(_1129, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1635);
    float _1653 = 1.0 / _1649;
    float _1655 = fma(_1123, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1651);
    float _1657 = _1617;
    float _1659 = _1619;
    if (_1631)
    {
        _1657 = _1611;
    }
    float _1661 = _1657;
    float _1663 = _1661;
    if (_1645)
    {
        _1659 = 1.0;
    }
    float _1665 = _1659;
    float _1667 = _1655 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1669 = _1667 + _1649;
    float _1671 = _1669 * _1653;
    float _1673 = _1671 * 0.5;
    float _1675 = _1653;
    float _1677 = _1673;
    float _1679 = _1665;
    if (_1631)
    {
        _1675 = _1613;
    }
    float _1681 = _1675;
    float _1683 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1685 = fma(_1673, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1683);
    float _1687 = _1681;
    float _1689 = _1685;
    if (_1631)
    {
        _1677 = _1615;
    }
    float _1691 = _1677;
    float _1693 = 1.0 / _1685;
    float _1695 = _1691;
    if (!_1631)
    {
        float _1697 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1699 = _1251 + _1697;
        float _1701 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1703 = _1129 + _1701;
        float _1705 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1707 = -_1123;
        float _1709 = _1707 + _1615;
        float _1711 = _1699 * _1699;
        float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1715 = _1123 + _1713;
        float _1717 = fma(_1703, _1703, _1711);
        float _1719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1721 = fma(_1715, _1715, _1717);
        float _1723 = sqrt(_1721);
        float _1725 = _1705 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1727 = precise::min(_1723, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1729 = _1727 * _1719;
        float _1731 = -_1129;
        float _1733 = _1731 + _1613;
        float _1735 = _1725 * _1729;
        float _1737 = -_1251;
        float _1739 = _1737 + _1611;
        float _1741 = fma(_1733, _1735, _1129);
        float _1743 = fma(_1739, _1735, _1251);
        float _1745 = fma(_1709, _1735, _1123);
        _1663 = _1743;
        _1687 = _1741;
        _1695 = _1745;
    }
    float _1747 = _1663;
    float _1749 = _1687;
    float _1751 = _1695;
    if (_1645)
    {
        _1689 = 1.0;
    }
    float _1753 = _1689;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1757 = _1693 * _1755;
    float _1759 = _1753;
    float _1761 = _1757;
    if (!_1645)
    {
        float _1763 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1765 = _1763 * 0.15915493667125701904296875;
        float _1767 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1769 = _1765 * 6.283185482025146484375;
        float _1771 = cos(_1769);
        float _1773 = _1767 * 0.15915493667125701904296875;
        float _1775 = _1765 * 6.283185482025146484375;
        float _1777 = sin(_1775);
        float _1779 = 1.0 / _1771;
        float _1781 = _1773 * 6.283185482025146484375;
        float _1783 = cos(_1781);
        float _1785 = _1777 * _1779;
        float _1787 = _1773 * 6.283185482025146484375;
        float _1789 = sin(_1787);
        float _1791 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1793 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1791;
        float _1795 = _1783 * _1785;
        float _1797 = 1.0 / _1795;
        float _1799 = 1.0 / _1793;
        float _1801 = _1789 * _1797;
        float _1803 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1805 = fma(_1757, _1801, _1803);
        float _1807 = _1805 * _1799;
        float _1809 = precise::clamp(_1807, 0.0, 1.0);
        _1679 = _1809;
    }
    float _1811 = _1679;
    if (!_1645)
    {
        float _1813 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1815 = _1813 * 0.15915493667125701904296875;
        float _1817 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1819 = _1815 * 6.283185482025146484375;
        float _1821 = cos(_1819);
        float _1823 = _1817 * 0.15915493667125701904296875;
        float _1825 = _1815 * 6.283185482025146484375;
        float _1827 = sin(_1825);
        float _1829 = 1.0 / _1821;
        float _1831 = _1823 * 6.283185482025146484375;
        float _1833 = cos(_1831);
        float _1835 = _1827 * _1829;
        float _1837 = _1823 * 6.283185482025146484375;
        float _1839 = sin(_1837);
        float _1841 = _1833 * _1835;
        float _1843 = 1.0 / _1841;
        float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1847 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1845;
        float _1849 = 1.0 / _1847;
        float _1851 = _1839 * _1843;
        float _1853 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1855 = fma(_1757, _1851, _1853);
        float _1857 = _1855 * _1849;
        float _1859 = precise::clamp(_1857, 0.0, 1.0);
        float _1861 = -_1859;
        float _1863 = _1861 + 1.0;
        _1759 = _1863;
    }
    float _1865 = _1759;
    float _1867 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1869 = _1747 + _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1873 = _1749 + _1871;
    float _1875 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1877 = _1751 + _1875;
    float _1879 = _1869 * _1869;
    float _1881 = fma(_1873, _1873, _1879);
    float _1883 = fma(_1877, _1877, _1881);
    float _1885 = rsqrt(_1883);
    float _1887 = sqrt(_1883);
    float _1889 = _1885 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1891 = _1873 * _1889;
    float _1893 = _1877 * _1889;
    float _1895 = _1891 * _1891;
    float _1897 = _1893 * _1893;
    float _1899 = _1895 + _1897;
    float _1901 = sqrt(_1899);
    bool _1903 = _1901 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1905 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1907 = _1901 + _1905;
    float _1909 = _1881;
    float _1911 = _1907;
    float _1913 = _1869;
    float _1915 = _1889;
    float _1917 = _1891;
    if (_1903)
    {
        float _1919 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1909 = _1919;
    }
    float _1921 = _1909;
    float _1923 = _1921;
    if (_1903)
    {
        float _1925 = _1907 * _1921;
        _1911 = _1925;
    }
    float _1927 = _1911;
    if (_1903)
    {
        float _1929 = rsqrt(_1899);
        _1923 = _1929;
    }
    float _1931 = _1923;
    float _1933 = _1931;
    if (_1903)
    {
        float _1935 = _1927 * 0.15915493667125701904296875;
        _1761 = _1935;
    }
    float _1937 = _1761;
    float _1939 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1941 = _1885;
    if (_1903)
    {
        float _1943 = _1937 * 6.283185482025146484375;
        float _1945 = sin(_1943);
        _1941 = _1945;
    }
    float _1947 = _1941;
    float _1949 = precise::max(0.0, _1939);
    float _1951 = _1877;
    float _1953 = _1949;
    if (_1903)
    {
        float _1955 = _1937 * 6.283185482025146484375;
        float _1957 = cos(_1955);
        _1951 = _1957;
    }
    float _1959 = _1951;
    float _1961 = -_1889;
    float _1963 = -_1949;
    float _1965 = fma(_1869, _1961, _1963);
    if (_1903)
    {
        float _1967 = _1965 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1913 = _1967;
    }
    float _1969 = _1913;
    float _1971 = _1947;
    float _1973 = _1969;
    if (_1903)
    {
        float _1975 = fma(_1947, _1969, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1971 = _1975;
    }
    float _1977 = _1971;
    float _1979 = _1977;
    if (!_1903)
    {
        _1973 = _1895;
    }
    float _1981 = _1973;
    float _1983 = _1981;
    if (_1903)
    {
        float _1985 = _1931 * _1977;
        _1915 = _1985;
    }
    float _1987 = _1915;
    if (!_1903)
    {
        _1979 = _1965;
    }
    float _1989 = _1979;
    float _1991 = _1989;
    float _1993 = _1959;
    if (_1903)
    {
        float _1995 = _1959 + (-1.0);
        _1953 = _1995;
    }
    float _1997 = _1953;
    float _1999 = _1997;
    if (_1903)
    {
        float _2001 = _1891 * _1987;
        _1917 = _2001;
    }
    float _2003 = _1917;
    float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2007 = fma(_1887, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2005);
    float _2009 = precise::clamp(_2007, 0.0, 1.0);
    if (_1903)
    {
        float _2011 = _1997 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1933 = _2011;
    }
    float _2013 = _1933;
    if (!_1903)
    {
        _1999 = _1893;
    }
    float _2015 = _1999;
    float _2017 = _2015;
    if (_1903)
    {
        float _2019 = _1893 * _1987;
        _2017 = _2019;
    }
    float _2021 = _2017;
    if (_1903)
    {
        float _2023 = _2003 * _2003;
        _1983 = _2023;
    }
    float _2025 = _1983;
    if (_1903)
    {
        float _2027 = fma(_1965, _1959, _2013);
        _1991 = _2027;
    }
    float _2029 = _1991;
    if (!_1903)
    {
        _1993 = _1897;
    }
    float _2031 = _1993;
    float _2033 = _2031;
    if (_1903)
    {
        float _2035 = _2021 * _2021;
        _2033 = _2035;
    }
    float _2037 = _2033;
    float _2039 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2041 = fma(_2029, _2029, _2025);
    float _2043 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2045 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2047 = -_2009;
    float _2049 = _2047 + 1.0;
    float _2051 = _2041 + _2037;
    float _2053 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2043);
    float _2055 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2057 = _1747 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2059 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2045);
    float _2061 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2053);
    float _2063 = rsqrt(_2051);
    float _2065 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2055);
    float _2067 = fma(_1749, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2057);
    float _2069 = _2061 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2071 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2059);
    float _2073 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2065);
    float _2075 = fma(_1751, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2067);
    float _2077 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2079 = abs(_2049);
    float _2081 = log2(_2079);
    float _2083 = _2073 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2085 = _2071 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2087 = _2075 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2089 = -_2077;
    float _2091 = fma(_2089, _2039, 1.0);
    float _2093 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2095 = _2063 * _2003;
    float _2097 = _2063 * _2029;
    float _2099 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2093);
    float _2101 = _2063 * _2021;
    float _2103 = _2095 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2105 = log2(_2091);
    float _2107 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2099);
    float _2109 = -_2103;
    float _2111 = fma(_2097, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2109);
    float _2113 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2115 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2107);
    float _2117 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2119 = -_2101;
    float _2121 = fma(_2119, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2111);
    float _2123 = exp2(_2113);
    float _2125 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2127 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2117);
    float _2129 = fma(_2121, -0.5, 0.5);
    float _2131 = fma(_2121, 0.5, 0.5);
    float _2133 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2125);
    float _2135 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2127);
    float _2137 = _2097 + 1.0;
    float _2139 = 1.0 / _2115;
    float _2141 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2133);
    float _2143 = fma(_2131, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2145 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2135);
    float _2147 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2141);
    float _2149 = fma(_2131, _2143, -0.212114393711090087890625);
    float _2151 = _2105 * 0.693147182464599609375;
    float _2153 = sqrt(_2129);
    float _2155 = -_2097;
    float _2157 = fma(_2123, _2137, _2155);
    float _2159 = fma(_2131, _2149, 1.570728778839111328125);
    float _2161 = fma(_2157, 0.5, 0.5);
    float _2163 = _2145 * _2139;
    float _2165 = _2147 * _2139;
    float _2167 = _2151 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2169 = fma(_2163, 0.5, 0.5);
    float _2171 = fma(_2165, -0.5, 0.5);
    float _2173 = _2153 * 0.636619746685028076171875;
    float3 _5639 = float3(_2169, _2171, _2167);
    float _2175 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5639, float3(0.0), isnan(_5639)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5639, float3(0.0), isnan(_5639)), level(0.0)).x;
    float3 _5650 = float3(_2169, _2171, _2167);
    float4 _2178 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5650, float3(0.0), isnan(_5650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5650, float3(0.0), isnan(_5650)), level(0.0)).xyzw;
    float _2180 = _2178.x;
    float _2182 = _2178.y;
    float _2184 = _2178.z;
    float _2186 = _2178.w;
    float _2188 = -_2159;
    float _2190 = fma(_2173, _2188, 1.0);
    float2 _5672 = float2(_2190, _2161);
    float3 _2194 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5672, float2(0.0), isnan(_5672)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5672, float2(0.0), isnan(_5672)), level(0.0)).xyz;
    float _2196 = _2194.x;
    float _2198 = _2194.y;
    float _2200 = _2194.z;
    float _2202 = _2081 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2204 = _2083 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2206 = _1811 * _1865;
    bool _2208 = _1811 > 0.0;
    bool _2210 = isnan(_1811);
    bool _2212 = _2208 || _2210;
    bool _2214 = isnan(0.0);
    bool _2216 = _2212 || _2214;
    float _2218 = fma(_2085, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2204);
    float _2220 = exp2(_2202);
    float _2222 = _2206 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2224 = _1865 <= 0.0;
    bool _2226 = !_2216;
    bool _2228 = _2224 || _2226;
    float _2230 = fma(_2069, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2218);
    float _2232 = _476 * _2222;
    float _2234 = fma(_2087, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2230);
    float _2236 = _2232 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2238 = _2234 + _2115;
    out.gl_Position.x = _2145;
    out.gl_Position.y = _2147;
    out.gl_Position.z = _2234;
    out.gl_Position.w = _2115;
    float _2240 = _2238 * 0.5;
    float _2242 = -_2220;
    float _2244 = _2242 + 1.0;
    out.m_45.x = _2236;
    float _2246 = _2244 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.z = _2240;
    out.m_67.w = _2115;
    float _2248 = _2246 * _2175;
    float _2250 = -_2246;
    float _2252 = _2250 + 1.0;
    float _2254 = _2186 * _2248;
    float _2256 = _2200 * _2248;
    float _2258 = fma(_2196, _2254, _2180);
    float _2260 = fma(_2198, _2254, _2182);
    float _2262 = _2186 * _2252;
    float _2264 = fma(_2186, _2256, _2184);
    out.m_69.x = _2258;
    out.m_69.y = _2260;
    out.m_69.z = _2264;
    out.m_69.w = _2262;
    if (!_2228)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2266 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2266;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

