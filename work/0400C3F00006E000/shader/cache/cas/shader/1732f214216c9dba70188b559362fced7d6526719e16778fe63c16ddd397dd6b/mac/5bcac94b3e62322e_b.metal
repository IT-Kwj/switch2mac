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
    float4 m_75 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_65 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_61 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_63 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_49 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _770 = false;
    bool _602 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1892 = as_type<float>(_112);
        out.gl_Position.z = _1892;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _116 = in.m_47.w;
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
        _106 = _132;
    }
    float _134 = _106;
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
        out.m_45.x = 0.0;
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
        float _1961 = as_type<float>(_148);
        out.gl_Position.z = _1961;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_49.w;
    float _152 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
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
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
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
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_96);
        float _296 = 1.0 / _294;
        float _298 = _130 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _336;
    float _360 = _352 * _356;
    float _362 = -_352;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _340;
    float _374 = _332 * _364;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = _304 * _358;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _380, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = _320 * _372;
    float _398 = _390 * _374;
    float _400 = _392 * _374;
    float _402 = _394 * _374;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _418 = fma(_406, _396, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_410, _396, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].y, _400);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].z, _402);
    float _428 = fma(_418, _360, _416);
    float _430 = fma(_420, _360, _424);
    float _432 = fma(_422, _360, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].z, _432);
    bool _440 = !_370;
    float _458;
    if (!_440)
    {
        float _442 = in.m_51.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_96);
        float _464 = 1.0 / _462;
        float _466 = _130 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _468 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = isnan(_468);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _494 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_468);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    bool _510 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_468);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _476;
    float _524 = -_488;
    float _526 = _524 + 1.0;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _530 = 1.0 / _492;
    float _532 = _508 * _522;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = -_520;
    float _540 = _538 + 1.0;
    float _542 = fma(_532, _472, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _544 = _504 * _526;
    float _546 = -_504;
    float _548 = _546 + 1.0;
    float _550 = _488 * _540;
    float _552 = _536 * _530;
    float _554 = _542 * _544;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _468 + _556;
    float _560 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _566 = fma(_552, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _570 = fma(_566, _550, _564);
    float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[117].x, _570);
    float _578 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _576 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _578;
    out.m_53.y = _572;
    out.m_53.z = _574;
    out.m_53.w = _580;
    bool _582 = !_528;
    float _600;
    if (!_582)
    {
        float _584 = in.m_51.x;
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _588 = _584 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_96);
        float _606 = 1.0 / _604;
        float _608 = _130 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _614 = _610 + _612;
    bool _616 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _618 = isnan(_610);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _610 + _628;
    bool _632 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _634 = isnan(_610);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _652 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _654 = isnan(_610);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_626;
    float _666 = _664 + 1.0;
    float _668 = 1.0 / _646;
    float _670 = _662 * _666;
    float _672 = -_662;
    float _674 = _672 + 1.0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = 1.0 / _650;
    float _684 = _642 * _674;
    float _686 = -_642;
    float _688 = _686 + 1.0;
    float _690 = _614 * _668;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _696;
    float _700 = fma(_678, _690, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _702 = fma(_694, _690, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _704 = fma(_698, _690, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _706 = _630 * _682;
    float _708 = _700 * _684;
    float _710 = _702 * _684;
    float _712 = _704 * _684;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].x, _708);
    float _728 = fma(_716, _706, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _730 = fma(_720, _706, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _732 = fma(_724, _706, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].y, _710);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].z, _712);
    float _738 = fma(_728, _670, _726);
    float _740 = fma(_730, _670, _734);
    float _742 = fma(_732, _670, _736);
    float _744 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].x, _738);
    float _746 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].y, _740);
    float _748 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].z, _742);
    bool _750 = !_680;
    float _768;
    if (!_750)
    {
        float _752 = in.m_51.x;
        float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _756 = _752 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _758 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _760 = _758 * _754;
        float _762 = floor(_760);
        float _764 = -_762;
        float _766 = _760 + _764;
        _768 = _766;
        _770 = true;
    }
    else
    {
        float _772 = float(_96);
        float _774 = 1.0 / _772;
        float _776 = _130 * _774;
        _768 = _776;
    }
    _770 = false;
    float _778 = _768;
    float _780 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _782 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _786 = in.m_49.y;
    float _788 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _780);
    float _790 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _792 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _784);
    float _794 = in.m_49.x;
    float _796 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _788);
    float _798 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _790);
    float _800 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _792);
    float _802 = _796 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _804 = _798 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = _800 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _802 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _814 = _804 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _806 + _816;
    float _820 = _810 * _810;
    float _822 = fma(_814, _814, _820);
    float _824 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _826 = fma(_818, _818, _822);
    float _828 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _830 = rsqrt(_826);
    float _832 = _810 * _830;
    float _834 = _814 * _830;
    float _836 = -_832;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _810);
    float _840 = _818 * _830;
    float _842 = -_834;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    float _846 = _838 * _838;
    float _848 = -_840;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _852 = fma(_844, _844, _846);
    float _854 = in.m_49.z;
    float _856 = fma(_850, _850, _852);
    float _858 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _860 = in.m_55.x;
    float _862 = in.m_55.y;
    float _864 = in.m_55.z;
    float _866 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _868 = sqrt(_856);
    float _870 = _830 * _868;
    float _872 = _854 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _876 = _828 * _870;
    float _878 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _882 = _866 * _870;
    float _884 = _876 * _874;
    float _886 = _878 * _870;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    float _890 = _882 * _880;
    float _892 = _884 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _894 = _886 * _888;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _898 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].x, _892);
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].x, _896);
    float _902 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].z, _898);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].z, _900);
    float _906 = _806 + _902;
    float _908 = _804 + _904;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _906 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _908 + _914;
    float _918 = _912 * _912;
    float _920 = fma(_916, _916, _918);
    float _922 = _884 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _924 = sqrt(_920);
    float _926 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].x, _922);
    float _928 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].z, _926);
    float _930 = _802 + _928;
    bool _932 = _924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _928;
    float _936 = _802;
    float _938 = _908;
    float _940 = _884;
    float _942 = _906;
    float _944 = _860;
    if (!_932)
    {
        _934 = _906;
    }
    float _946 = _934;
    float _948 = _946;
    if (!_932)
    {
        _936 = _930;
    }
    float _950 = _936;
    bool _952 = !_932;
    float _954 = _950;
    if (!_952)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _960 = _924 + _958;
        float _962 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = rsqrt(_920);
        float _966 = _960 * _956;
        float _968 = _966 * 0.15915493667125701904296875;
        float _970 = _968 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        float _978 = _972 + (-1.0);
        float _980 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = fma(_976, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _984 = fma(_930, _972, _980);
        float _986 = _964 * _982;
        float _988 = fma(_916, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _990 = fma(_912, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _954 = _984;
        _938 = _988;
        _948 = _990;
        _940 = _968;
    }
    float _992 = _954;
    float _994 = _938;
    float _996 = _948;
    float _998 = _940;
    float _1000 = -_832;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _992);
    float _1004 = -_834;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1008 = -_840;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _996);
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1002 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = fma(_1018, _1018, _1024);
    float _1028 = fma(_1022, _1022, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1036 = _1018 * _1034;
    float _1038 = _1022 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 * _1038;
    float _1044 = _1040 + _1042;
    float _1046 = sqrt(_1044);
    bool _1048 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _1046 + _1050;
    float _1054 = _1022;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _998;
    float _1062 = _1014;
    if (_1048)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1064;
    }
    float _1066 = _1054;
    if (_1048)
    {
        float _1068 = rsqrt(_1044);
        _1056 = _1068;
    }
    float _1070 = _1056;
    float _1072 = _1070;
    if (_1048)
    {
        float _1074 = _1052 * _1066;
        _1058 = _1074;
    }
    float _1076 = _1058;
    if (_1048)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _1060 = _1078;
    }
    float _1080 = _1060;
    float _1082 = _1066;
    float _1084 = _1080;
    if (_1048)
    {
        float _1086 = _1080 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1094 = precise::max(0.0, _1092);
    float _1096 = _1024;
    float _1098 = _1094;
    if (_1048)
    {
        float _1100 = _1080 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        _1096 = _1102;
    }
    float _1104 = _1096;
    float _1106 = -_1034;
    float _1108 = -_1094;
    float _1110 = fma(_1014, _1106, _1108);
    if (!_1048)
    {
        _1062 = _1036;
    }
    float _1112 = _1062;
    float _1114 = _1112;
    if (_1048)
    {
        float _1116 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1116;
    }
    float _1118 = _1098;
    float _1120 = _1090;
    float _1122 = _1118;
    if (_1048)
    {
        float _1124 = fma(_1090, _1118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = _1126;
    float _1130 = _1104;
    if (_1048)
    {
        float _1132 = _1104 + (-1.0);
        _1122 = _1132;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    if (_1048)
    {
        float _1138 = _1070 * _1126;
        _942 = _1138;
    }
    float _1140 = _942;
    if (!_1048)
    {
        _1128 = _1110;
    }
    float _1142 = _1128;
    float _1144 = _1142;
    if (_1048)
    {
        float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1146;
    }
    float _1148 = _1084;
    if (_1048)
    {
        float _1150 = _1036 * _1140;
        _1114 = _1150;
    }
    float _1152 = _1114;
    if (!_1048)
    {
        _1136 = _1038;
    }
    float _1154 = _1136;
    float _1156 = _1154;
    if (_1048)
    {
        float _1158 = _1038 * _1140;
        _1156 = _1158;
    }
    float _1160 = _1156;
    if (!_1048)
    {
        _1072 = _1040;
    }
    float _1162 = _1072;
    float _1164 = _1162;
    if (_1048)
    {
        float _1166 = fma(_1110, _1104, _1148);
        _1144 = _1166;
    }
    float _1168 = _1144;
    if (_1048)
    {
        float _1170 = _1152 * _1152;
        _1164 = _1170;
    }
    float _1172 = _1164;
    if (!_1048)
    {
        _1130 = _1042;
    }
    float _1174 = _1130;
    float _1176 = _1174;
    if (_1048)
    {
        float _1178 = _1160 * _1160;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = fma(_1168, _1168, _1172);
    float _1184 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1186 = _1182 + _1180;
    float _1188 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1192 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1190);
    float _1194 = precise::clamp(_1192, 0.0, 1.0);
    float _1196 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1198 = rsqrt(_1186);
    float _1200 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1202 = -_1194;
    float _1204 = _1202 + 1.0;
    float _1206 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1196);
    float _1208 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1184);
    float _1210 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1200);
    float _1212 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1214 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1206);
    float _1216 = abs(_1204);
    float _1218 = log2(_1216);
    float _1220 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1212);
    float _1224 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1230 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1232 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1208);
    float _1234 = _1198 * _1152;
    float _1236 = _1198 * _1168;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = _1198 * _1160;
    float _1246 = -_1228;
    float _1248 = fma(_1246, _1226, 1.0);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = -_1242;
    float _1254 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1252);
    float _1256 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1258 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1260 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    float _1262 = -_1244;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1254);
    float _1266 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1268 = exp2(_1258);
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1260);
    float _1272 = fma(_1264, -0.5, 0.5);
    float _1274 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1266);
    float _1278 = fma(_1264, 0.5, 0.5);
    float _1280 = _1236 + 1.0;
    float _1282 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1274);
    float _1284 = log2(_1248);
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1276);
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1286);
    float _1294 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1296 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1298 = 1.0 / _1270;
    float _1300 = -_1236;
    float _1302 = fma(_1268, _1280, _1300);
    float _1304 = fma(_1278, _1294, 1.570728778839111328125);
    float _1306 = fma(_1302, 0.5, 0.5);
    float _1308 = sqrt(_1272);
    float _1310 = _1284 * 0.693147182464599609375;
    float _1312 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1314 = _1292 * _1298;
    float _1316 = _1296 * _1298;
    float _1318 = fma(_1314, 0.5, 0.5);
    float _1320 = fma(_1316, -0.5, 0.5);
    float _1322 = _1308 * 0.636619746685028076171875;
    float3 _3887 = float3(_1318, _1320, _1312);
    float _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).x;
    float3 _3898 = float3(_1318, _1320, _1312);
    float4 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3898, float3(0.0), isnan(_3898)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3898, float3(0.0), isnan(_3898)), level(0.0)).xyzw;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = _1327.w;
    float _1337 = -_1304;
    float _1339 = fma(_1322, _1337, 1.0);
    float2 _3920 = float2(_1339, _1306);
    float3 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3920, float2(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3920, float2(0.0), isnan(_3920)), level(0.0)).xyz;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = in.m_57.x;
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1355 = in.m_51.z;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1359 = _1357 != 0;
    float _1361 = _746 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1365 = _1363 != 0;
    float _1367 = in.m_51.y;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1371 = _1369 != 0;
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1375 = in.m_51.x;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    float _1381 = _748 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1383 = in.m_51.w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1391 = in.m_57.y;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1397 = -_1351;
    float _1399 = _1397 + 1.0;
    float _1401 = _1312;
    float _1403 = _1351;
    if (!_1359)
    {
        _1401 = _1351;
    }
    float _1405 = _1401;
    float _1407 = in.m_59.w;
    float _1409 = 1.0 / _1387;
    bool _1411 = _1355 > 0.5;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1415 = 0.0;
    float _1417 = _1405;
    float _1419 = _1355;
    if (!_1365)
    {
        _1415 = _1351;
    }
    float _1421 = _1415;
    float _1423 = _744 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1425 = _1367 > 0.5;
    float _1427 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1429 = _1421;
    if (_1359)
    {
        float _1431 = _1411 ? _1399 : _1351;
        _1417 = _1431;
    }
    float _1433 = _1417;
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1437 = _1375 > 0.5;
    float _1439 = fma(_1427, -2.0, _1393);
    float _1441 = _1391;
    if (_1365)
    {
        float _1443 = _1425 ? _1399 : _1351;
        _1429 = _1443;
    }
    float _1445 = _1429;
    float _1447 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1379)
    {
        float _1449 = _1437 ? _1399 : _1351;
        _1403 = _1449;
    }
    float _1451 = _1403;
    out.m_61.x = _1006;
    out.m_61.y = _1002;
    out.m_61.z = _1010;
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1455 = _1383 > 0.5;
    float _1457 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1459 = -_1391;
    float _1461 = _1459 + 1.0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1469 = _1467 != 0;
    float _1471 = -_1395;
    float _1473 = fma(_1457, 2.0, _1471);
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1477 = _1475 != 0;
    float _1479 = _1465 * _1409;
    int _1481 = _1455 ? as_type<int>(_1461) : as_type<int>(_1391);
    float _1483 = in.m_63.x;
    float _1485 = in.m_63.y;
    float _1487 = in.m_63.z;
    bool _1489 = _862 != 0.0;
    bool _1491 = isnan(_862);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan(0.0);
    bool _1497 = _1493 || _1495;
    float _1499 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_65.w = _1407;
    bool _1501 = _860 == 0.0;
    bool _1503 = !_1497;
    bool _1505 = _1501 && _1503;
    float _1507 = fma(_1499, _1433, -0.5);
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1511 = _1509 != 0;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1515 = _864 == 0.0;
    bool _1517 = _1515 && _1505;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1521 = _778 + _1519;
    float _1523 = _1477 ? as_type<float>(_1481) : _1391;
    float _1525 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1513);
    float _1527 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1529 = fma(_1479, _1521, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1531 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1413);
    float _1533 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1535 = _828 * _1391;
    float _1537 = fma(_1527, _1523, -0.5);
    float _1539 = fma(_1533, _1445, -0.5);
    float _1541 = -_1535;
    float _1543 = _1541 + 1.0;
    float _1545 = _1407;
    float _1547 = _1535;
    if (_1511)
    {
        float _1549 = _1411 ? _1461 : _1391;
        _1441 = _1549;
    }
    float _1551 = _1441;
    float _1553 = _1485;
    float _1555 = _1483;
    float _1557 = _1487;
    if (!_1517)
    {
        float _1559 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1485);
        _1553 = _1559;
    }
    float _1561 = _1553;
    bool _1563 = _778 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1565 = isnan(_778);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    if (!_1517)
    {
        float _1575 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1483);
        _1555 = _1575;
    }
    float _1577 = _1555;
    if (!_1517)
    {
        float _1579 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1487);
        _1557 = _1579;
    }
    float _1581 = _1557;
    bool _1583 = _778 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1585 = isnan(_778);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1371)
    {
        _944 = _1375;
    }
    float _1597 = _944;
    float _1599 = -_1573;
    float _1601 = _1599 + 1.0;
    float _1603 = _1597;
    if (!_1371)
    {
        _1603 = _1355;
    }
    float _1605 = _1603;
    float _1607 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1611 = _1593 * _1601;
    float _1613 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1595);
    float _1615 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1617 = fma(_1607, _1451, -0.5);
    float _1619 = _1529 * _1611;
    float _1621 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1613);
    float _1623 = -_1609;
    float _1625 = fma(_1615, 2.0, _1623);
    float _1627 = -_130;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1473);
    float _1631 = -_1593;
    float _1633 = _1631 + 1.0;
    float _1635 = fma(_1447, _1551, -0.5);
    float _1637 = fma(_1621, _1617, _1629);
    float _1639 = _1621;
    if (!_1371)
    {
        _1545 = _1367;
    }
    float _1641 = _1545;
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1645 = _1641;
    if (_1371)
    {
        _1645 = _1375;
    }
    float _1647 = _1645;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1651 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1619);
    float _1653 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1649);
    float _1655 = _1649;
    if (!_1371)
    {
        _1639 = _1355;
    }
    float _1657 = _1639;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1661 = _1657;
    if (_1371)
    {
        _1419 = _1367;
    }
    float _1663 = _1419;
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1371)
    {
        _1661 = _1367;
    }
    float _1667 = _1661;
    float _1669 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1651);
    if (_1371)
    {
        _1655 = _1367;
    }
    float _1671 = _1655;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1677 = _1671;
    if (_1469)
    {
        float _1679 = _1425 ? _1543 : _1535;
        _1547 = _1679;
    }
    float _1681 = _1547;
    float _1683 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1665);
    if (!_1371)
    {
        _1677 = _1375;
    }
    float _1685 = _1677;
    float _1687 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1673);
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1691 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1695 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1697 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1699 = -_1689;
    float _1701 = fma(_1659, 2.0, _1699);
    float _1703 = fma(_1691, _1681, -0.5);
    float _1705 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1693);
    float _1707 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1695);
    float _1709 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1697);
    float _1711 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1525);
    float _1713 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1715 = -_130;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1625);
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1721 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1683);
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1725 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1439);
    float _1727 = fma(_1675, -2.0, _1719);
    float _1729 = fma(_1721, _1539, _1717);
    float _1731 = fma(_1713, -2.0, _1723);
    float _1733 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1531);
    float _1735 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1653);
    float _1737 = -_130;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1701);
    float _1741 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1687);
    float _1743 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1727);
    float _1745 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1731);
    float _1747 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1749 = fma(_1735, _1507, _1739);
    float _1751 = -_1743;
    float _1753 = fma(_1741, _1537, _1751);
    float _1755 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1757 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1747);
    float _1759 = _1637 + 0.5;
    float _1761 = _1270 * 0.5;
    float _1763 = -_1725;
    float _1765 = fma(_1711, _1703, _1763);
    float _1767 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1769 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1771 = fma(_1296, -0.5, _1761);
    float _1773 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1775 = _1765 + 0.5;
    float _1777 = exp2(_1769);
    float _1779 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1781 = -_1745;
    float _1783 = fma(_1733, _1635, _1781);
    float _1785 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1705);
    float _1787 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1707);
    float _1789 = _1779 + _1270;
    float _1791 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1709);
    float _1793 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1729 + 0.5;
    float _1797 = _1292 + _1270;
    float _1799 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1801 = _1749 + 0.5;
    float _1803 = _1753 + 0.5;
    float _1805 = _1797 * 0.5;
    float _1807 = _1783 + 0.5;
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    float _1813 = _1789 * 0.5;
    float _1815 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1785;
    out.m_67.y = _1787;
    out.m_67.z = _1791;
    out.m_69.x = _1793;
    out.m_69.y = _1755;
    out.m_69.z = _1773;
    out.m_69.w = _1799;
    out.m_71.x = _1759;
    out.m_71.y = _1775;
    out.m_71.z = _1801;
    out.m_71.w = _1803;
    out.m_73.x = _1795;
    out.m_73.y = _1807;
    out.gl_Position.x = _1292;
    out.gl_Position.y = _1296;
    out.gl_Position.z = _1779;
    out.gl_Position.w = _1270;
    out.m_75.x = _1805;
    out.m_75.y = _1771;
    out.m_75.z = _1813;
    out.m_75.w = _1270;
    out.m_45.x = _1815;
    float _1819 = _1817 * _1324;
    float _1821 = -_1817;
    float _1823 = _1821 + 1.0;
    float _1825 = _1335 * _1819;
    float _1827 = _1335 * _1823;
    float _1829 = _1349 * _1819;
    float _1831 = fma(_1345, _1825, _1329);
    float _1833 = fma(_1347, _1825, _1331);
    float _1835 = fma(_1335, _1829, _1333);
    out.m_77.x = _1831;
    out.m_77.y = _1833;
    out.m_77.z = _1835;
    out.m_77.w = _1827;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _770 = false;
    bool _602 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1892 = as_type<float>(_112);
        out.gl_Position.z = _1892;
    }
    if (!_100)
    {
        return out;
    }
    float _116 = in.m_47.w;
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
        _106 = _132;
    }
    float _134 = _106;
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
        out.m_45.x = 0.0;
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
        float _1961 = as_type<float>(_148);
        out.gl_Position.z = _1961;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_49.w;
    float _152 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
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
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
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
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_96);
        float _296 = 1.0 / _294;
        float _298 = _130 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _336;
    float _360 = _352 * _356;
    float _362 = -_352;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _340;
    float _374 = _332 * _364;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = _304 * _358;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _380, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = _320 * _372;
    float _398 = _390 * _374;
    float _400 = _392 * _374;
    float _402 = _394 * _374;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _418 = fma(_406, _396, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_410, _396, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].y, _400);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].z, _402);
    float _428 = fma(_418, _360, _416);
    float _430 = fma(_420, _360, _424);
    float _432 = fma(_422, _360, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].z, _432);
    bool _440 = !_370;
    float _458;
    if (!_440)
    {
        float _442 = in.m_51.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_96);
        float _464 = 1.0 / _462;
        float _466 = _130 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _468 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = isnan(_468);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _494 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_468);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    bool _510 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_468);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _476;
    float _524 = -_488;
    float _526 = _524 + 1.0;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _530 = 1.0 / _492;
    float _532 = _508 * _522;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = -_520;
    float _540 = _538 + 1.0;
    float _542 = fma(_532, _472, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _544 = _504 * _526;
    float _546 = -_504;
    float _548 = _546 + 1.0;
    float _550 = _488 * _540;
    float _552 = _536 * _530;
    float _554 = _542 * _544;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _468 + _556;
    float _560 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _566 = fma(_552, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _570 = fma(_566, _550, _564);
    float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[117].x, _570);
    float _578 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _576 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _578;
    out.m_53.y = _572;
    out.m_53.z = _574;
    out.m_53.w = _580;
    bool _582 = !_528;
    float _600;
    if (!_582)
    {
        float _584 = in.m_51.x;
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _588 = _584 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_96);
        float _606 = 1.0 / _604;
        float _608 = _130 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _614 = _610 + _612;
    bool _616 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _618 = isnan(_610);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _610 + _628;
    bool _632 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _634 = isnan(_610);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _652 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _654 = isnan(_610);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_626;
    float _666 = _664 + 1.0;
    float _668 = 1.0 / _646;
    float _670 = _662 * _666;
    float _672 = -_662;
    float _674 = _672 + 1.0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = 1.0 / _650;
    float _684 = _642 * _674;
    float _686 = -_642;
    float _688 = _686 + 1.0;
    float _690 = _614 * _668;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _696;
    float _700 = fma(_678, _690, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _702 = fma(_694, _690, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _704 = fma(_698, _690, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _706 = _630 * _682;
    float _708 = _700 * _684;
    float _710 = _702 * _684;
    float _712 = _704 * _684;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].x, _708);
    float _728 = fma(_716, _706, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _730 = fma(_720, _706, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _732 = fma(_724, _706, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].y, _710);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].z, _712);
    float _738 = fma(_728, _670, _726);
    float _740 = fma(_730, _670, _734);
    float _742 = fma(_732, _670, _736);
    float _744 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].x, _738);
    float _746 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].y, _740);
    float _748 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].z, _742);
    bool _750 = !_680;
    float _768;
    if (!_750)
    {
        float _752 = in.m_51.x;
        float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _756 = _752 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _758 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _760 = _758 * _754;
        float _762 = floor(_760);
        float _764 = -_762;
        float _766 = _760 + _764;
        _768 = _766;
        _770 = true;
    }
    else
    {
        float _772 = float(_96);
        float _774 = 1.0 / _772;
        float _776 = _130 * _774;
        _768 = _776;
    }
    _770 = false;
    float _778 = _768;
    float _780 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _782 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _786 = in.m_49.y;
    float _788 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _780);
    float _790 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _792 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _784);
    float _794 = in.m_49.x;
    float _796 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _788);
    float _798 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _790);
    float _800 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _792);
    float _802 = _796 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _804 = _798 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = _800 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _802 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _814 = _804 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _806 + _816;
    float _820 = _810 * _810;
    float _822 = fma(_814, _814, _820);
    float _824 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _826 = fma(_818, _818, _822);
    float _828 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _830 = rsqrt(_826);
    float _832 = _810 * _830;
    float _834 = _814 * _830;
    float _836 = -_832;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _810);
    float _840 = _818 * _830;
    float _842 = -_834;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    float _846 = _838 * _838;
    float _848 = -_840;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _852 = fma(_844, _844, _846);
    float _854 = in.m_49.z;
    float _856 = fma(_850, _850, _852);
    float _858 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _860 = in.m_55.x;
    float _862 = in.m_55.y;
    float _864 = in.m_55.z;
    float _866 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _868 = sqrt(_856);
    float _870 = _830 * _868;
    float _872 = _854 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _876 = _828 * _870;
    float _878 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _882 = _866 * _870;
    float _884 = _876 * _874;
    float _886 = _878 * _870;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    float _890 = _882 * _880;
    float _892 = _884 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _894 = _886 * _888;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _898 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].x, _892);
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].x, _896);
    float _902 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].z, _898);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].z, _900);
    float _906 = _806 + _902;
    float _908 = _804 + _904;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _906 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _908 + _914;
    float _918 = _912 * _912;
    float _920 = fma(_916, _916, _918);
    float _922 = _884 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _924 = sqrt(_920);
    float _926 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].x, _922);
    float _928 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].z, _926);
    float _930 = _802 + _928;
    bool _932 = _924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _928;
    float _936 = _802;
    float _938 = _908;
    float _940 = _884;
    float _942 = _906;
    float _944 = _860;
    if (!_932)
    {
        _934 = _906;
    }
    float _946 = _934;
    float _948 = _946;
    if (!_932)
    {
        _936 = _930;
    }
    float _950 = _936;
    bool _952 = !_932;
    float _954 = _950;
    if (!_952)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _960 = _924 + _958;
        float _962 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = rsqrt(_920);
        float _966 = _960 * _956;
        float _968 = _966 * 0.15915493667125701904296875;
        float _970 = _968 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        float _978 = _972 + (-1.0);
        float _980 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = fma(_976, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _984 = fma(_930, _972, _980);
        float _986 = _964 * _982;
        float _988 = fma(_916, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _990 = fma(_912, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _954 = _984;
        _938 = _988;
        _948 = _990;
        _940 = _968;
    }
    float _992 = _954;
    float _994 = _938;
    float _996 = _948;
    float _998 = _940;
    float _1000 = -_832;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _992);
    float _1004 = -_834;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1008 = -_840;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _996);
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1002 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = fma(_1018, _1018, _1024);
    float _1028 = fma(_1022, _1022, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1036 = _1018 * _1034;
    float _1038 = _1022 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 * _1038;
    float _1044 = _1040 + _1042;
    float _1046 = sqrt(_1044);
    bool _1048 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _1046 + _1050;
    float _1054 = _1022;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _998;
    float _1062 = _1014;
    if (_1048)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1064;
    }
    float _1066 = _1054;
    if (_1048)
    {
        float _1068 = rsqrt(_1044);
        _1056 = _1068;
    }
    float _1070 = _1056;
    float _1072 = _1070;
    if (_1048)
    {
        float _1074 = _1052 * _1066;
        _1058 = _1074;
    }
    float _1076 = _1058;
    if (_1048)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _1060 = _1078;
    }
    float _1080 = _1060;
    float _1082 = _1066;
    float _1084 = _1080;
    if (_1048)
    {
        float _1086 = _1080 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1094 = precise::max(0.0, _1092);
    float _1096 = _1024;
    float _1098 = _1094;
    if (_1048)
    {
        float _1100 = _1080 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        _1096 = _1102;
    }
    float _1104 = _1096;
    float _1106 = -_1034;
    float _1108 = -_1094;
    float _1110 = fma(_1014, _1106, _1108);
    if (!_1048)
    {
        _1062 = _1036;
    }
    float _1112 = _1062;
    float _1114 = _1112;
    if (_1048)
    {
        float _1116 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1116;
    }
    float _1118 = _1098;
    float _1120 = _1090;
    float _1122 = _1118;
    if (_1048)
    {
        float _1124 = fma(_1090, _1118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = _1126;
    float _1130 = _1104;
    if (_1048)
    {
        float _1132 = _1104 + (-1.0);
        _1122 = _1132;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    if (_1048)
    {
        float _1138 = _1070 * _1126;
        _942 = _1138;
    }
    float _1140 = _942;
    if (!_1048)
    {
        _1128 = _1110;
    }
    float _1142 = _1128;
    float _1144 = _1142;
    if (_1048)
    {
        float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1146;
    }
    float _1148 = _1084;
    if (_1048)
    {
        float _1150 = _1036 * _1140;
        _1114 = _1150;
    }
    float _1152 = _1114;
    if (!_1048)
    {
        _1136 = _1038;
    }
    float _1154 = _1136;
    float _1156 = _1154;
    if (_1048)
    {
        float _1158 = _1038 * _1140;
        _1156 = _1158;
    }
    float _1160 = _1156;
    if (!_1048)
    {
        _1072 = _1040;
    }
    float _1162 = _1072;
    float _1164 = _1162;
    if (_1048)
    {
        float _1166 = fma(_1110, _1104, _1148);
        _1144 = _1166;
    }
    float _1168 = _1144;
    if (_1048)
    {
        float _1170 = _1152 * _1152;
        _1164 = _1170;
    }
    float _1172 = _1164;
    if (!_1048)
    {
        _1130 = _1042;
    }
    float _1174 = _1130;
    float _1176 = _1174;
    if (_1048)
    {
        float _1178 = _1160 * _1160;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = fma(_1168, _1168, _1172);
    float _1184 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1186 = _1182 + _1180;
    float _1188 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1192 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1190);
    float _1194 = precise::clamp(_1192, 0.0, 1.0);
    float _1196 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1198 = rsqrt(_1186);
    float _1200 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1202 = -_1194;
    float _1204 = _1202 + 1.0;
    float _1206 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1196);
    float _1208 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1184);
    float _1210 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1200);
    float _1212 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1214 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1206);
    float _1216 = abs(_1204);
    float _1218 = log2(_1216);
    float _1220 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1212);
    float _1224 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1230 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1232 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1208);
    float _1234 = _1198 * _1152;
    float _1236 = _1198 * _1168;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = _1198 * _1160;
    float _1246 = -_1228;
    float _1248 = fma(_1246, _1226, 1.0);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = -_1242;
    float _1254 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1252);
    float _1256 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1258 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1260 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    float _1262 = -_1244;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1254);
    float _1266 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1268 = exp2(_1258);
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1260);
    float _1272 = fma(_1264, -0.5, 0.5);
    float _1274 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1266);
    float _1278 = fma(_1264, 0.5, 0.5);
    float _1280 = _1236 + 1.0;
    float _1282 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1274);
    float _1284 = log2(_1248);
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1276);
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1286);
    float _1294 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1296 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1298 = 1.0 / _1270;
    float _1300 = -_1236;
    float _1302 = fma(_1268, _1280, _1300);
    float _1304 = fma(_1278, _1294, 1.570728778839111328125);
    float _1306 = fma(_1302, 0.5, 0.5);
    float _1308 = sqrt(_1272);
    float _1310 = _1284 * 0.693147182464599609375;
    float _1312 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1314 = _1292 * _1298;
    float _1316 = _1296 * _1298;
    float _1318 = fma(_1314, 0.5, 0.5);
    float _1320 = fma(_1316, -0.5, 0.5);
    float _1322 = _1308 * 0.636619746685028076171875;
    float3 _3887 = float3(_1318, _1320, _1312);
    float _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).x;
    float3 _3898 = float3(_1318, _1320, _1312);
    float4 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3898, float3(0.0), isnan(_3898)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3898, float3(0.0), isnan(_3898)), level(0.0)).xyzw;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = _1327.w;
    float _1337 = -_1304;
    float _1339 = fma(_1322, _1337, 1.0);
    float2 _3920 = float2(_1339, _1306);
    float3 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3920, float2(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3920, float2(0.0), isnan(_3920)), level(0.0)).xyz;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = in.m_57.x;
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1355 = in.m_51.z;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1359 = _1357 != 0;
    float _1361 = _746 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1365 = _1363 != 0;
    float _1367 = in.m_51.y;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1371 = _1369 != 0;
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1375 = in.m_51.x;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    float _1381 = _748 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1383 = in.m_51.w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1391 = in.m_57.y;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1397 = -_1351;
    float _1399 = _1397 + 1.0;
    float _1401 = _1312;
    float _1403 = _1351;
    if (!_1359)
    {
        _1401 = _1351;
    }
    float _1405 = _1401;
    float _1407 = in.m_59.w;
    float _1409 = 1.0 / _1387;
    bool _1411 = _1355 > 0.5;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1415 = 0.0;
    float _1417 = _1405;
    float _1419 = _1355;
    if (!_1365)
    {
        _1415 = _1351;
    }
    float _1421 = _1415;
    float _1423 = _744 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1425 = _1367 > 0.5;
    float _1427 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1429 = _1421;
    if (_1359)
    {
        float _1431 = _1411 ? _1399 : _1351;
        _1417 = _1431;
    }
    float _1433 = _1417;
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1437 = _1375 > 0.5;
    float _1439 = fma(_1427, -2.0, _1393);
    float _1441 = _1391;
    if (_1365)
    {
        float _1443 = _1425 ? _1399 : _1351;
        _1429 = _1443;
    }
    float _1445 = _1429;
    float _1447 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1379)
    {
        float _1449 = _1437 ? _1399 : _1351;
        _1403 = _1449;
    }
    float _1451 = _1403;
    out.m_61.x = _1006;
    out.m_61.y = _1002;
    out.m_61.z = _1010;
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1455 = _1383 > 0.5;
    float _1457 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1459 = -_1391;
    float _1461 = _1459 + 1.0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1469 = _1467 != 0;
    float _1471 = -_1395;
    float _1473 = fma(_1457, 2.0, _1471);
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1477 = _1475 != 0;
    float _1479 = _1465 * _1409;
    int _1481 = _1455 ? as_type<int>(_1461) : as_type<int>(_1391);
    float _1483 = in.m_63.x;
    float _1485 = in.m_63.y;
    float _1487 = in.m_63.z;
    bool _1489 = _862 != 0.0;
    bool _1491 = isnan(_862);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan(0.0);
    bool _1497 = _1493 || _1495;
    float _1499 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_65.w = _1407;
    bool _1501 = _860 == 0.0;
    bool _1503 = !_1497;
    bool _1505 = _1501 && _1503;
    float _1507 = fma(_1499, _1433, -0.5);
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1511 = _1509 != 0;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1515 = _864 == 0.0;
    bool _1517 = _1515 && _1505;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1521 = _778 + _1519;
    float _1523 = _1477 ? as_type<float>(_1481) : _1391;
    float _1525 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1513);
    float _1527 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1529 = fma(_1479, _1521, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1531 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1413);
    float _1533 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1535 = _828 * _1391;
    float _1537 = fma(_1527, _1523, -0.5);
    float _1539 = fma(_1533, _1445, -0.5);
    float _1541 = -_1535;
    float _1543 = _1541 + 1.0;
    float _1545 = _1407;
    float _1547 = _1535;
    if (_1511)
    {
        float _1549 = _1411 ? _1461 : _1391;
        _1441 = _1549;
    }
    float _1551 = _1441;
    float _1553 = _1485;
    float _1555 = _1483;
    float _1557 = _1487;
    if (!_1517)
    {
        float _1559 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1485);
        _1553 = _1559;
    }
    float _1561 = _1553;
    bool _1563 = _778 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1565 = isnan(_778);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    if (!_1517)
    {
        float _1575 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1483);
        _1555 = _1575;
    }
    float _1577 = _1555;
    if (!_1517)
    {
        float _1579 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1487);
        _1557 = _1579;
    }
    float _1581 = _1557;
    bool _1583 = _778 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1585 = isnan(_778);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1371)
    {
        _944 = _1375;
    }
    float _1597 = _944;
    float _1599 = -_1573;
    float _1601 = _1599 + 1.0;
    float _1603 = _1597;
    if (!_1371)
    {
        _1603 = _1355;
    }
    float _1605 = _1603;
    float _1607 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1611 = _1593 * _1601;
    float _1613 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1595);
    float _1615 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1617 = fma(_1607, _1451, -0.5);
    float _1619 = _1529 * _1611;
    float _1621 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1613);
    float _1623 = -_1609;
    float _1625 = fma(_1615, 2.0, _1623);
    float _1627 = -_130;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1473);
    float _1631 = -_1593;
    float _1633 = _1631 + 1.0;
    float _1635 = fma(_1447, _1551, -0.5);
    float _1637 = fma(_1621, _1617, _1629);
    float _1639 = _1621;
    if (!_1371)
    {
        _1545 = _1367;
    }
    float _1641 = _1545;
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1645 = _1641;
    if (_1371)
    {
        _1645 = _1375;
    }
    float _1647 = _1645;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1651 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1619);
    float _1653 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1649);
    float _1655 = _1649;
    if (!_1371)
    {
        _1639 = _1355;
    }
    float _1657 = _1639;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1661 = _1657;
    if (_1371)
    {
        _1419 = _1367;
    }
    float _1663 = _1419;
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1371)
    {
        _1661 = _1367;
    }
    float _1667 = _1661;
    float _1669 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1651);
    if (_1371)
    {
        _1655 = _1367;
    }
    float _1671 = _1655;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1677 = _1671;
    if (_1469)
    {
        float _1679 = _1425 ? _1543 : _1535;
        _1547 = _1679;
    }
    float _1681 = _1547;
    float _1683 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1665);
    if (!_1371)
    {
        _1677 = _1375;
    }
    float _1685 = _1677;
    float _1687 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1673);
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1691 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1695 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1697 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1699 = -_1689;
    float _1701 = fma(_1659, 2.0, _1699);
    float _1703 = fma(_1691, _1681, -0.5);
    float _1705 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1693);
    float _1707 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1695);
    float _1709 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1697);
    float _1711 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1525);
    float _1713 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1715 = -_130;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1625);
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1721 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1683);
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1725 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1439);
    float _1727 = fma(_1675, -2.0, _1719);
    float _1729 = fma(_1721, _1539, _1717);
    float _1731 = fma(_1713, -2.0, _1723);
    float _1733 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1531);
    float _1735 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1653);
    float _1737 = -_130;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1701);
    float _1741 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1687);
    float _1743 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1727);
    float _1745 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1731);
    float _1747 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1749 = fma(_1735, _1507, _1739);
    float _1751 = -_1743;
    float _1753 = fma(_1741, _1537, _1751);
    float _1755 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1757 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1747);
    float _1759 = _1637 + 0.5;
    float _1761 = _1270 * 0.5;
    float _1763 = -_1725;
    float _1765 = fma(_1711, _1703, _1763);
    float _1767 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1769 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1771 = fma(_1296, -0.5, _1761);
    float _1773 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1775 = _1765 + 0.5;
    float _1777 = exp2(_1769);
    float _1779 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1781 = -_1745;
    float _1783 = fma(_1733, _1635, _1781);
    float _1785 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1705);
    float _1787 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1707);
    float _1789 = _1779 + _1270;
    float _1791 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1709);
    float _1793 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1729 + 0.5;
    float _1797 = _1292 + _1270;
    float _1799 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1801 = _1749 + 0.5;
    float _1803 = _1753 + 0.5;
    float _1805 = _1797 * 0.5;
    float _1807 = _1783 + 0.5;
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    float _1813 = _1789 * 0.5;
    float _1815 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1785;
    out.m_67.y = _1787;
    out.m_67.z = _1791;
    out.m_69.x = _1793;
    out.m_69.y = _1755;
    out.m_69.z = _1773;
    out.m_69.w = _1799;
    out.m_71.x = _1759;
    out.m_71.y = _1775;
    out.m_71.z = _1801;
    out.m_71.w = _1803;
    out.m_73.x = _1795;
    out.m_73.y = _1807;
    out.gl_Position.x = _1292;
    out.gl_Position.y = _1296;
    out.gl_Position.z = _1779;
    out.gl_Position.w = _1270;
    out.m_75.x = _1805;
    out.m_75.y = _1771;
    out.m_75.z = _1813;
    out.m_75.w = _1270;
    out.m_45.x = _1815;
    float _1819 = _1817 * _1324;
    float _1821 = -_1817;
    float _1823 = _1821 + 1.0;
    float _1825 = _1335 * _1819;
    float _1827 = _1335 * _1823;
    float _1829 = _1349 * _1819;
    float _1831 = fma(_1345, _1825, _1329);
    float _1833 = fma(_1347, _1825, _1331);
    float _1835 = fma(_1335, _1829, _1333);
    out.m_77.x = _1831;
    out.m_77.y = _1833;
    out.m_77.z = _1835;
    out.m_77.w = _1827;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _770 = false;
    bool _602 = false;
    bool _460 = false;
    bool _292 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = trunc(_91);
    int _96 = int(_93);
    bool _100 = _96 >= 1;
    float _102 = 0.0;
    if (!_100)
    {
        _102 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _104 = _102;
    float _106 = _104;
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _108 = 0;
    if (!_100)
    {
        float _110 = _104 * 5.0;
        _108 = as_type<int>(_110);
    }
    int _112 = _108;
    int _114 = _112;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1892 = as_type<float>(_112);
        out.gl_Position.z = _1892;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _116 = in.m_47.w;
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
        _106 = _132;
    }
    float _134 = _106;
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
        out.m_45.x = 0.0;
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
        float _1961 = as_type<float>(_148);
        out.gl_Position.z = _1961;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_49.w;
    float _152 = _130 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
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
    float _178 = _152;
    if (!_162)
    {
        float _180 = _152 * _152;
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
    bool _192 = !_162;
    float _194 = _190;
    if (!_192)
    {
        float _196 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _198 = log2(_196);
        float _200 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _202 = _200 + 1.0;
        float _204 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _206 = _152 * _198;
        float _208 = 1.0 / _202;
        float _210 = _204 * 0.693147182464599609375;
        float _212 = exp2(_206);
        float _214 = 1.0 / _210;
        float _216 = _212 + (-1.0);
        float _218 = -_216;
        float _220 = fma(_218, _214, _152);
        float _222 = _220 * _208;
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
        float _240 = _152 * _232;
        float _242 = exp2(_240);
        float _244 = -_242;
        float _246 = _244 + 1.0;
        float _248 = _246 * _238;
        _178 = _248;
    }
    float _250 = _178;
    bool _252 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _254 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _256 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _258 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _260 = fma(_250, _164, _254);
    float _262 = fma(_250, _166, _256);
    float _264 = fma(_250, _168, _258);
    float _266 = fma(_260, _150, _170);
    float _268 = fma(_262, _150, _172);
    float _270 = fma(_264, _150, _174);
    bool _272 = !_252;
    float _290;
    if (!_272)
    {
        float _274 = in.m_51.x;
        float _276 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _278 = _274 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _280 = fma(_278, (*spvDescriptorSet0.vp_c9)._m0[11].x, _130);
        float _282 = _280 * _276;
        float _284 = floor(_282);
        float _286 = -_284;
        float _288 = _282 + _286;
        _290 = _288;
        _292 = true;
    }
    else
    {
        float _294 = float(_96);
        float _296 = 1.0 / _294;
        float _298 = _130 * _296;
        _290 = _298;
    }
    _292 = false;
    float _300 = _290;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _304 = _300 + _302;
    bool _306 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _308 = isnan(_300);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _320 = _300 + _318;
    bool _322 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _324 = isnan(_300);
    bool _326 = _322 || _324;
    bool _328 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _330 = _326 || _328;
    float _332 = float(_330);
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _334;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _340 = _338 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _342 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _344 = isnan(_300);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_316;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _336;
    float _360 = _352 * _356;
    float _362 = -_352;
    float _364 = _362 + 1.0;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _372 = 1.0 / _340;
    float _374 = _332 * _364;
    float _376 = -_332;
    float _378 = _376 + 1.0;
    float _380 = _304 * _358;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _380, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = fma(_384, _380, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _394 = fma(_388, _380, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _396 = _320 * _372;
    float _398 = _390 * _374;
    float _400 = _392 * _374;
    float _402 = _394 * _374;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _416 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].x, _398);
    float _418 = fma(_406, _396, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _420 = fma(_410, _396, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _422 = fma(_414, _396, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _424 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].y, _400);
    float _426 = fma(_378, (*spvDescriptorSet0.vp_c9)._m0[107].z, _402);
    float _428 = fma(_418, _360, _416);
    float _430 = fma(_420, _360, _424);
    float _432 = fma(_422, _360, _426);
    float _434 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].x, _428);
    float _436 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].y, _430);
    float _438 = fma(_316, (*spvDescriptorSet0.vp_c9)._m0[109].z, _432);
    bool _440 = !_370;
    float _458;
    if (!_440)
    {
        float _442 = in.m_51.x;
        float _444 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _446 = _442 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _448 = fma(_446, (*spvDescriptorSet0.vp_c9)._m0[11].y, _130);
        float _450 = _448 * _444;
        float _452 = floor(_450);
        float _454 = -_452;
        float _456 = _450 + _454;
        _458 = _456;
        _460 = true;
    }
    else
    {
        float _462 = float(_96);
        float _464 = 1.0 / _462;
        float _466 = _130 * _464;
        _458 = _466;
    }
    _460 = false;
    float _468 = _458;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _472 = _468 + _470;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _478 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _480 = isnan(_468);
    bool _482 = _478 || _480;
    bool _484 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _486 = _482 || _484;
    float _488 = float(_486);
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _492 = _490 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _494 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_468);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _506;
    bool _510 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = isnan(_468);
    bool _514 = _510 || _512;
    bool _516 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _518 = _514 || _516;
    float _520 = float(_518);
    float _522 = 1.0 / _476;
    float _524 = -_488;
    float _526 = _524 + 1.0;
    bool _528 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _530 = 1.0 / _492;
    float _532 = _508 * _522;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _538 = -_520;
    float _540 = _538 + 1.0;
    float _542 = fma(_532, _472, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _544 = _504 * _526;
    float _546 = -_504;
    float _548 = _546 + 1.0;
    float _550 = _488 * _540;
    float _552 = _536 * _530;
    float _554 = _542 * _544;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _558 = _468 + _556;
    float _560 = _434 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _562 = _438 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _564 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _566 = fma(_552, _558, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _568 = _436 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _570 = fma(_566, _550, _564);
    float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[117].x, _570);
    float _578 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _580 = _576 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_53.x = _578;
    out.m_53.y = _572;
    out.m_53.z = _574;
    out.m_53.w = _580;
    bool _582 = !_528;
    float _600;
    if (!_582)
    {
        float _584 = in.m_51.x;
        float _586 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _588 = _584 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _590 = fma(_588, (*spvDescriptorSet0.vp_c9)._m0[11].z, _130);
        float _592 = _590 * _586;
        float _594 = floor(_592);
        float _596 = -_594;
        float _598 = _592 + _596;
        _600 = _598;
        _602 = true;
    }
    else
    {
        float _604 = float(_96);
        float _606 = 1.0 / _604;
        float _608 = _130 * _606;
        _600 = _608;
    }
    _602 = false;
    float _610 = _600;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _614 = _610 + _612;
    bool _616 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _618 = isnan(_610);
    bool _620 = _616 || _618;
    bool _622 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _624 = _620 || _622;
    float _626 = float(_624);
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _630 = _610 + _628;
    bool _632 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _634 = isnan(_610);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _644;
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _652 = _610 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _654 = isnan(_610);
    bool _656 = _652 || _654;
    bool _658 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _660 = _656 || _658;
    float _662 = float(_660);
    float _664 = -_626;
    float _666 = _664 + 1.0;
    float _668 = 1.0 / _646;
    float _670 = _662 * _666;
    float _672 = -_662;
    float _674 = _672 + 1.0;
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _676;
    bool _680 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _682 = 1.0 / _650;
    float _684 = _642 * _674;
    float _686 = -_642;
    float _688 = _686 + 1.0;
    float _690 = _614 * _668;
    float _692 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _692;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _696;
    float _700 = fma(_678, _690, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _702 = fma(_694, _690, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _704 = fma(_698, _690, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _706 = _630 * _682;
    float _708 = _700 * _684;
    float _710 = _702 * _684;
    float _712 = _704 * _684;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _720 = _718 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _726 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].x, _708);
    float _728 = fma(_716, _706, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _730 = fma(_720, _706, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _732 = fma(_724, _706, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _734 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].y, _710);
    float _736 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[123].z, _712);
    float _738 = fma(_728, _670, _726);
    float _740 = fma(_730, _670, _734);
    float _742 = fma(_732, _670, _736);
    float _744 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].x, _738);
    float _746 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].y, _740);
    float _748 = fma(_626, (*spvDescriptorSet0.vp_c9)._m0[125].z, _742);
    bool _750 = !_680;
    float _768;
    if (!_750)
    {
        float _752 = in.m_51.x;
        float _754 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _756 = _752 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _758 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[11].w, _130);
        float _760 = _758 * _754;
        float _762 = floor(_760);
        float _764 = -_762;
        float _766 = _760 + _764;
        _768 = _766;
        _770 = true;
    }
    else
    {
        float _772 = float(_96);
        float _774 = 1.0 / _772;
        float _776 = _130 * _774;
        _768 = _776;
    }
    _770 = false;
    float _778 = _768;
    float _780 = _268 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _782 = _268 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _784 = _268 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _786 = in.m_49.y;
    float _788 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[5].x, _780);
    float _790 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[4].x, _782);
    float _792 = fma(_266, (*spvDescriptorSet0.vp_c10)._m0[6].x, _784);
    float _794 = in.m_49.x;
    float _796 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].z, _788);
    float _798 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].z, _790);
    float _800 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].z, _792);
    float _802 = _796 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _804 = _798 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _806 = _800 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _808 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _810 = _802 + _808;
    float _812 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _814 = _804 + _812;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _818 = _806 + _816;
    float _820 = _810 * _810;
    float _822 = fma(_814, _814, _820);
    float _824 = _786 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _826 = fma(_818, _818, _822);
    float _828 = _824 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _830 = rsqrt(_826);
    float _832 = _810 * _830;
    float _834 = _814 * _830;
    float _836 = -_832;
    float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[18].w, _810);
    float _840 = _818 * _830;
    float _842 = -_834;
    float _844 = fma(_842, (*spvDescriptorSet0.vp_c9)._m0[18].w, _814);
    float _846 = _838 * _838;
    float _848 = -_840;
    float _850 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[18].w, _818);
    float _852 = fma(_844, _844, _846);
    float _854 = in.m_49.z;
    float _856 = fma(_850, _850, _852);
    float _858 = _794 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _860 = in.m_55.x;
    float _862 = in.m_55.y;
    float _864 = in.m_55.z;
    float _866 = _858 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _868 = sqrt(_856);
    float _870 = _830 * _868;
    float _872 = _854 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _874 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _862);
    float _876 = _828 * _870;
    float _878 = _872 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _880 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _860);
    float _882 = _866 * _870;
    float _884 = _876 * _874;
    float _886 = _878 * _870;
    float _888 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _864);
    float _890 = _882 * _880;
    float _892 = _884 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _894 = _886 * _888;
    float _896 = _884 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _898 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[10].x, _892);
    float _900 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[8].x, _896);
    float _902 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[10].z, _898);
    float _904 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[8].z, _900);
    float _906 = _806 + _902;
    float _908 = _804 + _904;
    float _910 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _912 = _906 + _910;
    float _914 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _916 = _908 + _914;
    float _918 = _912 * _912;
    float _920 = fma(_916, _916, _918);
    float _922 = _884 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _924 = sqrt(_920);
    float _926 = fma(_890, (*spvDescriptorSet0.vp_c10)._m0[9].x, _922);
    float _928 = fma(_894, (*spvDescriptorSet0.vp_c10)._m0[9].z, _926);
    float _930 = _802 + _928;
    bool _932 = _924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _934 = _928;
    float _936 = _802;
    float _938 = _908;
    float _940 = _884;
    float _942 = _906;
    float _944 = _860;
    if (!_932)
    {
        _934 = _906;
    }
    float _946 = _934;
    float _948 = _946;
    if (!_932)
    {
        _936 = _930;
    }
    float _950 = _936;
    bool _952 = !_932;
    float _954 = _950;
    if (!_952)
    {
        float _956 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _958 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _960 = _924 + _958;
        float _962 = _930 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _964 = rsqrt(_920);
        float _966 = _960 * _956;
        float _968 = _966 * 0.15915493667125701904296875;
        float _970 = _968 * 6.283185482025146484375;
        float _972 = cos(_970);
        float _974 = _968 * 6.283185482025146484375;
        float _976 = sin(_974);
        float _978 = _972 + (-1.0);
        float _980 = _978 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _982 = fma(_976, _962, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _984 = fma(_930, _972, _980);
        float _986 = _964 * _982;
        float _988 = fma(_916, _986, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _990 = fma(_912, _986, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _954 = _984;
        _938 = _988;
        _948 = _990;
        _940 = _968;
    }
    float _992 = _954;
    float _994 = _938;
    float _996 = _948;
    float _998 = _940;
    float _1000 = -_832;
    float _1002 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[18].w, _992);
    float _1004 = -_834;
    float _1006 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[18].w, _994);
    float _1008 = -_840;
    float _1010 = fma(_1008, (*spvDescriptorSet0.vp_c9)._m0[18].w, _996);
    float _1012 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1014 = _1002 + _1012;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1018 = _1006 + _1016;
    float _1020 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1022 = _1010 + _1020;
    float _1024 = _1014 * _1014;
    float _1026 = fma(_1018, _1018, _1024);
    float _1028 = fma(_1022, _1022, _1026);
    float _1030 = rsqrt(_1028);
    float _1032 = sqrt(_1028);
    float _1034 = _1030 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1036 = _1018 * _1034;
    float _1038 = _1022 * _1034;
    float _1040 = _1036 * _1036;
    float _1042 = _1038 * _1038;
    float _1044 = _1040 + _1042;
    float _1046 = sqrt(_1044);
    bool _1048 = _1046 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1050 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1052 = _1046 + _1050;
    float _1054 = _1022;
    float _1056 = _1044;
    float _1058 = _1052;
    float _1060 = _998;
    float _1062 = _1014;
    if (_1048)
    {
        float _1064 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1054 = _1064;
    }
    float _1066 = _1054;
    if (_1048)
    {
        float _1068 = rsqrt(_1044);
        _1056 = _1068;
    }
    float _1070 = _1056;
    float _1072 = _1070;
    if (_1048)
    {
        float _1074 = _1052 * _1066;
        _1058 = _1074;
    }
    float _1076 = _1058;
    if (_1048)
    {
        float _1078 = _1076 * 0.15915493667125701904296875;
        _1060 = _1078;
    }
    float _1080 = _1060;
    float _1082 = _1066;
    float _1084 = _1080;
    if (_1048)
    {
        float _1086 = _1080 * 6.283185482025146484375;
        float _1088 = sin(_1086);
        _1082 = _1088;
    }
    float _1090 = _1082;
    float _1092 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1094 = precise::max(0.0, _1092);
    float _1096 = _1024;
    float _1098 = _1094;
    if (_1048)
    {
        float _1100 = _1080 * 6.283185482025146484375;
        float _1102 = cos(_1100);
        _1096 = _1102;
    }
    float _1104 = _1096;
    float _1106 = -_1034;
    float _1108 = -_1094;
    float _1110 = fma(_1014, _1106, _1108);
    if (!_1048)
    {
        _1062 = _1036;
    }
    float _1112 = _1062;
    float _1114 = _1112;
    if (_1048)
    {
        float _1116 = _1110 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1098 = _1116;
    }
    float _1118 = _1098;
    float _1120 = _1090;
    float _1122 = _1118;
    if (_1048)
    {
        float _1124 = fma(_1090, _1118, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1120 = _1124;
    }
    float _1126 = _1120;
    float _1128 = _1126;
    float _1130 = _1104;
    if (_1048)
    {
        float _1132 = _1104 + (-1.0);
        _1122 = _1132;
    }
    float _1134 = _1122;
    float _1136 = _1134;
    if (_1048)
    {
        float _1138 = _1070 * _1126;
        _942 = _1138;
    }
    float _1140 = _942;
    if (!_1048)
    {
        _1128 = _1110;
    }
    float _1142 = _1128;
    float _1144 = _1142;
    if (_1048)
    {
        float _1146 = _1134 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1084 = _1146;
    }
    float _1148 = _1084;
    if (_1048)
    {
        float _1150 = _1036 * _1140;
        _1114 = _1150;
    }
    float _1152 = _1114;
    if (!_1048)
    {
        _1136 = _1038;
    }
    float _1154 = _1136;
    float _1156 = _1154;
    if (_1048)
    {
        float _1158 = _1038 * _1140;
        _1156 = _1158;
    }
    float _1160 = _1156;
    if (!_1048)
    {
        _1072 = _1040;
    }
    float _1162 = _1072;
    float _1164 = _1162;
    if (_1048)
    {
        float _1166 = fma(_1110, _1104, _1148);
        _1144 = _1166;
    }
    float _1168 = _1144;
    if (_1048)
    {
        float _1170 = _1152 * _1152;
        _1164 = _1170;
    }
    float _1172 = _1164;
    if (!_1048)
    {
        _1130 = _1042;
    }
    float _1174 = _1130;
    float _1176 = _1174;
    if (_1048)
    {
        float _1178 = _1160 * _1160;
        _1176 = _1178;
    }
    float _1180 = _1176;
    float _1182 = fma(_1168, _1168, _1172);
    float _1184 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1186 = _1182 + _1180;
    float _1188 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1190 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1192 = fma(_1032, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1190);
    float _1194 = precise::clamp(_1192, 0.0, 1.0);
    float _1196 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1198 = rsqrt(_1186);
    float _1200 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1188);
    float _1202 = -_1194;
    float _1204 = _1202 + 1.0;
    float _1206 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1196);
    float _1208 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1184);
    float _1210 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1200);
    float _1212 = _1002 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1214 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1206);
    float _1216 = abs(_1204);
    float _1218 = log2(_1216);
    float _1220 = _1210 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1222 = fma(_1006, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1212);
    float _1224 = _1214 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1226 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1228 = _1220 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1230 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1222);
    float _1232 = fma(_1010, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1208);
    float _1234 = _1198 * _1152;
    float _1236 = _1198 * _1168;
    float _1238 = _1230 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1240 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1242 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1244 = _1198 * _1160;
    float _1246 = -_1228;
    float _1248 = fma(_1246, _1226, 1.0);
    float _1250 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1240);
    float _1252 = -_1242;
    float _1254 = fma(_1236, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1252);
    float _1256 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1258 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1260 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1250);
    float _1262 = -_1244;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1254);
    float _1266 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1268 = exp2(_1258);
    float _1270 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1260);
    float _1272 = fma(_1264, -0.5, 0.5);
    float _1274 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1276 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1266);
    float _1278 = fma(_1264, 0.5, 0.5);
    float _1280 = _1236 + 1.0;
    float _1282 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1274);
    float _1284 = log2(_1248);
    float _1286 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1276);
    float _1288 = fma(_1278, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1290 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1282);
    float _1292 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1286);
    float _1294 = fma(_1278, _1288, -0.212114393711090087890625);
    float _1296 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1290);
    float _1298 = 1.0 / _1270;
    float _1300 = -_1236;
    float _1302 = fma(_1268, _1280, _1300);
    float _1304 = fma(_1278, _1294, 1.570728778839111328125);
    float _1306 = fma(_1302, 0.5, 0.5);
    float _1308 = sqrt(_1272);
    float _1310 = _1284 * 0.693147182464599609375;
    float _1312 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1314 = _1292 * _1298;
    float _1316 = _1296 * _1298;
    float _1318 = fma(_1314, 0.5, 0.5);
    float _1320 = fma(_1316, -0.5, 0.5);
    float _1322 = _1308 * 0.636619746685028076171875;
    float3 _3887 = float3(_1318, _1320, _1312);
    float _1324 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3887, float3(0.0), isnan(_3887)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3887, float3(0.0), isnan(_3887)), level(0.0)).x;
    float3 _3898 = float3(_1318, _1320, _1312);
    float4 _1327 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3898, float3(0.0), isnan(_3898)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3898, float3(0.0), isnan(_3898)), level(0.0)).xyzw;
    float _1329 = _1327.x;
    float _1331 = _1327.y;
    float _1333 = _1327.z;
    float _1335 = _1327.w;
    float _1337 = -_1304;
    float _1339 = fma(_1322, _1337, 1.0);
    float2 _3920 = float2(_1339, _1306);
    float3 _1343 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3920, float2(0.0), isnan(_3920)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3920, float2(0.0), isnan(_3920)), level(0.0)).xyz;
    float _1345 = _1343.x;
    float _1347 = _1343.y;
    float _1349 = _1343.z;
    float _1351 = in.m_57.x;
    float _1353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1355 = in.m_51.z;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1359 = _1357 != 0;
    float _1361 = _746 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    int _1363 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1365 = _1363 != 0;
    float _1367 = in.m_51.y;
    int _1369 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1371 = _1369 != 0;
    float _1373 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1375 = in.m_51.x;
    int _1377 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1379 = _1377 != 0;
    float _1381 = _748 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1383 = in.m_51.w;
    float _1385 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1389 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1391 = in.m_57.y;
    float _1393 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1395 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1397 = -_1351;
    float _1399 = _1397 + 1.0;
    float _1401 = _1312;
    float _1403 = _1351;
    if (!_1359)
    {
        _1401 = _1351;
    }
    float _1405 = _1401;
    float _1407 = in.m_59.w;
    float _1409 = 1.0 / _1387;
    bool _1411 = _1355 > 0.5;
    float _1413 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1415 = 0.0;
    float _1417 = _1405;
    float _1419 = _1355;
    if (!_1365)
    {
        _1415 = _1351;
    }
    float _1421 = _1415;
    float _1423 = _744 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _1425 = _1367 > 0.5;
    float _1427 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1429 = _1421;
    if (_1359)
    {
        float _1431 = _1411 ? _1399 : _1351;
        _1417 = _1431;
    }
    float _1433 = _1417;
    float _1435 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _1437 = _1375 > 0.5;
    float _1439 = fma(_1427, -2.0, _1393);
    float _1441 = _1391;
    if (_1365)
    {
        float _1443 = _1425 ? _1399 : _1351;
        _1429 = _1443;
    }
    float _1445 = _1429;
    float _1447 = _1389 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (_1379)
    {
        float _1449 = _1437 ? _1399 : _1351;
        _1403 = _1449;
    }
    float _1451 = _1403;
    out.m_61.x = _1006;
    out.m_61.y = _1002;
    out.m_61.z = _1010;
    float _1453 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _1455 = _1383 > 0.5;
    float _1457 = _1375 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1459 = -_1391;
    float _1461 = _1459 + 1.0;
    float _1463 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1463;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1469 = _1467 != 0;
    float _1471 = -_1395;
    float _1473 = fma(_1457, 2.0, _1471);
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1477 = _1475 != 0;
    float _1479 = _1465 * _1409;
    int _1481 = _1455 ? as_type<int>(_1461) : as_type<int>(_1391);
    float _1483 = in.m_63.x;
    float _1485 = in.m_63.y;
    float _1487 = in.m_63.z;
    bool _1489 = _862 != 0.0;
    bool _1491 = isnan(_862);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan(0.0);
    bool _1497 = _1493 || _1495;
    float _1499 = _1435 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    out.m_65.w = _1407;
    bool _1501 = _860 == 0.0;
    bool _1503 = !_1497;
    bool _1505 = _1501 && _1503;
    float _1507 = fma(_1499, _1433, -0.5);
    int _1509 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1511 = _1509 != 0;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1515 = _864 == 0.0;
    bool _1517 = _1515 && _1505;
    float _1519 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1521 = _778 + _1519;
    float _1523 = _1477 ? as_type<float>(_1481) : _1391;
    float _1525 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1513);
    float _1527 = _1353 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1529 = fma(_1479, _1521, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1531 = fma(_1367, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1413);
    float _1533 = _1453 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1535 = _828 * _1391;
    float _1537 = fma(_1527, _1523, -0.5);
    float _1539 = fma(_1533, _1445, -0.5);
    float _1541 = -_1535;
    float _1543 = _1541 + 1.0;
    float _1545 = _1407;
    float _1547 = _1535;
    if (_1511)
    {
        float _1549 = _1411 ? _1461 : _1391;
        _1441 = _1549;
    }
    float _1551 = _1441;
    float _1553 = _1485;
    float _1555 = _1483;
    float _1557 = _1487;
    if (!_1517)
    {
        float _1559 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1485);
        _1553 = _1559;
    }
    float _1561 = _1553;
    bool _1563 = _778 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1565 = isnan(_778);
    bool _1567 = _1563 || _1565;
    bool _1569 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1571 = _1567 || _1569;
    float _1573 = float(_1571);
    if (!_1517)
    {
        float _1575 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1483);
        _1555 = _1575;
    }
    float _1577 = _1555;
    if (!_1517)
    {
        float _1579 = fma(_864, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1487);
        _1557 = _1579;
    }
    float _1581 = _1557;
    bool _1583 = _778 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1585 = isnan(_778);
    bool _1587 = _1583 || _1585;
    bool _1589 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1591 = _1587 || _1589;
    float _1593 = float(_1591);
    float _1595 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1371)
    {
        _944 = _1375;
    }
    float _1597 = _944;
    float _1599 = -_1573;
    float _1601 = _1599 + 1.0;
    float _1603 = _1597;
    if (!_1371)
    {
        _1603 = _1355;
    }
    float _1605 = _1603;
    float _1607 = _1373 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1609 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1611 = _1593 * _1601;
    float _1613 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1595);
    float _1615 = _1605 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1617 = fma(_1607, _1451, -0.5);
    float _1619 = _1529 * _1611;
    float _1621 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1613);
    float _1623 = -_1609;
    float _1625 = fma(_1615, 2.0, _1623);
    float _1627 = -_130;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1473);
    float _1631 = -_1593;
    float _1633 = _1631 + 1.0;
    float _1635 = fma(_1447, _1551, -0.5);
    float _1637 = fma(_1621, _1617, _1629);
    float _1639 = _1621;
    if (!_1371)
    {
        _1545 = _1367;
    }
    float _1641 = _1545;
    float _1643 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1645 = _1641;
    if (_1371)
    {
        _1645 = _1375;
    }
    float _1647 = _1645;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1651 = fma(_1633, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1619);
    float _1653 = fma(_1647, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1649);
    float _1655 = _1649;
    if (!_1371)
    {
        _1639 = _1355;
    }
    float _1657 = _1639;
    float _1659 = _1647 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1661 = _1657;
    if (_1371)
    {
        _1419 = _1367;
    }
    float _1663 = _1419;
    float _1665 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    if (_1371)
    {
        _1661 = _1367;
    }
    float _1667 = _1661;
    float _1669 = fma(_1573, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1651);
    if (_1371)
    {
        _1655 = _1367;
    }
    float _1671 = _1655;
    float _1673 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1675 = _1663 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1677 = _1671;
    if (_1469)
    {
        float _1679 = _1425 ? _1543 : _1535;
        _1547 = _1679;
    }
    float _1681 = _1547;
    float _1683 = fma(_1375, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1665);
    if (!_1371)
    {
        _1677 = _1375;
    }
    float _1685 = _1677;
    float _1687 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1673);
    float _1689 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1691 = _1643 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1693 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1695 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1697 = _1561 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1699 = -_1689;
    float _1701 = fma(_1659, 2.0, _1699);
    float _1703 = fma(_1691, _1681, -0.5);
    float _1705 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1693);
    float _1707 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1695);
    float _1709 = fma(_1577, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1697);
    float _1711 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1525);
    float _1713 = _1685 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1715 = -_130;
    float _1717 = fma(_1715, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1625);
    float _1719 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1721 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1683);
    float _1723 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1725 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1439);
    float _1727 = fma(_1675, -2.0, _1719);
    float _1729 = fma(_1721, _1539, _1717);
    float _1731 = fma(_1713, -2.0, _1723);
    float _1733 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1531);
    float _1735 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1653);
    float _1737 = -_130;
    float _1739 = fma(_1737, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1701);
    float _1741 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1687);
    float _1743 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1727);
    float _1745 = fma(_130, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1731);
    float _1747 = _1224 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1749 = fma(_1735, _1507, _1739);
    float _1751 = -_1743;
    float _1753 = fma(_1741, _1537, _1751);
    float _1755 = _1361 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1757 = fma(_1238, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1747);
    float _1759 = _1637 + 0.5;
    float _1761 = _1270 * 0.5;
    float _1763 = -_1725;
    float _1765 = fma(_1711, _1703, _1763);
    float _1767 = fma(_1220, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1757);
    float _1769 = _1218 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1771 = fma(_1296, -0.5, _1761);
    float _1773 = _1381 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1775 = _1765 + 0.5;
    float _1777 = exp2(_1769);
    float _1779 = fma(_1256, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1767);
    float _1781 = -_1745;
    float _1783 = fma(_1733, _1635, _1781);
    float _1785 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1705);
    float _1787 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1707);
    float _1789 = _1779 + _1270;
    float _1791 = fma(_1581, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1709);
    float _1793 = _1423 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1795 = _1729 + 0.5;
    float _1797 = _1292 + _1270;
    float _1799 = _1669 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1801 = _1749 + 0.5;
    float _1803 = _1753 + 0.5;
    float _1805 = _1797 * 0.5;
    float _1807 = _1783 + 0.5;
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    float _1813 = _1789 * 0.5;
    float _1815 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1817 = _1811 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_67.x = _1785;
    out.m_67.y = _1787;
    out.m_67.z = _1791;
    out.m_69.x = _1793;
    out.m_69.y = _1755;
    out.m_69.z = _1773;
    out.m_69.w = _1799;
    out.m_71.x = _1759;
    out.m_71.y = _1775;
    out.m_71.z = _1801;
    out.m_71.w = _1803;
    out.m_73.x = _1795;
    out.m_73.y = _1807;
    out.gl_Position.x = _1292;
    out.gl_Position.y = _1296;
    out.gl_Position.z = _1779;
    out.gl_Position.w = _1270;
    out.m_75.x = _1805;
    out.m_75.y = _1771;
    out.m_75.z = _1813;
    out.m_75.w = _1270;
    out.m_45.x = _1815;
    float _1819 = _1817 * _1324;
    float _1821 = -_1817;
    float _1823 = _1821 + 1.0;
    float _1825 = _1335 * _1819;
    float _1827 = _1335 * _1823;
    float _1829 = _1349 * _1819;
    float _1831 = fma(_1345, _1825, _1329);
    float _1833 = fma(_1347, _1825, _1331);
    float _1835 = fma(_1335, _1829, _1333);
    out.m_77.x = _1831;
    out.m_77.y = _1833;
    out.m_77.z = _1835;
    out.m_77.w = _1827;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

