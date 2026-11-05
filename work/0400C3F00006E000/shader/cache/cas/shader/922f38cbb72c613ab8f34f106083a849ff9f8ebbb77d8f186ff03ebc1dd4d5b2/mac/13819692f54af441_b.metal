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
    float4 m_65 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_45 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1500 = as_type<float>(_118);
        out.gl_Position.z = _1500;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_154);
        out.gl_Position.z = _1568;
    }
    if (_148)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _156 = in.m_49.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _158);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_102);
        float _302 = 1.0 / _300;
        float _304 = _136 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = in.m_51.y;
    float _310 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = in.m_53.x;
    float _328 = in.m_53.y;
    float _330 = in.m_53.z;
    float _332 = 1.0 / _316;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _338 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = in.m_51.x;
    float _342 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _344 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _346 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _348 = 1.0 / _320;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = _306 + _350;
    float _354 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _356 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _344);
    float _358 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _346);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _366 = _306 + _364;
    float _368 = 1.0 / _324;
    float _370 = _352 * _332;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _306 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _378 = _306 + _376;
    float _380 = fma(_362, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _384 = 1.0 / _336;
    float _386 = _374 * _348;
    float _388 = _330 + _308;
    float _390 = _340 + _326;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = _378 * _368;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = fma(_398, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _408 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_306);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = _366 * _384;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _440 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _442 = isnan(_306);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = _354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _460 = _382 + _458;
    bool _462 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _464 = isnan(_306);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_450;
    float _476 = _474 + 1.0;
    float _478 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _388);
    float _480 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _390);
    float _482 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _484 = fma(_430, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _486 = fma(_394, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = fma(_436, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _490 = fma(_422, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = fma(_454, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _494 = _358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = _456 + _496;
    float _500 = _460 * _460;
    float _502 = in.m_55.x;
    float _504 = in.m_55.y;
    float _506 = in.m_55.z;
    float _508 = _418 * _476;
    float _510 = -_418;
    float _512 = _510 + 1.0;
    bool _514 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _516 = isnan(_306);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -_472;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = _494 + _530;
    float _534 = fma(_498, _498, _500);
    bool _536 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_306);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = _524 * _528;
    float _550 = -_524;
    float _552 = _550 + 1.0;
    float _554 = fma(_532, _532, _534);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _560 = _480 * 7.5;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _570 = fma(_558, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _572 = rsqrt(_554);
    float _574 = _560 * 0.15915493667125701904296875;
    float _576 = _546 * _552;
    float _578 = _478 * 15.0;
    float _580 = _472 * _512;
    float _582 = fma(_564, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _584 = _406 * _576;
    float _586 = _438 * _576;
    float _588 = _504 * _504;
    float _590 = _380 * _576;
    float _592 = fma(_568, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _594 = _578 * 0.15915493667125701904296875;
    float _596 = fma(_502, _502, _588);
    float _598 = -_546;
    float _600 = _598 + 1.0;
    float _602 = in.m_57.x;
    float _604 = _594 * 6.283185482025146484375;
    float _606 = sin(_604);
    float _608 = _460 * _572;
    float _610 = fma(_506, _506, _596);
    float _612 = _498 * _572;
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _616 = -_608;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _586);
    float _622 = -_612;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _626 = in.m_49.x;
    float _628 = in.m_49.y;
    float _630 = in.m_49.z;
    float _632 = _618 * _618;
    float _634 = _532 * _572;
    float _636 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _638 = fma(_482, _548, _614);
    float _640 = _574 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = fma(_624, _624, _632);
    float _646 = -_634;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _532);
    float _650 = fma(_484, _548, _620);
    float _652 = fma(_486, _548, _636);
    float _654 = fma(_488, _580, _638);
    float _656 = fma(_648, _648, _644);
    float _658 = fma(_490, _580, _650);
    float _660 = rsqrt(_610);
    float _662 = fma(_492, _580, _652);
    float _664 = fma(_570, _508, _654);
    float _666 = fma(_582, _508, _658);
    float _668 = _606 * 0.02999999932944774627685546875;
    float _670 = fma(_592, _508, _662);
    float _672 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].y, _666);
    float _674 = sqrt(_656);
    float _676 = _642 * 0.07999999821186065673828125;
    float _678 = _672 * _628;
    float _680 = fma(_676, _602, _328);
    float _682 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].x, _664);
    float _684 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].z, _670);
    float _686 = _660 * _668;
    float _688 = _682 * _626;
    float _690 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = fma(_504, _686, _680);
    float _694 = fma(_506, _686, _330);
    float _696 = fma(_502, _686, _326);
    float _698 = _684 * _630;
    float _700 = _572 * _674;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _692);
    float _704 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = _700 * _690;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _712 = _700 * _704;
    float _714 = _700 * _706;
    float _716 = _702 * _708;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _694);
    float _720 = _710 * _712;
    float _722 = _716 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _724 = _718 * _714;
    float _726 = _716 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[10].x, _722);
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].z, _728);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].z, _730);
    float _736 = _494 + _732;
    float _738 = _456 + _734;
    float _740 = _716 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _744 = _736 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _748 = _738 + _746;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[9].x, _740);
    float _752 = _744 * _744;
    float _754 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].z, _750);
    float _756 = fma(_748, _748, _752);
    float _758 = _382 + _754;
    float _760 = sqrt(_756);
    bool _762 = _760 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _764 = _716;
    float _766 = _752;
    float _768 = _750;
    float _770 = _758;
    float _772 = _748;
    float _774 = _672;
    float _776 = _504;
    float _778 = _502;
    if (!_762)
    {
        _764 = _738;
    }
    float _780 = _764;
    float _782 = _780;
    if (!_762)
    {
        _766 = _736;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_762)
    {
        _768 = _758;
    }
    float _788 = _768;
    bool _790 = !_762;
    float _792 = _788;
    if (!_790)
    {
        float _794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _798 = _760 + _796;
        float _800 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = rsqrt(_756);
        float _804 = _798 * _794;
        float _806 = _804 * 0.15915493667125701904296875;
        float _808 = _806 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = fma(_810, _800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _818 = _802 * _816;
        float _820 = _814 + (-1.0);
        float _822 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = fma(_748, _818, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _826 = fma(_744, _818, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _828 = fma(_758, _814, _822);
        _792 = _828;
        _782 = _824;
        _786 = _826;
    }
    float _830 = _792;
    float _832 = _782;
    float _834 = _786;
    float _836 = -_608;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _840 = -_612;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _844 = -_634;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _838 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _842 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = _850 * _850;
    float _862 = fma(_854, _854, _860);
    float _864 = fma(_858, _858, _862);
    float _866 = rsqrt(_864);
    float _868 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _870 = _854 * _868;
    float _872 = _858 * _868;
    float _874 = _870 * _870;
    float _876 = _872 * _872;
    float _878 = _874 + _876;
    float _880 = sqrt(_878);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = _880 + _884;
    float _888 = _736;
    float _890 = _886;
    float _892 = _850;
    float _894 = _870;
    if (_882)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _888 = _896;
    }
    float _898 = _888;
    if (_882)
    {
        float _900 = rsqrt(_878);
        _770 = _900;
    }
    float _902 = _770;
    float _904 = _902;
    if (_882)
    {
        float _906 = _886 * _898;
        _890 = _906;
    }
    float _908 = _890;
    if (_882)
    {
        float _910 = _908 * 0.15915493667125701904296875;
        _772 = _910;
    }
    float _912 = _772;
    float _914 = _858;
    if (_882)
    {
        float _916 = _912 * 6.283185482025146484375;
        float _918 = sin(_916);
        _914 = _918;
    }
    float _920 = _914;
    float _922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _924 = precise::max(0.0, _922);
    float _926 = _898;
    float _928 = _924;
    if (_882)
    {
        float _930 = _912 * 6.283185482025146484375;
        float _932 = cos(_930);
        _926 = _932;
    }
    float _934 = _926;
    float _936 = -_868;
    float _938 = -_924;
    float _940 = fma(_850, _936, _938);
    if (_882)
    {
        float _942 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _892 = _942;
    }
    float _944 = _892;
    float _946 = sqrt(_864);
    float _948 = _944;
    float _950 = _920;
    if (_882)
    {
        float _952 = fma(_920, _944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _948 = _952;
    }
    float _954 = _948;
    float _956 = _954;
    if (!_882)
    {
        _950 = _874;
    }
    float _958 = _950;
    float _960 = _958;
    float _962 = _934;
    if (_882)
    {
        float _964 = _934 + (-1.0);
        _928 = _964;
    }
    float _966 = _928;
    float _968 = _966;
    if (_882)
    {
        float _970 = _902 * _954;
        _774 = _970;
    }
    float _972 = _774;
    if (!_882)
    {
        _956 = _940;
    }
    float _974 = _956;
    float _976 = _974;
    if (_882)
    {
        float _978 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _978;
    }
    float _980 = _904;
    if (_882)
    {
        float _982 = _870 * _972;
        _894 = _982;
    }
    float _984 = _894;
    if (!_882)
    {
        _968 = _872;
    }
    float _986 = _968;
    float _988 = _986;
    if (_882)
    {
        float _990 = _872 * _972;
        _988 = _990;
    }
    float _992 = _988;
    if (_882)
    {
        float _994 = fma(_940, _934, _980);
        _976 = _994;
    }
    float _996 = _976;
    if (_882)
    {
        float _998 = _984 * _984;
        _960 = _998;
    }
    float _1000 = _960;
    if (!_882)
    {
        _962 = _876;
    }
    float _1002 = _962;
    float _1004 = _1002;
    if (_882)
    {
        float _1006 = _992 * _992;
        _1004 = _1006;
    }
    float _1008 = _1004;
    float _1010 = fma(_996, _996, _1000);
    float _1012 = _838 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = _1010 + _1008;
    float _1016 = _838 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = _838 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1026 = rsqrt(_1014);
    float _1028 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1016);
    float _1030 = -_1022;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1024);
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1038 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1028);
    float _1040 = _838 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1044 = abs(_1032);
    float _1046 = log2(_1044);
    float _1048 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1052 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1054 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1058 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1050);
    float _1060 = _1026 * _984;
    float _1062 = _1026 * _996;
    float _1064 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1070 = -_1056;
    float _1072 = fma(_1070, _1036, 1.0);
    float _1074 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1054);
    float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1066);
    float _1078 = _1026 * _992;
    float _1080 = -_1068;
    float _1082 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1080);
    float _1084 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1086 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1076);
    float _1088 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1090 = -_1078;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1082);
    float _1094 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1096 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1086);
    float _1098 = log2(_1072);
    float _1100 = fma(_1092, -0.5, 0.5);
    float _1102 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1104 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1094);
    float _1106 = fma(_1092, 0.5, 0.5);
    float _1108 = _1062 + 1.0;
    float _1110 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1102);
    float _1112 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1104);
    float _1114 = 1.0 / _1096;
    float _1116 = fma(_1106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1118 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1110);
    float _1120 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1112);
    float _1122 = fma(_1106, _1116, -0.212114393711090087890625);
    float _1124 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1118);
    float _1126 = exp2(_1088);
    float _1128 = fma(_1106, _1122, 1.570728778839111328125);
    float _1130 = _1098 * 0.693147182464599609375;
    float _1132 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1134 = sqrt(_1100);
    float _1136 = _1120 * _1114;
    float _1138 = _1124 * _1114;
    float _1140 = fma(_1138, -0.5, 0.5);
    float _1142 = -_1062;
    float _1144 = fma(_1126, _1108, _1142);
    float _1146 = fma(_1136, 0.5, 0.5);
    float _1148 = fma(_1144, 0.5, 0.5);
    float _1150 = _1134 * 0.636619746685028076171875;
    float3 _3204 = float3(_1146, _1140, _1132);
    float _1152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3204, float3(0.0), isnan(_3204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3204, float3(0.0), isnan(_3204)), level(0.0)).x;
    float _1154 = -_1128;
    float _1156 = fma(_1150, _1154, 1.0);
    float3 _3220 = float3(_1146, _1140, _1132);
    float4 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3220, float3(0.0), isnan(_3220)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3220, float3(0.0), isnan(_3220)), level(0.0)).xyzw;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = _1159.w;
    float2 _3237 = float2(_1156, _1148);
    float3 _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3237, float2(0.0), isnan(_3237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3237, float2(0.0), isnan(_3237)), level(0.0)).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_59.y;
    float _1181 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1185 = _1183 != 0;
    float _1187 = in.m_51.w;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1191 = _1189 != 0;
    float _1193 = in.m_61.x;
    float _1195 = in.m_61.y;
    float _1197 = in.m_61.z;
    float _1199 = in.m_61.w;
    float _1201 = exp2(_1181);
    float _1203 = in.m_59.x;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1207 = _1126;
    float _1209 = _1203;
    if (_1185)
    {
        float _1211 = in.m_51.z;
        _1207 = _1211;
    }
    float _1213 = _1207;
    float _1215 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _842;
    out.m_63.y = _838;
    out.m_63.z = _846;
    float _1217 = -_1179;
    float _1219 = _1217 + 1.0;
    float _1221 = -_1201;
    float _1223 = _1221 + 1.0;
    bool _1225 = _1187 > 0.5;
    float _1227 = _1179;
    if (_1191)
    {
        float _1229 = _1225 ? _1219 : _1179;
        _1227 = _1229;
    }
    float _1231 = _1227;
    float _1233 = _502 * _1197;
    float _1235 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1237 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1239 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1241 = _692 != 0.0;
    bool _1243 = isnan(_692);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = -_1233;
    float _1253 = fma(_506, _1193, _1251);
    bool _1255 = _1213 > 0.5;
    bool _1257 = _1255 && _1185;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1261 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1235);
    float _1263 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1237);
    float _1265 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1239);
    float _1267 = _504 * _1193;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1271 = _696 == 0.0;
    bool _1273 = !_1249;
    bool _1275 = _1271 && _1273;
    float _1277 = _506 * _1195;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1283 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1289 = _694 == 0.0;
    bool _1291 = _1289 && _1275;
    float _1293 = -_1277;
    float _1295 = fma(_504, _1197, _1293);
    float _1297 = _1253 * _1199;
    out.m_65.x = _1215;
    out.m_65.y = _1283;
    out.m_65.z = _1285;
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1295 * _1199;
    float _1303 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = -_1267;
    float _1309 = fma(_502, _1195, _1307);
    float _1311 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1261);
    float _1313 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1263);
    float _1315 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1265);
    out.m_67.x = _1299;
    out.m_67.y = _1303;
    out.m_67.z = _1305;
    float _1317 = _1285;
    float _1319 = _1267;
    if (!_1291)
    {
        float _1321 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _504);
        _776 = _1321;
    }
    float _1323 = _776;
    float _1325 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1327 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_69.x = _1311;
    out.m_69.y = _1313;
    out.m_69.z = _1315;
    if (!_1291)
    {
        float _1329 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _502);
        _778 = _1329;
    }
    float _1331 = _778;
    float _1333 = _1309 * _1199;
    float _1335 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1327);
    float _1337 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1291)
    {
        _1317 = _506;
    }
    float _1339 = _1317;
    float _1341 = _1339;
    if (!_1291)
    {
        float _1343 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[17].y, _506);
        _1341 = _1343;
    }
    float _1345 = _1341;
    if (_1185)
    {
        _1319 = _1203;
    }
    float _1347 = _1319;
    float _1349 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1351 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1337);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1355 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1349);
    float _1357 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1359 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1361 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1363 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1351);
    float _1365 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1325);
    float _1367 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1357);
    float _1369 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1359);
    float _1371 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1361);
    float _1373 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1363);
    float _1375 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1377 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1355);
    float _1379 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1365);
    float _1381 = -_634;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1387 = _1373 + _1096;
    float _1389 = _1347;
    if (_1257)
    {
        float _1391 = -_1347;
        float _1393 = _1391 + 1.0;
        _1389 = _1393;
    }
    float _1395 = _1389;
    out.m_71.x = _1375;
    out.m_71.y = _1377;
    out.m_71.z = _1379;
    float _1397 = -_608;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _382);
    float _1401 = _1387 * 0.5;
    float _1403 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1185)
    {
        _1209 = _1395;
    }
    float _1405 = _1209;
    float _1407 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1367);
    float _1409 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1369);
    float _1411 = _1403 * _1353;
    float _1413 = -_612;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _456);
    float _1417 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1419 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1371);
    float _1421 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1423 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1425 = _1417 * _1385;
    out.m_73.x = _1415;
    out.m_73.y = _1399;
    out.m_73.z = _1383;
    out.m_75.z = _1425;
    out.m_75.w = _1411;
    out.m_77.x = _1407;
    out.m_77.y = _1409;
    out.m_77.z = _1419;
    out.gl_Position.x = _1120;
    out.gl_Position.y = _1124;
    out.gl_Position.z = _1373;
    out.gl_Position.w = _1096;
    out.m_79.z = _1401;
    out.m_79.w = _1096;
    out.m_81.w = _1423;
    float _1427 = _1421 * _1152;
    float _1429 = -_1421;
    float _1431 = _1429 + 1.0;
    float _1433 = _1167 * _1427;
    float _1435 = _1167 * _1431;
    float _1437 = _1177 * _1427;
    float _1439 = fma(_1173, _1433, _1161);
    float _1441 = fma(_1175, _1433, _1163);
    float _1443 = fma(_1167, _1437, _1165);
    out.m_45.x = 1.0;
    out.m_83.x = _1439;
    out.m_83.y = _1441;
    out.m_83.z = _1443;
    out.m_83.w = _1435;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1500 = as_type<float>(_118);
        out.gl_Position.z = _1500;
    }
    if (!_106)
    {
        return out;
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_154);
        out.gl_Position.z = _1568;
    }
    if (_148)
    {
        return out;
    }
    float _156 = in.m_49.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _158);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_102);
        float _302 = 1.0 / _300;
        float _304 = _136 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = in.m_51.y;
    float _310 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = in.m_53.x;
    float _328 = in.m_53.y;
    float _330 = in.m_53.z;
    float _332 = 1.0 / _316;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _338 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = in.m_51.x;
    float _342 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _344 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _346 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _348 = 1.0 / _320;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = _306 + _350;
    float _354 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _356 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _344);
    float _358 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _346);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _366 = _306 + _364;
    float _368 = 1.0 / _324;
    float _370 = _352 * _332;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _306 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _378 = _306 + _376;
    float _380 = fma(_362, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _384 = 1.0 / _336;
    float _386 = _374 * _348;
    float _388 = _330 + _308;
    float _390 = _340 + _326;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = _378 * _368;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = fma(_398, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _408 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_306);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = _366 * _384;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _440 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _442 = isnan(_306);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = _354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _460 = _382 + _458;
    bool _462 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _464 = isnan(_306);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_450;
    float _476 = _474 + 1.0;
    float _478 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _388);
    float _480 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _390);
    float _482 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _484 = fma(_430, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _486 = fma(_394, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = fma(_436, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _490 = fma(_422, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = fma(_454, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _494 = _358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = _456 + _496;
    float _500 = _460 * _460;
    float _502 = in.m_55.x;
    float _504 = in.m_55.y;
    float _506 = in.m_55.z;
    float _508 = _418 * _476;
    float _510 = -_418;
    float _512 = _510 + 1.0;
    bool _514 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _516 = isnan(_306);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -_472;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = _494 + _530;
    float _534 = fma(_498, _498, _500);
    bool _536 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_306);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = _524 * _528;
    float _550 = -_524;
    float _552 = _550 + 1.0;
    float _554 = fma(_532, _532, _534);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _560 = _480 * 7.5;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _570 = fma(_558, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _572 = rsqrt(_554);
    float _574 = _560 * 0.15915493667125701904296875;
    float _576 = _546 * _552;
    float _578 = _478 * 15.0;
    float _580 = _472 * _512;
    float _582 = fma(_564, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _584 = _406 * _576;
    float _586 = _438 * _576;
    float _588 = _504 * _504;
    float _590 = _380 * _576;
    float _592 = fma(_568, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _594 = _578 * 0.15915493667125701904296875;
    float _596 = fma(_502, _502, _588);
    float _598 = -_546;
    float _600 = _598 + 1.0;
    float _602 = in.m_57.x;
    float _604 = _594 * 6.283185482025146484375;
    float _606 = sin(_604);
    float _608 = _460 * _572;
    float _610 = fma(_506, _506, _596);
    float _612 = _498 * _572;
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _616 = -_608;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _586);
    float _622 = -_612;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _626 = in.m_49.x;
    float _628 = in.m_49.y;
    float _630 = in.m_49.z;
    float _632 = _618 * _618;
    float _634 = _532 * _572;
    float _636 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _638 = fma(_482, _548, _614);
    float _640 = _574 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = fma(_624, _624, _632);
    float _646 = -_634;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _532);
    float _650 = fma(_484, _548, _620);
    float _652 = fma(_486, _548, _636);
    float _654 = fma(_488, _580, _638);
    float _656 = fma(_648, _648, _644);
    float _658 = fma(_490, _580, _650);
    float _660 = rsqrt(_610);
    float _662 = fma(_492, _580, _652);
    float _664 = fma(_570, _508, _654);
    float _666 = fma(_582, _508, _658);
    float _668 = _606 * 0.02999999932944774627685546875;
    float _670 = fma(_592, _508, _662);
    float _672 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].y, _666);
    float _674 = sqrt(_656);
    float _676 = _642 * 0.07999999821186065673828125;
    float _678 = _672 * _628;
    float _680 = fma(_676, _602, _328);
    float _682 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].x, _664);
    float _684 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].z, _670);
    float _686 = _660 * _668;
    float _688 = _682 * _626;
    float _690 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = fma(_504, _686, _680);
    float _694 = fma(_506, _686, _330);
    float _696 = fma(_502, _686, _326);
    float _698 = _684 * _630;
    float _700 = _572 * _674;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _692);
    float _704 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = _700 * _690;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _712 = _700 * _704;
    float _714 = _700 * _706;
    float _716 = _702 * _708;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _694);
    float _720 = _710 * _712;
    float _722 = _716 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _724 = _718 * _714;
    float _726 = _716 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[10].x, _722);
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].z, _728);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].z, _730);
    float _736 = _494 + _732;
    float _738 = _456 + _734;
    float _740 = _716 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _744 = _736 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _748 = _738 + _746;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[9].x, _740);
    float _752 = _744 * _744;
    float _754 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].z, _750);
    float _756 = fma(_748, _748, _752);
    float _758 = _382 + _754;
    float _760 = sqrt(_756);
    bool _762 = _760 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _764 = _716;
    float _766 = _752;
    float _768 = _750;
    float _770 = _758;
    float _772 = _748;
    float _774 = _672;
    float _776 = _504;
    float _778 = _502;
    if (!_762)
    {
        _764 = _738;
    }
    float _780 = _764;
    float _782 = _780;
    if (!_762)
    {
        _766 = _736;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_762)
    {
        _768 = _758;
    }
    float _788 = _768;
    bool _790 = !_762;
    float _792 = _788;
    if (!_790)
    {
        float _794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _798 = _760 + _796;
        float _800 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = rsqrt(_756);
        float _804 = _798 * _794;
        float _806 = _804 * 0.15915493667125701904296875;
        float _808 = _806 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = fma(_810, _800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _818 = _802 * _816;
        float _820 = _814 + (-1.0);
        float _822 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = fma(_748, _818, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _826 = fma(_744, _818, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _828 = fma(_758, _814, _822);
        _792 = _828;
        _782 = _824;
        _786 = _826;
    }
    float _830 = _792;
    float _832 = _782;
    float _834 = _786;
    float _836 = -_608;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _840 = -_612;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _844 = -_634;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _838 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _842 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = _850 * _850;
    float _862 = fma(_854, _854, _860);
    float _864 = fma(_858, _858, _862);
    float _866 = rsqrt(_864);
    float _868 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _870 = _854 * _868;
    float _872 = _858 * _868;
    float _874 = _870 * _870;
    float _876 = _872 * _872;
    float _878 = _874 + _876;
    float _880 = sqrt(_878);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = _880 + _884;
    float _888 = _736;
    float _890 = _886;
    float _892 = _850;
    float _894 = _870;
    if (_882)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _888 = _896;
    }
    float _898 = _888;
    if (_882)
    {
        float _900 = rsqrt(_878);
        _770 = _900;
    }
    float _902 = _770;
    float _904 = _902;
    if (_882)
    {
        float _906 = _886 * _898;
        _890 = _906;
    }
    float _908 = _890;
    if (_882)
    {
        float _910 = _908 * 0.15915493667125701904296875;
        _772 = _910;
    }
    float _912 = _772;
    float _914 = _858;
    if (_882)
    {
        float _916 = _912 * 6.283185482025146484375;
        float _918 = sin(_916);
        _914 = _918;
    }
    float _920 = _914;
    float _922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _924 = precise::max(0.0, _922);
    float _926 = _898;
    float _928 = _924;
    if (_882)
    {
        float _930 = _912 * 6.283185482025146484375;
        float _932 = cos(_930);
        _926 = _932;
    }
    float _934 = _926;
    float _936 = -_868;
    float _938 = -_924;
    float _940 = fma(_850, _936, _938);
    if (_882)
    {
        float _942 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _892 = _942;
    }
    float _944 = _892;
    float _946 = sqrt(_864);
    float _948 = _944;
    float _950 = _920;
    if (_882)
    {
        float _952 = fma(_920, _944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _948 = _952;
    }
    float _954 = _948;
    float _956 = _954;
    if (!_882)
    {
        _950 = _874;
    }
    float _958 = _950;
    float _960 = _958;
    float _962 = _934;
    if (_882)
    {
        float _964 = _934 + (-1.0);
        _928 = _964;
    }
    float _966 = _928;
    float _968 = _966;
    if (_882)
    {
        float _970 = _902 * _954;
        _774 = _970;
    }
    float _972 = _774;
    if (!_882)
    {
        _956 = _940;
    }
    float _974 = _956;
    float _976 = _974;
    if (_882)
    {
        float _978 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _978;
    }
    float _980 = _904;
    if (_882)
    {
        float _982 = _870 * _972;
        _894 = _982;
    }
    float _984 = _894;
    if (!_882)
    {
        _968 = _872;
    }
    float _986 = _968;
    float _988 = _986;
    if (_882)
    {
        float _990 = _872 * _972;
        _988 = _990;
    }
    float _992 = _988;
    if (_882)
    {
        float _994 = fma(_940, _934, _980);
        _976 = _994;
    }
    float _996 = _976;
    if (_882)
    {
        float _998 = _984 * _984;
        _960 = _998;
    }
    float _1000 = _960;
    if (!_882)
    {
        _962 = _876;
    }
    float _1002 = _962;
    float _1004 = _1002;
    if (_882)
    {
        float _1006 = _992 * _992;
        _1004 = _1006;
    }
    float _1008 = _1004;
    float _1010 = fma(_996, _996, _1000);
    float _1012 = _838 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = _1010 + _1008;
    float _1016 = _838 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = _838 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1026 = rsqrt(_1014);
    float _1028 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1016);
    float _1030 = -_1022;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1024);
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1038 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1028);
    float _1040 = _838 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1044 = abs(_1032);
    float _1046 = log2(_1044);
    float _1048 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1052 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1054 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1058 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1050);
    float _1060 = _1026 * _984;
    float _1062 = _1026 * _996;
    float _1064 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1070 = -_1056;
    float _1072 = fma(_1070, _1036, 1.0);
    float _1074 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1054);
    float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1066);
    float _1078 = _1026 * _992;
    float _1080 = -_1068;
    float _1082 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1080);
    float _1084 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1086 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1076);
    float _1088 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1090 = -_1078;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1082);
    float _1094 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1096 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1086);
    float _1098 = log2(_1072);
    float _1100 = fma(_1092, -0.5, 0.5);
    float _1102 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1104 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1094);
    float _1106 = fma(_1092, 0.5, 0.5);
    float _1108 = _1062 + 1.0;
    float _1110 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1102);
    float _1112 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1104);
    float _1114 = 1.0 / _1096;
    float _1116 = fma(_1106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1118 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1110);
    float _1120 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1112);
    float _1122 = fma(_1106, _1116, -0.212114393711090087890625);
    float _1124 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1118);
    float _1126 = exp2(_1088);
    float _1128 = fma(_1106, _1122, 1.570728778839111328125);
    float _1130 = _1098 * 0.693147182464599609375;
    float _1132 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1134 = sqrt(_1100);
    float _1136 = _1120 * _1114;
    float _1138 = _1124 * _1114;
    float _1140 = fma(_1138, -0.5, 0.5);
    float _1142 = -_1062;
    float _1144 = fma(_1126, _1108, _1142);
    float _1146 = fma(_1136, 0.5, 0.5);
    float _1148 = fma(_1144, 0.5, 0.5);
    float _1150 = _1134 * 0.636619746685028076171875;
    float3 _3204 = float3(_1146, _1140, _1132);
    float _1152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3204, float3(0.0), isnan(_3204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3204, float3(0.0), isnan(_3204)), level(0.0)).x;
    float _1154 = -_1128;
    float _1156 = fma(_1150, _1154, 1.0);
    float3 _3220 = float3(_1146, _1140, _1132);
    float4 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3220, float3(0.0), isnan(_3220)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3220, float3(0.0), isnan(_3220)), level(0.0)).xyzw;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = _1159.w;
    float2 _3237 = float2(_1156, _1148);
    float3 _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3237, float2(0.0), isnan(_3237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3237, float2(0.0), isnan(_3237)), level(0.0)).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_59.y;
    float _1181 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1185 = _1183 != 0;
    float _1187 = in.m_51.w;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1191 = _1189 != 0;
    float _1193 = in.m_61.x;
    float _1195 = in.m_61.y;
    float _1197 = in.m_61.z;
    float _1199 = in.m_61.w;
    float _1201 = exp2(_1181);
    float _1203 = in.m_59.x;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1207 = _1126;
    float _1209 = _1203;
    if (_1185)
    {
        float _1211 = in.m_51.z;
        _1207 = _1211;
    }
    float _1213 = _1207;
    float _1215 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _842;
    out.m_63.y = _838;
    out.m_63.z = _846;
    float _1217 = -_1179;
    float _1219 = _1217 + 1.0;
    float _1221 = -_1201;
    float _1223 = _1221 + 1.0;
    bool _1225 = _1187 > 0.5;
    float _1227 = _1179;
    if (_1191)
    {
        float _1229 = _1225 ? _1219 : _1179;
        _1227 = _1229;
    }
    float _1231 = _1227;
    float _1233 = _502 * _1197;
    float _1235 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1237 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1239 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1241 = _692 != 0.0;
    bool _1243 = isnan(_692);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = -_1233;
    float _1253 = fma(_506, _1193, _1251);
    bool _1255 = _1213 > 0.5;
    bool _1257 = _1255 && _1185;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1261 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1235);
    float _1263 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1237);
    float _1265 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1239);
    float _1267 = _504 * _1193;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1271 = _696 == 0.0;
    bool _1273 = !_1249;
    bool _1275 = _1271 && _1273;
    float _1277 = _506 * _1195;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1283 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1289 = _694 == 0.0;
    bool _1291 = _1289 && _1275;
    float _1293 = -_1277;
    float _1295 = fma(_504, _1197, _1293);
    float _1297 = _1253 * _1199;
    out.m_65.x = _1215;
    out.m_65.y = _1283;
    out.m_65.z = _1285;
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1295 * _1199;
    float _1303 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = -_1267;
    float _1309 = fma(_502, _1195, _1307);
    float _1311 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1261);
    float _1313 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1263);
    float _1315 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1265);
    out.m_67.x = _1299;
    out.m_67.y = _1303;
    out.m_67.z = _1305;
    float _1317 = _1285;
    float _1319 = _1267;
    if (!_1291)
    {
        float _1321 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _504);
        _776 = _1321;
    }
    float _1323 = _776;
    float _1325 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1327 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_69.x = _1311;
    out.m_69.y = _1313;
    out.m_69.z = _1315;
    if (!_1291)
    {
        float _1329 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _502);
        _778 = _1329;
    }
    float _1331 = _778;
    float _1333 = _1309 * _1199;
    float _1335 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1327);
    float _1337 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1291)
    {
        _1317 = _506;
    }
    float _1339 = _1317;
    float _1341 = _1339;
    if (!_1291)
    {
        float _1343 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[17].y, _506);
        _1341 = _1343;
    }
    float _1345 = _1341;
    if (_1185)
    {
        _1319 = _1203;
    }
    float _1347 = _1319;
    float _1349 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1351 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1337);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1355 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1349);
    float _1357 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1359 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1361 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1363 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1351);
    float _1365 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1325);
    float _1367 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1357);
    float _1369 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1359);
    float _1371 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1361);
    float _1373 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1363);
    float _1375 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1377 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1355);
    float _1379 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1365);
    float _1381 = -_634;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1387 = _1373 + _1096;
    float _1389 = _1347;
    if (_1257)
    {
        float _1391 = -_1347;
        float _1393 = _1391 + 1.0;
        _1389 = _1393;
    }
    float _1395 = _1389;
    out.m_71.x = _1375;
    out.m_71.y = _1377;
    out.m_71.z = _1379;
    float _1397 = -_608;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _382);
    float _1401 = _1387 * 0.5;
    float _1403 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1185)
    {
        _1209 = _1395;
    }
    float _1405 = _1209;
    float _1407 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1367);
    float _1409 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1369);
    float _1411 = _1403 * _1353;
    float _1413 = -_612;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _456);
    float _1417 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1419 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1371);
    float _1421 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1423 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1425 = _1417 * _1385;
    out.m_73.x = _1415;
    out.m_73.y = _1399;
    out.m_73.z = _1383;
    out.m_75.z = _1425;
    out.m_75.w = _1411;
    out.m_77.x = _1407;
    out.m_77.y = _1409;
    out.m_77.z = _1419;
    out.gl_Position.x = _1120;
    out.gl_Position.y = _1124;
    out.gl_Position.z = _1373;
    out.gl_Position.w = _1096;
    out.m_79.z = _1401;
    out.m_79.w = _1096;
    out.m_81.w = _1423;
    float _1427 = _1421 * _1152;
    float _1429 = -_1421;
    float _1431 = _1429 + 1.0;
    float _1433 = _1167 * _1427;
    float _1435 = _1167 * _1431;
    float _1437 = _1177 * _1427;
    float _1439 = fma(_1173, _1433, _1161);
    float _1441 = fma(_1175, _1433, _1163);
    float _1443 = fma(_1167, _1437, _1165);
    out.m_45.x = 1.0;
    out.m_83.x = _1439;
    out.m_83.y = _1441;
    out.m_83.z = _1443;
    out.m_83.w = _1435;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_42.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    float _112 = _110;
    if (!_106)
    {
        out.m_45.x = 0.0;
    }
    int _114 = 0;
    if (!_106)
    {
        float _116 = _110 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    int _120 = _118;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1500 = as_type<float>(_118);
        out.gl_Position.z = _1500;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _122 = in.m_47.w;
    bool _124 = _122 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_122);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = -_122;
    float _136 = _134 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _138 = 0.0;
    if (_132)
    {
        float _140 = float(_102);
        _138 = _140;
    }
    float _142 = _138;
    bool _144 = _136 >= _142;
    bool _146 = !_132;
    bool _148 = _144 || _146;
    if (_148)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _112;
    if (_148)
    {
        out.m_45.x = 0.0;
    }
    if (_148)
    {
        float _152 = _150 * 5.0;
        _120 = as_type<int>(_152);
    }
    int _154 = _120;
    if (_148)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1568 = as_type<float>(_154);
        out.gl_Position.z = _1568;
    }
    if (_148)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _156 = in.m_49.w;
    float _158 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_47.x;
    float _172 = in.m_47.y;
    float _174 = in.m_47.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = 0.0;
    float _184 = _158;
    if (!_168)
    {
        float _186 = _158 * _158;
        float _188 = _186 * 0.5;
        _182 = _188;
    }
    float _190 = _182;
    float _192 = _190;
    if (!_168)
    {
        float _194 = _190 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _192 = _194;
    }
    float _196 = _192;
    bool _198 = !_168;
    float _200 = _196;
    if (!_198)
    {
        float _202 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _204 = log2(_202);
        float _206 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _208 = _206 + 1.0;
        float _210 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _212 = _158 * _204;
        float _214 = exp2(_212);
        float _216 = _210 * 0.693147182464599609375;
        float _218 = 1.0 / _216;
        float _220 = 1.0 / _208;
        float _222 = _214 + (-1.0);
        float _224 = -_222;
        float _226 = fma(_224, _218, _158);
        float _228 = _226 * _220;
        float _230 = _228 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _200 = _230;
    }
    float _232 = _200;
    bool _234 = !_168;
    if (!_234)
    {
        float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _238 = log2(_236);
        float _240 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _242 = _240 + 1.0;
        float _244 = 1.0 / _242;
        float _246 = _158 * _238;
        float _248 = exp2(_246);
        float _250 = -_248;
        float _252 = _250 + 1.0;
        float _254 = _252 * _244;
        _184 = _254;
    }
    float _256 = _184;
    bool _258 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _260 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _264 = _232 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _266 = fma(_256, _170, _260);
    float _268 = fma(_256, _172, _262);
    float _270 = fma(_256, _174, _264);
    float _272 = fma(_266, _156, _176);
    float _274 = fma(_268, _156, _178);
    float _276 = fma(_270, _156, _180);
    bool _278 = !_258;
    float _296;
    if (!_278)
    {
        float _280 = in.m_51.x;
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _280 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _136);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        float _300 = float(_102);
        float _302 = 1.0 / _300;
        float _304 = _136 * _302;
        _296 = _304;
    }
    _298 = false;
    float _306 = _296;
    float _308 = in.m_51.y;
    float _310 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _316 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _314;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _322;
    float _326 = in.m_53.x;
    float _328 = in.m_53.y;
    float _330 = in.m_53.z;
    float _332 = 1.0 / _316;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _338 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _340 = in.m_51.x;
    float _342 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _344 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _346 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _338);
    float _348 = 1.0 / _320;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _352 = _306 + _350;
    float _354 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _342);
    float _356 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _344);
    float _358 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _346);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _366 = _306 + _364;
    float _368 = 1.0 / _324;
    float _370 = _352 * _332;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _374 = _306 + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _378 = _306 + _376;
    float _380 = fma(_362, _370, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _382 = _356 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _384 = 1.0 / _336;
    float _386 = _374 * _348;
    float _388 = _330 + _308;
    float _390 = _340 + _326;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = _378 * _368;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _406 = fma(_398, _370, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _408 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _410 = isnan(_306);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _422 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _420;
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _424;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = _366 * _384;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _434;
    float _438 = fma(_426, _370, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _440 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _442 = isnan(_306);
    bool _444 = _440 || _442;
    bool _446 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _448 = _444 || _446;
    float _450 = float(_448);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = _354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _458 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _460 = _382 + _458;
    bool _462 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _464 = isnan(_306);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _470 = _466 || _468;
    float _472 = float(_470);
    float _474 = -_450;
    float _476 = _474 + 1.0;
    float _478 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, 0.008000000379979610443115234375, _388);
    float _480 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, -0.008000000379979610443115234375, _390);
    float _482 = fma(_404, _386, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _484 = fma(_430, _386, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _486 = fma(_394, _386, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _488 = fma(_436, _400, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _490 = fma(_422, _400, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _492 = fma(_454, _400, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _494 = _358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _496 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _498 = _456 + _496;
    float _500 = _460 * _460;
    float _502 = in.m_55.x;
    float _504 = in.m_55.y;
    float _506 = in.m_55.z;
    float _508 = _418 * _476;
    float _510 = -_418;
    float _512 = _510 + 1.0;
    bool _514 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _516 = isnan(_306);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -_472;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _532 = _494 + _530;
    float _534 = fma(_498, _498, _500);
    bool _536 = _306 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_306);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = _524 * _528;
    float _550 = -_524;
    float _552 = _550 + 1.0;
    float _554 = fma(_532, _532, _534);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _560 = _480 * 7.5;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _568 = _566 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _570 = fma(_558, _432, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _572 = rsqrt(_554);
    float _574 = _560 * 0.15915493667125701904296875;
    float _576 = _546 * _552;
    float _578 = _478 * 15.0;
    float _580 = _472 * _512;
    float _582 = fma(_564, _432, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _584 = _406 * _576;
    float _586 = _438 * _576;
    float _588 = _504 * _504;
    float _590 = _380 * _576;
    float _592 = fma(_568, _432, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _594 = _578 * 0.15915493667125701904296875;
    float _596 = fma(_502, _502, _588);
    float _598 = -_546;
    float _600 = _598 + 1.0;
    float _602 = in.m_57.x;
    float _604 = _594 * 6.283185482025146484375;
    float _606 = sin(_604);
    float _608 = _460 * _572;
    float _610 = fma(_506, _506, _596);
    float _612 = _498 * _572;
    float _614 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].x, _584);
    float _616 = -_608;
    float _618 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[18].w, _460);
    float _620 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].y, _586);
    float _622 = -_612;
    float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[18].w, _498);
    float _626 = in.m_49.x;
    float _628 = in.m_49.y;
    float _630 = in.m_49.z;
    float _632 = _618 * _618;
    float _634 = _532 * _572;
    float _636 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[143].z, _590);
    float _638 = fma(_482, _548, _614);
    float _640 = _574 * 6.283185482025146484375;
    float _642 = sin(_640);
    float _644 = fma(_624, _624, _632);
    float _646 = -_634;
    float _648 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[18].w, _532);
    float _650 = fma(_484, _548, _620);
    float _652 = fma(_486, _548, _636);
    float _654 = fma(_488, _580, _638);
    float _656 = fma(_648, _648, _644);
    float _658 = fma(_490, _580, _650);
    float _660 = rsqrt(_610);
    float _662 = fma(_492, _580, _652);
    float _664 = fma(_570, _508, _654);
    float _666 = fma(_582, _508, _658);
    float _668 = _606 * 0.02999999932944774627685546875;
    float _670 = fma(_592, _508, _662);
    float _672 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].y, _666);
    float _674 = sqrt(_656);
    float _676 = _642 * 0.07999999821186065673828125;
    float _678 = _672 * _628;
    float _680 = fma(_676, _602, _328);
    float _682 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].x, _664);
    float _684 = fma(_450, (*spvDescriptorSet0.vp_c9)._m0[147].z, _670);
    float _686 = _660 * _668;
    float _688 = _682 * _626;
    float _690 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _692 = fma(_504, _686, _680);
    float _694 = fma(_506, _686, _330);
    float _696 = fma(_502, _686, _326);
    float _698 = _684 * _630;
    float _700 = _572 * _674;
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _692);
    float _704 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = _700 * _690;
    float _710 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _696);
    float _712 = _700 * _704;
    float _714 = _700 * _706;
    float _716 = _702 * _708;
    float _718 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _694);
    float _720 = _710 * _712;
    float _722 = _716 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _724 = _718 * _714;
    float _726 = _716 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _728 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[10].x, _722);
    float _730 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[8].x, _726);
    float _732 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].z, _728);
    float _734 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[8].z, _730);
    float _736 = _494 + _732;
    float _738 = _456 + _734;
    float _740 = _716 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _742 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _744 = _736 + _742;
    float _746 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _748 = _738 + _746;
    float _750 = fma(_720, (*spvDescriptorSet0.vp_c10)._m0[9].x, _740);
    float _752 = _744 * _744;
    float _754 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[9].z, _750);
    float _756 = fma(_748, _748, _752);
    float _758 = _382 + _754;
    float _760 = sqrt(_756);
    bool _762 = _760 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _764 = _716;
    float _766 = _752;
    float _768 = _750;
    float _770 = _758;
    float _772 = _748;
    float _774 = _672;
    float _776 = _504;
    float _778 = _502;
    if (!_762)
    {
        _764 = _738;
    }
    float _780 = _764;
    float _782 = _780;
    if (!_762)
    {
        _766 = _736;
    }
    float _784 = _766;
    float _786 = _784;
    if (!_762)
    {
        _768 = _758;
    }
    float _788 = _768;
    bool _790 = !_762;
    float _792 = _788;
    if (!_790)
    {
        float _794 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _796 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _798 = _760 + _796;
        float _800 = _758 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _802 = rsqrt(_756);
        float _804 = _798 * _794;
        float _806 = _804 * 0.15915493667125701904296875;
        float _808 = _806 * 6.283185482025146484375;
        float _810 = sin(_808);
        float _812 = _806 * 6.283185482025146484375;
        float _814 = cos(_812);
        float _816 = fma(_810, _800, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _818 = _802 * _816;
        float _820 = _814 + (-1.0);
        float _822 = _820 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _824 = fma(_748, _818, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _826 = fma(_744, _818, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _828 = fma(_758, _814, _822);
        _792 = _828;
        _782 = _824;
        _786 = _826;
    }
    float _830 = _792;
    float _832 = _782;
    float _834 = _786;
    float _836 = -_608;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _830);
    float _840 = -_612;
    float _842 = fma(_840, (*spvDescriptorSet0.vp_c9)._m0[18].w, _832);
    float _844 = -_634;
    float _846 = fma(_844, (*spvDescriptorSet0.vp_c9)._m0[18].w, _834);
    float _848 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _850 = _838 + _848;
    float _852 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _854 = _842 + _852;
    float _856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _858 = _846 + _856;
    float _860 = _850 * _850;
    float _862 = fma(_854, _854, _860);
    float _864 = fma(_858, _858, _862);
    float _866 = rsqrt(_864);
    float _868 = _866 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _870 = _854 * _868;
    float _872 = _858 * _868;
    float _874 = _870 * _870;
    float _876 = _872 * _872;
    float _878 = _874 + _876;
    float _880 = sqrt(_878);
    bool _882 = _880 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _884 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _886 = _880 + _884;
    float _888 = _736;
    float _890 = _886;
    float _892 = _850;
    float _894 = _870;
    if (_882)
    {
        float _896 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _888 = _896;
    }
    float _898 = _888;
    if (_882)
    {
        float _900 = rsqrt(_878);
        _770 = _900;
    }
    float _902 = _770;
    float _904 = _902;
    if (_882)
    {
        float _906 = _886 * _898;
        _890 = _906;
    }
    float _908 = _890;
    if (_882)
    {
        float _910 = _908 * 0.15915493667125701904296875;
        _772 = _910;
    }
    float _912 = _772;
    float _914 = _858;
    if (_882)
    {
        float _916 = _912 * 6.283185482025146484375;
        float _918 = sin(_916);
        _914 = _918;
    }
    float _920 = _914;
    float _922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _924 = precise::max(0.0, _922);
    float _926 = _898;
    float _928 = _924;
    if (_882)
    {
        float _930 = _912 * 6.283185482025146484375;
        float _932 = cos(_930);
        _926 = _932;
    }
    float _934 = _926;
    float _936 = -_868;
    float _938 = -_924;
    float _940 = fma(_850, _936, _938);
    if (_882)
    {
        float _942 = _940 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _892 = _942;
    }
    float _944 = _892;
    float _946 = sqrt(_864);
    float _948 = _944;
    float _950 = _920;
    if (_882)
    {
        float _952 = fma(_920, _944, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _948 = _952;
    }
    float _954 = _948;
    float _956 = _954;
    if (!_882)
    {
        _950 = _874;
    }
    float _958 = _950;
    float _960 = _958;
    float _962 = _934;
    if (_882)
    {
        float _964 = _934 + (-1.0);
        _928 = _964;
    }
    float _966 = _928;
    float _968 = _966;
    if (_882)
    {
        float _970 = _902 * _954;
        _774 = _970;
    }
    float _972 = _774;
    if (!_882)
    {
        _956 = _940;
    }
    float _974 = _956;
    float _976 = _974;
    if (_882)
    {
        float _978 = _966 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _904 = _978;
    }
    float _980 = _904;
    if (_882)
    {
        float _982 = _870 * _972;
        _894 = _982;
    }
    float _984 = _894;
    if (!_882)
    {
        _968 = _872;
    }
    float _986 = _968;
    float _988 = _986;
    if (_882)
    {
        float _990 = _872 * _972;
        _988 = _990;
    }
    float _992 = _988;
    if (_882)
    {
        float _994 = fma(_940, _934, _980);
        _976 = _994;
    }
    float _996 = _976;
    if (_882)
    {
        float _998 = _984 * _984;
        _960 = _998;
    }
    float _1000 = _960;
    if (!_882)
    {
        _962 = _876;
    }
    float _1002 = _962;
    float _1004 = _1002;
    if (_882)
    {
        float _1006 = _992 * _992;
        _1004 = _1006;
    }
    float _1008 = _1004;
    float _1010 = fma(_996, _996, _1000);
    float _1012 = _838 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1014 = _1010 + _1008;
    float _1016 = _838 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1018 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1020 = fma(_946, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1018);
    float _1022 = precise::clamp(_1020, 0.0, 1.0);
    float _1024 = _838 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1026 = rsqrt(_1014);
    float _1028 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1016);
    float _1030 = -_1022;
    float _1032 = _1030 + 1.0;
    float _1034 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1024);
    float _1036 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1038 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1028);
    float _1040 = _838 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1042 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1034);
    float _1044 = abs(_1032);
    float _1046 = log2(_1044);
    float _1048 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1050 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1040);
    float _1052 = _1042 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1054 = fma(_842, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1012);
    float _1056 = _1048 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1058 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1050);
    float _1060 = _1026 * _984;
    float _1062 = _1026 * _996;
    float _1064 = _1058 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1066 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1068 = _1060 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1070 = -_1056;
    float _1072 = fma(_1070, _1036, 1.0);
    float _1074 = fma(_846, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1054);
    float _1076 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1066);
    float _1078 = _1026 * _992;
    float _1080 = -_1068;
    float _1082 = fma(_1062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1080);
    float _1084 = _1074 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1086 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1076);
    float _1088 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1090 = -_1078;
    float _1092 = fma(_1090, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1082);
    float _1094 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1096 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1086);
    float _1098 = log2(_1072);
    float _1100 = fma(_1092, -0.5, 0.5);
    float _1102 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1104 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1094);
    float _1106 = fma(_1092, 0.5, 0.5);
    float _1108 = _1062 + 1.0;
    float _1110 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1102);
    float _1112 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1104);
    float _1114 = 1.0 / _1096;
    float _1116 = fma(_1106, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1118 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1110);
    float _1120 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1112);
    float _1122 = fma(_1106, _1116, -0.212114393711090087890625);
    float _1124 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1118);
    float _1126 = exp2(_1088);
    float _1128 = fma(_1106, _1122, 1.570728778839111328125);
    float _1130 = _1098 * 0.693147182464599609375;
    float _1132 = _1130 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1134 = sqrt(_1100);
    float _1136 = _1120 * _1114;
    float _1138 = _1124 * _1114;
    float _1140 = fma(_1138, -0.5, 0.5);
    float _1142 = -_1062;
    float _1144 = fma(_1126, _1108, _1142);
    float _1146 = fma(_1136, 0.5, 0.5);
    float _1148 = fma(_1144, 0.5, 0.5);
    float _1150 = _1134 * 0.636619746685028076171875;
    float3 _3204 = float3(_1146, _1140, _1132);
    float _1152 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3204, float3(0.0), isnan(_3204)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3204, float3(0.0), isnan(_3204)), level(0.0)).x;
    float _1154 = -_1128;
    float _1156 = fma(_1150, _1154, 1.0);
    float3 _3220 = float3(_1146, _1140, _1132);
    float4 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3220, float3(0.0), isnan(_3220)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3220, float3(0.0), isnan(_3220)), level(0.0)).xyzw;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = _1159.w;
    float2 _3237 = float2(_1156, _1148);
    float3 _1171 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3237, float2(0.0), isnan(_3237)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3237, float2(0.0), isnan(_3237)), level(0.0)).xyz;
    float _1173 = _1171.x;
    float _1175 = _1171.y;
    float _1177 = _1171.z;
    float _1179 = in.m_59.y;
    float _1181 = _1046 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1183 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1185 = _1183 != 0;
    float _1187 = in.m_51.w;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1191 = _1189 != 0;
    float _1193 = in.m_61.x;
    float _1195 = in.m_61.y;
    float _1197 = in.m_61.z;
    float _1199 = in.m_61.w;
    float _1201 = exp2(_1181);
    float _1203 = in.m_59.x;
    float _1205 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1207 = _1126;
    float _1209 = _1203;
    if (_1185)
    {
        float _1211 = in.m_51.z;
        _1207 = _1211;
    }
    float _1213 = _1207;
    float _1215 = _1205 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_63.x = _842;
    out.m_63.y = _838;
    out.m_63.z = _846;
    float _1217 = -_1179;
    float _1219 = _1217 + 1.0;
    float _1221 = -_1201;
    float _1223 = _1221 + 1.0;
    bool _1225 = _1187 > 0.5;
    float _1227 = _1179;
    if (_1191)
    {
        float _1229 = _1225 ? _1219 : _1179;
        _1227 = _1229;
    }
    float _1231 = _1227;
    float _1233 = _502 * _1197;
    float _1235 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1237 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1239 = _1195 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    bool _1241 = _692 != 0.0;
    bool _1243 = isnan(_692);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan(0.0);
    bool _1249 = _1245 || _1247;
    float _1251 = -_1233;
    float _1253 = fma(_506, _1193, _1251);
    bool _1255 = _1213 > 0.5;
    bool _1257 = _1255 && _1185;
    float _1259 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1261 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1235);
    float _1263 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1237);
    float _1265 = fma(_1193, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1239);
    float _1267 = _504 * _1193;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1271 = _696 == 0.0;
    bool _1273 = !_1249;
    bool _1275 = _1271 && _1273;
    float _1277 = _506 * _1195;
    float _1279 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1283 = _1259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1285 = _1269 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1287 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1289 = _694 == 0.0;
    bool _1291 = _1289 && _1275;
    float _1293 = -_1277;
    float _1295 = fma(_504, _1197, _1293);
    float _1297 = _1253 * _1199;
    out.m_65.x = _1215;
    out.m_65.y = _1283;
    out.m_65.z = _1285;
    float _1299 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1301 = _1295 * _1199;
    float _1303 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1305 = _1287 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1307 = -_1267;
    float _1309 = fma(_502, _1195, _1307);
    float _1311 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1261);
    float _1313 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1263);
    float _1315 = fma(_1197, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1265);
    out.m_67.x = _1299;
    out.m_67.y = _1303;
    out.m_67.z = _1305;
    float _1317 = _1285;
    float _1319 = _1267;
    if (!_1291)
    {
        float _1321 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _504);
        _776 = _1321;
    }
    float _1323 = _776;
    float _1325 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1327 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    out.m_69.x = _1311;
    out.m_69.y = _1313;
    out.m_69.z = _1315;
    if (!_1291)
    {
        float _1329 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _502);
        _778 = _1329;
    }
    float _1331 = _778;
    float _1333 = _1309 * _1199;
    float _1335 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1327);
    float _1337 = _1052 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    if (_1291)
    {
        _1317 = _506;
    }
    float _1339 = _1317;
    float _1341 = _1339;
    if (!_1291)
    {
        float _1343 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[17].y, _506);
        _1341 = _1343;
    }
    float _1345 = _1341;
    if (_1185)
    {
        _1319 = _1203;
    }
    float _1347 = _1319;
    float _1349 = _1297 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1351 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1337);
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1355 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1349);
    float _1357 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1359 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1361 = _1323 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1363 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1351);
    float _1365 = fma(_1301, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1325);
    float _1367 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1357);
    float _1369 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1359);
    float _1371 = fma(_1331, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1361);
    float _1373 = fma(_1084, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1363);
    float _1375 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1335);
    float _1377 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1355);
    float _1379 = fma(_1333, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1365);
    float _1381 = -_634;
    float _1383 = fma(_1381, (*spvDescriptorSet0.vp_c9)._m0[18].w, _494);
    float _1385 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1387 = _1373 + _1096;
    float _1389 = _1347;
    if (_1257)
    {
        float _1391 = -_1347;
        float _1393 = _1391 + 1.0;
        _1389 = _1393;
    }
    float _1395 = _1389;
    out.m_71.x = _1375;
    out.m_71.y = _1377;
    out.m_71.z = _1379;
    float _1397 = -_608;
    float _1399 = fma(_1397, (*spvDescriptorSet0.vp_c9)._m0[18].w, _382);
    float _1401 = _1387 * 0.5;
    float _1403 = _1231 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_1185)
    {
        _1209 = _1395;
    }
    float _1405 = _1209;
    float _1407 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1367);
    float _1409 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1369);
    float _1411 = _1403 * _1353;
    float _1413 = -_612;
    float _1415 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[18].w, _456);
    float _1417 = _1405 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1419 = fma(_1345, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1371);
    float _1421 = _1223 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1423 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1425 = _1417 * _1385;
    out.m_73.x = _1415;
    out.m_73.y = _1399;
    out.m_73.z = _1383;
    out.m_75.z = _1425;
    out.m_75.w = _1411;
    out.m_77.x = _1407;
    out.m_77.y = _1409;
    out.m_77.z = _1419;
    out.gl_Position.x = _1120;
    out.gl_Position.y = _1124;
    out.gl_Position.z = _1373;
    out.gl_Position.w = _1096;
    out.m_79.z = _1401;
    out.m_79.w = _1096;
    out.m_81.w = _1423;
    float _1427 = _1421 * _1152;
    float _1429 = -_1421;
    float _1431 = _1429 + 1.0;
    float _1433 = _1167 * _1427;
    float _1435 = _1167 * _1431;
    float _1437 = _1177 * _1427;
    float _1439 = fma(_1173, _1433, _1161);
    float _1441 = fma(_1175, _1433, _1163);
    float _1443 = fma(_1167, _1437, _1165);
    out.m_45.x = 1.0;
    out.m_83.x = _1439;
    out.m_83.y = _1441;
    out.m_83.z = _1443;
    out.m_83.w = _1435;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

