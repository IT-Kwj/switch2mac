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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_81 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_79 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 m_93 [[user(locn15)]];
    float4 m_95 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_89 [[attribute(0)]];
    float4 m_71 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_65 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_67 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4372 = false;
    bool _3687 = false;
    bool _296 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = in.m_50.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    float _134 = _124;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _130;
    if (!_128)
    {
        out.m_55.x = 0.0;
    }
    int _138 = 0;
    if (!_128)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4630 = as_type<float>(_142);
        out.gl_Position.z = _4630;
    }
    if (!_128)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _146 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_115);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = float(_120);
    bool _158 = _124 >= _156;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    float _164 = 1.0 / _156;
    if (_162)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _132;
    if (_162)
    {
        out.m_55.x = 0.0;
    }
    float _168 = _124 * _164;
    float _170 = _168;
    if (_162)
    {
        float _172 = _166 * 5.0;
        _144 = as_type<int>(_172);
    }
    int _174 = _144;
    out.m_53.x = _168;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4693 = as_type<float>(_174);
        out.gl_Position.z = _4693;
    }
    if (_162)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _178 = !_176;
    float _196;
    if (!_178)
    {
        float _180 = in.m_57.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _168;
    }
    _198 = false;
    float _200 = _196;
    bool _202 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _204 = isnan(_200);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _218 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _220 = isnan(_200);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _236 = _200 + _234;
    float _238 = -_212;
    float _240 = _238 + 1.0;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _244 = 1.0 / _216;
    float _246 = _228 * _240;
    float _248 = -_228;
    float _250 = _248 + 1.0;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _258 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _260 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _262 = _256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _232 * _244;
    float _266 = fma(_264, _236, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _268 = _266 * _246;
    float _270 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _268);
    float _272 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[116].x, _270);
    float _274 = _272 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _276 = !_242;
    float _294;
    if (!_276)
    {
        float _278 = in.m_57.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        _294 = _168;
    }
    _296 = false;
    float _298 = _294;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _316 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _318 = isnan(_298);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _306;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _334 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _336 = isnan(_298);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _348 = 1.0 / _314;
    float _350 = _310 * _328;
    bool _352 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _354 = isnan(_298);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _332;
    float _366 = -_326;
    float _368 = _366 + 1.0;
    float _370 = fma(_350, _302, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _376 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _378 = isnan(_298);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_362;
    float _390 = _388 + 1.0;
    float _392 = _362 * _368;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _398 = 1.0 / _374;
    float _400 = -_386;
    float _402 = _400 + 1.0;
    float _404 = _344 * _390;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _406;
    float _410 = _396 * _348;
    float _412 = _326 * _402;
    float _414 = _370 * _404;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _418 = _298 + _416;
    float _420 = -_344;
    float _422 = _420 + 1.0;
    bool _424 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _426 = isnan(_298);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _408 * _364;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _444 = _298 + _442;
    float _446 = fma(_410, _418, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _448 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[131].x, _414);
    float _450 = -_434;
    float _452 = _450 + 1.0;
    float _454 = _440 * _398;
    float _456 = fma(_436, _444, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _460 = _298 + _458;
    float _462 = fma(_446, _392, _448);
    float _464 = _386 * _452;
    float _466 = fma(_454, _460, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _468 = fma(_456, _412, _462);
    float _470 = fma(_466, _464, _468);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _478 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[135].x, _470);
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = _478 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _488 = !_346;
    int _490 = as_type<int>(_364);
    int _492 = as_type<int>(_398);
    if (!_488)
    {
        float _494 = in.m_57.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _170 = _508;
    }
    float _510 = _170;
    float _512 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _514 = int(_512);
    float _516 = in.m_59.x;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _520 = _518 != 0;
    float _522 = in.m_57.y;
    float _524 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _526 = int(_524);
    float _528 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _530 = int(_528);
    float _532 = float(_514);
    float _534 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _536 = int(_534);
    float _538 = float(_526);
    float _540 = 0.0;
    float _542 = _516;
    if (!_520)
    {
        _540 = _516;
    }
    float _544 = _540;
    float _546 = 1.0 / _532;
    float _548 = float(_530);
    float _550 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _552 = int(_550);
    float _554 = float(uint(_536));
    float _556 = 1.0 / _538;
    float _558 = _546 * _124;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _562 = int(_560);
    float _564 = float(uint(_552));
    float _566 = 1.0 / _548;
    float _568 = _556 * _124;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _572 = _570 != 0;
    float _574 = 1.0 / _554;
    float _576 = float(uint(_562));
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _584 = _582 != 0;
    bool _586 = _522 > 0.5;
    float _588 = 1.0 / _564;
    float _590 = _566 * _124;
    float _592 = 0.0;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _596 = _544;
    if (_572)
    {
        float _598 = in.m_57.x;
        _592 = _598;
    }
    float _600 = _592;
    float _602 = 0.0;
    if (_572)
    {
        _602 = 1.0;
    }
    float _604 = _602;
    float _606 = trunc(_558);
    int _608 = int(_606);
    int _610 = as_type<int>(_574) + (-2);
    float _612 = _604;
    if (_580)
    {
        float _614 = -_516;
        float _616 = _614 + 1.0;
        _490 = as_type<int>(_616);
    }
    int _618 = _490;
    float _620 = as_type<float>(_618);
    if (_584)
    {
        float _622 = -_516;
        float _624 = _622 + 1.0;
        _492 = as_type<int>(_624);
    }
    int _626 = _492;
    float _628 = as_type<float>(_626);
    if (!_580)
    {
        _594 = _516;
    }
    float _630 = _594;
    float _632 = 0.0;
    float _634 = _630;
    if (!_584)
    {
        _632 = _516;
    }
    float _636 = _632;
    float _638 = 1.0 / _576;
    int _640 = as_type<int>(_588) + (-2);
    float _642 = _636;
    if (_580)
    {
        float _644 = _586 ? as_type<float>(_618) : _516;
        _634 = _644;
    }
    float _646 = _634;
    if (_584)
    {
        float _648 = _586 ? as_type<float>(_626) : _516;
        _642 = _648;
    }
    float _650 = _642;
    if (_572)
    {
        _620 = 1.0;
    }
    float _652 = _620;
    float _654 = trunc(_590);
    int _656 = int(_654);
    float _658 = float(uint(_608));
    float _660 = as_type<float>(_640) * _658;
    float _662 = trunc(_568);
    int _664 = int(_662);
    int _666 = as_type<int>(_638) + (-2);
    float _668 = float(uint(_656));
    float _670 = trunc(_660);
    float _672 = precise::max(_670, 0.0);
    uint _675 = uint(_672);
    float _677 = as_type<float>(_666) * _668;
    int _679 = as_type<int>(_668);
    float _681 = _660;
    float _683 = _652;
    if (_572)
    {
        _679 = 0;
    }
    int _685 = _679;
    float _687 = float(uint(_664));
    float _689 = trunc(_677);
    float _691 = precise::max(_689, 0.0);
    uint _693 = uint(_691);
    float _695 = _600;
    int _697 = _685;
    if (_572)
    {
        _681 = _600;
    }
    float _699 = _681;
    float _701 = as_type<float>(_610) * _687;
    float _703 = 0.0;
    float _705 = _699;
    if (_572)
    {
        _703 = _699;
    }
    float _707 = _703;
    float _709 = _707;
    if (_572)
    {
        _628 = _699;
    }
    float _711 = _628;
    float _713 = trunc(_701);
    float _715 = precise::max(_713, 0.0);
    uint _717 = uint(_715);
    int _719 = int(_572);
    int _721 = _586 ? 2 : 0;
    int _723 = _719 | _721;
    int _725 = false ? 4 : 0;
    int _727 = _723 | _725;
    int _729 = false ? 8 : 0;
    int _731 = _727 | _729;
    int _733 = _580 ? 16 : 0;
    int _735 = _731 | _733;
    int _737 = false ? 32 : 0;
    int _739 = _735 | _737;
    int _741 = _584 ? 64 : 0;
    int _743 = _739 | _741;
    int _745 = _743 & 2;
    float _747 = as_type<float>(_745);
    float _749 = _711;
    if (_572)
    {
        _747 = _522;
    }
    float _751 = _747;
    float _753 = _751;
    if (!_572)
    {
        float _755 = in.m_57.x;
        float _757 = _522 * 3.1415927410125732421875;
        float _759 = in.m_57.z;
        float _761 = _757 * 0.15915493667125701904296875;
        float _763 = _761 * 6.283185482025146484375;
        float _765 = sin(_763);
        float _767 = _755 * 3.1415927410125732421875;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = sin(_771);
        _612 = 7.345489978790283203125;
        _695 = _755;
        _749 = _522;
        _709 = _759;
        _683 = 5.839270114898681640625;
        _753 = _765;
        _697 = 2;
        _705 = _773;
    }
    float _775 = _612;
    float _777 = _695;
    float _779 = _749;
    float _781 = _709;
    float _783 = _683;
    float _785 = _753;
    int _787 = _697;
    float _789 = _705;
    int _791 = ~_536;
    int _793 = _791 + 1;
    float _795 = _775 * _777;
    int _797 = ~_552;
    int _799 = _797 + 1;
    float _801 = _779 * _775;
    int _803 = ~_562;
    int _805 = _803 + 1;
    int _807 = _793 * int(_717);
    int _809 = _807 + _664;
    float _811 = _781 * _783;
    float _813 = floor(_795);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _817 = _815 != 0;
    float _819 = in.m_59.y;
    float _821 = float(uint(_809));
    int _823 = _799 * int(_675);
    int _825 = _823 + _608;
    int _827 = _805 * int(_693);
    int _829 = _827 + _656;
    bool _831 = _552 == 0;
    float _833 = as_type<float>(_610) * _821;
    float _835 = float(uint(_825));
    float _837 = floor(_801);
    float _839 = float(uint(_829));
    float _841 = in.m_57.z;
    float _843 = as_type<float>(_640) * _835;
    float _845 = as_type<float>(_666) * _839;
    float _847 = -_813;
    float _849 = _795 + _847;
    float _851 = floor(_811);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _857 = _777 * 2.0;
    float _859 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[93].w, _855);
    float _861 = _785 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _863 = trunc(_833);
    float _865 = precise::max(_863, 0.0);
    uint _867 = uint(_865);
    float _869 = -_837;
    float _871 = _801 + _869;
    float _873 = float(_536);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _877 = float(_664);
    float _879 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].w, _859);
    int _881 = ~_536;
    int _883 = _881 + 1;
    out.m_61.x = _258;
    out.m_61.y = _260;
    out.m_61.z = _262;
    out.m_61.w = _274;
    float _885 = trunc(_843);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    float _891 = -_851;
    float _893 = _811 + _891;
    float _895 = float(_552);
    out.m_63.x = _480;
    out.m_63.y = _482;
    out.m_63.z = _484;
    out.m_63.w = _486;
    float _897 = float(_608);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = _510 + _899;
    bool _903 = _877 >= _873;
    bool _905 = isnan(_877);
    bool _907 = _903 || _905;
    bool _909 = isnan(_873);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = _895 * _893;
    float _917 = trunc(_845);
    float _919 = precise::max(_917, 0.0);
    uint _921 = uint(_919);
    int _923 = int(_717) + int(_867);
    float _925 = _164 * _124;
    float _927 = float(_562);
    float _929 = _873 * _849;
    bool _931 = _897 >= _895;
    bool _933 = isnan(_897);
    bool _935 = _931 || _933;
    bool _937 = isnan(_895);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = _873 * _925;
    float _945 = _895 * _925;
    int _947 = int(_675) + int(_889);
    float _949 = _927 * _925;
    int _951 = ~_536;
    int _953 = _951 + 1;
    float _955 = _927 * _871;
    int _957 = ~_562;
    int _959 = _957 + 1;
    float _961 = trunc(_929);
    int _963 = int(_961);
    float _965 = float(_656);
    int _967 = _953 * _923;
    int _969 = _967 + _664;
    int _971 = int(_693) + int(_921);
    float _973 = in.m_65.x;
    float _975 = in.m_65.y;
    float _977 = in.m_65.z;
    int _979 = ~_552;
    int _981 = _979 + 1;
    bool _983 = _965 >= _927;
    bool _985 = isnan(_965);
    bool _987 = _983 || _985;
    bool _989 = isnan(_927);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    int _995 = _959 * _971;
    int _997 = _995 + _656;
    bool _999 = uint(_969) >= uint(_536);
    int _1001 = _981 * _947;
    int _1003 = _1001 + _608;
    float _1005 = trunc(_915);
    int _1007 = int(_1005);
    bool _1009 = !_999;
    int _1011 = _1009 ? 0 : (-1);
    bool _1013 = uint(_1003) >= uint(_552);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1017 = uint(_997) >= uint(_562);
    float _1019 = trunc(_993);
    int _1021 = int(_1019);
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1025 = _1023 != 0;
    float _1027 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1015);
    bool _1029 = !_817;
    int _1031 = _1029 ? 0 : 1;
    int _1033 = ~_923;
    int _1035 = _1033 + _1011;
    int _1037 = _1035 + 1;
    bool _1039 = !_1013;
    int _1041 = _1039 ? 0 : (-1);
    float _1043 = trunc(_913);
    int _1045 = int(_1043);
    bool _1047 = !_1025;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = _536 * _1037;
    int _1053 = _1051 + _664;
    int _1055 = abs(_1031);
    bool _1057 = !_1017;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = ~_947;
    int _1063 = _1061 + _1041;
    int _1065 = _1063 + 1;
    float _1067 = trunc(_941);
    int _1069 = int(_1067);
    int _1071 = abs(_1049);
    int _1073 = _963 * _1055;
    int _1075 = _1073 + _664;
    int _1077 = ~_971;
    int _1079 = _1077 + _1059;
    int _1081 = _1079 + 1;
    int _1083 = _552 * _1065;
    int _1085 = _1083 + _608;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1089 = _1087 != 0;
    int _1091 = _1007 * _1071;
    int _1093 = _1091 + _608;
    bool _1095 = _536 == 0;
    int _1097 = _562 * _1081;
    int _1099 = _1097 + _656;
    bool _1101 = _562 == 0;
    float _1103 = trunc(_955);
    int _1105 = int(_1103);
    bool _1107 = !_1089;
    int _1109 = _1107 ? 0 : 1;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1117 = _1115 != 0;
    int _1119 = abs(_1109);
    float _1121 = floor(_857);
    int _1123 = ~_1021;
    int _1125 = _1123 + 1;
    int _1127 = _1125 + 1;
    bool _1129 = !_1101;
    int _1131 = _1129 ? _1099 : (-1);
    int _1133 = ~_1045;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    int _1139 = _1105 * _1119;
    int _1141 = _1139 + _656;
    bool _1143 = !_1095;
    int _1145 = _1143 ? _1053 : (-1);
    int _1147 = _1127 * _1131;
    int _1149 = ~_1069;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = trunc(_945);
    int _1157 = int(_1155);
    bool _1159 = !_1117;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = _1137 * _1145;
    bool _1165 = !_1113;
    int _1167 = _1165 ? 0 : 1;
    bool _1169 = !_831;
    int _1171 = _1169 ? _1085 : (-1);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1175 = _1173 != 0;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1179 = _1177 != 0;
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1183 = _536 + (-1);
    int _1185 = _1153 * _1171;
    int _1187 = _552 + (-1);
    bool _1189 = !_1179;
    int _1191 = _1189 ? 0 : 1;
    int _1193 = _1045 * _1183;
    int _1195 = _1193 + _1163;
    bool _1197 = !_1175;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = _1069 * _1187;
    int _1203 = _1201 + _1185;
    int _1205 = abs(_1191);
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1209 = _1207 != 0;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1213 = _1211 != 0;
    int _1215 = _1203 * _1205;
    int _1217 = abs(_1199);
    bool _1219 = !_1209;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = trunc(_943);
    int _1225 = int(_1223);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1229 = _1227 != 0;
    int _1231 = _1157 * _1217;
    int _1233 = _1231 + _1215;
    bool _1235 = !_1213;
    int _1237 = _1235 ? 0 : 1;
    int _1239 = abs(_1161);
    bool _1241 = !_1229;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = abs(_1237);
    int _1247 = abs(_1167);
    int _1249 = abs(_1243);
    int _1251 = _1195 * _1239;
    int _1253 = _1093 * _1245;
    int _1255 = _1253 + _1233;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1259 = _1257 != 0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1263 = _1261 != 0;
    int _1265 = _1225 * _1247;
    int _1267 = _1265 + _1251;
    int _1269 = abs(_1221);
    int _1271 = _1007 * _1249;
    int _1273 = _1271 + _1255;
    float _1275 = trunc(_949);
    int _1277 = int(_1275);
    bool _1279 = !_1263;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1285 = _1283 != 0;
    int _1287 = _1075 * _1269;
    int _1289 = _1287 + _1267;
    float _1291 = float(uint(_1273));
    int _1293 = abs(_1281);
    bool _1295 = !_1285;
    int _1297 = _1295 ? 0 : 1;
    float _1299 = as_type<float>(_640) * _1291;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1307 = _1305 != 0;
    int _1309 = _562 + (-1);
    int _1311 = abs(_1297);
    float _1313 = trunc(_1299);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    bool _1319 = !_1303;
    int _1321 = _1319 ? 0 : 1;
    int _1323 = _1021 * _1309;
    int _1325 = _1323 + _1147;
    bool _1327 = !_1259;
    int _1329 = _1327 ? 0 : 1;
    int _1331 = abs(_1321);
    int _1333 = _1325 * _1293;
    int _1335 = abs(_1329);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1339 = _1337 != 0;
    int _1341 = _1277 * _1335;
    int _1343 = _1341 + _1333;
    int _1345 = ~_552;
    int _1347 = _1345 + 1;
    int _1349 = _963 * _1311;
    int _1351 = _1349 + _1289;
    bool _1353 = !_1307;
    int _1355 = _1353 ? 0 : 1;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1359 = _1357 != 0;
    int _1361 = abs(_1355);
    int _1363 = _1141 * _1331;
    int _1365 = _1363 + _1343;
    float _1367 = float(uint(_1351));
    int _1369 = _1347 * int(_1317);
    int _1371 = _1369 + _1273;
    float _1373 = as_type<float>(_1245);
    bool _1375 = _1285;
    float _1377 = _861;
    float _1379 = _819;
    if (_1339)
    {
        float _1381 = in.m_57.x;
        _1373 = _1381;
    }
    float _1383 = _1373;
    int _1385 = _1105 * _1361;
    int _1387 = _1385 + _1365;
    bool _1389 = _536 == 0;
    float _1391 = as_type<float>(_610) * _1367;
    float _1393 = float(uint(_1371));
    float _1395 = as_type<float>(_1331);
    int _1397 = as_type<int>(_1393);
    float _1399 = as_type<float>(_1387);
    if (_1359)
    {
        float _1401 = in.m_57.z;
        _1395 = _1401;
    }
    float _1403 = _1395;
    float _1405 = float(uint(_1387));
    float _1407 = trunc(_1391);
    float _1409 = precise::max(_1407, 0.0);
    uint _1411 = uint(_1409);
    float _1413 = as_type<float>(_640) * _1393;
    float _1415 = as_type<float>(_666) * _1405;
    int _1417 = ~_536;
    int _1419 = _1417 + 1;
    int _1421 = as_type<int>(_1415);
    if (_1339)
    {
        float _1423 = -_516;
        float _1425 = _1423 + 1.0;
        _1397 = as_type<int>(_1425);
    }
    int _1427 = _1397;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1431 = trunc(_1413);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    float _1437 = fma(_861, -2.0, _1429);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1441 = ~_562;
    int _1443 = _1441 + 1;
    float _1445 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1437);
    int _1447 = ~_552;
    int _1449 = _1447 + 1;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1453 = trunc(_1415);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = _1419 * int(_1411);
    int _1461 = _1459 + _1351;
    if (_1339)
    {
        bool _1463 = _1383 > 0.5;
        _1375 = _1463;
    }
    bool _1465 = _1375;
    int _1467 = ~_562;
    int _1469 = _1467 + 1;
    bool _1471 = _1465;
    if (_1339)
    {
        float _1473 = _1465 ? as_type<float>(_1427) : _516;
        _596 = _1473;
    }
    float _1475 = _596;
    float _1477 = float(uint(_1461));
    if (_1359)
    {
        float _1479 = -_516;
        float _1481 = _1479 + 1.0;
        _1421 = as_type<int>(_1481);
    }
    int _1483 = _1421;
    int _1485 = int(_1317) + int(_1435);
    if (_1359)
    {
        bool _1487 = _1403 > 0.5;
        _1471 = _1487;
    }
    bool _1489 = _1471;
    int _1491 = ~_552;
    int _1493 = _1491 + 1;
    int _1495 = _1469 * int(_1457);
    int _1497 = _1495 + _1387;
    float _1499 = as_type<float>(_610) * _1477;
    if (_1359)
    {
        float _1501 = _1489 ? as_type<float>(_1483) : _516;
        _542 = _1501;
    }
    float _1503 = _542;
    float _1505 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1507 = _787 != 2;
    float _1509 = float(uint(_1497));
    int _1511 = _1493 * _1485;
    int _1513 = _1511 + _1273;
    float _1515 = trunc(_1499);
    float _1517 = precise::max(_1515, 0.0);
    uint _1519 = uint(_1517);
    float _1521 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1523 = as_type<float>(_666) * _1509;
    bool _1525 = uint(_1513) >= uint(_552);
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1529 = ~_536;
    int _1531 = _1529 + 1;
    float _1533 = trunc(_1523);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    bool _1539 = !_1525;
    int _1541 = _1539 ? 0 : (-1);
    float _1543 = fma(_1505, -2.0, _1527);
    int _1545 = ~_1485;
    int _1547 = _1545 + _1541;
    int _1549 = _1547 + 1;
    float _1551 = _789 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1553 = _522 > 0.5;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1557 = int(_1411) + int(_1519);
    int _1559 = _552 * _1549;
    int _1561 = _1559 + _1273;
    float _1563 = -_853;
    float _1565 = fma(_1551, 2.0, _1563);
    if (_1507)
    {
        _1377 = _777;
    }
    float _1567 = _1377;
    float _1569 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1543);
    bool _1571 = !_831;
    int _1573 = _1571 ? _1561 : (-1);
    int _1575 = _1531 * _1557;
    int _1577 = _1575 + _1351;
    float _1579 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1555);
    int _1581 = int(_1457) + int(_1537);
    float _1583 = -_124;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1565);
    int _1587 = _1573 & 3;
    bool _1589 = _1587 != 0;
    float _1591 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1579);
    bool _1593 = uint(_1577) >= uint(_536);
    int _1595 = _1589 ? 0 : 1;
    bool _1597 = _1587 != 3;
    bool _1599 = !_1593;
    int _1601 = _1599 ? 0 : (-1);
    int _1603 = ~_562;
    int _1605 = _1603 + 1;
    bool _1607 = uint(_1587) >= 2u;
    int _1609 = ~_1557;
    int _1611 = _1609 + _1601;
    int _1613 = _1611 + 1;
    int _1615 = _1605 * _1581;
    int _1617 = _1615 + _1387;
    int _1619 = _1607 ? 0 : 1;
    bool _1621 = uint(_1587) > 1u;
    int _1623 = _536 * _1613;
    int _1625 = _1623 + _1351;
    int _1627 = ~_1619;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    int _1633 = _1631;
    float _1635 = _1567;
    if (_1597)
    {
        int _1637 = ~_1619;
        int _1639 = _1637 + 1;
        _1633 = _1639;
    }
    int _1641 = _1633;
    float _1643 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1645 = uint(_1617) >= uint(_562);
    float _1647 = -_819;
    float _1649 = _1647 + 1.0;
    bool _1651 = !_1389;
    int _1653 = _1651 ? _1625 : (-1);
    float _1655 = -_875;
    float _1657 = fma(_1643, 2.0, _1655);
    bool _1659 = !_1645;
    int _1661 = _1659 ? 0 : (-1);
    float _1663 = float(uint(_1093));
    float _1665 = -_124;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1657);
    int _1669 = ~_1581;
    int _1671 = _1669 + _1661;
    int _1673 = _1671 + 1;
    int _1675 = _1653 & 3;
    float _1677 = as_type<float>(_640) * _1663;
    int _1679 = ~_1595;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    int _1685 = _562 * _1673;
    int _1687 = _1685 + _1387;
    int _1689 = _1683;
    if (!_1621)
    {
        int _1691 = ~_1595;
        int _1693 = _1691 + 1;
        _1689 = _1693;
    }
    int _1695 = _1689;
    float _1697 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1699 = log2(_1697);
    bool _1701 = _1675 != 3;
    if (!_1507)
    {
        _1635 = _841;
    }
    float _1703 = _1635;
    int _1705 = _1553 ? as_type<int>(_1649) : as_type<int>(_819);
    bool _1707 = _562 == 0;
    float _1709 = trunc(_1677);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    bool _1715 = uint(_1675) >= 2u;
    float _1717 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1719 = !_1707;
    int _1721 = _1719 ? _1687 : (-1);
    int _1723 = _1715 ? 0 : 1;
    float _1725 = -_1439;
    float _1727 = fma(_1717, 2.0, _1725);
    int _1729 = _1721 & 3;
    float _1731 = _1699 * _124;
    int _1733 = ~_1723;
    int _1735 = _1733 + 1;
    int _1737 = _1735 + 1;
    float _1739 = -_124;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1727);
    int _1743 = _1737;
    if (_1701)
    {
        int _1745 = ~_1723;
        int _1747 = _1745 + 1;
        _1743 = _1747;
    }
    int _1749 = _1743;
    bool _1751 = uint(_1675) > 1u;
    float _1753 = exp2(_1731);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1757 = _1755 != 0;
    bool _1759 = _1729 != 3;
    int _1761 = ~_552;
    int _1763 = _1761 + 1;
    if (_1507)
    {
        _1399 = _522;
    }
    float _1765 = _1399;
    int _1767 = _1653 & 3;
    bool _1769 = _1767 != 0;
    int _1771 = _1763 * int(_1713);
    int _1773 = _1771 + _1093;
    bool _1775 = !_1757;
    int _1777 = _1775 ? 0 : 1;
    float _1779 = _1765;
    if (!_1507)
    {
        _1779 = _777;
    }
    float _1781 = _1779;
    bool _1783 = _841 > 0.5;
    float _1785 = -_1753;
    float _1787 = _1785 + 1.0;
    bool _1789 = uint(_1729) >= 2u;
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1793 = _1769 ? 0 : 1;
    int _1795 = _1783 ? as_type<int>(_1649) : as_type<int>(_819);
    float _1797 = fma(_1791, -2.0, _1451);
    int _1799 = _1789 ? 0 : 1;
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1803 = _1801 != 0;
    int _1805 = ~_1793;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _1809;
    if (!_1751)
    {
        int _1813 = ~_1793;
        int _1815 = _1813 + 1;
        _1811 = _1815;
    }
    int _1817 = _1811;
    int _1819 = ~_1799;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    float _1825 = float(uint(_1773));
    float _1827 = _1803 ? as_type<float>(_1795) : _819;
    int _1829 = _1823;
    if (_1759)
    {
        int _1831 = ~_1799;
        int _1833 = _1831 + 1;
        _1829 = _1833;
    }
    int _1835 = _1829;
    float _1837 = as_type<float>(_640) * _1825;
    float _1839 = float(uint(_1075));
    float _1841 = in.m_57.w;
    bool _1843 = uint(_1729) > 1u;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1847 = _1845 != 0;
    float _1849 = as_type<float>(_610) * _1839;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1853 = _1721 & 3;
    bool _1855 = _1853 != 0;
    float _1857 = trunc(_1837);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = _1847 ? as_type<float>(_1795) : _819;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1867 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1869 = isnan(0.0);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1875 = _1871 || _1873;
    float _1877 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1851);
    float _1879 = float(uint(_1141));
    float _1881 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1027);
    int _1883 = _1855 ? 0 : 1;
    float _1885 = trunc(_1849);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    float _1891 = _1875 ? _1787 : 0.0;
    float _1893 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1865);
    float _1895 = as_type<float>(_666) * _1879;
    int _1897 = ~_1883;
    int _1899 = _1897 + 1;
    int _1901 = _1899 + 1;
    float _1903 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1877);
    int _1905 = _1901;
    if (!_1843)
    {
        int _1907 = ~_1883;
        int _1909 = _1907 + 1;
        _1905 = _1909;
    }
    int _1911 = _1905;
    float _1913 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1893);
    bool _1915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1917 = isnan(1.0);
    bool _1919 = _1915 || _1917;
    bool _1921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1923 = _1919 || _1921;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1927 = 1.0 + _1925;
    float _1929 = trunc(_1895);
    float _1931 = precise::max(_1929, 0.0);
    uint _1933 = uint(_1931);
    float _1935 = _522 * 2.0;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1939 = _1937 != 0;
    int _1941 = _883 * int(_1889);
    int _1943 = _1941 + _1075;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1947 = _1939 ? as_type<float>(_1705) : _819;
    float _1949 = 1.0 / _1927;
    bool _1951 = _1121 > 0.0;
    float _1953 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1945);
    float _1955 = float(uint(_1943));
    float _1957 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1797);
    float _1959 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1953);
    int _1961 = _1443 * int(_1933);
    int _1963 = _1961 + _1141;
    float _1965 = floor(_1935);
    float _1967 = as_type<float>(_610) * _1955;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_1923)
    {
        float _1977 = _1891 * _1949;
        _134 = _1977;
    }
    float _1979 = _134;
    float _1981 = float(uint(_1963));
    float _1983 = trunc(_1967);
    float _1985 = precise::max(_1983, 0.0);
    uint _1987 = uint(_1985);
    bool _1989 = _1121 >= 0.0;
    bool _1991 = isnan(_1121);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2001 = _1999 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2003 = as_type<float>(_666) * _1981;
    int _2005 = _1997 ? 0 : 1;
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2009 = _2007 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2013 = _2011 != 0;
    float _2015 = trunc(_2003);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    int _2021 = ~_2005;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2031 = _2025;
    if (!_1951)
    {
        int _2033 = ~_2005;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2039;
    bool _2043 = _1841 > 0.5;
    int _2045 = int(_1713) + int(_1861);
    float _2047 = 1.0 / _2029;
    int _2049 = ~_536;
    int _2051 = _2049 + 1;
    if (_2013)
    {
        float _2053 = _2043 ? _1649 : _819;
        _1379 = _2053;
    }
    float _2055 = _1379;
    int _2057 = _1449 * _2045;
    int _2059 = _2057 + _1093;
    bool _2061 = _1965 >= 0.0;
    bool _2063 = isnan(_1965);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(0.0);
    bool _2069 = _2065 || _2067;
    float _2071 = 1.0 / _2001;
    bool _2073 = _1965 > 0.0;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2077 = _2069 ? 0 : 1;
    bool _2079 = uint(_2059) >= uint(_552);
    int _2081 = int(_1889) + int(_1987);
    float _2083 = 1.0 / _1971;
    bool _2085 = !_2079;
    int _2087 = _2085 ? 0 : (-1);
    int _2089 = int(_1933) + int(_2019);
    int _2091 = _2051 * _2081;
    int _2093 = _2091 + _1075;
    int _2095 = ~_2045;
    int _2097 = _2095 + _2087;
    int _2099 = _2097 + 1;
    float _2101 = 1.0 / _1975;
    int _2103 = ~_562;
    int _2105 = _2103 + 1;
    int _2107 = ~_2077;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    int _2113 = _552 * _2099;
    int _2115 = _2113 + _1093;
    int _2117 = _2111;
    int _2119 = as_type<int>(_2075);
    if (!_2073)
    {
        int _2121 = ~_2077;
        int _2123 = _2121 + 1;
        _2117 = _2123;
    }
    int _2125 = _2117;
    float _2127 = in.m_48.x;
    float _2129 = in.m_48.y;
    float _2131 = in.m_48.z;
    bool _2133 = uint(_2093) >= uint(_536);
    int _2135 = _2105 * _2089;
    int _2137 = _2135 + _1141;
    float _2139 = 1.0 / _2009;
    bool _2141 = !_2133;
    int _2143 = _2141 ? 0 : (-1);
    bool _2145 = uint(_2137) >= uint(_562);
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2151 = in.m_67.x;
    float _2153 = in.m_67.y;
    float _2155 = in.m_67.z;
    int _2157 = _1573 & 3;
    bool _2159 = _2157 != 0;
    bool _2161 = !_2145;
    int _2163 = _2161 ? 0 : (-1);
    bool _2165 = _1587 != 3;
    bool _2167 = !_831;
    int _2169 = _2167 ? _2115 : (-1);
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2173 = _2171 != 0;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2181 = _2179 != 0;
    float _2183 = 1.0 / _2149;
    bool _2185 = !_2159;
    int _2187 = _2185 ? 0 : 1;
    float _2189 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2191 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2193 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _2195 = !_2165;
    int _2197 = _2195 ? 0 : (-1);
    float _2199 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2189);
    float _2201 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2191);
    float _2203 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2193);
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2207 = _2205 != 0;
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2209;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2215 = _2213 != 0;
    float _2217 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2221 = _2219 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2223 = _2041 * _2047;
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2229 = _2211 * _2183;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2235 = _2221 * _2071;
    float _2237 = _841 * 2.0;
    float _2239 = _2227 * _2083;
    float _2241 = _522 + _841;
    float _2243 = 1.0 / _2233;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2247 = _2245 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2249 = _2241 + (-1.0);
    float _2251 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2253 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2255 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2257 = floor(_2237);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2263;
    float _2267 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _975);
    float _2271 = _2261 * _2101;
    float _2273 = _2265 * _2139;
    float _2275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _973);
    float _2277 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _977);
    float _2281 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2283 = _2255 * _2275;
    float _2285 = _2277 * _2269;
    float _2287 = _2247 * _2243;
    float _2289 = _2281 * _2279;
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2293 = _510 + _2291;
    bool _2295 = !_2173;
    int _2297 = _2295 ? 0 : 1;
    float _2299 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2199);
    bool _2301 = _2257 >= 0.0;
    bool _2303 = isnan(_2257);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = fma(_2223, _2293, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2313 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2315 = isnan(_510);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2321 = _2317 || _2319;
    float _2323 = float(_2321);
    float _2325 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2201);
    float _2327 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2203);
    int _2329 = _2309 ? 0 : 1;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2333 = _510 + _2331;
    bool _2335 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2337 = isnan(_510);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2343 = _2339 || _2341;
    float _2345 = float(_2343);
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2349 = _510 + _2347;
    bool _2351 = _2257 > 0.0;
    float _2353 = -_2323;
    float _2355 = _2353 + 1.0;
    bool _2357 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2359 = isnan(_510);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = fma(_2239, _2333, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2371 = fma(_2229, _2349, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2373 = _2345 * _2355;
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2377 = _510 + _2375;
    bool _2379 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2381 = isnan(_510);
    bool _2383 = _2379 || _2381;
    bool _2385 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2387 = _2383 || _2385;
    float _2389 = float(_2387);
    float _2391 = -_2345;
    float _2393 = _2391 + 1.0;
    float _2395 = -_2367;
    float _2397 = _2395 + 1.0;
    float _2399 = fma(_2235, _2377, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2401 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2403 = isnan(_510);
    bool _2405 = _2401 || _2403;
    bool _2407 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2409 = _2405 || _2407;
    float _2411 = float(_2409);
    float _2413 = _2389 * _2393;
    float _2415 = -_2389;
    float _2417 = _2415 + 1.0;
    float _2419 = _2323 * _2397;
    float _2421 = in.m_69.x;
    float _2423 = in.m_69.y;
    float _2425 = in.m_69.z;
    int _2427 = ~_2329;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    float _2433 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    int _2435 = _2431;
    if (!_2351)
    {
        int _2437 = ~_2329;
        int _2439 = _2437 + 1;
        _2435 = _2439;
    }
    int _2441 = _2435;
    float _2443 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    bool _2445 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2447 = isnan(_510);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    float _2457 = _2325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2459 = _975 != 0.0;
    bool _2461 = isnan(_975);
    bool _2463 = _2459 || _2461;
    bool _2465 = isnan(0.0);
    bool _2467 = _2463 || _2465;
    float _2469 = _2327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2471 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2473 = isnan(_510);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = _2455 * _2417;
    bool _2485 = _973 == 0.0;
    bool _2487 = !_2467;
    bool _2489 = _2485 && _2487;
    float _2491 = -_2455;
    float _2493 = _2491 + 1.0;
    bool _2495 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2497 = isnan(_510);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2503 = _2499 || _2501;
    float _2505 = float(_2503);
    float _2507 = -_2481;
    float _2509 = _2507 + 1.0;
    bool _2511 = _977 == 0.0;
    bool _2513 = _2511 && _2489;
    float _2515 = _2411 * _2493;
    float _2517 = -_2411;
    float _2519 = _2517 + 1.0;
    float _2521 = _2505 * _2509;
    float _2523 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2525 = _510 + _2523;
    float _2527 = _2481 * _2519;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2531 = _510 + _2529;
    float _2533 = _2311 * _2521;
    float _2535 = -_2505;
    float _2537 = _2535 + 1.0;
    float _2539 = fma(_2271, _2525, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2541 = fma(_2287, _901, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2543 = fma(_2273, _2531, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2545 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2547 = _2531;
    int _2549 = as_type<int>(_2545);
    float _2551 = _2533;
    float _2553 = _2421;
    float _2555 = _2423;
    if (_2513)
    {
        _2547 = _2423;
    }
    float _2557 = _2547;
    float _2559 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2533);
    float _2561 = -_1569;
    float _2563 = fma(_1959, _2545, _2561);
    float _2565 = _2075 * _1181;
    bool _2567 = !_2177;
    int _2569 = _2567 ? 0 : 1;
    float _2571 = _2557;
    if (_2513)
    {
        float _2573 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2557);
        _2549 = as_type<int>(_2573);
    }
    int _2575 = _2549;
    int _2577 = _2575;
    if (_2513)
    {
        _2551 = _2557;
    }
    float _2579 = _2551;
    float _2581 = fma(_2369, _2527, _2559);
    float _2583 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2585 = _2579;
    if (!_2513)
    {
        _2571 = _2423;
    }
    float _2587 = _2571;
    float _2589 = in.m_71.x;
    float _2591 = in.m_71.y;
    float _2593 = in.m_71.z;
    int _2595 = abs(_2569);
    if (!_2513)
    {
        float _2597 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2421);
        _2553 = _2597;
    }
    float _2599 = _2553;
    float _2601 = float(_2037);
    float _2603 = _2599;
    if (!_2513)
    {
        float _2605 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2577 = as_type<int>(_2605);
    }
    int _2607 = _2577;
    int _2609 = abs(_2297);
    out.m_73.w = _2565;
    float _2611 = _522 + _777;
    float _2613 = fma(_2371, _2515, _2581);
    float _2615 = float(_2441);
    float _2617 = _2611 + (-1.0);
    float _2619 = float(_2609);
    if (_2513)
    {
        float _2621 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2425);
        _2119 = as_type<int>(_2621);
    }
    int _2623 = _2119;
    float _2625 = float(_2595);
    int _2627 = _2623;
    if (!_2513)
    {
        float _2629 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2425);
        _2627 = as_type<int>(_2629);
    }
    int _2631 = _2627;
    bool _2633 = !_2181;
    int _2635 = _2633 ? 0 : 1;
    float _2637 = fma(_2617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2639 = !_2513;
    float _2641 = _2639 ? as_type<float>(_2607) : _2587;
    float _2643 = _2625 * _2601;
    float _2645 = _522 + (-0.5);
    float _2647 = _2619 * _2615;
    if (_2513)
    {
        _2555 = _2425;
    }
    float _2649 = _2555;
    float _2651 = _2643 * (-2.0);
    int _2653 = abs(_2635);
    float _2655 = _2641 * _2641;
    bool _2657 = !_2513;
    float _2659 = _2657 ? as_type<float>(_2631) : _2425;
    float _2661 = fma(_2651, _2591, _2591);
    float _2663 = float(_2125);
    float _2665 = fma(_2267, _2651, _2267);
    float _2667 = float(_2653);
    float _2669 = fma(_2645, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2661);
    float _2671 = _2647 * (-2.0);
    float _2673 = fma(_2659, _2659, _2655);
    float _2675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2677 = _2667 * _2663;
    float _2679 = fma(_2637, _2671, _2637);
    float _2681 = fma(_2671, _2589, _2589);
    float _2683 = _777 + _841;
    float _2685 = _777 + (-0.5);
    float _2687 = fma(_2665, _1979, _2669);
    float _2689 = _841 + (-0.5);
    float _2691 = rsqrt(_2673);
    float _2693 = fma(_2685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2681);
    float _2695 = _2687 * 0.15915493667125701904296875;
    float _2697 = _2677 * (-2.0);
    float _2699 = fma(_1903, _2583, _1667);
    float _2701 = fma(_2679, _1979, _2693);
    float _2703 = fma(_2697, _2593, _2593);
    float _2705 = _2683 + (-1.0);
    float _2707 = _2701 * 0.15915493667125701904296875;
    float _2709 = -_1445;
    float _2711 = fma(_879, _2433, _2709);
    int _2713 = _1573 >> 31;
    float _2715 = fma(_2689, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2703);
    float _2717 = fma(_2705, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2719 = _1521 * _2675;
    float _2721 = _2711 + 0.5;
    float _2723 = _2641 * _2691;
    float _2725 = _2699 + 0.5;
    int _2727 = _2713 & 3;
    float _2729 = fma(_2717, _2697, _2717);
    float _2731 = _2659 * _2691;
    float _2733 = _2563 + 0.5;
    int _2735 = _1573 + _2727;
    float _2737 = fma(_2729, _1979, _2715);
    float _2739 = _2695 * 6.283185482025146484375;
    float _2741 = sin(_2739);
    int _2743 = ~_2081;
    int _2745 = _2743 + _2143;
    int _2747 = _2745 + 1;
    out.m_73.x = _2725;
    out.m_73.y = _2733;
    out.m_73.z = _2719;
    int _2749 = _2735 >> 2;
    float _2751 = _2737 * 0.15915493667125701904296875;
    float _2753 = fma(_1591, _2443, _1585);
    int _2755 = ~_2089;
    int _2757 = _2755 + _2163;
    int _2759 = _2757 + 1;
    int _2761 = _536 * _2747;
    int _2763 = _2761 + _1075;
    int _2765 = _2749 << 4;
    int _2767 = _2765 + 656;
    float _2769 = _2753 + 0.5;
    float _2771 = _2695 * 6.283185482025146484375;
    float _2773 = cos(_2771);
    float _2775 = _2649;
    if (!_2513)
    {
        _2775 = as_type<float>(_2631);
    }
    float _2777 = _2775;
    int _2779 = _562 * _2759;
    int _2781 = _2779 + _1141;
    int _2783 = abs(_2197);
    uint _2785 = uint(int(uint(_2767) >> uint(2)));
    uint _2787 = uint(int(uint(int(_2785)) >> uint(2)));
    int _2789 = int(_2785) & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    int _2793 = int(_2785) + 1;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    int _2797 = _2793 & 3;
    float _2799 = (*spvDescriptorSet0.vp_c9)._m0[int(_2795)][_2797];
    out.m_75.x = _2769;
    out.m_75.y = _2721;
    if (!_2513)
    {
        _2585 = as_type<float>(_2607);
    }
    float _2801 = _2585;
    float _2803 = fma(_2399, _2483, _2613);
    float _2805 = _2707 * 6.283185482025146484375;
    float _2807 = cos(_2805);
    float _2809 = _2299 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2811 = fma(_2539, _2413, _2803);
    int _2813 = _2767 + 8;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    uint _2817 = uint(int(uint(int(_2815)) >> uint(2)));
    int _2819 = int(_2815) & 3;
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[int(_2817)][_2819];
    int _2823 = int(_2815) + 1;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    int _2827 = _2823 & 3;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[int(_2825)][_2827];
    float _2831 = _2751 * 6.283185482025146484375;
    float _2833 = cos(_2831);
    float _2835 = fma(_2541, _2373, _2811);
    float _2837 = fma(_2543, _2419, _2835);
    float _2839 = _2707 * 6.283185482025146484375;
    float _2841 = sin(_2839);
    float _2843 = _2807 * _2773;
    float _2845 = _2807 * _2741;
    float _2847 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2837);
    float _2849 = _2751 * 6.283185482025146484375;
    float _2851 = sin(_2849);
    float _2853 = _2807 * _2833;
    float _2855 = _2773 * _2833;
    out.m_77.x = _2847;
    float _2857 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2859 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2861 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2863 = _2841 * _2741;
    float _2865 = _2841 * _2773;
    float _2867 = _2841 * _2833;
    float _2869 = _2741 * _2833;
    float _2871 = _2853 * _2285;
    float _2873 = -_2845;
    float _2875 = fma(_2851, _2865, _2873);
    float _2877 = -_2865;
    float _2879 = fma(_2851, _2845, _2877);
    float _2881 = fma(_2851, _2843, _2863);
    float _2883 = -_2285;
    float _2885 = _2851 * _2883;
    float _2887 = _2867 * _2285;
    float _2889 = -_2851;
    float _2891 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2857);
    float _2893 = -_2851;
    float _2895 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2859);
    float _2897 = fma(_2855, _2283, _2885);
    float _2899 = fma(_2881, _2283, _2871);
    float _2901 = fma(_2875, _2283, _2887);
    float _2903 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2891);
    float _2905 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2895);
    int _2907 = abs(_1695);
    float _2909 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2911 = abs(_2187);
    float _2913 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2917 = ~_2907;
    int _2919 = _2917 + 1;
    int _2921 = _2919 + 1;
    float _2923 = fma(_2869, _2289, _2897);
    float _2925 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2909);
    float _2927 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2929 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    int _2931 = abs(_1641);
    int _2933 = _2921 * as_type<int>(_2799);
    int _2935 = ~_2911;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2943 = int(_2941);
    float _2945 = fma(_2879, _2289, _2899);
    float _2947 = fma(_2851, _2863, _2843);
    int _2949 = _2939 * as_type<int>(_2791);
    int _2951 = _2949 + _2933;
    int _2953 = ~_2931;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    float _2959 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2961 = fma(_2947, _2289, _2901);
    float _2963 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    int _2965 = abs(_1777);
    int _2967 = _2957 * as_type<int>(_2821);
    int _2969 = _2967 + _2951;
    float _2971 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2929);
    float _2975 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2977 = ~_2783;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    float _2983 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    float _2985 = float(uint(_2943));
    float _2987 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2975);
    int _2989 = abs(_2943);
    int _2991 = _2981 * as_type<int>(_2829);
    int _2993 = _2991 + _2969;
    int _2995 = _1653 >> 31;
    float _2997 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2983);
    float _2999 = 1.0 / _2985;
    int _3001 = _1721 >> 31;
    float _3003 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2987);
    int _3005 = _2995 & 3;
    float _3007 = _2997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3009 = ~_2965;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    float _3015 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2925);
    int _3017 = _3001 & 3;
    float _3019 = _2457 + _3007;
    float _3021 = float(uint(_2989));
    int _3023 = _3013 * _2993;
    float _3025 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3027 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3029 = -_2851;
    float _3031 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    int _3033 = _2169 * _2965;
    int _3035 = _3033 + _3023;
    float _3037 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3039 = 1.0 / _3021;
    int _3041 = _1653 + _3005;
    float _3043 = _2469 + _3025;
    int _3045 = _1721 + _3017;
    float _3047 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2959);
    float _3049 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3051 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3037);
    int _3053 = _3041 >> 2;
    float _3055 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3057 = _3045 >> 2;
    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3061 = _3019 + _3059;
    int _3063 = as_type<int>(_2999) + (-2);
    float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3067 = _3043 + _3065;
    float _3069 = float(uint(_3035));
    float _3071 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3031);
    int _3073 = _3053 << 4;
    int _3075 = _3073 + 368;
    float _3077 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3055);
    int _3079 = _3057 << 4;
    int _3081 = _3079 + 800;
    float _3083 = _3061 * _3061;
    int _3085 = abs(_3035);
    float _3087 = _3067 * _3067;
    float _3089 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3091 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3093 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3051);
    float _3095 = as_type<float>(_3063) * _3069;
    int _3097 = as_type<int>(_3039) + (-2);
    float _3099 = _3083 + _3087;
    float _3101 = _2905 * _2801;
    int _3103 = ~_2943;
    int _3105 = _3103 + 1;
    float _3107 = trunc(_3095);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    float _3113 = float(uint(_3085));
    float _3115 = fma(_3091, _2599, _3101);
    float _3117 = _2903 * _2801;
    out.m_79.x = _3089;
    out.m_79.y = _3091;
    out.m_79.z = _3093;
    float _3119 = as_type<float>(_3097) * _3113;
    float _3121 = fma(_3089, _2599, _3117);
    float _3123 = sqrt(_3099);
    float _3125 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3077);
    uint _3127 = uint(int(uint(_3075) >> uint(2)));
    uint _3129 = uint(int(uint(int(_3127)) >> uint(2)));
    int _3131 = int(_3127) & 3;
    float _3133 = (*spvDescriptorSet0.vp_c9)._m0[int(_3129)][_3131];
    int _3135 = int(_3127) + 1;
    uint _3137 = uint(int(uint(_3135) >> uint(2)));
    int _3139 = _3135 & 3;
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[int(_3137)][_3139];
    bool _3143 = !_1769;
    int _3145 = _3143 ? 0 : 1;
    bool _3147 = _1675 != 3;
    float _3149 = trunc(_3119);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    int _3155 = _3105 * int(_3111);
    int _3157 = _3155 + _3035;
    int _3159 = _3075 + 8;
    uint _3161 = uint(int(uint(_3159) >> uint(2)));
    uint _3163 = uint(int(uint(int(_3161)) >> uint(2)));
    int _3165 = int(_3161) & 3;
    float _3167 = (*spvDescriptorSet0.vp_c9)._m0[int(_3163)][_3165];
    int _3169 = int(_3161) + 1;
    uint _3171 = uint(int(uint(_3169) >> uint(2)));
    int _3173 = _3169 & 3;
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[int(_3171)][_3173];
    float _3177 = _3071 * _2801;
    float _3179 = fma(_3093, _2599, _3177);
    bool _3181 = _3123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _3183 = uint(int(uint(_3081) >> uint(2)));
    uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
    int _3187 = int(_3183) & 3;
    float _3189 = (*spvDescriptorSet0.vp_c9)._m0[int(_3185)][_3187];
    int _3191 = int(_3183) + 1;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    int _3195 = _3191 & 3;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[int(_3193)][_3195];
    float _3199 = _1649 * _1649;
    float _3201 = _3125 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3203 = float(uint(_3157));
    float _3205 = _3199 * _3199;
    float _3207 = _2809 + _3201;
    int _3209 = _3081 + 8;
    uint _3211 = uint(int(uint(_3209) >> uint(2)));
    uint _3213 = uint(int(uint(int(_3211)) >> uint(2)));
    int _3215 = int(_3211) & 3;
    float _3217 = (*spvDescriptorSet0.vp_c9)._m0[int(_3213)][_3215];
    int _3219 = int(_3211) + 1;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    int _3223 = _3219 & 3;
    float _3225 = (*spvDescriptorSet0.vp_c9)._m0[int(_3221)][_3223];
    float _3227 = as_type<float>(_3063) * _3203;
    float _3229 = -_3205;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[193].x, _3207);
    float _3233 = _2801;
    float _3235 = _3207;
    float _3237 = _3083;
    float _3239 = _2973;
    if (!_3181)
    {
        _2603 = _3019;
    }
    float _3241 = _2603;
    float _3243 = _3241;
    if (!_3181)
    {
        _3233 = _3043;
    }
    float _3245 = _3233;
    float _3247 = _3245;
    if (!_3181)
    {
        _3235 = _3231;
    }
    float _3249 = _3235;
    int _3251 = ~_2989;
    int _3253 = _3251 + 1;
    int _3255 = _3253 * int(_3153);
    int _3257 = _3255 + _3085;
    float _3259 = as_type<float>(_3253);
    float _3261 = _3249;
    if (!_3181)
    {
        _3259 = _3087;
    }
    float _3263 = _3259;
    float _3265 = float(uint(_3257));
    bool _3267 = !_3181;
    float _3269 = _3263;
    if (!_3267)
    {
        float _3271 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3275 = _3123 + _3273;
        float _3277 = rsqrt(_3099);
        float _3279 = _3275 * _3271;
        float _3281 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3283 = _3279 * 0.15915493667125701904296875;
        float _3285 = _3283 * 6.283185482025146484375;
        float _3287 = sin(_3285);
        float _3289 = _3283 * 6.283185482025146484375;
        float _3291 = cos(_3289);
        float _3293 = fma(_3287, _3281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3295 = _3277 * _3293;
        float _3297 = _3291 + (-1.0);
        float _3299 = fma(_3061, _3295, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3301 = fma(_3067, _3295, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3307 = _3299 + _3305;
        float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3311 = _3301 + _3309;
        float _3313 = fma(_3231, _3291, _3303);
        float _3315 = _3307 * _3307;
        float _3317 = _3311 * _3311;
        _3261 = _3313;
        _3237 = _3315;
        _3269 = _3317;
        _3243 = _3299;
        _3247 = _3301;
    }
    float _3319 = _3261;
    float _3321 = _3237;
    float _3323 = _3269;
    float _3325 = _3243;
    float _3327 = _3247;
    float _3329 = as_type<float>(_3097) * _3265;
    bool _3331 = !_1855;
    int _3333 = _3331 ? 0 : 1;
    float _3335 = trunc(_3227);
    float _3337 = precise::max(_3335, 0.0);
    uint _3339 = uint(_3337);
    int _3341 = abs(_1911);
    float _3343 = fma(_2973, _2777, _3179);
    int _3345 = abs(_1817);
    int _3347 = abs(_3145);
    int _3349 = abs(_3333);
    float _3351 = trunc(_3329);
    float _3353 = precise::max(_3351, 0.0);
    uint _3355 = uint(_3353);
    int _3357 = ~_3345;
    int _3359 = _3357 + 1;
    int _3361 = _3359 + 1;
    int _3363 = _3361 * as_type<int>(_3141);
    int _3365 = ~_3347;
    int _3367 = _3365 + 1;
    int _3369 = _3367 + 1;
    float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3373 = _3319 + _3371;
    int _3375 = ~_3341;
    int _3377 = _3375 + 1;
    int _3379 = _3377 + 1;
    int _3381 = _3369 * as_type<int>(_3133);
    int _3383 = _3381 + _3363;
    int _3385 = ~_3349;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    float _3391 = fma(_3373, _3373, _3321);
    int _3393 = ~_2943;
    int _3395 = _3393 + 1;
    int _3397 = _3379 * as_type<int>(_3197);
    int _3399 = abs(_1749);
    float _3401 = _3391 + _3323;
    bool _3403 = !_3147;
    int _3405 = _3403 ? 0 : (-1);
    int _3407 = _3389 * as_type<int>(_3189);
    int _3409 = _3407 + _3397;
    int _3411 = int(_3111) + int(_3339);
    float _3413 = sqrt(_3401);
    int _3415 = abs(_3405);
    int _3417 = ~_3399;
    int _3419 = _3417 + 1;
    int _3421 = _3419 + 1;
    int _3423 = _3395 * _3411;
    int _3425 = _3423 + _3035;
    int _3427 = int(_3153) + int(_3355);
    int _3429 = _3421 * as_type<int>(_3167);
    int _3431 = _3429 + _3383;
    int _3433 = ~_2989;
    int _3435 = _3433 + 1;
    int _3437 = abs(_1835);
    bool _3439 = uint(_3425) >= uint(_2943);
    int _3441 = _3435 * _3427;
    int _3443 = _3441 + _3085;
    int _3445 = ~_3415;
    int _3447 = _3445 + 1;
    int _3449 = _3447 + 1;
    bool _3451 = _1729 != 3;
    int _3453 = ~_3437;
    int _3455 = _3453 + 1;
    int _3457 = _3455 + 1;
    int _3459 = _3449 * as_type<int>(_3175);
    int _3461 = _3459 + _3431;
    bool _3463 = !_3439;
    int _3465 = _3463 ? 0 : (-1);
    bool _3467 = !_3451;
    int _3469 = _3467 ? 0 : (-1);
    int _3471 = _3457 * as_type<int>(_3217);
    int _3473 = _3471 + _3409;
    int _3475 = ~_3411;
    int _3477 = _3475 + _3465;
    int _3479 = _3477 + 1;
    bool _3481 = uint(_3443) >= uint(_2989);
    bool _3483 = !_2207;
    int _3485 = _3483 ? 0 : 1;
    int _3487 = _3035 ^ _2943;
    int _3489 = abs(_3469);
    bool _3491 = _2943 == 0;
    bool _3493 = _2943 == 0;
    int _3495 = _2943 * _3479;
    int _3497 = _3495 + _3035;
    bool _3499 = !_3481;
    int _3501 = _3499 ? 0 : (-1);
    float _3503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3505 = abs(_3485);
    uint _3507 = uint(int(uint(_3487) >> uint(31)));
    int _3509 = ~_3501;
    int _3511 = _3427 + _3509;
    int _3513 = _3511 + 1;
    float _3515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3517 = ~_3489;
    int _3519 = _3517 + 1;
    int _3521 = _3519 + 1;
    int _3523 = ~int(_3507);
    int _3525 = _3523 + 1;
    int _3527 = ~_3505;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    int _3533 = _3521 * as_type<int>(_3225);
    int _3535 = _3533 + _3473;
    bool _3537 = !_2215;
    int _3539 = _3537 ? 0 : 1;
    int _3541 = _3513 ^ _3525;
    int _3543 = _3531 * _3461;
    int _3545 = abs(_3539);
    float _3547 = _3503 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3549 = !_3491;
    int _3551 = _3549 ? _3497 : (-1);
    int _3553 = ~_3525;
    int _3555 = _3553 + _3541;
    int _3557 = _3555 + 1;
    float _3559 = fma(_3547, _646, -0.5);
    int _3561 = ~_3545;
    int _3563 = _3561 + 1;
    int _3565 = _3563 + 1;
    bool _3567 = _536 == 0;
    float _3569 = float(_3551);
    int _3571 = _3565 * _3535;
    bool _3573 = !_3493;
    int _3575 = _3573 ? _3557 : (-1);
    bool _3577 = _562 == 0;
    float _3579 = fma(_3547, _3569, _1741);
    float _3581 = float(_3575);
    float _3583 = _3515 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3585 = !_3567;
    int _3587 = _3585 ? _2763 : (-1);
    float _3589 = -_3015;
    float _3591 = _2723 * _3589;
    bool _3593 = !_3577;
    int _3595 = _3593 ? _2781 : (-1);
    float _3597 = fma(_3583, _1827, -0.5);
    float _3599 = -_1957;
    float _3601 = fma(_3583, _3581, _3599);
    float _3603 = -_2963;
    float _3605 = _2723 * _3603;
    int _3607 = _3587 * _3505;
    int _3609 = _3607 + _3543;
    float _3611 = -_2973;
    float _3613 = _2723 * _3611;
    int _3615 = _3595 * _3545;
    int _3617 = _3615 + _3571;
    float _3619 = fma(_1881, _3559, _3579);
    float _3621 = fma(_1913, _3597, _3601);
    float _3623 = fma(_2731, _2903, _3591);
    float _3625 = fma(_2731, _2905, _3605);
    float _3627 = fma(_2731, _3071, _3613);
    float _3629 = fma(_3015, _2777, _3121);
    float _3631 = fma(_2963, _2777, _3115);
    float _3633 = float(_3609);
    float _3635 = _3619 + 0.5;
    float _3637 = float(_3617);
    float _3639 = _3621 + 0.5;
    out.m_81.x = _3623;
    out.m_81.y = _3625;
    out.m_81.z = _3627;
    bool _3641 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3643 = isnan(_3413);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3649 = _3645 || _3647;
    out.m_83.x = _3633;
    out.m_83.w = _3637;
    out.m_85.x = _3635;
    out.m_85.y = _3639;
    float _3651 = as_type<float>(_3609);
    if (!_3649)
    {
        _3651 = 1.0;
    }
    float _3653 = _3651;
    out.m_87.x = _3629;
    out.m_87.y = _3631;
    out.m_87.z = _3343;
    bool _3655 = !_3649;
    float _3657 = _3653;
    if (!_3655)
    {
        bool _3659 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3661 = isnan(_3413);
        bool _3663 = _3659 || _3661;
        bool _3665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3667 = _3663 || _3665;
        if (!_3667)
        {
            float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3671 = _3413 + _3669;
            float _3673 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3675 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3673;
            float _3677 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3679 = _3677 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3681 = 1.0 / _3675;
            float _3683 = _3671 * _3681;
            float _3685 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3657 = _3685;
            _3687 = true;
        }
        else
        {
            bool _3689 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3691 = isnan(_3413);
            bool _3693 = _3689 || _3691;
            bool _3695 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3697 = _3693 || _3695;
            if (!_3697)
            {
                float _3699 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3701 = _3413 + _3699;
                float _3703 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3705 = _3703 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3707 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3709 = _3707 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3711 = 1.0 / _3705;
                float _3713 = _3701 * _3711;
                float _3715 = fma(_3713, _3709, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3657 = _3715;
                _3687 = true;
            }
            else
            {
                _3657 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3687 = false;
    float _3717 = _3657;
    float _3719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3721 = _3319 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3725 = _3325 + _3723;
    float _3727 = fma(_3721, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3729 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3731 = _3327 + _3729;
    float _3733 = fma(_3725, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3735 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3739 = _3727 + _3737;
    float _3741 = fma(_3731, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3743 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3745 = _3733 + _3743;
    float _3747 = floor(_3735);
    float _3749 = _3739 * _3739;
    float _3751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3753 = _3741 + _3751;
    float _3755 = fma(_3745, _3745, _3749);
    float _3757 = fma(_3753, _3753, _3755);
    float _3759 = rsqrt(_3757);
    float _3761 = -_3747;
    float _3763 = _3735 + _3761;
    float _3765 = sqrt(_3757);
    float _3767 = _3759 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3769 = _3745 * _3767;
    float _3771 = _3753 * _3767;
    float _3773 = _3769 * _3769;
    float _3775 = _3771 * _3771;
    float _3777 = _3773 + _3775;
    float _3779 = sqrt(_3777);
    bool _3781 = _3779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3785 = _3779 + _3783;
    float _3787 = _3753;
    float _3789 = _3777;
    float _3791 = _3785;
    float _3793 = _3755;
    if (_3781)
    {
        float _3795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3787 = _3795;
    }
    float _3797 = _3787;
    if (_3781)
    {
        float _3799 = rsqrt(_3777);
        _3789 = _3799;
    }
    float _3801 = _3789;
    if (_3781)
    {
        float _3803 = _3785 * _3797;
        _3791 = _3803;
    }
    float _3805 = _3791;
    if (_3781)
    {
        float _3807 = _3805 * 0.15915493667125701904296875;
        _3793 = _3807;
    }
    float _3809 = _3793;
    float _3811 = _3759;
    float _3813 = _3809;
    if (_3781)
    {
        float _3815 = _3809 * 6.283185482025146484375;
        float _3817 = sin(_3815);
        _3811 = _3817;
    }
    float _3819 = _3811;
    float _3821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3823 = precise::max(0.0, _3821);
    float _3825 = _3625;
    float _3827 = _3821;
    float _3829 = _3823;
    if (_3781)
    {
        float _3831 = _3809 * 6.283185482025146484375;
        float _3833 = cos(_3831);
        _3825 = _3833;
    }
    float _3835 = _3825;
    float _3837 = -_3767;
    float _3839 = -_3823;
    float _3841 = fma(_3739, _3837, _3839);
    float _3843 = (*spvDescriptorSet0.vp_c15)._m0[23].w;
    if (_3781)
    {
        float _3845 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3827 = _3845;
    }
    float _3847 = _3827;
    float _3849 = _3847;
    if (!_3781)
    {
        _3813 = _3769;
    }
    float _3851 = _3813;
    float _3853 = _3819;
    float _3855 = _3851;
    if (_3781)
    {
        float _3857 = fma(_3819, _3847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3239 = _3857;
    }
    float _3859 = _3239;
    float _3861 = _3859;
    if (!_3781)
    {
        _3853 = _3841;
    }
    float _3863 = _3853;
    float _3865 = _3863;
    if (_3781)
    {
        float _3867 = _3835 + (-1.0);
        _3829 = _3867;
    }
    float _3869 = _3829;
    float _3871 = _3869;
    if (_3781)
    {
        float _3873 = _3801 * _3859;
        _3861 = _3873;
    }
    float _3875 = _3861;
    if (_3781)
    {
        float _3877 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3849 = _3877;
    }
    float _3879 = _3849;
    float _3881 = _3879;
    if (_3781)
    {
        float _3883 = _3769 * _3875;
        _3855 = _3883;
    }
    float _3885 = _3855;
    if (!_3781)
    {
        _3871 = _3771;
    }
    float _3887 = _3871;
    float _3889 = _3887;
    if (_3781)
    {
        float _3891 = _3771 * _3875;
        _3889 = _3891;
    }
    float _3893 = _3889;
    if (_3781)
    {
        float _3895 = fma(_3841, _3835, _3879);
        _3865 = _3895;
    }
    float _3897 = _3865;
    if (!_3781)
    {
        _3881 = _3773;
    }
    float _3899 = _3881;
    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3903 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3901);
    float _3905 = precise::clamp(_3903, 0.0, 1.0);
    float _3907 = _3899;
    if (_3781)
    {
        float _3909 = _3885 * _3885;
        _3907 = _3909;
    }
    float _3911 = _3907;
    if (!_3781)
    {
        _3843 = _3775;
    }
    float _3913 = _3843;
    float _3915 = _3913;
    if (_3781)
    {
        float _3917 = _3893 * _3893;
        _3915 = _3917;
    }
    float _3919 = _3915;
    float _3921 = -_3905;
    float _3923 = _3921 + 1.0;
    float _3925 = fma(_3897, _3897, _3911);
    float _3927 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3929 = abs(_3923);
    float _3931 = log2(_3929);
    float _3933 = _3925 + _3919;
    float _3935 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3937 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3939 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3935);
    float _3941 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3943 = rsqrt(_3933);
    float _3945 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3947 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3939);
    float _3949 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3941);
    float _3951 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3953 = _3947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3955 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3945);
    float _3957 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3949);
    float _3959 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3927);
    float _3961 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3963 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3955);
    float _3965 = _3957 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3967 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3959);
    float _3969 = -_3961;
    float _3971 = fma(_3969, _3951, 1.0);
    float _3973 = _3963 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3975 = _3943 * _3885;
    float _3977 = _3967 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3979 = _3943 * _3897;
    float _3981 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3983 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3985 = _3943 * _3893;
    float _3987 = log2(_3971);
    float _3989 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3981);
    float _3991 = -_3983;
    float _3993 = fma(_3979, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3991);
    float _3995 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3997 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3989);
    float _3999 = -_3985;
    float _4001 = fma(_3999, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3993);
    float _4003 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4005 = exp2(_3995);
    float _4007 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3997);
    float _4009 = fma(_4001, -0.5, 0.5);
    float _4011 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4003);
    float _4013 = fma(_4001, 0.5, 0.5);
    float _4015 = _3979 + 1.0;
    float _4017 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4011);
    float _4019 = 1.0 / _4007;
    float _4021 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4023 = fma(_4013, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4025 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4017);
    float _4027 = _3987 * 0.693147182464599609375;
    float _4029 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4021);
    float _4031 = fma(_4013, _4023, -0.212114393711090087890625);
    float _4033 = sqrt(_4009);
    float _4035 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4029);
    float _4037 = -_3979;
    float _4039 = fma(_4005, _4015, _4037);
    float _4041 = fma(_4013, _4031, 1.570728778839111328125);
    float _4043 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4045 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4035);
    float _4047 = fma(_4039, 0.5, 0.5);
    float _4049 = floor(_3937);
    float _4051 = _4025 * _4019;
    float _4053 = _4045 * _4019;
    float _4055 = fma(_4051, 0.5, 0.5);
    float _4057 = fma(_4053, -0.5, 0.5);
    float _4059 = _4033 * 0.636619746685028076171875;
    float _4061 = -_4041;
    float _4063 = fma(_4059, _4061, 1.0);
    float _4065 = -_4049;
    float _4067 = _3937 + _4065;
    float2 _10529 = float2(_3763, _4067);
    float _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10529, float2(0.0), isnan(_10529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10529, float2(0.0), isnan(_10529)), level(0.0)).x;
    float3 _10540 = float3(_4055, _4057, _4043);
    float _4071 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10540, float3(0.0), isnan(_10540)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10540, float3(0.0), isnan(_10540)), level(0.0)).x;
    float3 _10551 = float3(_4055, _4057, _4043);
    float4 _4074 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10551, float3(0.0), isnan(_10551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10551, float3(0.0), isnan(_10551)), level(0.0)).xyzw;
    float _4076 = _4074.x;
    float _4078 = _4074.y;
    float _4080 = _4074.z;
    float _4082 = _4074.w;
    float2 _10567 = float2(_4063, _4047);
    float3 _4086 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10567, float2(0.0), isnan(_10567)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10567, float2(0.0), isnan(_10567)), level(0.0)).xyz;
    float _4088 = _4086.x;
    float _4090 = _4086.y;
    float _4092 = _4086.z;
    float _4094 = _2809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4096 = _2809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4098 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4100 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4094);
    float _4102 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4096);
    float _4104 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4098);
    float _4106 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4100);
    float _4108 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4102);
    float _4110 = in.m_89.x;
    float _4112 = _4106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4114 = _4108 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4116 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4118 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4104);
    float _4120 = 1.0 / _4112;
    float _4122 = _4114 + _4112;
    float _4124 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4118);
    float _4126 = exp2(_4116);
    float _4128 = _4122 * _4120;
    float _4130 = _4128 * 0.5;
    float _4132 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4134 = fma(_4130, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4132);
    bool _4136 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4138 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4140 = _4136 || _4138;
    bool _4142 = isnan(0.5);
    bool _4144 = _4140 || _4142;
    float _4146 = 1.0 / _4134;
    float _4148 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4150 = _4146 * _4148;
    float _4152 = abs(_4150);
    float _4154 = log2(_4152);
    bool _4156 = _4150 <= 8000.0;
    bool _4158 = isnan(_4150);
    bool _4160 = _4156 || _4158;
    bool _4162 = isnan(8000.0);
    bool _4164 = _4160 || _4162;
    float _4166 = float(_4164);
    float _4168 = _4154 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4170 = exp2(_4168);
    float _4172 = fma(_4170, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4174 = precise::clamp(_4172, 0.0, 1.0);
    float _4176 = fma(_4174, -2.0, 3.0);
    float _4178 = _4174 * _4174;
    float _4180 = _4178 * _4176;
    float _4182 = -_4180;
    float _4184 = _4182 + 1.0;
    float _4186 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4180);
    float _4188 = _4124 + _4007;
    float _4190 = _4188 * 0.5;
    float _4192 = _4188;
    float _4194 = _4124;
    float _4196 = _4045;
    float _4198 = _4025;
    if (_4144)
    {
        _4192 = 1.0;
    }
    float _4200 = _4192;
    float _4202 = _4200;
    if (!_4144)
    {
        float _4204 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4206 = _4204 * 0.15915493667125701904296875;
        float _4208 = _4206 * 6.283185482025146484375;
        float _4210 = cos(_4208);
        float _4212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4214 = _4212 * 0.15915493667125701904296875;
        float _4216 = _4206 * 6.283185482025146484375;
        float _4218 = sin(_4216);
        float _4220 = 1.0 / _4210;
        float _4222 = _4214 * 6.283185482025146484375;
        float _4224 = cos(_4222);
        float _4226 = _4218 * _4220;
        float _4228 = _4214 * 6.283185482025146484375;
        float _4230 = sin(_4228);
        float _4232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4234 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4232;
        float _4236 = _4224 * _4226;
        float _4238 = 1.0 / _4234;
        float _4240 = 1.0 / _4236;
        float _4242 = _4230 * _4240;
        float _4244 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4246 = fma(_4150, _4242, _4244);
        float _4248 = _4246 * _4238;
        float _4250 = precise::clamp(_4248, 0.0, 1.0);
        _4202 = _4250;
    }
    float _4252 = _4202;
    float _4254 = _4166 * _4186;
    float _4256 = -_4126;
    float _4258 = _4256 + 1.0;
    float _4260 = -_4069;
    float _4262 = _4260 + 1.0;
    float _4264 = _4254 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4266 = _4258 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.z = _4190;
    out.m_91.w = _4007;
    bool _4268 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4270 = isnan(_3765);
    bool _4272 = _4268 || _4270;
    bool _4274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4276 = _4272 || _4274;
    float _4278 = _4262 * _4264;
    float _4280 = precise::clamp(_4278, 0.0, 1.0);
    float _4282 = _4266 * _4071;
    float _4284 = -_4266;
    float _4286 = _4284 + 1.0;
    float _4288 = -_4280;
    float _4290 = fma(_4288, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4292 = _4082 * _4282;
    float _4294 = _4092 * _4282;
    float _4296 = _4082 * _4286;
    float _4298 = _4290 * _4110;
    float _4300 = fma(_4088, _4292, _4076);
    float _4302 = fma(_4090, _4292, _4078);
    float _4304 = fma(_4082, _4294, _4080);
    float _4306 = _4298 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _4025;
    out.gl_Position.y = _4045;
    out.gl_Position.z = _4124;
    out.gl_Position.w = _4007;
    float _4308 = _4252 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _4306;
    out.m_95.x = _4300;
    out.m_95.y = _4302;
    out.m_95.z = _4304;
    out.m_95.w = _4296;
    if (!_4276)
    {
        _4194 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4310 = _4194;
    float _4312 = _4310;
    float _4314 = _4310;
    if (!_4276)
    {
        _4196 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4316 = _4196;
    float _4318 = _4316;
    float _4320 = _4316;
    if (!_4276)
    {
        _4198 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4322 = _4198;
    bool _4324 = !_4276;
    float _4326 = _4322;
    float _4328 = _4322;
    if (!_4324)
    {
        bool _4330 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4332 = isnan(_3765);
        bool _4334 = _4330 || _4332;
        bool _4336 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4338 = _4334 || _4336;
        if (!_4338)
        {
            float _4340 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4342 = _3765 + _4340;
            float _4344 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4346 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4344;
            float _4348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4350 = _4348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4352 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4354 = _4352 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4356 = 1.0 / _4346;
            float _4358 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4360 = _4358 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4362 = _4342 * _4356;
            float _4364 = precise::clamp(_4362, 0.0, 1.0);
            float _4366 = fma(_4364, _4350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4368 = fma(_4364, _4354, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4370 = fma(_4364, _4360, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4320 = _4368;
            _4314 = _4366;
            _4328 = _4370;
            _4372 = true;
        }
        else
        {
            bool _4374 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4376 = isnan(_3765);
            bool _4378 = _4374 || _4376;
            bool _4380 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4382 = _4378 || _4380;
            if (!_4382)
            {
                _4312 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4384 = _4312;
            _4314 = _4384;
            if (!_4382)
            {
                _4318 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4386 = _4318;
            _4320 = _4386;
            if (!_4382)
            {
                _4326 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4388 = _4326;
            bool _4390 = !_4382;
            _4328 = _4388;
            if (!_4390)
            {
                bool _4392 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4394 = isnan(_3765);
                bool _4396 = _4392 || _4394;
                bool _4398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4400 = _4396 || _4398;
                if (!_4400)
                {
                    float _4402 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4404 = _3765 + _4402;
                    float _4406 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4408 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4406;
                    float _4410 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4412 = _4410 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4416 = _4414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4418 = 1.0 / _4408;
                    float _4420 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4422 = _4420 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4424 = _4404 * _4418;
                    float _4426 = precise::clamp(_4424, 0.0, 1.0);
                    float _4428 = fma(_4426, _4412, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4430 = fma(_4426, _4416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4432 = fma(_4426, _4422, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4320 = _4430;
                    _4314 = _4428;
                    _4328 = _4432;
                    _4372 = true;
                }
                else
                {
                    _4320 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4314 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4328 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4372 = false;
    float _4434 = _4320;
    float _4436 = _4314;
    float _4438 = _4328;
    float _4440 = _4308 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_97.x = 0.0;
    float _4442 = _4434 * 0.586610972881317138671875;
    bool _4444 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4440;
    float _4446 = fma(_4436, 0.298911988735198974609375, _4442);
    bool _4448 = _4252 > 0.0;
    bool _4450 = isnan(_4252);
    bool _4452 = _4448 || _4450;
    bool _4454 = isnan(0.0);
    bool _4456 = _4452 || _4454;
    float _4458 = fma(_4438, 0.114477999508380889892578125, _4446);
    float _4460 = -_4458;
    float _4462 = _4460 + _4436;
    float _4464 = -_4458;
    float _4466 = _4464 + _4434;
    float _4468 = -_4458;
    float _4470 = _4468 + _4438;
    float _4472 = fma(_4462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    float _4474 = fma(_4466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    float _4476 = fma(_4470, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    bool _4478 = !_4444;
    if (!_4478)
    {
        float _4480 = -_3727;
        float _4482 = _4480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4484 = -_3733;
        float _4486 = _4484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4488 = -_3741;
        float _4490 = _4488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4492 = _4482 * _4482;
        float _4494 = fma(_4486, _4486, _4492);
        float _4496 = fma(_4490, _4490, _4494);
        float _4498 = sqrt(_4496);
        float _4500 = rsqrt(_4496);
        float _4502 = -_4498;
        float _4504 = _4502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4506 = _4504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4508 = precise::clamp(_4506, 0.0, 1.0);
        float _4510 = _4486 * _4500;
        float _4512 = _4482 * _4500;
        float _4514 = abs(_4508);
        float _4516 = log2(_4514);
        float _4518 = _4490 * _4500;
        float _4520 = _4510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4522 = _3631 * _4512;
        float _4524 = -_4512;
        float _4526 = -_4520;
        float _4528 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4526);
        float _4530 = fma(_3629, _4510, _4522);
        float _4532 = -_4518;
        float _4534 = fma(_4532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4528);
        float _4536 = fma(_3343, _4518, _4530);
        float _4538 = precise::clamp(_4536, 0.0, 1.0);
        float _4540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4542 = _4534 + _4540;
        float _4544 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4546 = _4542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4548 = precise::clamp(_4546, 0.0, 1.0);
        float _4550 = exp2(_4544);
        float _4552 = _4550 * _4548;
        float _4554 = _4538 * _4552;
        float _4556 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4558 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4560 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _4556;
        out.m_97.y = _4558;
        out.m_97.z = _4560;
    }
    out.m_99.x = _4472;
    out.m_99.y = _4474;
    out.m_99.z = _4476;
    if (_4456)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _4562 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4562;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4372 = false;
    bool _3687 = false;
    bool _296 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = in.m_50.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    float _134 = _124;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _130;
    if (!_128)
    {
        out.m_55.x = 0.0;
    }
    int _138 = 0;
    if (!_128)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4630 = as_type<float>(_142);
        out.gl_Position.z = _4630;
    }
    if (!_128)
    {
        return out;
    }
    bool _146 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_115);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = float(_120);
    bool _158 = _124 >= _156;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    float _164 = 1.0 / _156;
    if (_162)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _132;
    if (_162)
    {
        out.m_55.x = 0.0;
    }
    float _168 = _124 * _164;
    float _170 = _168;
    if (_162)
    {
        float _172 = _166 * 5.0;
        _144 = as_type<int>(_172);
    }
    int _174 = _144;
    out.m_53.x = _168;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4693 = as_type<float>(_174);
        out.gl_Position.z = _4693;
    }
    if (_162)
    {
        return out;
    }
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _178 = !_176;
    float _196;
    if (!_178)
    {
        float _180 = in.m_57.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _168;
    }
    _198 = false;
    float _200 = _196;
    bool _202 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _204 = isnan(_200);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _218 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _220 = isnan(_200);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _236 = _200 + _234;
    float _238 = -_212;
    float _240 = _238 + 1.0;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _244 = 1.0 / _216;
    float _246 = _228 * _240;
    float _248 = -_228;
    float _250 = _248 + 1.0;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _258 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _260 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _262 = _256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _232 * _244;
    float _266 = fma(_264, _236, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _268 = _266 * _246;
    float _270 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _268);
    float _272 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[116].x, _270);
    float _274 = _272 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _276 = !_242;
    float _294;
    if (!_276)
    {
        float _278 = in.m_57.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        _294 = _168;
    }
    _296 = false;
    float _298 = _294;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _316 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _318 = isnan(_298);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _306;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _334 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _336 = isnan(_298);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _348 = 1.0 / _314;
    float _350 = _310 * _328;
    bool _352 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _354 = isnan(_298);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _332;
    float _366 = -_326;
    float _368 = _366 + 1.0;
    float _370 = fma(_350, _302, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _376 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _378 = isnan(_298);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_362;
    float _390 = _388 + 1.0;
    float _392 = _362 * _368;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _398 = 1.0 / _374;
    float _400 = -_386;
    float _402 = _400 + 1.0;
    float _404 = _344 * _390;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _406;
    float _410 = _396 * _348;
    float _412 = _326 * _402;
    float _414 = _370 * _404;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _418 = _298 + _416;
    float _420 = -_344;
    float _422 = _420 + 1.0;
    bool _424 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _426 = isnan(_298);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _408 * _364;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _444 = _298 + _442;
    float _446 = fma(_410, _418, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _448 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[131].x, _414);
    float _450 = -_434;
    float _452 = _450 + 1.0;
    float _454 = _440 * _398;
    float _456 = fma(_436, _444, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _460 = _298 + _458;
    float _462 = fma(_446, _392, _448);
    float _464 = _386 * _452;
    float _466 = fma(_454, _460, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _468 = fma(_456, _412, _462);
    float _470 = fma(_466, _464, _468);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _478 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[135].x, _470);
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = _478 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _488 = !_346;
    int _490 = as_type<int>(_364);
    int _492 = as_type<int>(_398);
    if (!_488)
    {
        float _494 = in.m_57.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _170 = _508;
    }
    float _510 = _170;
    float _512 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _514 = int(_512);
    float _516 = in.m_59.x;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _520 = _518 != 0;
    float _522 = in.m_57.y;
    float _524 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _526 = int(_524);
    float _528 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _530 = int(_528);
    float _532 = float(_514);
    float _534 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _536 = int(_534);
    float _538 = float(_526);
    float _540 = 0.0;
    float _542 = _516;
    if (!_520)
    {
        _540 = _516;
    }
    float _544 = _540;
    float _546 = 1.0 / _532;
    float _548 = float(_530);
    float _550 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _552 = int(_550);
    float _554 = float(uint(_536));
    float _556 = 1.0 / _538;
    float _558 = _546 * _124;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _562 = int(_560);
    float _564 = float(uint(_552));
    float _566 = 1.0 / _548;
    float _568 = _556 * _124;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _572 = _570 != 0;
    float _574 = 1.0 / _554;
    float _576 = float(uint(_562));
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _584 = _582 != 0;
    bool _586 = _522 > 0.5;
    float _588 = 1.0 / _564;
    float _590 = _566 * _124;
    float _592 = 0.0;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _596 = _544;
    if (_572)
    {
        float _598 = in.m_57.x;
        _592 = _598;
    }
    float _600 = _592;
    float _602 = 0.0;
    if (_572)
    {
        _602 = 1.0;
    }
    float _604 = _602;
    float _606 = trunc(_558);
    int _608 = int(_606);
    int _610 = as_type<int>(_574) + (-2);
    float _612 = _604;
    if (_580)
    {
        float _614 = -_516;
        float _616 = _614 + 1.0;
        _490 = as_type<int>(_616);
    }
    int _618 = _490;
    float _620 = as_type<float>(_618);
    if (_584)
    {
        float _622 = -_516;
        float _624 = _622 + 1.0;
        _492 = as_type<int>(_624);
    }
    int _626 = _492;
    float _628 = as_type<float>(_626);
    if (!_580)
    {
        _594 = _516;
    }
    float _630 = _594;
    float _632 = 0.0;
    float _634 = _630;
    if (!_584)
    {
        _632 = _516;
    }
    float _636 = _632;
    float _638 = 1.0 / _576;
    int _640 = as_type<int>(_588) + (-2);
    float _642 = _636;
    if (_580)
    {
        float _644 = _586 ? as_type<float>(_618) : _516;
        _634 = _644;
    }
    float _646 = _634;
    if (_584)
    {
        float _648 = _586 ? as_type<float>(_626) : _516;
        _642 = _648;
    }
    float _650 = _642;
    if (_572)
    {
        _620 = 1.0;
    }
    float _652 = _620;
    float _654 = trunc(_590);
    int _656 = int(_654);
    float _658 = float(uint(_608));
    float _660 = as_type<float>(_640) * _658;
    float _662 = trunc(_568);
    int _664 = int(_662);
    int _666 = as_type<int>(_638) + (-2);
    float _668 = float(uint(_656));
    float _670 = trunc(_660);
    float _672 = precise::max(_670, 0.0);
    uint _675 = uint(_672);
    float _677 = as_type<float>(_666) * _668;
    int _679 = as_type<int>(_668);
    float _681 = _660;
    float _683 = _652;
    if (_572)
    {
        _679 = 0;
    }
    int _685 = _679;
    float _687 = float(uint(_664));
    float _689 = trunc(_677);
    float _691 = precise::max(_689, 0.0);
    uint _693 = uint(_691);
    float _695 = _600;
    int _697 = _685;
    if (_572)
    {
        _681 = _600;
    }
    float _699 = _681;
    float _701 = as_type<float>(_610) * _687;
    float _703 = 0.0;
    float _705 = _699;
    if (_572)
    {
        _703 = _699;
    }
    float _707 = _703;
    float _709 = _707;
    if (_572)
    {
        _628 = _699;
    }
    float _711 = _628;
    float _713 = trunc(_701);
    float _715 = precise::max(_713, 0.0);
    uint _717 = uint(_715);
    int _719 = int(_572);
    int _721 = _586 ? 2 : 0;
    int _723 = _719 | _721;
    int _725 = false ? 4 : 0;
    int _727 = _723 | _725;
    int _729 = false ? 8 : 0;
    int _731 = _727 | _729;
    int _733 = _580 ? 16 : 0;
    int _735 = _731 | _733;
    int _737 = false ? 32 : 0;
    int _739 = _735 | _737;
    int _741 = _584 ? 64 : 0;
    int _743 = _739 | _741;
    int _745 = _743 & 2;
    float _747 = as_type<float>(_745);
    float _749 = _711;
    if (_572)
    {
        _747 = _522;
    }
    float _751 = _747;
    float _753 = _751;
    if (!_572)
    {
        float _755 = in.m_57.x;
        float _757 = _522 * 3.1415927410125732421875;
        float _759 = in.m_57.z;
        float _761 = _757 * 0.15915493667125701904296875;
        float _763 = _761 * 6.283185482025146484375;
        float _765 = sin(_763);
        float _767 = _755 * 3.1415927410125732421875;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = sin(_771);
        _612 = 7.345489978790283203125;
        _695 = _755;
        _749 = _522;
        _709 = _759;
        _683 = 5.839270114898681640625;
        _753 = _765;
        _697 = 2;
        _705 = _773;
    }
    float _775 = _612;
    float _777 = _695;
    float _779 = _749;
    float _781 = _709;
    float _783 = _683;
    float _785 = _753;
    int _787 = _697;
    float _789 = _705;
    int _791 = ~_536;
    int _793 = _791 + 1;
    float _795 = _775 * _777;
    int _797 = ~_552;
    int _799 = _797 + 1;
    float _801 = _779 * _775;
    int _803 = ~_562;
    int _805 = _803 + 1;
    int _807 = _793 * int(_717);
    int _809 = _807 + _664;
    float _811 = _781 * _783;
    float _813 = floor(_795);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _817 = _815 != 0;
    float _819 = in.m_59.y;
    float _821 = float(uint(_809));
    int _823 = _799 * int(_675);
    int _825 = _823 + _608;
    int _827 = _805 * int(_693);
    int _829 = _827 + _656;
    bool _831 = _552 == 0;
    float _833 = as_type<float>(_610) * _821;
    float _835 = float(uint(_825));
    float _837 = floor(_801);
    float _839 = float(uint(_829));
    float _841 = in.m_57.z;
    float _843 = as_type<float>(_640) * _835;
    float _845 = as_type<float>(_666) * _839;
    float _847 = -_813;
    float _849 = _795 + _847;
    float _851 = floor(_811);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _857 = _777 * 2.0;
    float _859 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[93].w, _855);
    float _861 = _785 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _863 = trunc(_833);
    float _865 = precise::max(_863, 0.0);
    uint _867 = uint(_865);
    float _869 = -_837;
    float _871 = _801 + _869;
    float _873 = float(_536);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _877 = float(_664);
    float _879 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].w, _859);
    int _881 = ~_536;
    int _883 = _881 + 1;
    out.m_61.x = _258;
    out.m_61.y = _260;
    out.m_61.z = _262;
    out.m_61.w = _274;
    float _885 = trunc(_843);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    float _891 = -_851;
    float _893 = _811 + _891;
    float _895 = float(_552);
    out.m_63.x = _480;
    out.m_63.y = _482;
    out.m_63.z = _484;
    out.m_63.w = _486;
    float _897 = float(_608);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = _510 + _899;
    bool _903 = _877 >= _873;
    bool _905 = isnan(_877);
    bool _907 = _903 || _905;
    bool _909 = isnan(_873);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = _895 * _893;
    float _917 = trunc(_845);
    float _919 = precise::max(_917, 0.0);
    uint _921 = uint(_919);
    int _923 = int(_717) + int(_867);
    float _925 = _164 * _124;
    float _927 = float(_562);
    float _929 = _873 * _849;
    bool _931 = _897 >= _895;
    bool _933 = isnan(_897);
    bool _935 = _931 || _933;
    bool _937 = isnan(_895);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = _873 * _925;
    float _945 = _895 * _925;
    int _947 = int(_675) + int(_889);
    float _949 = _927 * _925;
    int _951 = ~_536;
    int _953 = _951 + 1;
    float _955 = _927 * _871;
    int _957 = ~_562;
    int _959 = _957 + 1;
    float _961 = trunc(_929);
    int _963 = int(_961);
    float _965 = float(_656);
    int _967 = _953 * _923;
    int _969 = _967 + _664;
    int _971 = int(_693) + int(_921);
    float _973 = in.m_65.x;
    float _975 = in.m_65.y;
    float _977 = in.m_65.z;
    int _979 = ~_552;
    int _981 = _979 + 1;
    bool _983 = _965 >= _927;
    bool _985 = isnan(_965);
    bool _987 = _983 || _985;
    bool _989 = isnan(_927);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    int _995 = _959 * _971;
    int _997 = _995 + _656;
    bool _999 = uint(_969) >= uint(_536);
    int _1001 = _981 * _947;
    int _1003 = _1001 + _608;
    float _1005 = trunc(_915);
    int _1007 = int(_1005);
    bool _1009 = !_999;
    int _1011 = _1009 ? 0 : (-1);
    bool _1013 = uint(_1003) >= uint(_552);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1017 = uint(_997) >= uint(_562);
    float _1019 = trunc(_993);
    int _1021 = int(_1019);
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1025 = _1023 != 0;
    float _1027 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1015);
    bool _1029 = !_817;
    int _1031 = _1029 ? 0 : 1;
    int _1033 = ~_923;
    int _1035 = _1033 + _1011;
    int _1037 = _1035 + 1;
    bool _1039 = !_1013;
    int _1041 = _1039 ? 0 : (-1);
    float _1043 = trunc(_913);
    int _1045 = int(_1043);
    bool _1047 = !_1025;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = _536 * _1037;
    int _1053 = _1051 + _664;
    int _1055 = abs(_1031);
    bool _1057 = !_1017;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = ~_947;
    int _1063 = _1061 + _1041;
    int _1065 = _1063 + 1;
    float _1067 = trunc(_941);
    int _1069 = int(_1067);
    int _1071 = abs(_1049);
    int _1073 = _963 * _1055;
    int _1075 = _1073 + _664;
    int _1077 = ~_971;
    int _1079 = _1077 + _1059;
    int _1081 = _1079 + 1;
    int _1083 = _552 * _1065;
    int _1085 = _1083 + _608;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1089 = _1087 != 0;
    int _1091 = _1007 * _1071;
    int _1093 = _1091 + _608;
    bool _1095 = _536 == 0;
    int _1097 = _562 * _1081;
    int _1099 = _1097 + _656;
    bool _1101 = _562 == 0;
    float _1103 = trunc(_955);
    int _1105 = int(_1103);
    bool _1107 = !_1089;
    int _1109 = _1107 ? 0 : 1;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1117 = _1115 != 0;
    int _1119 = abs(_1109);
    float _1121 = floor(_857);
    int _1123 = ~_1021;
    int _1125 = _1123 + 1;
    int _1127 = _1125 + 1;
    bool _1129 = !_1101;
    int _1131 = _1129 ? _1099 : (-1);
    int _1133 = ~_1045;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    int _1139 = _1105 * _1119;
    int _1141 = _1139 + _656;
    bool _1143 = !_1095;
    int _1145 = _1143 ? _1053 : (-1);
    int _1147 = _1127 * _1131;
    int _1149 = ~_1069;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = trunc(_945);
    int _1157 = int(_1155);
    bool _1159 = !_1117;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = _1137 * _1145;
    bool _1165 = !_1113;
    int _1167 = _1165 ? 0 : 1;
    bool _1169 = !_831;
    int _1171 = _1169 ? _1085 : (-1);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1175 = _1173 != 0;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1179 = _1177 != 0;
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1183 = _536 + (-1);
    int _1185 = _1153 * _1171;
    int _1187 = _552 + (-1);
    bool _1189 = !_1179;
    int _1191 = _1189 ? 0 : 1;
    int _1193 = _1045 * _1183;
    int _1195 = _1193 + _1163;
    bool _1197 = !_1175;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = _1069 * _1187;
    int _1203 = _1201 + _1185;
    int _1205 = abs(_1191);
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1209 = _1207 != 0;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1213 = _1211 != 0;
    int _1215 = _1203 * _1205;
    int _1217 = abs(_1199);
    bool _1219 = !_1209;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = trunc(_943);
    int _1225 = int(_1223);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1229 = _1227 != 0;
    int _1231 = _1157 * _1217;
    int _1233 = _1231 + _1215;
    bool _1235 = !_1213;
    int _1237 = _1235 ? 0 : 1;
    int _1239 = abs(_1161);
    bool _1241 = !_1229;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = abs(_1237);
    int _1247 = abs(_1167);
    int _1249 = abs(_1243);
    int _1251 = _1195 * _1239;
    int _1253 = _1093 * _1245;
    int _1255 = _1253 + _1233;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1259 = _1257 != 0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1263 = _1261 != 0;
    int _1265 = _1225 * _1247;
    int _1267 = _1265 + _1251;
    int _1269 = abs(_1221);
    int _1271 = _1007 * _1249;
    int _1273 = _1271 + _1255;
    float _1275 = trunc(_949);
    int _1277 = int(_1275);
    bool _1279 = !_1263;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1285 = _1283 != 0;
    int _1287 = _1075 * _1269;
    int _1289 = _1287 + _1267;
    float _1291 = float(uint(_1273));
    int _1293 = abs(_1281);
    bool _1295 = !_1285;
    int _1297 = _1295 ? 0 : 1;
    float _1299 = as_type<float>(_640) * _1291;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1307 = _1305 != 0;
    int _1309 = _562 + (-1);
    int _1311 = abs(_1297);
    float _1313 = trunc(_1299);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    bool _1319 = !_1303;
    int _1321 = _1319 ? 0 : 1;
    int _1323 = _1021 * _1309;
    int _1325 = _1323 + _1147;
    bool _1327 = !_1259;
    int _1329 = _1327 ? 0 : 1;
    int _1331 = abs(_1321);
    int _1333 = _1325 * _1293;
    int _1335 = abs(_1329);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1339 = _1337 != 0;
    int _1341 = _1277 * _1335;
    int _1343 = _1341 + _1333;
    int _1345 = ~_552;
    int _1347 = _1345 + 1;
    int _1349 = _963 * _1311;
    int _1351 = _1349 + _1289;
    bool _1353 = !_1307;
    int _1355 = _1353 ? 0 : 1;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1359 = _1357 != 0;
    int _1361 = abs(_1355);
    int _1363 = _1141 * _1331;
    int _1365 = _1363 + _1343;
    float _1367 = float(uint(_1351));
    int _1369 = _1347 * int(_1317);
    int _1371 = _1369 + _1273;
    float _1373 = as_type<float>(_1245);
    bool _1375 = _1285;
    float _1377 = _861;
    float _1379 = _819;
    if (_1339)
    {
        float _1381 = in.m_57.x;
        _1373 = _1381;
    }
    float _1383 = _1373;
    int _1385 = _1105 * _1361;
    int _1387 = _1385 + _1365;
    bool _1389 = _536 == 0;
    float _1391 = as_type<float>(_610) * _1367;
    float _1393 = float(uint(_1371));
    float _1395 = as_type<float>(_1331);
    int _1397 = as_type<int>(_1393);
    float _1399 = as_type<float>(_1387);
    if (_1359)
    {
        float _1401 = in.m_57.z;
        _1395 = _1401;
    }
    float _1403 = _1395;
    float _1405 = float(uint(_1387));
    float _1407 = trunc(_1391);
    float _1409 = precise::max(_1407, 0.0);
    uint _1411 = uint(_1409);
    float _1413 = as_type<float>(_640) * _1393;
    float _1415 = as_type<float>(_666) * _1405;
    int _1417 = ~_536;
    int _1419 = _1417 + 1;
    int _1421 = as_type<int>(_1415);
    if (_1339)
    {
        float _1423 = -_516;
        float _1425 = _1423 + 1.0;
        _1397 = as_type<int>(_1425);
    }
    int _1427 = _1397;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1431 = trunc(_1413);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    float _1437 = fma(_861, -2.0, _1429);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1441 = ~_562;
    int _1443 = _1441 + 1;
    float _1445 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1437);
    int _1447 = ~_552;
    int _1449 = _1447 + 1;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1453 = trunc(_1415);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = _1419 * int(_1411);
    int _1461 = _1459 + _1351;
    if (_1339)
    {
        bool _1463 = _1383 > 0.5;
        _1375 = _1463;
    }
    bool _1465 = _1375;
    int _1467 = ~_562;
    int _1469 = _1467 + 1;
    bool _1471 = _1465;
    if (_1339)
    {
        float _1473 = _1465 ? as_type<float>(_1427) : _516;
        _596 = _1473;
    }
    float _1475 = _596;
    float _1477 = float(uint(_1461));
    if (_1359)
    {
        float _1479 = -_516;
        float _1481 = _1479 + 1.0;
        _1421 = as_type<int>(_1481);
    }
    int _1483 = _1421;
    int _1485 = int(_1317) + int(_1435);
    if (_1359)
    {
        bool _1487 = _1403 > 0.5;
        _1471 = _1487;
    }
    bool _1489 = _1471;
    int _1491 = ~_552;
    int _1493 = _1491 + 1;
    int _1495 = _1469 * int(_1457);
    int _1497 = _1495 + _1387;
    float _1499 = as_type<float>(_610) * _1477;
    if (_1359)
    {
        float _1501 = _1489 ? as_type<float>(_1483) : _516;
        _542 = _1501;
    }
    float _1503 = _542;
    float _1505 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1507 = _787 != 2;
    float _1509 = float(uint(_1497));
    int _1511 = _1493 * _1485;
    int _1513 = _1511 + _1273;
    float _1515 = trunc(_1499);
    float _1517 = precise::max(_1515, 0.0);
    uint _1519 = uint(_1517);
    float _1521 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1523 = as_type<float>(_666) * _1509;
    bool _1525 = uint(_1513) >= uint(_552);
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1529 = ~_536;
    int _1531 = _1529 + 1;
    float _1533 = trunc(_1523);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    bool _1539 = !_1525;
    int _1541 = _1539 ? 0 : (-1);
    float _1543 = fma(_1505, -2.0, _1527);
    int _1545 = ~_1485;
    int _1547 = _1545 + _1541;
    int _1549 = _1547 + 1;
    float _1551 = _789 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1553 = _522 > 0.5;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1557 = int(_1411) + int(_1519);
    int _1559 = _552 * _1549;
    int _1561 = _1559 + _1273;
    float _1563 = -_853;
    float _1565 = fma(_1551, 2.0, _1563);
    if (_1507)
    {
        _1377 = _777;
    }
    float _1567 = _1377;
    float _1569 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1543);
    bool _1571 = !_831;
    int _1573 = _1571 ? _1561 : (-1);
    int _1575 = _1531 * _1557;
    int _1577 = _1575 + _1351;
    float _1579 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1555);
    int _1581 = int(_1457) + int(_1537);
    float _1583 = -_124;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1565);
    int _1587 = _1573 & 3;
    bool _1589 = _1587 != 0;
    float _1591 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1579);
    bool _1593 = uint(_1577) >= uint(_536);
    int _1595 = _1589 ? 0 : 1;
    bool _1597 = _1587 != 3;
    bool _1599 = !_1593;
    int _1601 = _1599 ? 0 : (-1);
    int _1603 = ~_562;
    int _1605 = _1603 + 1;
    bool _1607 = uint(_1587) >= 2u;
    int _1609 = ~_1557;
    int _1611 = _1609 + _1601;
    int _1613 = _1611 + 1;
    int _1615 = _1605 * _1581;
    int _1617 = _1615 + _1387;
    int _1619 = _1607 ? 0 : 1;
    bool _1621 = uint(_1587) > 1u;
    int _1623 = _536 * _1613;
    int _1625 = _1623 + _1351;
    int _1627 = ~_1619;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    int _1633 = _1631;
    float _1635 = _1567;
    if (_1597)
    {
        int _1637 = ~_1619;
        int _1639 = _1637 + 1;
        _1633 = _1639;
    }
    int _1641 = _1633;
    float _1643 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1645 = uint(_1617) >= uint(_562);
    float _1647 = -_819;
    float _1649 = _1647 + 1.0;
    bool _1651 = !_1389;
    int _1653 = _1651 ? _1625 : (-1);
    float _1655 = -_875;
    float _1657 = fma(_1643, 2.0, _1655);
    bool _1659 = !_1645;
    int _1661 = _1659 ? 0 : (-1);
    float _1663 = float(uint(_1093));
    float _1665 = -_124;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1657);
    int _1669 = ~_1581;
    int _1671 = _1669 + _1661;
    int _1673 = _1671 + 1;
    int _1675 = _1653 & 3;
    float _1677 = as_type<float>(_640) * _1663;
    int _1679 = ~_1595;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    int _1685 = _562 * _1673;
    int _1687 = _1685 + _1387;
    int _1689 = _1683;
    if (!_1621)
    {
        int _1691 = ~_1595;
        int _1693 = _1691 + 1;
        _1689 = _1693;
    }
    int _1695 = _1689;
    float _1697 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1699 = log2(_1697);
    bool _1701 = _1675 != 3;
    if (!_1507)
    {
        _1635 = _841;
    }
    float _1703 = _1635;
    int _1705 = _1553 ? as_type<int>(_1649) : as_type<int>(_819);
    bool _1707 = _562 == 0;
    float _1709 = trunc(_1677);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    bool _1715 = uint(_1675) >= 2u;
    float _1717 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1719 = !_1707;
    int _1721 = _1719 ? _1687 : (-1);
    int _1723 = _1715 ? 0 : 1;
    float _1725 = -_1439;
    float _1727 = fma(_1717, 2.0, _1725);
    int _1729 = _1721 & 3;
    float _1731 = _1699 * _124;
    int _1733 = ~_1723;
    int _1735 = _1733 + 1;
    int _1737 = _1735 + 1;
    float _1739 = -_124;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1727);
    int _1743 = _1737;
    if (_1701)
    {
        int _1745 = ~_1723;
        int _1747 = _1745 + 1;
        _1743 = _1747;
    }
    int _1749 = _1743;
    bool _1751 = uint(_1675) > 1u;
    float _1753 = exp2(_1731);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1757 = _1755 != 0;
    bool _1759 = _1729 != 3;
    int _1761 = ~_552;
    int _1763 = _1761 + 1;
    if (_1507)
    {
        _1399 = _522;
    }
    float _1765 = _1399;
    int _1767 = _1653 & 3;
    bool _1769 = _1767 != 0;
    int _1771 = _1763 * int(_1713);
    int _1773 = _1771 + _1093;
    bool _1775 = !_1757;
    int _1777 = _1775 ? 0 : 1;
    float _1779 = _1765;
    if (!_1507)
    {
        _1779 = _777;
    }
    float _1781 = _1779;
    bool _1783 = _841 > 0.5;
    float _1785 = -_1753;
    float _1787 = _1785 + 1.0;
    bool _1789 = uint(_1729) >= 2u;
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1793 = _1769 ? 0 : 1;
    int _1795 = _1783 ? as_type<int>(_1649) : as_type<int>(_819);
    float _1797 = fma(_1791, -2.0, _1451);
    int _1799 = _1789 ? 0 : 1;
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1803 = _1801 != 0;
    int _1805 = ~_1793;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _1809;
    if (!_1751)
    {
        int _1813 = ~_1793;
        int _1815 = _1813 + 1;
        _1811 = _1815;
    }
    int _1817 = _1811;
    int _1819 = ~_1799;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    float _1825 = float(uint(_1773));
    float _1827 = _1803 ? as_type<float>(_1795) : _819;
    int _1829 = _1823;
    if (_1759)
    {
        int _1831 = ~_1799;
        int _1833 = _1831 + 1;
        _1829 = _1833;
    }
    int _1835 = _1829;
    float _1837 = as_type<float>(_640) * _1825;
    float _1839 = float(uint(_1075));
    float _1841 = in.m_57.w;
    bool _1843 = uint(_1729) > 1u;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1847 = _1845 != 0;
    float _1849 = as_type<float>(_610) * _1839;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1853 = _1721 & 3;
    bool _1855 = _1853 != 0;
    float _1857 = trunc(_1837);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = _1847 ? as_type<float>(_1795) : _819;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1867 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1869 = isnan(0.0);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1875 = _1871 || _1873;
    float _1877 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1851);
    float _1879 = float(uint(_1141));
    float _1881 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1027);
    int _1883 = _1855 ? 0 : 1;
    float _1885 = trunc(_1849);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    float _1891 = _1875 ? _1787 : 0.0;
    float _1893 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1865);
    float _1895 = as_type<float>(_666) * _1879;
    int _1897 = ~_1883;
    int _1899 = _1897 + 1;
    int _1901 = _1899 + 1;
    float _1903 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1877);
    int _1905 = _1901;
    if (!_1843)
    {
        int _1907 = ~_1883;
        int _1909 = _1907 + 1;
        _1905 = _1909;
    }
    int _1911 = _1905;
    float _1913 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1893);
    bool _1915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1917 = isnan(1.0);
    bool _1919 = _1915 || _1917;
    bool _1921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1923 = _1919 || _1921;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1927 = 1.0 + _1925;
    float _1929 = trunc(_1895);
    float _1931 = precise::max(_1929, 0.0);
    uint _1933 = uint(_1931);
    float _1935 = _522 * 2.0;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1939 = _1937 != 0;
    int _1941 = _883 * int(_1889);
    int _1943 = _1941 + _1075;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1947 = _1939 ? as_type<float>(_1705) : _819;
    float _1949 = 1.0 / _1927;
    bool _1951 = _1121 > 0.0;
    float _1953 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1945);
    float _1955 = float(uint(_1943));
    float _1957 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1797);
    float _1959 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1953);
    int _1961 = _1443 * int(_1933);
    int _1963 = _1961 + _1141;
    float _1965 = floor(_1935);
    float _1967 = as_type<float>(_610) * _1955;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_1923)
    {
        float _1977 = _1891 * _1949;
        _134 = _1977;
    }
    float _1979 = _134;
    float _1981 = float(uint(_1963));
    float _1983 = trunc(_1967);
    float _1985 = precise::max(_1983, 0.0);
    uint _1987 = uint(_1985);
    bool _1989 = _1121 >= 0.0;
    bool _1991 = isnan(_1121);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2001 = _1999 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2003 = as_type<float>(_666) * _1981;
    int _2005 = _1997 ? 0 : 1;
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2009 = _2007 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2013 = _2011 != 0;
    float _2015 = trunc(_2003);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    int _2021 = ~_2005;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2031 = _2025;
    if (!_1951)
    {
        int _2033 = ~_2005;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2039;
    bool _2043 = _1841 > 0.5;
    int _2045 = int(_1713) + int(_1861);
    float _2047 = 1.0 / _2029;
    int _2049 = ~_536;
    int _2051 = _2049 + 1;
    if (_2013)
    {
        float _2053 = _2043 ? _1649 : _819;
        _1379 = _2053;
    }
    float _2055 = _1379;
    int _2057 = _1449 * _2045;
    int _2059 = _2057 + _1093;
    bool _2061 = _1965 >= 0.0;
    bool _2063 = isnan(_1965);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(0.0);
    bool _2069 = _2065 || _2067;
    float _2071 = 1.0 / _2001;
    bool _2073 = _1965 > 0.0;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2077 = _2069 ? 0 : 1;
    bool _2079 = uint(_2059) >= uint(_552);
    int _2081 = int(_1889) + int(_1987);
    float _2083 = 1.0 / _1971;
    bool _2085 = !_2079;
    int _2087 = _2085 ? 0 : (-1);
    int _2089 = int(_1933) + int(_2019);
    int _2091 = _2051 * _2081;
    int _2093 = _2091 + _1075;
    int _2095 = ~_2045;
    int _2097 = _2095 + _2087;
    int _2099 = _2097 + 1;
    float _2101 = 1.0 / _1975;
    int _2103 = ~_562;
    int _2105 = _2103 + 1;
    int _2107 = ~_2077;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    int _2113 = _552 * _2099;
    int _2115 = _2113 + _1093;
    int _2117 = _2111;
    int _2119 = as_type<int>(_2075);
    if (!_2073)
    {
        int _2121 = ~_2077;
        int _2123 = _2121 + 1;
        _2117 = _2123;
    }
    int _2125 = _2117;
    float _2127 = in.m_48.x;
    float _2129 = in.m_48.y;
    float _2131 = in.m_48.z;
    bool _2133 = uint(_2093) >= uint(_536);
    int _2135 = _2105 * _2089;
    int _2137 = _2135 + _1141;
    float _2139 = 1.0 / _2009;
    bool _2141 = !_2133;
    int _2143 = _2141 ? 0 : (-1);
    bool _2145 = uint(_2137) >= uint(_562);
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2151 = in.m_67.x;
    float _2153 = in.m_67.y;
    float _2155 = in.m_67.z;
    int _2157 = _1573 & 3;
    bool _2159 = _2157 != 0;
    bool _2161 = !_2145;
    int _2163 = _2161 ? 0 : (-1);
    bool _2165 = _1587 != 3;
    bool _2167 = !_831;
    int _2169 = _2167 ? _2115 : (-1);
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2173 = _2171 != 0;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2181 = _2179 != 0;
    float _2183 = 1.0 / _2149;
    bool _2185 = !_2159;
    int _2187 = _2185 ? 0 : 1;
    float _2189 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2191 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2193 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _2195 = !_2165;
    int _2197 = _2195 ? 0 : (-1);
    float _2199 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2189);
    float _2201 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2191);
    float _2203 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2193);
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2207 = _2205 != 0;
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2209;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2215 = _2213 != 0;
    float _2217 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2221 = _2219 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2223 = _2041 * _2047;
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2229 = _2211 * _2183;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2235 = _2221 * _2071;
    float _2237 = _841 * 2.0;
    float _2239 = _2227 * _2083;
    float _2241 = _522 + _841;
    float _2243 = 1.0 / _2233;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2247 = _2245 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2249 = _2241 + (-1.0);
    float _2251 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2253 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2255 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2257 = floor(_2237);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2263;
    float _2267 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _975);
    float _2271 = _2261 * _2101;
    float _2273 = _2265 * _2139;
    float _2275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _973);
    float _2277 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _977);
    float _2281 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2283 = _2255 * _2275;
    float _2285 = _2277 * _2269;
    float _2287 = _2247 * _2243;
    float _2289 = _2281 * _2279;
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2293 = _510 + _2291;
    bool _2295 = !_2173;
    int _2297 = _2295 ? 0 : 1;
    float _2299 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2199);
    bool _2301 = _2257 >= 0.0;
    bool _2303 = isnan(_2257);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = fma(_2223, _2293, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2313 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2315 = isnan(_510);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2321 = _2317 || _2319;
    float _2323 = float(_2321);
    float _2325 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2201);
    float _2327 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2203);
    int _2329 = _2309 ? 0 : 1;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2333 = _510 + _2331;
    bool _2335 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2337 = isnan(_510);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2343 = _2339 || _2341;
    float _2345 = float(_2343);
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2349 = _510 + _2347;
    bool _2351 = _2257 > 0.0;
    float _2353 = -_2323;
    float _2355 = _2353 + 1.0;
    bool _2357 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2359 = isnan(_510);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = fma(_2239, _2333, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2371 = fma(_2229, _2349, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2373 = _2345 * _2355;
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2377 = _510 + _2375;
    bool _2379 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2381 = isnan(_510);
    bool _2383 = _2379 || _2381;
    bool _2385 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2387 = _2383 || _2385;
    float _2389 = float(_2387);
    float _2391 = -_2345;
    float _2393 = _2391 + 1.0;
    float _2395 = -_2367;
    float _2397 = _2395 + 1.0;
    float _2399 = fma(_2235, _2377, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2401 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2403 = isnan(_510);
    bool _2405 = _2401 || _2403;
    bool _2407 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2409 = _2405 || _2407;
    float _2411 = float(_2409);
    float _2413 = _2389 * _2393;
    float _2415 = -_2389;
    float _2417 = _2415 + 1.0;
    float _2419 = _2323 * _2397;
    float _2421 = in.m_69.x;
    float _2423 = in.m_69.y;
    float _2425 = in.m_69.z;
    int _2427 = ~_2329;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    float _2433 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    int _2435 = _2431;
    if (!_2351)
    {
        int _2437 = ~_2329;
        int _2439 = _2437 + 1;
        _2435 = _2439;
    }
    int _2441 = _2435;
    float _2443 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    bool _2445 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2447 = isnan(_510);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    float _2457 = _2325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2459 = _975 != 0.0;
    bool _2461 = isnan(_975);
    bool _2463 = _2459 || _2461;
    bool _2465 = isnan(0.0);
    bool _2467 = _2463 || _2465;
    float _2469 = _2327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2471 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2473 = isnan(_510);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = _2455 * _2417;
    bool _2485 = _973 == 0.0;
    bool _2487 = !_2467;
    bool _2489 = _2485 && _2487;
    float _2491 = -_2455;
    float _2493 = _2491 + 1.0;
    bool _2495 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2497 = isnan(_510);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2503 = _2499 || _2501;
    float _2505 = float(_2503);
    float _2507 = -_2481;
    float _2509 = _2507 + 1.0;
    bool _2511 = _977 == 0.0;
    bool _2513 = _2511 && _2489;
    float _2515 = _2411 * _2493;
    float _2517 = -_2411;
    float _2519 = _2517 + 1.0;
    float _2521 = _2505 * _2509;
    float _2523 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2525 = _510 + _2523;
    float _2527 = _2481 * _2519;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2531 = _510 + _2529;
    float _2533 = _2311 * _2521;
    float _2535 = -_2505;
    float _2537 = _2535 + 1.0;
    float _2539 = fma(_2271, _2525, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2541 = fma(_2287, _901, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2543 = fma(_2273, _2531, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2545 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2547 = _2531;
    int _2549 = as_type<int>(_2545);
    float _2551 = _2533;
    float _2553 = _2421;
    float _2555 = _2423;
    if (_2513)
    {
        _2547 = _2423;
    }
    float _2557 = _2547;
    float _2559 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2533);
    float _2561 = -_1569;
    float _2563 = fma(_1959, _2545, _2561);
    float _2565 = _2075 * _1181;
    bool _2567 = !_2177;
    int _2569 = _2567 ? 0 : 1;
    float _2571 = _2557;
    if (_2513)
    {
        float _2573 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2557);
        _2549 = as_type<int>(_2573);
    }
    int _2575 = _2549;
    int _2577 = _2575;
    if (_2513)
    {
        _2551 = _2557;
    }
    float _2579 = _2551;
    float _2581 = fma(_2369, _2527, _2559);
    float _2583 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2585 = _2579;
    if (!_2513)
    {
        _2571 = _2423;
    }
    float _2587 = _2571;
    float _2589 = in.m_71.x;
    float _2591 = in.m_71.y;
    float _2593 = in.m_71.z;
    int _2595 = abs(_2569);
    if (!_2513)
    {
        float _2597 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2421);
        _2553 = _2597;
    }
    float _2599 = _2553;
    float _2601 = float(_2037);
    float _2603 = _2599;
    if (!_2513)
    {
        float _2605 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2577 = as_type<int>(_2605);
    }
    int _2607 = _2577;
    int _2609 = abs(_2297);
    out.m_73.w = _2565;
    float _2611 = _522 + _777;
    float _2613 = fma(_2371, _2515, _2581);
    float _2615 = float(_2441);
    float _2617 = _2611 + (-1.0);
    float _2619 = float(_2609);
    if (_2513)
    {
        float _2621 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2425);
        _2119 = as_type<int>(_2621);
    }
    int _2623 = _2119;
    float _2625 = float(_2595);
    int _2627 = _2623;
    if (!_2513)
    {
        float _2629 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2425);
        _2627 = as_type<int>(_2629);
    }
    int _2631 = _2627;
    bool _2633 = !_2181;
    int _2635 = _2633 ? 0 : 1;
    float _2637 = fma(_2617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2639 = !_2513;
    float _2641 = _2639 ? as_type<float>(_2607) : _2587;
    float _2643 = _2625 * _2601;
    float _2645 = _522 + (-0.5);
    float _2647 = _2619 * _2615;
    if (_2513)
    {
        _2555 = _2425;
    }
    float _2649 = _2555;
    float _2651 = _2643 * (-2.0);
    int _2653 = abs(_2635);
    float _2655 = _2641 * _2641;
    bool _2657 = !_2513;
    float _2659 = _2657 ? as_type<float>(_2631) : _2425;
    float _2661 = fma(_2651, _2591, _2591);
    float _2663 = float(_2125);
    float _2665 = fma(_2267, _2651, _2267);
    float _2667 = float(_2653);
    float _2669 = fma(_2645, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2661);
    float _2671 = _2647 * (-2.0);
    float _2673 = fma(_2659, _2659, _2655);
    float _2675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2677 = _2667 * _2663;
    float _2679 = fma(_2637, _2671, _2637);
    float _2681 = fma(_2671, _2589, _2589);
    float _2683 = _777 + _841;
    float _2685 = _777 + (-0.5);
    float _2687 = fma(_2665, _1979, _2669);
    float _2689 = _841 + (-0.5);
    float _2691 = rsqrt(_2673);
    float _2693 = fma(_2685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2681);
    float _2695 = _2687 * 0.15915493667125701904296875;
    float _2697 = _2677 * (-2.0);
    float _2699 = fma(_1903, _2583, _1667);
    float _2701 = fma(_2679, _1979, _2693);
    float _2703 = fma(_2697, _2593, _2593);
    float _2705 = _2683 + (-1.0);
    float _2707 = _2701 * 0.15915493667125701904296875;
    float _2709 = -_1445;
    float _2711 = fma(_879, _2433, _2709);
    int _2713 = _1573 >> 31;
    float _2715 = fma(_2689, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2703);
    float _2717 = fma(_2705, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2719 = _1521 * _2675;
    float _2721 = _2711 + 0.5;
    float _2723 = _2641 * _2691;
    float _2725 = _2699 + 0.5;
    int _2727 = _2713 & 3;
    float _2729 = fma(_2717, _2697, _2717);
    float _2731 = _2659 * _2691;
    float _2733 = _2563 + 0.5;
    int _2735 = _1573 + _2727;
    float _2737 = fma(_2729, _1979, _2715);
    float _2739 = _2695 * 6.283185482025146484375;
    float _2741 = sin(_2739);
    int _2743 = ~_2081;
    int _2745 = _2743 + _2143;
    int _2747 = _2745 + 1;
    out.m_73.x = _2725;
    out.m_73.y = _2733;
    out.m_73.z = _2719;
    int _2749 = _2735 >> 2;
    float _2751 = _2737 * 0.15915493667125701904296875;
    float _2753 = fma(_1591, _2443, _1585);
    int _2755 = ~_2089;
    int _2757 = _2755 + _2163;
    int _2759 = _2757 + 1;
    int _2761 = _536 * _2747;
    int _2763 = _2761 + _1075;
    int _2765 = _2749 << 4;
    int _2767 = _2765 + 656;
    float _2769 = _2753 + 0.5;
    float _2771 = _2695 * 6.283185482025146484375;
    float _2773 = cos(_2771);
    float _2775 = _2649;
    if (!_2513)
    {
        _2775 = as_type<float>(_2631);
    }
    float _2777 = _2775;
    int _2779 = _562 * _2759;
    int _2781 = _2779 + _1141;
    int _2783 = abs(_2197);
    uint _2785 = uint(int(uint(_2767) >> uint(2)));
    uint _2787 = uint(int(uint(int(_2785)) >> uint(2)));
    int _2789 = int(_2785) & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    int _2793 = int(_2785) + 1;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    int _2797 = _2793 & 3;
    float _2799 = (*spvDescriptorSet0.vp_c9)._m0[int(_2795)][_2797];
    out.m_75.x = _2769;
    out.m_75.y = _2721;
    if (!_2513)
    {
        _2585 = as_type<float>(_2607);
    }
    float _2801 = _2585;
    float _2803 = fma(_2399, _2483, _2613);
    float _2805 = _2707 * 6.283185482025146484375;
    float _2807 = cos(_2805);
    float _2809 = _2299 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2811 = fma(_2539, _2413, _2803);
    int _2813 = _2767 + 8;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    uint _2817 = uint(int(uint(int(_2815)) >> uint(2)));
    int _2819 = int(_2815) & 3;
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[int(_2817)][_2819];
    int _2823 = int(_2815) + 1;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    int _2827 = _2823 & 3;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[int(_2825)][_2827];
    float _2831 = _2751 * 6.283185482025146484375;
    float _2833 = cos(_2831);
    float _2835 = fma(_2541, _2373, _2811);
    float _2837 = fma(_2543, _2419, _2835);
    float _2839 = _2707 * 6.283185482025146484375;
    float _2841 = sin(_2839);
    float _2843 = _2807 * _2773;
    float _2845 = _2807 * _2741;
    float _2847 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2837);
    float _2849 = _2751 * 6.283185482025146484375;
    float _2851 = sin(_2849);
    float _2853 = _2807 * _2833;
    float _2855 = _2773 * _2833;
    out.m_77.x = _2847;
    float _2857 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2859 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2861 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2863 = _2841 * _2741;
    float _2865 = _2841 * _2773;
    float _2867 = _2841 * _2833;
    float _2869 = _2741 * _2833;
    float _2871 = _2853 * _2285;
    float _2873 = -_2845;
    float _2875 = fma(_2851, _2865, _2873);
    float _2877 = -_2865;
    float _2879 = fma(_2851, _2845, _2877);
    float _2881 = fma(_2851, _2843, _2863);
    float _2883 = -_2285;
    float _2885 = _2851 * _2883;
    float _2887 = _2867 * _2285;
    float _2889 = -_2851;
    float _2891 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2857);
    float _2893 = -_2851;
    float _2895 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2859);
    float _2897 = fma(_2855, _2283, _2885);
    float _2899 = fma(_2881, _2283, _2871);
    float _2901 = fma(_2875, _2283, _2887);
    float _2903 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2891);
    float _2905 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2895);
    int _2907 = abs(_1695);
    float _2909 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2911 = abs(_2187);
    float _2913 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2917 = ~_2907;
    int _2919 = _2917 + 1;
    int _2921 = _2919 + 1;
    float _2923 = fma(_2869, _2289, _2897);
    float _2925 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2909);
    float _2927 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2929 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    int _2931 = abs(_1641);
    int _2933 = _2921 * as_type<int>(_2799);
    int _2935 = ~_2911;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2943 = int(_2941);
    float _2945 = fma(_2879, _2289, _2899);
    float _2947 = fma(_2851, _2863, _2843);
    int _2949 = _2939 * as_type<int>(_2791);
    int _2951 = _2949 + _2933;
    int _2953 = ~_2931;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    float _2959 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2961 = fma(_2947, _2289, _2901);
    float _2963 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    int _2965 = abs(_1777);
    int _2967 = _2957 * as_type<int>(_2821);
    int _2969 = _2967 + _2951;
    float _2971 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2929);
    float _2975 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2977 = ~_2783;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    float _2983 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    float _2985 = float(uint(_2943));
    float _2987 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2975);
    int _2989 = abs(_2943);
    int _2991 = _2981 * as_type<int>(_2829);
    int _2993 = _2991 + _2969;
    int _2995 = _1653 >> 31;
    float _2997 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2983);
    float _2999 = 1.0 / _2985;
    int _3001 = _1721 >> 31;
    float _3003 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2987);
    int _3005 = _2995 & 3;
    float _3007 = _2997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3009 = ~_2965;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    float _3015 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2925);
    int _3017 = _3001 & 3;
    float _3019 = _2457 + _3007;
    float _3021 = float(uint(_2989));
    int _3023 = _3013 * _2993;
    float _3025 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3027 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3029 = -_2851;
    float _3031 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    int _3033 = _2169 * _2965;
    int _3035 = _3033 + _3023;
    float _3037 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3039 = 1.0 / _3021;
    int _3041 = _1653 + _3005;
    float _3043 = _2469 + _3025;
    int _3045 = _1721 + _3017;
    float _3047 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2959);
    float _3049 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3051 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3037);
    int _3053 = _3041 >> 2;
    float _3055 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3057 = _3045 >> 2;
    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3061 = _3019 + _3059;
    int _3063 = as_type<int>(_2999) + (-2);
    float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3067 = _3043 + _3065;
    float _3069 = float(uint(_3035));
    float _3071 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3031);
    int _3073 = _3053 << 4;
    int _3075 = _3073 + 368;
    float _3077 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3055);
    int _3079 = _3057 << 4;
    int _3081 = _3079 + 800;
    float _3083 = _3061 * _3061;
    int _3085 = abs(_3035);
    float _3087 = _3067 * _3067;
    float _3089 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3091 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3093 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3051);
    float _3095 = as_type<float>(_3063) * _3069;
    int _3097 = as_type<int>(_3039) + (-2);
    float _3099 = _3083 + _3087;
    float _3101 = _2905 * _2801;
    int _3103 = ~_2943;
    int _3105 = _3103 + 1;
    float _3107 = trunc(_3095);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    float _3113 = float(uint(_3085));
    float _3115 = fma(_3091, _2599, _3101);
    float _3117 = _2903 * _2801;
    out.m_79.x = _3089;
    out.m_79.y = _3091;
    out.m_79.z = _3093;
    float _3119 = as_type<float>(_3097) * _3113;
    float _3121 = fma(_3089, _2599, _3117);
    float _3123 = sqrt(_3099);
    float _3125 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3077);
    uint _3127 = uint(int(uint(_3075) >> uint(2)));
    uint _3129 = uint(int(uint(int(_3127)) >> uint(2)));
    int _3131 = int(_3127) & 3;
    float _3133 = (*spvDescriptorSet0.vp_c9)._m0[int(_3129)][_3131];
    int _3135 = int(_3127) + 1;
    uint _3137 = uint(int(uint(_3135) >> uint(2)));
    int _3139 = _3135 & 3;
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[int(_3137)][_3139];
    bool _3143 = !_1769;
    int _3145 = _3143 ? 0 : 1;
    bool _3147 = _1675 != 3;
    float _3149 = trunc(_3119);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    int _3155 = _3105 * int(_3111);
    int _3157 = _3155 + _3035;
    int _3159 = _3075 + 8;
    uint _3161 = uint(int(uint(_3159) >> uint(2)));
    uint _3163 = uint(int(uint(int(_3161)) >> uint(2)));
    int _3165 = int(_3161) & 3;
    float _3167 = (*spvDescriptorSet0.vp_c9)._m0[int(_3163)][_3165];
    int _3169 = int(_3161) + 1;
    uint _3171 = uint(int(uint(_3169) >> uint(2)));
    int _3173 = _3169 & 3;
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[int(_3171)][_3173];
    float _3177 = _3071 * _2801;
    float _3179 = fma(_3093, _2599, _3177);
    bool _3181 = _3123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _3183 = uint(int(uint(_3081) >> uint(2)));
    uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
    int _3187 = int(_3183) & 3;
    float _3189 = (*spvDescriptorSet0.vp_c9)._m0[int(_3185)][_3187];
    int _3191 = int(_3183) + 1;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    int _3195 = _3191 & 3;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[int(_3193)][_3195];
    float _3199 = _1649 * _1649;
    float _3201 = _3125 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3203 = float(uint(_3157));
    float _3205 = _3199 * _3199;
    float _3207 = _2809 + _3201;
    int _3209 = _3081 + 8;
    uint _3211 = uint(int(uint(_3209) >> uint(2)));
    uint _3213 = uint(int(uint(int(_3211)) >> uint(2)));
    int _3215 = int(_3211) & 3;
    float _3217 = (*spvDescriptorSet0.vp_c9)._m0[int(_3213)][_3215];
    int _3219 = int(_3211) + 1;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    int _3223 = _3219 & 3;
    float _3225 = (*spvDescriptorSet0.vp_c9)._m0[int(_3221)][_3223];
    float _3227 = as_type<float>(_3063) * _3203;
    float _3229 = -_3205;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[193].x, _3207);
    float _3233 = _2801;
    float _3235 = _3207;
    float _3237 = _3083;
    float _3239 = _2973;
    if (!_3181)
    {
        _2603 = _3019;
    }
    float _3241 = _2603;
    float _3243 = _3241;
    if (!_3181)
    {
        _3233 = _3043;
    }
    float _3245 = _3233;
    float _3247 = _3245;
    if (!_3181)
    {
        _3235 = _3231;
    }
    float _3249 = _3235;
    int _3251 = ~_2989;
    int _3253 = _3251 + 1;
    int _3255 = _3253 * int(_3153);
    int _3257 = _3255 + _3085;
    float _3259 = as_type<float>(_3253);
    float _3261 = _3249;
    if (!_3181)
    {
        _3259 = _3087;
    }
    float _3263 = _3259;
    float _3265 = float(uint(_3257));
    bool _3267 = !_3181;
    float _3269 = _3263;
    if (!_3267)
    {
        float _3271 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3275 = _3123 + _3273;
        float _3277 = rsqrt(_3099);
        float _3279 = _3275 * _3271;
        float _3281 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3283 = _3279 * 0.15915493667125701904296875;
        float _3285 = _3283 * 6.283185482025146484375;
        float _3287 = sin(_3285);
        float _3289 = _3283 * 6.283185482025146484375;
        float _3291 = cos(_3289);
        float _3293 = fma(_3287, _3281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3295 = _3277 * _3293;
        float _3297 = _3291 + (-1.0);
        float _3299 = fma(_3061, _3295, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3301 = fma(_3067, _3295, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3307 = _3299 + _3305;
        float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3311 = _3301 + _3309;
        float _3313 = fma(_3231, _3291, _3303);
        float _3315 = _3307 * _3307;
        float _3317 = _3311 * _3311;
        _3261 = _3313;
        _3237 = _3315;
        _3269 = _3317;
        _3243 = _3299;
        _3247 = _3301;
    }
    float _3319 = _3261;
    float _3321 = _3237;
    float _3323 = _3269;
    float _3325 = _3243;
    float _3327 = _3247;
    float _3329 = as_type<float>(_3097) * _3265;
    bool _3331 = !_1855;
    int _3333 = _3331 ? 0 : 1;
    float _3335 = trunc(_3227);
    float _3337 = precise::max(_3335, 0.0);
    uint _3339 = uint(_3337);
    int _3341 = abs(_1911);
    float _3343 = fma(_2973, _2777, _3179);
    int _3345 = abs(_1817);
    int _3347 = abs(_3145);
    int _3349 = abs(_3333);
    float _3351 = trunc(_3329);
    float _3353 = precise::max(_3351, 0.0);
    uint _3355 = uint(_3353);
    int _3357 = ~_3345;
    int _3359 = _3357 + 1;
    int _3361 = _3359 + 1;
    int _3363 = _3361 * as_type<int>(_3141);
    int _3365 = ~_3347;
    int _3367 = _3365 + 1;
    int _3369 = _3367 + 1;
    float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3373 = _3319 + _3371;
    int _3375 = ~_3341;
    int _3377 = _3375 + 1;
    int _3379 = _3377 + 1;
    int _3381 = _3369 * as_type<int>(_3133);
    int _3383 = _3381 + _3363;
    int _3385 = ~_3349;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    float _3391 = fma(_3373, _3373, _3321);
    int _3393 = ~_2943;
    int _3395 = _3393 + 1;
    int _3397 = _3379 * as_type<int>(_3197);
    int _3399 = abs(_1749);
    float _3401 = _3391 + _3323;
    bool _3403 = !_3147;
    int _3405 = _3403 ? 0 : (-1);
    int _3407 = _3389 * as_type<int>(_3189);
    int _3409 = _3407 + _3397;
    int _3411 = int(_3111) + int(_3339);
    float _3413 = sqrt(_3401);
    int _3415 = abs(_3405);
    int _3417 = ~_3399;
    int _3419 = _3417 + 1;
    int _3421 = _3419 + 1;
    int _3423 = _3395 * _3411;
    int _3425 = _3423 + _3035;
    int _3427 = int(_3153) + int(_3355);
    int _3429 = _3421 * as_type<int>(_3167);
    int _3431 = _3429 + _3383;
    int _3433 = ~_2989;
    int _3435 = _3433 + 1;
    int _3437 = abs(_1835);
    bool _3439 = uint(_3425) >= uint(_2943);
    int _3441 = _3435 * _3427;
    int _3443 = _3441 + _3085;
    int _3445 = ~_3415;
    int _3447 = _3445 + 1;
    int _3449 = _3447 + 1;
    bool _3451 = _1729 != 3;
    int _3453 = ~_3437;
    int _3455 = _3453 + 1;
    int _3457 = _3455 + 1;
    int _3459 = _3449 * as_type<int>(_3175);
    int _3461 = _3459 + _3431;
    bool _3463 = !_3439;
    int _3465 = _3463 ? 0 : (-1);
    bool _3467 = !_3451;
    int _3469 = _3467 ? 0 : (-1);
    int _3471 = _3457 * as_type<int>(_3217);
    int _3473 = _3471 + _3409;
    int _3475 = ~_3411;
    int _3477 = _3475 + _3465;
    int _3479 = _3477 + 1;
    bool _3481 = uint(_3443) >= uint(_2989);
    bool _3483 = !_2207;
    int _3485 = _3483 ? 0 : 1;
    int _3487 = _3035 ^ _2943;
    int _3489 = abs(_3469);
    bool _3491 = _2943 == 0;
    bool _3493 = _2943 == 0;
    int _3495 = _2943 * _3479;
    int _3497 = _3495 + _3035;
    bool _3499 = !_3481;
    int _3501 = _3499 ? 0 : (-1);
    float _3503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3505 = abs(_3485);
    uint _3507 = uint(int(uint(_3487) >> uint(31)));
    int _3509 = ~_3501;
    int _3511 = _3427 + _3509;
    int _3513 = _3511 + 1;
    float _3515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3517 = ~_3489;
    int _3519 = _3517 + 1;
    int _3521 = _3519 + 1;
    int _3523 = ~int(_3507);
    int _3525 = _3523 + 1;
    int _3527 = ~_3505;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    int _3533 = _3521 * as_type<int>(_3225);
    int _3535 = _3533 + _3473;
    bool _3537 = !_2215;
    int _3539 = _3537 ? 0 : 1;
    int _3541 = _3513 ^ _3525;
    int _3543 = _3531 * _3461;
    int _3545 = abs(_3539);
    float _3547 = _3503 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3549 = !_3491;
    int _3551 = _3549 ? _3497 : (-1);
    int _3553 = ~_3525;
    int _3555 = _3553 + _3541;
    int _3557 = _3555 + 1;
    float _3559 = fma(_3547, _646, -0.5);
    int _3561 = ~_3545;
    int _3563 = _3561 + 1;
    int _3565 = _3563 + 1;
    bool _3567 = _536 == 0;
    float _3569 = float(_3551);
    int _3571 = _3565 * _3535;
    bool _3573 = !_3493;
    int _3575 = _3573 ? _3557 : (-1);
    bool _3577 = _562 == 0;
    float _3579 = fma(_3547, _3569, _1741);
    float _3581 = float(_3575);
    float _3583 = _3515 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3585 = !_3567;
    int _3587 = _3585 ? _2763 : (-1);
    float _3589 = -_3015;
    float _3591 = _2723 * _3589;
    bool _3593 = !_3577;
    int _3595 = _3593 ? _2781 : (-1);
    float _3597 = fma(_3583, _1827, -0.5);
    float _3599 = -_1957;
    float _3601 = fma(_3583, _3581, _3599);
    float _3603 = -_2963;
    float _3605 = _2723 * _3603;
    int _3607 = _3587 * _3505;
    int _3609 = _3607 + _3543;
    float _3611 = -_2973;
    float _3613 = _2723 * _3611;
    int _3615 = _3595 * _3545;
    int _3617 = _3615 + _3571;
    float _3619 = fma(_1881, _3559, _3579);
    float _3621 = fma(_1913, _3597, _3601);
    float _3623 = fma(_2731, _2903, _3591);
    float _3625 = fma(_2731, _2905, _3605);
    float _3627 = fma(_2731, _3071, _3613);
    float _3629 = fma(_3015, _2777, _3121);
    float _3631 = fma(_2963, _2777, _3115);
    float _3633 = float(_3609);
    float _3635 = _3619 + 0.5;
    float _3637 = float(_3617);
    float _3639 = _3621 + 0.5;
    out.m_81.x = _3623;
    out.m_81.y = _3625;
    out.m_81.z = _3627;
    bool _3641 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3643 = isnan(_3413);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3649 = _3645 || _3647;
    out.m_83.x = _3633;
    out.m_83.w = _3637;
    out.m_85.x = _3635;
    out.m_85.y = _3639;
    float _3651 = as_type<float>(_3609);
    if (!_3649)
    {
        _3651 = 1.0;
    }
    float _3653 = _3651;
    out.m_87.x = _3629;
    out.m_87.y = _3631;
    out.m_87.z = _3343;
    bool _3655 = !_3649;
    float _3657 = _3653;
    if (!_3655)
    {
        bool _3659 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3661 = isnan(_3413);
        bool _3663 = _3659 || _3661;
        bool _3665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3667 = _3663 || _3665;
        if (!_3667)
        {
            float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3671 = _3413 + _3669;
            float _3673 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3675 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3673;
            float _3677 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3679 = _3677 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3681 = 1.0 / _3675;
            float _3683 = _3671 * _3681;
            float _3685 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3657 = _3685;
            _3687 = true;
        }
        else
        {
            bool _3689 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3691 = isnan(_3413);
            bool _3693 = _3689 || _3691;
            bool _3695 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3697 = _3693 || _3695;
            if (!_3697)
            {
                float _3699 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3701 = _3413 + _3699;
                float _3703 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3705 = _3703 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3707 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3709 = _3707 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3711 = 1.0 / _3705;
                float _3713 = _3701 * _3711;
                float _3715 = fma(_3713, _3709, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3657 = _3715;
                _3687 = true;
            }
            else
            {
                _3657 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3687 = false;
    float _3717 = _3657;
    float _3719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3721 = _3319 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3725 = _3325 + _3723;
    float _3727 = fma(_3721, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3729 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3731 = _3327 + _3729;
    float _3733 = fma(_3725, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3735 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3739 = _3727 + _3737;
    float _3741 = fma(_3731, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3743 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3745 = _3733 + _3743;
    float _3747 = floor(_3735);
    float _3749 = _3739 * _3739;
    float _3751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3753 = _3741 + _3751;
    float _3755 = fma(_3745, _3745, _3749);
    float _3757 = fma(_3753, _3753, _3755);
    float _3759 = rsqrt(_3757);
    float _3761 = -_3747;
    float _3763 = _3735 + _3761;
    float _3765 = sqrt(_3757);
    float _3767 = _3759 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3769 = _3745 * _3767;
    float _3771 = _3753 * _3767;
    float _3773 = _3769 * _3769;
    float _3775 = _3771 * _3771;
    float _3777 = _3773 + _3775;
    float _3779 = sqrt(_3777);
    bool _3781 = _3779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3785 = _3779 + _3783;
    float _3787 = _3753;
    float _3789 = _3777;
    float _3791 = _3785;
    float _3793 = _3755;
    if (_3781)
    {
        float _3795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3787 = _3795;
    }
    float _3797 = _3787;
    if (_3781)
    {
        float _3799 = rsqrt(_3777);
        _3789 = _3799;
    }
    float _3801 = _3789;
    if (_3781)
    {
        float _3803 = _3785 * _3797;
        _3791 = _3803;
    }
    float _3805 = _3791;
    if (_3781)
    {
        float _3807 = _3805 * 0.15915493667125701904296875;
        _3793 = _3807;
    }
    float _3809 = _3793;
    float _3811 = _3759;
    float _3813 = _3809;
    if (_3781)
    {
        float _3815 = _3809 * 6.283185482025146484375;
        float _3817 = sin(_3815);
        _3811 = _3817;
    }
    float _3819 = _3811;
    float _3821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3823 = precise::max(0.0, _3821);
    float _3825 = _3625;
    float _3827 = _3821;
    float _3829 = _3823;
    if (_3781)
    {
        float _3831 = _3809 * 6.283185482025146484375;
        float _3833 = cos(_3831);
        _3825 = _3833;
    }
    float _3835 = _3825;
    float _3837 = -_3767;
    float _3839 = -_3823;
    float _3841 = fma(_3739, _3837, _3839);
    float _3843 = (*spvDescriptorSet0.vp_c15)._m0[23].w;
    if (_3781)
    {
        float _3845 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3827 = _3845;
    }
    float _3847 = _3827;
    float _3849 = _3847;
    if (!_3781)
    {
        _3813 = _3769;
    }
    float _3851 = _3813;
    float _3853 = _3819;
    float _3855 = _3851;
    if (_3781)
    {
        float _3857 = fma(_3819, _3847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3239 = _3857;
    }
    float _3859 = _3239;
    float _3861 = _3859;
    if (!_3781)
    {
        _3853 = _3841;
    }
    float _3863 = _3853;
    float _3865 = _3863;
    if (_3781)
    {
        float _3867 = _3835 + (-1.0);
        _3829 = _3867;
    }
    float _3869 = _3829;
    float _3871 = _3869;
    if (_3781)
    {
        float _3873 = _3801 * _3859;
        _3861 = _3873;
    }
    float _3875 = _3861;
    if (_3781)
    {
        float _3877 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3849 = _3877;
    }
    float _3879 = _3849;
    float _3881 = _3879;
    if (_3781)
    {
        float _3883 = _3769 * _3875;
        _3855 = _3883;
    }
    float _3885 = _3855;
    if (!_3781)
    {
        _3871 = _3771;
    }
    float _3887 = _3871;
    float _3889 = _3887;
    if (_3781)
    {
        float _3891 = _3771 * _3875;
        _3889 = _3891;
    }
    float _3893 = _3889;
    if (_3781)
    {
        float _3895 = fma(_3841, _3835, _3879);
        _3865 = _3895;
    }
    float _3897 = _3865;
    if (!_3781)
    {
        _3881 = _3773;
    }
    float _3899 = _3881;
    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3903 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3901);
    float _3905 = precise::clamp(_3903, 0.0, 1.0);
    float _3907 = _3899;
    if (_3781)
    {
        float _3909 = _3885 * _3885;
        _3907 = _3909;
    }
    float _3911 = _3907;
    if (!_3781)
    {
        _3843 = _3775;
    }
    float _3913 = _3843;
    float _3915 = _3913;
    if (_3781)
    {
        float _3917 = _3893 * _3893;
        _3915 = _3917;
    }
    float _3919 = _3915;
    float _3921 = -_3905;
    float _3923 = _3921 + 1.0;
    float _3925 = fma(_3897, _3897, _3911);
    float _3927 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3929 = abs(_3923);
    float _3931 = log2(_3929);
    float _3933 = _3925 + _3919;
    float _3935 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3937 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3939 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3935);
    float _3941 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3943 = rsqrt(_3933);
    float _3945 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3947 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3939);
    float _3949 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3941);
    float _3951 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3953 = _3947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3955 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3945);
    float _3957 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3949);
    float _3959 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3927);
    float _3961 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3963 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3955);
    float _3965 = _3957 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3967 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3959);
    float _3969 = -_3961;
    float _3971 = fma(_3969, _3951, 1.0);
    float _3973 = _3963 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3975 = _3943 * _3885;
    float _3977 = _3967 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3979 = _3943 * _3897;
    float _3981 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3983 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3985 = _3943 * _3893;
    float _3987 = log2(_3971);
    float _3989 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3981);
    float _3991 = -_3983;
    float _3993 = fma(_3979, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3991);
    float _3995 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3997 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3989);
    float _3999 = -_3985;
    float _4001 = fma(_3999, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3993);
    float _4003 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4005 = exp2(_3995);
    float _4007 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3997);
    float _4009 = fma(_4001, -0.5, 0.5);
    float _4011 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4003);
    float _4013 = fma(_4001, 0.5, 0.5);
    float _4015 = _3979 + 1.0;
    float _4017 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4011);
    float _4019 = 1.0 / _4007;
    float _4021 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4023 = fma(_4013, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4025 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4017);
    float _4027 = _3987 * 0.693147182464599609375;
    float _4029 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4021);
    float _4031 = fma(_4013, _4023, -0.212114393711090087890625);
    float _4033 = sqrt(_4009);
    float _4035 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4029);
    float _4037 = -_3979;
    float _4039 = fma(_4005, _4015, _4037);
    float _4041 = fma(_4013, _4031, 1.570728778839111328125);
    float _4043 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4045 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4035);
    float _4047 = fma(_4039, 0.5, 0.5);
    float _4049 = floor(_3937);
    float _4051 = _4025 * _4019;
    float _4053 = _4045 * _4019;
    float _4055 = fma(_4051, 0.5, 0.5);
    float _4057 = fma(_4053, -0.5, 0.5);
    float _4059 = _4033 * 0.636619746685028076171875;
    float _4061 = -_4041;
    float _4063 = fma(_4059, _4061, 1.0);
    float _4065 = -_4049;
    float _4067 = _3937 + _4065;
    float2 _10529 = float2(_3763, _4067);
    float _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10529, float2(0.0), isnan(_10529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10529, float2(0.0), isnan(_10529)), level(0.0)).x;
    float3 _10540 = float3(_4055, _4057, _4043);
    float _4071 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10540, float3(0.0), isnan(_10540)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10540, float3(0.0), isnan(_10540)), level(0.0)).x;
    float3 _10551 = float3(_4055, _4057, _4043);
    float4 _4074 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10551, float3(0.0), isnan(_10551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10551, float3(0.0), isnan(_10551)), level(0.0)).xyzw;
    float _4076 = _4074.x;
    float _4078 = _4074.y;
    float _4080 = _4074.z;
    float _4082 = _4074.w;
    float2 _10567 = float2(_4063, _4047);
    float3 _4086 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10567, float2(0.0), isnan(_10567)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10567, float2(0.0), isnan(_10567)), level(0.0)).xyz;
    float _4088 = _4086.x;
    float _4090 = _4086.y;
    float _4092 = _4086.z;
    float _4094 = _2809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4096 = _2809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4098 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4100 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4094);
    float _4102 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4096);
    float _4104 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4098);
    float _4106 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4100);
    float _4108 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4102);
    float _4110 = in.m_89.x;
    float _4112 = _4106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4114 = _4108 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4116 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4118 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4104);
    float _4120 = 1.0 / _4112;
    float _4122 = _4114 + _4112;
    float _4124 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4118);
    float _4126 = exp2(_4116);
    float _4128 = _4122 * _4120;
    float _4130 = _4128 * 0.5;
    float _4132 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4134 = fma(_4130, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4132);
    bool _4136 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4138 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4140 = _4136 || _4138;
    bool _4142 = isnan(0.5);
    bool _4144 = _4140 || _4142;
    float _4146 = 1.0 / _4134;
    float _4148 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4150 = _4146 * _4148;
    float _4152 = abs(_4150);
    float _4154 = log2(_4152);
    bool _4156 = _4150 <= 8000.0;
    bool _4158 = isnan(_4150);
    bool _4160 = _4156 || _4158;
    bool _4162 = isnan(8000.0);
    bool _4164 = _4160 || _4162;
    float _4166 = float(_4164);
    float _4168 = _4154 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4170 = exp2(_4168);
    float _4172 = fma(_4170, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4174 = precise::clamp(_4172, 0.0, 1.0);
    float _4176 = fma(_4174, -2.0, 3.0);
    float _4178 = _4174 * _4174;
    float _4180 = _4178 * _4176;
    float _4182 = -_4180;
    float _4184 = _4182 + 1.0;
    float _4186 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4180);
    float _4188 = _4124 + _4007;
    float _4190 = _4188 * 0.5;
    float _4192 = _4188;
    float _4194 = _4124;
    float _4196 = _4045;
    float _4198 = _4025;
    if (_4144)
    {
        _4192 = 1.0;
    }
    float _4200 = _4192;
    float _4202 = _4200;
    if (!_4144)
    {
        float _4204 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4206 = _4204 * 0.15915493667125701904296875;
        float _4208 = _4206 * 6.283185482025146484375;
        float _4210 = cos(_4208);
        float _4212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4214 = _4212 * 0.15915493667125701904296875;
        float _4216 = _4206 * 6.283185482025146484375;
        float _4218 = sin(_4216);
        float _4220 = 1.0 / _4210;
        float _4222 = _4214 * 6.283185482025146484375;
        float _4224 = cos(_4222);
        float _4226 = _4218 * _4220;
        float _4228 = _4214 * 6.283185482025146484375;
        float _4230 = sin(_4228);
        float _4232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4234 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4232;
        float _4236 = _4224 * _4226;
        float _4238 = 1.0 / _4234;
        float _4240 = 1.0 / _4236;
        float _4242 = _4230 * _4240;
        float _4244 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4246 = fma(_4150, _4242, _4244);
        float _4248 = _4246 * _4238;
        float _4250 = precise::clamp(_4248, 0.0, 1.0);
        _4202 = _4250;
    }
    float _4252 = _4202;
    float _4254 = _4166 * _4186;
    float _4256 = -_4126;
    float _4258 = _4256 + 1.0;
    float _4260 = -_4069;
    float _4262 = _4260 + 1.0;
    float _4264 = _4254 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4266 = _4258 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.z = _4190;
    out.m_91.w = _4007;
    bool _4268 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4270 = isnan(_3765);
    bool _4272 = _4268 || _4270;
    bool _4274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4276 = _4272 || _4274;
    float _4278 = _4262 * _4264;
    float _4280 = precise::clamp(_4278, 0.0, 1.0);
    float _4282 = _4266 * _4071;
    float _4284 = -_4266;
    float _4286 = _4284 + 1.0;
    float _4288 = -_4280;
    float _4290 = fma(_4288, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4292 = _4082 * _4282;
    float _4294 = _4092 * _4282;
    float _4296 = _4082 * _4286;
    float _4298 = _4290 * _4110;
    float _4300 = fma(_4088, _4292, _4076);
    float _4302 = fma(_4090, _4292, _4078);
    float _4304 = fma(_4082, _4294, _4080);
    float _4306 = _4298 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _4025;
    out.gl_Position.y = _4045;
    out.gl_Position.z = _4124;
    out.gl_Position.w = _4007;
    float _4308 = _4252 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _4306;
    out.m_95.x = _4300;
    out.m_95.y = _4302;
    out.m_95.z = _4304;
    out.m_95.w = _4296;
    if (!_4276)
    {
        _4194 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4310 = _4194;
    float _4312 = _4310;
    float _4314 = _4310;
    if (!_4276)
    {
        _4196 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4316 = _4196;
    float _4318 = _4316;
    float _4320 = _4316;
    if (!_4276)
    {
        _4198 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4322 = _4198;
    bool _4324 = !_4276;
    float _4326 = _4322;
    float _4328 = _4322;
    if (!_4324)
    {
        bool _4330 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4332 = isnan(_3765);
        bool _4334 = _4330 || _4332;
        bool _4336 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4338 = _4334 || _4336;
        if (!_4338)
        {
            float _4340 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4342 = _3765 + _4340;
            float _4344 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4346 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4344;
            float _4348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4350 = _4348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4352 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4354 = _4352 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4356 = 1.0 / _4346;
            float _4358 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4360 = _4358 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4362 = _4342 * _4356;
            float _4364 = precise::clamp(_4362, 0.0, 1.0);
            float _4366 = fma(_4364, _4350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4368 = fma(_4364, _4354, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4370 = fma(_4364, _4360, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4320 = _4368;
            _4314 = _4366;
            _4328 = _4370;
            _4372 = true;
        }
        else
        {
            bool _4374 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4376 = isnan(_3765);
            bool _4378 = _4374 || _4376;
            bool _4380 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4382 = _4378 || _4380;
            if (!_4382)
            {
                _4312 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4384 = _4312;
            _4314 = _4384;
            if (!_4382)
            {
                _4318 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4386 = _4318;
            _4320 = _4386;
            if (!_4382)
            {
                _4326 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4388 = _4326;
            bool _4390 = !_4382;
            _4328 = _4388;
            if (!_4390)
            {
                bool _4392 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4394 = isnan(_3765);
                bool _4396 = _4392 || _4394;
                bool _4398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4400 = _4396 || _4398;
                if (!_4400)
                {
                    float _4402 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4404 = _3765 + _4402;
                    float _4406 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4408 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4406;
                    float _4410 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4412 = _4410 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4416 = _4414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4418 = 1.0 / _4408;
                    float _4420 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4422 = _4420 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4424 = _4404 * _4418;
                    float _4426 = precise::clamp(_4424, 0.0, 1.0);
                    float _4428 = fma(_4426, _4412, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4430 = fma(_4426, _4416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4432 = fma(_4426, _4422, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4320 = _4430;
                    _4314 = _4428;
                    _4328 = _4432;
                    _4372 = true;
                }
                else
                {
                    _4320 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4314 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4328 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4372 = false;
    float _4434 = _4320;
    float _4436 = _4314;
    float _4438 = _4328;
    float _4440 = _4308 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_97.x = 0.0;
    float _4442 = _4434 * 0.586610972881317138671875;
    bool _4444 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4440;
    float _4446 = fma(_4436, 0.298911988735198974609375, _4442);
    bool _4448 = _4252 > 0.0;
    bool _4450 = isnan(_4252);
    bool _4452 = _4448 || _4450;
    bool _4454 = isnan(0.0);
    bool _4456 = _4452 || _4454;
    float _4458 = fma(_4438, 0.114477999508380889892578125, _4446);
    float _4460 = -_4458;
    float _4462 = _4460 + _4436;
    float _4464 = -_4458;
    float _4466 = _4464 + _4434;
    float _4468 = -_4458;
    float _4470 = _4468 + _4438;
    float _4472 = fma(_4462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    float _4474 = fma(_4466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    float _4476 = fma(_4470, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    bool _4478 = !_4444;
    if (!_4478)
    {
        float _4480 = -_3727;
        float _4482 = _4480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4484 = -_3733;
        float _4486 = _4484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4488 = -_3741;
        float _4490 = _4488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4492 = _4482 * _4482;
        float _4494 = fma(_4486, _4486, _4492);
        float _4496 = fma(_4490, _4490, _4494);
        float _4498 = sqrt(_4496);
        float _4500 = rsqrt(_4496);
        float _4502 = -_4498;
        float _4504 = _4502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4506 = _4504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4508 = precise::clamp(_4506, 0.0, 1.0);
        float _4510 = _4486 * _4500;
        float _4512 = _4482 * _4500;
        float _4514 = abs(_4508);
        float _4516 = log2(_4514);
        float _4518 = _4490 * _4500;
        float _4520 = _4510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4522 = _3631 * _4512;
        float _4524 = -_4512;
        float _4526 = -_4520;
        float _4528 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4526);
        float _4530 = fma(_3629, _4510, _4522);
        float _4532 = -_4518;
        float _4534 = fma(_4532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4528);
        float _4536 = fma(_3343, _4518, _4530);
        float _4538 = precise::clamp(_4536, 0.0, 1.0);
        float _4540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4542 = _4534 + _4540;
        float _4544 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4546 = _4542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4548 = precise::clamp(_4546, 0.0, 1.0);
        float _4550 = exp2(_4544);
        float _4552 = _4550 * _4548;
        float _4554 = _4538 * _4552;
        float _4556 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4558 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4560 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _4556;
        out.m_97.y = _4558;
        out.m_97.z = _4560;
    }
    out.m_99.x = _4472;
    out.m_99.y = _4474;
    out.m_99.z = _4476;
    if (_4456)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _4562 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4562;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4372 = false;
    bool _3687 = false;
    bool _296 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = in.m_50.w;
    float _117 = trunc(_113);
    int _120 = int(_117);
    float _122 = -_115;
    float _124 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _124;
    bool _128 = _120 >= 1;
    float _130 = 0.0;
    float _132 = _115;
    float _134 = _124;
    if (!_128)
    {
        _130 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _136 = _130;
    if (!_128)
    {
        out.m_55.x = 0.0;
    }
    int _138 = 0;
    if (!_128)
    {
        float _140 = _136 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_128)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4630 = as_type<float>(_142);
        out.gl_Position.z = _4630;
    }
    if (!_128)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _146 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _148 = isnan(_115);
    bool _150 = _146 || _148;
    bool _152 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _154 = _150 || _152;
    float _156 = float(_120);
    bool _158 = _124 >= _156;
    bool _160 = !_154;
    bool _162 = _158 || _160;
    float _164 = 1.0 / _156;
    if (_162)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _132;
    if (_162)
    {
        out.m_55.x = 0.0;
    }
    float _168 = _124 * _164;
    float _170 = _168;
    if (_162)
    {
        float _172 = _166 * 5.0;
        _144 = as_type<int>(_172);
    }
    int _174 = _144;
    out.m_53.x = _168;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4693 = as_type<float>(_174);
        out.gl_Position.z = _4693;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _176 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    bool _178 = !_176;
    float _196;
    if (!_178)
    {
        float _180 = in.m_57.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[11].y, _124);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _168;
    }
    _198 = false;
    float _200 = _196;
    bool _202 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _204 = isnan(_200);
    bool _206 = _202 || _204;
    bool _208 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _210 = _206 || _208;
    float _212 = float(_210);
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _218 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _220 = isnan(_200);
    bool _222 = _218 || _220;
    bool _224 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _226 = _222 || _224;
    float _228 = float(_226);
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _236 = _200 + _234;
    float _238 = -_212;
    float _240 = _238 + 1.0;
    bool _242 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _244 = 1.0 / _216;
    float _246 = _228 * _240;
    float _248 = -_228;
    float _250 = _248 + 1.0;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _258 = _252 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _260 = _254 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _262 = _256 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _264 = _232 * _244;
    float _266 = fma(_264, _236, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _268 = _266 * _246;
    float _270 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[115].x, _268);
    float _272 = fma(_212, (*spvDescriptorSet0.vp_c9)._m0[116].x, _270);
    float _274 = _272 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    bool _276 = !_242;
    float _294;
    if (!_276)
    {
        float _278 = in.m_57.x;
        float _280 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _282 = _278 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _284 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[11].w, _124);
        float _286 = _284 * _280;
        float _288 = floor(_286);
        float _290 = -_288;
        float _292 = _286 + _290;
        _294 = _292;
        _296 = true;
    }
    else
    {
        _294 = _168;
    }
    _296 = false;
    float _298 = _294;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _302 = _298 + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _306 = _304 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _308;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _314 = _312 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _316 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _318 = isnan(_298);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _306;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _332 = _330 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _334 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _336 = isnan(_298);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    bool _346 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _348 = 1.0 / _314;
    float _350 = _310 * _328;
    bool _352 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _354 = isnan(_298);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = 1.0 / _332;
    float _366 = -_326;
    float _368 = _366 + 1.0;
    float _370 = fma(_350, _302, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _376 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _378 = isnan(_298);
    bool _380 = _376 || _378;
    bool _382 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _384 = _380 || _382;
    float _386 = float(_384);
    float _388 = -_362;
    float _390 = _388 + 1.0;
    float _392 = _362 * _368;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _398 = 1.0 / _374;
    float _400 = -_386;
    float _402 = _400 + 1.0;
    float _404 = _344 * _390;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _406;
    float _410 = _396 * _348;
    float _412 = _326 * _402;
    float _414 = _370 * _404;
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _418 = _298 + _416;
    float _420 = -_344;
    float _422 = _420 + 1.0;
    bool _424 = _298 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _426 = isnan(_298);
    bool _428 = _424 || _426;
    bool _430 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _432 = _428 || _430;
    float _434 = float(_432);
    float _436 = _408 * _364;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _444 = _298 + _442;
    float _446 = fma(_410, _418, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _448 = fma(_422, (*spvDescriptorSet0.vp_c9)._m0[131].x, _414);
    float _450 = -_434;
    float _452 = _450 + 1.0;
    float _454 = _440 * _398;
    float _456 = fma(_436, _444, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _460 = _298 + _458;
    float _462 = fma(_446, _392, _448);
    float _464 = _386 * _452;
    float _466 = fma(_454, _460, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _468 = fma(_456, _412, _462);
    float _470 = fma(_466, _464, _468);
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _474 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _478 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[135].x, _470);
    float _480 = _472 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _482 = _474 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _484 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _486 = _478 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _488 = !_346;
    int _490 = as_type<int>(_364);
    int _492 = as_type<int>(_398);
    if (!_488)
    {
        float _494 = in.m_57.x;
        float _496 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _498 = _494 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _500 = fma(_498, (*spvDescriptorSet0.vp_c9)._m0[14].x, _124);
        float _502 = _500 * _496;
        float _504 = floor(_502);
        float _506 = -_504;
        float _508 = _502 + _506;
        _170 = _508;
    }
    float _510 = _170;
    float _512 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _514 = int(_512);
    float _516 = in.m_59.x;
    int _518 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _520 = _518 != 0;
    float _522 = in.m_57.y;
    float _524 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _526 = int(_524);
    float _528 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _530 = int(_528);
    float _532 = float(_514);
    float _534 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _536 = int(_534);
    float _538 = float(_526);
    float _540 = 0.0;
    float _542 = _516;
    if (!_520)
    {
        _540 = _516;
    }
    float _544 = _540;
    float _546 = 1.0 / _532;
    float _548 = float(_530);
    float _550 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _552 = int(_550);
    float _554 = float(uint(_536));
    float _556 = 1.0 / _538;
    float _558 = _546 * _124;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _562 = int(_560);
    float _564 = float(uint(_552));
    float _566 = 1.0 / _548;
    float _568 = _556 * _124;
    int _570 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _572 = _570 != 0;
    float _574 = 1.0 / _554;
    float _576 = float(uint(_562));
    int _578 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _580 = _578 != 0;
    int _582 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _584 = _582 != 0;
    bool _586 = _522 > 0.5;
    float _588 = 1.0 / _564;
    float _590 = _566 * _124;
    float _592 = 0.0;
    float _594 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _596 = _544;
    if (_572)
    {
        float _598 = in.m_57.x;
        _592 = _598;
    }
    float _600 = _592;
    float _602 = 0.0;
    if (_572)
    {
        _602 = 1.0;
    }
    float _604 = _602;
    float _606 = trunc(_558);
    int _608 = int(_606);
    int _610 = as_type<int>(_574) + (-2);
    float _612 = _604;
    if (_580)
    {
        float _614 = -_516;
        float _616 = _614 + 1.0;
        _490 = as_type<int>(_616);
    }
    int _618 = _490;
    float _620 = as_type<float>(_618);
    if (_584)
    {
        float _622 = -_516;
        float _624 = _622 + 1.0;
        _492 = as_type<int>(_624);
    }
    int _626 = _492;
    float _628 = as_type<float>(_626);
    if (!_580)
    {
        _594 = _516;
    }
    float _630 = _594;
    float _632 = 0.0;
    float _634 = _630;
    if (!_584)
    {
        _632 = _516;
    }
    float _636 = _632;
    float _638 = 1.0 / _576;
    int _640 = as_type<int>(_588) + (-2);
    float _642 = _636;
    if (_580)
    {
        float _644 = _586 ? as_type<float>(_618) : _516;
        _634 = _644;
    }
    float _646 = _634;
    if (_584)
    {
        float _648 = _586 ? as_type<float>(_626) : _516;
        _642 = _648;
    }
    float _650 = _642;
    if (_572)
    {
        _620 = 1.0;
    }
    float _652 = _620;
    float _654 = trunc(_590);
    int _656 = int(_654);
    float _658 = float(uint(_608));
    float _660 = as_type<float>(_640) * _658;
    float _662 = trunc(_568);
    int _664 = int(_662);
    int _666 = as_type<int>(_638) + (-2);
    float _668 = float(uint(_656));
    float _670 = trunc(_660);
    float _672 = precise::max(_670, 0.0);
    uint _675 = uint(_672);
    float _677 = as_type<float>(_666) * _668;
    int _679 = as_type<int>(_668);
    float _681 = _660;
    float _683 = _652;
    if (_572)
    {
        _679 = 0;
    }
    int _685 = _679;
    float _687 = float(uint(_664));
    float _689 = trunc(_677);
    float _691 = precise::max(_689, 0.0);
    uint _693 = uint(_691);
    float _695 = _600;
    int _697 = _685;
    if (_572)
    {
        _681 = _600;
    }
    float _699 = _681;
    float _701 = as_type<float>(_610) * _687;
    float _703 = 0.0;
    float _705 = _699;
    if (_572)
    {
        _703 = _699;
    }
    float _707 = _703;
    float _709 = _707;
    if (_572)
    {
        _628 = _699;
    }
    float _711 = _628;
    float _713 = trunc(_701);
    float _715 = precise::max(_713, 0.0);
    uint _717 = uint(_715);
    int _719 = int(_572);
    int _721 = _586 ? 2 : 0;
    int _723 = _719 | _721;
    int _725 = false ? 4 : 0;
    int _727 = _723 | _725;
    int _729 = false ? 8 : 0;
    int _731 = _727 | _729;
    int _733 = _580 ? 16 : 0;
    int _735 = _731 | _733;
    int _737 = false ? 32 : 0;
    int _739 = _735 | _737;
    int _741 = _584 ? 64 : 0;
    int _743 = _739 | _741;
    int _745 = _743 & 2;
    float _747 = as_type<float>(_745);
    float _749 = _711;
    if (_572)
    {
        _747 = _522;
    }
    float _751 = _747;
    float _753 = _751;
    if (!_572)
    {
        float _755 = in.m_57.x;
        float _757 = _522 * 3.1415927410125732421875;
        float _759 = in.m_57.z;
        float _761 = _757 * 0.15915493667125701904296875;
        float _763 = _761 * 6.283185482025146484375;
        float _765 = sin(_763);
        float _767 = _755 * 3.1415927410125732421875;
        float _769 = _767 * 0.15915493667125701904296875;
        float _771 = _769 * 6.283185482025146484375;
        float _773 = sin(_771);
        _612 = 7.345489978790283203125;
        _695 = _755;
        _749 = _522;
        _709 = _759;
        _683 = 5.839270114898681640625;
        _753 = _765;
        _697 = 2;
        _705 = _773;
    }
    float _775 = _612;
    float _777 = _695;
    float _779 = _749;
    float _781 = _709;
    float _783 = _683;
    float _785 = _753;
    int _787 = _697;
    float _789 = _705;
    int _791 = ~_536;
    int _793 = _791 + 1;
    float _795 = _775 * _777;
    int _797 = ~_552;
    int _799 = _797 + 1;
    float _801 = _779 * _775;
    int _803 = ~_562;
    int _805 = _803 + 1;
    int _807 = _793 * int(_717);
    int _809 = _807 + _664;
    float _811 = _781 * _783;
    float _813 = floor(_795);
    int _815 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _817 = _815 != 0;
    float _819 = in.m_59.y;
    float _821 = float(uint(_809));
    int _823 = _799 * int(_675);
    int _825 = _823 + _608;
    int _827 = _805 * int(_693);
    int _829 = _827 + _656;
    bool _831 = _552 == 0;
    float _833 = as_type<float>(_610) * _821;
    float _835 = float(uint(_825));
    float _837 = floor(_801);
    float _839 = float(uint(_829));
    float _841 = in.m_57.z;
    float _843 = as_type<float>(_640) * _835;
    float _845 = as_type<float>(_666) * _839;
    float _847 = -_813;
    float _849 = _795 + _847;
    float _851 = floor(_811);
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _855 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _857 = _777 * 2.0;
    float _859 = fma(_785, (*spvDescriptorSet0.vp_c9)._m0[93].w, _855);
    float _861 = _785 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _863 = trunc(_833);
    float _865 = precise::max(_863, 0.0);
    uint _867 = uint(_865);
    float _869 = -_837;
    float _871 = _801 + _869;
    float _873 = float(_536);
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _877 = float(_664);
    float _879 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].w, _859);
    int _881 = ~_536;
    int _883 = _881 + 1;
    out.m_61.x = _258;
    out.m_61.y = _260;
    out.m_61.z = _262;
    out.m_61.w = _274;
    float _885 = trunc(_843);
    float _887 = precise::max(_885, 0.0);
    uint _889 = uint(_887);
    float _891 = -_851;
    float _893 = _811 + _891;
    float _895 = float(_552);
    out.m_63.x = _480;
    out.m_63.y = _482;
    out.m_63.z = _484;
    out.m_63.w = _486;
    float _897 = float(_608);
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _901 = _510 + _899;
    bool _903 = _877 >= _873;
    bool _905 = isnan(_877);
    bool _907 = _903 || _905;
    bool _909 = isnan(_873);
    bool _911 = _907 || _909;
    float _913 = float(_911);
    float _915 = _895 * _893;
    float _917 = trunc(_845);
    float _919 = precise::max(_917, 0.0);
    uint _921 = uint(_919);
    int _923 = int(_717) + int(_867);
    float _925 = _164 * _124;
    float _927 = float(_562);
    float _929 = _873 * _849;
    bool _931 = _897 >= _895;
    bool _933 = isnan(_897);
    bool _935 = _931 || _933;
    bool _937 = isnan(_895);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    float _943 = _873 * _925;
    float _945 = _895 * _925;
    int _947 = int(_675) + int(_889);
    float _949 = _927 * _925;
    int _951 = ~_536;
    int _953 = _951 + 1;
    float _955 = _927 * _871;
    int _957 = ~_562;
    int _959 = _957 + 1;
    float _961 = trunc(_929);
    int _963 = int(_961);
    float _965 = float(_656);
    int _967 = _953 * _923;
    int _969 = _967 + _664;
    int _971 = int(_693) + int(_921);
    float _973 = in.m_65.x;
    float _975 = in.m_65.y;
    float _977 = in.m_65.z;
    int _979 = ~_552;
    int _981 = _979 + 1;
    bool _983 = _965 >= _927;
    bool _985 = isnan(_965);
    bool _987 = _983 || _985;
    bool _989 = isnan(_927);
    bool _991 = _987 || _989;
    float _993 = float(_991);
    int _995 = _959 * _971;
    int _997 = _995 + _656;
    bool _999 = uint(_969) >= uint(_536);
    int _1001 = _981 * _947;
    int _1003 = _1001 + _608;
    float _1005 = trunc(_915);
    int _1007 = int(_1005);
    bool _1009 = !_999;
    int _1011 = _1009 ? 0 : (-1);
    bool _1013 = uint(_1003) >= uint(_552);
    float _1015 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1017 = uint(_997) >= uint(_562);
    float _1019 = trunc(_993);
    int _1021 = int(_1019);
    int _1023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1025 = _1023 != 0;
    float _1027 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1015);
    bool _1029 = !_817;
    int _1031 = _1029 ? 0 : 1;
    int _1033 = ~_923;
    int _1035 = _1033 + _1011;
    int _1037 = _1035 + 1;
    bool _1039 = !_1013;
    int _1041 = _1039 ? 0 : (-1);
    float _1043 = trunc(_913);
    int _1045 = int(_1043);
    bool _1047 = !_1025;
    int _1049 = _1047 ? 0 : 1;
    int _1051 = _536 * _1037;
    int _1053 = _1051 + _664;
    int _1055 = abs(_1031);
    bool _1057 = !_1017;
    int _1059 = _1057 ? 0 : (-1);
    int _1061 = ~_947;
    int _1063 = _1061 + _1041;
    int _1065 = _1063 + 1;
    float _1067 = trunc(_941);
    int _1069 = int(_1067);
    int _1071 = abs(_1049);
    int _1073 = _963 * _1055;
    int _1075 = _1073 + _664;
    int _1077 = ~_971;
    int _1079 = _1077 + _1059;
    int _1081 = _1079 + 1;
    int _1083 = _552 * _1065;
    int _1085 = _1083 + _608;
    int _1087 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1089 = _1087 != 0;
    int _1091 = _1007 * _1071;
    int _1093 = _1091 + _608;
    bool _1095 = _536 == 0;
    int _1097 = _562 * _1081;
    int _1099 = _1097 + _656;
    bool _1101 = _562 == 0;
    float _1103 = trunc(_955);
    int _1105 = int(_1103);
    bool _1107 = !_1089;
    int _1109 = _1107 ? 0 : 1;
    int _1111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1113 = _1111 != 0;
    int _1115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1117 = _1115 != 0;
    int _1119 = abs(_1109);
    float _1121 = floor(_857);
    int _1123 = ~_1021;
    int _1125 = _1123 + 1;
    int _1127 = _1125 + 1;
    bool _1129 = !_1101;
    int _1131 = _1129 ? _1099 : (-1);
    int _1133 = ~_1045;
    int _1135 = _1133 + 1;
    int _1137 = _1135 + 1;
    int _1139 = _1105 * _1119;
    int _1141 = _1139 + _656;
    bool _1143 = !_1095;
    int _1145 = _1143 ? _1053 : (-1);
    int _1147 = _1127 * _1131;
    int _1149 = ~_1069;
    int _1151 = _1149 + 1;
    int _1153 = _1151 + 1;
    float _1155 = trunc(_945);
    int _1157 = int(_1155);
    bool _1159 = !_1117;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = _1137 * _1145;
    bool _1165 = !_1113;
    int _1167 = _1165 ? 0 : 1;
    bool _1169 = !_831;
    int _1171 = _1169 ? _1085 : (-1);
    int _1173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1175 = _1173 != 0;
    int _1177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1179 = _1177 != 0;
    float _1181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _1183 = _536 + (-1);
    int _1185 = _1153 * _1171;
    int _1187 = _552 + (-1);
    bool _1189 = !_1179;
    int _1191 = _1189 ? 0 : 1;
    int _1193 = _1045 * _1183;
    int _1195 = _1193 + _1163;
    bool _1197 = !_1175;
    int _1199 = _1197 ? 0 : 1;
    int _1201 = _1069 * _1187;
    int _1203 = _1201 + _1185;
    int _1205 = abs(_1191);
    int _1207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1209 = _1207 != 0;
    int _1211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1213 = _1211 != 0;
    int _1215 = _1203 * _1205;
    int _1217 = abs(_1199);
    bool _1219 = !_1209;
    int _1221 = _1219 ? 0 : 1;
    float _1223 = trunc(_943);
    int _1225 = int(_1223);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1229 = _1227 != 0;
    int _1231 = _1157 * _1217;
    int _1233 = _1231 + _1215;
    bool _1235 = !_1213;
    int _1237 = _1235 ? 0 : 1;
    int _1239 = abs(_1161);
    bool _1241 = !_1229;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = abs(_1237);
    int _1247 = abs(_1167);
    int _1249 = abs(_1243);
    int _1251 = _1195 * _1239;
    int _1253 = _1093 * _1245;
    int _1255 = _1253 + _1233;
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1259 = _1257 != 0;
    int _1261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1263 = _1261 != 0;
    int _1265 = _1225 * _1247;
    int _1267 = _1265 + _1251;
    int _1269 = abs(_1221);
    int _1271 = _1007 * _1249;
    int _1273 = _1271 + _1255;
    float _1275 = trunc(_949);
    int _1277 = int(_1275);
    bool _1279 = !_1263;
    int _1281 = _1279 ? 0 : 1;
    int _1283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1285 = _1283 != 0;
    int _1287 = _1075 * _1269;
    int _1289 = _1287 + _1267;
    float _1291 = float(uint(_1273));
    int _1293 = abs(_1281);
    bool _1295 = !_1285;
    int _1297 = _1295 ? 0 : 1;
    float _1299 = as_type<float>(_640) * _1291;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1303 = _1301 != 0;
    int _1305 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1307 = _1305 != 0;
    int _1309 = _562 + (-1);
    int _1311 = abs(_1297);
    float _1313 = trunc(_1299);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    bool _1319 = !_1303;
    int _1321 = _1319 ? 0 : 1;
    int _1323 = _1021 * _1309;
    int _1325 = _1323 + _1147;
    bool _1327 = !_1259;
    int _1329 = _1327 ? 0 : 1;
    int _1331 = abs(_1321);
    int _1333 = _1325 * _1293;
    int _1335 = abs(_1329);
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1339 = _1337 != 0;
    int _1341 = _1277 * _1335;
    int _1343 = _1341 + _1333;
    int _1345 = ~_552;
    int _1347 = _1345 + 1;
    int _1349 = _963 * _1311;
    int _1351 = _1349 + _1289;
    bool _1353 = !_1307;
    int _1355 = _1353 ? 0 : 1;
    int _1357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1359 = _1357 != 0;
    int _1361 = abs(_1355);
    int _1363 = _1141 * _1331;
    int _1365 = _1363 + _1343;
    float _1367 = float(uint(_1351));
    int _1369 = _1347 * int(_1317);
    int _1371 = _1369 + _1273;
    float _1373 = as_type<float>(_1245);
    bool _1375 = _1285;
    float _1377 = _861;
    float _1379 = _819;
    if (_1339)
    {
        float _1381 = in.m_57.x;
        _1373 = _1381;
    }
    float _1383 = _1373;
    int _1385 = _1105 * _1361;
    int _1387 = _1385 + _1365;
    bool _1389 = _536 == 0;
    float _1391 = as_type<float>(_610) * _1367;
    float _1393 = float(uint(_1371));
    float _1395 = as_type<float>(_1331);
    int _1397 = as_type<int>(_1393);
    float _1399 = as_type<float>(_1387);
    if (_1359)
    {
        float _1401 = in.m_57.z;
        _1395 = _1401;
    }
    float _1403 = _1395;
    float _1405 = float(uint(_1387));
    float _1407 = trunc(_1391);
    float _1409 = precise::max(_1407, 0.0);
    uint _1411 = uint(_1409);
    float _1413 = as_type<float>(_640) * _1393;
    float _1415 = as_type<float>(_666) * _1405;
    int _1417 = ~_536;
    int _1419 = _1417 + 1;
    int _1421 = as_type<int>(_1415);
    if (_1339)
    {
        float _1423 = -_516;
        float _1425 = _1423 + 1.0;
        _1397 = as_type<int>(_1425);
    }
    int _1427 = _1397;
    float _1429 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1431 = trunc(_1413);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    float _1437 = fma(_861, -2.0, _1429);
    float _1439 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _1441 = ~_562;
    int _1443 = _1441 + 1;
    float _1445 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1437);
    int _1447 = ~_552;
    int _1449 = _1447 + 1;
    float _1451 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1453 = trunc(_1415);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = _1419 * int(_1411);
    int _1461 = _1459 + _1351;
    if (_1339)
    {
        bool _1463 = _1383 > 0.5;
        _1375 = _1463;
    }
    bool _1465 = _1375;
    int _1467 = ~_562;
    int _1469 = _1467 + 1;
    bool _1471 = _1465;
    if (_1339)
    {
        float _1473 = _1465 ? as_type<float>(_1427) : _516;
        _596 = _1473;
    }
    float _1475 = _596;
    float _1477 = float(uint(_1461));
    if (_1359)
    {
        float _1479 = -_516;
        float _1481 = _1479 + 1.0;
        _1421 = as_type<int>(_1481);
    }
    int _1483 = _1421;
    int _1485 = int(_1317) + int(_1435);
    if (_1359)
    {
        bool _1487 = _1403 > 0.5;
        _1471 = _1487;
    }
    bool _1489 = _1471;
    int _1491 = ~_552;
    int _1493 = _1491 + 1;
    int _1495 = _1469 * int(_1457);
    int _1497 = _1495 + _1387;
    float _1499 = as_type<float>(_610) * _1477;
    if (_1359)
    {
        float _1501 = _1489 ? as_type<float>(_1483) : _516;
        _542 = _1501;
    }
    float _1503 = _542;
    float _1505 = _522 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1507 = _787 != 2;
    float _1509 = float(uint(_1497));
    int _1511 = _1493 * _1485;
    int _1513 = _1511 + _1273;
    float _1515 = trunc(_1499);
    float _1517 = precise::max(_1515, 0.0);
    uint _1519 = uint(_1517);
    float _1521 = _1503 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1523 = as_type<float>(_666) * _1509;
    bool _1525 = uint(_1513) >= uint(_552);
    float _1527 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1529 = ~_536;
    int _1531 = _1529 + 1;
    float _1533 = trunc(_1523);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    bool _1539 = !_1525;
    int _1541 = _1539 ? 0 : (-1);
    float _1543 = fma(_1505, -2.0, _1527);
    int _1545 = ~_1485;
    int _1547 = _1545 + _1541;
    int _1549 = _1547 + 1;
    float _1551 = _789 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _1553 = _522 > 0.5;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    int _1557 = int(_1411) + int(_1519);
    int _1559 = _552 * _1549;
    int _1561 = _1559 + _1273;
    float _1563 = -_853;
    float _1565 = fma(_1551, 2.0, _1563);
    if (_1507)
    {
        _1377 = _777;
    }
    float _1567 = _1377;
    float _1569 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1543);
    bool _1571 = !_831;
    int _1573 = _1571 ? _1561 : (-1);
    int _1575 = _1531 * _1557;
    int _1577 = _1575 + _1351;
    float _1579 = fma(_789, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1555);
    int _1581 = int(_1457) + int(_1537);
    float _1583 = -_124;
    float _1585 = fma(_1583, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1565);
    int _1587 = _1573 & 3;
    bool _1589 = _1587 != 0;
    float _1591 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1579);
    bool _1593 = uint(_1577) >= uint(_536);
    int _1595 = _1589 ? 0 : 1;
    bool _1597 = _1587 != 3;
    bool _1599 = !_1593;
    int _1601 = _1599 ? 0 : (-1);
    int _1603 = ~_562;
    int _1605 = _1603 + 1;
    bool _1607 = uint(_1587) >= 2u;
    int _1609 = ~_1557;
    int _1611 = _1609 + _1601;
    int _1613 = _1611 + 1;
    int _1615 = _1605 * _1581;
    int _1617 = _1615 + _1387;
    int _1619 = _1607 ? 0 : 1;
    bool _1621 = uint(_1587) > 1u;
    int _1623 = _536 * _1613;
    int _1625 = _1623 + _1351;
    int _1627 = ~_1619;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    int _1633 = _1631;
    float _1635 = _1567;
    if (_1597)
    {
        int _1637 = ~_1619;
        int _1639 = _1637 + 1;
        _1633 = _1639;
    }
    int _1641 = _1633;
    float _1643 = _777 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _1645 = uint(_1617) >= uint(_562);
    float _1647 = -_819;
    float _1649 = _1647 + 1.0;
    bool _1651 = !_1389;
    int _1653 = _1651 ? _1625 : (-1);
    float _1655 = -_875;
    float _1657 = fma(_1643, 2.0, _1655);
    bool _1659 = !_1645;
    int _1661 = _1659 ? 0 : (-1);
    float _1663 = float(uint(_1093));
    float _1665 = -_124;
    float _1667 = fma(_1665, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1657);
    int _1669 = ~_1581;
    int _1671 = _1669 + _1661;
    int _1673 = _1671 + 1;
    int _1675 = _1653 & 3;
    float _1677 = as_type<float>(_640) * _1663;
    int _1679 = ~_1595;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    int _1685 = _562 * _1673;
    int _1687 = _1685 + _1387;
    int _1689 = _1683;
    if (!_1621)
    {
        int _1691 = ~_1595;
        int _1693 = _1691 + 1;
        _1689 = _1693;
    }
    int _1695 = _1689;
    float _1697 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1699 = log2(_1697);
    bool _1701 = _1675 != 3;
    if (!_1507)
    {
        _1635 = _841;
    }
    float _1703 = _1635;
    int _1705 = _1553 ? as_type<int>(_1649) : as_type<int>(_819);
    bool _1707 = _562 == 0;
    float _1709 = trunc(_1677);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    bool _1715 = uint(_1675) >= 2u;
    float _1717 = _1703 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _1719 = !_1707;
    int _1721 = _1719 ? _1687 : (-1);
    int _1723 = _1715 ? 0 : 1;
    float _1725 = -_1439;
    float _1727 = fma(_1717, 2.0, _1725);
    int _1729 = _1721 & 3;
    float _1731 = _1699 * _124;
    int _1733 = ~_1723;
    int _1735 = _1733 + 1;
    int _1737 = _1735 + 1;
    float _1739 = -_124;
    float _1741 = fma(_1739, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1727);
    int _1743 = _1737;
    if (_1701)
    {
        int _1745 = ~_1723;
        int _1747 = _1745 + 1;
        _1743 = _1747;
    }
    int _1749 = _1743;
    bool _1751 = uint(_1675) > 1u;
    float _1753 = exp2(_1731);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1757 = _1755 != 0;
    bool _1759 = _1729 != 3;
    int _1761 = ~_552;
    int _1763 = _1761 + 1;
    if (_1507)
    {
        _1399 = _522;
    }
    float _1765 = _1399;
    int _1767 = _1653 & 3;
    bool _1769 = _1767 != 0;
    int _1771 = _1763 * int(_1713);
    int _1773 = _1771 + _1093;
    bool _1775 = !_1757;
    int _1777 = _1775 ? 0 : 1;
    float _1779 = _1765;
    if (!_1507)
    {
        _1779 = _777;
    }
    float _1781 = _1779;
    bool _1783 = _841 > 0.5;
    float _1785 = -_1753;
    float _1787 = _1785 + 1.0;
    bool _1789 = uint(_1729) >= 2u;
    float _1791 = _1781 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1793 = _1769 ? 0 : 1;
    int _1795 = _1783 ? as_type<int>(_1649) : as_type<int>(_819);
    float _1797 = fma(_1791, -2.0, _1451);
    int _1799 = _1789 ? 0 : 1;
    int _1801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1803 = _1801 != 0;
    int _1805 = ~_1793;
    int _1807 = _1805 + 1;
    int _1809 = _1807 + 1;
    int _1811 = _1809;
    if (!_1751)
    {
        int _1813 = ~_1793;
        int _1815 = _1813 + 1;
        _1811 = _1815;
    }
    int _1817 = _1811;
    int _1819 = ~_1799;
    int _1821 = _1819 + 1;
    int _1823 = _1821 + 1;
    float _1825 = float(uint(_1773));
    float _1827 = _1803 ? as_type<float>(_1795) : _819;
    int _1829 = _1823;
    if (_1759)
    {
        int _1831 = ~_1799;
        int _1833 = _1831 + 1;
        _1829 = _1833;
    }
    int _1835 = _1829;
    float _1837 = as_type<float>(_640) * _1825;
    float _1839 = float(uint(_1075));
    float _1841 = in.m_57.w;
    bool _1843 = uint(_1729) > 1u;
    int _1845 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1847 = _1845 != 0;
    float _1849 = as_type<float>(_610) * _1839;
    float _1851 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1853 = _1721 & 3;
    bool _1855 = _1853 != 0;
    float _1857 = trunc(_1837);
    float _1859 = precise::max(_1857, 0.0);
    uint _1861 = uint(_1859);
    float _1863 = _1847 ? as_type<float>(_1795) : _819;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1867 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1869 = isnan(0.0);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1875 = _1871 || _1873;
    float _1877 = fma(_777, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1851);
    float _1879 = float(uint(_1141));
    float _1881 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1027);
    int _1883 = _1855 ? 0 : 1;
    float _1885 = trunc(_1849);
    float _1887 = precise::max(_1885, 0.0);
    uint _1889 = uint(_1887);
    float _1891 = _1875 ? _1787 : 0.0;
    float _1893 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1865);
    float _1895 = as_type<float>(_666) * _1879;
    int _1897 = ~_1883;
    int _1899 = _1897 + 1;
    int _1901 = _1899 + 1;
    float _1903 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1877);
    int _1905 = _1901;
    if (!_1843)
    {
        int _1907 = ~_1883;
        int _1909 = _1907 + 1;
        _1905 = _1909;
    }
    int _1911 = _1905;
    float _1913 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1893);
    bool _1915 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1917 = isnan(1.0);
    bool _1919 = _1915 || _1917;
    bool _1921 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1923 = _1919 || _1921;
    float _1925 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1927 = 1.0 + _1925;
    float _1929 = trunc(_1895);
    float _1931 = precise::max(_1929, 0.0);
    uint _1933 = uint(_1931);
    float _1935 = _522 * 2.0;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1939 = _1937 != 0;
    int _1941 = _883 * int(_1889);
    int _1943 = _1941 + _1075;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1947 = _1939 ? as_type<float>(_1705) : _819;
    float _1949 = 1.0 / _1927;
    bool _1951 = _1121 > 0.0;
    float _1953 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1945);
    float _1955 = float(uint(_1943));
    float _1957 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1797);
    float _1959 = fma(_124, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1953);
    int _1961 = _1443 * int(_1933);
    int _1963 = _1961 + _1141;
    float _1965 = floor(_1935);
    float _1967 = as_type<float>(_610) * _1955;
    float _1969 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1971 = _1969 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1975 = _1973 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    if (_1923)
    {
        float _1977 = _1891 * _1949;
        _134 = _1977;
    }
    float _1979 = _134;
    float _1981 = float(uint(_1963));
    float _1983 = trunc(_1967);
    float _1985 = precise::max(_1983, 0.0);
    uint _1987 = uint(_1985);
    bool _1989 = _1121 >= 0.0;
    bool _1991 = isnan(_1121);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2001 = _1999 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2003 = as_type<float>(_666) * _1981;
    int _2005 = _1997 ? 0 : 1;
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2009 = _2007 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    int _2011 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2013 = _2011 != 0;
    float _2015 = trunc(_2003);
    float _2017 = precise::max(_2015, 0.0);
    uint _2019 = uint(_2017);
    int _2021 = ~_2005;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2031 = _2025;
    if (!_1951)
    {
        int _2033 = ~_2005;
        int _2035 = _2033 + 1;
        _2031 = _2035;
    }
    int _2037 = _2031;
    float _2039 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2041 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2039;
    bool _2043 = _1841 > 0.5;
    int _2045 = int(_1713) + int(_1861);
    float _2047 = 1.0 / _2029;
    int _2049 = ~_536;
    int _2051 = _2049 + 1;
    if (_2013)
    {
        float _2053 = _2043 ? _1649 : _819;
        _1379 = _2053;
    }
    float _2055 = _1379;
    int _2057 = _1449 * _2045;
    int _2059 = _2057 + _1093;
    bool _2061 = _1965 >= 0.0;
    bool _2063 = isnan(_1965);
    bool _2065 = _2061 || _2063;
    bool _2067 = isnan(0.0);
    bool _2069 = _2065 || _2067;
    float _2071 = 1.0 / _2001;
    bool _2073 = _1965 > 0.0;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2077 = _2069 ? 0 : 1;
    bool _2079 = uint(_2059) >= uint(_552);
    int _2081 = int(_1889) + int(_1987);
    float _2083 = 1.0 / _1971;
    bool _2085 = !_2079;
    int _2087 = _2085 ? 0 : (-1);
    int _2089 = int(_1933) + int(_2019);
    int _2091 = _2051 * _2081;
    int _2093 = _2091 + _1075;
    int _2095 = ~_2045;
    int _2097 = _2095 + _2087;
    int _2099 = _2097 + 1;
    float _2101 = 1.0 / _1975;
    int _2103 = ~_562;
    int _2105 = _2103 + 1;
    int _2107 = ~_2077;
    int _2109 = _2107 + 1;
    int _2111 = _2109 + 1;
    int _2113 = _552 * _2099;
    int _2115 = _2113 + _1093;
    int _2117 = _2111;
    int _2119 = as_type<int>(_2075);
    if (!_2073)
    {
        int _2121 = ~_2077;
        int _2123 = _2121 + 1;
        _2117 = _2123;
    }
    int _2125 = _2117;
    float _2127 = in.m_48.x;
    float _2129 = in.m_48.y;
    float _2131 = in.m_48.z;
    bool _2133 = uint(_2093) >= uint(_536);
    int _2135 = _2105 * _2089;
    int _2137 = _2135 + _1141;
    float _2139 = 1.0 / _2009;
    bool _2141 = !_2133;
    int _2143 = _2141 ? 0 : (-1);
    bool _2145 = uint(_2137) >= uint(_562);
    float _2147 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2149 = _2147 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2151 = in.m_67.x;
    float _2153 = in.m_67.y;
    float _2155 = in.m_67.z;
    int _2157 = _1573 & 3;
    bool _2159 = _2157 != 0;
    bool _2161 = !_2145;
    int _2163 = _2161 ? 0 : (-1);
    bool _2165 = _1587 != 3;
    bool _2167 = !_831;
    int _2169 = _2167 ? _2115 : (-1);
    int _2171 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2173 = _2171 != 0;
    int _2175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2177 = _2175 != 0;
    int _2179 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2181 = _2179 != 0;
    float _2183 = 1.0 / _2149;
    bool _2185 = !_2159;
    int _2187 = _2185 ? 0 : 1;
    float _2189 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2191 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2193 = _2129 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _2195 = !_2165;
    int _2197 = _2195 ? 0 : (-1);
    float _2199 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2189);
    float _2201 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2191);
    float _2203 = fma(_2127, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2193);
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2207 = _2205 != 0;
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2211 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2209;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2215 = _2213 != 0;
    float _2217 = _2151 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _2219 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2221 = _2219 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2223 = _2041 * _2047;
    float _2225 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2229 = _2211 * _2183;
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2233 = _2231 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2235 = _2221 * _2071;
    float _2237 = _841 * 2.0;
    float _2239 = _2227 * _2083;
    float _2241 = _522 + _841;
    float _2243 = 1.0 / _2233;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2247 = _2245 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2249 = _2241 + (-1.0);
    float _2251 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _2253 = _2155 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _2255 = _2217 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2257 = floor(_2237);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2261 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2259;
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2263;
    float _2267 = fma(_2249, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2269 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _975);
    float _2271 = _2261 * _2101;
    float _2273 = _2265 * _2139;
    float _2275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _973);
    float _2277 = _2251 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _977);
    float _2281 = _2253 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2283 = _2255 * _2275;
    float _2285 = _2277 * _2269;
    float _2287 = _2247 * _2243;
    float _2289 = _2281 * _2279;
    float _2291 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2293 = _510 + _2291;
    bool _2295 = !_2173;
    int _2297 = _2295 ? 0 : 1;
    float _2299 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2199);
    bool _2301 = _2257 >= 0.0;
    bool _2303 = isnan(_2257);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan(0.0);
    bool _2309 = _2305 || _2307;
    float _2311 = fma(_2223, _2293, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2313 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2315 = isnan(_510);
    bool _2317 = _2313 || _2315;
    bool _2319 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2321 = _2317 || _2319;
    float _2323 = float(_2321);
    float _2325 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2201);
    float _2327 = fma(_2131, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2203);
    int _2329 = _2309 ? 0 : 1;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2333 = _510 + _2331;
    bool _2335 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2337 = isnan(_510);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2343 = _2339 || _2341;
    float _2345 = float(_2343);
    float _2347 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2349 = _510 + _2347;
    bool _2351 = _2257 > 0.0;
    float _2353 = -_2323;
    float _2355 = _2353 + 1.0;
    bool _2357 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2359 = isnan(_510);
    bool _2361 = _2357 || _2359;
    bool _2363 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2365 = _2361 || _2363;
    float _2367 = float(_2365);
    float _2369 = fma(_2239, _2333, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2371 = fma(_2229, _2349, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2373 = _2345 * _2355;
    float _2375 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2377 = _510 + _2375;
    bool _2379 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2381 = isnan(_510);
    bool _2383 = _2379 || _2381;
    bool _2385 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2387 = _2383 || _2385;
    float _2389 = float(_2387);
    float _2391 = -_2345;
    float _2393 = _2391 + 1.0;
    float _2395 = -_2367;
    float _2397 = _2395 + 1.0;
    float _2399 = fma(_2235, _2377, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2401 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2403 = isnan(_510);
    bool _2405 = _2401 || _2403;
    bool _2407 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2409 = _2405 || _2407;
    float _2411 = float(_2409);
    float _2413 = _2389 * _2393;
    float _2415 = -_2389;
    float _2417 = _2415 + 1.0;
    float _2419 = _2323 * _2397;
    float _2421 = in.m_69.x;
    float _2423 = in.m_69.y;
    float _2425 = in.m_69.z;
    int _2427 = ~_2329;
    int _2429 = _2427 + 1;
    int _2431 = _2429 + 1;
    float _2433 = fma(_1863, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    int _2435 = _2431;
    if (!_2351)
    {
        int _2437 = ~_2329;
        int _2439 = _2437 + 1;
        _2435 = _2439;
    }
    int _2441 = _2435;
    float _2443 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    bool _2445 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2447 = isnan(_510);
    bool _2449 = _2445 || _2447;
    bool _2451 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2453 = _2449 || _2451;
    float _2455 = float(_2453);
    float _2457 = _2325 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _2459 = _975 != 0.0;
    bool _2461 = isnan(_975);
    bool _2463 = _2459 || _2461;
    bool _2465 = isnan(0.0);
    bool _2467 = _2463 || _2465;
    float _2469 = _2327 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2471 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2473 = isnan(_510);
    bool _2475 = _2471 || _2473;
    bool _2477 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2479 = _2475 || _2477;
    float _2481 = float(_2479);
    float _2483 = _2455 * _2417;
    bool _2485 = _973 == 0.0;
    bool _2487 = !_2467;
    bool _2489 = _2485 && _2487;
    float _2491 = -_2455;
    float _2493 = _2491 + 1.0;
    bool _2495 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2497 = isnan(_510);
    bool _2499 = _2495 || _2497;
    bool _2501 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2503 = _2499 || _2501;
    float _2505 = float(_2503);
    float _2507 = -_2481;
    float _2509 = _2507 + 1.0;
    bool _2511 = _977 == 0.0;
    bool _2513 = _2511 && _2489;
    float _2515 = _2411 * _2493;
    float _2517 = -_2411;
    float _2519 = _2517 + 1.0;
    float _2521 = _2505 * _2509;
    float _2523 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2525 = _510 + _2523;
    float _2527 = _2481 * _2519;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2531 = _510 + _2529;
    float _2533 = _2311 * _2521;
    float _2535 = -_2505;
    float _2537 = _2535 + 1.0;
    float _2539 = fma(_2271, _2525, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2541 = fma(_2287, _901, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2543 = fma(_2273, _2531, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2545 = fma(_1947, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2547 = _2531;
    int _2549 = as_type<int>(_2545);
    float _2551 = _2533;
    float _2553 = _2421;
    float _2555 = _2423;
    if (_2513)
    {
        _2547 = _2423;
    }
    float _2557 = _2547;
    float _2559 = fma(_2537, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2533);
    float _2561 = -_1569;
    float _2563 = fma(_1959, _2545, _2561);
    float _2565 = _2075 * _1181;
    bool _2567 = !_2177;
    int _2569 = _2567 ? 0 : 1;
    float _2571 = _2557;
    if (_2513)
    {
        float _2573 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2557);
        _2549 = as_type<int>(_2573);
    }
    int _2575 = _2549;
    int _2577 = _2575;
    if (_2513)
    {
        _2551 = _2557;
    }
    float _2579 = _2551;
    float _2581 = fma(_2369, _2527, _2559);
    float _2583 = fma(_1475, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2585 = _2579;
    if (!_2513)
    {
        _2571 = _2423;
    }
    float _2587 = _2571;
    float _2589 = in.m_71.x;
    float _2591 = in.m_71.y;
    float _2593 = in.m_71.z;
    int _2595 = abs(_2569);
    if (!_2513)
    {
        float _2597 = fma(_973, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2421);
        _2553 = _2597;
    }
    float _2599 = _2553;
    float _2601 = float(_2037);
    float _2603 = _2599;
    if (!_2513)
    {
        float _2605 = fma(_975, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2587);
        _2577 = as_type<int>(_2605);
    }
    int _2607 = _2577;
    int _2609 = abs(_2297);
    out.m_73.w = _2565;
    float _2611 = _522 + _777;
    float _2613 = fma(_2371, _2515, _2581);
    float _2615 = float(_2441);
    float _2617 = _2611 + (-1.0);
    float _2619 = float(_2609);
    if (_2513)
    {
        float _2621 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2425);
        _2119 = as_type<int>(_2621);
    }
    int _2623 = _2119;
    float _2625 = float(_2595);
    int _2627 = _2623;
    if (!_2513)
    {
        float _2629 = fma(_977, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2425);
        _2627 = as_type<int>(_2629);
    }
    int _2631 = _2627;
    bool _2633 = !_2181;
    int _2635 = _2633 ? 0 : 1;
    float _2637 = fma(_2617, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _2639 = !_2513;
    float _2641 = _2639 ? as_type<float>(_2607) : _2587;
    float _2643 = _2625 * _2601;
    float _2645 = _522 + (-0.5);
    float _2647 = _2619 * _2615;
    if (_2513)
    {
        _2555 = _2425;
    }
    float _2649 = _2555;
    float _2651 = _2643 * (-2.0);
    int _2653 = abs(_2635);
    float _2655 = _2641 * _2641;
    bool _2657 = !_2513;
    float _2659 = _2657 ? as_type<float>(_2631) : _2425;
    float _2661 = fma(_2651, _2591, _2591);
    float _2663 = float(_2125);
    float _2665 = fma(_2267, _2651, _2267);
    float _2667 = float(_2653);
    float _2669 = fma(_2645, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2661);
    float _2671 = _2647 * (-2.0);
    float _2673 = fma(_2659, _2659, _2655);
    float _2675 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2677 = _2667 * _2663;
    float _2679 = fma(_2637, _2671, _2637);
    float _2681 = fma(_2671, _2589, _2589);
    float _2683 = _777 + _841;
    float _2685 = _777 + (-0.5);
    float _2687 = fma(_2665, _1979, _2669);
    float _2689 = _841 + (-0.5);
    float _2691 = rsqrt(_2673);
    float _2693 = fma(_2685, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2681);
    float _2695 = _2687 * 0.15915493667125701904296875;
    float _2697 = _2677 * (-2.0);
    float _2699 = fma(_1903, _2583, _1667);
    float _2701 = fma(_2679, _1979, _2693);
    float _2703 = fma(_2697, _2593, _2593);
    float _2705 = _2683 + (-1.0);
    float _2707 = _2701 * 0.15915493667125701904296875;
    float _2709 = -_1445;
    float _2711 = fma(_879, _2433, _2709);
    int _2713 = _1573 >> 31;
    float _2715 = fma(_2689, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2703);
    float _2717 = fma(_2705, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2719 = _1521 * _2675;
    float _2721 = _2711 + 0.5;
    float _2723 = _2641 * _2691;
    float _2725 = _2699 + 0.5;
    int _2727 = _2713 & 3;
    float _2729 = fma(_2717, _2697, _2717);
    float _2731 = _2659 * _2691;
    float _2733 = _2563 + 0.5;
    int _2735 = _1573 + _2727;
    float _2737 = fma(_2729, _1979, _2715);
    float _2739 = _2695 * 6.283185482025146484375;
    float _2741 = sin(_2739);
    int _2743 = ~_2081;
    int _2745 = _2743 + _2143;
    int _2747 = _2745 + 1;
    out.m_73.x = _2725;
    out.m_73.y = _2733;
    out.m_73.z = _2719;
    int _2749 = _2735 >> 2;
    float _2751 = _2737 * 0.15915493667125701904296875;
    float _2753 = fma(_1591, _2443, _1585);
    int _2755 = ~_2089;
    int _2757 = _2755 + _2163;
    int _2759 = _2757 + 1;
    int _2761 = _536 * _2747;
    int _2763 = _2761 + _1075;
    int _2765 = _2749 << 4;
    int _2767 = _2765 + 656;
    float _2769 = _2753 + 0.5;
    float _2771 = _2695 * 6.283185482025146484375;
    float _2773 = cos(_2771);
    float _2775 = _2649;
    if (!_2513)
    {
        _2775 = as_type<float>(_2631);
    }
    float _2777 = _2775;
    int _2779 = _562 * _2759;
    int _2781 = _2779 + _1141;
    int _2783 = abs(_2197);
    uint _2785 = uint(int(uint(_2767) >> uint(2)));
    uint _2787 = uint(int(uint(int(_2785)) >> uint(2)));
    int _2789 = int(_2785) & 3;
    float _2791 = (*spvDescriptorSet0.vp_c9)._m0[int(_2787)][_2789];
    int _2793 = int(_2785) + 1;
    uint _2795 = uint(int(uint(_2793) >> uint(2)));
    int _2797 = _2793 & 3;
    float _2799 = (*spvDescriptorSet0.vp_c9)._m0[int(_2795)][_2797];
    out.m_75.x = _2769;
    out.m_75.y = _2721;
    if (!_2513)
    {
        _2585 = as_type<float>(_2607);
    }
    float _2801 = _2585;
    float _2803 = fma(_2399, _2483, _2613);
    float _2805 = _2707 * 6.283185482025146484375;
    float _2807 = cos(_2805);
    float _2809 = _2299 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2811 = fma(_2539, _2413, _2803);
    int _2813 = _2767 + 8;
    uint _2815 = uint(int(uint(_2813) >> uint(2)));
    uint _2817 = uint(int(uint(int(_2815)) >> uint(2)));
    int _2819 = int(_2815) & 3;
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[int(_2817)][_2819];
    int _2823 = int(_2815) + 1;
    uint _2825 = uint(int(uint(_2823) >> uint(2)));
    int _2827 = _2823 & 3;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[int(_2825)][_2827];
    float _2831 = _2751 * 6.283185482025146484375;
    float _2833 = cos(_2831);
    float _2835 = fma(_2541, _2373, _2811);
    float _2837 = fma(_2543, _2419, _2835);
    float _2839 = _2707 * 6.283185482025146484375;
    float _2841 = sin(_2839);
    float _2843 = _2807 * _2773;
    float _2845 = _2807 * _2741;
    float _2847 = fma(_2367, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2837);
    float _2849 = _2751 * 6.283185482025146484375;
    float _2851 = sin(_2849);
    float _2853 = _2807 * _2833;
    float _2855 = _2773 * _2833;
    out.m_77.x = _2847;
    float _2857 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2859 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2861 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2863 = _2841 * _2741;
    float _2865 = _2841 * _2773;
    float _2867 = _2841 * _2833;
    float _2869 = _2741 * _2833;
    float _2871 = _2853 * _2285;
    float _2873 = -_2845;
    float _2875 = fma(_2851, _2865, _2873);
    float _2877 = -_2865;
    float _2879 = fma(_2851, _2845, _2877);
    float _2881 = fma(_2851, _2843, _2863);
    float _2883 = -_2285;
    float _2885 = _2851 * _2883;
    float _2887 = _2867 * _2285;
    float _2889 = -_2851;
    float _2891 = fma(_2889, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2857);
    float _2893 = -_2851;
    float _2895 = fma(_2893, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2859);
    float _2897 = fma(_2855, _2283, _2885);
    float _2899 = fma(_2881, _2283, _2871);
    float _2901 = fma(_2875, _2283, _2887);
    float _2903 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2891);
    float _2905 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2895);
    int _2907 = abs(_1695);
    float _2909 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2911 = abs(_2187);
    float _2913 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2915 = _2879 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2917 = ~_2907;
    int _2919 = _2917 + 1;
    int _2921 = _2919 + 1;
    float _2923 = fma(_2869, _2289, _2897);
    float _2925 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2909);
    float _2927 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2913);
    float _2929 = fma(_2869, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2915);
    int _2931 = abs(_1641);
    int _2933 = _2921 * as_type<int>(_2799);
    int _2935 = ~_2911;
    int _2937 = _2935 + 1;
    int _2939 = _2937 + 1;
    float _2941 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2943 = int(_2941);
    float _2945 = fma(_2879, _2289, _2899);
    float _2947 = fma(_2851, _2863, _2843);
    int _2949 = _2939 * as_type<int>(_2791);
    int _2951 = _2949 + _2933;
    int _2953 = ~_2931;
    int _2955 = _2953 + 1;
    int _2957 = _2955 + 1;
    float _2959 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2961 = fma(_2947, _2289, _2901);
    float _2963 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2927);
    int _2965 = abs(_1777);
    int _2967 = _2957 * as_type<int>(_2821);
    int _2969 = _2967 + _2951;
    float _2971 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2973 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2929);
    float _2975 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2977 = ~_2783;
    int _2979 = _2977 + 1;
    int _2981 = _2979 + 1;
    float _2983 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2971);
    float _2985 = float(uint(_2943));
    float _2987 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2975);
    int _2989 = abs(_2943);
    int _2991 = _2981 * as_type<int>(_2829);
    int _2993 = _2991 + _2969;
    int _2995 = _1653 >> 31;
    float _2997 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2983);
    float _2999 = 1.0 / _2985;
    int _3001 = _1721 >> 31;
    float _3003 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2987);
    int _3005 = _2995 & 3;
    float _3007 = _2997 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    int _3009 = ~_2965;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    float _3015 = fma(_2947, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2925);
    int _3017 = _3001 & 3;
    float _3019 = _2457 + _3007;
    float _3021 = float(uint(_2989));
    int _3023 = _3013 * _2993;
    float _3025 = _3003 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3027 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3029 = -_2851;
    float _3031 = fma(_3029, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2861);
    int _3033 = _2169 * _2965;
    int _3035 = _3033 + _3023;
    float _3037 = _2881 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3039 = 1.0 / _3021;
    int _3041 = _1653 + _3005;
    float _3043 = _2469 + _3025;
    int _3045 = _1721 + _3017;
    float _3047 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2959);
    float _3049 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3027);
    float _3051 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3037);
    int _3053 = _3041 >> 2;
    float _3055 = _2945 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _3057 = _3045 >> 2;
    float _3059 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3061 = _3019 + _3059;
    int _3063 = as_type<int>(_2999) + (-2);
    float _3065 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3067 = _3043 + _3065;
    float _3069 = float(uint(_3035));
    float _3071 = fma(_2867, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3031);
    int _3073 = _3053 << 4;
    int _3075 = _3073 + 368;
    float _3077 = fma(_2923, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3055);
    int _3079 = _3057 << 4;
    int _3081 = _3079 + 800;
    float _3083 = _3061 * _3061;
    int _3085 = abs(_3035);
    float _3087 = _3067 * _3067;
    float _3089 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3047);
    float _3091 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3049);
    float _3093 = fma(_2875, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3051);
    float _3095 = as_type<float>(_3063) * _3069;
    int _3097 = as_type<int>(_3039) + (-2);
    float _3099 = _3083 + _3087;
    float _3101 = _2905 * _2801;
    int _3103 = ~_2943;
    int _3105 = _3103 + 1;
    float _3107 = trunc(_3095);
    float _3109 = precise::max(_3107, 0.0);
    uint _3111 = uint(_3109);
    float _3113 = float(uint(_3085));
    float _3115 = fma(_3091, _2599, _3101);
    float _3117 = _2903 * _2801;
    out.m_79.x = _3089;
    out.m_79.y = _3091;
    out.m_79.z = _3093;
    float _3119 = as_type<float>(_3097) * _3113;
    float _3121 = fma(_3089, _2599, _3117);
    float _3123 = sqrt(_3099);
    float _3125 = fma(_2961, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3077);
    uint _3127 = uint(int(uint(_3075) >> uint(2)));
    uint _3129 = uint(int(uint(int(_3127)) >> uint(2)));
    int _3131 = int(_3127) & 3;
    float _3133 = (*spvDescriptorSet0.vp_c9)._m0[int(_3129)][_3131];
    int _3135 = int(_3127) + 1;
    uint _3137 = uint(int(uint(_3135) >> uint(2)));
    int _3139 = _3135 & 3;
    float _3141 = (*spvDescriptorSet0.vp_c9)._m0[int(_3137)][_3139];
    bool _3143 = !_1769;
    int _3145 = _3143 ? 0 : 1;
    bool _3147 = _1675 != 3;
    float _3149 = trunc(_3119);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    int _3155 = _3105 * int(_3111);
    int _3157 = _3155 + _3035;
    int _3159 = _3075 + 8;
    uint _3161 = uint(int(uint(_3159) >> uint(2)));
    uint _3163 = uint(int(uint(int(_3161)) >> uint(2)));
    int _3165 = int(_3161) & 3;
    float _3167 = (*spvDescriptorSet0.vp_c9)._m0[int(_3163)][_3165];
    int _3169 = int(_3161) + 1;
    uint _3171 = uint(int(uint(_3169) >> uint(2)));
    int _3173 = _3169 & 3;
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[int(_3171)][_3173];
    float _3177 = _3071 * _2801;
    float _3179 = fma(_3093, _2599, _3177);
    bool _3181 = _3123 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    uint _3183 = uint(int(uint(_3081) >> uint(2)));
    uint _3185 = uint(int(uint(int(_3183)) >> uint(2)));
    int _3187 = int(_3183) & 3;
    float _3189 = (*spvDescriptorSet0.vp_c9)._m0[int(_3185)][_3187];
    int _3191 = int(_3183) + 1;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    int _3195 = _3191 & 3;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[int(_3193)][_3195];
    float _3199 = _1649 * _1649;
    float _3201 = _3125 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3203 = float(uint(_3157));
    float _3205 = _3199 * _3199;
    float _3207 = _2809 + _3201;
    int _3209 = _3081 + 8;
    uint _3211 = uint(int(uint(_3209) >> uint(2)));
    uint _3213 = uint(int(uint(int(_3211)) >> uint(2)));
    int _3215 = int(_3211) & 3;
    float _3217 = (*spvDescriptorSet0.vp_c9)._m0[int(_3213)][_3215];
    int _3219 = int(_3211) + 1;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    int _3223 = _3219 & 3;
    float _3225 = (*spvDescriptorSet0.vp_c9)._m0[int(_3221)][_3223];
    float _3227 = as_type<float>(_3063) * _3203;
    float _3229 = -_3205;
    float _3231 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[193].x, _3207);
    float _3233 = _2801;
    float _3235 = _3207;
    float _3237 = _3083;
    float _3239 = _2973;
    if (!_3181)
    {
        _2603 = _3019;
    }
    float _3241 = _2603;
    float _3243 = _3241;
    if (!_3181)
    {
        _3233 = _3043;
    }
    float _3245 = _3233;
    float _3247 = _3245;
    if (!_3181)
    {
        _3235 = _3231;
    }
    float _3249 = _3235;
    int _3251 = ~_2989;
    int _3253 = _3251 + 1;
    int _3255 = _3253 * int(_3153);
    int _3257 = _3255 + _3085;
    float _3259 = as_type<float>(_3253);
    float _3261 = _3249;
    if (!_3181)
    {
        _3259 = _3087;
    }
    float _3263 = _3259;
    float _3265 = float(uint(_3257));
    bool _3267 = !_3181;
    float _3269 = _3263;
    if (!_3267)
    {
        float _3271 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3273 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3275 = _3123 + _3273;
        float _3277 = rsqrt(_3099);
        float _3279 = _3275 * _3271;
        float _3281 = _3231 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3283 = _3279 * 0.15915493667125701904296875;
        float _3285 = _3283 * 6.283185482025146484375;
        float _3287 = sin(_3285);
        float _3289 = _3283 * 6.283185482025146484375;
        float _3291 = cos(_3289);
        float _3293 = fma(_3287, _3281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3295 = _3277 * _3293;
        float _3297 = _3291 + (-1.0);
        float _3299 = fma(_3061, _3295, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3301 = fma(_3067, _3295, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3303 = _3297 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3305 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3307 = _3299 + _3305;
        float _3309 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3311 = _3301 + _3309;
        float _3313 = fma(_3231, _3291, _3303);
        float _3315 = _3307 * _3307;
        float _3317 = _3311 * _3311;
        _3261 = _3313;
        _3237 = _3315;
        _3269 = _3317;
        _3243 = _3299;
        _3247 = _3301;
    }
    float _3319 = _3261;
    float _3321 = _3237;
    float _3323 = _3269;
    float _3325 = _3243;
    float _3327 = _3247;
    float _3329 = as_type<float>(_3097) * _3265;
    bool _3331 = !_1855;
    int _3333 = _3331 ? 0 : 1;
    float _3335 = trunc(_3227);
    float _3337 = precise::max(_3335, 0.0);
    uint _3339 = uint(_3337);
    int _3341 = abs(_1911);
    float _3343 = fma(_2973, _2777, _3179);
    int _3345 = abs(_1817);
    int _3347 = abs(_3145);
    int _3349 = abs(_3333);
    float _3351 = trunc(_3329);
    float _3353 = precise::max(_3351, 0.0);
    uint _3355 = uint(_3353);
    int _3357 = ~_3345;
    int _3359 = _3357 + 1;
    int _3361 = _3359 + 1;
    int _3363 = _3361 * as_type<int>(_3141);
    int _3365 = ~_3347;
    int _3367 = _3365 + 1;
    int _3369 = _3367 + 1;
    float _3371 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3373 = _3319 + _3371;
    int _3375 = ~_3341;
    int _3377 = _3375 + 1;
    int _3379 = _3377 + 1;
    int _3381 = _3369 * as_type<int>(_3133);
    int _3383 = _3381 + _3363;
    int _3385 = ~_3349;
    int _3387 = _3385 + 1;
    int _3389 = _3387 + 1;
    float _3391 = fma(_3373, _3373, _3321);
    int _3393 = ~_2943;
    int _3395 = _3393 + 1;
    int _3397 = _3379 * as_type<int>(_3197);
    int _3399 = abs(_1749);
    float _3401 = _3391 + _3323;
    bool _3403 = !_3147;
    int _3405 = _3403 ? 0 : (-1);
    int _3407 = _3389 * as_type<int>(_3189);
    int _3409 = _3407 + _3397;
    int _3411 = int(_3111) + int(_3339);
    float _3413 = sqrt(_3401);
    int _3415 = abs(_3405);
    int _3417 = ~_3399;
    int _3419 = _3417 + 1;
    int _3421 = _3419 + 1;
    int _3423 = _3395 * _3411;
    int _3425 = _3423 + _3035;
    int _3427 = int(_3153) + int(_3355);
    int _3429 = _3421 * as_type<int>(_3167);
    int _3431 = _3429 + _3383;
    int _3433 = ~_2989;
    int _3435 = _3433 + 1;
    int _3437 = abs(_1835);
    bool _3439 = uint(_3425) >= uint(_2943);
    int _3441 = _3435 * _3427;
    int _3443 = _3441 + _3085;
    int _3445 = ~_3415;
    int _3447 = _3445 + 1;
    int _3449 = _3447 + 1;
    bool _3451 = _1729 != 3;
    int _3453 = ~_3437;
    int _3455 = _3453 + 1;
    int _3457 = _3455 + 1;
    int _3459 = _3449 * as_type<int>(_3175);
    int _3461 = _3459 + _3431;
    bool _3463 = !_3439;
    int _3465 = _3463 ? 0 : (-1);
    bool _3467 = !_3451;
    int _3469 = _3467 ? 0 : (-1);
    int _3471 = _3457 * as_type<int>(_3217);
    int _3473 = _3471 + _3409;
    int _3475 = ~_3411;
    int _3477 = _3475 + _3465;
    int _3479 = _3477 + 1;
    bool _3481 = uint(_3443) >= uint(_2989);
    bool _3483 = !_2207;
    int _3485 = _3483 ? 0 : 1;
    int _3487 = _3035 ^ _2943;
    int _3489 = abs(_3469);
    bool _3491 = _2943 == 0;
    bool _3493 = _2943 == 0;
    int _3495 = _2943 * _3479;
    int _3497 = _3495 + _3035;
    bool _3499 = !_3481;
    int _3501 = _3499 ? 0 : (-1);
    float _3503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3505 = abs(_3485);
    uint _3507 = uint(int(uint(_3487) >> uint(31)));
    int _3509 = ~_3501;
    int _3511 = _3427 + _3509;
    int _3513 = _3511 + 1;
    float _3515 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3517 = ~_3489;
    int _3519 = _3517 + 1;
    int _3521 = _3519 + 1;
    int _3523 = ~int(_3507);
    int _3525 = _3523 + 1;
    int _3527 = ~_3505;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    int _3533 = _3521 * as_type<int>(_3225);
    int _3535 = _3533 + _3473;
    bool _3537 = !_2215;
    int _3539 = _3537 ? 0 : 1;
    int _3541 = _3513 ^ _3525;
    int _3543 = _3531 * _3461;
    int _3545 = abs(_3539);
    float _3547 = _3503 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3549 = !_3491;
    int _3551 = _3549 ? _3497 : (-1);
    int _3553 = ~_3525;
    int _3555 = _3553 + _3541;
    int _3557 = _3555 + 1;
    float _3559 = fma(_3547, _646, -0.5);
    int _3561 = ~_3545;
    int _3563 = _3561 + 1;
    int _3565 = _3563 + 1;
    bool _3567 = _536 == 0;
    float _3569 = float(_3551);
    int _3571 = _3565 * _3535;
    bool _3573 = !_3493;
    int _3575 = _3573 ? _3557 : (-1);
    bool _3577 = _562 == 0;
    float _3579 = fma(_3547, _3569, _1741);
    float _3581 = float(_3575);
    float _3583 = _3515 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3585 = !_3567;
    int _3587 = _3585 ? _2763 : (-1);
    float _3589 = -_3015;
    float _3591 = _2723 * _3589;
    bool _3593 = !_3577;
    int _3595 = _3593 ? _2781 : (-1);
    float _3597 = fma(_3583, _1827, -0.5);
    float _3599 = -_1957;
    float _3601 = fma(_3583, _3581, _3599);
    float _3603 = -_2963;
    float _3605 = _2723 * _3603;
    int _3607 = _3587 * _3505;
    int _3609 = _3607 + _3543;
    float _3611 = -_2973;
    float _3613 = _2723 * _3611;
    int _3615 = _3595 * _3545;
    int _3617 = _3615 + _3571;
    float _3619 = fma(_1881, _3559, _3579);
    float _3621 = fma(_1913, _3597, _3601);
    float _3623 = fma(_2731, _2903, _3591);
    float _3625 = fma(_2731, _2905, _3605);
    float _3627 = fma(_2731, _3071, _3613);
    float _3629 = fma(_3015, _2777, _3121);
    float _3631 = fma(_2963, _2777, _3115);
    float _3633 = float(_3609);
    float _3635 = _3619 + 0.5;
    float _3637 = float(_3617);
    float _3639 = _3621 + 0.5;
    out.m_81.x = _3623;
    out.m_81.y = _3625;
    out.m_81.z = _3627;
    bool _3641 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3643 = isnan(_3413);
    bool _3645 = _3641 || _3643;
    bool _3647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3649 = _3645 || _3647;
    out.m_83.x = _3633;
    out.m_83.w = _3637;
    out.m_85.x = _3635;
    out.m_85.y = _3639;
    float _3651 = as_type<float>(_3609);
    if (!_3649)
    {
        _3651 = 1.0;
    }
    float _3653 = _3651;
    out.m_87.x = _3629;
    out.m_87.y = _3631;
    out.m_87.z = _3343;
    bool _3655 = !_3649;
    float _3657 = _3653;
    if (!_3655)
    {
        bool _3659 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3661 = isnan(_3413);
        bool _3663 = _3659 || _3661;
        bool _3665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3667 = _3663 || _3665;
        if (!_3667)
        {
            float _3669 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3671 = _3413 + _3669;
            float _3673 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3675 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3673;
            float _3677 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3679 = _3677 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3681 = 1.0 / _3675;
            float _3683 = _3671 * _3681;
            float _3685 = fma(_3683, _3679, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3657 = _3685;
            _3687 = true;
        }
        else
        {
            bool _3689 = _3413 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3691 = isnan(_3413);
            bool _3693 = _3689 || _3691;
            bool _3695 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3697 = _3693 || _3695;
            if (!_3697)
            {
                float _3699 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3701 = _3413 + _3699;
                float _3703 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3705 = _3703 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3707 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3709 = _3707 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3711 = 1.0 / _3705;
                float _3713 = _3701 * _3711;
                float _3715 = fma(_3713, _3709, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3657 = _3715;
                _3687 = true;
            }
            else
            {
                _3657 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3687 = false;
    float _3717 = _3657;
    float _3719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3721 = _3319 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3725 = _3325 + _3723;
    float _3727 = fma(_3721, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3729 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3731 = _3327 + _3729;
    float _3733 = fma(_3725, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3735 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _3737 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3739 = _3727 + _3737;
    float _3741 = fma(_3731, _3717, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3743 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3745 = _3733 + _3743;
    float _3747 = floor(_3735);
    float _3749 = _3739 * _3739;
    float _3751 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3753 = _3741 + _3751;
    float _3755 = fma(_3745, _3745, _3749);
    float _3757 = fma(_3753, _3753, _3755);
    float _3759 = rsqrt(_3757);
    float _3761 = -_3747;
    float _3763 = _3735 + _3761;
    float _3765 = sqrt(_3757);
    float _3767 = _3759 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3769 = _3745 * _3767;
    float _3771 = _3753 * _3767;
    float _3773 = _3769 * _3769;
    float _3775 = _3771 * _3771;
    float _3777 = _3773 + _3775;
    float _3779 = sqrt(_3777);
    bool _3781 = _3779 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3783 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3785 = _3779 + _3783;
    float _3787 = _3753;
    float _3789 = _3777;
    float _3791 = _3785;
    float _3793 = _3755;
    if (_3781)
    {
        float _3795 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3787 = _3795;
    }
    float _3797 = _3787;
    if (_3781)
    {
        float _3799 = rsqrt(_3777);
        _3789 = _3799;
    }
    float _3801 = _3789;
    if (_3781)
    {
        float _3803 = _3785 * _3797;
        _3791 = _3803;
    }
    float _3805 = _3791;
    if (_3781)
    {
        float _3807 = _3805 * 0.15915493667125701904296875;
        _3793 = _3807;
    }
    float _3809 = _3793;
    float _3811 = _3759;
    float _3813 = _3809;
    if (_3781)
    {
        float _3815 = _3809 * 6.283185482025146484375;
        float _3817 = sin(_3815);
        _3811 = _3817;
    }
    float _3819 = _3811;
    float _3821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3823 = precise::max(0.0, _3821);
    float _3825 = _3625;
    float _3827 = _3821;
    float _3829 = _3823;
    if (_3781)
    {
        float _3831 = _3809 * 6.283185482025146484375;
        float _3833 = cos(_3831);
        _3825 = _3833;
    }
    float _3835 = _3825;
    float _3837 = -_3767;
    float _3839 = -_3823;
    float _3841 = fma(_3739, _3837, _3839);
    float _3843 = (*spvDescriptorSet0.vp_c15)._m0[23].w;
    if (_3781)
    {
        float _3845 = _3841 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3827 = _3845;
    }
    float _3847 = _3827;
    float _3849 = _3847;
    if (!_3781)
    {
        _3813 = _3769;
    }
    float _3851 = _3813;
    float _3853 = _3819;
    float _3855 = _3851;
    if (_3781)
    {
        float _3857 = fma(_3819, _3847, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3239 = _3857;
    }
    float _3859 = _3239;
    float _3861 = _3859;
    if (!_3781)
    {
        _3853 = _3841;
    }
    float _3863 = _3853;
    float _3865 = _3863;
    if (_3781)
    {
        float _3867 = _3835 + (-1.0);
        _3829 = _3867;
    }
    float _3869 = _3829;
    float _3871 = _3869;
    if (_3781)
    {
        float _3873 = _3801 * _3859;
        _3861 = _3873;
    }
    float _3875 = _3861;
    if (_3781)
    {
        float _3877 = _3869 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3849 = _3877;
    }
    float _3879 = _3849;
    float _3881 = _3879;
    if (_3781)
    {
        float _3883 = _3769 * _3875;
        _3855 = _3883;
    }
    float _3885 = _3855;
    if (!_3781)
    {
        _3871 = _3771;
    }
    float _3887 = _3871;
    float _3889 = _3887;
    if (_3781)
    {
        float _3891 = _3771 * _3875;
        _3889 = _3891;
    }
    float _3893 = _3889;
    if (_3781)
    {
        float _3895 = fma(_3841, _3835, _3879);
        _3865 = _3895;
    }
    float _3897 = _3865;
    if (!_3781)
    {
        _3881 = _3773;
    }
    float _3899 = _3881;
    float _3901 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3903 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3901);
    float _3905 = precise::clamp(_3903, 0.0, 1.0);
    float _3907 = _3899;
    if (_3781)
    {
        float _3909 = _3885 * _3885;
        _3907 = _3909;
    }
    float _3911 = _3907;
    if (!_3781)
    {
        _3843 = _3775;
    }
    float _3913 = _3843;
    float _3915 = _3913;
    if (_3781)
    {
        float _3917 = _3893 * _3893;
        _3915 = _3917;
    }
    float _3919 = _3915;
    float _3921 = -_3905;
    float _3923 = _3921 + 1.0;
    float _3925 = fma(_3897, _3897, _3911);
    float _3927 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3929 = abs(_3923);
    float _3931 = log2(_3929);
    float _3933 = _3925 + _3919;
    float _3935 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3937 = fma(_2469, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _3939 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3935);
    float _3941 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3943 = rsqrt(_3933);
    float _3945 = _3727 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3947 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3939);
    float _3949 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3941);
    float _3951 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3953 = _3947 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3955 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3945);
    float _3957 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3949);
    float _3959 = fma(_3733, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3927);
    float _3961 = _3953 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3963 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3955);
    float _3965 = _3957 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3967 = fma(_3741, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3959);
    float _3969 = -_3961;
    float _3971 = fma(_3969, _3951, 1.0);
    float _3973 = _3963 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3975 = _3943 * _3885;
    float _3977 = _3967 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3979 = _3943 * _3897;
    float _3981 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3983 = _3975 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3985 = _3943 * _3893;
    float _3987 = log2(_3971);
    float _3989 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3981);
    float _3991 = -_3983;
    float _3993 = fma(_3979, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3991);
    float _3995 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3997 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3989);
    float _3999 = -_3985;
    float _4001 = fma(_3999, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3993);
    float _4003 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4005 = exp2(_3995);
    float _4007 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3997);
    float _4009 = fma(_4001, -0.5, 0.5);
    float _4011 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4003);
    float _4013 = fma(_4001, 0.5, 0.5);
    float _4015 = _3979 + 1.0;
    float _4017 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4011);
    float _4019 = 1.0 / _4007;
    float _4021 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4023 = fma(_4013, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4025 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4017);
    float _4027 = _3987 * 0.693147182464599609375;
    float _4029 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4021);
    float _4031 = fma(_4013, _4023, -0.212114393711090087890625);
    float _4033 = sqrt(_4009);
    float _4035 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4029);
    float _4037 = -_3979;
    float _4039 = fma(_4005, _4015, _4037);
    float _4041 = fma(_4013, _4031, 1.570728778839111328125);
    float _4043 = _4027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4045 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4035);
    float _4047 = fma(_4039, 0.5, 0.5);
    float _4049 = floor(_3937);
    float _4051 = _4025 * _4019;
    float _4053 = _4045 * _4019;
    float _4055 = fma(_4051, 0.5, 0.5);
    float _4057 = fma(_4053, -0.5, 0.5);
    float _4059 = _4033 * 0.636619746685028076171875;
    float _4061 = -_4041;
    float _4063 = fma(_4059, _4061, 1.0);
    float _4065 = -_4049;
    float _4067 = _3937 + _4065;
    float2 _10529 = float2(_3763, _4067);
    float _4069 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_10529, float2(0.0), isnan(_10529)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_10529, float2(0.0), isnan(_10529)), level(0.0)).x;
    float3 _10540 = float3(_4055, _4057, _4043);
    float _4071 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_10540, float3(0.0), isnan(_10540)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_10540, float3(0.0), isnan(_10540)), level(0.0)).x;
    float3 _10551 = float3(_4055, _4057, _4043);
    float4 _4074 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_10551, float3(0.0), isnan(_10551)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_10551, float3(0.0), isnan(_10551)), level(0.0)).xyzw;
    float _4076 = _4074.x;
    float _4078 = _4074.y;
    float _4080 = _4074.z;
    float _4082 = _4074.w;
    float2 _10567 = float2(_4063, _4047);
    float3 _4086 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_10567, float2(0.0), isnan(_10567)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_10567, float2(0.0), isnan(_10567)), level(0.0)).xyz;
    float _4088 = _4086.x;
    float _4090 = _4086.y;
    float _4092 = _4086.z;
    float _4094 = _2809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4096 = _2809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4098 = _3965 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4100 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4094);
    float _4102 = fma(_2457, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4096);
    float _4104 = fma(_3973, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4098);
    float _4106 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4100);
    float _4108 = fma(_2469, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4102);
    float _4110 = in.m_89.x;
    float _4112 = _4106 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4114 = _4108 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4116 = _3931 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4118 = fma(_3953, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4104);
    float _4120 = 1.0 / _4112;
    float _4122 = _4114 + _4112;
    float _4124 = fma(_3977, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4118);
    float _4126 = exp2(_4116);
    float _4128 = _4122 * _4120;
    float _4130 = _4128 * 0.5;
    float _4132 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4134 = fma(_4130, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4132);
    bool _4136 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4138 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4140 = _4136 || _4138;
    bool _4142 = isnan(0.5);
    bool _4144 = _4140 || _4142;
    float _4146 = 1.0 / _4134;
    float _4148 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4150 = _4146 * _4148;
    float _4152 = abs(_4150);
    float _4154 = log2(_4152);
    bool _4156 = _4150 <= 8000.0;
    bool _4158 = isnan(_4150);
    bool _4160 = _4156 || _4158;
    bool _4162 = isnan(8000.0);
    bool _4164 = _4160 || _4162;
    float _4166 = float(_4164);
    float _4168 = _4154 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4170 = exp2(_4168);
    float _4172 = fma(_4170, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4174 = precise::clamp(_4172, 0.0, 1.0);
    float _4176 = fma(_4174, -2.0, 3.0);
    float _4178 = _4174 * _4174;
    float _4180 = _4178 * _4176;
    float _4182 = -_4180;
    float _4184 = _4182 + 1.0;
    float _4186 = fma(_4184, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4180);
    float _4188 = _4124 + _4007;
    float _4190 = _4188 * 0.5;
    float _4192 = _4188;
    float _4194 = _4124;
    float _4196 = _4045;
    float _4198 = _4025;
    if (_4144)
    {
        _4192 = 1.0;
    }
    float _4200 = _4192;
    float _4202 = _4200;
    if (!_4144)
    {
        float _4204 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4206 = _4204 * 0.15915493667125701904296875;
        float _4208 = _4206 * 6.283185482025146484375;
        float _4210 = cos(_4208);
        float _4212 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4214 = _4212 * 0.15915493667125701904296875;
        float _4216 = _4206 * 6.283185482025146484375;
        float _4218 = sin(_4216);
        float _4220 = 1.0 / _4210;
        float _4222 = _4214 * 6.283185482025146484375;
        float _4224 = cos(_4222);
        float _4226 = _4218 * _4220;
        float _4228 = _4214 * 6.283185482025146484375;
        float _4230 = sin(_4228);
        float _4232 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4234 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4232;
        float _4236 = _4224 * _4226;
        float _4238 = 1.0 / _4234;
        float _4240 = 1.0 / _4236;
        float _4242 = _4230 * _4240;
        float _4244 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4246 = fma(_4150, _4242, _4244);
        float _4248 = _4246 * _4238;
        float _4250 = precise::clamp(_4248, 0.0, 1.0);
        _4202 = _4250;
    }
    float _4252 = _4202;
    float _4254 = _4166 * _4186;
    float _4256 = -_4126;
    float _4258 = _4256 + 1.0;
    float _4260 = -_4069;
    float _4262 = _4260 + 1.0;
    float _4264 = _4254 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4266 = _4258 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.z = _4190;
    out.m_91.w = _4007;
    bool _4268 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4270 = isnan(_3765);
    bool _4272 = _4268 || _4270;
    bool _4274 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4276 = _4272 || _4274;
    float _4278 = _4262 * _4264;
    float _4280 = precise::clamp(_4278, 0.0, 1.0);
    float _4282 = _4266 * _4071;
    float _4284 = -_4266;
    float _4286 = _4284 + 1.0;
    float _4288 = -_4280;
    float _4290 = fma(_4288, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4292 = _4082 * _4282;
    float _4294 = _4092 * _4282;
    float _4296 = _4082 * _4286;
    float _4298 = _4290 * _4110;
    float _4300 = fma(_4088, _4292, _4076);
    float _4302 = fma(_4090, _4292, _4078);
    float _4304 = fma(_4082, _4294, _4080);
    float _4306 = _4298 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _4025;
    out.gl_Position.y = _4045;
    out.gl_Position.z = _4124;
    out.gl_Position.w = _4007;
    float _4308 = _4252 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_93.x = _4306;
    out.m_95.x = _4300;
    out.m_95.y = _4302;
    out.m_95.z = _4304;
    out.m_95.w = _4296;
    if (!_4276)
    {
        _4194 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4310 = _4194;
    float _4312 = _4310;
    float _4314 = _4310;
    if (!_4276)
    {
        _4196 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4316 = _4196;
    float _4318 = _4316;
    float _4320 = _4316;
    if (!_4276)
    {
        _4198 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4322 = _4198;
    bool _4324 = !_4276;
    float _4326 = _4322;
    float _4328 = _4322;
    if (!_4324)
    {
        bool _4330 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4332 = isnan(_3765);
        bool _4334 = _4330 || _4332;
        bool _4336 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4338 = _4334 || _4336;
        if (!_4338)
        {
            float _4340 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4342 = _3765 + _4340;
            float _4344 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4346 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4344;
            float _4348 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4350 = _4348 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4352 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4354 = _4352 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4356 = 1.0 / _4346;
            float _4358 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4360 = _4358 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4362 = _4342 * _4356;
            float _4364 = precise::clamp(_4362, 0.0, 1.0);
            float _4366 = fma(_4364, _4350, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4368 = fma(_4364, _4354, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4370 = fma(_4364, _4360, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _4320 = _4368;
            _4314 = _4366;
            _4328 = _4370;
            _4372 = true;
        }
        else
        {
            bool _4374 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4376 = isnan(_3765);
            bool _4378 = _4374 || _4376;
            bool _4380 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4382 = _4378 || _4380;
            if (!_4382)
            {
                _4312 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4384 = _4312;
            _4314 = _4384;
            if (!_4382)
            {
                _4318 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4386 = _4318;
            _4320 = _4386;
            if (!_4382)
            {
                _4326 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4388 = _4326;
            bool _4390 = !_4382;
            _4328 = _4388;
            if (!_4390)
            {
                bool _4392 = _3765 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4394 = isnan(_3765);
                bool _4396 = _4392 || _4394;
                bool _4398 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4400 = _4396 || _4398;
                if (!_4400)
                {
                    float _4402 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4404 = _3765 + _4402;
                    float _4406 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4408 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4406;
                    float _4410 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4412 = _4410 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4414 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4416 = _4414 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4418 = 1.0 / _4408;
                    float _4420 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4422 = _4420 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4424 = _4404 * _4418;
                    float _4426 = precise::clamp(_4424, 0.0, 1.0);
                    float _4428 = fma(_4426, _4412, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4430 = fma(_4426, _4416, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4432 = fma(_4426, _4422, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _4320 = _4430;
                    _4314 = _4428;
                    _4328 = _4432;
                    _4372 = true;
                }
                else
                {
                    _4320 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4314 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4328 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4372 = false;
    float _4434 = _4320;
    float _4436 = _4314;
    float _4438 = _4328;
    float _4440 = _4308 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_97.x = 0.0;
    float _4442 = _4434 * 0.586610972881317138671875;
    bool _4444 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_55.x = _4440;
    float _4446 = fma(_4436, 0.298911988735198974609375, _4442);
    bool _4448 = _4252 > 0.0;
    bool _4450 = isnan(_4252);
    bool _4452 = _4448 || _4450;
    bool _4454 = isnan(0.0);
    bool _4456 = _4452 || _4454;
    float _4458 = fma(_4438, 0.114477999508380889892578125, _4446);
    float _4460 = -_4458;
    float _4462 = _4460 + _4436;
    float _4464 = -_4458;
    float _4466 = _4464 + _4434;
    float _4468 = -_4458;
    float _4470 = _4468 + _4438;
    float _4472 = fma(_4462, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    float _4474 = fma(_4466, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    float _4476 = fma(_4470, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4458);
    bool _4478 = !_4444;
    if (!_4478)
    {
        float _4480 = -_3727;
        float _4482 = _4480 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4484 = -_3733;
        float _4486 = _4484 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4488 = -_3741;
        float _4490 = _4488 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4492 = _4482 * _4482;
        float _4494 = fma(_4486, _4486, _4492);
        float _4496 = fma(_4490, _4490, _4494);
        float _4498 = sqrt(_4496);
        float _4500 = rsqrt(_4496);
        float _4502 = -_4498;
        float _4504 = _4502 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4506 = _4504 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4508 = precise::clamp(_4506, 0.0, 1.0);
        float _4510 = _4486 * _4500;
        float _4512 = _4482 * _4500;
        float _4514 = abs(_4508);
        float _4516 = log2(_4514);
        float _4518 = _4490 * _4500;
        float _4520 = _4510 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4522 = _3631 * _4512;
        float _4524 = -_4512;
        float _4526 = -_4520;
        float _4528 = fma(_4524, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4526);
        float _4530 = fma(_3629, _4510, _4522);
        float _4532 = -_4518;
        float _4534 = fma(_4532, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4528);
        float _4536 = fma(_3343, _4518, _4530);
        float _4538 = precise::clamp(_4536, 0.0, 1.0);
        float _4540 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4542 = _4534 + _4540;
        float _4544 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4546 = _4542 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4548 = precise::clamp(_4546, 0.0, 1.0);
        float _4550 = exp2(_4544);
        float _4552 = _4550 * _4548;
        float _4554 = _4538 * _4552;
        float _4556 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4558 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4560 = _4554 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_97.x = _4556;
        out.m_97.y = _4558;
        out.m_97.z = _4560;
    }
    out.m_99.x = _4472;
    out.m_99.y = _4474;
    out.m_99.z = _4476;
    if (_4456)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _4562 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4562;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

