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
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_61 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_51 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _876 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    float _104 = as_type<float>(_96);
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1513 = as_type<float>(_112);
        out.gl_Position.z = _1513;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_96);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1582 = as_type<float>(_148);
        out.gl_Position.z = _1582;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    float _162 = in.m_55.w;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _172 = in.m_57.x;
    float _174 = in.m_59.w;
    float _176 = _152 * 6.283185482025146484375;
    float _178 = fma(_150, 8.0, _176);
    float _180 = _158 * 0.20000000298023223876953125;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _184 = _182 != 0;
    float _186 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _178);
    float _188 = _180 * _180;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _192 = _190 != 0;
    float _194 = _186 * 0.15915493667125701904296875;
    float _196 = fma(_156, _156, _188);
    bool _198 = _162 > 0.5;
    float _200 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _170);
    float _202 = _194 * 6.283185482025146484375;
    float _204 = sin(_202);
    float _206 = fma(_160, _160, _196);
    bool _208 = _168 > 0.5;
    float _210 = in.m_59.x;
    float _212 = in.m_59.y;
    float _214 = in.m_59.z;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _218 = _216 != 0;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _222 = _220 != 0;
    float _224 = 0.0;
    bool _226 = _208;
    float _228 = _154;
    float _230 = _172;
    if (_192)
    {
        float _232 = in.m_55.z;
        _224 = _232;
    }
    float _234 = _224;
    float _236 = rsqrt(_206);
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _240 = _238 != 0;
    float _242 = _236 * _204;
    float _244 = fma(_150, 0.5, 0.5);
    float _246 = in.m_57.y;
    float _248 = _242 * 0.01200000010430812835693359375;
    float _250 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _254 = _244 * _248;
    float _256 = _244;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _260 = _240;
    if (_184)
    {
        float _262 = in.m_55.x;
        _256 = _262;
    }
    float _264 = _256;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _268 = fma(_156, _254, _156);
    float _270 = fma(_160, _254, _160);
    float _272 = _156;
    if (!_240)
    {
        float _274 = in.m_55.z;
        _272 = _274;
    }
    float _276 = _272;
    float _278 = fma(_180, _254, _158);
    float _280 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _284 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _286 = -_266;
    float _288 = fma(_282, 2.0, _286);
    float _290 = fma(_284, -2.0, _164);
    float _292 = in.m_44.x;
    float _294 = in.m_44.y;
    float _296 = in.m_44.z;
    float _298 = -_246;
    float _300 = _298 + 1.0;
    int _302 = _208 ? as_type<int>(_300) : as_type<int>(_246);
    float _304 = _246;
    if (_184)
    {
        bool _306 = _264 > 0.5;
        _226 = _306;
    }
    bool _308 = _226;
    float _310 = in.m_49.x;
    float _312 = in.m_49.y;
    float _314 = in.m_49.z;
    float _316 = _218 ? as_type<float>(_302) : _246;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _320 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _324 = _320 || _322;
    bool _326 = isnan(1.0);
    bool _328 = _324 || _326;
    float _330 = 0.0;
    float _332 = _276;
    float _334 = _318;
    if (!_240)
    {
        _330 = _276;
    }
    float _336 = _330;
    float _338 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _318);
    float _340 = _336;
    if (!_240)
    {
        _258 = _168;
    }
    float _342 = _258;
    float _344 = _342;
    if (_240)
    {
        _340 = _168;
    }
    float _346 = _340;
    if (_240)
    {
        _332 = _168;
    }
    float _348 = _332;
    float _350 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _352 = _350;
    if (_240)
    {
        _344 = _166;
    }
    float _354 = _344;
    float _356 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_192)
    {
        bool _358 = _234 > 0.5;
        _260 = _358;
    }
    bool _360 = _260;
    if (!_328)
    {
        float _362 = _350 * _350;
        float _364 = _362 * 0.5;
        _228 = _364;
    }
    float _366 = _228;
    float _368 = _366;
    if (!_184)
    {
        _334 = _172;
    }
    float _370 = _334;
    float _372 = fma(_356, _316, -0.5);
    float _374 = _370;
    if (!_328)
    {
        float _376 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _368 = _376;
    }
    float _378 = _368;
    bool _380 = !_328;
    float _382 = _378;
    if (!_380)
    {
        float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _386 = log2(_384);
        float _388 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _390 = _388 + 1.0;
        float _392 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _394 = _350 * _386;
        float _396 = 1.0 / _390;
        float _398 = _392 * 0.693147182464599609375;
        float _400 = exp2(_394);
        float _402 = 1.0 / _398;
        float _404 = _400 + (-1.0);
        float _406 = -_404;
        float _408 = fma(_406, _402, _350);
        float _410 = _408 * _396;
        float _412 = _410 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _412;
    }
    float _414 = _382;
    bool _416 = !_328;
    if (!_416)
    {
        float _418 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = log2(_418);
        float _422 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _424 = _422 + 1.0;
        float _426 = 1.0 / _424;
        float _428 = _350 * _420;
        float _430 = exp2(_428);
        float _432 = -_430;
        float _434 = _432 + 1.0;
        float _436 = _434 * _426;
        _352 = _436;
    }
    float _438 = _352;
    float _440 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _200);
    float _442 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _290);
    if (_222)
    {
        float _444 = _198 ? _300 : _246;
        _304 = _444;
    }
    float _446 = _304;
    float _448 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _450 = -_442;
    float _452 = fma(_440, _372, _450);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _456 = fma(_438, _310, _448);
    float _458 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _460 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _462 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].z, _454);
    float _464 = _354 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _466 = fma(_438, _312, _458);
    float _468 = fma(_438, _314, _460);
    float _470 = fma(_456, _174, _292);
    float _472 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _476 = fma(_466, _174, _294);
    float _478 = fma(_468, _174, _296);
    float _480 = _250 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = _474 * _270;
    float _484 = _474 * _278;
    float _486 = _474 * _268;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _482);
    float _492 = _280 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _498 = _490 * _472;
    float _500 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = _494 * _492;
    float _504 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = _496 * _480;
    float _508 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = _502 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _512 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _514 = _502 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _516 = -_488;
    float _518 = fma(_464, 2.0, _516);
    float _520 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _524 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[8].x, _510);
    float _526 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _512);
    float _528 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[10].x, _514);
    float _530 = _520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _532 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[8].z, _524);
    float _534 = _526 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _536 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[10].z, _528);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _540 = _530 + _532;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _544 = _534 + _536;
    float _546 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _538);
    float _548 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _550 = _540 + _548;
    int _552 = as_type<int>(_532);
    float _554 = _484;
    float _556 = _540;
    if (_184)
    {
        float _558 = -_172;
        float _560 = _558 + 1.0;
        _552 = as_type<int>(_560);
    }
    int _562 = _552;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _566 = _544 + _564;
    float _568 = _522 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _570 = _550 * _550;
    int _572 = 0;
    float _574 = _570;
    if (_192)
    {
        float _576 = -_172;
        float _578 = _576 + 1.0;
        _572 = as_type<int>(_578);
    }
    int _580 = _572;
    float _582 = _566 * _566;
    float _584 = fma(_568, _446, -0.5);
    float _586 = _346 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _590 = _570 + _582;
    float _592 = _582;
    if (_184)
    {
        float _594 = _308 ? as_type<float>(_562) : _172;
        _374 = _594;
    }
    float _596 = _374;
    float _598 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_192)
    {
        float _600 = _360 ? as_type<float>(_580) : _172;
        _230 = _600;
    }
    float _602 = _230;
    float _604 = _542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _606 = _484 != 0.0;
    bool _608 = isnan(_484);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = in.m_61.x;
    float _618 = in.m_61.y;
    float _620 = in.m_61.z;
    float _622 = sqrt(_590);
    float _624 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    bool _626 = _486 == 0.0;
    bool _628 = !_614;
    bool _630 = _626 && _628;
    float _632 = _502 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _634 = fma(_604, _596, -0.5);
    float _636 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _624);
    bool _638 = _482 == 0.0;
    bool _640 = _638 && _630;
    float _642 = _588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _644 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[9].x, _632);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _648 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _338);
    float _650 = fma(_642, _602, -0.5);
    float _652 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[9].z, _644);
    float _654 = _636 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _656 = fma(_586, -2.0, _646);
    bool _658 = _622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _462);
    float _662 = -_130;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[76].x, _288);
    float _666 = _654 + _652;
    float _668 = -_130;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    float _672 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _546);
    float _674 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _656);
    float _676 = fma(_648, _634, _664);
    float _678 = _618;
    float _680 = _648;
    float _682 = _616;
    float _684 = _620;
    if (!_640)
    {
        float _686 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _618);
        _678 = _686;
    }
    float _688 = _678;
    float _690 = fma(_660, _650, _670);
    float _692 = -_674;
    float _694 = fma(_672, _584, _692);
    float _696 = _694;
    if (!_658)
    {
        _680 = _544;
    }
    float _698 = _680;
    float _700 = _698;
    if (!_658)
    {
        _554 = _666;
    }
    float _702 = _554;
    bool _704 = !_658;
    float _706 = _702;
    if (!_704)
    {
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _712 = _622 + _710;
        float _714 = rsqrt(_590);
        float _716 = _712 * _708;
        float _718 = _666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _720 = _716 * 0.15915493667125701904296875;
        float _722 = _720 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _720 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = fma(_724, _718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _732 = _714 * _730;
        float _734 = fma(_550, _732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _736 = _728 + (-1.0);
        float _738 = fma(_566, _732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _742 = _734 + _740;
        float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _748 = _738 + _746;
        float _750 = _742 * _742;
        float _752 = fma(_666, _728, _744);
        float _754 = _748 * _748;
        _706 = _752;
        _574 = _750;
        _592 = _754;
        _556 = _734;
        _700 = _738;
    }
    float _756 = _706;
    float _758 = _574;
    float _760 = _592;
    float _762 = _556;
    float _764 = _700;
    if (!_640)
    {
        float _766 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _616);
        _682 = _766;
    }
    float _768 = _682;
    float _770 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _772 = _756 + _770;
    float _774 = in.m_51.w;
    float _776 = _688 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _778 = _688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _780 = fma(_772, _772, _758);
    float _782 = _688 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[8].x, _776);
    float _786 = _780 + _760;
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[9].x, _778);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[10].x, _782);
    float _792 = sqrt(_786);
    float _794 = _768;
    if (!_640)
    {
        float _796 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _620);
        _684 = _796;
    }
    float _798 = _684;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _808 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _452 + 0.5;
    float _816 = _676 + 0.5;
    float _818 = _690 + 0.5;
    float _820 = _694 + 0.5;
    float _822 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].z, _784);
    float _824 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].z, _788);
    float _826 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _790);
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    out.m_63.w = _806;
    bool _828 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _830 = isnan(_792);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _836 = _832 || _834;
    out.m_65.w = _474;
    out.m_67.w = _774;
    out.m_69.x = _816;
    out.m_69.y = _814;
    out.m_69.z = _818;
    out.m_69.w = _820;
    float _838 = _810;
    float _840 = _816;
    if (!_836)
    {
        _794 = 1.0;
    }
    float _842 = _794;
    out.m_71.x = _822;
    out.m_71.y = _824;
    out.m_71.z = _826;
    bool _844 = !_836;
    float _846 = _842;
    if (!_844)
    {
        bool _848 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _850 = isnan(_792);
        bool _852 = _848 || _850;
        bool _854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _856 = _852 || _854;
        if (!_856)
        {
            float _858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _860 = _792 + _858;
            float _862 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _864 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _862;
            float _866 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _868 = _866 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _870 = 1.0 / _864;
            float _872 = _860 * _870;
            float _874 = fma(_872, _868, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _846 = _874;
            _876 = true;
        }
        else
        {
            bool _878 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _880 = isnan(_792);
            bool _882 = _878 || _880;
            bool _884 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _886 = _882 || _884;
            if (!_886)
            {
                float _888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _890 = _792 + _888;
                float _892 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _894 = _892 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _896 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _898 = _896 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _900 = 1.0 / _894;
                float _902 = _890 * _900;
                float _904 = fma(_902, _898, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _846 = _904;
                _876 = true;
            }
            else
            {
                _846 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _876 = false;
    float _906 = _846;
    float _908 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _910 = _756 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _914 = _762 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _918 = _764 + _916;
    float _920 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _922 = fma(_914, _906, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _924 = fma(_918, _906, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _928 = _920 + _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _922 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _924 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_932, _932, _938);
    float _942 = fma(_936, _936, _940);
    float _944 = rsqrt(_942);
    float _946 = sqrt(_942);
    float _948 = _944 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _950 = _932 * _948;
    float _952 = _936 * _948;
    float _954 = _950 * _950;
    float _956 = _952 * _952;
    float _958 = _954 + _956;
    float _960 = sqrt(_958);
    bool _962 = _960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = _960 + _964;
    float _968 = _774;
    float _970 = _966;
    float _972 = _950;
    if (_962)
    {
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _968 = _974;
    }
    float _976 = _968;
    if (_962)
    {
        float _978 = rsqrt(_958);
        _838 = _978;
    }
    float _980 = _838;
    float _982 = _980;
    if (_962)
    {
        float _984 = _966 * _976;
        _970 = _984;
    }
    float _986 = _970;
    if (_962)
    {
        float _988 = _986 * 0.15915493667125701904296875;
        _840 = _988;
    }
    float _990 = _840;
    float _992 = _918;
    float _994 = _990;
    if (_962)
    {
        float _996 = _990 * 6.283185482025146484375;
        float _998 = sin(_996);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1004 = precise::max(0.0, _1002);
    float _1006 = _806;
    float _1008 = _1004;
    float _1010 = _1002;
    if (_962)
    {
        float _1012 = _990 * 6.283185482025146484375;
        float _1014 = cos(_1012);
        _1006 = _1014;
    }
    float _1016 = _1006;
    float _1018 = -_948;
    float _1020 = -_1004;
    float _1022 = fma(_928, _1018, _1020);
    if (_962)
    {
        float _1024 = _1022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1008 = _1024;
    }
    float _1026 = _1008;
    float _1028 = _1026;
    float _1030 = _1000;
    if (_962)
    {
        float _1032 = fma(_1000, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1028 = _1032;
    }
    float _1034 = _1028;
    float _1036 = _1034;
    if (!_962)
    {
        _1030 = _952;
    }
    float _1038 = _1030;
    float _1040 = _1038;
    if (_962)
    {
        float _1042 = _1016 + (-1.0);
        _1010 = _1042;
    }
    float _1044 = _1010;
    float _1046 = _1044;
    if (_962)
    {
        float _1048 = _980 * _1034;
        _696 = _1048;
    }
    float _1050 = _696;
    if (!_962)
    {
        _982 = _1022;
    }
    float _1052 = _982;
    float _1054 = _1052;
    if (_962)
    {
        float _1056 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _994 = _1056;
    }
    float _1058 = _994;
    if (_962)
    {
        float _1060 = _950 * _1050;
        _972 = _1060;
    }
    float _1062 = _972;
    if (!_962)
    {
        _1036 = _954;
    }
    float _1064 = _1036;
    float _1066 = _1064;
    if (_962)
    {
        float _1068 = _952 * _1050;
        _1040 = _1068;
    }
    float _1070 = _1040;
    if (_962)
    {
        float _1072 = fma(_1022, _1016, _1058);
        _1054 = _1072;
    }
    float _1074 = _1054;
    if (_962)
    {
        float _1076 = _1062 * _1062;
        _1066 = _1076;
    }
    float _1078 = _1066;
    if (!_962)
    {
        _1046 = _956;
    }
    float _1080 = _1046;
    float _1082 = _1080;
    if (_962)
    {
        float _1084 = _1070 * _1070;
        _1082 = _1084;
    }
    float _1086 = _1082;
    float _1088 = fma(_1074, _1074, _1078);
    float _1090 = _1088 + _1086;
    float _1092 = _920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1096 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1094);
    float _1098 = precise::clamp(_1096, 0.0, 1.0);
    float _1100 = _920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1102 = rsqrt(_1090);
    float _1104 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1106 = _920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1108 = -_1098;
    float _1110 = _1108 + 1.0;
    float _1112 = _920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1114 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1104);
    float _1116 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1106);
    float _1118 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1100);
    float _1120 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1112);
    float _1122 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1124 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1116);
    float _1126 = abs(_1110);
    float _1128 = log2(_1126);
    float _1130 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1118);
    float _1132 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1120);
    float _1134 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1136 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1138 = _1102 * _1062;
    float _1140 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1142 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1146 = _1102 * _1074;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1150 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1152 = _1102 * _1070;
    float _1154 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1156 = -_1148;
    float _1158 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1156);
    float _1160 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1150);
    float _1162 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1164 = -_1154;
    float _1166 = fma(_1164, _1136, 1.0);
    float _1168 = -_1152;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1158);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1174 = exp2(_1162);
    float _1176 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1178 = fma(_1170, -0.5, 0.5);
    float _1180 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1182 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1176);
    float _1184 = fma(_1170, 0.5, 0.5);
    float _1186 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1180);
    float _1188 = log2(_1166);
    float _1190 = _1146 + 1.0;
    float _1192 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1194 = fma(_1184, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1196 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1198 = fma(_1184, _1194, -0.212114393711090087890625);
    float _1200 = 1.0 / _1172;
    float _1202 = -_1146;
    float _1204 = fma(_1174, _1190, _1202);
    float _1206 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1192);
    float _1208 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1196);
    float _1210 = fma(_1184, _1198, 1.570728778839111328125);
    float _1212 = sqrt(_1178);
    float _1214 = _1188 * 0.693147182464599609375;
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1218 = fma(_1204, 0.5, 0.5);
    float _1220 = _1206 * _1200;
    float _1222 = _1208 * _1200;
    float _1224 = fma(_1220, 0.5, 0.5);
    float _1226 = fma(_1222, -0.5, 0.5);
    float _1228 = _1212 * 0.636619746685028076171875;
    float3 _3422 = float3(_1224, _1226, _1216);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3422, float3(0.0), isnan(_3422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3422, float3(0.0), isnan(_3422)), level(0.0)).x;
    float _1232 = -_1210;
    float _1234 = fma(_1228, _1232, 1.0);
    float3 _3438 = float3(_1224, _1226, _1216);
    float4 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3438, float3(0.0), isnan(_3438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3438, float3(0.0), isnan(_3438)), level(0.0)).xyzw;
    float _1239 = _1237.x;
    float _1241 = _1237.y;
    float _1243 = _1237.z;
    float _1245 = _1237.w;
    float2 _3455 = float2(_1234, _1218);
    float3 _1249 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3455, float2(0.0), isnan(_3455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3455, float2(0.0), isnan(_3455)), level(0.0)).xyz;
    float _1251 = _1249.x;
    float _1253 = _1249.y;
    float _1255 = _1249.z;
    float _1257 = _654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1259 = _654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1261 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1263 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1257);
    float _1265 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1259);
    bool _1267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan(0.5);
    bool _1275 = _1271 || _1273;
    float _1277 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1279 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1263);
    float _1281 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1265);
    float _1283 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1261);
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1287 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1289 = exp2(_1277);
    out.m_73.x = _932;
    out.m_73.y = _928;
    out.m_73.z = _936;
    float _1291 = _1287 + _1285;
    float _1293 = _1226;
    float _1295 = _1140;
    float _1297 = _1279;
    float _1299 = _1224;
    float _1301 = _1285;
    float _1303 = _1283;
    float _1305 = _1128;
    if (!_1275)
    {
        _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1307 = _1293;
    if (_1275)
    {
        _1295 = 1.0;
    }
    float _1309 = _1295;
    float _1311 = 1.0 / _1285;
    float _1313 = _1309;
    if (!_1275)
    {
        float _1315 = -_1307;
        float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1297 = _1317;
    }
    float _1319 = _1297;
    if (!_1275)
    {
        float _1321 = 1.0 / _1319;
        _1299 = _1321;
    }
    float _1323 = _1299;
    float _1325 = -_1289;
    float _1327 = _1325 + 1.0;
    float _1329 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1331 = _1291 * _1311;
    float _1333 = _1331 * 0.5;
    float _1335 = _1311;
    if (!_1275)
    {
        _1335 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1337 = _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    float _1343 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1283);
    float _1345 = _1337;
    if (!_1275)
    {
        float _1347 = -_1337;
        float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1301 = _1349;
    }
    float _1351 = _1301;
    if (_1275)
    {
        _1303 = 1.0;
    }
    float _1353 = _1303;
    float _1355 = 1.0 / _1341;
    float _1357 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1359 = _1172 * 0.5;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1208;
    out.gl_Position.z = _1357;
    out.gl_Position.w = _1172;
    float _1361 = _1216;
    float _1363 = _1353;
    if (!_1275)
    {
        float _1365 = 1.0 / _1351;
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1206 + _1172;
    float _1371 = _1369 * 0.5;
    if (!_1275)
    {
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1375 = -_1307;
        float _1377 = fma(_1355, _1373, _1375);
        _1305 = _1377;
    }
    float _1379 = _1305;
    float _1381 = _1379;
    if (!_1275)
    {
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1385 = -_1337;
        float _1387 = fma(_1355, _1383, _1385);
        _1345 = _1387;
    }
    float _1389 = _1345;
    if (!_1275)
    {
        float _1391 = _1379 * _1323;
        float _1393 = precise::clamp(_1391, 0.0, 1.0);
        _1381 = _1393;
    }
    float _1395 = _1381;
    if (!_1275)
    {
        float _1397 = _1389 * _1367;
        float _1399 = precise::clamp(_1397, 0.0, 1.0);
        _1313 = _1399;
    }
    float _1401 = _1313;
    if (!_1275)
    {
        float _1403 = -_1395;
        float _1405 = _1403 + 1.0;
        _1363 = _1405;
    }
    float _1407 = _1363;
    float _1409 = _1357 + _1172;
    float _1411 = _1401 * _1407;
    bool _1413 = _1401 > 0.0;
    bool _1415 = isnan(_1401);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = _1409 * 0.5;
    float _1425 = _1411 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1427 = fma(_1208, -0.5, _1359);
    bool _1429 = _1407 <= 0.0;
    bool _1431 = !_1421;
    bool _1433 = _1429 || _1431;
    float _1435 = _1425 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1371;
    out.m_75.y = _1427;
    out.m_75.z = _1423;
    out.m_75.w = _1172;
    out.m_47.x = _1435;
    float _1437 = _1329 * _1230;
    float _1439 = -_1329;
    float _1441 = _1439 + 1.0;
    float _1443 = _1245 * _1437;
    float _1445 = _1245 * _1441;
    float _1447 = _1255 * _1437;
    float _1449 = fma(_1251, _1443, _1239);
    float _1451 = fma(_1253, _1443, _1241);
    float _1453 = fma(_1245, _1447, _1243);
    out.m_77.x = _1449;
    out.m_77.y = _1451;
    out.m_77.z = _1453;
    out.m_77.w = _1445;
    if (!_1433)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1455 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1455;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _876 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    float _104 = as_type<float>(_96);
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1513 = as_type<float>(_112);
        out.gl_Position.z = _1513;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_96);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1582 = as_type<float>(_148);
        out.gl_Position.z = _1582;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    float _162 = in.m_55.w;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _172 = in.m_57.x;
    float _174 = in.m_59.w;
    float _176 = _152 * 6.283185482025146484375;
    float _178 = fma(_150, 8.0, _176);
    float _180 = _158 * 0.20000000298023223876953125;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _184 = _182 != 0;
    float _186 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _178);
    float _188 = _180 * _180;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _192 = _190 != 0;
    float _194 = _186 * 0.15915493667125701904296875;
    float _196 = fma(_156, _156, _188);
    bool _198 = _162 > 0.5;
    float _200 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _170);
    float _202 = _194 * 6.283185482025146484375;
    float _204 = sin(_202);
    float _206 = fma(_160, _160, _196);
    bool _208 = _168 > 0.5;
    float _210 = in.m_59.x;
    float _212 = in.m_59.y;
    float _214 = in.m_59.z;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _218 = _216 != 0;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _222 = _220 != 0;
    float _224 = 0.0;
    bool _226 = _208;
    float _228 = _154;
    float _230 = _172;
    if (_192)
    {
        float _232 = in.m_55.z;
        _224 = _232;
    }
    float _234 = _224;
    float _236 = rsqrt(_206);
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _240 = _238 != 0;
    float _242 = _236 * _204;
    float _244 = fma(_150, 0.5, 0.5);
    float _246 = in.m_57.y;
    float _248 = _242 * 0.01200000010430812835693359375;
    float _250 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _254 = _244 * _248;
    float _256 = _244;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _260 = _240;
    if (_184)
    {
        float _262 = in.m_55.x;
        _256 = _262;
    }
    float _264 = _256;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _268 = fma(_156, _254, _156);
    float _270 = fma(_160, _254, _160);
    float _272 = _156;
    if (!_240)
    {
        float _274 = in.m_55.z;
        _272 = _274;
    }
    float _276 = _272;
    float _278 = fma(_180, _254, _158);
    float _280 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _284 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _286 = -_266;
    float _288 = fma(_282, 2.0, _286);
    float _290 = fma(_284, -2.0, _164);
    float _292 = in.m_44.x;
    float _294 = in.m_44.y;
    float _296 = in.m_44.z;
    float _298 = -_246;
    float _300 = _298 + 1.0;
    int _302 = _208 ? as_type<int>(_300) : as_type<int>(_246);
    float _304 = _246;
    if (_184)
    {
        bool _306 = _264 > 0.5;
        _226 = _306;
    }
    bool _308 = _226;
    float _310 = in.m_49.x;
    float _312 = in.m_49.y;
    float _314 = in.m_49.z;
    float _316 = _218 ? as_type<float>(_302) : _246;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _320 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _324 = _320 || _322;
    bool _326 = isnan(1.0);
    bool _328 = _324 || _326;
    float _330 = 0.0;
    float _332 = _276;
    float _334 = _318;
    if (!_240)
    {
        _330 = _276;
    }
    float _336 = _330;
    float _338 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _318);
    float _340 = _336;
    if (!_240)
    {
        _258 = _168;
    }
    float _342 = _258;
    float _344 = _342;
    if (_240)
    {
        _340 = _168;
    }
    float _346 = _340;
    if (_240)
    {
        _332 = _168;
    }
    float _348 = _332;
    float _350 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _352 = _350;
    if (_240)
    {
        _344 = _166;
    }
    float _354 = _344;
    float _356 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_192)
    {
        bool _358 = _234 > 0.5;
        _260 = _358;
    }
    bool _360 = _260;
    if (!_328)
    {
        float _362 = _350 * _350;
        float _364 = _362 * 0.5;
        _228 = _364;
    }
    float _366 = _228;
    float _368 = _366;
    if (!_184)
    {
        _334 = _172;
    }
    float _370 = _334;
    float _372 = fma(_356, _316, -0.5);
    float _374 = _370;
    if (!_328)
    {
        float _376 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _368 = _376;
    }
    float _378 = _368;
    bool _380 = !_328;
    float _382 = _378;
    if (!_380)
    {
        float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _386 = log2(_384);
        float _388 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _390 = _388 + 1.0;
        float _392 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _394 = _350 * _386;
        float _396 = 1.0 / _390;
        float _398 = _392 * 0.693147182464599609375;
        float _400 = exp2(_394);
        float _402 = 1.0 / _398;
        float _404 = _400 + (-1.0);
        float _406 = -_404;
        float _408 = fma(_406, _402, _350);
        float _410 = _408 * _396;
        float _412 = _410 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _412;
    }
    float _414 = _382;
    bool _416 = !_328;
    if (!_416)
    {
        float _418 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = log2(_418);
        float _422 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _424 = _422 + 1.0;
        float _426 = 1.0 / _424;
        float _428 = _350 * _420;
        float _430 = exp2(_428);
        float _432 = -_430;
        float _434 = _432 + 1.0;
        float _436 = _434 * _426;
        _352 = _436;
    }
    float _438 = _352;
    float _440 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _200);
    float _442 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _290);
    if (_222)
    {
        float _444 = _198 ? _300 : _246;
        _304 = _444;
    }
    float _446 = _304;
    float _448 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _450 = -_442;
    float _452 = fma(_440, _372, _450);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _456 = fma(_438, _310, _448);
    float _458 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _460 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _462 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].z, _454);
    float _464 = _354 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _466 = fma(_438, _312, _458);
    float _468 = fma(_438, _314, _460);
    float _470 = fma(_456, _174, _292);
    float _472 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _476 = fma(_466, _174, _294);
    float _478 = fma(_468, _174, _296);
    float _480 = _250 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = _474 * _270;
    float _484 = _474 * _278;
    float _486 = _474 * _268;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _482);
    float _492 = _280 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _498 = _490 * _472;
    float _500 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = _494 * _492;
    float _504 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = _496 * _480;
    float _508 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = _502 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _512 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _514 = _502 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _516 = -_488;
    float _518 = fma(_464, 2.0, _516);
    float _520 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _524 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[8].x, _510);
    float _526 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _512);
    float _528 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[10].x, _514);
    float _530 = _520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _532 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[8].z, _524);
    float _534 = _526 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _536 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[10].z, _528);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _540 = _530 + _532;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _544 = _534 + _536;
    float _546 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _538);
    float _548 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _550 = _540 + _548;
    int _552 = as_type<int>(_532);
    float _554 = _484;
    float _556 = _540;
    if (_184)
    {
        float _558 = -_172;
        float _560 = _558 + 1.0;
        _552 = as_type<int>(_560);
    }
    int _562 = _552;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _566 = _544 + _564;
    float _568 = _522 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _570 = _550 * _550;
    int _572 = 0;
    float _574 = _570;
    if (_192)
    {
        float _576 = -_172;
        float _578 = _576 + 1.0;
        _572 = as_type<int>(_578);
    }
    int _580 = _572;
    float _582 = _566 * _566;
    float _584 = fma(_568, _446, -0.5);
    float _586 = _346 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _590 = _570 + _582;
    float _592 = _582;
    if (_184)
    {
        float _594 = _308 ? as_type<float>(_562) : _172;
        _374 = _594;
    }
    float _596 = _374;
    float _598 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_192)
    {
        float _600 = _360 ? as_type<float>(_580) : _172;
        _230 = _600;
    }
    float _602 = _230;
    float _604 = _542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _606 = _484 != 0.0;
    bool _608 = isnan(_484);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = in.m_61.x;
    float _618 = in.m_61.y;
    float _620 = in.m_61.z;
    float _622 = sqrt(_590);
    float _624 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    bool _626 = _486 == 0.0;
    bool _628 = !_614;
    bool _630 = _626 && _628;
    float _632 = _502 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _634 = fma(_604, _596, -0.5);
    float _636 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _624);
    bool _638 = _482 == 0.0;
    bool _640 = _638 && _630;
    float _642 = _588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _644 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[9].x, _632);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _648 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _338);
    float _650 = fma(_642, _602, -0.5);
    float _652 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[9].z, _644);
    float _654 = _636 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _656 = fma(_586, -2.0, _646);
    bool _658 = _622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _462);
    float _662 = -_130;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[76].x, _288);
    float _666 = _654 + _652;
    float _668 = -_130;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    float _672 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _546);
    float _674 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _656);
    float _676 = fma(_648, _634, _664);
    float _678 = _618;
    float _680 = _648;
    float _682 = _616;
    float _684 = _620;
    if (!_640)
    {
        float _686 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _618);
        _678 = _686;
    }
    float _688 = _678;
    float _690 = fma(_660, _650, _670);
    float _692 = -_674;
    float _694 = fma(_672, _584, _692);
    float _696 = _694;
    if (!_658)
    {
        _680 = _544;
    }
    float _698 = _680;
    float _700 = _698;
    if (!_658)
    {
        _554 = _666;
    }
    float _702 = _554;
    bool _704 = !_658;
    float _706 = _702;
    if (!_704)
    {
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _712 = _622 + _710;
        float _714 = rsqrt(_590);
        float _716 = _712 * _708;
        float _718 = _666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _720 = _716 * 0.15915493667125701904296875;
        float _722 = _720 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _720 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = fma(_724, _718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _732 = _714 * _730;
        float _734 = fma(_550, _732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _736 = _728 + (-1.0);
        float _738 = fma(_566, _732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _742 = _734 + _740;
        float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _748 = _738 + _746;
        float _750 = _742 * _742;
        float _752 = fma(_666, _728, _744);
        float _754 = _748 * _748;
        _706 = _752;
        _574 = _750;
        _592 = _754;
        _556 = _734;
        _700 = _738;
    }
    float _756 = _706;
    float _758 = _574;
    float _760 = _592;
    float _762 = _556;
    float _764 = _700;
    if (!_640)
    {
        float _766 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _616);
        _682 = _766;
    }
    float _768 = _682;
    float _770 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _772 = _756 + _770;
    float _774 = in.m_51.w;
    float _776 = _688 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _778 = _688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _780 = fma(_772, _772, _758);
    float _782 = _688 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[8].x, _776);
    float _786 = _780 + _760;
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[9].x, _778);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[10].x, _782);
    float _792 = sqrt(_786);
    float _794 = _768;
    if (!_640)
    {
        float _796 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _620);
        _684 = _796;
    }
    float _798 = _684;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _808 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _452 + 0.5;
    float _816 = _676 + 0.5;
    float _818 = _690 + 0.5;
    float _820 = _694 + 0.5;
    float _822 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].z, _784);
    float _824 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].z, _788);
    float _826 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _790);
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    out.m_63.w = _806;
    bool _828 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _830 = isnan(_792);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _836 = _832 || _834;
    out.m_65.w = _474;
    out.m_67.w = _774;
    out.m_69.x = _816;
    out.m_69.y = _814;
    out.m_69.z = _818;
    out.m_69.w = _820;
    float _838 = _810;
    float _840 = _816;
    if (!_836)
    {
        _794 = 1.0;
    }
    float _842 = _794;
    out.m_71.x = _822;
    out.m_71.y = _824;
    out.m_71.z = _826;
    bool _844 = !_836;
    float _846 = _842;
    if (!_844)
    {
        bool _848 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _850 = isnan(_792);
        bool _852 = _848 || _850;
        bool _854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _856 = _852 || _854;
        if (!_856)
        {
            float _858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _860 = _792 + _858;
            float _862 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _864 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _862;
            float _866 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _868 = _866 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _870 = 1.0 / _864;
            float _872 = _860 * _870;
            float _874 = fma(_872, _868, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _846 = _874;
            _876 = true;
        }
        else
        {
            bool _878 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _880 = isnan(_792);
            bool _882 = _878 || _880;
            bool _884 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _886 = _882 || _884;
            if (!_886)
            {
                float _888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _890 = _792 + _888;
                float _892 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _894 = _892 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _896 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _898 = _896 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _900 = 1.0 / _894;
                float _902 = _890 * _900;
                float _904 = fma(_902, _898, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _846 = _904;
                _876 = true;
            }
            else
            {
                _846 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _876 = false;
    float _906 = _846;
    float _908 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _910 = _756 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _914 = _762 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _918 = _764 + _916;
    float _920 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _922 = fma(_914, _906, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _924 = fma(_918, _906, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _928 = _920 + _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _922 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _924 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_932, _932, _938);
    float _942 = fma(_936, _936, _940);
    float _944 = rsqrt(_942);
    float _946 = sqrt(_942);
    float _948 = _944 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _950 = _932 * _948;
    float _952 = _936 * _948;
    float _954 = _950 * _950;
    float _956 = _952 * _952;
    float _958 = _954 + _956;
    float _960 = sqrt(_958);
    bool _962 = _960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = _960 + _964;
    float _968 = _774;
    float _970 = _966;
    float _972 = _950;
    if (_962)
    {
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _968 = _974;
    }
    float _976 = _968;
    if (_962)
    {
        float _978 = rsqrt(_958);
        _838 = _978;
    }
    float _980 = _838;
    float _982 = _980;
    if (_962)
    {
        float _984 = _966 * _976;
        _970 = _984;
    }
    float _986 = _970;
    if (_962)
    {
        float _988 = _986 * 0.15915493667125701904296875;
        _840 = _988;
    }
    float _990 = _840;
    float _992 = _918;
    float _994 = _990;
    if (_962)
    {
        float _996 = _990 * 6.283185482025146484375;
        float _998 = sin(_996);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1004 = precise::max(0.0, _1002);
    float _1006 = _806;
    float _1008 = _1004;
    float _1010 = _1002;
    if (_962)
    {
        float _1012 = _990 * 6.283185482025146484375;
        float _1014 = cos(_1012);
        _1006 = _1014;
    }
    float _1016 = _1006;
    float _1018 = -_948;
    float _1020 = -_1004;
    float _1022 = fma(_928, _1018, _1020);
    if (_962)
    {
        float _1024 = _1022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1008 = _1024;
    }
    float _1026 = _1008;
    float _1028 = _1026;
    float _1030 = _1000;
    if (_962)
    {
        float _1032 = fma(_1000, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1028 = _1032;
    }
    float _1034 = _1028;
    float _1036 = _1034;
    if (!_962)
    {
        _1030 = _952;
    }
    float _1038 = _1030;
    float _1040 = _1038;
    if (_962)
    {
        float _1042 = _1016 + (-1.0);
        _1010 = _1042;
    }
    float _1044 = _1010;
    float _1046 = _1044;
    if (_962)
    {
        float _1048 = _980 * _1034;
        _696 = _1048;
    }
    float _1050 = _696;
    if (!_962)
    {
        _982 = _1022;
    }
    float _1052 = _982;
    float _1054 = _1052;
    if (_962)
    {
        float _1056 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _994 = _1056;
    }
    float _1058 = _994;
    if (_962)
    {
        float _1060 = _950 * _1050;
        _972 = _1060;
    }
    float _1062 = _972;
    if (!_962)
    {
        _1036 = _954;
    }
    float _1064 = _1036;
    float _1066 = _1064;
    if (_962)
    {
        float _1068 = _952 * _1050;
        _1040 = _1068;
    }
    float _1070 = _1040;
    if (_962)
    {
        float _1072 = fma(_1022, _1016, _1058);
        _1054 = _1072;
    }
    float _1074 = _1054;
    if (_962)
    {
        float _1076 = _1062 * _1062;
        _1066 = _1076;
    }
    float _1078 = _1066;
    if (!_962)
    {
        _1046 = _956;
    }
    float _1080 = _1046;
    float _1082 = _1080;
    if (_962)
    {
        float _1084 = _1070 * _1070;
        _1082 = _1084;
    }
    float _1086 = _1082;
    float _1088 = fma(_1074, _1074, _1078);
    float _1090 = _1088 + _1086;
    float _1092 = _920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1096 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1094);
    float _1098 = precise::clamp(_1096, 0.0, 1.0);
    float _1100 = _920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1102 = rsqrt(_1090);
    float _1104 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1106 = _920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1108 = -_1098;
    float _1110 = _1108 + 1.0;
    float _1112 = _920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1114 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1104);
    float _1116 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1106);
    float _1118 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1100);
    float _1120 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1112);
    float _1122 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1124 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1116);
    float _1126 = abs(_1110);
    float _1128 = log2(_1126);
    float _1130 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1118);
    float _1132 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1120);
    float _1134 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1136 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1138 = _1102 * _1062;
    float _1140 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1142 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1146 = _1102 * _1074;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1150 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1152 = _1102 * _1070;
    float _1154 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1156 = -_1148;
    float _1158 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1156);
    float _1160 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1150);
    float _1162 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1164 = -_1154;
    float _1166 = fma(_1164, _1136, 1.0);
    float _1168 = -_1152;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1158);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1174 = exp2(_1162);
    float _1176 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1178 = fma(_1170, -0.5, 0.5);
    float _1180 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1182 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1176);
    float _1184 = fma(_1170, 0.5, 0.5);
    float _1186 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1180);
    float _1188 = log2(_1166);
    float _1190 = _1146 + 1.0;
    float _1192 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1194 = fma(_1184, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1196 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1198 = fma(_1184, _1194, -0.212114393711090087890625);
    float _1200 = 1.0 / _1172;
    float _1202 = -_1146;
    float _1204 = fma(_1174, _1190, _1202);
    float _1206 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1192);
    float _1208 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1196);
    float _1210 = fma(_1184, _1198, 1.570728778839111328125);
    float _1212 = sqrt(_1178);
    float _1214 = _1188 * 0.693147182464599609375;
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1218 = fma(_1204, 0.5, 0.5);
    float _1220 = _1206 * _1200;
    float _1222 = _1208 * _1200;
    float _1224 = fma(_1220, 0.5, 0.5);
    float _1226 = fma(_1222, -0.5, 0.5);
    float _1228 = _1212 * 0.636619746685028076171875;
    float3 _3422 = float3(_1224, _1226, _1216);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3422, float3(0.0), isnan(_3422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3422, float3(0.0), isnan(_3422)), level(0.0)).x;
    float _1232 = -_1210;
    float _1234 = fma(_1228, _1232, 1.0);
    float3 _3438 = float3(_1224, _1226, _1216);
    float4 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3438, float3(0.0), isnan(_3438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3438, float3(0.0), isnan(_3438)), level(0.0)).xyzw;
    float _1239 = _1237.x;
    float _1241 = _1237.y;
    float _1243 = _1237.z;
    float _1245 = _1237.w;
    float2 _3455 = float2(_1234, _1218);
    float3 _1249 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3455, float2(0.0), isnan(_3455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3455, float2(0.0), isnan(_3455)), level(0.0)).xyz;
    float _1251 = _1249.x;
    float _1253 = _1249.y;
    float _1255 = _1249.z;
    float _1257 = _654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1259 = _654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1261 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1263 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1257);
    float _1265 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1259);
    bool _1267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan(0.5);
    bool _1275 = _1271 || _1273;
    float _1277 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1279 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1263);
    float _1281 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1265);
    float _1283 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1261);
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1287 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1289 = exp2(_1277);
    out.m_73.x = _932;
    out.m_73.y = _928;
    out.m_73.z = _936;
    float _1291 = _1287 + _1285;
    float _1293 = _1226;
    float _1295 = _1140;
    float _1297 = _1279;
    float _1299 = _1224;
    float _1301 = _1285;
    float _1303 = _1283;
    float _1305 = _1128;
    if (!_1275)
    {
        _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1307 = _1293;
    if (_1275)
    {
        _1295 = 1.0;
    }
    float _1309 = _1295;
    float _1311 = 1.0 / _1285;
    float _1313 = _1309;
    if (!_1275)
    {
        float _1315 = -_1307;
        float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1297 = _1317;
    }
    float _1319 = _1297;
    if (!_1275)
    {
        float _1321 = 1.0 / _1319;
        _1299 = _1321;
    }
    float _1323 = _1299;
    float _1325 = -_1289;
    float _1327 = _1325 + 1.0;
    float _1329 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1331 = _1291 * _1311;
    float _1333 = _1331 * 0.5;
    float _1335 = _1311;
    if (!_1275)
    {
        _1335 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1337 = _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    float _1343 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1283);
    float _1345 = _1337;
    if (!_1275)
    {
        float _1347 = -_1337;
        float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1301 = _1349;
    }
    float _1351 = _1301;
    if (_1275)
    {
        _1303 = 1.0;
    }
    float _1353 = _1303;
    float _1355 = 1.0 / _1341;
    float _1357 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1359 = _1172 * 0.5;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1208;
    out.gl_Position.z = _1357;
    out.gl_Position.w = _1172;
    float _1361 = _1216;
    float _1363 = _1353;
    if (!_1275)
    {
        float _1365 = 1.0 / _1351;
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1206 + _1172;
    float _1371 = _1369 * 0.5;
    if (!_1275)
    {
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1375 = -_1307;
        float _1377 = fma(_1355, _1373, _1375);
        _1305 = _1377;
    }
    float _1379 = _1305;
    float _1381 = _1379;
    if (!_1275)
    {
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1385 = -_1337;
        float _1387 = fma(_1355, _1383, _1385);
        _1345 = _1387;
    }
    float _1389 = _1345;
    if (!_1275)
    {
        float _1391 = _1379 * _1323;
        float _1393 = precise::clamp(_1391, 0.0, 1.0);
        _1381 = _1393;
    }
    float _1395 = _1381;
    if (!_1275)
    {
        float _1397 = _1389 * _1367;
        float _1399 = precise::clamp(_1397, 0.0, 1.0);
        _1313 = _1399;
    }
    float _1401 = _1313;
    if (!_1275)
    {
        float _1403 = -_1395;
        float _1405 = _1403 + 1.0;
        _1363 = _1405;
    }
    float _1407 = _1363;
    float _1409 = _1357 + _1172;
    float _1411 = _1401 * _1407;
    bool _1413 = _1401 > 0.0;
    bool _1415 = isnan(_1401);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = _1409 * 0.5;
    float _1425 = _1411 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1427 = fma(_1208, -0.5, _1359);
    bool _1429 = _1407 <= 0.0;
    bool _1431 = !_1421;
    bool _1433 = _1429 || _1431;
    float _1435 = _1425 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1371;
    out.m_75.y = _1427;
    out.m_75.z = _1423;
    out.m_75.w = _1172;
    out.m_47.x = _1435;
    float _1437 = _1329 * _1230;
    float _1439 = -_1329;
    float _1441 = _1439 + 1.0;
    float _1443 = _1245 * _1437;
    float _1445 = _1245 * _1441;
    float _1447 = _1255 * _1437;
    float _1449 = fma(_1251, _1443, _1239);
    float _1451 = fma(_1253, _1443, _1241);
    float _1453 = fma(_1245, _1447, _1243);
    out.m_77.x = _1449;
    out.m_77.y = _1451;
    out.m_77.z = _1453;
    out.m_77.w = _1445;
    if (!_1433)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1455 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1455;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _876 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_44.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    float _104 = as_type<float>(_96);
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _106 = _102;
    if (!_100)
    {
        out.m_47.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _106 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1513 = as_type<float>(_112);
        out.gl_Position.z = _1513;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_49.w;
    bool _118 = _116 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = -_116;
    float _130 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_126)
    {
        float _132 = float(_96);
        _104 = _132;
    }
    float _134 = _104;
    bool _136 = _130 >= _134;
    bool _138 = !_126;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_47.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _114 = as_type<int>(_146);
    }
    int _148 = _114;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1582 = as_type<float>(_148);
        out.gl_Position.z = _1582;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_51.x;
    float _152 = in.m_51.y;
    float _154 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _156 = in.m_53.x;
    float _158 = in.m_53.y;
    float _160 = in.m_53.z;
    float _162 = in.m_55.w;
    float _164 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _166 = in.m_55.x;
    float _168 = in.m_55.y;
    float _170 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _172 = in.m_57.x;
    float _174 = in.m_59.w;
    float _176 = _152 * 6.283185482025146484375;
    float _178 = fma(_150, 8.0, _176);
    float _180 = _158 * 0.20000000298023223876953125;
    int _182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _184 = _182 != 0;
    float _186 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.3300000131130218505859375, _178);
    float _188 = _180 * _180;
    int _190 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _192 = _190 != 0;
    float _194 = _186 * 0.15915493667125701904296875;
    float _196 = fma(_156, _156, _188);
    bool _198 = _162 > 0.5;
    float _200 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[78].w, _170);
    float _202 = _194 * 6.283185482025146484375;
    float _204 = sin(_202);
    float _206 = fma(_160, _160, _196);
    bool _208 = _168 > 0.5;
    float _210 = in.m_59.x;
    float _212 = in.m_59.y;
    float _214 = in.m_59.z;
    int _216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _218 = _216 != 0;
    int _220 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _222 = _220 != 0;
    float _224 = 0.0;
    bool _226 = _208;
    float _228 = _154;
    float _230 = _172;
    if (_192)
    {
        float _232 = in.m_55.z;
        _224 = _232;
    }
    float _234 = _224;
    float _236 = rsqrt(_206);
    int _238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _240 = _238 != 0;
    float _242 = _236 * _204;
    float _244 = fma(_150, 0.5, 0.5);
    float _246 = in.m_57.y;
    float _248 = _242 * 0.01200000010430812835693359375;
    float _250 = _210 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = _214 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _254 = _244 * _248;
    float _256 = _244;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    bool _260 = _240;
    if (_184)
    {
        float _262 = in.m_55.x;
        _256 = _262;
    }
    float _264 = _256;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _268 = fma(_156, _254, _156);
    float _270 = fma(_160, _254, _160);
    float _272 = _156;
    if (!_240)
    {
        float _274 = in.m_55.z;
        _272 = _274;
    }
    float _276 = _272;
    float _278 = fma(_180, _254, _158);
    float _280 = _212 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _282 = _166 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _284 = _168 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _286 = -_266;
    float _288 = fma(_282, 2.0, _286);
    float _290 = fma(_284, -2.0, _164);
    float _292 = in.m_44.x;
    float _294 = in.m_44.y;
    float _296 = in.m_44.z;
    float _298 = -_246;
    float _300 = _298 + 1.0;
    int _302 = _208 ? as_type<int>(_300) : as_type<int>(_246);
    float _304 = _246;
    if (_184)
    {
        bool _306 = _264 > 0.5;
        _226 = _306;
    }
    bool _308 = _226;
    float _310 = in.m_49.x;
    float _312 = in.m_49.y;
    float _314 = in.m_49.z;
    float _316 = _218 ? as_type<float>(_302) : _246;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _320 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _324 = _320 || _322;
    bool _326 = isnan(1.0);
    bool _328 = _324 || _326;
    float _330 = 0.0;
    float _332 = _276;
    float _334 = _318;
    if (!_240)
    {
        _330 = _276;
    }
    float _336 = _330;
    float _338 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[78].z, _318);
    float _340 = _336;
    if (!_240)
    {
        _258 = _168;
    }
    float _342 = _258;
    float _344 = _342;
    if (_240)
    {
        _340 = _168;
    }
    float _346 = _340;
    if (_240)
    {
        _332 = _168;
    }
    float _348 = _332;
    float _350 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _352 = _350;
    if (_240)
    {
        _344 = _166;
    }
    float _354 = _344;
    float _356 = _154 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_192)
    {
        bool _358 = _234 > 0.5;
        _260 = _358;
    }
    bool _360 = _260;
    if (!_328)
    {
        float _362 = _350 * _350;
        float _364 = _362 * 0.5;
        _228 = _364;
    }
    float _366 = _228;
    float _368 = _366;
    if (!_184)
    {
        _334 = _172;
    }
    float _370 = _334;
    float _372 = fma(_356, _316, -0.5);
    float _374 = _370;
    if (!_328)
    {
        float _376 = _366 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _368 = _376;
    }
    float _378 = _368;
    bool _380 = !_328;
    float _382 = _378;
    if (!_380)
    {
        float _384 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _386 = log2(_384);
        float _388 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _390 = _388 + 1.0;
        float _392 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _394 = _350 * _386;
        float _396 = 1.0 / _390;
        float _398 = _392 * 0.693147182464599609375;
        float _400 = exp2(_394);
        float _402 = 1.0 / _398;
        float _404 = _400 + (-1.0);
        float _406 = -_404;
        float _408 = fma(_406, _402, _350);
        float _410 = _408 * _396;
        float _412 = _410 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _382 = _412;
    }
    float _414 = _382;
    bool _416 = !_328;
    if (!_416)
    {
        float _418 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _420 = log2(_418);
        float _422 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _424 = _422 + 1.0;
        float _426 = 1.0 / _424;
        float _428 = _350 * _420;
        float _430 = exp2(_428);
        float _432 = -_430;
        float _434 = _432 + 1.0;
        float _436 = _434 * _426;
        _352 = _436;
    }
    float _438 = _352;
    float _440 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _200);
    float _442 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _290);
    if (_222)
    {
        float _444 = _198 ? _300 : _246;
        _304 = _444;
    }
    float _446 = _304;
    float _448 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _450 = -_442;
    float _452 = fma(_440, _372, _450);
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _456 = fma(_438, _310, _448);
    float _458 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _460 = _414 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _462 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[83].z, _454);
    float _464 = _354 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _466 = fma(_438, _312, _458);
    float _468 = fma(_438, _314, _460);
    float _470 = fma(_456, _174, _292);
    float _472 = _252 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _476 = fma(_466, _174, _294);
    float _478 = fma(_468, _174, _296);
    float _480 = _250 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _482 = _474 * _270;
    float _484 = _474 * _278;
    float _486 = _474 * _268;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _482);
    float _492 = _280 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _494 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _484);
    float _496 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _486);
    float _498 = _490 * _472;
    float _500 = _476 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _502 = _494 * _492;
    float _504 = _476 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _506 = _496 * _480;
    float _508 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[4].x, _500);
    float _510 = _502 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _512 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[6].x, _504);
    float _514 = _502 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _516 = -_488;
    float _518 = fma(_464, 2.0, _516);
    float _520 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[4].z, _508);
    float _522 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _524 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[8].x, _510);
    float _526 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[6].z, _512);
    float _528 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[10].x, _514);
    float _530 = _520 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _532 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[8].z, _524);
    float _534 = _526 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _536 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[10].z, _528);
    float _538 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _540 = _530 + _532;
    float _542 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _544 = _534 + _536;
    float _546 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[83].w, _538);
    float _548 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _550 = _540 + _548;
    int _552 = as_type<int>(_532);
    float _554 = _484;
    float _556 = _540;
    if (_184)
    {
        float _558 = -_172;
        float _560 = _558 + 1.0;
        _552 = as_type<int>(_560);
    }
    int _562 = _552;
    float _564 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _566 = _544 + _564;
    float _568 = _522 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _570 = _550 * _550;
    int _572 = 0;
    float _574 = _570;
    if (_192)
    {
        float _576 = -_172;
        float _578 = _576 + 1.0;
        _572 = as_type<int>(_578);
    }
    int _580 = _572;
    float _582 = _566 * _566;
    float _584 = fma(_568, _446, -0.5);
    float _586 = _346 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _590 = _570 + _582;
    float _592 = _582;
    if (_184)
    {
        float _594 = _308 ? as_type<float>(_562) : _172;
        _374 = _594;
    }
    float _596 = _374;
    float _598 = _476 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    if (_192)
    {
        float _600 = _360 ? as_type<float>(_580) : _172;
        _230 = _600;
    }
    float _602 = _230;
    float _604 = _542 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _606 = _484 != 0.0;
    bool _608 = isnan(_484);
    bool _610 = _606 || _608;
    bool _612 = isnan(0.0);
    bool _614 = _610 || _612;
    float _616 = in.m_61.x;
    float _618 = in.m_61.y;
    float _620 = in.m_61.z;
    float _622 = sqrt(_590);
    float _624 = fma(_470, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    bool _626 = _486 == 0.0;
    bool _628 = !_614;
    bool _630 = _626 && _628;
    float _632 = _502 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _634 = fma(_604, _596, -0.5);
    float _636 = fma(_478, (*spvDescriptorSet0.vp_c10)._m0[5].z, _624);
    bool _638 = _482 == 0.0;
    bool _640 = _638 && _630;
    float _642 = _588 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _644 = fma(_506, (*spvDescriptorSet0.vp_c10)._m0[9].x, _632);
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _648 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _338);
    float _650 = fma(_642, _602, -0.5);
    float _652 = fma(_498, (*spvDescriptorSet0.vp_c10)._m0[9].z, _644);
    float _654 = _636 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _656 = fma(_586, -2.0, _646);
    bool _658 = _622 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _660 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _462);
    float _662 = -_130;
    float _664 = fma(_662, (*spvDescriptorSet0.vp_c9)._m0[76].x, _288);
    float _666 = _654 + _652;
    float _668 = -_130;
    float _670 = fma(_668, (*spvDescriptorSet0.vp_c9)._m0[81].x, _518);
    float _672 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _546);
    float _674 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _656);
    float _676 = fma(_648, _634, _664);
    float _678 = _618;
    float _680 = _648;
    float _682 = _616;
    float _684 = _620;
    if (!_640)
    {
        float _686 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[17].y, _618);
        _678 = _686;
    }
    float _688 = _678;
    float _690 = fma(_660, _650, _670);
    float _692 = -_674;
    float _694 = fma(_672, _584, _692);
    float _696 = _694;
    if (!_658)
    {
        _680 = _544;
    }
    float _698 = _680;
    float _700 = _698;
    if (!_658)
    {
        _554 = _666;
    }
    float _702 = _554;
    bool _704 = !_658;
    float _706 = _702;
    if (!_704)
    {
        float _708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _712 = _622 + _710;
        float _714 = rsqrt(_590);
        float _716 = _712 * _708;
        float _718 = _666 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _720 = _716 * 0.15915493667125701904296875;
        float _722 = _720 * 6.283185482025146484375;
        float _724 = sin(_722);
        float _726 = _720 * 6.283185482025146484375;
        float _728 = cos(_726);
        float _730 = fma(_724, _718, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _732 = _714 * _730;
        float _734 = fma(_550, _732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _736 = _728 + (-1.0);
        float _738 = fma(_566, _732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _740 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _742 = _734 + _740;
        float _744 = _736 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _748 = _738 + _746;
        float _750 = _742 * _742;
        float _752 = fma(_666, _728, _744);
        float _754 = _748 * _748;
        _706 = _752;
        _574 = _750;
        _592 = _754;
        _556 = _734;
        _700 = _738;
    }
    float _756 = _706;
    float _758 = _574;
    float _760 = _592;
    float _762 = _556;
    float _764 = _700;
    if (!_640)
    {
        float _766 = fma(_486, (*spvDescriptorSet0.vp_c9)._m0[17].y, _616);
        _682 = _766;
    }
    float _768 = _682;
    float _770 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _772 = _756 + _770;
    float _774 = in.m_51.w;
    float _776 = _688 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _778 = _688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _780 = fma(_772, _772, _758);
    float _782 = _688 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _784 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[8].x, _776);
    float _786 = _780 + _760;
    float _788 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[9].x, _778);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c10)._m0[10].x, _782);
    float _792 = sqrt(_786);
    float _794 = _768;
    if (!_640)
    {
        float _796 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[17].y, _620);
        _684 = _796;
    }
    float _798 = _684;
    float _800 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _804 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _808 = _800 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _810 = _802 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _812 = _804 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _814 = _452 + 0.5;
    float _816 = _676 + 0.5;
    float _818 = _690 + 0.5;
    float _820 = _694 + 0.5;
    float _822 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[8].z, _784);
    float _824 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[9].z, _788);
    float _826 = fma(_798, (*spvDescriptorSet0.vp_c10)._m0[10].z, _790);
    out.m_63.x = _808;
    out.m_63.y = _810;
    out.m_63.z = _812;
    out.m_63.w = _806;
    bool _828 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _830 = isnan(_792);
    bool _832 = _828 || _830;
    bool _834 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _836 = _832 || _834;
    out.m_65.w = _474;
    out.m_67.w = _774;
    out.m_69.x = _816;
    out.m_69.y = _814;
    out.m_69.z = _818;
    out.m_69.w = _820;
    float _838 = _810;
    float _840 = _816;
    if (!_836)
    {
        _794 = 1.0;
    }
    float _842 = _794;
    out.m_71.x = _822;
    out.m_71.y = _824;
    out.m_71.z = _826;
    bool _844 = !_836;
    float _846 = _842;
    if (!_844)
    {
        bool _848 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _850 = isnan(_792);
        bool _852 = _848 || _850;
        bool _854 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _856 = _852 || _854;
        if (!_856)
        {
            float _858 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _860 = _792 + _858;
            float _862 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _864 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _862;
            float _866 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _868 = _866 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _870 = 1.0 / _864;
            float _872 = _860 * _870;
            float _874 = fma(_872, _868, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _846 = _874;
            _876 = true;
        }
        else
        {
            bool _878 = _792 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _880 = isnan(_792);
            bool _882 = _878 || _880;
            bool _884 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _886 = _882 || _884;
            if (!_886)
            {
                float _888 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _890 = _792 + _888;
                float _892 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _894 = _892 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _896 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _898 = _896 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _900 = 1.0 / _894;
                float _902 = _890 * _900;
                float _904 = fma(_902, _898, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _846 = _904;
                _876 = true;
            }
            else
            {
                _846 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _876 = false;
    float _906 = _846;
    float _908 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _910 = _756 + _908;
    float _912 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _914 = _762 + _912;
    float _916 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _918 = _764 + _916;
    float _920 = fma(_910, _906, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _922 = fma(_914, _906, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _924 = fma(_918, _906, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _926 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _928 = _920 + _926;
    float _930 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _932 = _922 + _930;
    float _934 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _936 = _924 + _934;
    float _938 = _928 * _928;
    float _940 = fma(_932, _932, _938);
    float _942 = fma(_936, _936, _940);
    float _944 = rsqrt(_942);
    float _946 = sqrt(_942);
    float _948 = _944 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _950 = _932 * _948;
    float _952 = _936 * _948;
    float _954 = _950 * _950;
    float _956 = _952 * _952;
    float _958 = _954 + _956;
    float _960 = sqrt(_958);
    bool _962 = _960 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _964 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _966 = _960 + _964;
    float _968 = _774;
    float _970 = _966;
    float _972 = _950;
    if (_962)
    {
        float _974 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _968 = _974;
    }
    float _976 = _968;
    if (_962)
    {
        float _978 = rsqrt(_958);
        _838 = _978;
    }
    float _980 = _838;
    float _982 = _980;
    if (_962)
    {
        float _984 = _966 * _976;
        _970 = _984;
    }
    float _986 = _970;
    if (_962)
    {
        float _988 = _986 * 0.15915493667125701904296875;
        _840 = _988;
    }
    float _990 = _840;
    float _992 = _918;
    float _994 = _990;
    if (_962)
    {
        float _996 = _990 * 6.283185482025146484375;
        float _998 = sin(_996);
        _992 = _998;
    }
    float _1000 = _992;
    float _1002 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1004 = precise::max(0.0, _1002);
    float _1006 = _806;
    float _1008 = _1004;
    float _1010 = _1002;
    if (_962)
    {
        float _1012 = _990 * 6.283185482025146484375;
        float _1014 = cos(_1012);
        _1006 = _1014;
    }
    float _1016 = _1006;
    float _1018 = -_948;
    float _1020 = -_1004;
    float _1022 = fma(_928, _1018, _1020);
    if (_962)
    {
        float _1024 = _1022 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1008 = _1024;
    }
    float _1026 = _1008;
    float _1028 = _1026;
    float _1030 = _1000;
    if (_962)
    {
        float _1032 = fma(_1000, _1026, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1028 = _1032;
    }
    float _1034 = _1028;
    float _1036 = _1034;
    if (!_962)
    {
        _1030 = _952;
    }
    float _1038 = _1030;
    float _1040 = _1038;
    if (_962)
    {
        float _1042 = _1016 + (-1.0);
        _1010 = _1042;
    }
    float _1044 = _1010;
    float _1046 = _1044;
    if (_962)
    {
        float _1048 = _980 * _1034;
        _696 = _1048;
    }
    float _1050 = _696;
    if (!_962)
    {
        _982 = _1022;
    }
    float _1052 = _982;
    float _1054 = _1052;
    if (_962)
    {
        float _1056 = _1044 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _994 = _1056;
    }
    float _1058 = _994;
    if (_962)
    {
        float _1060 = _950 * _1050;
        _972 = _1060;
    }
    float _1062 = _972;
    if (!_962)
    {
        _1036 = _954;
    }
    float _1064 = _1036;
    float _1066 = _1064;
    if (_962)
    {
        float _1068 = _952 * _1050;
        _1040 = _1068;
    }
    float _1070 = _1040;
    if (_962)
    {
        float _1072 = fma(_1022, _1016, _1058);
        _1054 = _1072;
    }
    float _1074 = _1054;
    if (_962)
    {
        float _1076 = _1062 * _1062;
        _1066 = _1076;
    }
    float _1078 = _1066;
    if (!_962)
    {
        _1046 = _956;
    }
    float _1080 = _1046;
    float _1082 = _1080;
    if (_962)
    {
        float _1084 = _1070 * _1070;
        _1082 = _1084;
    }
    float _1086 = _1082;
    float _1088 = fma(_1074, _1074, _1078);
    float _1090 = _1088 + _1086;
    float _1092 = _920 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1094 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1096 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1094);
    float _1098 = precise::clamp(_1096, 0.0, 1.0);
    float _1100 = _920 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1102 = rsqrt(_1090);
    float _1104 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1092);
    float _1106 = _920 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1108 = -_1098;
    float _1110 = _1108 + 1.0;
    float _1112 = _920 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1114 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1104);
    float _1116 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1106);
    float _1118 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1100);
    float _1120 = fma(_922, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1112);
    float _1122 = _1114 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1124 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1116);
    float _1126 = abs(_1110);
    float _1128 = log2(_1126);
    float _1130 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1118);
    float _1132 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1120);
    float _1134 = _1124 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1136 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1138 = _1102 * _1062;
    float _1140 = _1130 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1142 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1144 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1146 = _1102 * _1074;
    float _1148 = _1138 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1150 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1142);
    float _1152 = _1102 * _1070;
    float _1154 = _1122 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1156 = -_1148;
    float _1158 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1156);
    float _1160 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1150);
    float _1162 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1164 = -_1154;
    float _1166 = fma(_1164, _1136, 1.0);
    float _1168 = -_1152;
    float _1170 = fma(_1168, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1158);
    float _1172 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1160);
    float _1174 = exp2(_1162);
    float _1176 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1178 = fma(_1170, -0.5, 0.5);
    float _1180 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1182 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1176);
    float _1184 = fma(_1170, 0.5, 0.5);
    float _1186 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1180);
    float _1188 = log2(_1166);
    float _1190 = _1146 + 1.0;
    float _1192 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1182);
    float _1194 = fma(_1184, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1196 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1186);
    float _1198 = fma(_1184, _1194, -0.212114393711090087890625);
    float _1200 = 1.0 / _1172;
    float _1202 = -_1146;
    float _1204 = fma(_1174, _1190, _1202);
    float _1206 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1192);
    float _1208 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1196);
    float _1210 = fma(_1184, _1198, 1.570728778839111328125);
    float _1212 = sqrt(_1178);
    float _1214 = _1188 * 0.693147182464599609375;
    float _1216 = _1214 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1218 = fma(_1204, 0.5, 0.5);
    float _1220 = _1206 * _1200;
    float _1222 = _1208 * _1200;
    float _1224 = fma(_1220, 0.5, 0.5);
    float _1226 = fma(_1222, -0.5, 0.5);
    float _1228 = _1212 * 0.636619746685028076171875;
    float3 _3422 = float3(_1224, _1226, _1216);
    float _1230 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3422, float3(0.0), isnan(_3422)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3422, float3(0.0), isnan(_3422)), level(0.0)).x;
    float _1232 = -_1210;
    float _1234 = fma(_1228, _1232, 1.0);
    float3 _3438 = float3(_1224, _1226, _1216);
    float4 _1237 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3438, float3(0.0), isnan(_3438)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3438, float3(0.0), isnan(_3438)), level(0.0)).xyzw;
    float _1239 = _1237.x;
    float _1241 = _1237.y;
    float _1243 = _1237.z;
    float _1245 = _1237.w;
    float2 _3455 = float2(_1234, _1218);
    float3 _1249 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3455, float2(0.0), isnan(_3455)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3455, float2(0.0), isnan(_3455)), level(0.0)).xyz;
    float _1251 = _1249.x;
    float _1253 = _1249.y;
    float _1255 = _1249.z;
    float _1257 = _654 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1259 = _654 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1261 = _1134 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1263 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1257);
    float _1265 = fma(_530, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1259);
    bool _1267 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1269 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan(0.5);
    bool _1275 = _1271 || _1273;
    float _1277 = _1128 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1279 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1263);
    float _1281 = fma(_534, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1265);
    float _1283 = fma(_1140, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1261);
    float _1285 = _1279 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1287 = _1281 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1289 = exp2(_1277);
    out.m_73.x = _932;
    out.m_73.y = _928;
    out.m_73.z = _936;
    float _1291 = _1287 + _1285;
    float _1293 = _1226;
    float _1295 = _1140;
    float _1297 = _1279;
    float _1299 = _1224;
    float _1301 = _1285;
    float _1303 = _1283;
    float _1305 = _1128;
    if (!_1275)
    {
        _1293 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1307 = _1293;
    if (_1275)
    {
        _1295 = 1.0;
    }
    float _1309 = _1295;
    float _1311 = 1.0 / _1285;
    float _1313 = _1309;
    if (!_1275)
    {
        float _1315 = -_1307;
        float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1297 = _1317;
    }
    float _1319 = _1297;
    if (!_1275)
    {
        float _1321 = 1.0 / _1319;
        _1299 = _1321;
    }
    float _1323 = _1299;
    float _1325 = -_1289;
    float _1327 = _1325 + 1.0;
    float _1329 = _1327 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1331 = _1291 * _1311;
    float _1333 = _1331 * 0.5;
    float _1335 = _1311;
    if (!_1275)
    {
        _1335 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _1337 = _1335;
    float _1339 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1341 = fma(_1333, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1339);
    float _1343 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1283);
    float _1345 = _1337;
    if (!_1275)
    {
        float _1347 = -_1337;
        float _1349 = _1347 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _1301 = _1349;
    }
    float _1351 = _1301;
    if (_1275)
    {
        _1303 = 1.0;
    }
    float _1353 = _1303;
    float _1355 = 1.0 / _1341;
    float _1357 = fma(_1144, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1343);
    float _1359 = _1172 * 0.5;
    out.gl_Position.x = _1206;
    out.gl_Position.y = _1208;
    out.gl_Position.z = _1357;
    out.gl_Position.w = _1172;
    float _1361 = _1216;
    float _1363 = _1353;
    if (!_1275)
    {
        float _1365 = 1.0 / _1351;
        _1361 = _1365;
    }
    float _1367 = _1361;
    float _1369 = _1206 + _1172;
    float _1371 = _1369 * 0.5;
    if (!_1275)
    {
        float _1373 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1375 = -_1307;
        float _1377 = fma(_1355, _1373, _1375);
        _1305 = _1377;
    }
    float _1379 = _1305;
    float _1381 = _1379;
    if (!_1275)
    {
        float _1383 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1385 = -_1337;
        float _1387 = fma(_1355, _1383, _1385);
        _1345 = _1387;
    }
    float _1389 = _1345;
    if (!_1275)
    {
        float _1391 = _1379 * _1323;
        float _1393 = precise::clamp(_1391, 0.0, 1.0);
        _1381 = _1393;
    }
    float _1395 = _1381;
    if (!_1275)
    {
        float _1397 = _1389 * _1367;
        float _1399 = precise::clamp(_1397, 0.0, 1.0);
        _1313 = _1399;
    }
    float _1401 = _1313;
    if (!_1275)
    {
        float _1403 = -_1395;
        float _1405 = _1403 + 1.0;
        _1363 = _1405;
    }
    float _1407 = _1363;
    float _1409 = _1357 + _1172;
    float _1411 = _1401 * _1407;
    bool _1413 = _1401 > 0.0;
    bool _1415 = isnan(_1401);
    bool _1417 = _1413 || _1415;
    bool _1419 = isnan(0.0);
    bool _1421 = _1417 || _1419;
    float _1423 = _1409 * 0.5;
    float _1425 = _1411 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1427 = fma(_1208, -0.5, _1359);
    bool _1429 = _1407 <= 0.0;
    bool _1431 = !_1421;
    bool _1433 = _1429 || _1431;
    float _1435 = _1425 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_75.x = _1371;
    out.m_75.y = _1427;
    out.m_75.z = _1423;
    out.m_75.w = _1172;
    out.m_47.x = _1435;
    float _1437 = _1329 * _1230;
    float _1439 = -_1329;
    float _1441 = _1439 + 1.0;
    float _1443 = _1245 * _1437;
    float _1445 = _1245 * _1441;
    float _1447 = _1255 * _1437;
    float _1449 = fma(_1251, _1443, _1239);
    float _1451 = fma(_1253, _1443, _1241);
    float _1453 = fma(_1245, _1447, _1243);
    out.m_77.x = _1449;
    out.m_77.y = _1451;
    out.m_77.z = _1453;
    out.m_77.w = _1445;
    if (!_1433)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1455 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1455;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

