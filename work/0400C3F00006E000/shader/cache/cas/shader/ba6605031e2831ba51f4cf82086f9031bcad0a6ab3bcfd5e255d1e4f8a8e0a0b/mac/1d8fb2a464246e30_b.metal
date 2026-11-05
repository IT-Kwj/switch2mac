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
    float4 m_55 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_65 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_61 [[user(locn5)]];
    float4 m_69 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _474 = false;
    bool _372 = false;
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
        float _1666 = as_type<float>(_104);
        out.gl_Position.z = _1666;
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
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1734 = as_type<float>(_140);
        out.gl_Position.z = _1734;
    }
    if (_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _146 * _144;
    float _164 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = _164 * 6.283185482025146484375;
    float _174 = floor(_164);
    float _176 = _172 * 0.15915493667125701904296875;
    float _178 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _180 = 1.4012984643248170709237295832899e-45;
    float _182 = _178;
    if (!_156)
    {
        float _184 = _178 * _178;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = _188;
    if (!_156)
    {
        float _196 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = -_174;
    float _202 = _164 + _200;
    bool _204 = !_156;
    float _206 = _198;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _178 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _178);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_156;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _178 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _182 = _260;
    }
    float _262 = _182;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _270 = _268 != 0;
    float _272 = in.m_51.w;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    bool _280 = !_266;
    int _282 = _280 ? 0 : 1;
    float _284 = -_202;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _288 = _202 < 0.5;
    float _290 = float(_288);
    float _292 = fma(_192, 0.5, 0.5);
    bool _294 = !_160;
    int _296 = _294 ? 0 : 1;
    float _298 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _300 = abs(_282);
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _306 = abs(_296);
    float _308 = fma(_262, _166, _298);
    float _310 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _314 = -_292;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_270;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_262, _168, _310);
    float _324 = float(_300);
    int _326 = abs(_320);
    float _328 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = float(_306);
    float _332 = abs(_286);
    float _334 = _324 * _332;
    float _336 = float(_326);
    float _338 = fma(_262, _170, _328);
    float _340 = fma(_308, _272, _274);
    float _342 = fma(_330, _316, _334);
    float _344 = fma(_322, _272, _276);
    float _346 = fma(_338, _272, _278);
    float _348 = abs(_304);
    float _350 = fma(_336, _348, _342);
    bool _352 = !_312;
    bool _354 = false;
    float _370;
    if (!_352)
    {
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _358 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_88);
        float _376 = 1.0 / _374;
        float _378 = _122 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    bool _382 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _384 = isnan(_380);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _398 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _400 = isnan(_380);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _380 + _414;
    float _418 = -_392;
    float _420 = _418 + 1.0;
    bool _422 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _424 = 1.0 / _396;
    float _426 = _408 * _420;
    float _428 = -_408;
    float _430 = _428 + 1.0;
    float _432 = _412 * _424;
    float _434 = fma(_432, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _436 = _434 * _426;
    float _438 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _436);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[116].x, _438);
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _456 = !_422;
    float _472;
    if (!_456)
    {
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_88);
        float _478 = 1.0 / _476;
        float _480 = _122 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_51.x;
    float _486 = in.m_51.y;
    float _488 = in.m_51.z;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _492 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _490;
    float _494 = in.m_53.x;
    float _496 = in.m_53.y;
    float _498 = in.m_53.z;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _502 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _500;
    float _504 = -_492;
    float _506 = _504 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _508 = -_502;
    float _510 = _508 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _512 = _506 * _506;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _516 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _514;
    float _518 = fma(_510, _510, _512);
    float _520 = -_516;
    float _522 = _520 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = fma(_522, _522, _518);
    float _526 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _530 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = sqrt(_524);
    float _534 = _350 * _526;
    float _536 = _350 * _528;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _496);
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _494);
    float _542 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _546 = _350 * _530;
    float _548 = _542 * _538;
    float _550 = _544 * _540;
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    float _554 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _556 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = _548 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _562 = fma(_532, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _564 = _554 * _552;
    float _566 = _548 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _568 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _570 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _572 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
    float _574 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _566);
    float _576 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
    float _578 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].z, _570);
    float _580 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].z, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].z, _574);
    float _584 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _586 = _578 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _588 = precise::max(_562, 0.3499999940395355224609375);
    float _590 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _592 = _582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _594 = _584 + _586;
    float _596 = precise::min(_588, 1.0);
    float _598 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _600 = _590 + _592;
    float _602 = -_516;
    float _604 = _594 + _602;
    float _606 = _548 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _608 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    float _610 = -_502;
    float _612 = _600 + _610;
    float _614 = fma(_604, _596, _516);
    float _616 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _606);
    float _618 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _620 = fma(_612, _596, _502);
    float _622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _624 = _614 + _622;
    float _626 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].z, _616);
    float _628 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = _626 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _638 = _628 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _640 = fma(_632, _632, _634);
    float _642 = _628 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _644 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[11].x, _638);
    float _646 = _628 + _636;
    float _648 = sqrt(_640);
    float _650 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[10].x, _642);
    float _652 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[11].z, _644);
    float _654 = -_492;
    float _656 = _646 + _654;
    float _658 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[10].z, _650);
    float _660 = _652 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _662 = fma(_656, _596, _492);
    float _664 = _658 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _666 = 1.0 / _660;
    bool _668 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _670 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.5);
    bool _676 = _672 || _674;
    float _678 = _664 + _660;
    bool _680 = _648 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _682 = _564;
    float _684 = _678;
    float _686 = _492;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _690 = _662;
    float _692 = _628;
    float _694 = _584;
    if (_676)
    {
        _682 = 1.0;
    }
    float _696 = _682;
    float _698 = _678 * _666;
    float _700 = _698 * 0.5;
    float _702 = _696;
    if (!_680)
    {
        _684 = _620;
    }
    float _704 = _684;
    float _706 = _704;
    if (!_680)
    {
        _686 = _614;
    }
    float _708 = _686;
    float _710 = _708;
    if (!_680)
    {
        _688 = _662;
    }
    float _712 = _688;
    bool _714 = !_680;
    float _716 = _712;
    if (!_714)
    {
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _722 = _648 + _720;
        float _724 = rsqrt(_640);
        float _726 = _722 * _718;
        float _728 = _662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _730 = _726 * 0.15915493667125701904296875;
        float _732 = _730 * 6.283185482025146484375;
        float _734 = sin(_732);
        float _736 = _730 * 6.283185482025146484375;
        float _738 = cos(_736);
        float _740 = fma(_734, _728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _742 = _724 * _740;
        float _744 = _738 + (-1.0);
        float _746 = fma(_632, _742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _748 = fma(_624, _742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _750 = _744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = fma(_662, _738, _750);
        _716 = _752;
        _706 = _746;
        _710 = _748;
    }
    float _754 = _716;
    float _756 = _706;
    float _758 = _710;
    if (!_676)
    {
        float _760 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _762 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _764 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _762);
        float _766 = _760 * 0.15915493667125701904296875;
        float _768 = _766 * 6.283185482025146484375;
        float _770 = cos(_768);
        float _772 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _774 = _772 * 0.15915493667125701904296875;
        float _776 = _766 * 6.283185482025146484375;
        float _778 = sin(_776);
        float _780 = 1.0 / _770;
        float _782 = _774 * 6.283185482025146484375;
        float _784 = cos(_782);
        float _786 = _778 * _780;
        float _788 = 1.0 / _764;
        float _790 = _784 * _786;
        float _792 = _774 * 6.283185482025146484375;
        float _794 = sin(_792);
        float _796 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _798 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _796;
        float _800 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _802 = _788 * _800;
        float _804 = 1.0 / _790;
        float _806 = 1.0 / _798;
        float _808 = _794 * _804;
        float _810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _812 = fma(_808, _802, _810);
        float _814 = _812 * _806;
        float _816 = precise::clamp(_814, 0.0, 1.0);
        float _818 = -_816;
        float _820 = _818 + 1.0;
        _690 = _802;
        _692 = _774;
        _702 = _820;
    }
    float _822 = _690;
    float _824 = _692;
    float _826 = _702;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _754 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = _756 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = _758 + _836;
    float _840 = _830 * _830;
    float _842 = fma(_834, _834, _840);
    float _844 = fma(_838, _838, _842);
    float _846 = rsqrt(_844);
    float _848 = _846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _850 = _834 * _848;
    float _852 = _838 * _848;
    float _854 = _850 * _850;
    float _856 = _852 * _852;
    float _858 = _854 + _856;
    float _860 = sqrt(_858);
    bool _862 = _860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = _860 + _864;
    float _868 = _842;
    float _870 = _858;
    float _872 = _866;
    float _874 = _822;
    float _876 = _830;
    float _878 = _824;
    if (_862)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _868 = _880;
    }
    float _882 = _868;
    if (_862)
    {
        float _884 = rsqrt(_858);
        _870 = _884;
    }
    float _886 = _870;
    float _888 = _886;
    if (_862)
    {
        float _890 = _866 * _882;
        _872 = _890;
    }
    float _892 = _872;
    if (_862)
    {
        float _894 = _892 * 0.15915493667125701904296875;
        _874 = _894;
    }
    float _896 = _874;
    float _898 = _838;
    if (_862)
    {
        float _900 = _896 * 6.283185482025146484375;
        float _902 = sin(_900);
        _898 = _902;
    }
    float _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = precise::max(0.0, _906);
    float _910 = _882;
    float _912 = _908;
    if (_862)
    {
        float _914 = _896 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = -_848;
    float _922 = -_908;
    float _924 = fma(_830, _920, _922);
    if (_862)
    {
        float _926 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _926;
    }
    float _928 = _876;
    float _930 = sqrt(_844);
    float _932 = _928;
    float _934 = _904;
    if (_862)
    {
        float _936 = fma(_904, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _932 = _936;
    }
    float _938 = _932;
    float _940 = _938;
    if (!_862)
    {
        _934 = _850;
    }
    float _942 = _934;
    float _944 = _942;
    float _946 = _918;
    if (_862)
    {
        float _948 = _918 + (-1.0);
        _912 = _948;
    }
    float _950 = _912;
    float _952 = _950;
    if (_862)
    {
        float _954 = _886 * _938;
        _694 = _954;
    }
    float _956 = _694;
    if (!_862)
    {
        _940 = _924;
    }
    float _958 = _940;
    float _960 = _958;
    if (_862)
    {
        float _962 = _950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _878 = _962;
    }
    float _964 = _878;
    if (_862)
    {
        float _966 = _850 * _956;
        _944 = _966;
    }
    float _968 = _944;
    if (!_862)
    {
        _952 = _852;
    }
    float _970 = _952;
    float _972 = _970;
    if (_862)
    {
        float _974 = _852 * _956;
        _972 = _974;
    }
    float _976 = _972;
    if (!_862)
    {
        _888 = _854;
    }
    float _978 = _888;
    float _980 = _978;
    if (_862)
    {
        float _982 = fma(_924, _918, _964);
        _960 = _982;
    }
    float _984 = _960;
    if (_862)
    {
        float _986 = _968 * _968;
        _980 = _986;
    }
    float _988 = _980;
    if (!_862)
    {
        _946 = _856;
    }
    float _990 = _946;
    float _992 = _990;
    if (_862)
    {
        float _994 = _976 * _976;
        _992 = _994;
    }
    float _996 = _992;
    float _998 = fma(_984, _984, _988);
    float _1000 = _998 + _996;
    float _1002 = _754 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_930, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1012 = _754 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1014 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1016 = rsqrt(_1000);
    float _1018 = _754 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1020 = -_1008;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1014);
    float _1026 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1012);
    float _1028 = _754 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1030 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1018);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1034 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1026);
    float _1036 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1028);
    float _1038 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1030);
    float _1040 = abs(_1022);
    float _1042 = log2(_1040);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1046 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1048 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1050 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1054 = _1016 * _968;
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1058 = _1016 * _984;
    float _1060 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1052);
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1064 = _1016 * _976;
    float _1066 = -_1050;
    float _1068 = fma(_1066, _1010, 1.0);
    float _1070 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1060);
    float _1072 = -_1062;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1072);
    float _1076 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1078 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1070);
    float _1080 = -_1064;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1074);
    float _1084 = log2(_1068);
    float _1086 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1088 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1082, -0.5, 0.5);
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1086);
    float _1094 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1096 = exp2(_1076);
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1092);
    float _1100 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1094);
    float _1102 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1098);
    float _1104 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1100);
    float _1106 = 1.0 / _1078;
    float _1108 = fma(_1082, 0.5, 0.5);
    float _1110 = _1058 + 1.0;
    float _1112 = _1084 * 0.693147182464599609375;
    float _1114 = fma(_1108, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1116 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1118 = sqrt(_1090);
    float _1120 = fma(_1108, _1114, -0.212114393711090087890625);
    float _1122 = -_1058;
    float _1124 = fma(_1096, _1110, _1122);
    float _1126 = fma(_1108, _1120, 1.570728778839111328125);
    float _1128 = fma(_1124, 0.5, 0.5);
    float _1130 = _1102 * _1106;
    float _1132 = _1104 * _1106;
    float _1134 = fma(_1130, 0.5, 0.5);
    float _1136 = fma(_1132, -0.5, 0.5);
    float _1138 = _1118 * 0.636619746685028076171875;
    float3 _3325 = float3(_1134, _1136, _1116);
    float _1140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3325, float3(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3325, float3(0.0), isnan(_3325)), level(0.0)).x;
    float3 _3336 = float3(_1134, _1136, _1116);
    float4 _1143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3336, float3(0.0), isnan(_3336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3336, float3(0.0), isnan(_3336)), level(0.0)).xyzw;
    float _1145 = _1143.x;
    float _1147 = _1143.y;
    float _1149 = _1143.z;
    float _1151 = _1143.w;
    float _1153 = -_1126;
    float _1155 = fma(_1138, _1153, 1.0);
    float2 _3358 = float2(_1155, _1128);
    float3 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3358, float2(0.0), isnan(_3358)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3358, float2(0.0), isnan(_3358)), level(0.0)).xyz;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = in.m_49.w;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1173 = _1171 != 0;
    float _1175 = in.m_49.y;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1187 = _1185 != 0;
    out.m_55.x = _448;
    out.m_55.y = _450;
    out.m_55.z = _452;
    out.m_55.w = _454;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1191 = _1189 != 0;
    float _1193 = 1.0 / _1183;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1197 = _1195 != 0;
    float _1199 = in.m_57.w;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1203 = _1201 != 0;
    float _1205 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1207 = 0.0;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1173)
    {
        float _1211 = in.m_49.z;
        _1207 = _1211;
    }
    float _1213 = _1207;
    float _1215 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1217 = 1.0 / _1179;
    float _1219 = in.m_59.y;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1223 = _482 + _1221;
    bool _1225 = _1167 > 0.5;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1229 = _482 + _1227;
    float _1231 = _1223 * _1193;
    float _1233 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1235 = _1193;
    bool _1237 = _1225;
    float _1239 = _1223;
    if (!_1203)
    {
        float _1241 = in.m_49.z;
        _1235 = _1241;
    }
    float _1243 = _1235;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1249 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1251 = _1199;
    float _1253 = _1219;
    if (!_1203)
    {
        _1209 = _1175;
    }
    float _1255 = _1209;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1259 = -_1247;
    float _1261 = fma(_1233, 2.0, _1259);
    float _1263 = _1229 * _1217;
    float _1265 = fma(_1249, -2.0, _1245);
    out.m_61.w = _1199;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1271;
    float _1275 = _1255;
    if (_1173)
    {
        bool _1277 = _1213 > 0.5;
        _354 = _1277;
    }
    bool _1279 = _354;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1281;
    float _1285 = -_1219;
    float _1287 = _1285 + 1.0;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1291 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1293 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1295 = fma(_1283, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1297 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1289);
    int _1299 = _1225 ? as_type<int>(_1287) : as_type<int>(_1219);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    if (_1187)
    {
        bool _1305 = _142 > 0.5;
        _1237 = _1305;
    }
    bool _1307 = _1237;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1203)
    {
        _1275 = _142;
    }
    float _1313 = _1275;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1319 = _1191 ? as_type<float>(_1299) : _1219;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1323 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1325 = isnan(_482);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = in.m_59.x;
    float _1337 = fma(_1303, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1339 = fma(_1311, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1341 = fma(_1317, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1343 = _1243;
    if (!_1203)
    {
        _1251 = _1243;
    }
    float _1345 = _1251;
    float _1347 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1321);
    bool _1349 = _1175 > 0.5;
    float _1351 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1353 = _1345;
    int _1355 = as_type<int>(_1351);
    if (_1203)
    {
        _1353 = _1175;
    }
    float _1357 = _1353;
    float _1359 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1203)
    {
        _1343 = _1175;
    }
    float _1361 = _1343;
    float _1363 = fma(_1319, _1215, -0.5);
    bool _1365 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1367 = isnan(_482);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = -_1333;
    float _1379 = _1377 + 1.0;
    bool _1381 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1383 = isnan(_482);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1197)
    {
        float _1395 = _1349 ? _1287 : _1219;
        _1253 = _1395;
    }
    float _1397 = _1253;
    float _1399 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1265);
    float _1401 = _1391 * _1379;
    float _1403 = -_1391;
    float _1405 = _1403 + 1.0;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1409 = fma(_1359, _1397, -0.5);
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1413 = _1375 * _1405;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1417 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1407);
    float _1419 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1411);
    float _1421 = _1295 * _1413;
    float _1423 = -_1415;
    float _1425 = fma(_1351, 2.0, _1423);
    float _1427 = _1291 * _1413;
    float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1431 = _1293 * _1413;
    int _1433 = as_type<int>(_1413);
    float _1435 = _1335;
    if (_1187)
    {
        float _1437 = -_1335;
        float _1439 = _1437 + 1.0;
        _1433 = as_type<int>(_1439);
    }
    int _1441 = _1433;
    float _1443 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1347);
    if (!_1187)
    {
        _1239 = _1335;
    }
    float _1445 = _1239;
    float _1447 = _1445;
    if (_1173)
    {
        float _1449 = -_1335;
        float _1451 = _1449 + 1.0;
        _1355 = as_type<int>(_1451);
    }
    int _1453 = _1355;
    if (_1187)
    {
        float _1455 = _1307 ? as_type<float>(_1441) : _1335;
        _1447 = _1455;
    }
    float _1457 = _1447;
    float _1459 = exp2(_1205);
    float _1461 = -_1375;
    float _1463 = _1461 + 1.0;
    float _1465 = -_1399;
    float _1467 = fma(_1443, _1409, _1465);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1471 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1473 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1475 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1427);
    float _1477 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1431);
    if (_1173)
    {
        float _1479 = _1279 ? as_type<float>(_1453) : _1335;
        _1435 = _1479;
    }
    float _1481 = _1435;
    float _1483 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1421);
    float _1485 = fma(_1471, -2.0, _1469);
    float _1487 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1489 = fma(_1473, _1457, -0.5);
    float _1491 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1493 = -_122;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1261);
    float _1497 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1499 = fma(_1337, _1401, _1475);
    float _1501 = fma(_1341, _1401, _1483);
    float _1503 = fma(_1339, _1401, _1477);
    float _1505 = fma(_1487, _1481, -0.5);
    float _1507 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1417);
    float _1509 = -_122;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1425);
    float _1513 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1419);
    float _1515 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1485);
    float _1517 = fma(_1491, _1489, _1495);
    float _1519 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1497);
    float _1521 = -_1459;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1499);
    float _1527 = fma(_1507, _1505, _1511);
    float _1529 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1503);
    float _1531 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1501);
    float _1533 = -_1515;
    float _1535 = fma(_1513, _1363, _1533);
    float _1537 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1519);
    float _1539 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1541 = _1517 + 0.5;
    float _1543 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = _1527 + 0.5;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1549 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1551 = _1078 * 0.5;
    float _1553 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1537);
    bool _1555 = _826 > 0.0;
    bool _1557 = isnan(_826);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan(0.0);
    bool _1563 = _1559 || _1561;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1567 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1569 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1571 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1573 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1575 = fma(_1104, -0.5, _1551);
    float _1577 = _1553 + _1078;
    float _1579 = _1102 + _1078;
    float _1581 = -_1539;
    float _1583 = _1581 + 1.0;
    out.m_63.x = _1567;
    out.m_63.y = _1569;
    out.m_63.z = _1571;
    out.m_63.w = _1565;
    float _1585 = _1467 + 0.5;
    float _1587 = _1535 + 0.5;
    out.gl_Position.x = _1102;
    out.gl_Position.y = _1104;
    out.gl_Position.z = _1553;
    out.gl_Position.w = _1078;
    float _1589 = _1577 * 0.5;
    float _1591 = _1579 * 0.5;
    float _1593 = _1573 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1541;
    out.m_65.y = _1585;
    out.m_65.z = _1545;
    out.m_65.w = _1587;
    out.m_67.x = _1591;
    out.m_67.y = _1575;
    out.m_67.z = _1589;
    out.m_67.w = _1078;
    out.m_45.x = _1593;
    float _1595 = _1539 * _1140;
    float _1597 = _1151 * _1583;
    float _1599 = _1151 * _1595;
    float _1601 = _1165 * _1595;
    float _1603 = fma(_1161, _1599, _1145);
    float _1605 = fma(_1163, _1599, _1147);
    float _1607 = fma(_1151, _1601, _1149);
    out.m_69.x = _1603;
    out.m_69.y = _1605;
    out.m_69.z = _1607;
    out.m_69.w = _1597;
    if (_1563)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1609 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1609;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _474 = false;
    bool _372 = false;
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
        float _1666 = as_type<float>(_104);
        out.gl_Position.z = _1666;
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
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1734 = as_type<float>(_140);
        out.gl_Position.z = _1734;
    }
    if (_134)
    {
        return out;
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _146 * _144;
    float _164 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = _164 * 6.283185482025146484375;
    float _174 = floor(_164);
    float _176 = _172 * 0.15915493667125701904296875;
    float _178 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _180 = 1.4012984643248170709237295832899e-45;
    float _182 = _178;
    if (!_156)
    {
        float _184 = _178 * _178;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = _188;
    if (!_156)
    {
        float _196 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = -_174;
    float _202 = _164 + _200;
    bool _204 = !_156;
    float _206 = _198;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _178 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _178);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_156;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _178 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _182 = _260;
    }
    float _262 = _182;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _270 = _268 != 0;
    float _272 = in.m_51.w;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    bool _280 = !_266;
    int _282 = _280 ? 0 : 1;
    float _284 = -_202;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _288 = _202 < 0.5;
    float _290 = float(_288);
    float _292 = fma(_192, 0.5, 0.5);
    bool _294 = !_160;
    int _296 = _294 ? 0 : 1;
    float _298 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _300 = abs(_282);
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _306 = abs(_296);
    float _308 = fma(_262, _166, _298);
    float _310 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _314 = -_292;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_270;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_262, _168, _310);
    float _324 = float(_300);
    int _326 = abs(_320);
    float _328 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = float(_306);
    float _332 = abs(_286);
    float _334 = _324 * _332;
    float _336 = float(_326);
    float _338 = fma(_262, _170, _328);
    float _340 = fma(_308, _272, _274);
    float _342 = fma(_330, _316, _334);
    float _344 = fma(_322, _272, _276);
    float _346 = fma(_338, _272, _278);
    float _348 = abs(_304);
    float _350 = fma(_336, _348, _342);
    bool _352 = !_312;
    bool _354 = false;
    float _370;
    if (!_352)
    {
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _358 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_88);
        float _376 = 1.0 / _374;
        float _378 = _122 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    bool _382 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _384 = isnan(_380);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _398 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _400 = isnan(_380);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _380 + _414;
    float _418 = -_392;
    float _420 = _418 + 1.0;
    bool _422 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _424 = 1.0 / _396;
    float _426 = _408 * _420;
    float _428 = -_408;
    float _430 = _428 + 1.0;
    float _432 = _412 * _424;
    float _434 = fma(_432, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _436 = _434 * _426;
    float _438 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _436);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[116].x, _438);
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _456 = !_422;
    float _472;
    if (!_456)
    {
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_88);
        float _478 = 1.0 / _476;
        float _480 = _122 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_51.x;
    float _486 = in.m_51.y;
    float _488 = in.m_51.z;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _492 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _490;
    float _494 = in.m_53.x;
    float _496 = in.m_53.y;
    float _498 = in.m_53.z;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _502 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _500;
    float _504 = -_492;
    float _506 = _504 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _508 = -_502;
    float _510 = _508 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _512 = _506 * _506;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _516 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _514;
    float _518 = fma(_510, _510, _512);
    float _520 = -_516;
    float _522 = _520 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = fma(_522, _522, _518);
    float _526 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _530 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = sqrt(_524);
    float _534 = _350 * _526;
    float _536 = _350 * _528;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _496);
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _494);
    float _542 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _546 = _350 * _530;
    float _548 = _542 * _538;
    float _550 = _544 * _540;
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    float _554 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _556 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = _548 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _562 = fma(_532, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _564 = _554 * _552;
    float _566 = _548 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _568 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _570 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _572 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
    float _574 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _566);
    float _576 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
    float _578 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].z, _570);
    float _580 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].z, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].z, _574);
    float _584 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _586 = _578 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _588 = precise::max(_562, 0.3499999940395355224609375);
    float _590 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _592 = _582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _594 = _584 + _586;
    float _596 = precise::min(_588, 1.0);
    float _598 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _600 = _590 + _592;
    float _602 = -_516;
    float _604 = _594 + _602;
    float _606 = _548 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _608 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    float _610 = -_502;
    float _612 = _600 + _610;
    float _614 = fma(_604, _596, _516);
    float _616 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _606);
    float _618 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _620 = fma(_612, _596, _502);
    float _622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _624 = _614 + _622;
    float _626 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].z, _616);
    float _628 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = _626 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _638 = _628 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _640 = fma(_632, _632, _634);
    float _642 = _628 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _644 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[11].x, _638);
    float _646 = _628 + _636;
    float _648 = sqrt(_640);
    float _650 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[10].x, _642);
    float _652 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[11].z, _644);
    float _654 = -_492;
    float _656 = _646 + _654;
    float _658 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[10].z, _650);
    float _660 = _652 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _662 = fma(_656, _596, _492);
    float _664 = _658 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _666 = 1.0 / _660;
    bool _668 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _670 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.5);
    bool _676 = _672 || _674;
    float _678 = _664 + _660;
    bool _680 = _648 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _682 = _564;
    float _684 = _678;
    float _686 = _492;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _690 = _662;
    float _692 = _628;
    float _694 = _584;
    if (_676)
    {
        _682 = 1.0;
    }
    float _696 = _682;
    float _698 = _678 * _666;
    float _700 = _698 * 0.5;
    float _702 = _696;
    if (!_680)
    {
        _684 = _620;
    }
    float _704 = _684;
    float _706 = _704;
    if (!_680)
    {
        _686 = _614;
    }
    float _708 = _686;
    float _710 = _708;
    if (!_680)
    {
        _688 = _662;
    }
    float _712 = _688;
    bool _714 = !_680;
    float _716 = _712;
    if (!_714)
    {
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _722 = _648 + _720;
        float _724 = rsqrt(_640);
        float _726 = _722 * _718;
        float _728 = _662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _730 = _726 * 0.15915493667125701904296875;
        float _732 = _730 * 6.283185482025146484375;
        float _734 = sin(_732);
        float _736 = _730 * 6.283185482025146484375;
        float _738 = cos(_736);
        float _740 = fma(_734, _728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _742 = _724 * _740;
        float _744 = _738 + (-1.0);
        float _746 = fma(_632, _742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _748 = fma(_624, _742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _750 = _744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = fma(_662, _738, _750);
        _716 = _752;
        _706 = _746;
        _710 = _748;
    }
    float _754 = _716;
    float _756 = _706;
    float _758 = _710;
    if (!_676)
    {
        float _760 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _762 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _764 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _762);
        float _766 = _760 * 0.15915493667125701904296875;
        float _768 = _766 * 6.283185482025146484375;
        float _770 = cos(_768);
        float _772 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _774 = _772 * 0.15915493667125701904296875;
        float _776 = _766 * 6.283185482025146484375;
        float _778 = sin(_776);
        float _780 = 1.0 / _770;
        float _782 = _774 * 6.283185482025146484375;
        float _784 = cos(_782);
        float _786 = _778 * _780;
        float _788 = 1.0 / _764;
        float _790 = _784 * _786;
        float _792 = _774 * 6.283185482025146484375;
        float _794 = sin(_792);
        float _796 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _798 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _796;
        float _800 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _802 = _788 * _800;
        float _804 = 1.0 / _790;
        float _806 = 1.0 / _798;
        float _808 = _794 * _804;
        float _810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _812 = fma(_808, _802, _810);
        float _814 = _812 * _806;
        float _816 = precise::clamp(_814, 0.0, 1.0);
        float _818 = -_816;
        float _820 = _818 + 1.0;
        _690 = _802;
        _692 = _774;
        _702 = _820;
    }
    float _822 = _690;
    float _824 = _692;
    float _826 = _702;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _754 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = _756 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = _758 + _836;
    float _840 = _830 * _830;
    float _842 = fma(_834, _834, _840);
    float _844 = fma(_838, _838, _842);
    float _846 = rsqrt(_844);
    float _848 = _846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _850 = _834 * _848;
    float _852 = _838 * _848;
    float _854 = _850 * _850;
    float _856 = _852 * _852;
    float _858 = _854 + _856;
    float _860 = sqrt(_858);
    bool _862 = _860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = _860 + _864;
    float _868 = _842;
    float _870 = _858;
    float _872 = _866;
    float _874 = _822;
    float _876 = _830;
    float _878 = _824;
    if (_862)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _868 = _880;
    }
    float _882 = _868;
    if (_862)
    {
        float _884 = rsqrt(_858);
        _870 = _884;
    }
    float _886 = _870;
    float _888 = _886;
    if (_862)
    {
        float _890 = _866 * _882;
        _872 = _890;
    }
    float _892 = _872;
    if (_862)
    {
        float _894 = _892 * 0.15915493667125701904296875;
        _874 = _894;
    }
    float _896 = _874;
    float _898 = _838;
    if (_862)
    {
        float _900 = _896 * 6.283185482025146484375;
        float _902 = sin(_900);
        _898 = _902;
    }
    float _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = precise::max(0.0, _906);
    float _910 = _882;
    float _912 = _908;
    if (_862)
    {
        float _914 = _896 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = -_848;
    float _922 = -_908;
    float _924 = fma(_830, _920, _922);
    if (_862)
    {
        float _926 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _926;
    }
    float _928 = _876;
    float _930 = sqrt(_844);
    float _932 = _928;
    float _934 = _904;
    if (_862)
    {
        float _936 = fma(_904, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _932 = _936;
    }
    float _938 = _932;
    float _940 = _938;
    if (!_862)
    {
        _934 = _850;
    }
    float _942 = _934;
    float _944 = _942;
    float _946 = _918;
    if (_862)
    {
        float _948 = _918 + (-1.0);
        _912 = _948;
    }
    float _950 = _912;
    float _952 = _950;
    if (_862)
    {
        float _954 = _886 * _938;
        _694 = _954;
    }
    float _956 = _694;
    if (!_862)
    {
        _940 = _924;
    }
    float _958 = _940;
    float _960 = _958;
    if (_862)
    {
        float _962 = _950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _878 = _962;
    }
    float _964 = _878;
    if (_862)
    {
        float _966 = _850 * _956;
        _944 = _966;
    }
    float _968 = _944;
    if (!_862)
    {
        _952 = _852;
    }
    float _970 = _952;
    float _972 = _970;
    if (_862)
    {
        float _974 = _852 * _956;
        _972 = _974;
    }
    float _976 = _972;
    if (!_862)
    {
        _888 = _854;
    }
    float _978 = _888;
    float _980 = _978;
    if (_862)
    {
        float _982 = fma(_924, _918, _964);
        _960 = _982;
    }
    float _984 = _960;
    if (_862)
    {
        float _986 = _968 * _968;
        _980 = _986;
    }
    float _988 = _980;
    if (!_862)
    {
        _946 = _856;
    }
    float _990 = _946;
    float _992 = _990;
    if (_862)
    {
        float _994 = _976 * _976;
        _992 = _994;
    }
    float _996 = _992;
    float _998 = fma(_984, _984, _988);
    float _1000 = _998 + _996;
    float _1002 = _754 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_930, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1012 = _754 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1014 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1016 = rsqrt(_1000);
    float _1018 = _754 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1020 = -_1008;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1014);
    float _1026 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1012);
    float _1028 = _754 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1030 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1018);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1034 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1026);
    float _1036 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1028);
    float _1038 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1030);
    float _1040 = abs(_1022);
    float _1042 = log2(_1040);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1046 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1048 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1050 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1054 = _1016 * _968;
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1058 = _1016 * _984;
    float _1060 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1052);
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1064 = _1016 * _976;
    float _1066 = -_1050;
    float _1068 = fma(_1066, _1010, 1.0);
    float _1070 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1060);
    float _1072 = -_1062;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1072);
    float _1076 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1078 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1070);
    float _1080 = -_1064;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1074);
    float _1084 = log2(_1068);
    float _1086 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1088 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1082, -0.5, 0.5);
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1086);
    float _1094 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1096 = exp2(_1076);
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1092);
    float _1100 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1094);
    float _1102 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1098);
    float _1104 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1100);
    float _1106 = 1.0 / _1078;
    float _1108 = fma(_1082, 0.5, 0.5);
    float _1110 = _1058 + 1.0;
    float _1112 = _1084 * 0.693147182464599609375;
    float _1114 = fma(_1108, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1116 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1118 = sqrt(_1090);
    float _1120 = fma(_1108, _1114, -0.212114393711090087890625);
    float _1122 = -_1058;
    float _1124 = fma(_1096, _1110, _1122);
    float _1126 = fma(_1108, _1120, 1.570728778839111328125);
    float _1128 = fma(_1124, 0.5, 0.5);
    float _1130 = _1102 * _1106;
    float _1132 = _1104 * _1106;
    float _1134 = fma(_1130, 0.5, 0.5);
    float _1136 = fma(_1132, -0.5, 0.5);
    float _1138 = _1118 * 0.636619746685028076171875;
    float3 _3325 = float3(_1134, _1136, _1116);
    float _1140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3325, float3(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3325, float3(0.0), isnan(_3325)), level(0.0)).x;
    float3 _3336 = float3(_1134, _1136, _1116);
    float4 _1143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3336, float3(0.0), isnan(_3336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3336, float3(0.0), isnan(_3336)), level(0.0)).xyzw;
    float _1145 = _1143.x;
    float _1147 = _1143.y;
    float _1149 = _1143.z;
    float _1151 = _1143.w;
    float _1153 = -_1126;
    float _1155 = fma(_1138, _1153, 1.0);
    float2 _3358 = float2(_1155, _1128);
    float3 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3358, float2(0.0), isnan(_3358)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3358, float2(0.0), isnan(_3358)), level(0.0)).xyz;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = in.m_49.w;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1173 = _1171 != 0;
    float _1175 = in.m_49.y;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1187 = _1185 != 0;
    out.m_55.x = _448;
    out.m_55.y = _450;
    out.m_55.z = _452;
    out.m_55.w = _454;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1191 = _1189 != 0;
    float _1193 = 1.0 / _1183;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1197 = _1195 != 0;
    float _1199 = in.m_57.w;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1203 = _1201 != 0;
    float _1205 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1207 = 0.0;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1173)
    {
        float _1211 = in.m_49.z;
        _1207 = _1211;
    }
    float _1213 = _1207;
    float _1215 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1217 = 1.0 / _1179;
    float _1219 = in.m_59.y;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1223 = _482 + _1221;
    bool _1225 = _1167 > 0.5;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1229 = _482 + _1227;
    float _1231 = _1223 * _1193;
    float _1233 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1235 = _1193;
    bool _1237 = _1225;
    float _1239 = _1223;
    if (!_1203)
    {
        float _1241 = in.m_49.z;
        _1235 = _1241;
    }
    float _1243 = _1235;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1249 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1251 = _1199;
    float _1253 = _1219;
    if (!_1203)
    {
        _1209 = _1175;
    }
    float _1255 = _1209;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1259 = -_1247;
    float _1261 = fma(_1233, 2.0, _1259);
    float _1263 = _1229 * _1217;
    float _1265 = fma(_1249, -2.0, _1245);
    out.m_61.w = _1199;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1271;
    float _1275 = _1255;
    if (_1173)
    {
        bool _1277 = _1213 > 0.5;
        _354 = _1277;
    }
    bool _1279 = _354;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1281;
    float _1285 = -_1219;
    float _1287 = _1285 + 1.0;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1291 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1293 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1295 = fma(_1283, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1297 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1289);
    int _1299 = _1225 ? as_type<int>(_1287) : as_type<int>(_1219);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    if (_1187)
    {
        bool _1305 = _142 > 0.5;
        _1237 = _1305;
    }
    bool _1307 = _1237;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1203)
    {
        _1275 = _142;
    }
    float _1313 = _1275;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1319 = _1191 ? as_type<float>(_1299) : _1219;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1323 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1325 = isnan(_482);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = in.m_59.x;
    float _1337 = fma(_1303, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1339 = fma(_1311, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1341 = fma(_1317, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1343 = _1243;
    if (!_1203)
    {
        _1251 = _1243;
    }
    float _1345 = _1251;
    float _1347 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1321);
    bool _1349 = _1175 > 0.5;
    float _1351 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1353 = _1345;
    int _1355 = as_type<int>(_1351);
    if (_1203)
    {
        _1353 = _1175;
    }
    float _1357 = _1353;
    float _1359 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1203)
    {
        _1343 = _1175;
    }
    float _1361 = _1343;
    float _1363 = fma(_1319, _1215, -0.5);
    bool _1365 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1367 = isnan(_482);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = -_1333;
    float _1379 = _1377 + 1.0;
    bool _1381 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1383 = isnan(_482);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1197)
    {
        float _1395 = _1349 ? _1287 : _1219;
        _1253 = _1395;
    }
    float _1397 = _1253;
    float _1399 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1265);
    float _1401 = _1391 * _1379;
    float _1403 = -_1391;
    float _1405 = _1403 + 1.0;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1409 = fma(_1359, _1397, -0.5);
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1413 = _1375 * _1405;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1417 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1407);
    float _1419 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1411);
    float _1421 = _1295 * _1413;
    float _1423 = -_1415;
    float _1425 = fma(_1351, 2.0, _1423);
    float _1427 = _1291 * _1413;
    float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1431 = _1293 * _1413;
    int _1433 = as_type<int>(_1413);
    float _1435 = _1335;
    if (_1187)
    {
        float _1437 = -_1335;
        float _1439 = _1437 + 1.0;
        _1433 = as_type<int>(_1439);
    }
    int _1441 = _1433;
    float _1443 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1347);
    if (!_1187)
    {
        _1239 = _1335;
    }
    float _1445 = _1239;
    float _1447 = _1445;
    if (_1173)
    {
        float _1449 = -_1335;
        float _1451 = _1449 + 1.0;
        _1355 = as_type<int>(_1451);
    }
    int _1453 = _1355;
    if (_1187)
    {
        float _1455 = _1307 ? as_type<float>(_1441) : _1335;
        _1447 = _1455;
    }
    float _1457 = _1447;
    float _1459 = exp2(_1205);
    float _1461 = -_1375;
    float _1463 = _1461 + 1.0;
    float _1465 = -_1399;
    float _1467 = fma(_1443, _1409, _1465);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1471 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1473 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1475 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1427);
    float _1477 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1431);
    if (_1173)
    {
        float _1479 = _1279 ? as_type<float>(_1453) : _1335;
        _1435 = _1479;
    }
    float _1481 = _1435;
    float _1483 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1421);
    float _1485 = fma(_1471, -2.0, _1469);
    float _1487 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1489 = fma(_1473, _1457, -0.5);
    float _1491 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1493 = -_122;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1261);
    float _1497 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1499 = fma(_1337, _1401, _1475);
    float _1501 = fma(_1341, _1401, _1483);
    float _1503 = fma(_1339, _1401, _1477);
    float _1505 = fma(_1487, _1481, -0.5);
    float _1507 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1417);
    float _1509 = -_122;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1425);
    float _1513 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1419);
    float _1515 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1485);
    float _1517 = fma(_1491, _1489, _1495);
    float _1519 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1497);
    float _1521 = -_1459;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1499);
    float _1527 = fma(_1507, _1505, _1511);
    float _1529 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1503);
    float _1531 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1501);
    float _1533 = -_1515;
    float _1535 = fma(_1513, _1363, _1533);
    float _1537 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1519);
    float _1539 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1541 = _1517 + 0.5;
    float _1543 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = _1527 + 0.5;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1549 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1551 = _1078 * 0.5;
    float _1553 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1537);
    bool _1555 = _826 > 0.0;
    bool _1557 = isnan(_826);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan(0.0);
    bool _1563 = _1559 || _1561;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1567 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1569 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1571 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1573 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1575 = fma(_1104, -0.5, _1551);
    float _1577 = _1553 + _1078;
    float _1579 = _1102 + _1078;
    float _1581 = -_1539;
    float _1583 = _1581 + 1.0;
    out.m_63.x = _1567;
    out.m_63.y = _1569;
    out.m_63.z = _1571;
    out.m_63.w = _1565;
    float _1585 = _1467 + 0.5;
    float _1587 = _1535 + 0.5;
    out.gl_Position.x = _1102;
    out.gl_Position.y = _1104;
    out.gl_Position.z = _1553;
    out.gl_Position.w = _1078;
    float _1589 = _1577 * 0.5;
    float _1591 = _1579 * 0.5;
    float _1593 = _1573 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1541;
    out.m_65.y = _1585;
    out.m_65.z = _1545;
    out.m_65.w = _1587;
    out.m_67.x = _1591;
    out.m_67.y = _1575;
    out.m_67.z = _1589;
    out.m_67.w = _1078;
    out.m_45.x = _1593;
    float _1595 = _1539 * _1140;
    float _1597 = _1151 * _1583;
    float _1599 = _1151 * _1595;
    float _1601 = _1165 * _1595;
    float _1603 = fma(_1161, _1599, _1145);
    float _1605 = fma(_1163, _1599, _1147);
    float _1607 = fma(_1151, _1601, _1149);
    out.m_69.x = _1603;
    out.m_69.y = _1605;
    out.m_69.z = _1607;
    out.m_69.w = _1597;
    if (_1563)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1609 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1609;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _474 = false;
    bool _372 = false;
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
        float _1666 = as_type<float>(_104);
        out.gl_Position.z = _1666;
    }
    if (!_92)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _108 = in.m_47.w;
    bool _110 = _108 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _118 = _114 || _116;
    float _120 = -_108;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _124 = 0.0;
    if (_118)
    {
        float _126 = float(_88);
        _124 = _126;
    }
    float _128 = _124;
    bool _130 = _122 >= _128;
    bool _132 = !_118;
    bool _134 = _130 || _132;
    if (_134)
    {
        _98 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _98;
    if (_134)
    {
        out.m_45.x = 0.0;
    }
    if (_134)
    {
        float _138 = _136 * 5.0;
        _106 = as_type<int>(_138);
    }
    int _140 = _106;
    if (_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1734 = as_type<float>(_140);
        out.gl_Position.z = _1734;
    }
    if (_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_49.x;
    float _144 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _146 = _122 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    bool _148 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _150 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _152 = _148 || _150;
    bool _154 = isnan(1.0);
    bool _156 = _152 || _154;
    int _158 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _160 = _158 != 0;
    float _162 = _146 * _144;
    float _164 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[20].x, _162);
    float _166 = in.m_47.x;
    float _168 = in.m_47.y;
    float _170 = in.m_47.z;
    float _172 = _164 * 6.283185482025146484375;
    float _174 = floor(_164);
    float _176 = _172 * 0.15915493667125701904296875;
    float _178 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _180 = 1.4012984643248170709237295832899e-45;
    float _182 = _178;
    if (!_156)
    {
        float _184 = _178 * _178;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _176 * 6.283185482025146484375;
    float _192 = cos(_190);
    float _194 = _188;
    if (!_156)
    {
        float _196 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _194 = _196;
    }
    float _198 = _194;
    float _200 = -_174;
    float _202 = _164 + _200;
    bool _204 = !_156;
    float _206 = _198;
    if (!_204)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _178 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _178);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _206 = _236;
    }
    float _238 = _206;
    bool _240 = !_156;
    if (!_240)
    {
        float _242 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _244 = log2(_242);
        float _246 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _248 = _246 + 1.0;
        float _250 = 1.0 / _248;
        float _252 = _178 * _244;
        float _254 = exp2(_252);
        float _256 = -_254;
        float _258 = _256 + 1.0;
        float _260 = _258 * _250;
        _182 = _260;
    }
    float _262 = _182;
    int _264 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _266 = _264 != 0;
    int _268 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _270 = _268 != 0;
    float _272 = in.m_51.w;
    float _274 = in.m_42.x;
    float _276 = in.m_42.y;
    float _278 = in.m_42.z;
    bool _280 = !_266;
    int _282 = _280 ? 0 : 1;
    float _284 = -_202;
    float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _288 = _202 < 0.5;
    float _290 = float(_288);
    float _292 = fma(_192, 0.5, 0.5);
    bool _294 = !_160;
    int _296 = _294 ? 0 : 1;
    float _298 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    int _300 = abs(_282);
    float _302 = -_290;
    float _304 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _306 = abs(_296);
    float _308 = fma(_262, _166, _298);
    float _310 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _312 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _314 = -_292;
    float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _318 = !_270;
    int _320 = _318 ? 0 : 1;
    float _322 = fma(_262, _168, _310);
    float _324 = float(_300);
    int _326 = abs(_320);
    float _328 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _330 = float(_306);
    float _332 = abs(_286);
    float _334 = _324 * _332;
    float _336 = float(_326);
    float _338 = fma(_262, _170, _328);
    float _340 = fma(_308, _272, _274);
    float _342 = fma(_330, _316, _334);
    float _344 = fma(_322, _272, _276);
    float _346 = fma(_338, _272, _278);
    float _348 = abs(_304);
    float _350 = fma(_336, _348, _342);
    bool _352 = !_312;
    bool _354 = false;
    float _370;
    if (!_352)
    {
        float _356 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _358 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _360 = fma(_358, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _362 = _360 * _356;
        float _364 = floor(_362);
        float _366 = -_364;
        float _368 = _362 + _366;
        _370 = _368;
        _372 = true;
    }
    else
    {
        float _374 = float(_88);
        float _376 = 1.0 / _374;
        float _378 = _122 * _376;
        _370 = _378;
    }
    _372 = false;
    float _380 = _370;
    bool _382 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _384 = isnan(_380);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _398 = _380 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _400 = isnan(_380);
    bool _402 = _398 || _400;
    bool _404 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _406 = _402 || _404;
    float _408 = float(_406);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _416 = _380 + _414;
    float _418 = -_392;
    float _420 = _418 + 1.0;
    bool _422 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _424 = 1.0 / _396;
    float _426 = _408 * _420;
    float _428 = -_408;
    float _430 = _428 + 1.0;
    float _432 = _412 * _424;
    float _434 = fma(_432, _416, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _436 = _434 * _426;
    float _438 = fma(_430, (*spvDescriptorSet0.vp_c9)._m0[115].x, _436);
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _446 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[116].x, _438);
    float _448 = _440 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _450 = _442 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _452 = _444 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _454 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _456 = !_422;
    float _472;
    if (!_456)
    {
        float _458 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _460 = _142 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _462 = fma(_460, (*spvDescriptorSet0.vp_c9)._m0[11].z, _122);
        float _464 = _462 * _458;
        float _466 = floor(_464);
        float _468 = -_466;
        float _470 = _464 + _468;
        _472 = _470;
        _474 = true;
    }
    else
    {
        float _476 = float(_88);
        float _478 = 1.0 / _476;
        float _480 = _122 * _478;
        _472 = _480;
    }
    _474 = false;
    float _482 = _472;
    float _484 = in.m_51.x;
    float _486 = in.m_51.y;
    float _488 = in.m_51.z;
    float _490 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _492 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _490;
    float _494 = in.m_53.x;
    float _496 = in.m_53.y;
    float _498 = in.m_53.z;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _502 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _500;
    float _504 = -_492;
    float _506 = _504 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _508 = -_502;
    float _510 = _508 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _512 = _506 * _506;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _516 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _514;
    float _518 = fma(_510, _510, _512);
    float _520 = -_516;
    float _522 = _520 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _524 = fma(_522, _522, _518);
    float _526 = _486 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _528 = _484 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _530 = _488 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _532 = sqrt(_524);
    float _534 = _350 * _526;
    float _536 = _350 * _528;
    float _538 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _496);
    float _540 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _494);
    float _542 = _534 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _544 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _546 = _350 * _530;
    float _548 = _542 * _538;
    float _550 = _544 * _540;
    float _552 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _498);
    float _554 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _556 = _344 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _558 = _548 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _560 = _344 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _562 = fma(_532, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _564 = _554 * _552;
    float _566 = _548 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _568 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[6].x, _556);
    float _570 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[26].x, _558);
    float _572 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[4].x, _560);
    float _574 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[24].x, _566);
    float _576 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[6].z, _568);
    float _578 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[26].z, _570);
    float _580 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[4].z, _572);
    float _582 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[24].z, _574);
    float _584 = _576 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _586 = _578 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _588 = precise::max(_562, 0.3499999940395355224609375);
    float _590 = _580 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _592 = _582 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _594 = _584 + _586;
    float _596 = precise::min(_588, 1.0);
    float _598 = _344 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _600 = _590 + _592;
    float _602 = -_516;
    float _604 = _594 + _602;
    float _606 = _548 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _608 = fma(_340, (*spvDescriptorSet0.vp_c10)._m0[5].x, _598);
    float _610 = -_502;
    float _612 = _600 + _610;
    float _614 = fma(_604, _596, _516);
    float _616 = fma(_550, (*spvDescriptorSet0.vp_c8)._m0[25].x, _606);
    float _618 = fma(_346, (*spvDescriptorSet0.vp_c10)._m0[5].z, _608);
    float _620 = fma(_612, _596, _502);
    float _622 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _624 = _614 + _622;
    float _626 = fma(_564, (*spvDescriptorSet0.vp_c8)._m0[25].z, _616);
    float _628 = _618 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _630 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _632 = _620 + _630;
    float _634 = _624 * _624;
    float _636 = _626 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _638 = _628 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _640 = fma(_632, _632, _634);
    float _642 = _628 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _644 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[11].x, _638);
    float _646 = _628 + _636;
    float _648 = sqrt(_640);
    float _650 = fma(_590, (*spvDescriptorSet0.vp_c8)._m0[10].x, _642);
    float _652 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[11].z, _644);
    float _654 = -_492;
    float _656 = _646 + _654;
    float _658 = fma(_584, (*spvDescriptorSet0.vp_c8)._m0[10].z, _650);
    float _660 = _652 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _662 = fma(_656, _596, _492);
    float _664 = _658 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _666 = 1.0 / _660;
    bool _668 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _670 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.5);
    bool _676 = _672 || _674;
    float _678 = _664 + _660;
    bool _680 = _648 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _682 = _564;
    float _684 = _678;
    float _686 = _492;
    float _688 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _690 = _662;
    float _692 = _628;
    float _694 = _584;
    if (_676)
    {
        _682 = 1.0;
    }
    float _696 = _682;
    float _698 = _678 * _666;
    float _700 = _698 * 0.5;
    float _702 = _696;
    if (!_680)
    {
        _684 = _620;
    }
    float _704 = _684;
    float _706 = _704;
    if (!_680)
    {
        _686 = _614;
    }
    float _708 = _686;
    float _710 = _708;
    if (!_680)
    {
        _688 = _662;
    }
    float _712 = _688;
    bool _714 = !_680;
    float _716 = _712;
    if (!_714)
    {
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _720 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _722 = _648 + _720;
        float _724 = rsqrt(_640);
        float _726 = _722 * _718;
        float _728 = _662 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _730 = _726 * 0.15915493667125701904296875;
        float _732 = _730 * 6.283185482025146484375;
        float _734 = sin(_732);
        float _736 = _730 * 6.283185482025146484375;
        float _738 = cos(_736);
        float _740 = fma(_734, _728, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _742 = _724 * _740;
        float _744 = _738 + (-1.0);
        float _746 = fma(_632, _742, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _748 = fma(_624, _742, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _750 = _744 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _752 = fma(_662, _738, _750);
        _716 = _752;
        _706 = _746;
        _710 = _748;
    }
    float _754 = _716;
    float _756 = _706;
    float _758 = _710;
    if (!_676)
    {
        float _760 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _762 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _764 = fma(_700, (*spvDescriptorSet0.vp_c8)._m0[30].w, _762);
        float _766 = _760 * 0.15915493667125701904296875;
        float _768 = _766 * 6.283185482025146484375;
        float _770 = cos(_768);
        float _772 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _774 = _772 * 0.15915493667125701904296875;
        float _776 = _766 * 6.283185482025146484375;
        float _778 = sin(_776);
        float _780 = 1.0 / _770;
        float _782 = _774 * 6.283185482025146484375;
        float _784 = cos(_782);
        float _786 = _778 * _780;
        float _788 = 1.0 / _764;
        float _790 = _784 * _786;
        float _792 = _774 * 6.283185482025146484375;
        float _794 = sin(_792);
        float _796 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _798 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _796;
        float _800 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _802 = _788 * _800;
        float _804 = 1.0 / _790;
        float _806 = 1.0 / _798;
        float _808 = _794 * _804;
        float _810 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _812 = fma(_808, _802, _810);
        float _814 = _812 * _806;
        float _816 = precise::clamp(_814, 0.0, 1.0);
        float _818 = -_816;
        float _820 = _818 + 1.0;
        _690 = _802;
        _692 = _774;
        _702 = _820;
    }
    float _822 = _690;
    float _824 = _692;
    float _826 = _702;
    float _828 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _830 = _754 + _828;
    float _832 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _834 = _756 + _832;
    float _836 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _838 = _758 + _836;
    float _840 = _830 * _830;
    float _842 = fma(_834, _834, _840);
    float _844 = fma(_838, _838, _842);
    float _846 = rsqrt(_844);
    float _848 = _846 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _850 = _834 * _848;
    float _852 = _838 * _848;
    float _854 = _850 * _850;
    float _856 = _852 * _852;
    float _858 = _854 + _856;
    float _860 = sqrt(_858);
    bool _862 = _860 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _864 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _866 = _860 + _864;
    float _868 = _842;
    float _870 = _858;
    float _872 = _866;
    float _874 = _822;
    float _876 = _830;
    float _878 = _824;
    if (_862)
    {
        float _880 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _868 = _880;
    }
    float _882 = _868;
    if (_862)
    {
        float _884 = rsqrt(_858);
        _870 = _884;
    }
    float _886 = _870;
    float _888 = _886;
    if (_862)
    {
        float _890 = _866 * _882;
        _872 = _890;
    }
    float _892 = _872;
    if (_862)
    {
        float _894 = _892 * 0.15915493667125701904296875;
        _874 = _894;
    }
    float _896 = _874;
    float _898 = _838;
    if (_862)
    {
        float _900 = _896 * 6.283185482025146484375;
        float _902 = sin(_900);
        _898 = _902;
    }
    float _904 = _898;
    float _906 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _908 = precise::max(0.0, _906);
    float _910 = _882;
    float _912 = _908;
    if (_862)
    {
        float _914 = _896 * 6.283185482025146484375;
        float _916 = cos(_914);
        _910 = _916;
    }
    float _918 = _910;
    float _920 = -_848;
    float _922 = -_908;
    float _924 = fma(_830, _920, _922);
    if (_862)
    {
        float _926 = _924 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _876 = _926;
    }
    float _928 = _876;
    float _930 = sqrt(_844);
    float _932 = _928;
    float _934 = _904;
    if (_862)
    {
        float _936 = fma(_904, _928, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _932 = _936;
    }
    float _938 = _932;
    float _940 = _938;
    if (!_862)
    {
        _934 = _850;
    }
    float _942 = _934;
    float _944 = _942;
    float _946 = _918;
    if (_862)
    {
        float _948 = _918 + (-1.0);
        _912 = _948;
    }
    float _950 = _912;
    float _952 = _950;
    if (_862)
    {
        float _954 = _886 * _938;
        _694 = _954;
    }
    float _956 = _694;
    if (!_862)
    {
        _940 = _924;
    }
    float _958 = _940;
    float _960 = _958;
    if (_862)
    {
        float _962 = _950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _878 = _962;
    }
    float _964 = _878;
    if (_862)
    {
        float _966 = _850 * _956;
        _944 = _966;
    }
    float _968 = _944;
    if (!_862)
    {
        _952 = _852;
    }
    float _970 = _952;
    float _972 = _970;
    if (_862)
    {
        float _974 = _852 * _956;
        _972 = _974;
    }
    float _976 = _972;
    if (!_862)
    {
        _888 = _854;
    }
    float _978 = _888;
    float _980 = _978;
    if (_862)
    {
        float _982 = fma(_924, _918, _964);
        _960 = _982;
    }
    float _984 = _960;
    if (_862)
    {
        float _986 = _968 * _968;
        _980 = _986;
    }
    float _988 = _980;
    if (!_862)
    {
        _946 = _856;
    }
    float _990 = _946;
    float _992 = _990;
    if (_862)
    {
        float _994 = _976 * _976;
        _992 = _994;
    }
    float _996 = _992;
    float _998 = fma(_984, _984, _988);
    float _1000 = _998 + _996;
    float _1002 = _754 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1004 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1006 = fma(_930, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1004);
    float _1008 = precise::clamp(_1006, 0.0, 1.0);
    float _1010 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1012 = _754 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1014 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1002);
    float _1016 = rsqrt(_1000);
    float _1018 = _754 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1020 = -_1008;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1014);
    float _1026 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1012);
    float _1028 = _754 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1030 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1018);
    float _1032 = _1024 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1034 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1026);
    float _1036 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1028);
    float _1038 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1030);
    float _1040 = abs(_1022);
    float _1042 = log2(_1040);
    float _1044 = _1034 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1046 = fma(_758, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1036);
    float _1048 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1050 = _1032 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1052 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1054 = _1016 * _968;
    float _1056 = _1046 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1058 = _1016 * _984;
    float _1060 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1052);
    float _1062 = _1054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1064 = _1016 * _976;
    float _1066 = -_1050;
    float _1068 = fma(_1066, _1010, 1.0);
    float _1070 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1060);
    float _1072 = -_1062;
    float _1074 = fma(_1058, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1072);
    float _1076 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1078 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1070);
    float _1080 = -_1064;
    float _1082 = fma(_1080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1074);
    float _1084 = log2(_1068);
    float _1086 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1088 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1090 = fma(_1082, -0.5, 0.5);
    float _1092 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1086);
    float _1094 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1088);
    float _1096 = exp2(_1076);
    float _1098 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1092);
    float _1100 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1094);
    float _1102 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1098);
    float _1104 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1100);
    float _1106 = 1.0 / _1078;
    float _1108 = fma(_1082, 0.5, 0.5);
    float _1110 = _1058 + 1.0;
    float _1112 = _1084 * 0.693147182464599609375;
    float _1114 = fma(_1108, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1116 = _1112 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1118 = sqrt(_1090);
    float _1120 = fma(_1108, _1114, -0.212114393711090087890625);
    float _1122 = -_1058;
    float _1124 = fma(_1096, _1110, _1122);
    float _1126 = fma(_1108, _1120, 1.570728778839111328125);
    float _1128 = fma(_1124, 0.5, 0.5);
    float _1130 = _1102 * _1106;
    float _1132 = _1104 * _1106;
    float _1134 = fma(_1130, 0.5, 0.5);
    float _1136 = fma(_1132, -0.5, 0.5);
    float _1138 = _1118 * 0.636619746685028076171875;
    float3 _3325 = float3(_1134, _1136, _1116);
    float _1140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3325, float3(0.0), isnan(_3325)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3325, float3(0.0), isnan(_3325)), level(0.0)).x;
    float3 _3336 = float3(_1134, _1136, _1116);
    float4 _1143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3336, float3(0.0), isnan(_3336)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3336, float3(0.0), isnan(_3336)), level(0.0)).xyzw;
    float _1145 = _1143.x;
    float _1147 = _1143.y;
    float _1149 = _1143.z;
    float _1151 = _1143.w;
    float _1153 = -_1126;
    float _1155 = fma(_1138, _1153, 1.0);
    float2 _3358 = float2(_1155, _1128);
    float3 _1159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3358, float2(0.0), isnan(_3358)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3358, float2(0.0), isnan(_3358)), level(0.0)).xyz;
    float _1161 = _1159.x;
    float _1163 = _1159.y;
    float _1165 = _1159.z;
    float _1167 = in.m_49.w;
    float _1169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1173 = _1171 != 0;
    float _1175 = in.m_49.y;
    float _1177 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1179 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1177;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1183 = _1181 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    int _1185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1187 = _1185 != 0;
    out.m_55.x = _448;
    out.m_55.y = _450;
    out.m_55.z = _452;
    out.m_55.w = _454;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1191 = _1189 != 0;
    float _1193 = 1.0 / _1183;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1197 = _1195 != 0;
    float _1199 = in.m_57.w;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1203 = _1201 != 0;
    float _1205 = _1042 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1207 = 0.0;
    float _1209 = (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (_1173)
    {
        float _1211 = in.m_49.z;
        _1207 = _1211;
    }
    float _1213 = _1207;
    float _1215 = _1169 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1217 = 1.0 / _1179;
    float _1219 = in.m_59.y;
    float _1221 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1223 = _482 + _1221;
    bool _1225 = _1167 > 0.5;
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1229 = _482 + _1227;
    float _1231 = _1223 * _1193;
    float _1233 = _142 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1235 = _1193;
    bool _1237 = _1225;
    float _1239 = _1223;
    if (!_1203)
    {
        float _1241 = in.m_49.z;
        _1235 = _1241;
    }
    float _1243 = _1235;
    float _1245 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1247 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1249 = _1175 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1251 = _1199;
    float _1253 = _1219;
    if (!_1203)
    {
        _1209 = _1175;
    }
    float _1255 = _1209;
    float _1257 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1259 = -_1247;
    float _1261 = fma(_1233, 2.0, _1259);
    float _1263 = _1229 * _1217;
    float _1265 = fma(_1249, -2.0, _1245);
    out.m_61.w = _1199;
    float _1267 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1269 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1267;
    float _1271 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1271;
    float _1275 = _1255;
    if (_1173)
    {
        bool _1277 = _1213 > 0.5;
        _354 = _1277;
    }
    bool _1279 = _354;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1283 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1281;
    float _1285 = -_1219;
    float _1287 = _1285 + 1.0;
    float _1289 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1291 = fma(_1269, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1293 = fma(_1273, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1295 = fma(_1283, _1263, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1297 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1289);
    int _1299 = _1225 ? as_type<int>(_1287) : as_type<int>(_1219);
    float _1301 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1303 = _1301 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    if (_1187)
    {
        bool _1305 = _142 > 0.5;
        _1237 = _1305;
    }
    bool _1307 = _1237;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    if (_1203)
    {
        _1275 = _142;
    }
    float _1313 = _1275;
    float _1315 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1317 = _1315 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1319 = _1191 ? as_type<float>(_1299) : _1219;
    float _1321 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1323 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1325 = isnan(_482);
    bool _1327 = _1323 || _1325;
    bool _1329 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1331 = _1327 || _1329;
    float _1333 = float(_1331);
    float _1335 = in.m_59.x;
    float _1337 = fma(_1303, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1339 = fma(_1311, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1341 = fma(_1317, _1231, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1343 = _1243;
    if (!_1203)
    {
        _1251 = _1243;
    }
    float _1345 = _1251;
    float _1347 = fma(_1175, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1321);
    bool _1349 = _1175 > 0.5;
    float _1351 = _1313 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1353 = _1345;
    int _1355 = as_type<int>(_1351);
    if (_1203)
    {
        _1353 = _1175;
    }
    float _1357 = _1353;
    float _1359 = _1257 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_1203)
    {
        _1343 = _1175;
    }
    float _1361 = _1343;
    float _1363 = fma(_1319, _1215, -0.5);
    bool _1365 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1367 = isnan(_482);
    bool _1369 = _1365 || _1367;
    bool _1371 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1373 = _1369 || _1371;
    float _1375 = float(_1373);
    float _1377 = -_1333;
    float _1379 = _1377 + 1.0;
    bool _1381 = _482 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1383 = isnan(_482);
    bool _1385 = _1381 || _1383;
    bool _1387 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1389 = _1385 || _1387;
    float _1391 = float(_1389);
    float _1393 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    if (_1197)
    {
        float _1395 = _1349 ? _1287 : _1219;
        _1253 = _1395;
    }
    float _1397 = _1253;
    float _1399 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1265);
    float _1401 = _1391 * _1379;
    float _1403 = -_1391;
    float _1405 = _1403 + 1.0;
    float _1407 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1409 = fma(_1359, _1397, -0.5);
    float _1411 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1413 = _1375 * _1405;
    float _1415 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1417 = fma(_1313, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1407);
    float _1419 = fma(_1361, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1411);
    float _1421 = _1295 * _1413;
    float _1423 = -_1415;
    float _1425 = fma(_1351, 2.0, _1423);
    float _1427 = _1291 * _1413;
    float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1431 = _1293 * _1413;
    int _1433 = as_type<int>(_1413);
    float _1435 = _1335;
    if (_1187)
    {
        float _1437 = -_1335;
        float _1439 = _1437 + 1.0;
        _1433 = as_type<int>(_1439);
    }
    int _1441 = _1433;
    float _1443 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1347);
    if (!_1187)
    {
        _1239 = _1335;
    }
    float _1445 = _1239;
    float _1447 = _1445;
    if (_1173)
    {
        float _1449 = -_1335;
        float _1451 = _1449 + 1.0;
        _1355 = as_type<int>(_1451);
    }
    int _1453 = _1355;
    if (_1187)
    {
        float _1455 = _1307 ? as_type<float>(_1441) : _1335;
        _1447 = _1455;
    }
    float _1457 = _1447;
    float _1459 = exp2(_1205);
    float _1461 = -_1375;
    float _1463 = _1461 + 1.0;
    float _1465 = -_1399;
    float _1467 = fma(_1443, _1409, _1465);
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1471 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1473 = _1393 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1475 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1427);
    float _1477 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1431);
    if (_1173)
    {
        float _1479 = _1279 ? as_type<float>(_1453) : _1335;
        _1435 = _1479;
    }
    float _1481 = _1435;
    float _1483 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1421);
    float _1485 = fma(_1471, -2.0, _1469);
    float _1487 = _1429 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1489 = fma(_1473, _1457, -0.5);
    float _1491 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1297);
    float _1493 = -_122;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1261);
    float _1497 = _1044 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1499 = fma(_1337, _1401, _1475);
    float _1501 = fma(_1341, _1401, _1483);
    float _1503 = fma(_1339, _1401, _1477);
    float _1505 = fma(_1487, _1481, -0.5);
    float _1507 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1417);
    float _1509 = -_122;
    float _1511 = fma(_1509, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1425);
    float _1513 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1419);
    float _1515 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1485);
    float _1517 = fma(_1491, _1489, _1495);
    float _1519 = fma(_1048, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1497);
    float _1521 = -_1459;
    float _1523 = _1521 + 1.0;
    float _1525 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1499);
    float _1527 = fma(_1507, _1505, _1511);
    float _1529 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1503);
    float _1531 = fma(_1333, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1501);
    float _1533 = -_1515;
    float _1535 = fma(_1513, _1363, _1533);
    float _1537 = fma(_1032, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1519);
    float _1539 = _1523 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1541 = _1517 + 0.5;
    float _1543 = _1525 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1545 = _1527 + 0.5;
    float _1547 = _1529 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1549 = _1531 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1551 = _1078 * 0.5;
    float _1553 = fma(_1056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1537);
    bool _1555 = _826 > 0.0;
    bool _1557 = isnan(_826);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan(0.0);
    bool _1563 = _1559 || _1561;
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1567 = _1543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1569 = _1547 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1571 = _1549 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1573 = _826 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1575 = fma(_1104, -0.5, _1551);
    float _1577 = _1553 + _1078;
    float _1579 = _1102 + _1078;
    float _1581 = -_1539;
    float _1583 = _1581 + 1.0;
    out.m_63.x = _1567;
    out.m_63.y = _1569;
    out.m_63.z = _1571;
    out.m_63.w = _1565;
    float _1585 = _1467 + 0.5;
    float _1587 = _1535 + 0.5;
    out.gl_Position.x = _1102;
    out.gl_Position.y = _1104;
    out.gl_Position.z = _1553;
    out.gl_Position.w = _1078;
    float _1589 = _1577 * 0.5;
    float _1591 = _1579 * 0.5;
    float _1593 = _1573 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_65.x = _1541;
    out.m_65.y = _1585;
    out.m_65.z = _1545;
    out.m_65.w = _1587;
    out.m_67.x = _1591;
    out.m_67.y = _1575;
    out.m_67.z = _1589;
    out.m_67.w = _1078;
    out.m_45.x = _1593;
    float _1595 = _1539 * _1140;
    float _1597 = _1151 * _1583;
    float _1599 = _1151 * _1595;
    float _1601 = _1165 * _1595;
    float _1603 = fma(_1161, _1599, _1145);
    float _1605 = fma(_1163, _1599, _1147);
    float _1607 = fma(_1151, _1601, _1149);
    out.m_69.x = _1603;
    out.m_69.y = _1605;
    out.m_69.z = _1607;
    out.m_69.w = _1597;
    if (_1563)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1609 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1609;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

