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
    float4 m_53 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_61 [[user(locn4)]];
    float4 m_63 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_45 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_51 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _474 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1496 = as_type<float>(_110);
        out.gl_Position.z = _1496;
    }
    if (!_98)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_146);
        out.gl_Position.z = _1565;
    }
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_51.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = -_314;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _322;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _336 = 1.0 / _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _338;
    float _342 = _302 * _332;
    bool _344 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _346 = isnan(_298);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _356;
    bool _360 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _362 = isnan(_298);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = fma(_340, _342, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _374 = fma(_358, _342, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _376 = _370 * _330;
    float _378 = -_370;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = _318 * _336;
    float _388 = _354 * _380;
    float _390 = fma(_384, _342, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = -_354;
    float _394 = _392 + 1.0;
    float _396 = _372 * _388;
    float _398 = _390 * _388;
    float _400 = _374 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _418 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_408, _386, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_412, _386, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_418, _376, _414);
    float _428 = fma(_420, _376, _416);
    float _430 = fma(_422, _376, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _446;
    out.m_53.y = _448;
    out.m_53.z = _450;
    out.m_53.w = _444;
    bool _452 = !_334;
    float _454 = _400;
    float _472;
    if (!_452)
    {
        float _456 = in.m_51.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_94);
        float _478 = 1.0 / _476;
        float _480 = _128 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_49.x;
    float _486 = in.m_49.y;
    float _488 = in.m_49.z;
    float _490 = in.m_55.x;
    float _492 = in.m_55.y;
    float _494 = in.m_55.z;
    float _496 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _490);
    float _504 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _510 = _504 * _502;
    float _512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _492);
    float _514 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _518 = _506 * _512;
    float _520 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _522 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    float _524 = _508 * _516;
    float _526 = _518 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _528 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
    float _530 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _532 = _518 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _526);
    float _536 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _538 = _530 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _540 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _532);
    float _542 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[10].z, _534);
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _546 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[8].z, _540);
    float _550 = _538 + _542;
    float _552 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _554 = _544 + _548;
    float _556 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _558 = _550 + _556;
    float _560 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _564 = _554 + _562;
    float _566 = _558 * _558;
    float _568 = fma(_564, _564, _566);
    float _570 = _518 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _572 = sqrt(_568);
    float _574 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _570);
    float _576 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].z, _574);
    float _580 = _576 + _578;
    bool _582 = _572 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _578;
    float _586 = _574;
    float _588 = _572;
    float _590 = _550;
    float _592 = _564;
    float _594 = _558;
    if (!_582)
    {
        _584 = _554;
    }
    float _596 = _584;
    float _598 = _596;
    if (!_582)
    {
        _586 = _550;
    }
    float _600 = _586;
    float _602 = _600;
    if (!_582)
    {
        _454 = _580;
    }
    float _604 = _454;
    bool _606 = !_582;
    float _608 = _604;
    if (!_606)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _614 = _572 + _612;
        float _616 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = rsqrt(_568);
        float _620 = _614 * _610;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = _622 * 6.283185482025146484375;
        float _626 = cos(_624);
        float _628 = _622 * 6.283185482025146484375;
        float _630 = sin(_628);
        float _632 = _626 + (-1.0);
        float _634 = fma(_630, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _636 = _632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = _618 * _634;
        float _640 = fma(_580, _626, _636);
        float _642 = fma(_564, _638, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _644 = fma(_558, _638, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _608 = _640;
        _598 = _642;
        _602 = _644;
        _588 = _614;
    }
    float _646 = _608;
    float _648 = _598;
    float _650 = _602;
    float _652 = _588;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _646 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _660 = _648 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _664 = _650 + _662;
    float _666 = _656 * _656;
    float _668 = fma(_660, _660, _666);
    float _670 = fma(_664, _664, _668);
    float _672 = rsqrt(_670);
    float _674 = sqrt(_670);
    float _676 = _672 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _678 = _660 * _676;
    float _680 = _664 * _676;
    float _682 = _678 * _678;
    float _684 = _680 * _680;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = _682 + _684;
    float _694 = -_690;
    float _696 = _694 + 1.0;
    float _698 = sqrt(_692);
    bool _700 = _698 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _704 = _698 + _702;
    float _706 = _554;
    float _708 = _704;
    if (_700)
    {
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _706 = _710;
    }
    float _712 = _706;
    if (_700)
    {
        float _714 = rsqrt(_692);
        _590 = _714;
    }
    float _716 = _590;
    float _718 = _716;
    if (_700)
    {
        float _720 = _704 * _712;
        _708 = _720;
    }
    float _722 = _708;
    float _724 = _646 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_700)
    {
        float _726 = _722 * 0.15915493667125701904296875;
        _592 = _726;
    }
    float _728 = _592;
    float _730 = _652;
    if (_700)
    {
        float _732 = _728 * 6.283185482025146484375;
        float _734 = sin(_732);
        _730 = _734;
    }
    float _736 = _730;
    float _738 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _740 = precise::max(0.0, _738);
    float _742 = _580;
    float _744 = _740;
    float _746 = _738;
    if (_700)
    {
        float _748 = _728 * 6.283185482025146484375;
        float _750 = cos(_748);
        _742 = _750;
    }
    float _752 = _742;
    float _754 = -_676;
    float _756 = -_740;
    float _758 = fma(_656, _754, _756);
    if (_700)
    {
        float _760 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _744 = _760;
    }
    float _762 = _744;
    float _764 = _646 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _766 = _736;
    float _768 = _762;
    if (_700)
    {
        float _770 = fma(_736, _762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _594 = _770;
    }
    float _772 = _594;
    float _774 = _772;
    if (!_700)
    {
        _766 = _678;
    }
    float _776 = _766;
    float _778 = _776;
    if (!_700)
    {
        _768 = _758;
    }
    float _780 = _768;
    float _782 = _780;
    float _784 = _752;
    if (_700)
    {
        float _786 = _752 + (-1.0);
        _746 = _786;
    }
    float _788 = _746;
    float _790 = _788;
    if (_700)
    {
        float _792 = _716 * _772;
        _774 = _792;
    }
    float _794 = _774;
    if (_700)
    {
        float _796 = _788 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _718 = _796;
    }
    float _798 = _718;
    float _800 = _798;
    if (_700)
    {
        float _802 = _678 * _794;
        _778 = _802;
    }
    float _804 = _778;
    if (!_700)
    {
        _790 = _680;
    }
    float _806 = _790;
    float _808 = _806;
    if (_700)
    {
        float _810 = _680 * _794;
        _808 = _810;
    }
    float _812 = _808;
    if (_700)
    {
        float _814 = fma(_758, _752, _798);
        _782 = _814;
    }
    float _816 = _782;
    if (!_700)
    {
        _784 = _682;
    }
    float _818 = _784;
    float _820 = _818;
    if (_700)
    {
        float _822 = _804 * _804;
        _820 = _822;
    }
    float _824 = _820;
    if (!_700)
    {
        _800 = _684;
    }
    float _826 = _800;
    float _828 = _826;
    if (_700)
    {
        float _830 = _812 * _812;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _646 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _836 = fma(_816, _816, _824);
    float _838 = _646 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _840 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[0].x, _764);
    float _842 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[1].x, _834);
    float _844 = _836 + _832;
    float _846 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[2].x, _838);
    float _848 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[0].z, _840);
    float _850 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[1].z, _842);
    float _852 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[3].x, _724);
    float _854 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[2].z, _846);
    float _856 = rsqrt(_844);
    float _858 = _850 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _860 = _848 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _862 = _854 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _864 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[3].z, _852);
    float _866 = _858 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _868 = _862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _870 = _864 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[7].x, _866);
    float _874 = abs(_696);
    float _876 = log2(_874);
    float _878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _872);
    float _882 = -_868;
    float _884 = fma(_882, _878, 1.0);
    float _886 = _856 * _804;
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _880);
    float _890 = _856 * _816;
    float _892 = _856 * _812;
    float _894 = _886 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _896 = log2(_884);
    float _898 = _858 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _900 = _890 + 1.0;
    float _902 = -_894;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[21].y, _902);
    float _906 = _876 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _908 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[5].x, _898);
    float _910 = -_892;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c15)._m0[21].z, _904);
    float _914 = 1.0 / _888;
    float _916 = _858 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _918 = fma(_912, -0.5, 0.5);
    float _920 = fma(_912, 0.5, 0.5);
    float _922 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[4].x, _916);
    float _924 = exp2(_906);
    float _926 = fma(_920, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _928 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _922);
    float _930 = fma(_920, _926, -0.212114393711090087890625);
    float _932 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _934 = sqrt(_918);
    float _936 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _908);
    float _938 = _896 * 0.693147182464599609375;
    float _940 = fma(_920, _930, 1.570728778839111328125);
    float _942 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _936);
    float _944 = _932 * _914;
    float _946 = _938 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _948 = -_890;
    float _950 = fma(_924, _900, _948);
    float _952 = _942 * _914;
    float _954 = fma(_944, 0.5, 0.5);
    float _956 = fma(_950, 0.5, 0.5);
    float _958 = fma(_952, -0.5, 0.5);
    float _960 = _934 * 0.636619746685028076171875;
    float _962 = -_940;
    float _964 = fma(_960, _962, 1.0);
    float3 _2928 = float3(_954, _958, _946);
    float _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).x;
    float3 _2939 = float3(_954, _958, _946);
    float4 _969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2939, float3(0.0), isnan(_2939)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2939, float3(0.0), isnan(_2939)), level(0.0)).xyzw;
    float _971 = _969.x;
    float _973 = _969.y;
    float _975 = _969.z;
    float _977 = _969.w;
    float2 _2956 = float2(_964, _956);
    float3 _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2956, float2(0.0), isnan(_2956)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2956, float2(0.0), isnan(_2956)), level(0.0)).xyz;
    float _983 = _981.x;
    float _985 = _981.y;
    float _987 = _981.z;
    float _989 = in.m_51.x;
    float _991 = in.m_51.y;
    float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _995 = in.m_57.y;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = _876 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1003 = in.m_59.w;
    float _1005 = _858 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1009 = _1007 != 0;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1011;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1021 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1023 = 1.0 / _1013;
    float _1025 = 0.0;
    if (_999)
    {
        float _1027 = in.m_51.x;
        _1025 = _1027;
    }
    float _1029 = _1025;
    float _1031 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1005);
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_61.z = _494;
    float _1035 = _989 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1037 = _991 > 0.5;
    float _1039 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1033);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1043 = -_1015;
    float _1045 = fma(_1035, 2.0, _1043);
    float _1047 = 1.0 / _1019;
    float _1049 = -_995;
    float _1051 = _1049 + 1.0;
    float _1053 = _991 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.w = _1003;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1059 = _482 + _1057;
    float _1061 = _995;
    if (_1009)
    {
        float _1063 = _1037 ? _1051 : _995;
        _1061 = _1063;
    }
    float _1065 = _1061;
    float _1067 = _993 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1069 = fma(_1053, -2.0, _1055);
    float _1071 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1041);
    float _1073 = in.m_57.x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1077 = _482 + _1075;
    float _1079 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _1081 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1071);
    float _1083 = _490 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1085 = _1077 * _1023;
    float _1087 = _1059 * _1047;
    float _1089 = fma(_1067, _1065, -0.5);
    float _1091 = -_128;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1045);
    float _1095 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1097 = _492 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1099 = _1029 > 0.5;
    bool _1101 = _1099 && _999;
    out.m_61.x = _490;
    float _1103 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1107 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1109 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1103);
    float _1111 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1105);
    float _1113 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1107);
    bool _1115 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1117 = isnan(_482);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    out.m_61.y = _492;
    float _1127 = -_1095;
    float _1129 = fma(_1081, _1089, _1127);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1135;
    bool _1139 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1141 = isnan(_482);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -_1125;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1133, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1157 = fma(_1137, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1173 = fma(_1161, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1175 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1177 = isnan(_482);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1191 = _1149 * _1153;
    float _1193 = -_1149;
    float _1195 = _1193 + 1.0;
    float _1197 = _1149;
    float _1199 = _1073;
    if (_999)
    {
        _1197 = _1073;
    }
    float _1201 = _1197;
    float _1203 = fma(_1189, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1205 = fma(_1165, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1207 = fma(_1169, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1209 = _1185 * _1195;
    float _1211 = _1201;
    if (_1101)
    {
        float _1213 = -_1201;
        float _1215 = _1213 + 1.0;
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = -_1185;
    float _1221 = _1219 + 1.0;
    float _1223 = exp2(_1001);
    float _1225 = _1173 * _1209;
    float _1227 = _1155 * _1209;
    float _1229 = _1157 * _1209;
    if (_999)
    {
        _1199 = _1217;
    }
    float _1231 = _1199;
    float _1233 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1225);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1227);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1229);
    float _1239 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1241 = fma(_1203, _1191, _1233);
    float _1243 = fma(_1205, _1191, _1235);
    float _1245 = fma(_1207, _1191, _1237);
    float _1247 = fma(_1239, _1231, -0.5);
    float _1249 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1241);
    float _1251 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1243);
    float _1253 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1245);
    float _1255 = _576 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1257 = fma(_1079, _1247, _1093);
    float _1259 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1111);
    float _1261 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1255);
    float _1263 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1109);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1267 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1113);
    float _1269 = _1129 + 0.5;
    float _1271 = _1257 + 0.5;
    float _1273 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1261);
    float _1275 = _576 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1277 = _1249 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_65.x = _1263;
    out.m_65.y = _1259;
    out.m_65.z = _1267;
    float _1279 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1281 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1283 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1275);
    out.m_67.x = _1271;
    out.m_67.y = _1269;
    float _1285 = 1.0 / _1279;
    bool _1287 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1289 = isnan(0.5);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1295 = _1291 || _1293;
    float _1297 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1283);
    float _1299 = _1251 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1301 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1031);
    float _1311 = _1305 + _1279;
    out.m_69.x = _1301;
    out.m_69.y = _1307;
    out.m_69.z = _1303;
    out.m_69.w = _1265;
    float _1313 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1309);
    float _1315 = _1311 * _1285;
    float _1317 = _1315 * 0.5;
    float _1319 = _1301;
    if (_1295)
    {
        _1319 = 1.0;
    }
    float _1321 = _1319;
    float _1323 = _1321;
    if (!_1295)
    {
        float _1325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1329 = _1325 * 0.15915493667125701904296875;
        float _1331 = _1327 * 0.15915493667125701904296875;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1333);
        float _1337 = _1329 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1329 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1339;
        float _1347 = _1331 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1331 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1335;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1361;
        float _1365 = 1.0 / _1357;
        float _1367 = 1.0 / _1363;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1371 = _1359 * _1369;
        float _1373 = _1355 * _1365;
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1377 = fma(_1373, _1371, _1375);
        float _1379 = _1377 * _1367;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        float _1383 = -_1381;
        float _1385 = _1383 + 1.0;
        _1323 = _1385;
    }
    float _1387 = _1323;
    float _1389 = _888 * 0.5;
    float _1391 = -_1223;
    float _1393 = _1391 + 1.0;
    bool _1395 = _1387 > 0.0;
    bool _1397 = isnan(_1387);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(0.0);
    bool _1403 = _1399 || _1401;
    float _1405 = _1387 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1407 = fma(_942, -0.5, _1389);
    float _1409 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1411 = _1313 + _888;
    float _1413 = _932 + _888;
    out.gl_Position.x = _932;
    out.gl_Position.y = _942;
    out.gl_Position.z = _1313;
    out.gl_Position.w = _888;
    float _1415 = _1409 * _966;
    float _1417 = -_1409;
    float _1419 = _1417 + 1.0;
    float _1421 = _1411 * 0.5;
    float _1423 = _977 * _1415;
    float _1425 = _987 * _1415;
    float _1427 = _1413 * 0.5;
    float _1429 = _1405 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1431 = fma(_983, _1423, _971);
    float _1433 = fma(_985, _1423, _973);
    float _1435 = _977 * _1419;
    float _1437 = fma(_977, _1425, _975);
    out.m_71.x = _660;
    out.m_71.y = _656;
    out.m_71.z = _664;
    out.m_73.x = _1427;
    out.m_73.y = _1407;
    out.m_73.z = _1421;
    out.m_73.w = _888;
    out.m_45.x = _1429;
    out.m_75.x = _1431;
    out.m_75.y = _1433;
    out.m_75.z = _1437;
    out.m_75.w = _1435;
    if (_1403)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1439;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _474 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1496 = as_type<float>(_110);
        out.gl_Position.z = _1496;
    }
    if (!_98)
    {
        return out;
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_146);
        out.gl_Position.z = _1565;
    }
    if (_138)
    {
        return out;
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_51.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = -_314;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _322;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _336 = 1.0 / _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _338;
    float _342 = _302 * _332;
    bool _344 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _346 = isnan(_298);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _356;
    bool _360 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _362 = isnan(_298);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = fma(_340, _342, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _374 = fma(_358, _342, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _376 = _370 * _330;
    float _378 = -_370;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = _318 * _336;
    float _388 = _354 * _380;
    float _390 = fma(_384, _342, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = -_354;
    float _394 = _392 + 1.0;
    float _396 = _372 * _388;
    float _398 = _390 * _388;
    float _400 = _374 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _418 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_408, _386, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_412, _386, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_418, _376, _414);
    float _428 = fma(_420, _376, _416);
    float _430 = fma(_422, _376, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _446;
    out.m_53.y = _448;
    out.m_53.z = _450;
    out.m_53.w = _444;
    bool _452 = !_334;
    float _454 = _400;
    float _472;
    if (!_452)
    {
        float _456 = in.m_51.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_94);
        float _478 = 1.0 / _476;
        float _480 = _128 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_49.x;
    float _486 = in.m_49.y;
    float _488 = in.m_49.z;
    float _490 = in.m_55.x;
    float _492 = in.m_55.y;
    float _494 = in.m_55.z;
    float _496 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _490);
    float _504 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _510 = _504 * _502;
    float _512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _492);
    float _514 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _518 = _506 * _512;
    float _520 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _522 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    float _524 = _508 * _516;
    float _526 = _518 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _528 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
    float _530 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _532 = _518 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _526);
    float _536 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _538 = _530 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _540 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _532);
    float _542 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[10].z, _534);
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _546 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[8].z, _540);
    float _550 = _538 + _542;
    float _552 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _554 = _544 + _548;
    float _556 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _558 = _550 + _556;
    float _560 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _564 = _554 + _562;
    float _566 = _558 * _558;
    float _568 = fma(_564, _564, _566);
    float _570 = _518 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _572 = sqrt(_568);
    float _574 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _570);
    float _576 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].z, _574);
    float _580 = _576 + _578;
    bool _582 = _572 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _578;
    float _586 = _574;
    float _588 = _572;
    float _590 = _550;
    float _592 = _564;
    float _594 = _558;
    if (!_582)
    {
        _584 = _554;
    }
    float _596 = _584;
    float _598 = _596;
    if (!_582)
    {
        _586 = _550;
    }
    float _600 = _586;
    float _602 = _600;
    if (!_582)
    {
        _454 = _580;
    }
    float _604 = _454;
    bool _606 = !_582;
    float _608 = _604;
    if (!_606)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _614 = _572 + _612;
        float _616 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = rsqrt(_568);
        float _620 = _614 * _610;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = _622 * 6.283185482025146484375;
        float _626 = cos(_624);
        float _628 = _622 * 6.283185482025146484375;
        float _630 = sin(_628);
        float _632 = _626 + (-1.0);
        float _634 = fma(_630, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _636 = _632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = _618 * _634;
        float _640 = fma(_580, _626, _636);
        float _642 = fma(_564, _638, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _644 = fma(_558, _638, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _608 = _640;
        _598 = _642;
        _602 = _644;
        _588 = _614;
    }
    float _646 = _608;
    float _648 = _598;
    float _650 = _602;
    float _652 = _588;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _646 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _660 = _648 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _664 = _650 + _662;
    float _666 = _656 * _656;
    float _668 = fma(_660, _660, _666);
    float _670 = fma(_664, _664, _668);
    float _672 = rsqrt(_670);
    float _674 = sqrt(_670);
    float _676 = _672 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _678 = _660 * _676;
    float _680 = _664 * _676;
    float _682 = _678 * _678;
    float _684 = _680 * _680;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = _682 + _684;
    float _694 = -_690;
    float _696 = _694 + 1.0;
    float _698 = sqrt(_692);
    bool _700 = _698 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _704 = _698 + _702;
    float _706 = _554;
    float _708 = _704;
    if (_700)
    {
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _706 = _710;
    }
    float _712 = _706;
    if (_700)
    {
        float _714 = rsqrt(_692);
        _590 = _714;
    }
    float _716 = _590;
    float _718 = _716;
    if (_700)
    {
        float _720 = _704 * _712;
        _708 = _720;
    }
    float _722 = _708;
    float _724 = _646 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_700)
    {
        float _726 = _722 * 0.15915493667125701904296875;
        _592 = _726;
    }
    float _728 = _592;
    float _730 = _652;
    if (_700)
    {
        float _732 = _728 * 6.283185482025146484375;
        float _734 = sin(_732);
        _730 = _734;
    }
    float _736 = _730;
    float _738 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _740 = precise::max(0.0, _738);
    float _742 = _580;
    float _744 = _740;
    float _746 = _738;
    if (_700)
    {
        float _748 = _728 * 6.283185482025146484375;
        float _750 = cos(_748);
        _742 = _750;
    }
    float _752 = _742;
    float _754 = -_676;
    float _756 = -_740;
    float _758 = fma(_656, _754, _756);
    if (_700)
    {
        float _760 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _744 = _760;
    }
    float _762 = _744;
    float _764 = _646 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _766 = _736;
    float _768 = _762;
    if (_700)
    {
        float _770 = fma(_736, _762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _594 = _770;
    }
    float _772 = _594;
    float _774 = _772;
    if (!_700)
    {
        _766 = _678;
    }
    float _776 = _766;
    float _778 = _776;
    if (!_700)
    {
        _768 = _758;
    }
    float _780 = _768;
    float _782 = _780;
    float _784 = _752;
    if (_700)
    {
        float _786 = _752 + (-1.0);
        _746 = _786;
    }
    float _788 = _746;
    float _790 = _788;
    if (_700)
    {
        float _792 = _716 * _772;
        _774 = _792;
    }
    float _794 = _774;
    if (_700)
    {
        float _796 = _788 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _718 = _796;
    }
    float _798 = _718;
    float _800 = _798;
    if (_700)
    {
        float _802 = _678 * _794;
        _778 = _802;
    }
    float _804 = _778;
    if (!_700)
    {
        _790 = _680;
    }
    float _806 = _790;
    float _808 = _806;
    if (_700)
    {
        float _810 = _680 * _794;
        _808 = _810;
    }
    float _812 = _808;
    if (_700)
    {
        float _814 = fma(_758, _752, _798);
        _782 = _814;
    }
    float _816 = _782;
    if (!_700)
    {
        _784 = _682;
    }
    float _818 = _784;
    float _820 = _818;
    if (_700)
    {
        float _822 = _804 * _804;
        _820 = _822;
    }
    float _824 = _820;
    if (!_700)
    {
        _800 = _684;
    }
    float _826 = _800;
    float _828 = _826;
    if (_700)
    {
        float _830 = _812 * _812;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _646 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _836 = fma(_816, _816, _824);
    float _838 = _646 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _840 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[0].x, _764);
    float _842 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[1].x, _834);
    float _844 = _836 + _832;
    float _846 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[2].x, _838);
    float _848 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[0].z, _840);
    float _850 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[1].z, _842);
    float _852 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[3].x, _724);
    float _854 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[2].z, _846);
    float _856 = rsqrt(_844);
    float _858 = _850 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _860 = _848 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _862 = _854 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _864 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[3].z, _852);
    float _866 = _858 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _868 = _862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _870 = _864 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[7].x, _866);
    float _874 = abs(_696);
    float _876 = log2(_874);
    float _878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _872);
    float _882 = -_868;
    float _884 = fma(_882, _878, 1.0);
    float _886 = _856 * _804;
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _880);
    float _890 = _856 * _816;
    float _892 = _856 * _812;
    float _894 = _886 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _896 = log2(_884);
    float _898 = _858 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _900 = _890 + 1.0;
    float _902 = -_894;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[21].y, _902);
    float _906 = _876 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _908 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[5].x, _898);
    float _910 = -_892;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c15)._m0[21].z, _904);
    float _914 = 1.0 / _888;
    float _916 = _858 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _918 = fma(_912, -0.5, 0.5);
    float _920 = fma(_912, 0.5, 0.5);
    float _922 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[4].x, _916);
    float _924 = exp2(_906);
    float _926 = fma(_920, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _928 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _922);
    float _930 = fma(_920, _926, -0.212114393711090087890625);
    float _932 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _934 = sqrt(_918);
    float _936 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _908);
    float _938 = _896 * 0.693147182464599609375;
    float _940 = fma(_920, _930, 1.570728778839111328125);
    float _942 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _936);
    float _944 = _932 * _914;
    float _946 = _938 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _948 = -_890;
    float _950 = fma(_924, _900, _948);
    float _952 = _942 * _914;
    float _954 = fma(_944, 0.5, 0.5);
    float _956 = fma(_950, 0.5, 0.5);
    float _958 = fma(_952, -0.5, 0.5);
    float _960 = _934 * 0.636619746685028076171875;
    float _962 = -_940;
    float _964 = fma(_960, _962, 1.0);
    float3 _2928 = float3(_954, _958, _946);
    float _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).x;
    float3 _2939 = float3(_954, _958, _946);
    float4 _969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2939, float3(0.0), isnan(_2939)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2939, float3(0.0), isnan(_2939)), level(0.0)).xyzw;
    float _971 = _969.x;
    float _973 = _969.y;
    float _975 = _969.z;
    float _977 = _969.w;
    float2 _2956 = float2(_964, _956);
    float3 _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2956, float2(0.0), isnan(_2956)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2956, float2(0.0), isnan(_2956)), level(0.0)).xyz;
    float _983 = _981.x;
    float _985 = _981.y;
    float _987 = _981.z;
    float _989 = in.m_51.x;
    float _991 = in.m_51.y;
    float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _995 = in.m_57.y;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = _876 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1003 = in.m_59.w;
    float _1005 = _858 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1009 = _1007 != 0;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1011;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1021 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1023 = 1.0 / _1013;
    float _1025 = 0.0;
    if (_999)
    {
        float _1027 = in.m_51.x;
        _1025 = _1027;
    }
    float _1029 = _1025;
    float _1031 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1005);
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_61.z = _494;
    float _1035 = _989 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1037 = _991 > 0.5;
    float _1039 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1033);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1043 = -_1015;
    float _1045 = fma(_1035, 2.0, _1043);
    float _1047 = 1.0 / _1019;
    float _1049 = -_995;
    float _1051 = _1049 + 1.0;
    float _1053 = _991 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.w = _1003;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1059 = _482 + _1057;
    float _1061 = _995;
    if (_1009)
    {
        float _1063 = _1037 ? _1051 : _995;
        _1061 = _1063;
    }
    float _1065 = _1061;
    float _1067 = _993 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1069 = fma(_1053, -2.0, _1055);
    float _1071 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1041);
    float _1073 = in.m_57.x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1077 = _482 + _1075;
    float _1079 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _1081 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1071);
    float _1083 = _490 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1085 = _1077 * _1023;
    float _1087 = _1059 * _1047;
    float _1089 = fma(_1067, _1065, -0.5);
    float _1091 = -_128;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1045);
    float _1095 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1097 = _492 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1099 = _1029 > 0.5;
    bool _1101 = _1099 && _999;
    out.m_61.x = _490;
    float _1103 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1107 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1109 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1103);
    float _1111 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1105);
    float _1113 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1107);
    bool _1115 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1117 = isnan(_482);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    out.m_61.y = _492;
    float _1127 = -_1095;
    float _1129 = fma(_1081, _1089, _1127);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1135;
    bool _1139 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1141 = isnan(_482);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -_1125;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1133, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1157 = fma(_1137, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1173 = fma(_1161, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1175 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1177 = isnan(_482);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1191 = _1149 * _1153;
    float _1193 = -_1149;
    float _1195 = _1193 + 1.0;
    float _1197 = _1149;
    float _1199 = _1073;
    if (_999)
    {
        _1197 = _1073;
    }
    float _1201 = _1197;
    float _1203 = fma(_1189, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1205 = fma(_1165, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1207 = fma(_1169, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1209 = _1185 * _1195;
    float _1211 = _1201;
    if (_1101)
    {
        float _1213 = -_1201;
        float _1215 = _1213 + 1.0;
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = -_1185;
    float _1221 = _1219 + 1.0;
    float _1223 = exp2(_1001);
    float _1225 = _1173 * _1209;
    float _1227 = _1155 * _1209;
    float _1229 = _1157 * _1209;
    if (_999)
    {
        _1199 = _1217;
    }
    float _1231 = _1199;
    float _1233 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1225);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1227);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1229);
    float _1239 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1241 = fma(_1203, _1191, _1233);
    float _1243 = fma(_1205, _1191, _1235);
    float _1245 = fma(_1207, _1191, _1237);
    float _1247 = fma(_1239, _1231, -0.5);
    float _1249 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1241);
    float _1251 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1243);
    float _1253 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1245);
    float _1255 = _576 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1257 = fma(_1079, _1247, _1093);
    float _1259 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1111);
    float _1261 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1255);
    float _1263 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1109);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1267 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1113);
    float _1269 = _1129 + 0.5;
    float _1271 = _1257 + 0.5;
    float _1273 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1261);
    float _1275 = _576 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1277 = _1249 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_65.x = _1263;
    out.m_65.y = _1259;
    out.m_65.z = _1267;
    float _1279 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1281 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1283 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1275);
    out.m_67.x = _1271;
    out.m_67.y = _1269;
    float _1285 = 1.0 / _1279;
    bool _1287 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1289 = isnan(0.5);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1295 = _1291 || _1293;
    float _1297 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1283);
    float _1299 = _1251 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1301 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1031);
    float _1311 = _1305 + _1279;
    out.m_69.x = _1301;
    out.m_69.y = _1307;
    out.m_69.z = _1303;
    out.m_69.w = _1265;
    float _1313 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1309);
    float _1315 = _1311 * _1285;
    float _1317 = _1315 * 0.5;
    float _1319 = _1301;
    if (_1295)
    {
        _1319 = 1.0;
    }
    float _1321 = _1319;
    float _1323 = _1321;
    if (!_1295)
    {
        float _1325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1329 = _1325 * 0.15915493667125701904296875;
        float _1331 = _1327 * 0.15915493667125701904296875;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1333);
        float _1337 = _1329 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1329 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1339;
        float _1347 = _1331 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1331 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1335;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1361;
        float _1365 = 1.0 / _1357;
        float _1367 = 1.0 / _1363;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1371 = _1359 * _1369;
        float _1373 = _1355 * _1365;
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1377 = fma(_1373, _1371, _1375);
        float _1379 = _1377 * _1367;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        float _1383 = -_1381;
        float _1385 = _1383 + 1.0;
        _1323 = _1385;
    }
    float _1387 = _1323;
    float _1389 = _888 * 0.5;
    float _1391 = -_1223;
    float _1393 = _1391 + 1.0;
    bool _1395 = _1387 > 0.0;
    bool _1397 = isnan(_1387);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(0.0);
    bool _1403 = _1399 || _1401;
    float _1405 = _1387 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1407 = fma(_942, -0.5, _1389);
    float _1409 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1411 = _1313 + _888;
    float _1413 = _932 + _888;
    out.gl_Position.x = _932;
    out.gl_Position.y = _942;
    out.gl_Position.z = _1313;
    out.gl_Position.w = _888;
    float _1415 = _1409 * _966;
    float _1417 = -_1409;
    float _1419 = _1417 + 1.0;
    float _1421 = _1411 * 0.5;
    float _1423 = _977 * _1415;
    float _1425 = _987 * _1415;
    float _1427 = _1413 * 0.5;
    float _1429 = _1405 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1431 = fma(_983, _1423, _971);
    float _1433 = fma(_985, _1423, _973);
    float _1435 = _977 * _1419;
    float _1437 = fma(_977, _1425, _975);
    out.m_71.x = _660;
    out.m_71.y = _656;
    out.m_71.z = _664;
    out.m_73.x = _1427;
    out.m_73.y = _1407;
    out.m_73.z = _1421;
    out.m_73.w = _888;
    out.m_45.x = _1429;
    out.m_75.x = _1431;
    out.m_75.y = _1433;
    out.m_75.z = _1437;
    out.m_75.w = _1435;
    if (_1403)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1439;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _474 = false;
    bool _290 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = trunc(_89);
    int _94 = int(_91);
    bool _98 = _94 >= 1;
    float _100 = 0.0;
    if (!_98)
    {
        _100 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _102 = _100;
    float _104 = _102;
    if (!_98)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_98)
    {
        float _108 = _102 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    int _112 = _110;
    if (!_98)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1496 = as_type<float>(_110);
        out.gl_Position.z = _1496;
    }
    if (!_98)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _114 = in.m_47.w;
    bool _116 = _114 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _118 = isnan(_114);
    bool _120 = _116 || _118;
    bool _122 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _124 = _120 || _122;
    float _126 = -_114;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_124)
    {
        float _130 = float(_94);
        _104 = _130;
    }
    float _132 = _104;
    bool _134 = _128 >= _132;
    bool _136 = !_124;
    bool _138 = _134 || _136;
    float _140 = _132;
    if (_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    if (_138)
    {
        float _144 = _142 * 5.0;
        _112 = as_type<int>(_144);
    }
    int _146 = _112;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1565 = as_type<float>(_146);
        out.gl_Position.z = _1565;
    }
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _148 = in.m_49.w;
    float _150 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _152 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _154 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _156 = _152 || _154;
    bool _158 = isnan(1.0);
    bool _160 = _156 || _158;
    float _162 = in.m_47.x;
    float _164 = in.m_47.y;
    float _166 = in.m_47.z;
    float _168 = in.m_42.x;
    float _170 = in.m_42.y;
    float _172 = in.m_42.z;
    float _174 = 0.0;
    float _176 = _150;
    if (!_160)
    {
        float _178 = _150 * _150;
        float _180 = _178 * 0.5;
        _174 = _180;
    }
    float _182 = _174;
    float _184 = _182;
    if (!_160)
    {
        float _186 = _182 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _184 = _186;
    }
    float _188 = _184;
    bool _190 = !_160;
    float _192 = _188;
    if (!_190)
    {
        float _194 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _196 = log2(_194);
        float _198 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _200 = _198 + 1.0;
        float _202 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = _150 * _196;
        float _206 = 1.0 / _200;
        float _208 = _202 * 0.693147182464599609375;
        float _210 = exp2(_204);
        float _212 = 1.0 / _208;
        float _214 = _210 + (-1.0);
        float _216 = -_214;
        float _218 = fma(_216, _212, _150);
        float _220 = _218 * _206;
        float _222 = _220 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _222;
    }
    float _224 = _192;
    bool _226 = !_160;
    if (!_226)
    {
        float _228 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _230 = log2(_228);
        float _232 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _234 = _232 + 1.0;
        float _236 = 1.0 / _234;
        float _238 = _150 * _230;
        float _240 = exp2(_238);
        float _242 = -_240;
        float _244 = _242 + 1.0;
        float _246 = _244 * _236;
        _176 = _246;
    }
    float _248 = _176;
    bool _250 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _252 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _254 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _256 = _224 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _258 = fma(_248, _162, _252);
    float _260 = fma(_248, _164, _254);
    float _262 = fma(_248, _166, _256);
    float _264 = fma(_258, _148, _168);
    float _266 = fma(_260, _148, _170);
    float _268 = fma(_262, _148, _172);
    bool _270 = !_250;
    float _288;
    if (!_270)
    {
        float _272 = in.m_51.x;
        float _274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _276 = _272 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _278 = fma(_276, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _280 = _278 * _274;
        float _282 = floor(_280);
        float _284 = -_282;
        float _286 = _280 + _284;
        _288 = _286;
        _290 = true;
    }
    else
    {
        float _292 = float(_94);
        float _294 = 1.0 / _292;
        float _296 = _128 * _294;
        _288 = _296;
    }
    _290 = false;
    float _298 = _288;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _302 = _298 + _300;
    bool _304 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _306 = isnan(_298);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _318 = _298 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _328 = -_314;
    float _330 = _328 + 1.0;
    float _332 = 1.0 / _322;
    bool _334 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _336 = 1.0 / _326;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _338;
    float _342 = _302 * _332;
    bool _344 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _346 = isnan(_298);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _356;
    bool _360 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _362 = isnan(_298);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _368 = _364 || _366;
    float _370 = float(_368);
    float _372 = fma(_340, _342, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _374 = fma(_358, _342, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _376 = _370 * _330;
    float _378 = -_370;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _382;
    float _386 = _318 * _336;
    float _388 = _354 * _380;
    float _390 = fma(_384, _342, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = -_354;
    float _394 = _392 + 1.0;
    float _396 = _372 * _388;
    float _398 = _390 * _388;
    float _400 = _374 * _388;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _414 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _416 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].y, _396);
    float _418 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_408, _386, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_412, _386, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_394, (*spvDescriptorSet0.vp_c9)._m0[107].z, _400);
    float _426 = fma(_418, _376, _414);
    float _428 = fma(_420, _376, _416);
    float _430 = fma(_422, _376, _424);
    float _432 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].x, _426);
    float _434 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].y, _428);
    float _436 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[109].z, _430);
    float _438 = _432 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _440 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _442 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _446 = _438 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_53.x = _446;
    out.m_53.y = _448;
    out.m_53.z = _450;
    out.m_53.w = _444;
    bool _452 = !_334;
    float _454 = _400;
    float _472;
    if (!_452)
    {
        float _456 = in.m_51.x;
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _456 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_94);
        float _478 = 1.0 / _476;
        float _480 = _128 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_49.x;
    float _486 = in.m_49.y;
    float _488 = in.m_49.z;
    float _490 = in.m_55.x;
    float _492 = in.m_55.y;
    float _494 = in.m_55.z;
    float _496 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _500 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _502 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _490);
    float _504 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _508 = _500 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _510 = _504 * _502;
    float _512 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _492);
    float _514 = _266 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _516 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _494);
    float _518 = _506 * _512;
    float _520 = _266 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _522 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[6].x, _514);
    float _524 = _508 * _516;
    float _526 = _518 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _528 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[4].x, _520);
    float _530 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[6].z, _522);
    float _532 = _518 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _534 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[10].x, _526);
    float _536 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[4].z, _528);
    float _538 = _530 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _540 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[8].x, _532);
    float _542 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[10].z, _534);
    float _544 = _536 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _546 = _266 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _548 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[8].z, _540);
    float _550 = _538 + _542;
    float _552 = fma(_264, (*spvDescriptorSet0.vp_c10)._m0[5].x, _546);
    float _554 = _544 + _548;
    float _556 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _558 = _550 + _556;
    float _560 = fma(_268, (*spvDescriptorSet0.vp_c10)._m0[5].z, _552);
    float _562 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _564 = _554 + _562;
    float _566 = _558 * _558;
    float _568 = fma(_564, _564, _566);
    float _570 = _518 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _572 = sqrt(_568);
    float _574 = fma(_510, (*spvDescriptorSet0.vp_c10)._m0[9].x, _570);
    float _576 = _560 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _578 = fma(_524, (*spvDescriptorSet0.vp_c10)._m0[9].z, _574);
    float _580 = _576 + _578;
    bool _582 = _572 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _584 = _578;
    float _586 = _574;
    float _588 = _572;
    float _590 = _550;
    float _592 = _564;
    float _594 = _558;
    if (!_582)
    {
        _584 = _554;
    }
    float _596 = _584;
    float _598 = _596;
    if (!_582)
    {
        _586 = _550;
    }
    float _600 = _586;
    float _602 = _600;
    if (!_582)
    {
        _454 = _580;
    }
    float _604 = _454;
    bool _606 = !_582;
    float _608 = _604;
    if (!_606)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _612 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _614 = _572 + _612;
        float _616 = _580 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _618 = rsqrt(_568);
        float _620 = _614 * _610;
        float _622 = _620 * 0.15915493667125701904296875;
        float _624 = _622 * 6.283185482025146484375;
        float _626 = cos(_624);
        float _628 = _622 * 6.283185482025146484375;
        float _630 = sin(_628);
        float _632 = _626 + (-1.0);
        float _634 = fma(_630, _616, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _636 = _632 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _638 = _618 * _634;
        float _640 = fma(_580, _626, _636);
        float _642 = fma(_564, _638, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _644 = fma(_558, _638, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _608 = _640;
        _598 = _642;
        _602 = _644;
        _588 = _614;
    }
    float _646 = _608;
    float _648 = _598;
    float _650 = _602;
    float _652 = _588;
    float _654 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _656 = _646 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _660 = _648 + _658;
    float _662 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _664 = _650 + _662;
    float _666 = _656 * _656;
    float _668 = fma(_660, _660, _666);
    float _670 = fma(_664, _664, _668);
    float _672 = rsqrt(_670);
    float _674 = sqrt(_670);
    float _676 = _672 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _678 = _660 * _676;
    float _680 = _664 * _676;
    float _682 = _678 * _678;
    float _684 = _680 * _680;
    float _686 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _688 = fma(_674, (*spvDescriptorSet0.vp_c15)._m0[23].w, _686);
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = _682 + _684;
    float _694 = -_690;
    float _696 = _694 + 1.0;
    float _698 = sqrt(_692);
    bool _700 = _698 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _702 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _704 = _698 + _702;
    float _706 = _554;
    float _708 = _704;
    if (_700)
    {
        float _710 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _706 = _710;
    }
    float _712 = _706;
    if (_700)
    {
        float _714 = rsqrt(_692);
        _590 = _714;
    }
    float _716 = _590;
    float _718 = _716;
    if (_700)
    {
        float _720 = _704 * _712;
        _708 = _720;
    }
    float _722 = _708;
    float _724 = _646 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_700)
    {
        float _726 = _722 * 0.15915493667125701904296875;
        _592 = _726;
    }
    float _728 = _592;
    float _730 = _652;
    if (_700)
    {
        float _732 = _728 * 6.283185482025146484375;
        float _734 = sin(_732);
        _730 = _734;
    }
    float _736 = _730;
    float _738 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _740 = precise::max(0.0, _738);
    float _742 = _580;
    float _744 = _740;
    float _746 = _738;
    if (_700)
    {
        float _748 = _728 * 6.283185482025146484375;
        float _750 = cos(_748);
        _742 = _750;
    }
    float _752 = _742;
    float _754 = -_676;
    float _756 = -_740;
    float _758 = fma(_656, _754, _756);
    if (_700)
    {
        float _760 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _744 = _760;
    }
    float _762 = _744;
    float _764 = _646 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _766 = _736;
    float _768 = _762;
    if (_700)
    {
        float _770 = fma(_736, _762, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _594 = _770;
    }
    float _772 = _594;
    float _774 = _772;
    if (!_700)
    {
        _766 = _678;
    }
    float _776 = _766;
    float _778 = _776;
    if (!_700)
    {
        _768 = _758;
    }
    float _780 = _768;
    float _782 = _780;
    float _784 = _752;
    if (_700)
    {
        float _786 = _752 + (-1.0);
        _746 = _786;
    }
    float _788 = _746;
    float _790 = _788;
    if (_700)
    {
        float _792 = _716 * _772;
        _774 = _792;
    }
    float _794 = _774;
    if (_700)
    {
        float _796 = _788 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _718 = _796;
    }
    float _798 = _718;
    float _800 = _798;
    if (_700)
    {
        float _802 = _678 * _794;
        _778 = _802;
    }
    float _804 = _778;
    if (!_700)
    {
        _790 = _680;
    }
    float _806 = _790;
    float _808 = _806;
    if (_700)
    {
        float _810 = _680 * _794;
        _808 = _810;
    }
    float _812 = _808;
    if (_700)
    {
        float _814 = fma(_758, _752, _798);
        _782 = _814;
    }
    float _816 = _782;
    if (!_700)
    {
        _784 = _682;
    }
    float _818 = _784;
    float _820 = _818;
    if (_700)
    {
        float _822 = _804 * _804;
        _820 = _822;
    }
    float _824 = _820;
    if (!_700)
    {
        _800 = _684;
    }
    float _826 = _800;
    float _828 = _826;
    if (_700)
    {
        float _830 = _812 * _812;
        _828 = _830;
    }
    float _832 = _828;
    float _834 = _646 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _836 = fma(_816, _816, _824);
    float _838 = _646 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _840 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[0].x, _764);
    float _842 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[1].x, _834);
    float _844 = _836 + _832;
    float _846 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[2].x, _838);
    float _848 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[0].z, _840);
    float _850 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[1].z, _842);
    float _852 = fma(_648, (*spvDescriptorSet0.vp_c8)._m0[3].x, _724);
    float _854 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[2].z, _846);
    float _856 = rsqrt(_844);
    float _858 = _850 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _860 = _848 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _862 = _854 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _864 = fma(_650, (*spvDescriptorSet0.vp_c8)._m0[3].z, _852);
    float _866 = _858 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _868 = _862 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _870 = _864 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _872 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[7].x, _866);
    float _874 = abs(_696);
    float _876 = log2(_874);
    float _878 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _880 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[7].z, _872);
    float _882 = -_868;
    float _884 = fma(_882, _878, 1.0);
    float _886 = _856 * _804;
    float _888 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[7].w, _880);
    float _890 = _856 * _816;
    float _892 = _856 * _812;
    float _894 = _886 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _896 = log2(_884);
    float _898 = _858 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _900 = _890 + 1.0;
    float _902 = -_894;
    float _904 = fma(_890, (*spvDescriptorSet0.vp_c15)._m0[21].y, _902);
    float _906 = _876 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _908 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[5].x, _898);
    float _910 = -_892;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c15)._m0[21].z, _904);
    float _914 = 1.0 / _888;
    float _916 = _858 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _918 = fma(_912, -0.5, 0.5);
    float _920 = fma(_912, 0.5, 0.5);
    float _922 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[4].x, _916);
    float _924 = exp2(_906);
    float _926 = fma(_920, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _928 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[4].z, _922);
    float _930 = fma(_920, _926, -0.212114393711090087890625);
    float _932 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[4].w, _928);
    float _934 = sqrt(_918);
    float _936 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[5].z, _908);
    float _938 = _896 * 0.693147182464599609375;
    float _940 = fma(_920, _930, 1.570728778839111328125);
    float _942 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[5].w, _936);
    float _944 = _932 * _914;
    float _946 = _938 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _948 = -_890;
    float _950 = fma(_924, _900, _948);
    float _952 = _942 * _914;
    float _954 = fma(_944, 0.5, 0.5);
    float _956 = fma(_950, 0.5, 0.5);
    float _958 = fma(_952, -0.5, 0.5);
    float _960 = _934 * 0.636619746685028076171875;
    float _962 = -_940;
    float _964 = fma(_960, _962, 1.0);
    float3 _2928 = float3(_954, _958, _946);
    float _966 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_2928, float3(0.0), isnan(_2928)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_2928, float3(0.0), isnan(_2928)), level(0.0)).x;
    float3 _2939 = float3(_954, _958, _946);
    float4 _969 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_2939, float3(0.0), isnan(_2939)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_2939, float3(0.0), isnan(_2939)), level(0.0)).xyzw;
    float _971 = _969.x;
    float _973 = _969.y;
    float _975 = _969.z;
    float _977 = _969.w;
    float2 _2956 = float2(_964, _956);
    float3 _981 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2956, float2(0.0), isnan(_2956)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2956, float2(0.0), isnan(_2956)), level(0.0)).xyz;
    float _983 = _981.x;
    float _985 = _981.y;
    float _987 = _981.z;
    float _989 = in.m_51.x;
    float _991 = in.m_51.y;
    float _993 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _995 = in.m_57.y;
    int _997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _999 = _997 != 0;
    float _1001 = _876 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1003 = in.m_59.w;
    float _1005 = _858 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1009 = _1007 != 0;
    float _1011 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1013 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1011;
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1019 = _1017 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1021 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[17].y, 1.0);
    float _1023 = 1.0 / _1013;
    float _1025 = 0.0;
    if (_999)
    {
        float _1027 = in.m_51.x;
        _1025 = _1027;
    }
    float _1029 = _1025;
    float _1031 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1005);
    float _1033 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    out.m_61.z = _494;
    float _1035 = _989 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1037 = _991 > 0.5;
    float _1039 = fma(_989, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1033);
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1043 = -_1015;
    float _1045 = fma(_1035, 2.0, _1043);
    float _1047 = 1.0 / _1019;
    float _1049 = -_995;
    float _1051 = _1049 + 1.0;
    float _1053 = _991 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    out.m_63.w = _1003;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1057 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1059 = _482 + _1057;
    float _1061 = _995;
    if (_1009)
    {
        float _1063 = _1037 ? _1051 : _995;
        _1061 = _1063;
    }
    float _1065 = _1061;
    float _1067 = _993 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1069 = fma(_1053, -2.0, _1055);
    float _1071 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1041);
    float _1073 = in.m_57.x;
    float _1075 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1077 = _482 + _1075;
    float _1079 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1039);
    float _1081 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1071);
    float _1083 = _490 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1085 = _1077 * _1023;
    float _1087 = _1059 * _1047;
    float _1089 = fma(_1067, _1065, -0.5);
    float _1091 = -_128;
    float _1093 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1045);
    float _1095 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1069);
    float _1097 = _492 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1099 = _1029 > 0.5;
    bool _1101 = _1099 && _999;
    out.m_61.x = _490;
    float _1103 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1105 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1107 = _1097 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1109 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1103);
    float _1111 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1105);
    float _1113 = fma(_1083, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1107);
    bool _1115 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1117 = isnan(_482);
    bool _1119 = _1115 || _1117;
    bool _1121 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1123 = _1119 || _1121;
    float _1125 = float(_1123);
    out.m_61.y = _492;
    float _1127 = -_1095;
    float _1129 = fma(_1081, _1089, _1127);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1131;
    float _1135 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1137 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1135;
    bool _1139 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1141 = isnan(_482);
    bool _1143 = _1139 || _1141;
    bool _1145 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1147 = _1143 || _1145;
    float _1149 = float(_1147);
    float _1151 = -_1125;
    float _1153 = _1151 + 1.0;
    float _1155 = fma(_1133, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1157 = fma(_1137, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1159 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1159;
    float _1163 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1165 = _1163 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1167 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1169 = _1167 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1171 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1173 = fma(_1161, _1085, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _1175 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1177 = isnan(_482);
    bool _1179 = _1175 || _1177;
    bool _1181 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1183 = _1179 || _1181;
    float _1185 = float(_1183);
    float _1187 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1189 = _1187 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1191 = _1149 * _1153;
    float _1193 = -_1149;
    float _1195 = _1193 + 1.0;
    float _1197 = _1149;
    float _1199 = _1073;
    if (_999)
    {
        _1197 = _1073;
    }
    float _1201 = _1197;
    float _1203 = fma(_1189, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1205 = fma(_1165, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1207 = fma(_1169, _1087, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1209 = _1185 * _1195;
    float _1211 = _1201;
    if (_1101)
    {
        float _1213 = -_1201;
        float _1215 = _1213 + 1.0;
        _1211 = _1215;
    }
    float _1217 = _1211;
    float _1219 = -_1185;
    float _1221 = _1219 + 1.0;
    float _1223 = exp2(_1001);
    float _1225 = _1173 * _1209;
    float _1227 = _1155 * _1209;
    float _1229 = _1157 * _1209;
    if (_999)
    {
        _1199 = _1217;
    }
    float _1231 = _1199;
    float _1233 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1225);
    float _1235 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1227);
    float _1237 = fma(_1221, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1229);
    float _1239 = _1171 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1241 = fma(_1203, _1191, _1233);
    float _1243 = fma(_1205, _1191, _1235);
    float _1245 = fma(_1207, _1191, _1237);
    float _1247 = fma(_1239, _1231, -0.5);
    float _1249 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1241);
    float _1251 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1243);
    float _1253 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1245);
    float _1255 = _576 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1257 = fma(_1079, _1247, _1093);
    float _1259 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1111);
    float _1261 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1255);
    float _1263 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1109);
    float _1265 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1267 = fma(_1021, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1113);
    float _1269 = _1129 + 0.5;
    float _1271 = _1257 + 0.5;
    float _1273 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1261);
    float _1275 = _576 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1277 = _1249 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    out.m_65.x = _1263;
    out.m_65.y = _1259;
    out.m_65.z = _1267;
    float _1279 = _1273 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1281 = _1253 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1283 = fma(_544, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1275);
    out.m_67.x = _1271;
    out.m_67.y = _1269;
    float _1285 = 1.0 / _1279;
    bool _1287 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1289 = isnan(0.5);
    bool _1291 = _1287 || _1289;
    bool _1293 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1295 = _1291 || _1293;
    float _1297 = fma(_538, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1283);
    float _1299 = _1251 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1301 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1303 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1297 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1307 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1309 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1031);
    float _1311 = _1305 + _1279;
    out.m_69.x = _1301;
    out.m_69.y = _1307;
    out.m_69.z = _1303;
    out.m_69.w = _1265;
    float _1313 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1309);
    float _1315 = _1311 * _1285;
    float _1317 = _1315 * 0.5;
    float _1319 = _1301;
    if (_1295)
    {
        _1319 = 1.0;
    }
    float _1321 = _1319;
    float _1323 = _1321;
    if (!_1295)
    {
        float _1325 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1327 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1329 = _1325 * 0.15915493667125701904296875;
        float _1331 = _1327 * 0.15915493667125701904296875;
        float _1333 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1335 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1333);
        float _1337 = _1329 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1329 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = 1.0 / _1339;
        float _1347 = _1331 * 6.283185482025146484375;
        float _1349 = cos(_1347);
        float _1351 = _1343 * _1345;
        float _1353 = _1331 * 6.283185482025146484375;
        float _1355 = sin(_1353);
        float _1357 = _1349 * _1351;
        float _1359 = 1.0 / _1335;
        float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1363 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1361;
        float _1365 = 1.0 / _1357;
        float _1367 = 1.0 / _1363;
        float _1369 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1371 = _1359 * _1369;
        float _1373 = _1355 * _1365;
        float _1375 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1377 = fma(_1373, _1371, _1375);
        float _1379 = _1377 * _1367;
        float _1381 = precise::clamp(_1379, 0.0, 1.0);
        float _1383 = -_1381;
        float _1385 = _1383 + 1.0;
        _1323 = _1385;
    }
    float _1387 = _1323;
    float _1389 = _888 * 0.5;
    float _1391 = -_1223;
    float _1393 = _1391 + 1.0;
    bool _1395 = _1387 > 0.0;
    bool _1397 = isnan(_1387);
    bool _1399 = _1395 || _1397;
    bool _1401 = isnan(0.0);
    bool _1403 = _1399 || _1401;
    float _1405 = _1387 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1407 = fma(_942, -0.5, _1389);
    float _1409 = _1393 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1411 = _1313 + _888;
    float _1413 = _932 + _888;
    out.gl_Position.x = _932;
    out.gl_Position.y = _942;
    out.gl_Position.z = _1313;
    out.gl_Position.w = _888;
    float _1415 = _1409 * _966;
    float _1417 = -_1409;
    float _1419 = _1417 + 1.0;
    float _1421 = _1411 * 0.5;
    float _1423 = _977 * _1415;
    float _1425 = _987 * _1415;
    float _1427 = _1413 * 0.5;
    float _1429 = _1405 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1431 = fma(_983, _1423, _971);
    float _1433 = fma(_985, _1423, _973);
    float _1435 = _977 * _1419;
    float _1437 = fma(_977, _1425, _975);
    out.m_71.x = _660;
    out.m_71.y = _656;
    out.m_71.z = _664;
    out.m_73.x = _1427;
    out.m_73.y = _1407;
    out.m_73.z = _1421;
    out.m_73.w = _888;
    out.m_45.x = _1429;
    out.m_75.x = _1431;
    out.m_75.y = _1433;
    out.m_75.z = _1437;
    out.m_75.w = _1435;
    if (_1403)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1439 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1439;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

