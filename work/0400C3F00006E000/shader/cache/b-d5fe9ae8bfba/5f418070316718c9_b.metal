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
    constant _16* vp_c10 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c15 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture2d<float> vp_t_tcb_1C [[id(7)]];
    sampler vp_t_tcb_1CSmplr [[id(8)]];
    sampler vp_t_tcb_32Smplr_w [[id(9)]];
    sampler vp_t_tcb_1CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_71 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_63 [[user(locn6)]];
    float4 m_65 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    uint4 m_55 [[attribute(0)]];
    float4 m_40 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_40.w;
    float _89 = in.m_42.w;
    float _91 = trunc(_87);
    int _94 = int(_91);
    float _96 = -_89;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_45.y = _98;
    bool _102 = _94 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_94);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1049 = as_type<float>(_114);
        out.gl_Position.z = _1049;
    }
    if (!_102)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _118 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_89);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_94);
    bool _130 = _98 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    if (_134)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _106;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _116 = as_type<int>(_138);
    }
    int _140 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1104 = as_type<float>(_140);
        out.gl_Position.z = _1104;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    bool _154 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _156 = isnan(0.5);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _162 = _158 || _160;
    float _164 = in.m_40.x;
    float _166 = in.m_40.y;
    float _168 = in.m_40.z;
    float _170 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _172 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _174 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _148);
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _152);
    float _186 = _178 * _176;
    float _188 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = _182 * _180;
    float _192 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _194 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _196 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _198 = _190 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _200 = _192 * _184;
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _194);
    float _204 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    float _206 = _190 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _208 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _198);
    float _210 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _202);
    float _212 = _204 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _214 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _206);
    float _216 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[10].z, _208);
    float _218 = _210 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _220 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _222 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[8].z, _214);
    float _224 = _212 + _216;
    float _226 = _190 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _228 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _220);
    float _230 = _218 + _222;
    float _232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _234 = _224 + _232;
    float _236 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _226);
    float _238 = _216;
    float _240 = _228;
    float _242 = _164;
    if (_162)
    {
        _238 = 1.0;
    }
    float _244 = _238;
    float _246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _248 = _230 + _246;
    float _250 = _234 * _234;
    float _252 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[9].z, _236);
    float _254 = fma(_248, _248, _250);
    float _256 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _228);
    float _258 = sqrt(_254);
    float _260 = _256 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _262 = _260 + _252;
    bool _264 = _258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _266 = _262;
    float _268 = _244;
    if (!_264)
    {
        _240 = _230;
    }
    float _270 = _240;
    float _272 = _270;
    if (!_264)
    {
        _242 = _224;
    }
    float _274 = _242;
    bool _276 = !_264;
    float _278 = _274;
    if (!_276)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _284 = _258 + _282;
        float _286 = _262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _288 = rsqrt(_254);
        float _290 = _284 * _280;
        float _292 = _290 * 0.15915493667125701904296875;
        float _294 = _292 * 6.283185482025146484375;
        float _296 = cos(_294);
        float _298 = _292 * 6.283185482025146484375;
        float _300 = sin(_298);
        float _302 = _296 + (-1.0);
        float _304 = fma(_300, _286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _306 = _302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _308 = _288 * _304;
        float _310 = fma(_262, _296, _306);
        float _312 = fma(_248, _308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _314 = fma(_234, _308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _266 = _310;
        _272 = _312;
        _278 = _314;
    }
    float _316 = _266;
    float _318 = _272;
    float _320 = _278;
    if (!_162)
    {
        float _322 = as_type<float>(in.m_55.w);
        int _324 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _326 = _324 == 4;
        bool _328 = _324 == 8;
        bool _330 = _324 == 12;
        int _332 = as_type<int>(_322) << 16;
        int _334 = as_type<int>(_322) << 8;
        int _336 = as_type<int>(_322) << 24;
        int _338 = _332 >> 24;
        int _340 = _334 >> 24;
        int _342 = as_type<int>(_322) >> 24;
        int _344 = _336 >> 24;
        float _346 = float(_338);
        float _348 = float(_340);
        float _350 = float(_342);
        float _352 = _346 * 0.0078740157186985015869140625;
        float _354 = float(_344);
        float _356 = _348 * 0.0078740157186985015869140625;
        float _358 = _350 * 0.0078740157186985015869140625;
        float _360 = precise::min(_352, 1.0);
        float _362 = _354 * 0.0078740157186985015869140625;
        float _364 = precise::min(_356, 1.0);
        float _366 = precise::min(_358, 1.0);
        float _368 = precise::min(_362, 1.0);
        float _370 = precise::max(_360, -1.0);
        float _372 = precise::max(_364, -1.0);
        float _374 = precise::max(_366, -1.0);
        float _376 = precise::max(_368, -1.0);
        float _378 = _376;
        if (_326)
        {
            _378 = _370;
        }
        float _380 = _378;
        float _382 = _380;
        if (_328)
        {
            _382 = _372;
        }
        float _384 = _382;
        float _386 = _384;
        if (_330)
        {
            _386 = _374;
        }
        float _388 = _386;
        float _390 = abs(_388);
        float _392 = (-0.0) + _390;
        _268 = _392;
    }
    float _394 = _268;
    float _396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _398 = _316 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _402 = _318 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _406 = _320 + _404;
    float _408 = _398 * _398;
    float _410 = fma(_402, _402, _408);
    float _412 = fma(_406, _406, _410);
    float _414 = rsqrt(_412);
    float _416 = sqrt(_412);
    float _418 = _414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _420 = _402 * _418;
    float _422 = _406 * _418;
    float _424 = _420 * _420;
    float _426 = _422 * _422;
    float _428 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _430 = _424 + _426;
    float _432 = precise::max(0.0, _428);
    float _434 = sqrt(_430);
    float _436 = -_418;
    float _438 = -_432;
    float _440 = fma(_398, _436, _438);
    bool _442 = _434 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _444 = _418;
    float _446 = _398;
    float _448 = _432;
    float _450 = _424;
    float _452 = _426;
    if (!_442)
    {
        _444 = _420;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_442)
    {
        _446 = _440;
    }
    float _458 = _446;
    float _460 = _458;
    if (!_442)
    {
        _448 = _422;
    }
    float _462 = _448;
    bool _464 = !_442;
    float _466 = _462;
    if (!_464)
    {
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _472 = _434 + _470;
        float _474 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _476 = rsqrt(_430);
        float _478 = _472 * _468;
        float _480 = _478 * 0.15915493667125701904296875;
        float _482 = _480 * 6.283185482025146484375;
        float _484 = sin(_482);
        float _486 = _480 * 6.283185482025146484375;
        float _488 = cos(_486);
        float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _492 = _476 * _490;
        float _494 = _488 + (-1.0);
        float _496 = _420 * _492;
        float _498 = _494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = _422 * _492;
        float _502 = fma(_440, _488, _498);
        float _504 = _496 * _496;
        float _506 = _500 * _500;
        _460 = _502;
        _450 = _504;
        _452 = _506;
        _456 = _496;
        _466 = _500;
    }
    float _508 = _460;
    float _510 = _450;
    float _512 = _452;
    float _514 = _456;
    float _516 = _466;
    float _518 = _316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _520 = _316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _522 = _316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _524 = _316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _526 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _518);
    float _528 = fma(_508, _508, _510);
    float _530 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _520);
    float _532 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _522);
    float _534 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _526);
    float _536 = _528 + _512;
    float _538 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _530);
    float _540 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _524);
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _544 = fma(_416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _542);
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = rsqrt(_536);
    float _550 = _538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _552 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _532);
    float _554 = _534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _556 = -_546;
    float _558 = _556 + 1.0;
    float _560 = _550 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _562 = _552 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _564 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _540);
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[7].x, _560);
    float _568 = abs(_558);
    float _570 = log2(_568);
    float _572 = _564 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _574 = _550 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _566);
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _580 = _562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _582 = _548 * _514;
    float _584 = _548 * _508;
    float _586 = _548 * _516;
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[7].w, _576);
    float _590 = _582 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _592 = _550 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _594 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[4].x, _574);
    float _596 = -_580;
    float _598 = fma(_578, _596, 1.0);
    float _600 = -_590;
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[21].y, _600);
    float _604 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[5].x, _592);
    float _606 = _570 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _608 = log2(_598);
    float _610 = -_586;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c15)._m0[21].z, _602);
    bool _614 = _394 != 0.0;
    bool _616 = isnan(_394);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _594);
    float _626 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _604);
    float _628 = fma(_612, 0.5, 0.5);
    float _630 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[4].w, _624);
    float _632 = 1.0 / _588;
    float _634 = fma(_612, -0.5, 0.5);
    float _636 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[5].w, _626);
    float _638 = fma(_628, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _640 = _584 + 1.0;
    float _642 = _582;
    float _644 = _612;
    float _646 = _562;
    if (_622)
    {
        _642 = _630;
    }
    float _648 = _642;
    float _650 = exp2(_606);
    float _652 = _648;
    if (_622)
    {
        _644 = _636;
    }
    float _654 = _644;
    float _656 = fma(_628, _638, -0.212114393711090087890625);
    float _658 = _654;
    if (!_622)
    {
        _652 = 0.0;
    }
    float _660 = _652;
    float _662 = _608 * 0.693147182464599609375;
    if (!_622)
    {
        _658 = 0.0;
    }
    float _664 = _658;
    float _666 = fma(_628, _656, 1.570728778839111328125);
    float _668 = sqrt(_634);
    float _670 = _632 * _660;
    float _672 = _632 * _664;
    float _674 = _662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _676 = fma(_670, 0.5, 0.5);
    float _678 = fma(_672, -0.5, 0.5);
    float _680 = -_584;
    float _682 = fma(_650, _640, _680);
    float _684 = fma(_682, 0.5, 0.5);
    float _686 = _668 * 0.636619746685028076171875;
    float3 _1989 = float3(_676, _678, _674);
    float _688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_1989, float3(0.0), isnan(_1989)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_1989, float3(0.0), isnan(_1989)), level(0.0)).x;
    float _690 = -_666;
    float _692 = fma(_686, _690, 1.0);
    float2 _2005 = float2(_692, _684);
    float3 _696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2005, float2(0.0), isnan(_2005)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2005, float2(0.0), isnan(_2005)), level(0.0)).xyz;
    float _698 = _696.x;
    float _700 = _696.y;
    float _702 = _696.z;
    float _704 = in.m_57.w;
    float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = in.m_59.x;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _716 = _714 != 0;
    float _718 = _570 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_59.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _728 = _726 != 0;
    float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_61.x = _218;
    out.m_61.y = _260;
    out.m_61.z = _212;
    float _732 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _734 = _732;
    float _736 = _686;
    float _738 = _712;
    if (!_622)
    {
        _734 = 0.0;
    }
    float _740 = _734;
    float _742 = _662;
    if (!_710)
    {
        float _744 = in.m_57.y;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = exp2(_718);
    float _752 = _632;
    if (_716)
    {
        float _754 = in.m_57.z;
        _752 = _754;
    }
    float _756 = _752;
    float _758 = _740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _760 = as_type<int>(_650);
    if (_722)
    {
        float _762 = in.m_57.x;
        _760 = as_type<int>(_762);
    }
    int _764 = _760;
    bool _766 = _704 > 0.5;
    float _768 = _674;
    if (!_710)
    {
        float _770 = in.m_57.z;
        _768 = _770;
    }
    float _772 = _768;
    float _774 = -_724;
    float _776 = _774 + 1.0;
    out.m_63.x = _712;
    float _778 = -_750;
    float _780 = _778 + 1.0;
    int _782 = _766 ? as_type<int>(_776) : as_type<int>(_724);
    out.m_63.y = _724;
    float _784 = _780 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _786 = _764;
    float _788 = _756;
    float _790 = _724;
    if (!_710)
    {
        _736 = _746;
    }
    float _792 = _736;
    float _794 = _728 ? as_type<float>(_782) : _724;
    float _796 = _706 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _798 = _756 > 0.5;
    bool _800 = _798 && _716;
    out.m_65.w = _758;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _804 = _802 != 0;
    float _806 = fma(_796, _794, -0.5);
    bool _808 = false;
    float _810 = _796;
    if (_722)
    {
        bool _812 = as_type<float>(_764) > 0.5;
        _808 = _812;
    }
    bool _814 = _808;
    float _816 = _792;
    float _818 = _746;
    if (_710)
    {
        float _820 = in.m_57.x;
        float _822 = in.m_57.y;
        _816 = _820;
        _818 = _822;
    }
    float _824 = _816;
    float _826 = _818;
    if (_722)
    {
        float _828 = -_712;
        float _830 = _828 + 1.0;
        _786 = as_type<int>(_830);
    }
    int _832 = _786;
    float _834 = as_type<float>(_832);
    if (!_722)
    {
        _788 = _712;
    }
    float _836 = _788;
    float _838 = _836;
    if (!_716)
    {
        _810 = _712;
    }
    float _840 = _810;
    out.m_47.x = 1.0;
    float _842 = _840;
    if (_722)
    {
        float _844 = _814 ? as_type<float>(_832) : _712;
        _838 = _844;
    }
    float _846 = _838;
    if (_800)
    {
        float _848 = -_712;
        float _850 = _848 + 1.0;
        _738 = _850;
    }
    float _852 = _738;
    float _854 = _772;
    if (!_710)
    {
        _834 = _772;
    }
    float _856 = _834;
    float _858 = _856;
    if (_716)
    {
        _842 = _852;
    }
    float _860 = _842;
    bool _862 = _826 > 0.5;
    if (_710)
    {
        _858 = _826;
    }
    float _864 = _858;
    if (_804)
    {
        float _866 = _862 ? _776 : _724;
        _790 = _866;
    }
    float _868 = _790;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_710)
    {
        _854 = _826;
    }
    float _872 = _854;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _878 = _868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _880 = _864 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _874);
    float _884 = _730 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _888 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _892 = fma(_884, _860, -0.5);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _896 = -_886;
    float _898 = fma(_876, 2.0, _896);
    float _900 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _882);
    float _902 = _878 * _870;
    float _904 = _550 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _906 = fma(_880, -2.0, _894);
    float _908 = -_98;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _912 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _888);
    float _914 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[6].x, _904);
    float _916 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _906);
    float _918 = fma(_900, _892, _910);
    float _920 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _914);
    float _922 = _846 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _924 = -_916;
    float _926 = fma(_912, _806, _924);
    float _928 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[6].w, _920);
    float _930 = _922 * _890;
    float _932 = _918 + 0.5;
    float _934 = _926 + 0.5;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _944 = _928 + _942;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _930;
    out.m_67.y = _902;
    out.m_67.z = _932;
    out.m_67.w = _934;
    int _952 = as_type<int>(_950);
    if (!_622)
    {
        _646 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _646;
    float _956 = _588 + _944;
    float _958 = -_784;
    float _960 = _958 + 1.0;
    out.m_69.x = _946;
    out.m_69.y = _948;
    out.m_69.z = _950;
    out.gl_Position.x = _630;
    out.gl_Position.y = _636;
    out.gl_Position.z = _944;
    out.gl_Position.w = _588;
    float _962 = _588 * 0.5;
    float _964 = _630 + _588;
    if (!_622)
    {
        float _966 = _954 * 5.0;
        _952 = as_type<int>(_966);
    }
    int _968 = _952;
    float _970 = fma(_636, -0.5, _962);
    float _972 = _956 * 0.5;
    float _974 = _964 * 0.5;
    if (!_622)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2516 = as_type<float>(_968);
        out.gl_Position.z = _2516;
    }
    out.m_71.x = _974;
    out.m_71.y = _970;
    out.m_71.z = _972;
    out.m_71.w = _588;
    float _976 = _784 * _688;
    float _978 = _698 * _976;
    float _980 = _700 * _976;
    float _982 = _702 * _976;
    out.m_73.x = _978;
    out.m_73.y = _980;
    out.m_73.z = _982;
    out.m_73.w = _960;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_40.w;
    float _89 = in.m_42.w;
    float _91 = trunc(_87);
    int _94 = int(_91);
    float _96 = -_89;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_45.y = _98;
    bool _102 = _94 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_94);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1049 = as_type<float>(_114);
        out.gl_Position.z = _1049;
    }
    if (!_102)
    {
        return out;
    }
    bool _118 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_89);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_94);
    bool _130 = _98 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    if (_134)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _106;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _116 = as_type<int>(_138);
    }
    int _140 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1104 = as_type<float>(_140);
        out.gl_Position.z = _1104;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    bool _154 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _156 = isnan(0.5);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _162 = _158 || _160;
    float _164 = in.m_40.x;
    float _166 = in.m_40.y;
    float _168 = in.m_40.z;
    float _170 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _172 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _174 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _148);
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _152);
    float _186 = _178 * _176;
    float _188 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = _182 * _180;
    float _192 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _194 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _196 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _198 = _190 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _200 = _192 * _184;
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _194);
    float _204 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    float _206 = _190 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _208 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _198);
    float _210 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _202);
    float _212 = _204 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _214 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _206);
    float _216 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[10].z, _208);
    float _218 = _210 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _220 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _222 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[8].z, _214);
    float _224 = _212 + _216;
    float _226 = _190 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _228 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _220);
    float _230 = _218 + _222;
    float _232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _234 = _224 + _232;
    float _236 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _226);
    float _238 = _216;
    float _240 = _228;
    float _242 = _164;
    if (_162)
    {
        _238 = 1.0;
    }
    float _244 = _238;
    float _246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _248 = _230 + _246;
    float _250 = _234 * _234;
    float _252 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[9].z, _236);
    float _254 = fma(_248, _248, _250);
    float _256 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _228);
    float _258 = sqrt(_254);
    float _260 = _256 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _262 = _260 + _252;
    bool _264 = _258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _266 = _262;
    float _268 = _244;
    if (!_264)
    {
        _240 = _230;
    }
    float _270 = _240;
    float _272 = _270;
    if (!_264)
    {
        _242 = _224;
    }
    float _274 = _242;
    bool _276 = !_264;
    float _278 = _274;
    if (!_276)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _284 = _258 + _282;
        float _286 = _262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _288 = rsqrt(_254);
        float _290 = _284 * _280;
        float _292 = _290 * 0.15915493667125701904296875;
        float _294 = _292 * 6.283185482025146484375;
        float _296 = cos(_294);
        float _298 = _292 * 6.283185482025146484375;
        float _300 = sin(_298);
        float _302 = _296 + (-1.0);
        float _304 = fma(_300, _286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _306 = _302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _308 = _288 * _304;
        float _310 = fma(_262, _296, _306);
        float _312 = fma(_248, _308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _314 = fma(_234, _308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _266 = _310;
        _272 = _312;
        _278 = _314;
    }
    float _316 = _266;
    float _318 = _272;
    float _320 = _278;
    if (!_162)
    {
        float _322 = as_type<float>(in.m_55.w);
        int _324 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _326 = _324 == 4;
        bool _328 = _324 == 8;
        bool _330 = _324 == 12;
        int _332 = as_type<int>(_322) << 16;
        int _334 = as_type<int>(_322) << 8;
        int _336 = as_type<int>(_322) << 24;
        int _338 = _332 >> 24;
        int _340 = _334 >> 24;
        int _342 = as_type<int>(_322) >> 24;
        int _344 = _336 >> 24;
        float _346 = float(_338);
        float _348 = float(_340);
        float _350 = float(_342);
        float _352 = _346 * 0.0078740157186985015869140625;
        float _354 = float(_344);
        float _356 = _348 * 0.0078740157186985015869140625;
        float _358 = _350 * 0.0078740157186985015869140625;
        float _360 = precise::min(_352, 1.0);
        float _362 = _354 * 0.0078740157186985015869140625;
        float _364 = precise::min(_356, 1.0);
        float _366 = precise::min(_358, 1.0);
        float _368 = precise::min(_362, 1.0);
        float _370 = precise::max(_360, -1.0);
        float _372 = precise::max(_364, -1.0);
        float _374 = precise::max(_366, -1.0);
        float _376 = precise::max(_368, -1.0);
        float _378 = _376;
        if (_326)
        {
            _378 = _370;
        }
        float _380 = _378;
        float _382 = _380;
        if (_328)
        {
            _382 = _372;
        }
        float _384 = _382;
        float _386 = _384;
        if (_330)
        {
            _386 = _374;
        }
        float _388 = _386;
        float _390 = abs(_388);
        float _392 = (-0.0) + _390;
        _268 = _392;
    }
    float _394 = _268;
    float _396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _398 = _316 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _402 = _318 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _406 = _320 + _404;
    float _408 = _398 * _398;
    float _410 = fma(_402, _402, _408);
    float _412 = fma(_406, _406, _410);
    float _414 = rsqrt(_412);
    float _416 = sqrt(_412);
    float _418 = _414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _420 = _402 * _418;
    float _422 = _406 * _418;
    float _424 = _420 * _420;
    float _426 = _422 * _422;
    float _428 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _430 = _424 + _426;
    float _432 = precise::max(0.0, _428);
    float _434 = sqrt(_430);
    float _436 = -_418;
    float _438 = -_432;
    float _440 = fma(_398, _436, _438);
    bool _442 = _434 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _444 = _418;
    float _446 = _398;
    float _448 = _432;
    float _450 = _424;
    float _452 = _426;
    if (!_442)
    {
        _444 = _420;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_442)
    {
        _446 = _440;
    }
    float _458 = _446;
    float _460 = _458;
    if (!_442)
    {
        _448 = _422;
    }
    float _462 = _448;
    bool _464 = !_442;
    float _466 = _462;
    if (!_464)
    {
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _472 = _434 + _470;
        float _474 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _476 = rsqrt(_430);
        float _478 = _472 * _468;
        float _480 = _478 * 0.15915493667125701904296875;
        float _482 = _480 * 6.283185482025146484375;
        float _484 = sin(_482);
        float _486 = _480 * 6.283185482025146484375;
        float _488 = cos(_486);
        float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _492 = _476 * _490;
        float _494 = _488 + (-1.0);
        float _496 = _420 * _492;
        float _498 = _494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = _422 * _492;
        float _502 = fma(_440, _488, _498);
        float _504 = _496 * _496;
        float _506 = _500 * _500;
        _460 = _502;
        _450 = _504;
        _452 = _506;
        _456 = _496;
        _466 = _500;
    }
    float _508 = _460;
    float _510 = _450;
    float _512 = _452;
    float _514 = _456;
    float _516 = _466;
    float _518 = _316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _520 = _316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _522 = _316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _524 = _316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _526 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _518);
    float _528 = fma(_508, _508, _510);
    float _530 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _520);
    float _532 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _522);
    float _534 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _526);
    float _536 = _528 + _512;
    float _538 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _530);
    float _540 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _524);
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _544 = fma(_416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _542);
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = rsqrt(_536);
    float _550 = _538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _552 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _532);
    float _554 = _534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _556 = -_546;
    float _558 = _556 + 1.0;
    float _560 = _550 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _562 = _552 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _564 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _540);
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[7].x, _560);
    float _568 = abs(_558);
    float _570 = log2(_568);
    float _572 = _564 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _574 = _550 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _566);
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _580 = _562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _582 = _548 * _514;
    float _584 = _548 * _508;
    float _586 = _548 * _516;
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[7].w, _576);
    float _590 = _582 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _592 = _550 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _594 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[4].x, _574);
    float _596 = -_580;
    float _598 = fma(_578, _596, 1.0);
    float _600 = -_590;
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[21].y, _600);
    float _604 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[5].x, _592);
    float _606 = _570 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _608 = log2(_598);
    float _610 = -_586;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c15)._m0[21].z, _602);
    bool _614 = _394 != 0.0;
    bool _616 = isnan(_394);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _594);
    float _626 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _604);
    float _628 = fma(_612, 0.5, 0.5);
    float _630 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[4].w, _624);
    float _632 = 1.0 / _588;
    float _634 = fma(_612, -0.5, 0.5);
    float _636 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[5].w, _626);
    float _638 = fma(_628, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _640 = _584 + 1.0;
    float _642 = _582;
    float _644 = _612;
    float _646 = _562;
    if (_622)
    {
        _642 = _630;
    }
    float _648 = _642;
    float _650 = exp2(_606);
    float _652 = _648;
    if (_622)
    {
        _644 = _636;
    }
    float _654 = _644;
    float _656 = fma(_628, _638, -0.212114393711090087890625);
    float _658 = _654;
    if (!_622)
    {
        _652 = 0.0;
    }
    float _660 = _652;
    float _662 = _608 * 0.693147182464599609375;
    if (!_622)
    {
        _658 = 0.0;
    }
    float _664 = _658;
    float _666 = fma(_628, _656, 1.570728778839111328125);
    float _668 = sqrt(_634);
    float _670 = _632 * _660;
    float _672 = _632 * _664;
    float _674 = _662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _676 = fma(_670, 0.5, 0.5);
    float _678 = fma(_672, -0.5, 0.5);
    float _680 = -_584;
    float _682 = fma(_650, _640, _680);
    float _684 = fma(_682, 0.5, 0.5);
    float _686 = _668 * 0.636619746685028076171875;
    float3 _1989 = float3(_676, _678, _674);
    float _688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_1989, float3(0.0), isnan(_1989)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_1989, float3(0.0), isnan(_1989)), level(0.0)).x;
    float _690 = -_666;
    float _692 = fma(_686, _690, 1.0);
    float2 _2005 = float2(_692, _684);
    float3 _696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2005, float2(0.0), isnan(_2005)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2005, float2(0.0), isnan(_2005)), level(0.0)).xyz;
    float _698 = _696.x;
    float _700 = _696.y;
    float _702 = _696.z;
    float _704 = in.m_57.w;
    float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = in.m_59.x;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _716 = _714 != 0;
    float _718 = _570 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_59.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _728 = _726 != 0;
    float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_61.x = _218;
    out.m_61.y = _260;
    out.m_61.z = _212;
    float _732 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _734 = _732;
    float _736 = _686;
    float _738 = _712;
    if (!_622)
    {
        _734 = 0.0;
    }
    float _740 = _734;
    float _742 = _662;
    if (!_710)
    {
        float _744 = in.m_57.y;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = exp2(_718);
    float _752 = _632;
    if (_716)
    {
        float _754 = in.m_57.z;
        _752 = _754;
    }
    float _756 = _752;
    float _758 = _740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _760 = as_type<int>(_650);
    if (_722)
    {
        float _762 = in.m_57.x;
        _760 = as_type<int>(_762);
    }
    int _764 = _760;
    bool _766 = _704 > 0.5;
    float _768 = _674;
    if (!_710)
    {
        float _770 = in.m_57.z;
        _768 = _770;
    }
    float _772 = _768;
    float _774 = -_724;
    float _776 = _774 + 1.0;
    out.m_63.x = _712;
    float _778 = -_750;
    float _780 = _778 + 1.0;
    int _782 = _766 ? as_type<int>(_776) : as_type<int>(_724);
    out.m_63.y = _724;
    float _784 = _780 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _786 = _764;
    float _788 = _756;
    float _790 = _724;
    if (!_710)
    {
        _736 = _746;
    }
    float _792 = _736;
    float _794 = _728 ? as_type<float>(_782) : _724;
    float _796 = _706 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _798 = _756 > 0.5;
    bool _800 = _798 && _716;
    out.m_65.w = _758;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _804 = _802 != 0;
    float _806 = fma(_796, _794, -0.5);
    bool _808 = false;
    float _810 = _796;
    if (_722)
    {
        bool _812 = as_type<float>(_764) > 0.5;
        _808 = _812;
    }
    bool _814 = _808;
    float _816 = _792;
    float _818 = _746;
    if (_710)
    {
        float _820 = in.m_57.x;
        float _822 = in.m_57.y;
        _816 = _820;
        _818 = _822;
    }
    float _824 = _816;
    float _826 = _818;
    if (_722)
    {
        float _828 = -_712;
        float _830 = _828 + 1.0;
        _786 = as_type<int>(_830);
    }
    int _832 = _786;
    float _834 = as_type<float>(_832);
    if (!_722)
    {
        _788 = _712;
    }
    float _836 = _788;
    float _838 = _836;
    if (!_716)
    {
        _810 = _712;
    }
    float _840 = _810;
    out.m_47.x = 1.0;
    float _842 = _840;
    if (_722)
    {
        float _844 = _814 ? as_type<float>(_832) : _712;
        _838 = _844;
    }
    float _846 = _838;
    if (_800)
    {
        float _848 = -_712;
        float _850 = _848 + 1.0;
        _738 = _850;
    }
    float _852 = _738;
    float _854 = _772;
    if (!_710)
    {
        _834 = _772;
    }
    float _856 = _834;
    float _858 = _856;
    if (_716)
    {
        _842 = _852;
    }
    float _860 = _842;
    bool _862 = _826 > 0.5;
    if (_710)
    {
        _858 = _826;
    }
    float _864 = _858;
    if (_804)
    {
        float _866 = _862 ? _776 : _724;
        _790 = _866;
    }
    float _868 = _790;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_710)
    {
        _854 = _826;
    }
    float _872 = _854;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _878 = _868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _880 = _864 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _874);
    float _884 = _730 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _888 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _892 = fma(_884, _860, -0.5);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _896 = -_886;
    float _898 = fma(_876, 2.0, _896);
    float _900 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _882);
    float _902 = _878 * _870;
    float _904 = _550 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _906 = fma(_880, -2.0, _894);
    float _908 = -_98;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _912 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _888);
    float _914 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[6].x, _904);
    float _916 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _906);
    float _918 = fma(_900, _892, _910);
    float _920 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _914);
    float _922 = _846 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _924 = -_916;
    float _926 = fma(_912, _806, _924);
    float _928 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[6].w, _920);
    float _930 = _922 * _890;
    float _932 = _918 + 0.5;
    float _934 = _926 + 0.5;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _944 = _928 + _942;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _930;
    out.m_67.y = _902;
    out.m_67.z = _932;
    out.m_67.w = _934;
    int _952 = as_type<int>(_950);
    if (!_622)
    {
        _646 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _646;
    float _956 = _588 + _944;
    float _958 = -_784;
    float _960 = _958 + 1.0;
    out.m_69.x = _946;
    out.m_69.y = _948;
    out.m_69.z = _950;
    out.gl_Position.x = _630;
    out.gl_Position.y = _636;
    out.gl_Position.z = _944;
    out.gl_Position.w = _588;
    float _962 = _588 * 0.5;
    float _964 = _630 + _588;
    if (!_622)
    {
        float _966 = _954 * 5.0;
        _952 = as_type<int>(_966);
    }
    int _968 = _952;
    float _970 = fma(_636, -0.5, _962);
    float _972 = _956 * 0.5;
    float _974 = _964 * 0.5;
    if (!_622)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2516 = as_type<float>(_968);
        out.gl_Position.z = _2516;
    }
    out.m_71.x = _974;
    out.m_71.y = _970;
    out.m_71.z = _972;
    out.m_71.w = _588;
    float _976 = _784 * _688;
    float _978 = _698 * _976;
    float _980 = _700 * _976;
    float _982 = _702 * _976;
    out.m_73.x = _978;
    out.m_73.y = _980;
    out.m_73.z = _982;
    out.m_73.w = _960;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _87 = in.m_40.w;
    float _89 = in.m_42.w;
    float _91 = trunc(_87);
    int _94 = int(_91);
    float _96 = -_89;
    float _98 = _96 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_45.y = _98;
    bool _102 = _94 >= 1;
    float _104 = 0.0;
    float _106 = as_type<float>(_94);
    if (!_102)
    {
        _104 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _108 = _104;
    if (!_102)
    {
        out.m_47.x = 0.0;
    }
    int _110 = 0;
    if (!_102)
    {
        float _112 = _108 * 5.0;
        _110 = as_type<int>(_112);
    }
    int _114 = _110;
    int _116 = _114;
    if (!_102)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1049 = as_type<float>(_114);
        out.gl_Position.z = _1049;
    }
    if (!_102)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _118 = _89 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _120 = isnan(_89);
    bool _122 = _118 || _120;
    bool _124 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _126 = _122 || _124;
    float _128 = float(_94);
    bool _130 = _98 >= _128;
    bool _132 = !_126;
    bool _134 = _130 || _132;
    if (_134)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _106;
    if (_134)
    {
        out.m_47.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _116 = as_type<int>(_138);
    }
    int _140 = _116;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1104 = as_type<float>(_140);
        out.gl_Position.z = _1104;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = in.m_49.y;
    float _146 = in.m_49.z;
    float _148 = in.m_51.x;
    float _150 = in.m_51.y;
    float _152 = in.m_51.z;
    bool _154 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _156 = isnan(0.5);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _162 = _158 || _160;
    float _164 = in.m_40.x;
    float _166 = in.m_40.y;
    float _168 = in.m_40.z;
    float _170 = _142 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _172 = _144 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _174 = _146 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _176 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _148);
    float _178 = _170 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _180 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _150);
    float _182 = _172 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _152);
    float _186 = _178 * _176;
    float _188 = _166 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _190 = _182 * _180;
    float _192 = _174 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _194 = _166 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _196 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[6].x, _188);
    float _198 = _190 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _200 = _192 * _184;
    float _202 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[4].x, _194);
    float _204 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    float _206 = _190 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _208 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[10].x, _198);
    float _210 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[4].z, _202);
    float _212 = _204 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _214 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[8].x, _206);
    float _216 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[10].z, _208);
    float _218 = _210 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _220 = _166 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _222 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[8].z, _214);
    float _224 = _212 + _216;
    float _226 = _190 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _228 = fma(_164, (*spvDescriptorSet0.vp_c10)._m0[5].x, _220);
    float _230 = _218 + _222;
    float _232 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _234 = _224 + _232;
    float _236 = fma(_186, (*spvDescriptorSet0.vp_c10)._m0[9].x, _226);
    float _238 = _216;
    float _240 = _228;
    float _242 = _164;
    if (_162)
    {
        _238 = 1.0;
    }
    float _244 = _238;
    float _246 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _248 = _230 + _246;
    float _250 = _234 * _234;
    float _252 = fma(_200, (*spvDescriptorSet0.vp_c10)._m0[9].z, _236);
    float _254 = fma(_248, _248, _250);
    float _256 = fma(_168, (*spvDescriptorSet0.vp_c10)._m0[5].z, _228);
    float _258 = sqrt(_254);
    float _260 = _256 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _262 = _260 + _252;
    bool _264 = _258 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _266 = _262;
    float _268 = _244;
    if (!_264)
    {
        _240 = _230;
    }
    float _270 = _240;
    float _272 = _270;
    if (!_264)
    {
        _242 = _224;
    }
    float _274 = _242;
    bool _276 = !_264;
    float _278 = _274;
    if (!_276)
    {
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _282 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _284 = _258 + _282;
        float _286 = _262 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _288 = rsqrt(_254);
        float _290 = _284 * _280;
        float _292 = _290 * 0.15915493667125701904296875;
        float _294 = _292 * 6.283185482025146484375;
        float _296 = cos(_294);
        float _298 = _292 * 6.283185482025146484375;
        float _300 = sin(_298);
        float _302 = _296 + (-1.0);
        float _304 = fma(_300, _286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _306 = _302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _308 = _288 * _304;
        float _310 = fma(_262, _296, _306);
        float _312 = fma(_248, _308, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _314 = fma(_234, _308, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _266 = _310;
        _272 = _312;
        _278 = _314;
    }
    float _316 = _266;
    float _318 = _272;
    float _320 = _278;
    if (!_162)
    {
        float _322 = as_type<float>(in.m_55.w);
        int _324 = 4 * as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].z);
        bool _326 = _324 == 4;
        bool _328 = _324 == 8;
        bool _330 = _324 == 12;
        int _332 = as_type<int>(_322) << 16;
        int _334 = as_type<int>(_322) << 8;
        int _336 = as_type<int>(_322) << 24;
        int _338 = _332 >> 24;
        int _340 = _334 >> 24;
        int _342 = as_type<int>(_322) >> 24;
        int _344 = _336 >> 24;
        float _346 = float(_338);
        float _348 = float(_340);
        float _350 = float(_342);
        float _352 = _346 * 0.0078740157186985015869140625;
        float _354 = float(_344);
        float _356 = _348 * 0.0078740157186985015869140625;
        float _358 = _350 * 0.0078740157186985015869140625;
        float _360 = precise::min(_352, 1.0);
        float _362 = _354 * 0.0078740157186985015869140625;
        float _364 = precise::min(_356, 1.0);
        float _366 = precise::min(_358, 1.0);
        float _368 = precise::min(_362, 1.0);
        float _370 = precise::max(_360, -1.0);
        float _372 = precise::max(_364, -1.0);
        float _374 = precise::max(_366, -1.0);
        float _376 = precise::max(_368, -1.0);
        float _378 = _376;
        if (_326)
        {
            _378 = _370;
        }
        float _380 = _378;
        float _382 = _380;
        if (_328)
        {
            _382 = _372;
        }
        float _384 = _382;
        float _386 = _384;
        if (_330)
        {
            _386 = _374;
        }
        float _388 = _386;
        float _390 = abs(_388);
        float _392 = (-0.0) + _390;
        _268 = _392;
    }
    float _394 = _268;
    float _396 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _398 = _316 + _396;
    float _400 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _402 = _318 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _406 = _320 + _404;
    float _408 = _398 * _398;
    float _410 = fma(_402, _402, _408);
    float _412 = fma(_406, _406, _410);
    float _414 = rsqrt(_412);
    float _416 = sqrt(_412);
    float _418 = _414 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _420 = _402 * _418;
    float _422 = _406 * _418;
    float _424 = _420 * _420;
    float _426 = _422 * _422;
    float _428 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _430 = _424 + _426;
    float _432 = precise::max(0.0, _428);
    float _434 = sqrt(_430);
    float _436 = -_418;
    float _438 = -_432;
    float _440 = fma(_398, _436, _438);
    bool _442 = _434 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _444 = _418;
    float _446 = _398;
    float _448 = _432;
    float _450 = _424;
    float _452 = _426;
    if (!_442)
    {
        _444 = _420;
    }
    float _454 = _444;
    float _456 = _454;
    if (!_442)
    {
        _446 = _440;
    }
    float _458 = _446;
    float _460 = _458;
    if (!_442)
    {
        _448 = _422;
    }
    float _462 = _448;
    bool _464 = !_442;
    float _466 = _462;
    if (!_464)
    {
        float _468 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _470 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _472 = _434 + _470;
        float _474 = _440 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _476 = rsqrt(_430);
        float _478 = _472 * _468;
        float _480 = _478 * 0.15915493667125701904296875;
        float _482 = _480 * 6.283185482025146484375;
        float _484 = sin(_482);
        float _486 = _480 * 6.283185482025146484375;
        float _488 = cos(_486);
        float _490 = fma(_484, _474, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _492 = _476 * _490;
        float _494 = _488 + (-1.0);
        float _496 = _420 * _492;
        float _498 = _494 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _500 = _422 * _492;
        float _502 = fma(_440, _488, _498);
        float _504 = _496 * _496;
        float _506 = _500 * _500;
        _460 = _502;
        _450 = _504;
        _452 = _506;
        _456 = _496;
        _466 = _500;
    }
    float _508 = _460;
    float _510 = _450;
    float _512 = _452;
    float _514 = _456;
    float _516 = _466;
    float _518 = _316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _520 = _316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _522 = _316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _524 = _316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _526 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _518);
    float _528 = fma(_508, _508, _510);
    float _530 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _520);
    float _532 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _522);
    float _534 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _526);
    float _536 = _528 + _512;
    float _538 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _530);
    float _540 = fma(_318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _524);
    float _542 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _544 = fma(_416, (*spvDescriptorSet0.vp_c15)._m0[23].w, _542);
    float _546 = precise::clamp(_544, 0.0, 1.0);
    float _548 = rsqrt(_536);
    float _550 = _538 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _552 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _532);
    float _554 = _534 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _556 = -_546;
    float _558 = _556 + 1.0;
    float _560 = _550 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _562 = _552 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _564 = fma(_320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _540);
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[7].x, _560);
    float _568 = abs(_558);
    float _570 = log2(_568);
    float _572 = _564 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _574 = _550 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _576 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[7].z, _566);
    float _578 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _580 = _562 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _582 = _548 * _514;
    float _584 = _548 * _508;
    float _586 = _548 * _516;
    float _588 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[7].w, _576);
    float _590 = _582 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _592 = _550 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _594 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[4].x, _574);
    float _596 = -_580;
    float _598 = fma(_578, _596, 1.0);
    float _600 = -_590;
    float _602 = fma(_584, (*spvDescriptorSet0.vp_c15)._m0[21].y, _600);
    float _604 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[5].x, _592);
    float _606 = _570 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _608 = log2(_598);
    float _610 = -_586;
    float _612 = fma(_610, (*spvDescriptorSet0.vp_c15)._m0[21].z, _602);
    bool _614 = _394 != 0.0;
    bool _616 = isnan(_394);
    bool _618 = _614 || _616;
    bool _620 = isnan(0.0);
    bool _622 = _618 || _620;
    float _624 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[4].z, _594);
    float _626 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[5].z, _604);
    float _628 = fma(_612, 0.5, 0.5);
    float _630 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[4].w, _624);
    float _632 = 1.0 / _588;
    float _634 = fma(_612, -0.5, 0.5);
    float _636 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[5].w, _626);
    float _638 = fma(_628, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _640 = _584 + 1.0;
    float _642 = _582;
    float _644 = _612;
    float _646 = _562;
    if (_622)
    {
        _642 = _630;
    }
    float _648 = _642;
    float _650 = exp2(_606);
    float _652 = _648;
    if (_622)
    {
        _644 = _636;
    }
    float _654 = _644;
    float _656 = fma(_628, _638, -0.212114393711090087890625);
    float _658 = _654;
    if (!_622)
    {
        _652 = 0.0;
    }
    float _660 = _652;
    float _662 = _608 * 0.693147182464599609375;
    if (!_622)
    {
        _658 = 0.0;
    }
    float _664 = _658;
    float _666 = fma(_628, _656, 1.570728778839111328125);
    float _668 = sqrt(_634);
    float _670 = _632 * _660;
    float _672 = _632 * _664;
    float _674 = _662 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _676 = fma(_670, 0.5, 0.5);
    float _678 = fma(_672, -0.5, 0.5);
    float _680 = -_584;
    float _682 = fma(_650, _640, _680);
    float _684 = fma(_682, 0.5, 0.5);
    float _686 = _668 * 0.636619746685028076171875;
    float3 _1989 = float3(_676, _678, _674);
    float _688 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_1989, float3(0.0), isnan(_1989)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_1989, float3(0.0), isnan(_1989)), level(0.0)).x;
    float _690 = -_666;
    float _692 = fma(_686, _690, 1.0);
    float2 _2005 = float2(_692, _684);
    float3 _696 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_2005, float2(0.0), isnan(_2005)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_2005, float2(0.0), isnan(_2005)), level(0.0)).xyz;
    float _698 = _696.x;
    float _700 = _696.y;
    float _702 = _696.z;
    float _704 = in.m_57.w;
    float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _708 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _710 = _708 != 0;
    float _712 = in.m_59.x;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _716 = _714 != 0;
    float _718 = _570 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = in.m_59.y;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _728 = _726 != 0;
    float _730 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    out.m_61.x = _218;
    out.m_61.y = _260;
    out.m_61.z = _212;
    float _732 = _394 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _734 = _732;
    float _736 = _686;
    float _738 = _712;
    if (!_622)
    {
        _734 = 0.0;
    }
    float _740 = _734;
    float _742 = _662;
    if (!_710)
    {
        float _744 = in.m_57.y;
        _742 = _744;
    }
    float _746 = _742;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = exp2(_718);
    float _752 = _632;
    if (_716)
    {
        float _754 = in.m_57.z;
        _752 = _754;
    }
    float _756 = _752;
    float _758 = _740 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _760 = as_type<int>(_650);
    if (_722)
    {
        float _762 = in.m_57.x;
        _760 = as_type<int>(_762);
    }
    int _764 = _760;
    bool _766 = _704 > 0.5;
    float _768 = _674;
    if (!_710)
    {
        float _770 = in.m_57.z;
        _768 = _770;
    }
    float _772 = _768;
    float _774 = -_724;
    float _776 = _774 + 1.0;
    out.m_63.x = _712;
    float _778 = -_750;
    float _780 = _778 + 1.0;
    int _782 = _766 ? as_type<int>(_776) : as_type<int>(_724);
    out.m_63.y = _724;
    float _784 = _780 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _786 = _764;
    float _788 = _756;
    float _790 = _724;
    if (!_710)
    {
        _736 = _746;
    }
    float _792 = _736;
    float _794 = _728 ? as_type<float>(_782) : _724;
    float _796 = _706 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _798 = _756 > 0.5;
    bool _800 = _798 && _716;
    out.m_65.w = _758;
    int _802 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _804 = _802 != 0;
    float _806 = fma(_796, _794, -0.5);
    bool _808 = false;
    float _810 = _796;
    if (_722)
    {
        bool _812 = as_type<float>(_764) > 0.5;
        _808 = _812;
    }
    bool _814 = _808;
    float _816 = _792;
    float _818 = _746;
    if (_710)
    {
        float _820 = in.m_57.x;
        float _822 = in.m_57.y;
        _816 = _820;
        _818 = _822;
    }
    float _824 = _816;
    float _826 = _818;
    if (_722)
    {
        float _828 = -_712;
        float _830 = _828 + 1.0;
        _786 = as_type<int>(_830);
    }
    int _832 = _786;
    float _834 = as_type<float>(_832);
    if (!_722)
    {
        _788 = _712;
    }
    float _836 = _788;
    float _838 = _836;
    if (!_716)
    {
        _810 = _712;
    }
    float _840 = _810;
    out.m_47.x = 1.0;
    float _842 = _840;
    if (_722)
    {
        float _844 = _814 ? as_type<float>(_832) : _712;
        _838 = _844;
    }
    float _846 = _838;
    if (_800)
    {
        float _848 = -_712;
        float _850 = _848 + 1.0;
        _738 = _850;
    }
    float _852 = _738;
    float _854 = _772;
    if (!_710)
    {
        _834 = _772;
    }
    float _856 = _834;
    float _858 = _856;
    if (_716)
    {
        _842 = _852;
    }
    float _860 = _842;
    bool _862 = _826 > 0.5;
    if (_710)
    {
        _858 = _826;
    }
    float _864 = _858;
    if (_804)
    {
        float _866 = _862 ? _776 : _724;
        _790 = _866;
    }
    float _868 = _790;
    float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_710)
    {
        _854 = _826;
    }
    float _872 = _854;
    float _874 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _876 = _824 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _878 = _868 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _880 = _864 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _882 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[83].z, _874);
    float _884 = _730 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _888 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    float _890 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _892 = fma(_884, _860, -0.5);
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _896 = -_886;
    float _898 = fma(_876, 2.0, _896);
    float _900 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].z, _882);
    float _902 = _878 * _870;
    float _904 = _550 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _906 = fma(_880, -2.0, _894);
    float _908 = -_98;
    float _910 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[81].x, _898);
    float _912 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[82].w, _888);
    float _914 = fma(_554, (*spvDescriptorSet0.vp_c8)._m0[6].x, _904);
    float _916 = fma(_98, (*spvDescriptorSet0.vp_c9)._m0[81].y, _906);
    float _918 = fma(_900, _892, _910);
    float _920 = fma(_562, (*spvDescriptorSet0.vp_c8)._m0[6].z, _914);
    float _922 = _846 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _924 = -_916;
    float _926 = fma(_912, _806, _924);
    float _928 = fma(_572, (*spvDescriptorSet0.vp_c8)._m0[6].w, _920);
    float _930 = _922 * _890;
    float _932 = _918 + 0.5;
    float _934 = _926 + 0.5;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _940 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _942 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _944 = _928 + _942;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = _940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _930;
    out.m_67.y = _902;
    out.m_67.z = _932;
    out.m_67.w = _934;
    int _952 = as_type<int>(_950);
    if (!_622)
    {
        _646 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _954 = _646;
    float _956 = _588 + _944;
    float _958 = -_784;
    float _960 = _958 + 1.0;
    out.m_69.x = _946;
    out.m_69.y = _948;
    out.m_69.z = _950;
    out.gl_Position.x = _630;
    out.gl_Position.y = _636;
    out.gl_Position.z = _944;
    out.gl_Position.w = _588;
    float _962 = _588 * 0.5;
    float _964 = _630 + _588;
    if (!_622)
    {
        float _966 = _954 * 5.0;
        _952 = as_type<int>(_966);
    }
    int _968 = _952;
    float _970 = fma(_636, -0.5, _962);
    float _972 = _956 * 0.5;
    float _974 = _964 * 0.5;
    if (!_622)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2516 = as_type<float>(_968);
        out.gl_Position.z = _2516;
    }
    out.m_71.x = _974;
    out.m_71.y = _970;
    out.m_71.z = _972;
    out.m_71.w = _588;
    float _976 = _784 * _688;
    float _978 = _698 * _976;
    float _980 = _700 * _976;
    float _982 = _702 * _976;
    out.m_73.x = _978;
    out.m_73.y = _980;
    out.m_73.z = _982;
    out.m_73.w = _960;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

