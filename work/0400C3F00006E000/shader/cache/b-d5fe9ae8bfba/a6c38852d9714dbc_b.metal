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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_57 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_71 [[user(locn2)]];
    float4 m_81 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_61 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_75 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_83 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_67 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3478 = false;
    bool _1702 = false;
    bool _1270 = false;
    bool _1172 = false;
    bool _1010 = false;
    bool _836 = false;
    bool _674 = false;
    bool _446 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4417 = as_type<float>(_116);
        out.gl_Position.z = _4417;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _158 = _156 * 5.0;
        _118 = as_type<int>(_158);
    }
    int _160 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4489 = as_type<float>(_160);
        out.gl_Position.z = _4489;
    }
    if (_146)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_53.w;
    float _164 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _164;
    if (!_174)
    {
        float _190 = _164 * _164;
        float _192 = _190 * 0.5;
        _150 = _192;
    }
    float _194 = _150;
    float _196 = _194;
    if (!_174)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_174;
    float _204 = _200;
    float _206 = 0.0;
    if (!_202)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _236;
        _206 = _220;
        _152 = _226;
    }
    float _238 = _204;
    float _240 = _206;
    float _242 = _152;
    bool _244 = !_174;
    float _246 = _242;
    float _248 = _240;
    float _250 = _238;
    if (!_244)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _164 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _188 = _270;
        _246 = _258;
    }
    float _272 = _188;
    float _274 = _246;
    float _276 = _274;
    if (!_174)
    {
        float _278 = _128 * _128;
        float _280 = _278 * 0.5;
        _248 = _280;
    }
    float _282 = _248;
    float _284 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        _276 = _128;
    }
    float _290 = _276;
    float _292 = fma(_272, _176, _284);
    float _294 = fma(_272, _178, _286);
    float _296 = _290;
    if (!_174)
    {
        float _298 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _298;
    }
    float _300 = _250;
    bool _302 = !_174;
    float _304 = _300;
    if (!_302)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _128 * _308;
        float _318 = 1.0 / _312;
        float _320 = _314 * 0.693147182464599609375;
        float _322 = exp2(_316);
        float _324 = 1.0 / _320;
        float _326 = _322 + (-1.0);
        float _328 = -_326;
        float _330 = fma(_328, _324, _128);
        float _332 = _330 * _318;
        float _334 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _334;
    }
    float _336 = _304;
    bool _338 = !_174;
    if (!_338)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = 1.0 / _346;
        float _350 = _128 * _342;
        float _352 = exp2(_350);
        float _354 = -_352;
        float _356 = _354 + 1.0;
        float _358 = _356 * _348;
        _296 = _358;
    }
    float _360 = _296;
    float _362 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_272, _180, _288);
    float _370 = fma(_360, _178, _362);
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = fma(_360, _176, _364);
    float _376 = fma(_360, _180, _366);
    float _378 = -_370;
    float _380 = _294 + _378;
    float _382 = fma(_294, _162, _184);
    float _384 = -_374;
    float _386 = _292 + _384;
    float _388 = fma(_292, _162, _182);
    float _390 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _396 = -_376;
    float _398 = _368 + _396;
    float _400 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _402 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _394);
    float _406 = fma(_368, _162, _186);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _402);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _414 = !_372;
    float _416 = _408;
    float _418 = _410;
    float _420 = _408;
    float _422 = _412;
    float _424 = _374;
    float _426 = _408;
    float _444;
    if (!_414)
    {
        float _428 = in.m_55.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        _444 = _140;
    }
    _446 = false;
    float _448 = _444;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _452 = _448 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _456 = _448 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _472 = _448 + _470;
    float _474 = 1.0 / _460;
    bool _476 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_448);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    bool _488 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _490 = 1.0 / _464;
    float _492 = 1.0 / _468;
    float _494 = _456 * _474;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _500;
    float _504 = _452 * _490;
    bool _506 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _508 = isnan(_448);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _518;
    float _522 = fma(_498, _494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _528 = -_516;
    float _530 = _528 + 1.0;
    float _532 = fma(_520, _494, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _534 = _472 * _492;
    bool _536 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_448);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_502, _494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _550 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _552 = isnan(_448);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = _486 * _530;
    float _564 = -_486;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = _546 * _566;
    float _582 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _584 = fma(_526, _504, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _586 = fma(_574, _504, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _588 = _560 * _578;
    float _590 = in.m_53.x;
    float _592 = in.m_53.y;
    float _594 = in.m_53.z;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = _522 * _588;
    float _602 = _548 * _588;
    float _604 = _532 * _588;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _606;
    float _610 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].x, _600);
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _618;
    float _622 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].z, _604);
    float _624 = fma(_608, _534, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _626 = fma(_616, _534, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _628 = fma(_620, _534, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _630 = fma(_582, _580, _610);
    float _632 = fma(_584, _580, _612);
    float _634 = fma(_586, _580, _622);
    float _636 = fma(_624, _562, _630);
    float _638 = fma(_626, _562, _632);
    float _640 = fma(_628, _562, _634);
    float _642 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].x, _636);
    float _644 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].y, _638);
    float _646 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].z, _640);
    float _648 = _642 * _590;
    float _650 = _644 * _592;
    float _652 = _646 * _594;
    bool _654 = !_488;
    float _672;
    if (!_654)
    {
        float _656 = in.m_55.x;
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _660 = _656 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _664 = _662 * _658;
        float _666 = floor(_664);
        float _668 = -_666;
        float _670 = _664 + _668;
        _672 = _670;
        _674 = true;
    }
    else
    {
        _672 = _140;
    }
    _674 = false;
    float _676 = _672;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _676 + _678;
    bool _682 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_676);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _676 + _694;
    bool _698 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _700 = isnan(_676);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _718 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _720 = isnan(_676);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_692;
    float _732 = _730 + 1.0;
    float _734 = 1.0 / _712;
    float _736 = _728 * _732;
    float _738 = -_728;
    float _740 = _738 + 1.0;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _742;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _748 = 1.0 / _716;
    float _750 = _708 * _740;
    float _752 = -_708;
    float _754 = _752 + 1.0;
    float _756 = _680 * _734;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _762;
    float _766 = fma(_744, _756, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = fma(_760, _756, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _770 = fma(_764, _756, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = _696 * _748;
    float _774 = _766 * _750;
    float _776 = _768 * _750;
    float _778 = _770 * _750;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _792 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _794 = fma(_782, _772, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = fma(_786, _772, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = fma(_790, _772, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _800 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].y, _776);
    float _802 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _804 = fma(_794, _736, _792);
    float _806 = fma(_796, _736, _800);
    float _808 = fma(_798, _736, _802);
    float _810 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].x, _804);
    float _812 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].y, _806);
    float _814 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].z, _808);
    bool _816 = !_746;
    float _834;
    if (!_816)
    {
        float _818 = in.m_55.x;
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _822 = _818 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _826 = _824 * _820;
        float _828 = floor(_826);
        float _830 = -_828;
        float _832 = _826 + _830;
        _834 = _832;
        _836 = true;
    }
    else
    {
        _834 = _140;
    }
    _836 = false;
    float _838 = _834;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _838 + _840;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _852 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _868 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_838);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = 1.0 / _846;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _882;
    float _886 = -_862;
    float _888 = _886 + 1.0;
    bool _890 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _892 = isnan(_838);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = 1.0 / _850;
    float _906 = 1.0 / _866;
    float _908 = _884 * _880;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _914 = _878 * _888;
    float _916 = -_878;
    float _918 = _916 + 1.0;
    float _920 = fma(_908, _842, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _922;
    float _926 = _900 * _918;
    float _928 = _912 * _904;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _932 = _838 + _930;
    bool _934 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _936 = isnan(_838);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = _920 * _926;
    float _948 = -_900;
    float _950 = _948 + 1.0;
    float _952 = fma(_928, _932, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _956 = _838 + _954;
    float _958 = _924 * _906;
    float _960 = -_944;
    float _962 = _960 + 1.0;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _946);
    float _966 = _814 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _968 = fma(_958, _956, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _970 = _862 * _962;
    float _972 = fma(_952, _914, _964);
    float _974 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _976 = _812 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_968, _970, _972);
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[118].x, _980);
    float _988 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _982;
    out.m_57.y = _984;
    out.m_57.z = _978;
    out.m_57.w = _988;
    bool _990 = !_902;
    float _1008;
    if (!_990)
    {
        float _992 = in.m_55.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        _1008 = _140;
    }
    _1010 = false;
    float _1012 = _1008;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = _1012 + _1014;
    bool _1018 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1020 = isnan(_1012);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1032 = _1012 + _1030;
    bool _1034 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1036 = isnan(_1012);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1056 = isnan(_1012);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -_1028;
    float _1068 = _1066 + 1.0;
    float _1070 = 1.0 / _1048;
    float _1072 = _1064 * _1068;
    float _1074 = -_1064;
    float _1076 = _1074 + 1.0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1078;
    bool _1082 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1084 = 1.0 / _1052;
    float _1086 = _1044 * _1076;
    float _1088 = -_1044;
    float _1090 = _1088 + 1.0;
    float _1092 = _1016 * _1070;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1098;
    float _1102 = fma(_1080, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1104 = fma(_1096, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1106 = fma(_1100, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1108 = _1032 * _1084;
    float _1110 = _1102 * _1086;
    float _1112 = _1104 * _1086;
    float _1114 = _1106 * _1086;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1110);
    float _1130 = fma(_1118, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1132 = fma(_1122, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1134 = fma(_1126, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1136 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1112);
    float _1138 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1114);
    float _1140 = fma(_1130, _1072, _1128);
    float _1142 = fma(_1132, _1072, _1136);
    float _1144 = fma(_1134, _1072, _1138);
    float _1146 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1140);
    float _1148 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1142);
    float _1150 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1144);
    bool _1152 = !_1082;
    float _1170;
    if (!_1152)
    {
        float _1154 = in.m_55.x;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1158 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1162 = _1160 * _1156;
        float _1164 = floor(_1162);
        float _1166 = -_1164;
        float _1168 = _1162 + _1166;
        _1170 = _1168;
        _1172 = true;
    }
    else
    {
        _1170 = _140;
    }
    _1172 = false;
    float _1174 = _1170;
    float _1176 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1180 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1182 = isnan(_1174);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1196 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1198 = isnan(_1174);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1204);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1214 = _1174 + _1212;
    float _1216 = -_1190;
    float _1218 = _1216 + 1.0;
    float _1220 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1222 = 1.0 / _1194;
    float _1224 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1206 * _1218;
    float _1228 = -_1206;
    float _1230 = _1228 + 1.0;
    float _1232 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1238 = _1210 * _1222;
    float _1240 = fma(_1238, _1214, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1242 = _1240 * _1226;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1242);
    float _1246 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1244);
    float _1248 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1224;
    out.m_59.y = _1232;
    out.m_59.z = _1234;
    out.m_59.w = _1248;
    bool _1250 = !_1236;
    float _1268;
    if (!_1250)
    {
        float _1252 = in.m_55.x;
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1256 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _1260 = _1258 * _1254;
        float _1262 = floor(_1260);
        float _1264 = -_1262;
        float _1266 = _1260 + _1264;
        _1268 = _1266;
        _1270 = true;
    }
    else
    {
        _1268 = _140;
    }
    _1270 = false;
    float _1272 = _1268;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1276 = _1272 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = _1272 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1298 = 1.0 / _1284;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1310 = _1272 + _1308;
    float _1312 = 1.0 / _1292;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1322 = 1.0 / _1288;
    bool _1324 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1326 = isnan(_1272);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1336;
    bool _1340 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1342 = isnan(_1272);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -_1334;
    float _1354 = _1352 + 1.0;
    float _1356 = 1.0 / _1302;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1364 = _1272 + _1362;
    float _1366 = _1276 * _1312;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1368;
    float _1372 = _1364 * _1298;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1376 = _1272 + _1374;
    float _1378 = 1.0 / _1296;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1380;
    float _1384 = fma(_1316, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1386 = _1376 * _1322;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1390 = _1272 + _1388;
    float _1392 = fma(_1382, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1398 = fma(_1320, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1400 = 1.0 / _1360;
    float _1402 = _1280 * _1356;
    bool _1404 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1406 = isnan(_1272);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1396, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1420 = _1272 + _1418;
    float _1422 = 1.0 / _1306;
    float _1424 = _1310 * _1378;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _1434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1436 = fma(_1428, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1438 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1440 = isnan(_1272);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = _1390 * _1400;
    bool _1452 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1454 = isnan(_1272);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1414 * _1354;
    float _1466 = -_1414;
    float _1468 = _1466 + 1.0;
    float _1470 = fma(_1432, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1472 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1474 = isnan(_1272);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = -_1448;
    float _1486 = _1484 + 1.0;
    float _1488 = _1462 * _1468;
    float _1490 = -_1462;
    float _1492 = _1490 + 1.0;
    bool _1494 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1496 = isnan(_1272);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = _1420 * _1422;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1508;
    float _1512 = _1448 * _1492;
    float _1514 = _1482 * _1486;
    float _1516 = -_1482;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1504;
    float _1522 = _1520 + 1.0;
    float _1524 = fma(_1338, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1530 = _1504 * _1518;
    float _1532 = fma(_1510, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1534 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1536 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1538 = isnan(_1272);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = _1350 * _1522;
    float _1550 = -_1350;
    float _1552 = _1550 + 1.0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1562 = _1546 * _1552;
    float _1564 = -_1546;
    float _1566 = _1564 + 1.0;
    float _1568 = fma(_1556, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1570 = fma(_1560, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1572 = _1392 * _1562;
    float _1574 = _1436 * _1562;
    float _1576 = _1384 * _1562;
    float _1578 = fma(_1528, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1580 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1572);
    float _1582 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1574);
    float _1584 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1576);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1586;
    float _1590 = fma(_1416, _1548, _1580);
    float _1592 = fma(_1470, _1548, _1582);
    float _1594 = fma(_1398, _1548, _1584);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1596;
    float _1600 = fma(_1532, _1530, _1590);
    float _1602 = fma(_1524, _1530, _1592);
    float _1604 = fma(_1534, _1530, _1594);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1606;
    float _1610 = fma(_1570, _1514, _1600);
    float _1612 = fma(_1568, _1514, _1602);
    float _1614 = fma(_1578, _1514, _1604);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1620 = fma(_1588, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1622 = fma(_1598, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1628 = fma(_1608, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1634 = fma(_1618, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1636 = fma(_1626, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1638 = fma(_1620, _1512, _1610);
    float _1640 = fma(_1622, _1512, _1612);
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1646;
    float _1650 = fma(_1632, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1652;
    float _1656 = fma(_1628, _1512, _1614);
    float _1658 = fma(_1644, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1660 = fma(_1648, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1662 = fma(_1634, _1488, _1638);
    float _1664 = fma(_1636, _1488, _1640);
    float _1666 = fma(_1654, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1668 = fma(_1650, _1488, _1656);
    float _1670 = fma(_1658, _1464, _1662);
    float _1672 = fma(_1660, _1464, _1664);
    float _1674 = fma(_1666, _1464, _1668);
    float _1676 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1670);
    float _1678 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1672);
    float _1680 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1674);
    out.m_61.x = _1676;
    out.m_61.y = _1678;
    out.m_61.z = _1680;
    bool _1682 = !_1434;
    float _1700;
    if (!_1682)
    {
        float _1684 = in.m_55.x;
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1688 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1692 = _1690 * _1686;
        float _1694 = floor(_1692);
        float _1696 = -_1694;
        float _1698 = _1692 + _1696;
        _1700 = _1698;
        _1702 = true;
    }
    else
    {
        _1700 = _140;
    }
    _1702 = false;
    float _1704 = _1700;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1708 = _1704 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1712 = _1704 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1728 = _1726 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1730 = 1.0 / _1716;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1742 = _1704 + _1740;
    float _1744 = 1.0 / _1724;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1754 = 1.0 / _1720;
    bool _1756 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1758 = isnan(_1704);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1768;
    bool _1772 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1774 = isnan(_1704);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1766;
    float _1786 = _1784 + 1.0;
    float _1788 = 1.0 / _1734;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1796 = _1704 + _1794;
    float _1798 = _1708 * _1744;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1800;
    float _1804 = _1796 * _1730;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1808 = _1704 + _1806;
    float _1810 = 1.0 / _1728;
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1812;
    float _1816 = fma(_1748, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1818 = _1808 * _1754;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1822 = _1704 + _1820;
    float _1824 = fma(_1814, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1828 = _1826 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1830 = fma(_1752, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1832 = 1.0 / _1792;
    float _1834 = _1712 * _1788;
    bool _1836 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1838 = isnan(_1704);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1844 = _1840 || _1842;
    float _1846 = float(_1844);
    float _1848 = fma(_1828, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1852 = _1704 + _1850;
    float _1854 = 1.0 / _1738;
    float _1856 = _1742 * _1810;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    bool _1866 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1868 = fma(_1860, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    bool _1870 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1872 = isnan(_1704);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = _1822 * _1832;
    bool _1884 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1886 = isnan(_1704);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1846 * _1786;
    float _1898 = -_1846;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1864, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    bool _1904 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1906 = isnan(_1704);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = -_1880;
    float _1918 = _1916 + 1.0;
    float _1920 = _1894 * _1900;
    float _1922 = -_1894;
    float _1924 = _1922 + 1.0;
    bool _1926 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1928 = isnan(_1704);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = _1852 * _1854;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1940;
    float _1944 = _1880 * _1924;
    float _1946 = _1914 * _1918;
    float _1948 = -_1914;
    float _1950 = _1948 + 1.0;
    float _1952 = -_1936;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1770, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1962 = _1936 * _1950;
    float _1964 = fma(_1942, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1966 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    bool _1968 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1970 = isnan(_1704);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = _1782 * _1954;
    float _1982 = -_1782;
    float _1984 = _1982 + 1.0;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1992 = _1990 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1994 = _1978 * _1984;
    float _1996 = -_1978;
    float _1998 = _1996 + 1.0;
    float _2000 = fma(_1988, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2002 = fma(_1992, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2004 = _1824 * _1994;
    float _2006 = _1868 * _1994;
    float _2008 = _1816 * _1994;
    float _2010 = fma(_1960, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2004);
    float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2006);
    float _2016 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2008);
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2018;
    float _2022 = fma(_1848, _1980, _2012);
    float _2024 = fma(_1902, _1980, _2014);
    float _2026 = fma(_1830, _1980, _2016);
    float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2028;
    float _2032 = fma(_1964, _1962, _2022);
    float _2034 = fma(_1956, _1962, _2024);
    float _2036 = fma(_1966, _1962, _2026);
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2038;
    float _2042 = fma(_2002, _1946, _2032);
    float _2044 = fma(_2000, _1946, _2034);
    float _2046 = fma(_2010, _1946, _2036);
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2052 = fma(_2020, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2054 = fma(_2030, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2060 = fma(_2040, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2066 = fma(_2050, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2068 = fma(_2058, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2070 = fma(_2052, _1944, _2042);
    float _2072 = fma(_2054, _1944, _2044);
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2078;
    float _2082 = fma(_2064, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2084;
    float _2088 = fma(_2060, _1944, _2046);
    float _2090 = fma(_2076, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2092 = fma(_2080, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2094 = fma(_2066, _1920, _2070);
    float _2096 = fma(_2068, _1920, _2072);
    float _2098 = fma(_2086, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2100 = fma(_2082, _1920, _2088);
    float _2102 = fma(_2090, _1896, _2094);
    float _2104 = fma(_2092, _1896, _2096);
    float _2106 = fma(_2098, _1896, _2100);
    float _2108 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2102);
    float _2110 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2104);
    float _2112 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2106);
    out.m_63.x = _2108;
    out.m_63.y = _2110;
    out.m_63.z = _2112;
    bool _2114 = !_1866;
    float _2116 = _2076;
    float _2118 = _2068;
    int _2120 = as_type<int>(_2046);
    int _2122 = as_type<int>(_2090);
    float _2124 = _2044;
    float _2126 = _1920;
    float _2128 = _2058;
    if (!_2114)
    {
        float _2130 = in.m_55.x;
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2134 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _2138 = _2136 * _2132;
        float _2140 = floor(_2138);
        float _2142 = -_2140;
        float _2144 = _2138 + _2142;
        _154 = _2144;
    }
    float _2146 = _154;
    float _2148 = in.m_55.y;
    int _2150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2152 = _2150 != 0;
    float _2154 = in.m_65.x;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2158 = _2156 != 0;
    int _2160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2162 = _2160 != 0;
    float _2164 = _2064;
    float _2166 = _2154;
    if (_2152)
    {
        float _2168 = in.m_55.x;
        _2164 = _2168;
    }
    float _2170 = _2164;
    int _2172 = 0;
    if (_2152)
    {
        _2172 = 0;
    }
    int _2174 = _2172;
    float _2176 = _2032;
    int _2178 = _2174;
    if (_2152)
    {
        float _2180 = in.m_55.z;
        _2176 = _2180;
    }
    float _2182 = _2176;
    float _2184 = _2082;
    if (_2158)
    {
        float _2186 = in.m_55.x;
        _2184 = _2186;
    }
    float _2188 = _2184;
    float _2190 = _2148 * 2.0;
    int _2192 = as_type<int>(_2190);
    if (_2152)
    {
        _2116 = _2148;
    }
    float _2194 = _2116;
    float _2196 = _2112;
    float _2198 = _2194;
    if (_2162)
    {
        float _2200 = in.m_55.z;
        _2196 = _2200;
    }
    float _2202 = _2196;
    float _2204 = floor(_2190);
    float _2206 = _2170;
    if (_2152)
    {
        _2118 = _2170;
    }
    float _2208 = _2118;
    float _2210 = _2182;
    float _2212 = _2208;
    if (_2152)
    {
        _2120 = as_type<int>(_2182);
    }
    int _2214 = _2120;
    int _2216 = _2214;
    float _2218 = _2188;
    if (!_2152)
    {
        float _2220 = in.m_55.x;
        float _2222 = _2148 * 3.1415927410125732421875;
        float _2224 = in.m_55.z;
        float _2226 = _2222 * 0.15915493667125701904296875;
        float _2228 = _2226 * 6.283185482025146484375;
        float _2230 = sin(_2228);
        float _2232 = _2220 * 3.1415927410125732421875;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2224 * 3.1415927410125732421875;
        float _2238 = _2236 * 0.15915493667125701904296875;
        float _2240 = _2234 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2210 = _2224;
        _2206 = _2220;
        _2192 = as_type<int>(_2238);
        _2178 = 1;
        _2212 = _2242;
        _2198 = _2230;
        _2216 = as_type<int>(_2246);
    }
    float _2248 = _2210;
    float _2250 = _2206;
    int _2252 = _2192;
    int _2254 = _2178;
    float _2256 = _2212;
    float _2258 = _2198;
    int _2260 = _2216;
    float _2262 = _2248 * 2.0;
    bool _2264 = false;
    int _2266 = _2252;
    if (_2162)
    {
        bool _2268 = _2202 > 0.5;
        _2264 = _2268;
    }
    bool _2270 = _2264;
    float _2272 = _2250 * 2.0;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2276 = _2274 != 0;
    if (_2158)
    {
        float _2278 = -_2154;
        float _2280 = _2278 + 1.0;
        _2266 = as_type<int>(_2280);
    }
    int _2282 = _2266;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2286 = _2284 != 0;
    float _2288 = floor(_2262);
    bool _2290 = false;
    int _2292 = _2282;
    if (_2158)
    {
        bool _2294 = _2188 > 0.5;
        _2290 = _2294;
    }
    bool _2296 = _2290;
    if (_2162)
    {
        float _2298 = -_2154;
        float _2300 = _2298 + 1.0;
        _2122 = as_type<int>(_2300);
    }
    int _2302 = _2122;
    float _2304 = in.m_65.y;
    int _2306 = _2302;
    if (!_2158)
    {
        _2124 = _2154;
    }
    float _2308 = _2124;
    float _2310 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2312 = _2308;
    if (!_2162)
    {
        _2218 = _2154;
    }
    float _2314 = _2218;
    float _2316 = in.m_55.w;
    float _2318 = floor(_2272);
    float _2320 = _2314;
    if (_2158)
    {
        float _2322 = _2296 ? as_type<float>(_2282) : _2154;
        _2312 = _2322;
    }
    float _2324 = _2312;
    if (_2276)
    {
        float _2326 = -_2154;
        float _2328 = _2326 + 1.0;
        _2292 = as_type<int>(_2328);
    }
    int _2330 = _2292;
    int _2332 = _2330;
    if (_2162)
    {
        float _2334 = _2270 ? as_type<float>(_2302) : _2154;
        _2320 = _2334;
    }
    float _2336 = _2320;
    if (_2286)
    {
        float _2338 = -_2154;
        float _2340 = _2338 + 1.0;
        _2306 = as_type<int>(_2340);
    }
    int _2342 = _2306;
    bool _2344 = _2148 > 0.5;
    float _2346 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2310);
    if (!_2276)
    {
        _2126 = _2154;
    }
    float _2348 = _2126;
    float _2350 = _2348;
    if (!_2286)
    {
        _2128 = _2154;
    }
    float _2352 = _2128;
    float _2354 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2346);
    float _2356 = _2352;
    if (_2276)
    {
        float _2358 = _2344 ? as_type<float>(_2330) : _2154;
        _2350 = _2358;
    }
    float _2360 = _2350;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2364 = _2362 != 0;
    float _2366 = _2354 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2286)
    {
        float _2368 = _2344 ? as_type<float>(_2342) : _2154;
        _2356 = _2368;
    }
    float _2370 = _2356;
    bool _2372 = _2288 >= 0.0;
    bool _2374 = isnan(_2288);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(0.0);
    bool _2380 = _2376 || _2378;
    bool _2382 = _2204 > 0.0;
    float _2384 = -_2304;
    float _2386 = _2384 + 1.0;
    bool _2388 = _2318 >= 0.0;
    bool _2390 = isnan(_2318);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan(0.0);
    bool _2396 = _2392 || _2394;
    bool _2398 = _2204 >= 0.0;
    bool _2400 = isnan(_2204);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(0.0);
    bool _2406 = _2402 || _2404;
    int _2408 = _2380 ? 0 : 1;
    if (_2364)
    {
        float _2410 = -_2154;
        float _2412 = _2410 + 1.0;
        _2332 = as_type<int>(_2412);
    }
    int _2414 = _2332;
    bool _2416 = _2288 > 0.0;
    int _2418 = _2396 ? 0 : 1;
    bool _2420 = _2318 > 0.0;
    int _2422 = _2406 ? 0 : 1;
    int _2424 = ~_2408;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    int _2436 = _2434;
    int _2438 = _2428;
    if (!_2382)
    {
        int _2440 = ~_2422;
        int _2442 = _2440 + 1;
        _2436 = _2442;
    }
    int _2444 = _2436;
    bool _2446 = _2248 > 0.5;
    if (_2364)
    {
        float _2448 = _2344 ? as_type<float>(_2414) : _2154;
        _2166 = _2448;
    }
    float _2450 = _2166;
    if (!_2416)
    {
        int _2452 = ~_2408;
        int _2454 = _2452 + 1;
        _2438 = _2454;
    }
    int _2456 = _2438;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2460 = _2458 != 0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2464 = _2462 != 0;
    int _2466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2468 = _2466 != 0;
    int _2470 = _2446 ? as_type<int>(_2386) : as_type<int>(_2304);
    int _2472 = ~_2418;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    int _2478 = _2476;
    if (!_2420)
    {
        int _2480 = ~_2418;
        int _2482 = _2480 + 1;
        _2478 = _2482;
    }
    int _2484 = _2478;
    float _2486 = _2468 ? as_type<float>(_2470) : _2304;
    int _2488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2490 = _2488 != 0;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2494 = _2492 != 0;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2498 = _2496 != 0;
    float _2500 = in.m_67.x;
    float _2502 = in.m_67.y;
    float _2504 = in.m_67.z;
    bool _2506 = !_2490;
    int _2508 = _2506 ? 0 : 1;
    float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2514 = !_2494;
    int _2516 = _2514 ? 0 : 1;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2528 = _2526 != 0;
    float _2530 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2532 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2534 = 1.0 / _2512;
    float _2536 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2532);
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2546 = 1.0 / _2520;
    int _2548 = _2344 ? as_type<int>(_2386) : as_type<int>(_2304);
    float _2550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2504);
    bool _2552 = _2316 > 0.5;
    float _2554 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2530);
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2558 = _2556 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2560 = 1.0 / _2540;
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2564 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2566 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2554);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2576 = fma(_2564, -2.0, _2562);
    float _2578 = 1.0 / _2544;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2580;
    float _2584 = _2574 * _2534;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2586;
    float _2590 = _2582 * _2546;
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2594 = _2592 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2596 = 1.0 / _2558;
    float _2598 = _2588 * _2560;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2608 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2536);
    float _2610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2500);
    bool _2612 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2614 = isnan(_2146);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = 1.0 / _2570;
    float _2626 = _2594 * _2578;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2502);
    bool _2632 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2634 = isnan(_2146);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2644;
    float _2648 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2650 = log2(_2648);
    float _2652 = _2602 * _2596;
    float _2654 = -_2642;
    float _2656 = _2654 + 1.0;
    float _2658 = _2460 ? as_type<float>(_2548) : _2304;
    float _2660 = _2566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2662 = _2608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2664 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _2666 = _2664 + 1.0;
    float _2668 = 1.0 / _2606;
    float _2670 = _2646 * _2624;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2674 = _2146 + _2672;
    float _2676 = _2666 * 0.2000000476837158203125;
    float _2678 = fma(_2590, _2674, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2680 = fma(_648, _2676, _648);
    float _2682 = _128 * _2650;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2688 = fma(_650, _2676, _650);
    float _2690 = fma(_652, _2676, _652);
    float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2694 = _2146 + _2692;
    bool _2696 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2698 = isnan(_2146);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = exp2(_2682);
    bool _2710 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2712 = isnan(_2146);
    bool _2714 = _2710 || _2712;
    bool _2716 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2718 = _2714 || _2716;
    float _2720 = float(_2718);
    float _2722 = _2686 * _2668;
    float _2724 = fma(_2652, _2694, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2728 = _2146 + _2726;
    bool _2730 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2732 = isnan(_2146);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = -_2706;
    float _2744 = _2742 + 1.0;
    float _2746 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2748 = fma(_2584, _2728, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2750 = -_2720;
    float _2752 = _2750 + 1.0;
    float _2754 = _2740 * _2744;
    float _2756 = precise::min(_2746, 1.5);
    float _2758 = -_2740;
    float _2760 = _2758 + 1.0;
    float _2762 = _2706 * _2752;
    bool _2764 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2766 = isnan(_2146);
    bool _2768 = _2764 || _2766;
    bool _2770 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2772 = _2768 || _2770;
    float _2774 = float(_2772);
    float _2776 = -_2708;
    float _2778 = _2776 + 1.0;
    float _2780 = fma(_2756, _2628, 1.0);
    float _2782 = _2622 * _2760;
    bool _2784 = !_2498;
    int _2786 = _2784 ? 0 : 1;
    float _2788 = -_2622;
    float _2790 = _2788 + 1.0;
    bool _2792 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2794 = isnan(0.0);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2800 = _2796 || _2798;
    float _2802 = -_2774;
    float _2804 = _2802 + 1.0;
    bool _2806 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2808 = isnan(_2146);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = _2774 * _2790;
    float _2820 = _2800 ? _2778 : 0.0;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2824 = 1.0 + _2822;
    float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2828 = _2146 + _2826;
    float _2830 = _2816 * _2804;
    float _2832 = -_2816;
    float _2834 = _2832 + 1.0;
    bool _2836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2838 = isnan(1.0);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2844 = _2840 || _2842;
    float _2846 = fma(_2626, _2828, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2848 = 1.0 / _2824;
    float _2850 = _2642 * _2834;
    float _2852 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2854 = _2146 + _2852;
    bool _2856 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2858 = isnan(_2146);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2870 = _2146 + _2868;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2874 = _2146 + _2872;
    float _2876 = fma(_2670, _2854, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2878 = _2680 * _2780;
    float _2880 = _2688 * _2780;
    float _2882 = _2690 * _2780;
    int _2884 = abs(_2508);
    float _2886 = _2866 * _2656;
    float _2888 = -_2866;
    float _2890 = _2888 + 1.0;
    int _2892 = abs(_2786);
    float _2894 = fma(_2598, _2870, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2896 = _2678 * _2886;
    float _2898 = _2820 * _2848;
    float _2900 = _2878 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2902 = _2880 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2904 = float(_2456);
    float _2906 = fma(_2890, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2896);
    bool _2908 = !_2844;
    float _2910 = _2908 ? _128 : _2898;
    float _2912 = _2902 * _2630;
    bool _2914 = _2254 != 1;
    float _2916 = _2900 * _2610;
    int _2918 = abs(_2516);
    float _2920 = in.m_69.x;
    float _2922 = in.m_69.y;
    float _2924 = in.m_69.z;
    float _2926 = float(_2884);
    float _2928 = _2148 + _2248;
    float _2930 = _2148 + _2250;
    float _2932 = _2928 + (-1.0);
    float _2934 = float(_2484);
    float _2936 = _2926 * _2904;
    float _2938 = float(_2918);
    float _2940 = _2930 + (-1.0);
    float _2942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2944 = float(_2444);
    float _2946 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2948 = float(_2892);
    float _2950 = _2936 * (-2.0);
    float _2952 = _2938 * _2934;
    float _2954 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2956 = _2948 * _2944;
    float _2958 = _2250 + (-0.5);
    float _2960 = _2952 * (-2.0);
    float _2962 = fma(_2954, _2950, _2954);
    float _2964 = fma(_2950, _2920, _2920);
    float _2966 = _2148 + (-0.5);
    float _2968 = fma(_2960, _2922, _2922);
    float _2970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2972 = fma(_2958, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2964);
    float _2974 = fma(_2946, _2960, _2946);
    float _2976 = _2250 + _2248;
    float _2978 = fma(_2148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2970);
    float _2980 = fma(_2910, _2962, _2972);
    float _2982 = _2882 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2984 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2968);
    float _2986 = _2980 * 0.15915493667125701904296875;
    float _2988 = _2976 + (-1.0);
    float _2990 = _2956 * (-2.0);
    float _2992 = _2982 * _2550;
    float _2994 = fma(_2910, _2974, _2984);
    float _2996 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2998 = fma(_2990, _2924, _2924);
    float _3000 = _2248 + (-0.5);
    float _3002 = fma(_2996, _2990, _2996);
    float _3004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3006 = fma(_3000, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2998);
    float _3008 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3012 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3004);
    float _3014 = fma(_2910, _3002, _3006);
    float _3016 = _2250 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3020 = fma(_3008, _2324, -0.5);
    float _3022 = _3014 * 0.15915493667125701904296875;
    float _3024 = _2994 * 0.15915493667125701904296875;
    float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3028 = fma(_2748, _2850, _2906);
    float _3030 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3034 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3036 = _2986 * 6.283185482025146484375;
    float _3038 = sin(_3036);
    float _3040 = _3010 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3042 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3044 = -_3032;
    float _3046 = fma(_3030, 2.0, _3044);
    float _3048 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3050 = fma(_3040, _2370, -0.5);
    float _3052 = fma(_3034, -2.0, _3042);
    float _3054 = _2986 * 6.283185482025146484375;
    float _3056 = cos(_3054);
    float _3058 = _3026 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3060 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[93].z, _3048);
    float _3062 = fma(_2724, _2830, _3028);
    bool _3064 = !_2914;
    float _3066 = _3064 ? _2258 : _2256;
    float _3068 = fma(_3058, _2450, -0.5);
    bool _3070 = !_2914;
    float _3072 = _3070 ? as_type<float>(_2260) : _2258;
    float _3074 = fma(_2846, _2818, _3062);
    float _3076 = _3024 * 6.283185482025146484375;
    float _3078 = sin(_3076);
    float _3080 = -_3018;
    float _3082 = fma(_3016, 2.0, _3080);
    float _3084 = -_128;
    float _3086 = fma(_3084, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3046);
    float _3088 = fma(_2894, _2782, _3074);
    float _3090 = fma(_2722, _2874, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3092 = _3022 * 6.283185482025146484375;
    float _3094 = cos(_3092);
    float _3096 = _3024 * 6.283185482025146484375;
    float _3098 = cos(_3096);
    float _3100 = _3038 * _3078;
    float _3102 = _3056 * _3078;
    float _3104 = _3022 * 6.283185482025146484375;
    float _3106 = sin(_3104);
    float _3108 = _3094 * _2912;
    float _3110 = _3078 * _3094;
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3114 = _3056 * _3108;
    float _3116 = fma(_2258, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3112);
    float _3118 = _3056 * _3098;
    float _3120 = _3098 * _3094;
    float _3122 = _3038 * _3098;
    float _3124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3126 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3060);
    float _3128 = fma(_3106, _3118, _3100);
    float _3130 = -_2912;
    float _3132 = _3106 * _3130;
    float _3134 = -_3102;
    float _3136 = fma(_3106, _3122, _3134);
    float _3138 = -_3122;
    float _3140 = fma(_3106, _3102, _3138);
    float _3142 = fma(_3128, _2916, _3114);
    float _3144 = fma(_3120, _2916, _3132);
    float _3146 = fma(_3106, _3100, _3118);
    float _3148 = _3038 * _3108;
    float _3150 = fma(_3140, _2992, _3142);
    float _3152 = fma(_3110, _2992, _3144);
    float _3154 = _2524 ? as_type<float>(_2470) : _2304;
    float _3156 = fma(_3136, _2916, _3148);
    float _3158 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3160 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3162 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3164 = fma(_3146, _2992, _3156);
    float _3166 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3158);
    float _3168 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3160);
    float _3170 = fma(_3162, _2658, -0.5);
    int _3172 = _2552 ? as_type<int>(_2386) : as_type<int>(_2304);
    float _3174 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3166);
    float _3176 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3168);
    float _3178 = _2528 ? as_type<float>(_2470) : _2304;
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3182 = _3174 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3184 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3186 = _2464 ? as_type<float>(_3172) : _2304;
    float _3188 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2978);
    float _3190 = _2660 + _3182;
    float _3192 = _2662 + _3184;
    float _3194 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3012);
    float _3196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3200 = _3190 + _3198;
    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3204 = _3192 + _3202;
    float _3206 = -_128;
    float _3208 = fma(_3206, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3082);
    float _3210 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2576);
    float _3212 = _3200 * _3200;
    float _3214 = _3204 * _3204;
    float _3216 = fma(_3194, _3020, _3208);
    float _3218 = -_3210;
    float _3220 = fma(_3188, _3170, _3218);
    float _3222 = _3212 + _3214;
    float _3224 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3226 = fma(_3126, _3050, _3086);
    float _3228 = sqrt(_3222);
    float _3230 = fma(_3224, _3154, -0.5);
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3234 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3236 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3240 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3234);
    float _3242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3244 = fma(_3236, _3178, -0.5);
    float _3246 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3238);
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3250 = _3066 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3252 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3240);
    float _3254 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3256 = fma(_3072, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3248);
    bool _3258 = _3228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3262 = -_3232;
    float _3264 = fma(_3250, 2.0, _3262);
    float _3266 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3116);
    float _3268 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3270 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3052);
    float _3272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3274 = _2366 + _3268;
    float _3276 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3278 = -_3270;
    float _3280 = fma(_3266, _3230, _3278);
    float _3282 = _3074;
    float _3284 = _3214;
    float _3286 = _3212;
    float _3288 = _3190;
    float _3290 = _3192;
    if (!_3258)
    {
        _3282 = _3214;
    }
    float _3292 = _3282;
    float _3294 = _3292;
    if (!_3258)
    {
        _3284 = _3212;
    }
    float _3296 = _3284;
    float _3298 = fma(_3254, -2.0, _3276);
    float _3300 = _3296;
    if (!_3258)
    {
        _3286 = _3274;
    }
    float _3302 = _3286;
    bool _3304 = !_3258;
    float _3306 = _3302;
    if (!_3304)
    {
        float _3308 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3312 = _3228 + _3310;
        float _3314 = rsqrt(_3222);
        float _3316 = _3312 * _3308;
        float _3318 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3320 = _3316 * 0.15915493667125701904296875;
        float _3322 = _3320 * 6.283185482025146484375;
        float _3324 = sin(_3322);
        float _3326 = _3320 * 6.283185482025146484375;
        float _3328 = cos(_3326);
        float _3330 = fma(_3324, _3318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3332 = _3314 * _3330;
        float _3334 = _3328 + (-1.0);
        float _3336 = fma(_3200, _3332, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3338 = fma(_3204, _3332, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3340 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3344 = _3336 + _3342;
        float _3346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3348 = _3338 + _3346;
        float _3350 = fma(_3274, _3328, _3340);
        float _3352 = _3344 * _3344;
        float _3354 = _3348 * _3348;
        _3306 = _3350;
        _3300 = _3352;
        _3294 = _3354;
        _3288 = _3336;
        _3290 = _3338;
    }
    float _3356 = _3306;
    float _3358 = _3300;
    float _3360 = _3294;
    float _3362 = _3288;
    float _3364 = _3290;
    float _3366 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3368 = _3356 + _3366;
    float _3370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3372 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3246);
    float _3374 = -_128;
    float _3376 = fma(_3374, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3264);
    float _3378 = fma(_3368, _3368, _3358);
    float _3380 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3256);
    float _3382 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3298);
    float _3384 = fma(_3090, _2754, _3088);
    float _3386 = _3378 + _3360;
    float _3388 = fma(_3372, _3068, _3376);
    float _3390 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3392 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3394 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3396 = _3186 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3398 = sqrt(_3386);
    float _3400 = -_3382;
    float _3402 = fma(_3380, _3244, _3400);
    float _3404 = fma(_2876, _2762, _3384);
    float _3406 = _3392 * _3370;
    float _3408 = _3394 * _3242;
    float _3410 = _3396 * _3260;
    float _3412 = _3390 * _3272;
    float _3414 = _3226 + 0.5;
    float _3416 = _3216 + 0.5;
    float _3418 = _3220 + 0.5;
    float _3420 = _3280 + 0.5;
    float _3422 = _3388 + 0.5;
    float _3424 = _3402 + 0.5;
    float _3426 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3404);
    out.m_71.x = _3416;
    out.m_71.y = _3418;
    out.m_71.z = _3408;
    out.m_71.w = _3410;
    bool _3428 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3430 = isnan(_3398);
    bool _3432 = _3428 || _3430;
    bool _3434 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3436 = _3432 || _3434;
    out.m_73.x = _3412;
    out.m_73.y = _3406;
    out.m_75.x = _3414;
    out.m_75.y = _3420;
    out.m_77.x = _3422;
    out.m_77.y = _3424;
    float _3438 = _3390;
    float _3440 = _3416;
    float _3442 = _3418;
    if (!_3436)
    {
        _3438 = 1.0;
    }
    float _3444 = _3438;
    out.m_79.x = _3426;
    bool _3446 = !_3436;
    float _3448 = _3444;
    if (!_3446)
    {
        bool _3450 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3452 = isnan(_3398);
        bool _3454 = _3450 || _3452;
        bool _3456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3458 = _3454 || _3456;
        if (!_3458)
        {
            float _3460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3462 = _3398 + _3460;
            float _3464 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3466 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3464;
            float _3468 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3470 = _3468 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3472 = 1.0 / _3466;
            float _3474 = _3462 * _3472;
            float _3476 = fma(_3474, _3470, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3448 = _3476;
            _3478 = true;
        }
        else
        {
            bool _3480 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3482 = isnan(_3398);
            bool _3484 = _3480 || _3482;
            bool _3486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3488 = _3484 || _3486;
            if (!_3488)
            {
                float _3490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3492 = _3398 + _3490;
                float _3494 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3496 = _3494 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3498 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3500 = _3498 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3502 = 1.0 / _3496;
                float _3504 = _3492 * _3502;
                float _3506 = fma(_3504, _3500, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3448 = _3506;
                _3478 = true;
            }
            else
            {
                _3448 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3478 = false;
    float _3508 = _3448;
    float _3510 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3512 = _3356 + _3510;
    float _3514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3516 = _3362 + _3514;
    float _3518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3520 = _3364 + _3518;
    float _3522 = fma(_3512, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3524 = fma(_3516, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3526 = fma(_3520, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3528 = -_2366;
    float _3530 = _3528 + _3522;
    float _3532 = -_2660;
    float _3534 = _3532 + _3524;
    float _3536 = -_2662;
    float _3538 = _3536 + _3526;
    float _3540 = _3530 * _3530;
    float _3542 = fma(_3534, _3534, _3540);
    float _3544 = fma(_3538, _3538, _3542);
    float _3546 = sqrt(_3544);
    bool _3548 = _3546 > 0.0;
    bool _3550 = !_3548;
    float _3552 = _3546;
    float _3554 = _3524;
    float _3556 = _3522;
    float _3558 = _3526;
    float _3560 = _3546;
    if (!_3550)
    {
        bool _3562 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3564 = _3408;
        if (_3562)
        {
            float _3566 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3564 = _3566;
        }
        float _3568 = _3564;
        if (_3562)
        {
            float _3570 = _408 * _3568;
            _3440 = _3570;
        }
        float _3572 = _3440;
        float _3574 = _3572;
        if (_3562)
        {
            float _3576 = _410 * _3568;
            _3442 = _3576;
        }
        float _3578 = _3442;
        float _3580 = _3578;
        if (_3562)
        {
            float _3582 = _412 * _3568;
            _3552 = _3582;
        }
        float _3584 = _3552;
        float _3586 = _3584;
        if (!_3562)
        {
            float _3588 = _128 + 1.0;
            float _3590 = _3588;
            if (!_174)
            {
                float _3592 = _3588 * _3588;
                float _3594 = _3592 * 0.5;
                _416 = _3594;
            }
            float _3596 = _416;
            float _3598 = _3596;
            if (!_174)
            {
                float _3600 = _3596 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3598 = _3600;
            }
            float _3602 = _3598;
            bool _3604 = !_174;
            float _3606 = _3602;
            if (!_3604)
            {
                float _3608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3610 = log2(_3608);
                float _3612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3614 = _3612 + 1.0;
                float _3616 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3618 = _3610 * _3588;
                float _3620 = 1.0 / _3614;
                float _3622 = _3616 * 0.693147182464599609375;
                float _3624 = exp2(_3618);
                float _3626 = 1.0 / _3622;
                float _3628 = _3624 + (-1.0);
                float _3630 = -_3628;
                float _3632 = fma(_3630, _3626, _3588);
                float _3634 = _3632 * _3620;
                float _3636 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3606 = _3636;
            }
            float _3638 = _3606;
            float _3640 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3642 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3644 = !_174;
            if (!_3644)
            {
                float _3646 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3648 = log2(_3646);
                float _3650 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3652 = _3650 + 1.0;
                float _3654 = 1.0 / _3652;
                float _3656 = _3648 * _3588;
                float _3658 = exp2(_3656);
                float _3660 = -_3658;
                float _3662 = _3660 + 1.0;
                float _3664 = _3662 * _3654;
                _3590 = _3664;
            }
            float _3666 = _3590;
            float _3668 = fma(_3666, _178, _3642);
            float _3670 = fma(_3666, _176, _3640);
            float _3672 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3674 = -_370;
            float _3676 = _3674 + _3668;
            float _3678 = -_374;
            float _3680 = _3678 + _3670;
            float _3682 = fma(_3666, _180, _3672);
            float _3684 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3686 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3688 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3690 = -_376;
            float _3692 = _3690 + _3682;
            float _3694 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3684);
            float _3696 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3686);
            float _3698 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3688);
            float _3700 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3694);
            float _3702 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3696);
            float _3704 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3698);
            _418 = _3702;
            _420 = _3700;
            _422 = _3704;
            _3574 = _3700;
            _3580 = _3702;
            _3586 = _3704;
        }
        float _3706 = _418;
        float _3708 = _420;
        float _3710 = _422;
        float _3712 = _3574;
        float _3714 = _3580;
        float _3716 = _3586;
        float _3718 = _3706 * _3706;
        float _3720 = rsqrt(_3544);
        float _3722 = fma(_3708, _3708, _3718);
        float _3724 = fma(_3710, _3710, _3722);
        float _3726 = sqrt(_3724);
        float _3728 = _3534 * _3720;
        float _3730 = _3530 * _3720;
        float _3732 = _3538 * _3720;
        bool _3734 = _3726 > 0.0;
        bool _3736 = !_3734;
        _424 = _3724;
        _426 = _3708;
        _3560 = _3716;
        if (!_3736)
        {
            float _3738 = rsqrt(_3724);
            float _3740 = _3738 * _3706;
            float _3742 = _3738 * _3708;
            float _3744 = _3738 * _3710;
            float _3746 = _3730 * _3740;
            float _3748 = fma(_3728, _3742, _3746);
            float _3750 = fma(_3732, _3744, _3748);
            float _3752 = _3750 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3754 = fma(_3712, _3752, _3524);
            float _3756 = fma(_3714, _3752, _3522);
            float _3758 = fma(_3716, _3752, _3526);
            _3554 = _3754;
            _3556 = _3756;
            _3558 = _3758;
        }
    }
    float _3760 = _3554;
    float _3762 = _3556;
    float _3764 = _3558;
    float _3766 = _424;
    float _3768 = _426;
    float _3770 = _3560;
    float _3772 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3774 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3772);
    float _3776 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3778 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan(0.5);
    bool _3786 = _3782 || _3784;
    float _3788 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3774);
    float _3790 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3776);
    float _3792 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3794 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3790);
    bool _3796 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3798 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan(0.5);
    bool _3804 = _3800 || _3802;
    float _3806 = 1.0 / _3792;
    float _3808 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3810 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3812 = _3788;
    float _3814 = _3808;
    float _3816 = _3762;
    float _3818 = _3766;
    float _3820 = _3768;
    float _3822 = _3770;
    if (_3786)
    {
        _3810 = _3760;
    }
    float _3824 = _3810;
    float _3826 = _3808 + _3792;
    float _3828 = _3824;
    if (_3786)
    {
        _3812 = _3762;
    }
    float _3830 = _3812;
    float _3832 = _3830;
    if (_3786)
    {
        _3814 = _3764;
    }
    float _3834 = _3814;
    float _3836 = _3834;
    float _3838 = _3806;
    if (!_3786)
    {
        float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3842 = _2366 + _3840;
        float _3844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3846 = _2660 + _3844;
        float _3848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3850 = -_2662;
        float _3852 = _3850 + _3764;
        float _3854 = _3842 * _3842;
        float _3856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3858 = _2662 + _3856;
        float _3860 = fma(_3846, _3846, _3854);
        float _3862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3864 = fma(_3858, _3858, _3860);
        float _3866 = sqrt(_3864);
        float _3868 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3870 = precise::min(_3866, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3872 = _3870 * _3862;
        float _3874 = -_2660;
        float _3876 = _3874 + _3760;
        float _3878 = _3868 * _3872;
        float _3880 = -_2366;
        float _3882 = _3880 + _3762;
        float _3884 = fma(_3876, _3878, _2660);
        float _3886 = fma(_3882, _3878, _2366);
        float _3888 = fma(_3852, _3878, _2662);
        _3832 = _3886;
        _3828 = _3884;
        _3836 = _3888;
    }
    float _3890 = _3832;
    float _3892 = _3828;
    float _3894 = _3836;
    if (_3804)
    {
        _3816 = 1.0;
    }
    float _3896 = _3816;
    float _3898 = _3826 * _3806;
    float _3900 = _3898 * 0.5;
    float _3902 = _3896;
    if (!_3804)
    {
        float _3904 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3906 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3908 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3906);
        float _3910 = _3904 * 0.15915493667125701904296875;
        float _3912 = _3910 * 6.283185482025146484375;
        float _3914 = cos(_3912);
        float _3916 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3918 = _3916 * 0.15915493667125701904296875;
        float _3920 = _3910 * 6.283185482025146484375;
        float _3922 = sin(_3920);
        float _3924 = 1.0 / _3914;
        float _3926 = _3918 * 6.283185482025146484375;
        float _3928 = cos(_3926);
        float _3930 = _3922 * _3924;
        float _3932 = 1.0 / _3908;
        float _3934 = _3928 * _3930;
        float _3936 = _3918 * 6.283185482025146484375;
        float _3938 = sin(_3936);
        float _3940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3942 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3940;
        float _3944 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3946 = _3932 * _3944;
        float _3948 = 1.0 / _3934;
        float _3950 = 1.0 / _3942;
        float _3952 = _3938 * _3948;
        float _3954 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3956 = fma(_3952, _3946, _3954);
        float _3958 = _3956 * _3950;
        float _3960 = precise::clamp(_3958, 0.0, 1.0);
        _3818 = _3950;
        _3838 = _3918;
        _3902 = _3960;
    }
    float _3962 = _3818;
    float _3964 = _3838;
    float _3966 = _3902;
    float _3968 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3970 = _3890 + _3968;
    float _3972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3974 = _3892 + _3972;
    float _3976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3978 = _3894 + _3976;
    float _3980 = _3970 * _3970;
    float _3982 = fma(_3974, _3974, _3980);
    float _3984 = fma(_3978, _3978, _3982);
    float _3986 = rsqrt(_3984);
    float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3990 = _3974 * _3988;
    float _3992 = _3978 * _3988;
    float _3994 = _3990 * _3990;
    float _3996 = _3992 * _3992;
    float _3998 = _3994 + _3996;
    float _4000 = sqrt(_3998);
    bool _4002 = _4000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4006 = _4000 + _4004;
    float _4008 = _3978;
    float _4010 = _3964;
    float _4012 = _4006;
    float _4014 = _3990;
    if (_4002)
    {
        float _4016 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4008 = _4016;
    }
    float _4018 = _4008;
    if (_4002)
    {
        float _4020 = rsqrt(_3998);
        _4010 = _4020;
    }
    float _4022 = _4010;
    float _4024 = _4022;
    if (_4002)
    {
        float _4026 = _4006 * _4018;
        _4012 = _4026;
    }
    float _4028 = _4012;
    if (_4002)
    {
        float _4030 = _4028 * 0.15915493667125701904296875;
        _3820 = _4030;
    }
    float _4032 = _3820;
    float _4034 = _3986;
    if (_4002)
    {
        float _4036 = _4032 * 6.283185482025146484375;
        float _4038 = sin(_4036);
        _4034 = _4038;
    }
    float _4040 = _4034;
    float _4042 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4044 = precise::max(0.0, _4042);
    float _4046 = _3962;
    float _4048 = _4044;
    float _4050 = _4042;
    if (_4002)
    {
        float _4052 = _4032 * 6.283185482025146484375;
        float _4054 = cos(_4052);
        _4046 = _4054;
    }
    float _4056 = _4046;
    float _4058 = -_3988;
    float _4060 = -_4044;
    float _4062 = fma(_3970, _4058, _4060);
    float _4064 = _4062;
    if (_4002)
    {
        float _4066 = _4062 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4048 = _4066;
    }
    float _4068 = _4048;
    float _4070 = sqrt(_3984);
    float _4072 = _4040;
    float _4074 = _4068;
    if (_4002)
    {
        float _4076 = fma(_4040, _4068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4072 = _4076;
    }
    float _4078 = _4072;
    float _4080 = _4078;
    if (!_4002)
    {
        _4074 = _3994;
    }
    float _4082 = _4074;
    float _4084 = _4082;
    if (_4002)
    {
        float _4086 = _4056 + (-1.0);
        _4050 = _4086;
    }
    float _4088 = _4050;
    float _4090 = _4088;
    if (_4002)
    {
        float _4092 = _4022 * _4078;
        _3822 = _4092;
    }
    float _4094 = _3822;
    if (!_4002)
    {
        _4080 = _4062;
    }
    float _4096 = _4080;
    float _4098 = _4096;
    if (_4002)
    {
        float _4100 = _4088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4024 = _4100;
    }
    float _4102 = _4024;
    if (_4002)
    {
        float _4104 = _3990 * _4094;
        _4014 = _4104;
    }
    float _4106 = _4014;
    if (!_4002)
    {
        _4090 = _3992;
    }
    float _4108 = _4090;
    float _4110 = _4108;
    if (_4002)
    {
        float _4112 = _3992 * _4094;
        _4110 = _4112;
    }
    float _4114 = _4110;
    if (_4002)
    {
        float _4116 = fma(_4062, _4056, _4102);
        _4098 = _4116;
    }
    float _4118 = _4098;
    if (_4002)
    {
        float _4120 = _4106 * _4106;
        _4084 = _4120;
    }
    float _4122 = _4084;
    if (!_4002)
    {
        _4064 = _3996;
    }
    float _4124 = _4064;
    float _4126 = _4124;
    if (_4002)
    {
        float _4128 = _4114 * _4114;
        _4126 = _4128;
    }
    float _4130 = _4126;
    float _4132 = fma(_4118, _4118, _4122);
    float _4134 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4136 = _4132 + _4130;
    float _4138 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4142 = fma(_4070, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4140);
    float _4144 = precise::clamp(_4142, 0.0, 1.0);
    float _4146 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4148 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4138);
    float _4150 = rsqrt(_4136);
    float _4152 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4154 = -_4144;
    float _4156 = _4154 + 1.0;
    float _4158 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4148);
    float _4160 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4162 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4152);
    float _4164 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4146);
    float _4166 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4168 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4160);
    float _4170 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4162);
    float _4172 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4164);
    float _4174 = _4166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4176 = abs(_4156);
    float _4178 = log2(_4176);
    float _4180 = _4170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4182 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4168);
    float _4184 = -_4174;
    float _4186 = fma(_4184, _4134, 1.0);
    float _4188 = _4150 * _4106;
    float _4190 = _4172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4192 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4194 = _4150 * _4118;
    float _4196 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4198 = _4150 * _4114;
    float _4200 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4192);
    float _4202 = _4182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4204 = -_4196;
    float _4206 = fma(_4194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4204);
    float _4208 = log2(_4186);
    float _4210 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4200);
    float _4212 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4214 = -_4198;
    float _4216 = fma(_4214, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4206);
    float _4218 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4220 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4210);
    float _4222 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4224 = fma(_4216, -0.5, 0.5);
    float _4226 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4212);
    float _4228 = 1.0 / _4220;
    float _4230 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4222);
    float _4232 = fma(_4216, 0.5, 0.5);
    float _4234 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4226);
    float _4236 = _4194 + 1.0;
    float _4238 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4230);
    float _4240 = fma(_4232, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4242 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4234);
    float _4244 = exp2(_4218);
    float _4246 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4238);
    float _4248 = fma(_4232, _4240, -0.212114393711090087890625);
    float _4250 = _4208 * 0.693147182464599609375;
    float _4252 = fma(_4232, _4248, 1.570728778839111328125);
    float _4254 = sqrt(_4224);
    float _4256 = _4242 * _4228;
    float _4258 = _4246 * _4228;
    float _4260 = fma(_4256, 0.5, 0.5);
    float _4262 = fma(_4258, -0.5, 0.5);
    float _4264 = -_4194;
    float _4266 = fma(_4244, _4236, _4264);
    float _4268 = _4250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4270 = fma(_4266, 0.5, 0.5);
    float _4272 = _4254 * 0.636619746685028076171875;
    float3 _11105 = float3(_4260, _4262, _4268);
    float _4274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11105, float3(0.0), isnan(_11105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11105, float3(0.0), isnan(_11105)), level(0.0)).x;
    float3 _11116 = float3(_4260, _4262, _4268);
    float4 _4277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11116, float3(0.0), isnan(_11116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11116, float3(0.0), isnan(_11116)), level(0.0)).xyzw;
    float _4279 = _4277.x;
    float _4281 = _4277.y;
    float _4283 = _4277.z;
    float _4285 = _4277.w;
    float _4287 = -_4252;
    float _4289 = fma(_4272, _4287, 1.0);
    float2 _11138 = float2(_4289, _4270);
    float3 _4293 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11138, float2(0.0), isnan(_11138)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11138, float2(0.0), isnan(_11138)), level(0.0)).xyz;
    float _4295 = _4293.x;
    float _4297 = _4293.y;
    float _4299 = _4293.z;
    float _4301 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4303 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4305 = _4220 * 0.5;
    bool _4307 = _3966 > 0.0;
    bool _4309 = isnan(_3966);
    bool _4311 = _4307 || _4309;
    bool _4313 = isnan(0.0);
    bool _4315 = _4311 || _4313;
    float _4317 = _3966 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4319 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4303);
    float _4321 = exp2(_4301);
    float _4323 = fma(_4246, -0.5, _4305);
    float _4325 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4319);
    out.m_47.x = _4317;
    float _4327 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4325);
    float _4329 = _4242 + _4220;
    float _4331 = _4327 + _4220;
    float _4333 = _4329 * 0.5;
    out.gl_Position.x = _4242;
    out.gl_Position.y = _4246;
    out.gl_Position.z = _4327;
    out.gl_Position.w = _4220;
    float _4335 = _4331 * 0.5;
    float _4337 = -_4321;
    float _4339 = _4337 + 1.0;
    float _4341 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4333;
    out.m_81.y = _4323;
    out.m_81.z = _4335;
    out.m_81.w = _4220;
    float _4343 = _4341 * _4274;
    float _4345 = -_4341;
    float _4347 = _4345 + 1.0;
    float _4349 = _4285 * _4343;
    float _4351 = _4285 * _4347;
    float _4353 = _4299 * _4343;
    float _4355 = fma(_4295, _4349, _4279);
    float _4357 = fma(_4297, _4349, _4281);
    float _4359 = fma(_4285, _4353, _4283);
    out.m_83.x = _4355;
    out.m_83.y = _4357;
    out.m_83.z = _4359;
    out.m_83.w = _4351;
    if (_4315)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _4361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4361;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3478 = false;
    bool _1702 = false;
    bool _1270 = false;
    bool _1172 = false;
    bool _1010 = false;
    bool _836 = false;
    bool _674 = false;
    bool _446 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4417 = as_type<float>(_116);
        out.gl_Position.z = _4417;
    }
    if (!_106)
    {
        return out;
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _158 = _156 * 5.0;
        _118 = as_type<int>(_158);
    }
    int _160 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4489 = as_type<float>(_160);
        out.gl_Position.z = _4489;
    }
    if (_146)
    {
        return out;
    }
    float _162 = in.m_53.w;
    float _164 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _164;
    if (!_174)
    {
        float _190 = _164 * _164;
        float _192 = _190 * 0.5;
        _150 = _192;
    }
    float _194 = _150;
    float _196 = _194;
    if (!_174)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_174;
    float _204 = _200;
    float _206 = 0.0;
    if (!_202)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _236;
        _206 = _220;
        _152 = _226;
    }
    float _238 = _204;
    float _240 = _206;
    float _242 = _152;
    bool _244 = !_174;
    float _246 = _242;
    float _248 = _240;
    float _250 = _238;
    if (!_244)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _164 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _188 = _270;
        _246 = _258;
    }
    float _272 = _188;
    float _274 = _246;
    float _276 = _274;
    if (!_174)
    {
        float _278 = _128 * _128;
        float _280 = _278 * 0.5;
        _248 = _280;
    }
    float _282 = _248;
    float _284 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        _276 = _128;
    }
    float _290 = _276;
    float _292 = fma(_272, _176, _284);
    float _294 = fma(_272, _178, _286);
    float _296 = _290;
    if (!_174)
    {
        float _298 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _298;
    }
    float _300 = _250;
    bool _302 = !_174;
    float _304 = _300;
    if (!_302)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _128 * _308;
        float _318 = 1.0 / _312;
        float _320 = _314 * 0.693147182464599609375;
        float _322 = exp2(_316);
        float _324 = 1.0 / _320;
        float _326 = _322 + (-1.0);
        float _328 = -_326;
        float _330 = fma(_328, _324, _128);
        float _332 = _330 * _318;
        float _334 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _334;
    }
    float _336 = _304;
    bool _338 = !_174;
    if (!_338)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = 1.0 / _346;
        float _350 = _128 * _342;
        float _352 = exp2(_350);
        float _354 = -_352;
        float _356 = _354 + 1.0;
        float _358 = _356 * _348;
        _296 = _358;
    }
    float _360 = _296;
    float _362 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_272, _180, _288);
    float _370 = fma(_360, _178, _362);
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = fma(_360, _176, _364);
    float _376 = fma(_360, _180, _366);
    float _378 = -_370;
    float _380 = _294 + _378;
    float _382 = fma(_294, _162, _184);
    float _384 = -_374;
    float _386 = _292 + _384;
    float _388 = fma(_292, _162, _182);
    float _390 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _396 = -_376;
    float _398 = _368 + _396;
    float _400 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _402 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _394);
    float _406 = fma(_368, _162, _186);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _402);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _414 = !_372;
    float _416 = _408;
    float _418 = _410;
    float _420 = _408;
    float _422 = _412;
    float _424 = _374;
    float _426 = _408;
    float _444;
    if (!_414)
    {
        float _428 = in.m_55.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        _444 = _140;
    }
    _446 = false;
    float _448 = _444;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _452 = _448 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _456 = _448 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _472 = _448 + _470;
    float _474 = 1.0 / _460;
    bool _476 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_448);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    bool _488 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _490 = 1.0 / _464;
    float _492 = 1.0 / _468;
    float _494 = _456 * _474;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _500;
    float _504 = _452 * _490;
    bool _506 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _508 = isnan(_448);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _518;
    float _522 = fma(_498, _494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _528 = -_516;
    float _530 = _528 + 1.0;
    float _532 = fma(_520, _494, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _534 = _472 * _492;
    bool _536 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_448);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_502, _494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _550 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _552 = isnan(_448);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = _486 * _530;
    float _564 = -_486;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = _546 * _566;
    float _582 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _584 = fma(_526, _504, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _586 = fma(_574, _504, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _588 = _560 * _578;
    float _590 = in.m_53.x;
    float _592 = in.m_53.y;
    float _594 = in.m_53.z;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = _522 * _588;
    float _602 = _548 * _588;
    float _604 = _532 * _588;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _606;
    float _610 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].x, _600);
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _618;
    float _622 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].z, _604);
    float _624 = fma(_608, _534, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _626 = fma(_616, _534, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _628 = fma(_620, _534, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _630 = fma(_582, _580, _610);
    float _632 = fma(_584, _580, _612);
    float _634 = fma(_586, _580, _622);
    float _636 = fma(_624, _562, _630);
    float _638 = fma(_626, _562, _632);
    float _640 = fma(_628, _562, _634);
    float _642 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].x, _636);
    float _644 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].y, _638);
    float _646 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].z, _640);
    float _648 = _642 * _590;
    float _650 = _644 * _592;
    float _652 = _646 * _594;
    bool _654 = !_488;
    float _672;
    if (!_654)
    {
        float _656 = in.m_55.x;
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _660 = _656 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _664 = _662 * _658;
        float _666 = floor(_664);
        float _668 = -_666;
        float _670 = _664 + _668;
        _672 = _670;
        _674 = true;
    }
    else
    {
        _672 = _140;
    }
    _674 = false;
    float _676 = _672;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _676 + _678;
    bool _682 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_676);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _676 + _694;
    bool _698 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _700 = isnan(_676);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _718 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _720 = isnan(_676);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_692;
    float _732 = _730 + 1.0;
    float _734 = 1.0 / _712;
    float _736 = _728 * _732;
    float _738 = -_728;
    float _740 = _738 + 1.0;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _742;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _748 = 1.0 / _716;
    float _750 = _708 * _740;
    float _752 = -_708;
    float _754 = _752 + 1.0;
    float _756 = _680 * _734;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _762;
    float _766 = fma(_744, _756, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = fma(_760, _756, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _770 = fma(_764, _756, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = _696 * _748;
    float _774 = _766 * _750;
    float _776 = _768 * _750;
    float _778 = _770 * _750;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _792 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _794 = fma(_782, _772, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = fma(_786, _772, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = fma(_790, _772, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _800 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].y, _776);
    float _802 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _804 = fma(_794, _736, _792);
    float _806 = fma(_796, _736, _800);
    float _808 = fma(_798, _736, _802);
    float _810 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].x, _804);
    float _812 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].y, _806);
    float _814 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].z, _808);
    bool _816 = !_746;
    float _834;
    if (!_816)
    {
        float _818 = in.m_55.x;
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _822 = _818 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _826 = _824 * _820;
        float _828 = floor(_826);
        float _830 = -_828;
        float _832 = _826 + _830;
        _834 = _832;
        _836 = true;
    }
    else
    {
        _834 = _140;
    }
    _836 = false;
    float _838 = _834;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _838 + _840;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _852 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _868 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_838);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = 1.0 / _846;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _882;
    float _886 = -_862;
    float _888 = _886 + 1.0;
    bool _890 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _892 = isnan(_838);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = 1.0 / _850;
    float _906 = 1.0 / _866;
    float _908 = _884 * _880;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _914 = _878 * _888;
    float _916 = -_878;
    float _918 = _916 + 1.0;
    float _920 = fma(_908, _842, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _922;
    float _926 = _900 * _918;
    float _928 = _912 * _904;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _932 = _838 + _930;
    bool _934 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _936 = isnan(_838);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = _920 * _926;
    float _948 = -_900;
    float _950 = _948 + 1.0;
    float _952 = fma(_928, _932, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _956 = _838 + _954;
    float _958 = _924 * _906;
    float _960 = -_944;
    float _962 = _960 + 1.0;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _946);
    float _966 = _814 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _968 = fma(_958, _956, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _970 = _862 * _962;
    float _972 = fma(_952, _914, _964);
    float _974 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _976 = _812 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_968, _970, _972);
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[118].x, _980);
    float _988 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _982;
    out.m_57.y = _984;
    out.m_57.z = _978;
    out.m_57.w = _988;
    bool _990 = !_902;
    float _1008;
    if (!_990)
    {
        float _992 = in.m_55.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        _1008 = _140;
    }
    _1010 = false;
    float _1012 = _1008;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = _1012 + _1014;
    bool _1018 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1020 = isnan(_1012);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1032 = _1012 + _1030;
    bool _1034 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1036 = isnan(_1012);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1056 = isnan(_1012);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -_1028;
    float _1068 = _1066 + 1.0;
    float _1070 = 1.0 / _1048;
    float _1072 = _1064 * _1068;
    float _1074 = -_1064;
    float _1076 = _1074 + 1.0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1078;
    bool _1082 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1084 = 1.0 / _1052;
    float _1086 = _1044 * _1076;
    float _1088 = -_1044;
    float _1090 = _1088 + 1.0;
    float _1092 = _1016 * _1070;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1098;
    float _1102 = fma(_1080, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1104 = fma(_1096, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1106 = fma(_1100, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1108 = _1032 * _1084;
    float _1110 = _1102 * _1086;
    float _1112 = _1104 * _1086;
    float _1114 = _1106 * _1086;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1110);
    float _1130 = fma(_1118, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1132 = fma(_1122, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1134 = fma(_1126, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1136 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1112);
    float _1138 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1114);
    float _1140 = fma(_1130, _1072, _1128);
    float _1142 = fma(_1132, _1072, _1136);
    float _1144 = fma(_1134, _1072, _1138);
    float _1146 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1140);
    float _1148 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1142);
    float _1150 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1144);
    bool _1152 = !_1082;
    float _1170;
    if (!_1152)
    {
        float _1154 = in.m_55.x;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1158 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1162 = _1160 * _1156;
        float _1164 = floor(_1162);
        float _1166 = -_1164;
        float _1168 = _1162 + _1166;
        _1170 = _1168;
        _1172 = true;
    }
    else
    {
        _1170 = _140;
    }
    _1172 = false;
    float _1174 = _1170;
    float _1176 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1180 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1182 = isnan(_1174);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1196 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1198 = isnan(_1174);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1204);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1214 = _1174 + _1212;
    float _1216 = -_1190;
    float _1218 = _1216 + 1.0;
    float _1220 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1222 = 1.0 / _1194;
    float _1224 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1206 * _1218;
    float _1228 = -_1206;
    float _1230 = _1228 + 1.0;
    float _1232 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1238 = _1210 * _1222;
    float _1240 = fma(_1238, _1214, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1242 = _1240 * _1226;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1242);
    float _1246 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1244);
    float _1248 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1224;
    out.m_59.y = _1232;
    out.m_59.z = _1234;
    out.m_59.w = _1248;
    bool _1250 = !_1236;
    float _1268;
    if (!_1250)
    {
        float _1252 = in.m_55.x;
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1256 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _1260 = _1258 * _1254;
        float _1262 = floor(_1260);
        float _1264 = -_1262;
        float _1266 = _1260 + _1264;
        _1268 = _1266;
        _1270 = true;
    }
    else
    {
        _1268 = _140;
    }
    _1270 = false;
    float _1272 = _1268;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1276 = _1272 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = _1272 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1298 = 1.0 / _1284;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1310 = _1272 + _1308;
    float _1312 = 1.0 / _1292;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1322 = 1.0 / _1288;
    bool _1324 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1326 = isnan(_1272);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1336;
    bool _1340 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1342 = isnan(_1272);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -_1334;
    float _1354 = _1352 + 1.0;
    float _1356 = 1.0 / _1302;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1364 = _1272 + _1362;
    float _1366 = _1276 * _1312;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1368;
    float _1372 = _1364 * _1298;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1376 = _1272 + _1374;
    float _1378 = 1.0 / _1296;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1380;
    float _1384 = fma(_1316, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1386 = _1376 * _1322;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1390 = _1272 + _1388;
    float _1392 = fma(_1382, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1398 = fma(_1320, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1400 = 1.0 / _1360;
    float _1402 = _1280 * _1356;
    bool _1404 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1406 = isnan(_1272);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1396, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1420 = _1272 + _1418;
    float _1422 = 1.0 / _1306;
    float _1424 = _1310 * _1378;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _1434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1436 = fma(_1428, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1438 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1440 = isnan(_1272);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = _1390 * _1400;
    bool _1452 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1454 = isnan(_1272);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1414 * _1354;
    float _1466 = -_1414;
    float _1468 = _1466 + 1.0;
    float _1470 = fma(_1432, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1472 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1474 = isnan(_1272);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = -_1448;
    float _1486 = _1484 + 1.0;
    float _1488 = _1462 * _1468;
    float _1490 = -_1462;
    float _1492 = _1490 + 1.0;
    bool _1494 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1496 = isnan(_1272);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = _1420 * _1422;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1508;
    float _1512 = _1448 * _1492;
    float _1514 = _1482 * _1486;
    float _1516 = -_1482;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1504;
    float _1522 = _1520 + 1.0;
    float _1524 = fma(_1338, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1530 = _1504 * _1518;
    float _1532 = fma(_1510, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1534 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1536 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1538 = isnan(_1272);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = _1350 * _1522;
    float _1550 = -_1350;
    float _1552 = _1550 + 1.0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1562 = _1546 * _1552;
    float _1564 = -_1546;
    float _1566 = _1564 + 1.0;
    float _1568 = fma(_1556, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1570 = fma(_1560, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1572 = _1392 * _1562;
    float _1574 = _1436 * _1562;
    float _1576 = _1384 * _1562;
    float _1578 = fma(_1528, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1580 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1572);
    float _1582 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1574);
    float _1584 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1576);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1586;
    float _1590 = fma(_1416, _1548, _1580);
    float _1592 = fma(_1470, _1548, _1582);
    float _1594 = fma(_1398, _1548, _1584);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1596;
    float _1600 = fma(_1532, _1530, _1590);
    float _1602 = fma(_1524, _1530, _1592);
    float _1604 = fma(_1534, _1530, _1594);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1606;
    float _1610 = fma(_1570, _1514, _1600);
    float _1612 = fma(_1568, _1514, _1602);
    float _1614 = fma(_1578, _1514, _1604);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1620 = fma(_1588, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1622 = fma(_1598, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1628 = fma(_1608, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1634 = fma(_1618, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1636 = fma(_1626, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1638 = fma(_1620, _1512, _1610);
    float _1640 = fma(_1622, _1512, _1612);
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1646;
    float _1650 = fma(_1632, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1652;
    float _1656 = fma(_1628, _1512, _1614);
    float _1658 = fma(_1644, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1660 = fma(_1648, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1662 = fma(_1634, _1488, _1638);
    float _1664 = fma(_1636, _1488, _1640);
    float _1666 = fma(_1654, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1668 = fma(_1650, _1488, _1656);
    float _1670 = fma(_1658, _1464, _1662);
    float _1672 = fma(_1660, _1464, _1664);
    float _1674 = fma(_1666, _1464, _1668);
    float _1676 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1670);
    float _1678 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1672);
    float _1680 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1674);
    out.m_61.x = _1676;
    out.m_61.y = _1678;
    out.m_61.z = _1680;
    bool _1682 = !_1434;
    float _1700;
    if (!_1682)
    {
        float _1684 = in.m_55.x;
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1688 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1692 = _1690 * _1686;
        float _1694 = floor(_1692);
        float _1696 = -_1694;
        float _1698 = _1692 + _1696;
        _1700 = _1698;
        _1702 = true;
    }
    else
    {
        _1700 = _140;
    }
    _1702 = false;
    float _1704 = _1700;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1708 = _1704 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1712 = _1704 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1728 = _1726 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1730 = 1.0 / _1716;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1742 = _1704 + _1740;
    float _1744 = 1.0 / _1724;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1754 = 1.0 / _1720;
    bool _1756 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1758 = isnan(_1704);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1768;
    bool _1772 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1774 = isnan(_1704);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1766;
    float _1786 = _1784 + 1.0;
    float _1788 = 1.0 / _1734;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1796 = _1704 + _1794;
    float _1798 = _1708 * _1744;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1800;
    float _1804 = _1796 * _1730;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1808 = _1704 + _1806;
    float _1810 = 1.0 / _1728;
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1812;
    float _1816 = fma(_1748, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1818 = _1808 * _1754;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1822 = _1704 + _1820;
    float _1824 = fma(_1814, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1828 = _1826 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1830 = fma(_1752, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1832 = 1.0 / _1792;
    float _1834 = _1712 * _1788;
    bool _1836 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1838 = isnan(_1704);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1844 = _1840 || _1842;
    float _1846 = float(_1844);
    float _1848 = fma(_1828, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1852 = _1704 + _1850;
    float _1854 = 1.0 / _1738;
    float _1856 = _1742 * _1810;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    bool _1866 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1868 = fma(_1860, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    bool _1870 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1872 = isnan(_1704);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = _1822 * _1832;
    bool _1884 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1886 = isnan(_1704);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1846 * _1786;
    float _1898 = -_1846;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1864, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    bool _1904 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1906 = isnan(_1704);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = -_1880;
    float _1918 = _1916 + 1.0;
    float _1920 = _1894 * _1900;
    float _1922 = -_1894;
    float _1924 = _1922 + 1.0;
    bool _1926 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1928 = isnan(_1704);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = _1852 * _1854;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1940;
    float _1944 = _1880 * _1924;
    float _1946 = _1914 * _1918;
    float _1948 = -_1914;
    float _1950 = _1948 + 1.0;
    float _1952 = -_1936;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1770, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1962 = _1936 * _1950;
    float _1964 = fma(_1942, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1966 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    bool _1968 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1970 = isnan(_1704);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = _1782 * _1954;
    float _1982 = -_1782;
    float _1984 = _1982 + 1.0;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1992 = _1990 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1994 = _1978 * _1984;
    float _1996 = -_1978;
    float _1998 = _1996 + 1.0;
    float _2000 = fma(_1988, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2002 = fma(_1992, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2004 = _1824 * _1994;
    float _2006 = _1868 * _1994;
    float _2008 = _1816 * _1994;
    float _2010 = fma(_1960, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2004);
    float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2006);
    float _2016 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2008);
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2018;
    float _2022 = fma(_1848, _1980, _2012);
    float _2024 = fma(_1902, _1980, _2014);
    float _2026 = fma(_1830, _1980, _2016);
    float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2028;
    float _2032 = fma(_1964, _1962, _2022);
    float _2034 = fma(_1956, _1962, _2024);
    float _2036 = fma(_1966, _1962, _2026);
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2038;
    float _2042 = fma(_2002, _1946, _2032);
    float _2044 = fma(_2000, _1946, _2034);
    float _2046 = fma(_2010, _1946, _2036);
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2052 = fma(_2020, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2054 = fma(_2030, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2060 = fma(_2040, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2066 = fma(_2050, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2068 = fma(_2058, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2070 = fma(_2052, _1944, _2042);
    float _2072 = fma(_2054, _1944, _2044);
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2078;
    float _2082 = fma(_2064, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2084;
    float _2088 = fma(_2060, _1944, _2046);
    float _2090 = fma(_2076, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2092 = fma(_2080, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2094 = fma(_2066, _1920, _2070);
    float _2096 = fma(_2068, _1920, _2072);
    float _2098 = fma(_2086, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2100 = fma(_2082, _1920, _2088);
    float _2102 = fma(_2090, _1896, _2094);
    float _2104 = fma(_2092, _1896, _2096);
    float _2106 = fma(_2098, _1896, _2100);
    float _2108 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2102);
    float _2110 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2104);
    float _2112 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2106);
    out.m_63.x = _2108;
    out.m_63.y = _2110;
    out.m_63.z = _2112;
    bool _2114 = !_1866;
    float _2116 = _2076;
    float _2118 = _2068;
    int _2120 = as_type<int>(_2046);
    int _2122 = as_type<int>(_2090);
    float _2124 = _2044;
    float _2126 = _1920;
    float _2128 = _2058;
    if (!_2114)
    {
        float _2130 = in.m_55.x;
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2134 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _2138 = _2136 * _2132;
        float _2140 = floor(_2138);
        float _2142 = -_2140;
        float _2144 = _2138 + _2142;
        _154 = _2144;
    }
    float _2146 = _154;
    float _2148 = in.m_55.y;
    int _2150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2152 = _2150 != 0;
    float _2154 = in.m_65.x;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2158 = _2156 != 0;
    int _2160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2162 = _2160 != 0;
    float _2164 = _2064;
    float _2166 = _2154;
    if (_2152)
    {
        float _2168 = in.m_55.x;
        _2164 = _2168;
    }
    float _2170 = _2164;
    int _2172 = 0;
    if (_2152)
    {
        _2172 = 0;
    }
    int _2174 = _2172;
    float _2176 = _2032;
    int _2178 = _2174;
    if (_2152)
    {
        float _2180 = in.m_55.z;
        _2176 = _2180;
    }
    float _2182 = _2176;
    float _2184 = _2082;
    if (_2158)
    {
        float _2186 = in.m_55.x;
        _2184 = _2186;
    }
    float _2188 = _2184;
    float _2190 = _2148 * 2.0;
    int _2192 = as_type<int>(_2190);
    if (_2152)
    {
        _2116 = _2148;
    }
    float _2194 = _2116;
    float _2196 = _2112;
    float _2198 = _2194;
    if (_2162)
    {
        float _2200 = in.m_55.z;
        _2196 = _2200;
    }
    float _2202 = _2196;
    float _2204 = floor(_2190);
    float _2206 = _2170;
    if (_2152)
    {
        _2118 = _2170;
    }
    float _2208 = _2118;
    float _2210 = _2182;
    float _2212 = _2208;
    if (_2152)
    {
        _2120 = as_type<int>(_2182);
    }
    int _2214 = _2120;
    int _2216 = _2214;
    float _2218 = _2188;
    if (!_2152)
    {
        float _2220 = in.m_55.x;
        float _2222 = _2148 * 3.1415927410125732421875;
        float _2224 = in.m_55.z;
        float _2226 = _2222 * 0.15915493667125701904296875;
        float _2228 = _2226 * 6.283185482025146484375;
        float _2230 = sin(_2228);
        float _2232 = _2220 * 3.1415927410125732421875;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2224 * 3.1415927410125732421875;
        float _2238 = _2236 * 0.15915493667125701904296875;
        float _2240 = _2234 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2210 = _2224;
        _2206 = _2220;
        _2192 = as_type<int>(_2238);
        _2178 = 1;
        _2212 = _2242;
        _2198 = _2230;
        _2216 = as_type<int>(_2246);
    }
    float _2248 = _2210;
    float _2250 = _2206;
    int _2252 = _2192;
    int _2254 = _2178;
    float _2256 = _2212;
    float _2258 = _2198;
    int _2260 = _2216;
    float _2262 = _2248 * 2.0;
    bool _2264 = false;
    int _2266 = _2252;
    if (_2162)
    {
        bool _2268 = _2202 > 0.5;
        _2264 = _2268;
    }
    bool _2270 = _2264;
    float _2272 = _2250 * 2.0;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2276 = _2274 != 0;
    if (_2158)
    {
        float _2278 = -_2154;
        float _2280 = _2278 + 1.0;
        _2266 = as_type<int>(_2280);
    }
    int _2282 = _2266;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2286 = _2284 != 0;
    float _2288 = floor(_2262);
    bool _2290 = false;
    int _2292 = _2282;
    if (_2158)
    {
        bool _2294 = _2188 > 0.5;
        _2290 = _2294;
    }
    bool _2296 = _2290;
    if (_2162)
    {
        float _2298 = -_2154;
        float _2300 = _2298 + 1.0;
        _2122 = as_type<int>(_2300);
    }
    int _2302 = _2122;
    float _2304 = in.m_65.y;
    int _2306 = _2302;
    if (!_2158)
    {
        _2124 = _2154;
    }
    float _2308 = _2124;
    float _2310 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2312 = _2308;
    if (!_2162)
    {
        _2218 = _2154;
    }
    float _2314 = _2218;
    float _2316 = in.m_55.w;
    float _2318 = floor(_2272);
    float _2320 = _2314;
    if (_2158)
    {
        float _2322 = _2296 ? as_type<float>(_2282) : _2154;
        _2312 = _2322;
    }
    float _2324 = _2312;
    if (_2276)
    {
        float _2326 = -_2154;
        float _2328 = _2326 + 1.0;
        _2292 = as_type<int>(_2328);
    }
    int _2330 = _2292;
    int _2332 = _2330;
    if (_2162)
    {
        float _2334 = _2270 ? as_type<float>(_2302) : _2154;
        _2320 = _2334;
    }
    float _2336 = _2320;
    if (_2286)
    {
        float _2338 = -_2154;
        float _2340 = _2338 + 1.0;
        _2306 = as_type<int>(_2340);
    }
    int _2342 = _2306;
    bool _2344 = _2148 > 0.5;
    float _2346 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2310);
    if (!_2276)
    {
        _2126 = _2154;
    }
    float _2348 = _2126;
    float _2350 = _2348;
    if (!_2286)
    {
        _2128 = _2154;
    }
    float _2352 = _2128;
    float _2354 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2346);
    float _2356 = _2352;
    if (_2276)
    {
        float _2358 = _2344 ? as_type<float>(_2330) : _2154;
        _2350 = _2358;
    }
    float _2360 = _2350;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2364 = _2362 != 0;
    float _2366 = _2354 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2286)
    {
        float _2368 = _2344 ? as_type<float>(_2342) : _2154;
        _2356 = _2368;
    }
    float _2370 = _2356;
    bool _2372 = _2288 >= 0.0;
    bool _2374 = isnan(_2288);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(0.0);
    bool _2380 = _2376 || _2378;
    bool _2382 = _2204 > 0.0;
    float _2384 = -_2304;
    float _2386 = _2384 + 1.0;
    bool _2388 = _2318 >= 0.0;
    bool _2390 = isnan(_2318);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan(0.0);
    bool _2396 = _2392 || _2394;
    bool _2398 = _2204 >= 0.0;
    bool _2400 = isnan(_2204);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(0.0);
    bool _2406 = _2402 || _2404;
    int _2408 = _2380 ? 0 : 1;
    if (_2364)
    {
        float _2410 = -_2154;
        float _2412 = _2410 + 1.0;
        _2332 = as_type<int>(_2412);
    }
    int _2414 = _2332;
    bool _2416 = _2288 > 0.0;
    int _2418 = _2396 ? 0 : 1;
    bool _2420 = _2318 > 0.0;
    int _2422 = _2406 ? 0 : 1;
    int _2424 = ~_2408;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    int _2436 = _2434;
    int _2438 = _2428;
    if (!_2382)
    {
        int _2440 = ~_2422;
        int _2442 = _2440 + 1;
        _2436 = _2442;
    }
    int _2444 = _2436;
    bool _2446 = _2248 > 0.5;
    if (_2364)
    {
        float _2448 = _2344 ? as_type<float>(_2414) : _2154;
        _2166 = _2448;
    }
    float _2450 = _2166;
    if (!_2416)
    {
        int _2452 = ~_2408;
        int _2454 = _2452 + 1;
        _2438 = _2454;
    }
    int _2456 = _2438;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2460 = _2458 != 0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2464 = _2462 != 0;
    int _2466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2468 = _2466 != 0;
    int _2470 = _2446 ? as_type<int>(_2386) : as_type<int>(_2304);
    int _2472 = ~_2418;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    int _2478 = _2476;
    if (!_2420)
    {
        int _2480 = ~_2418;
        int _2482 = _2480 + 1;
        _2478 = _2482;
    }
    int _2484 = _2478;
    float _2486 = _2468 ? as_type<float>(_2470) : _2304;
    int _2488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2490 = _2488 != 0;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2494 = _2492 != 0;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2498 = _2496 != 0;
    float _2500 = in.m_67.x;
    float _2502 = in.m_67.y;
    float _2504 = in.m_67.z;
    bool _2506 = !_2490;
    int _2508 = _2506 ? 0 : 1;
    float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2514 = !_2494;
    int _2516 = _2514 ? 0 : 1;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2528 = _2526 != 0;
    float _2530 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2532 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2534 = 1.0 / _2512;
    float _2536 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2532);
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2546 = 1.0 / _2520;
    int _2548 = _2344 ? as_type<int>(_2386) : as_type<int>(_2304);
    float _2550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2504);
    bool _2552 = _2316 > 0.5;
    float _2554 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2530);
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2558 = _2556 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2560 = 1.0 / _2540;
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2564 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2566 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2554);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2576 = fma(_2564, -2.0, _2562);
    float _2578 = 1.0 / _2544;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2580;
    float _2584 = _2574 * _2534;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2586;
    float _2590 = _2582 * _2546;
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2594 = _2592 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2596 = 1.0 / _2558;
    float _2598 = _2588 * _2560;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2608 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2536);
    float _2610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2500);
    bool _2612 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2614 = isnan(_2146);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = 1.0 / _2570;
    float _2626 = _2594 * _2578;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2502);
    bool _2632 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2634 = isnan(_2146);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2644;
    float _2648 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2650 = log2(_2648);
    float _2652 = _2602 * _2596;
    float _2654 = -_2642;
    float _2656 = _2654 + 1.0;
    float _2658 = _2460 ? as_type<float>(_2548) : _2304;
    float _2660 = _2566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2662 = _2608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2664 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _2666 = _2664 + 1.0;
    float _2668 = 1.0 / _2606;
    float _2670 = _2646 * _2624;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2674 = _2146 + _2672;
    float _2676 = _2666 * 0.2000000476837158203125;
    float _2678 = fma(_2590, _2674, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2680 = fma(_648, _2676, _648);
    float _2682 = _128 * _2650;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2688 = fma(_650, _2676, _650);
    float _2690 = fma(_652, _2676, _652);
    float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2694 = _2146 + _2692;
    bool _2696 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2698 = isnan(_2146);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = exp2(_2682);
    bool _2710 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2712 = isnan(_2146);
    bool _2714 = _2710 || _2712;
    bool _2716 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2718 = _2714 || _2716;
    float _2720 = float(_2718);
    float _2722 = _2686 * _2668;
    float _2724 = fma(_2652, _2694, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2728 = _2146 + _2726;
    bool _2730 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2732 = isnan(_2146);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = -_2706;
    float _2744 = _2742 + 1.0;
    float _2746 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2748 = fma(_2584, _2728, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2750 = -_2720;
    float _2752 = _2750 + 1.0;
    float _2754 = _2740 * _2744;
    float _2756 = precise::min(_2746, 1.5);
    float _2758 = -_2740;
    float _2760 = _2758 + 1.0;
    float _2762 = _2706 * _2752;
    bool _2764 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2766 = isnan(_2146);
    bool _2768 = _2764 || _2766;
    bool _2770 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2772 = _2768 || _2770;
    float _2774 = float(_2772);
    float _2776 = -_2708;
    float _2778 = _2776 + 1.0;
    float _2780 = fma(_2756, _2628, 1.0);
    float _2782 = _2622 * _2760;
    bool _2784 = !_2498;
    int _2786 = _2784 ? 0 : 1;
    float _2788 = -_2622;
    float _2790 = _2788 + 1.0;
    bool _2792 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2794 = isnan(0.0);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2800 = _2796 || _2798;
    float _2802 = -_2774;
    float _2804 = _2802 + 1.0;
    bool _2806 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2808 = isnan(_2146);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = _2774 * _2790;
    float _2820 = _2800 ? _2778 : 0.0;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2824 = 1.0 + _2822;
    float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2828 = _2146 + _2826;
    float _2830 = _2816 * _2804;
    float _2832 = -_2816;
    float _2834 = _2832 + 1.0;
    bool _2836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2838 = isnan(1.0);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2844 = _2840 || _2842;
    float _2846 = fma(_2626, _2828, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2848 = 1.0 / _2824;
    float _2850 = _2642 * _2834;
    float _2852 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2854 = _2146 + _2852;
    bool _2856 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2858 = isnan(_2146);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2870 = _2146 + _2868;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2874 = _2146 + _2872;
    float _2876 = fma(_2670, _2854, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2878 = _2680 * _2780;
    float _2880 = _2688 * _2780;
    float _2882 = _2690 * _2780;
    int _2884 = abs(_2508);
    float _2886 = _2866 * _2656;
    float _2888 = -_2866;
    float _2890 = _2888 + 1.0;
    int _2892 = abs(_2786);
    float _2894 = fma(_2598, _2870, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2896 = _2678 * _2886;
    float _2898 = _2820 * _2848;
    float _2900 = _2878 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2902 = _2880 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2904 = float(_2456);
    float _2906 = fma(_2890, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2896);
    bool _2908 = !_2844;
    float _2910 = _2908 ? _128 : _2898;
    float _2912 = _2902 * _2630;
    bool _2914 = _2254 != 1;
    float _2916 = _2900 * _2610;
    int _2918 = abs(_2516);
    float _2920 = in.m_69.x;
    float _2922 = in.m_69.y;
    float _2924 = in.m_69.z;
    float _2926 = float(_2884);
    float _2928 = _2148 + _2248;
    float _2930 = _2148 + _2250;
    float _2932 = _2928 + (-1.0);
    float _2934 = float(_2484);
    float _2936 = _2926 * _2904;
    float _2938 = float(_2918);
    float _2940 = _2930 + (-1.0);
    float _2942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2944 = float(_2444);
    float _2946 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2948 = float(_2892);
    float _2950 = _2936 * (-2.0);
    float _2952 = _2938 * _2934;
    float _2954 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2956 = _2948 * _2944;
    float _2958 = _2250 + (-0.5);
    float _2960 = _2952 * (-2.0);
    float _2962 = fma(_2954, _2950, _2954);
    float _2964 = fma(_2950, _2920, _2920);
    float _2966 = _2148 + (-0.5);
    float _2968 = fma(_2960, _2922, _2922);
    float _2970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2972 = fma(_2958, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2964);
    float _2974 = fma(_2946, _2960, _2946);
    float _2976 = _2250 + _2248;
    float _2978 = fma(_2148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2970);
    float _2980 = fma(_2910, _2962, _2972);
    float _2982 = _2882 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2984 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2968);
    float _2986 = _2980 * 0.15915493667125701904296875;
    float _2988 = _2976 + (-1.0);
    float _2990 = _2956 * (-2.0);
    float _2992 = _2982 * _2550;
    float _2994 = fma(_2910, _2974, _2984);
    float _2996 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2998 = fma(_2990, _2924, _2924);
    float _3000 = _2248 + (-0.5);
    float _3002 = fma(_2996, _2990, _2996);
    float _3004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3006 = fma(_3000, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2998);
    float _3008 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3012 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3004);
    float _3014 = fma(_2910, _3002, _3006);
    float _3016 = _2250 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3020 = fma(_3008, _2324, -0.5);
    float _3022 = _3014 * 0.15915493667125701904296875;
    float _3024 = _2994 * 0.15915493667125701904296875;
    float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3028 = fma(_2748, _2850, _2906);
    float _3030 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3034 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3036 = _2986 * 6.283185482025146484375;
    float _3038 = sin(_3036);
    float _3040 = _3010 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3042 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3044 = -_3032;
    float _3046 = fma(_3030, 2.0, _3044);
    float _3048 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3050 = fma(_3040, _2370, -0.5);
    float _3052 = fma(_3034, -2.0, _3042);
    float _3054 = _2986 * 6.283185482025146484375;
    float _3056 = cos(_3054);
    float _3058 = _3026 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3060 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[93].z, _3048);
    float _3062 = fma(_2724, _2830, _3028);
    bool _3064 = !_2914;
    float _3066 = _3064 ? _2258 : _2256;
    float _3068 = fma(_3058, _2450, -0.5);
    bool _3070 = !_2914;
    float _3072 = _3070 ? as_type<float>(_2260) : _2258;
    float _3074 = fma(_2846, _2818, _3062);
    float _3076 = _3024 * 6.283185482025146484375;
    float _3078 = sin(_3076);
    float _3080 = -_3018;
    float _3082 = fma(_3016, 2.0, _3080);
    float _3084 = -_128;
    float _3086 = fma(_3084, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3046);
    float _3088 = fma(_2894, _2782, _3074);
    float _3090 = fma(_2722, _2874, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3092 = _3022 * 6.283185482025146484375;
    float _3094 = cos(_3092);
    float _3096 = _3024 * 6.283185482025146484375;
    float _3098 = cos(_3096);
    float _3100 = _3038 * _3078;
    float _3102 = _3056 * _3078;
    float _3104 = _3022 * 6.283185482025146484375;
    float _3106 = sin(_3104);
    float _3108 = _3094 * _2912;
    float _3110 = _3078 * _3094;
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3114 = _3056 * _3108;
    float _3116 = fma(_2258, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3112);
    float _3118 = _3056 * _3098;
    float _3120 = _3098 * _3094;
    float _3122 = _3038 * _3098;
    float _3124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3126 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3060);
    float _3128 = fma(_3106, _3118, _3100);
    float _3130 = -_2912;
    float _3132 = _3106 * _3130;
    float _3134 = -_3102;
    float _3136 = fma(_3106, _3122, _3134);
    float _3138 = -_3122;
    float _3140 = fma(_3106, _3102, _3138);
    float _3142 = fma(_3128, _2916, _3114);
    float _3144 = fma(_3120, _2916, _3132);
    float _3146 = fma(_3106, _3100, _3118);
    float _3148 = _3038 * _3108;
    float _3150 = fma(_3140, _2992, _3142);
    float _3152 = fma(_3110, _2992, _3144);
    float _3154 = _2524 ? as_type<float>(_2470) : _2304;
    float _3156 = fma(_3136, _2916, _3148);
    float _3158 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3160 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3162 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3164 = fma(_3146, _2992, _3156);
    float _3166 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3158);
    float _3168 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3160);
    float _3170 = fma(_3162, _2658, -0.5);
    int _3172 = _2552 ? as_type<int>(_2386) : as_type<int>(_2304);
    float _3174 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3166);
    float _3176 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3168);
    float _3178 = _2528 ? as_type<float>(_2470) : _2304;
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3182 = _3174 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3184 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3186 = _2464 ? as_type<float>(_3172) : _2304;
    float _3188 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2978);
    float _3190 = _2660 + _3182;
    float _3192 = _2662 + _3184;
    float _3194 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3012);
    float _3196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3200 = _3190 + _3198;
    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3204 = _3192 + _3202;
    float _3206 = -_128;
    float _3208 = fma(_3206, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3082);
    float _3210 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2576);
    float _3212 = _3200 * _3200;
    float _3214 = _3204 * _3204;
    float _3216 = fma(_3194, _3020, _3208);
    float _3218 = -_3210;
    float _3220 = fma(_3188, _3170, _3218);
    float _3222 = _3212 + _3214;
    float _3224 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3226 = fma(_3126, _3050, _3086);
    float _3228 = sqrt(_3222);
    float _3230 = fma(_3224, _3154, -0.5);
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3234 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3236 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3240 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3234);
    float _3242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3244 = fma(_3236, _3178, -0.5);
    float _3246 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3238);
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3250 = _3066 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3252 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3240);
    float _3254 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3256 = fma(_3072, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3248);
    bool _3258 = _3228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3262 = -_3232;
    float _3264 = fma(_3250, 2.0, _3262);
    float _3266 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3116);
    float _3268 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3270 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3052);
    float _3272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3274 = _2366 + _3268;
    float _3276 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3278 = -_3270;
    float _3280 = fma(_3266, _3230, _3278);
    float _3282 = _3074;
    float _3284 = _3214;
    float _3286 = _3212;
    float _3288 = _3190;
    float _3290 = _3192;
    if (!_3258)
    {
        _3282 = _3214;
    }
    float _3292 = _3282;
    float _3294 = _3292;
    if (!_3258)
    {
        _3284 = _3212;
    }
    float _3296 = _3284;
    float _3298 = fma(_3254, -2.0, _3276);
    float _3300 = _3296;
    if (!_3258)
    {
        _3286 = _3274;
    }
    float _3302 = _3286;
    bool _3304 = !_3258;
    float _3306 = _3302;
    if (!_3304)
    {
        float _3308 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3312 = _3228 + _3310;
        float _3314 = rsqrt(_3222);
        float _3316 = _3312 * _3308;
        float _3318 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3320 = _3316 * 0.15915493667125701904296875;
        float _3322 = _3320 * 6.283185482025146484375;
        float _3324 = sin(_3322);
        float _3326 = _3320 * 6.283185482025146484375;
        float _3328 = cos(_3326);
        float _3330 = fma(_3324, _3318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3332 = _3314 * _3330;
        float _3334 = _3328 + (-1.0);
        float _3336 = fma(_3200, _3332, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3338 = fma(_3204, _3332, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3340 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3344 = _3336 + _3342;
        float _3346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3348 = _3338 + _3346;
        float _3350 = fma(_3274, _3328, _3340);
        float _3352 = _3344 * _3344;
        float _3354 = _3348 * _3348;
        _3306 = _3350;
        _3300 = _3352;
        _3294 = _3354;
        _3288 = _3336;
        _3290 = _3338;
    }
    float _3356 = _3306;
    float _3358 = _3300;
    float _3360 = _3294;
    float _3362 = _3288;
    float _3364 = _3290;
    float _3366 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3368 = _3356 + _3366;
    float _3370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3372 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3246);
    float _3374 = -_128;
    float _3376 = fma(_3374, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3264);
    float _3378 = fma(_3368, _3368, _3358);
    float _3380 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3256);
    float _3382 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3298);
    float _3384 = fma(_3090, _2754, _3088);
    float _3386 = _3378 + _3360;
    float _3388 = fma(_3372, _3068, _3376);
    float _3390 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3392 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3394 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3396 = _3186 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3398 = sqrt(_3386);
    float _3400 = -_3382;
    float _3402 = fma(_3380, _3244, _3400);
    float _3404 = fma(_2876, _2762, _3384);
    float _3406 = _3392 * _3370;
    float _3408 = _3394 * _3242;
    float _3410 = _3396 * _3260;
    float _3412 = _3390 * _3272;
    float _3414 = _3226 + 0.5;
    float _3416 = _3216 + 0.5;
    float _3418 = _3220 + 0.5;
    float _3420 = _3280 + 0.5;
    float _3422 = _3388 + 0.5;
    float _3424 = _3402 + 0.5;
    float _3426 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3404);
    out.m_71.x = _3416;
    out.m_71.y = _3418;
    out.m_71.z = _3408;
    out.m_71.w = _3410;
    bool _3428 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3430 = isnan(_3398);
    bool _3432 = _3428 || _3430;
    bool _3434 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3436 = _3432 || _3434;
    out.m_73.x = _3412;
    out.m_73.y = _3406;
    out.m_75.x = _3414;
    out.m_75.y = _3420;
    out.m_77.x = _3422;
    out.m_77.y = _3424;
    float _3438 = _3390;
    float _3440 = _3416;
    float _3442 = _3418;
    if (!_3436)
    {
        _3438 = 1.0;
    }
    float _3444 = _3438;
    out.m_79.x = _3426;
    bool _3446 = !_3436;
    float _3448 = _3444;
    if (!_3446)
    {
        bool _3450 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3452 = isnan(_3398);
        bool _3454 = _3450 || _3452;
        bool _3456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3458 = _3454 || _3456;
        if (!_3458)
        {
            float _3460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3462 = _3398 + _3460;
            float _3464 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3466 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3464;
            float _3468 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3470 = _3468 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3472 = 1.0 / _3466;
            float _3474 = _3462 * _3472;
            float _3476 = fma(_3474, _3470, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3448 = _3476;
            _3478 = true;
        }
        else
        {
            bool _3480 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3482 = isnan(_3398);
            bool _3484 = _3480 || _3482;
            bool _3486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3488 = _3484 || _3486;
            if (!_3488)
            {
                float _3490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3492 = _3398 + _3490;
                float _3494 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3496 = _3494 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3498 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3500 = _3498 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3502 = 1.0 / _3496;
                float _3504 = _3492 * _3502;
                float _3506 = fma(_3504, _3500, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3448 = _3506;
                _3478 = true;
            }
            else
            {
                _3448 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3478 = false;
    float _3508 = _3448;
    float _3510 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3512 = _3356 + _3510;
    float _3514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3516 = _3362 + _3514;
    float _3518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3520 = _3364 + _3518;
    float _3522 = fma(_3512, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3524 = fma(_3516, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3526 = fma(_3520, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3528 = -_2366;
    float _3530 = _3528 + _3522;
    float _3532 = -_2660;
    float _3534 = _3532 + _3524;
    float _3536 = -_2662;
    float _3538 = _3536 + _3526;
    float _3540 = _3530 * _3530;
    float _3542 = fma(_3534, _3534, _3540);
    float _3544 = fma(_3538, _3538, _3542);
    float _3546 = sqrt(_3544);
    bool _3548 = _3546 > 0.0;
    bool _3550 = !_3548;
    float _3552 = _3546;
    float _3554 = _3524;
    float _3556 = _3522;
    float _3558 = _3526;
    float _3560 = _3546;
    if (!_3550)
    {
        bool _3562 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3564 = _3408;
        if (_3562)
        {
            float _3566 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3564 = _3566;
        }
        float _3568 = _3564;
        if (_3562)
        {
            float _3570 = _408 * _3568;
            _3440 = _3570;
        }
        float _3572 = _3440;
        float _3574 = _3572;
        if (_3562)
        {
            float _3576 = _410 * _3568;
            _3442 = _3576;
        }
        float _3578 = _3442;
        float _3580 = _3578;
        if (_3562)
        {
            float _3582 = _412 * _3568;
            _3552 = _3582;
        }
        float _3584 = _3552;
        float _3586 = _3584;
        if (!_3562)
        {
            float _3588 = _128 + 1.0;
            float _3590 = _3588;
            if (!_174)
            {
                float _3592 = _3588 * _3588;
                float _3594 = _3592 * 0.5;
                _416 = _3594;
            }
            float _3596 = _416;
            float _3598 = _3596;
            if (!_174)
            {
                float _3600 = _3596 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3598 = _3600;
            }
            float _3602 = _3598;
            bool _3604 = !_174;
            float _3606 = _3602;
            if (!_3604)
            {
                float _3608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3610 = log2(_3608);
                float _3612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3614 = _3612 + 1.0;
                float _3616 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3618 = _3610 * _3588;
                float _3620 = 1.0 / _3614;
                float _3622 = _3616 * 0.693147182464599609375;
                float _3624 = exp2(_3618);
                float _3626 = 1.0 / _3622;
                float _3628 = _3624 + (-1.0);
                float _3630 = -_3628;
                float _3632 = fma(_3630, _3626, _3588);
                float _3634 = _3632 * _3620;
                float _3636 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3606 = _3636;
            }
            float _3638 = _3606;
            float _3640 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3642 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3644 = !_174;
            if (!_3644)
            {
                float _3646 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3648 = log2(_3646);
                float _3650 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3652 = _3650 + 1.0;
                float _3654 = 1.0 / _3652;
                float _3656 = _3648 * _3588;
                float _3658 = exp2(_3656);
                float _3660 = -_3658;
                float _3662 = _3660 + 1.0;
                float _3664 = _3662 * _3654;
                _3590 = _3664;
            }
            float _3666 = _3590;
            float _3668 = fma(_3666, _178, _3642);
            float _3670 = fma(_3666, _176, _3640);
            float _3672 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3674 = -_370;
            float _3676 = _3674 + _3668;
            float _3678 = -_374;
            float _3680 = _3678 + _3670;
            float _3682 = fma(_3666, _180, _3672);
            float _3684 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3686 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3688 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3690 = -_376;
            float _3692 = _3690 + _3682;
            float _3694 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3684);
            float _3696 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3686);
            float _3698 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3688);
            float _3700 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3694);
            float _3702 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3696);
            float _3704 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3698);
            _418 = _3702;
            _420 = _3700;
            _422 = _3704;
            _3574 = _3700;
            _3580 = _3702;
            _3586 = _3704;
        }
        float _3706 = _418;
        float _3708 = _420;
        float _3710 = _422;
        float _3712 = _3574;
        float _3714 = _3580;
        float _3716 = _3586;
        float _3718 = _3706 * _3706;
        float _3720 = rsqrt(_3544);
        float _3722 = fma(_3708, _3708, _3718);
        float _3724 = fma(_3710, _3710, _3722);
        float _3726 = sqrt(_3724);
        float _3728 = _3534 * _3720;
        float _3730 = _3530 * _3720;
        float _3732 = _3538 * _3720;
        bool _3734 = _3726 > 0.0;
        bool _3736 = !_3734;
        _424 = _3724;
        _426 = _3708;
        _3560 = _3716;
        if (!_3736)
        {
            float _3738 = rsqrt(_3724);
            float _3740 = _3738 * _3706;
            float _3742 = _3738 * _3708;
            float _3744 = _3738 * _3710;
            float _3746 = _3730 * _3740;
            float _3748 = fma(_3728, _3742, _3746);
            float _3750 = fma(_3732, _3744, _3748);
            float _3752 = _3750 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3754 = fma(_3712, _3752, _3524);
            float _3756 = fma(_3714, _3752, _3522);
            float _3758 = fma(_3716, _3752, _3526);
            _3554 = _3754;
            _3556 = _3756;
            _3558 = _3758;
        }
    }
    float _3760 = _3554;
    float _3762 = _3556;
    float _3764 = _3558;
    float _3766 = _424;
    float _3768 = _426;
    float _3770 = _3560;
    float _3772 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3774 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3772);
    float _3776 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3778 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan(0.5);
    bool _3786 = _3782 || _3784;
    float _3788 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3774);
    float _3790 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3776);
    float _3792 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3794 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3790);
    bool _3796 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3798 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan(0.5);
    bool _3804 = _3800 || _3802;
    float _3806 = 1.0 / _3792;
    float _3808 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3810 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3812 = _3788;
    float _3814 = _3808;
    float _3816 = _3762;
    float _3818 = _3766;
    float _3820 = _3768;
    float _3822 = _3770;
    if (_3786)
    {
        _3810 = _3760;
    }
    float _3824 = _3810;
    float _3826 = _3808 + _3792;
    float _3828 = _3824;
    if (_3786)
    {
        _3812 = _3762;
    }
    float _3830 = _3812;
    float _3832 = _3830;
    if (_3786)
    {
        _3814 = _3764;
    }
    float _3834 = _3814;
    float _3836 = _3834;
    float _3838 = _3806;
    if (!_3786)
    {
        float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3842 = _2366 + _3840;
        float _3844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3846 = _2660 + _3844;
        float _3848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3850 = -_2662;
        float _3852 = _3850 + _3764;
        float _3854 = _3842 * _3842;
        float _3856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3858 = _2662 + _3856;
        float _3860 = fma(_3846, _3846, _3854);
        float _3862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3864 = fma(_3858, _3858, _3860);
        float _3866 = sqrt(_3864);
        float _3868 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3870 = precise::min(_3866, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3872 = _3870 * _3862;
        float _3874 = -_2660;
        float _3876 = _3874 + _3760;
        float _3878 = _3868 * _3872;
        float _3880 = -_2366;
        float _3882 = _3880 + _3762;
        float _3884 = fma(_3876, _3878, _2660);
        float _3886 = fma(_3882, _3878, _2366);
        float _3888 = fma(_3852, _3878, _2662);
        _3832 = _3886;
        _3828 = _3884;
        _3836 = _3888;
    }
    float _3890 = _3832;
    float _3892 = _3828;
    float _3894 = _3836;
    if (_3804)
    {
        _3816 = 1.0;
    }
    float _3896 = _3816;
    float _3898 = _3826 * _3806;
    float _3900 = _3898 * 0.5;
    float _3902 = _3896;
    if (!_3804)
    {
        float _3904 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3906 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3908 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3906);
        float _3910 = _3904 * 0.15915493667125701904296875;
        float _3912 = _3910 * 6.283185482025146484375;
        float _3914 = cos(_3912);
        float _3916 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3918 = _3916 * 0.15915493667125701904296875;
        float _3920 = _3910 * 6.283185482025146484375;
        float _3922 = sin(_3920);
        float _3924 = 1.0 / _3914;
        float _3926 = _3918 * 6.283185482025146484375;
        float _3928 = cos(_3926);
        float _3930 = _3922 * _3924;
        float _3932 = 1.0 / _3908;
        float _3934 = _3928 * _3930;
        float _3936 = _3918 * 6.283185482025146484375;
        float _3938 = sin(_3936);
        float _3940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3942 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3940;
        float _3944 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3946 = _3932 * _3944;
        float _3948 = 1.0 / _3934;
        float _3950 = 1.0 / _3942;
        float _3952 = _3938 * _3948;
        float _3954 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3956 = fma(_3952, _3946, _3954);
        float _3958 = _3956 * _3950;
        float _3960 = precise::clamp(_3958, 0.0, 1.0);
        _3818 = _3950;
        _3838 = _3918;
        _3902 = _3960;
    }
    float _3962 = _3818;
    float _3964 = _3838;
    float _3966 = _3902;
    float _3968 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3970 = _3890 + _3968;
    float _3972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3974 = _3892 + _3972;
    float _3976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3978 = _3894 + _3976;
    float _3980 = _3970 * _3970;
    float _3982 = fma(_3974, _3974, _3980);
    float _3984 = fma(_3978, _3978, _3982);
    float _3986 = rsqrt(_3984);
    float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3990 = _3974 * _3988;
    float _3992 = _3978 * _3988;
    float _3994 = _3990 * _3990;
    float _3996 = _3992 * _3992;
    float _3998 = _3994 + _3996;
    float _4000 = sqrt(_3998);
    bool _4002 = _4000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4006 = _4000 + _4004;
    float _4008 = _3978;
    float _4010 = _3964;
    float _4012 = _4006;
    float _4014 = _3990;
    if (_4002)
    {
        float _4016 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4008 = _4016;
    }
    float _4018 = _4008;
    if (_4002)
    {
        float _4020 = rsqrt(_3998);
        _4010 = _4020;
    }
    float _4022 = _4010;
    float _4024 = _4022;
    if (_4002)
    {
        float _4026 = _4006 * _4018;
        _4012 = _4026;
    }
    float _4028 = _4012;
    if (_4002)
    {
        float _4030 = _4028 * 0.15915493667125701904296875;
        _3820 = _4030;
    }
    float _4032 = _3820;
    float _4034 = _3986;
    if (_4002)
    {
        float _4036 = _4032 * 6.283185482025146484375;
        float _4038 = sin(_4036);
        _4034 = _4038;
    }
    float _4040 = _4034;
    float _4042 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4044 = precise::max(0.0, _4042);
    float _4046 = _3962;
    float _4048 = _4044;
    float _4050 = _4042;
    if (_4002)
    {
        float _4052 = _4032 * 6.283185482025146484375;
        float _4054 = cos(_4052);
        _4046 = _4054;
    }
    float _4056 = _4046;
    float _4058 = -_3988;
    float _4060 = -_4044;
    float _4062 = fma(_3970, _4058, _4060);
    float _4064 = _4062;
    if (_4002)
    {
        float _4066 = _4062 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4048 = _4066;
    }
    float _4068 = _4048;
    float _4070 = sqrt(_3984);
    float _4072 = _4040;
    float _4074 = _4068;
    if (_4002)
    {
        float _4076 = fma(_4040, _4068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4072 = _4076;
    }
    float _4078 = _4072;
    float _4080 = _4078;
    if (!_4002)
    {
        _4074 = _3994;
    }
    float _4082 = _4074;
    float _4084 = _4082;
    if (_4002)
    {
        float _4086 = _4056 + (-1.0);
        _4050 = _4086;
    }
    float _4088 = _4050;
    float _4090 = _4088;
    if (_4002)
    {
        float _4092 = _4022 * _4078;
        _3822 = _4092;
    }
    float _4094 = _3822;
    if (!_4002)
    {
        _4080 = _4062;
    }
    float _4096 = _4080;
    float _4098 = _4096;
    if (_4002)
    {
        float _4100 = _4088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4024 = _4100;
    }
    float _4102 = _4024;
    if (_4002)
    {
        float _4104 = _3990 * _4094;
        _4014 = _4104;
    }
    float _4106 = _4014;
    if (!_4002)
    {
        _4090 = _3992;
    }
    float _4108 = _4090;
    float _4110 = _4108;
    if (_4002)
    {
        float _4112 = _3992 * _4094;
        _4110 = _4112;
    }
    float _4114 = _4110;
    if (_4002)
    {
        float _4116 = fma(_4062, _4056, _4102);
        _4098 = _4116;
    }
    float _4118 = _4098;
    if (_4002)
    {
        float _4120 = _4106 * _4106;
        _4084 = _4120;
    }
    float _4122 = _4084;
    if (!_4002)
    {
        _4064 = _3996;
    }
    float _4124 = _4064;
    float _4126 = _4124;
    if (_4002)
    {
        float _4128 = _4114 * _4114;
        _4126 = _4128;
    }
    float _4130 = _4126;
    float _4132 = fma(_4118, _4118, _4122);
    float _4134 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4136 = _4132 + _4130;
    float _4138 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4142 = fma(_4070, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4140);
    float _4144 = precise::clamp(_4142, 0.0, 1.0);
    float _4146 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4148 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4138);
    float _4150 = rsqrt(_4136);
    float _4152 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4154 = -_4144;
    float _4156 = _4154 + 1.0;
    float _4158 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4148);
    float _4160 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4162 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4152);
    float _4164 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4146);
    float _4166 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4168 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4160);
    float _4170 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4162);
    float _4172 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4164);
    float _4174 = _4166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4176 = abs(_4156);
    float _4178 = log2(_4176);
    float _4180 = _4170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4182 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4168);
    float _4184 = -_4174;
    float _4186 = fma(_4184, _4134, 1.0);
    float _4188 = _4150 * _4106;
    float _4190 = _4172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4192 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4194 = _4150 * _4118;
    float _4196 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4198 = _4150 * _4114;
    float _4200 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4192);
    float _4202 = _4182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4204 = -_4196;
    float _4206 = fma(_4194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4204);
    float _4208 = log2(_4186);
    float _4210 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4200);
    float _4212 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4214 = -_4198;
    float _4216 = fma(_4214, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4206);
    float _4218 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4220 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4210);
    float _4222 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4224 = fma(_4216, -0.5, 0.5);
    float _4226 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4212);
    float _4228 = 1.0 / _4220;
    float _4230 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4222);
    float _4232 = fma(_4216, 0.5, 0.5);
    float _4234 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4226);
    float _4236 = _4194 + 1.0;
    float _4238 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4230);
    float _4240 = fma(_4232, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4242 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4234);
    float _4244 = exp2(_4218);
    float _4246 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4238);
    float _4248 = fma(_4232, _4240, -0.212114393711090087890625);
    float _4250 = _4208 * 0.693147182464599609375;
    float _4252 = fma(_4232, _4248, 1.570728778839111328125);
    float _4254 = sqrt(_4224);
    float _4256 = _4242 * _4228;
    float _4258 = _4246 * _4228;
    float _4260 = fma(_4256, 0.5, 0.5);
    float _4262 = fma(_4258, -0.5, 0.5);
    float _4264 = -_4194;
    float _4266 = fma(_4244, _4236, _4264);
    float _4268 = _4250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4270 = fma(_4266, 0.5, 0.5);
    float _4272 = _4254 * 0.636619746685028076171875;
    float3 _11105 = float3(_4260, _4262, _4268);
    float _4274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11105, float3(0.0), isnan(_11105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11105, float3(0.0), isnan(_11105)), level(0.0)).x;
    float3 _11116 = float3(_4260, _4262, _4268);
    float4 _4277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11116, float3(0.0), isnan(_11116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11116, float3(0.0), isnan(_11116)), level(0.0)).xyzw;
    float _4279 = _4277.x;
    float _4281 = _4277.y;
    float _4283 = _4277.z;
    float _4285 = _4277.w;
    float _4287 = -_4252;
    float _4289 = fma(_4272, _4287, 1.0);
    float2 _11138 = float2(_4289, _4270);
    float3 _4293 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11138, float2(0.0), isnan(_11138)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11138, float2(0.0), isnan(_11138)), level(0.0)).xyz;
    float _4295 = _4293.x;
    float _4297 = _4293.y;
    float _4299 = _4293.z;
    float _4301 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4303 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4305 = _4220 * 0.5;
    bool _4307 = _3966 > 0.0;
    bool _4309 = isnan(_3966);
    bool _4311 = _4307 || _4309;
    bool _4313 = isnan(0.0);
    bool _4315 = _4311 || _4313;
    float _4317 = _3966 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4319 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4303);
    float _4321 = exp2(_4301);
    float _4323 = fma(_4246, -0.5, _4305);
    float _4325 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4319);
    out.m_47.x = _4317;
    float _4327 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4325);
    float _4329 = _4242 + _4220;
    float _4331 = _4327 + _4220;
    float _4333 = _4329 * 0.5;
    out.gl_Position.x = _4242;
    out.gl_Position.y = _4246;
    out.gl_Position.z = _4327;
    out.gl_Position.w = _4220;
    float _4335 = _4331 * 0.5;
    float _4337 = -_4321;
    float _4339 = _4337 + 1.0;
    float _4341 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4333;
    out.m_81.y = _4323;
    out.m_81.z = _4335;
    out.m_81.w = _4220;
    float _4343 = _4341 * _4274;
    float _4345 = -_4341;
    float _4347 = _4345 + 1.0;
    float _4349 = _4285 * _4343;
    float _4351 = _4285 * _4347;
    float _4353 = _4299 * _4343;
    float _4355 = fma(_4295, _4349, _4279);
    float _4357 = fma(_4297, _4349, _4281);
    float _4359 = fma(_4285, _4353, _4283);
    out.m_83.x = _4355;
    out.m_83.y = _4357;
    out.m_83.z = _4359;
    out.m_83.w = _4351;
    if (_4315)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _4361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4361;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3478 = false;
    bool _1702 = false;
    bool _1270 = false;
    bool _1172 = false;
    bool _1010 = false;
    bool _836 = false;
    bool _674 = false;
    bool _446 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _97 = in.m_44.w;
    float _99 = trunc(_97);
    int _102 = int(_99);
    bool _106 = _102 >= 1;
    float _108 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _110 = _108;
    if (!_106)
    {
        out.m_47.x = 0.0;
    }
    int _112 = 0;
    if (!_106)
    {
        float _114 = _110 * 5.0;
        _112 = as_type<int>(_114);
    }
    int _116 = _112;
    int _118 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4417 = as_type<float>(_116);
        out.gl_Position.z = _4417;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _120 = in.m_49.w;
    float _122 = float(_102);
    float _124 = 1.0 / _122;
    float _126 = -_120;
    float _128 = _126 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = _120 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_120);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = _128 * _124;
    bool _142 = _128 >= _122;
    bool _144 = !_138;
    bool _146 = _142 || _144;
    out.m_51.x = _140;
    float _148 = _120;
    float _150 = 0.0;
    float _152 = 0.0;
    float _154 = _140;
    if (_146)
    {
        _148 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _148;
    if (_146)
    {
        out.m_47.x = 0.0;
    }
    if (_146)
    {
        float _158 = _156 * 5.0;
        _118 = as_type<int>(_158);
    }
    int _160 = _118;
    if (_146)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4489 = as_type<float>(_160);
        out.gl_Position.z = _4489;
    }
    if (_146)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_53.w;
    float _164 = _128 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _166 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _168 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _170 = _166 || _168;
    bool _172 = isnan(1.0);
    bool _174 = _170 || _172;
    float _176 = in.m_49.x;
    float _178 = in.m_49.y;
    float _180 = in.m_49.z;
    float _182 = in.m_44.x;
    float _184 = in.m_44.y;
    float _186 = in.m_44.z;
    float _188 = _164;
    if (!_174)
    {
        float _190 = _164 * _164;
        float _192 = _190 * 0.5;
        _150 = _192;
    }
    float _194 = _150;
    float _196 = _194;
    if (!_174)
    {
        float _198 = _194 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _196 = _198;
    }
    float _200 = _196;
    bool _202 = !_174;
    float _204 = _200;
    float _206 = 0.0;
    if (!_202)
    {
        float _208 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = log2(_208);
        float _212 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _214 = _212 + 1.0;
        float _216 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _218 = _164 * _210;
        float _220 = 1.0 / _214;
        float _222 = _216 * 0.693147182464599609375;
        float _224 = exp2(_218);
        float _226 = 1.0 / _222;
        float _228 = _224 + (-1.0);
        float _230 = -_228;
        float _232 = fma(_230, _226, _164);
        float _234 = _232 * _220;
        float _236 = _234 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _204 = _236;
        _206 = _220;
        _152 = _226;
    }
    float _238 = _204;
    float _240 = _206;
    float _242 = _152;
    bool _244 = !_174;
    float _246 = _242;
    float _248 = _240;
    float _250 = _238;
    if (!_244)
    {
        float _252 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _254 = log2(_252);
        float _256 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _258 = _256 + 1.0;
        float _260 = 1.0 / _258;
        float _262 = _164 * _254;
        float _264 = exp2(_262);
        float _266 = -_264;
        float _268 = _266 + 1.0;
        float _270 = _268 * _260;
        _188 = _270;
        _246 = _258;
    }
    float _272 = _188;
    float _274 = _246;
    float _276 = _274;
    if (!_174)
    {
        float _278 = _128 * _128;
        float _280 = _278 * 0.5;
        _248 = _280;
    }
    float _282 = _248;
    float _284 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _286 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _288 = _238 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_174)
    {
        _276 = _128;
    }
    float _290 = _276;
    float _292 = fma(_272, _176, _284);
    float _294 = fma(_272, _178, _286);
    float _296 = _290;
    if (!_174)
    {
        float _298 = _282 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _250 = _298;
    }
    float _300 = _250;
    bool _302 = !_174;
    float _304 = _300;
    if (!_302)
    {
        float _306 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _308 = log2(_306);
        float _310 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _312 = _310 + 1.0;
        float _314 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _316 = _128 * _308;
        float _318 = 1.0 / _312;
        float _320 = _314 * 0.693147182464599609375;
        float _322 = exp2(_316);
        float _324 = 1.0 / _320;
        float _326 = _322 + (-1.0);
        float _328 = -_326;
        float _330 = fma(_328, _324, _128);
        float _332 = _330 * _318;
        float _334 = _332 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _304 = _334;
    }
    float _336 = _304;
    bool _338 = !_174;
    if (!_338)
    {
        float _340 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _342 = log2(_340);
        float _344 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _346 = _344 + 1.0;
        float _348 = 1.0 / _346;
        float _350 = _128 * _342;
        float _352 = exp2(_350);
        float _354 = -_352;
        float _356 = _354 + 1.0;
        float _358 = _356 * _348;
        _296 = _358;
    }
    float _360 = _296;
    float _362 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _364 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _366 = _336 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _368 = fma(_272, _180, _288);
    float _370 = fma(_360, _178, _362);
    bool _372 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _374 = fma(_360, _176, _364);
    float _376 = fma(_360, _180, _366);
    float _378 = -_370;
    float _380 = _294 + _378;
    float _382 = fma(_294, _162, _184);
    float _384 = -_374;
    float _386 = _292 + _384;
    float _388 = fma(_292, _162, _182);
    float _390 = _380 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _392 = _380 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _394 = _380 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _396 = -_376;
    float _398 = _368 + _396;
    float _400 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[4].x, _390);
    float _402 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[5].x, _392);
    float _404 = fma(_386, (*spvDescriptorSet0.vp_c10)._m0[6].x, _394);
    float _406 = fma(_368, _162, _186);
    float _408 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _410 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[5].z, _402);
    float _412 = fma(_398, (*spvDescriptorSet0.vp_c10)._m0[6].z, _404);
    bool _414 = !_372;
    float _416 = _408;
    float _418 = _410;
    float _420 = _408;
    float _422 = _412;
    float _424 = _374;
    float _426 = _408;
    float _444;
    if (!_414)
    {
        float _428 = in.m_55.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[12].x, _128);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        _444 = _140;
    }
    _446 = false;
    float _448 = _444;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _452 = _448 + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _456 = _448 + _454;
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _466;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _472 = _448 + _470;
    float _474 = 1.0 / _460;
    bool _476 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_448);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    bool _488 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _490 = 1.0 / _464;
    float _492 = 1.0 / _468;
    float _494 = _456 * _474;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _500;
    float _504 = _452 * _490;
    bool _506 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _508 = isnan(_448);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _520 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _518;
    float _522 = fma(_498, _494, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _528 = -_516;
    float _530 = _528 + 1.0;
    float _532 = fma(_520, _494, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _534 = _472 * _492;
    bool _536 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _538 = isnan(_448);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = fma(_502, _494, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _550 = _448 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _552 = isnan(_448);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = _486 * _530;
    float _564 = -_486;
    float _566 = _564 + 1.0;
    float _568 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _570 = _568 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _576 = -_546;
    float _578 = _576 + 1.0;
    float _580 = _546 * _566;
    float _582 = fma(_570, _504, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _584 = fma(_526, _504, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _586 = fma(_574, _504, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _588 = _560 * _578;
    float _590 = in.m_53.x;
    float _592 = in.m_53.y;
    float _594 = in.m_53.z;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = _522 * _588;
    float _602 = _548 * _588;
    float _604 = _532 * _588;
    float _606 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _606;
    float _610 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].x, _600);
    float _612 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].y, _602);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _614;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _618;
    float _622 = fma(_598, (*spvDescriptorSet0.vp_c9)._m0[143].z, _604);
    float _624 = fma(_608, _534, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _626 = fma(_616, _534, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _628 = fma(_620, _534, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _630 = fma(_582, _580, _610);
    float _632 = fma(_584, _580, _612);
    float _634 = fma(_586, _580, _622);
    float _636 = fma(_624, _562, _630);
    float _638 = fma(_626, _562, _632);
    float _640 = fma(_628, _562, _634);
    float _642 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].x, _636);
    float _644 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].y, _638);
    float _646 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[146].z, _640);
    float _648 = _642 * _590;
    float _650 = _644 * _592;
    float _652 = _646 * _594;
    bool _654 = !_488;
    float _672;
    if (!_654)
    {
        float _656 = in.m_55.x;
        float _658 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _660 = _656 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _662 = fma(_660, (*spvDescriptorSet0.vp_c9)._m0[11].x, _128);
        float _664 = _662 * _658;
        float _666 = floor(_664);
        float _668 = -_666;
        float _670 = _664 + _668;
        _672 = _670;
        _674 = true;
    }
    else
    {
        _672 = _140;
    }
    _674 = false;
    float _676 = _672;
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _680 = _676 + _678;
    bool _682 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _684 = isnan(_676);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _696 = _676 + _694;
    bool _698 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _700 = isnan(_676);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _712 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _710;
    float _714 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _716 = _714 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _718 = _676 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _720 = isnan(_676);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -_692;
    float _732 = _730 + 1.0;
    float _734 = 1.0 / _712;
    float _736 = _728 * _732;
    float _738 = -_728;
    float _740 = _738 + 1.0;
    float _742 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _742;
    bool _746 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _748 = 1.0 / _716;
    float _750 = _708 * _740;
    float _752 = -_708;
    float _754 = _752 + 1.0;
    float _756 = _680 * _734;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _760 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _762;
    float _766 = fma(_744, _756, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _768 = fma(_760, _756, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _770 = fma(_764, _756, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _772 = _696 * _748;
    float _774 = _766 * _750;
    float _776 = _768 * _750;
    float _778 = _770 * _750;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _782 = _780 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _786 = _784 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _792 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].x, _774);
    float _794 = fma(_782, _772, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _796 = fma(_786, _772, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _798 = fma(_790, _772, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _800 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].y, _776);
    float _802 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[107].z, _778);
    float _804 = fma(_794, _736, _792);
    float _806 = fma(_796, _736, _800);
    float _808 = fma(_798, _736, _802);
    float _810 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].x, _804);
    float _812 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].y, _806);
    float _814 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[109].z, _808);
    bool _816 = !_746;
    float _834;
    if (!_816)
    {
        float _818 = in.m_55.x;
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _822 = _818 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _824 = fma(_822, (*spvDescriptorSet0.vp_c9)._m0[11].y, _128);
        float _826 = _824 * _820;
        float _828 = floor(_826);
        float _830 = -_828;
        float _832 = _826 + _830;
        _834 = _832;
        _836 = true;
    }
    else
    {
        _834 = _140;
    }
    _836 = false;
    float _838 = _834;
    float _840 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _842 = _838 + _840;
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _852 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _854 = isnan(_838);
    bool _856 = _852 || _854;
    bool _858 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _860 = _856 || _858;
    float _862 = float(_860);
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _868 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _870 = isnan(_838);
    bool _872 = _868 || _870;
    bool _874 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _876 = _872 || _874;
    float _878 = float(_876);
    float _880 = 1.0 / _846;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _884 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _882;
    float _886 = -_862;
    float _888 = _886 + 1.0;
    bool _890 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _892 = isnan(_838);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    bool _902 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _904 = 1.0 / _850;
    float _906 = 1.0 / _866;
    float _908 = _884 * _880;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _914 = _878 * _888;
    float _916 = -_878;
    float _918 = _916 + 1.0;
    float _920 = fma(_908, _842, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _922;
    float _926 = _900 * _918;
    float _928 = _912 * _904;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _932 = _838 + _930;
    bool _934 = _838 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _936 = isnan(_838);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = _920 * _926;
    float _948 = -_900;
    float _950 = _948 + 1.0;
    float _952 = fma(_928, _932, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _954 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _956 = _838 + _954;
    float _958 = _924 * _906;
    float _960 = -_944;
    float _962 = _960 + 1.0;
    float _964 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _946);
    float _966 = _814 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _968 = fma(_958, _956, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _970 = _862 * _962;
    float _972 = fma(_952, _914, _964);
    float _974 = _810 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _976 = _812 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _978 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = fma(_968, _970, _972);
    float _982 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _984 = _976 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _986 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[118].x, _980);
    float _988 = _986 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _982;
    out.m_57.y = _984;
    out.m_57.z = _978;
    out.m_57.w = _988;
    bool _990 = !_902;
    float _1008;
    if (!_990)
    {
        float _992 = in.m_55.x;
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _996 = _992 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _998 = fma(_996, (*spvDescriptorSet0.vp_c9)._m0[11].z, _128);
        float _1000 = _998 * _994;
        float _1002 = floor(_1000);
        float _1004 = -_1002;
        float _1006 = _1000 + _1004;
        _1008 = _1006;
        _1010 = true;
    }
    else
    {
        _1008 = _140;
    }
    _1010 = false;
    float _1012 = _1008;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1016 = _1012 + _1014;
    bool _1018 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1020 = isnan(_1012);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1026 = _1022 || _1024;
    float _1028 = float(_1026);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1032 = _1012 + _1030;
    bool _1034 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1036 = isnan(_1012);
    bool _1038 = _1034 || _1036;
    bool _1040 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1042 = _1038 || _1040;
    float _1044 = float(_1042);
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1048 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1046;
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1054 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1056 = isnan(_1012);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1062 = _1058 || _1060;
    float _1064 = float(_1062);
    float _1066 = -_1028;
    float _1068 = _1066 + 1.0;
    float _1070 = 1.0 / _1048;
    float _1072 = _1064 * _1068;
    float _1074 = -_1064;
    float _1076 = _1074 + 1.0;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1078;
    bool _1082 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1084 = 1.0 / _1052;
    float _1086 = _1044 * _1076;
    float _1088 = -_1044;
    float _1090 = _1088 + 1.0;
    float _1092 = _1016 * _1070;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1094;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1098;
    float _1102 = fma(_1080, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1104 = fma(_1096, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1106 = fma(_1100, _1092, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1108 = _1032 * _1084;
    float _1110 = _1102 * _1086;
    float _1112 = _1104 * _1086;
    float _1114 = _1106 * _1086;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1118 = _1116 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1128 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1110);
    float _1130 = fma(_1118, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1132 = fma(_1122, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1134 = fma(_1126, _1108, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1136 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1112);
    float _1138 = fma(_1090, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1114);
    float _1140 = fma(_1130, _1072, _1128);
    float _1142 = fma(_1132, _1072, _1136);
    float _1144 = fma(_1134, _1072, _1138);
    float _1146 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1140);
    float _1148 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1142);
    float _1150 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1144);
    bool _1152 = !_1082;
    float _1170;
    if (!_1152)
    {
        float _1154 = in.m_55.x;
        float _1156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1158 = _1154 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1160 = fma(_1158, (*spvDescriptorSet0.vp_c9)._m0[11].w, _128);
        float _1162 = _1160 * _1156;
        float _1164 = floor(_1162);
        float _1166 = -_1164;
        float _1168 = _1162 + _1166;
        _1170 = _1168;
        _1172 = true;
    }
    else
    {
        _1170 = _140;
    }
    _1172 = false;
    float _1174 = _1170;
    float _1176 = _1146 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1178 = _1148 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1180 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1182 = isnan(_1174);
    bool _1184 = _1180 || _1182;
    bool _1186 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1188 = _1184 || _1186;
    float _1190 = float(_1188);
    float _1192 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1194 = _1192 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1196 = _1174 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1198 = isnan(_1174);
    bool _1200 = _1196 || _1198;
    bool _1202 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1204 = _1200 || _1202;
    float _1206 = float(_1204);
    float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1210 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1208;
    float _1212 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1214 = _1174 + _1212;
    float _1216 = -_1190;
    float _1218 = _1216 + 1.0;
    float _1220 = _1150 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1222 = 1.0 / _1194;
    float _1224 = _1176 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1226 = _1206 * _1218;
    float _1228 = -_1206;
    float _1230 = _1228 + 1.0;
    float _1232 = _1178 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1234 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1236 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1238 = _1210 * _1222;
    float _1240 = fma(_1238, _1214, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1242 = _1240 * _1226;
    float _1244 = fma(_1230, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1242);
    float _1246 = fma(_1190, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1244);
    float _1248 = _1246 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_59.x = _1224;
    out.m_59.y = _1232;
    out.m_59.z = _1234;
    out.m_59.w = _1248;
    bool _1250 = !_1236;
    float _1268;
    if (!_1250)
    {
        float _1252 = in.m_55.x;
        float _1254 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1256 = _1252 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1258 = fma(_1256, (*spvDescriptorSet0.vp_c9)._m0[14].x, _128);
        float _1260 = _1258 * _1254;
        float _1262 = floor(_1260);
        float _1264 = -_1262;
        float _1266 = _1260 + _1264;
        _1268 = _1266;
        _1270 = true;
    }
    else
    {
        _1268 = _140;
    }
    _1270 = false;
    float _1272 = _1268;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1276 = _1272 + _1274;
    float _1278 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1280 = _1272 + _1278;
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1282;
    float _1286 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1288 = _1286 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1290 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1290;
    float _1294 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1296 = _1294 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1298 = 1.0 / _1284;
    float _1300 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1302 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1300;
    float _1304 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1306 = _1304 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1310 = _1272 + _1308;
    float _1312 = 1.0 / _1292;
    float _1314 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1316 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1314;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1320 = _1318 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1322 = 1.0 / _1288;
    bool _1324 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1326 = isnan(_1272);
    bool _1328 = _1324 || _1326;
    bool _1330 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1332 = _1328 || _1330;
    float _1334 = float(_1332);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1338 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1336;
    bool _1340 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1342 = isnan(_1272);
    bool _1344 = _1340 || _1342;
    bool _1346 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1348 = _1344 || _1346;
    float _1350 = float(_1348);
    float _1352 = -_1334;
    float _1354 = _1352 + 1.0;
    float _1356 = 1.0 / _1302;
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1358;
    float _1362 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1364 = _1272 + _1362;
    float _1366 = _1276 * _1312;
    float _1368 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1370 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1368;
    float _1372 = _1364 * _1298;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1376 = _1272 + _1374;
    float _1378 = 1.0 / _1296;
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1382 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1380;
    float _1384 = fma(_1316, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1386 = _1376 * _1322;
    float _1388 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1390 = _1272 + _1388;
    float _1392 = fma(_1382, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1394 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1396 = _1394 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1398 = fma(_1320, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1400 = 1.0 / _1360;
    float _1402 = _1280 * _1356;
    bool _1404 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1406 = isnan(_1272);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1396, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1418 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1420 = _1272 + _1418;
    float _1422 = 1.0 / _1306;
    float _1424 = _1310 * _1378;
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1428 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1426;
    float _1430 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1432 = _1430 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    bool _1434 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1436 = fma(_1428, _1372, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1438 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1440 = isnan(_1272);
    bool _1442 = _1438 || _1440;
    bool _1444 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1446 = _1442 || _1444;
    float _1448 = float(_1446);
    float _1450 = _1390 * _1400;
    bool _1452 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1454 = isnan(_1272);
    bool _1456 = _1452 || _1454;
    bool _1458 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1460 = _1456 || _1458;
    float _1462 = float(_1460);
    float _1464 = _1414 * _1354;
    float _1466 = -_1414;
    float _1468 = _1466 + 1.0;
    float _1470 = fma(_1432, _1386, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    bool _1472 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1474 = isnan(_1272);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1480 = _1476 || _1478;
    float _1482 = float(_1480);
    float _1484 = -_1448;
    float _1486 = _1484 + 1.0;
    float _1488 = _1462 * _1468;
    float _1490 = -_1462;
    float _1492 = _1490 + 1.0;
    bool _1494 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1496 = isnan(_1272);
    bool _1498 = _1494 || _1496;
    bool _1500 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1502 = _1498 || _1500;
    float _1504 = float(_1502);
    float _1506 = _1420 * _1422;
    float _1508 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1510 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1508;
    float _1512 = _1448 * _1492;
    float _1514 = _1482 * _1486;
    float _1516 = -_1482;
    float _1518 = _1516 + 1.0;
    float _1520 = -_1504;
    float _1522 = _1520 + 1.0;
    float _1524 = fma(_1338, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1526 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1528 = _1526 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1530 = _1504 * _1518;
    float _1532 = fma(_1510, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1534 = fma(_1370, _1366, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    bool _1536 = _1272 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1538 = isnan(_1272);
    bool _1540 = _1536 || _1538;
    bool _1542 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1544 = _1540 || _1542;
    float _1546 = float(_1544);
    float _1548 = _1350 * _1522;
    float _1550 = -_1350;
    float _1552 = _1550 + 1.0;
    float _1554 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1556 = _1554 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1558 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1560 = _1558 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1562 = _1546 * _1552;
    float _1564 = -_1546;
    float _1566 = _1564 + 1.0;
    float _1568 = fma(_1556, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1570 = fma(_1560, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1572 = _1392 * _1562;
    float _1574 = _1436 * _1562;
    float _1576 = _1384 * _1562;
    float _1578 = fma(_1528, _1424, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1580 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1572);
    float _1582 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1574);
    float _1584 = fma(_1566, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1576);
    float _1586 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1588 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1586;
    float _1590 = fma(_1416, _1548, _1580);
    float _1592 = fma(_1470, _1548, _1582);
    float _1594 = fma(_1398, _1548, _1584);
    float _1596 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1598 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1596;
    float _1600 = fma(_1532, _1530, _1590);
    float _1602 = fma(_1524, _1530, _1592);
    float _1604 = fma(_1534, _1530, _1594);
    float _1606 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1606;
    float _1610 = fma(_1570, _1514, _1600);
    float _1612 = fma(_1568, _1514, _1602);
    float _1614 = fma(_1578, _1514, _1604);
    float _1616 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1618 = _1616 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1620 = fma(_1588, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1622 = fma(_1598, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1624 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1626 = _1624 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1628 = fma(_1608, _1402, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1630 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1632 = _1630 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1634 = fma(_1618, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1636 = fma(_1626, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1638 = fma(_1620, _1512, _1610);
    float _1640 = fma(_1622, _1512, _1612);
    float _1642 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1642;
    float _1646 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1646;
    float _1650 = fma(_1632, _1506, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1652 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1654 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1652;
    float _1656 = fma(_1628, _1512, _1614);
    float _1658 = fma(_1644, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1660 = fma(_1648, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1662 = fma(_1634, _1488, _1638);
    float _1664 = fma(_1636, _1488, _1640);
    float _1666 = fma(_1654, _1450, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1668 = fma(_1650, _1488, _1656);
    float _1670 = fma(_1658, _1464, _1662);
    float _1672 = fma(_1660, _1464, _1664);
    float _1674 = fma(_1666, _1464, _1668);
    float _1676 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1670);
    float _1678 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1672);
    float _1680 = fma(_1334, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1674);
    out.m_61.x = _1676;
    out.m_61.y = _1678;
    out.m_61.z = _1680;
    bool _1682 = !_1434;
    float _1700;
    if (!_1682)
    {
        float _1684 = in.m_55.x;
        float _1686 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1688 = _1684 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1690 = fma(_1688, (*spvDescriptorSet0.vp_c9)._m0[14].y, _128);
        float _1692 = _1690 * _1686;
        float _1694 = floor(_1692);
        float _1696 = -_1694;
        float _1698 = _1692 + _1696;
        _1700 = _1698;
        _1702 = true;
    }
    else
    {
        _1700 = _140;
    }
    _1702 = false;
    float _1704 = _1700;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1708 = _1704 + _1706;
    float _1710 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1712 = _1704 + _1710;
    float _1714 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1716 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1714;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1720 = _1718 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1722 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1724 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1722;
    float _1726 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1728 = _1726 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1730 = 1.0 / _1716;
    float _1732 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1734 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1732;
    float _1736 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1738 = _1736 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1740 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1742 = _1704 + _1740;
    float _1744 = 1.0 / _1724;
    float _1746 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _1748 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _1746;
    float _1750 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _1752 = _1750 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1754 = 1.0 / _1720;
    bool _1756 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1758 = isnan(_1704);
    bool _1760 = _1756 || _1758;
    bool _1762 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1764 = _1760 || _1762;
    float _1766 = float(_1764);
    float _1768 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1770 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1768;
    bool _1772 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1774 = isnan(_1704);
    bool _1776 = _1772 || _1774;
    bool _1778 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1780 = _1776 || _1778;
    float _1782 = float(_1780);
    float _1784 = -_1766;
    float _1786 = _1784 + 1.0;
    float _1788 = 1.0 / _1734;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1790;
    float _1794 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1796 = _1704 + _1794;
    float _1798 = _1708 * _1744;
    float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _1802 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _1800;
    float _1804 = _1796 * _1730;
    float _1806 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1808 = _1704 + _1806;
    float _1810 = 1.0 / _1728;
    float _1812 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1814 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1812;
    float _1816 = fma(_1748, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _1818 = _1808 * _1754;
    float _1820 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1822 = _1704 + _1820;
    float _1824 = fma(_1814, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1828 = _1826 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1830 = fma(_1752, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _1832 = 1.0 / _1792;
    float _1834 = _1712 * _1788;
    bool _1836 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1838 = isnan(_1704);
    bool _1840 = _1836 || _1838;
    bool _1842 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1844 = _1840 || _1842;
    float _1846 = float(_1844);
    float _1848 = fma(_1828, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1850 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1852 = _1704 + _1850;
    float _1854 = 1.0 / _1738;
    float _1856 = _1742 * _1810;
    float _1858 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1860 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1858;
    float _1862 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1864 = _1862 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    bool _1866 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1868 = fma(_1860, _1804, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    bool _1870 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1872 = isnan(_1704);
    bool _1874 = _1870 || _1872;
    bool _1876 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1878 = _1874 || _1876;
    float _1880 = float(_1878);
    float _1882 = _1822 * _1832;
    bool _1884 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1886 = isnan(_1704);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    float _1896 = _1846 * _1786;
    float _1898 = -_1846;
    float _1900 = _1898 + 1.0;
    float _1902 = fma(_1864, _1818, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    bool _1904 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1906 = isnan(_1704);
    bool _1908 = _1904 || _1906;
    bool _1910 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1912 = _1908 || _1910;
    float _1914 = float(_1912);
    float _1916 = -_1880;
    float _1918 = _1916 + 1.0;
    float _1920 = _1894 * _1900;
    float _1922 = -_1894;
    float _1924 = _1922 + 1.0;
    bool _1926 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1928 = isnan(_1704);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1934 = _1930 || _1932;
    float _1936 = float(_1934);
    float _1938 = _1852 * _1854;
    float _1940 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1942 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1940;
    float _1944 = _1880 * _1924;
    float _1946 = _1914 * _1918;
    float _1948 = -_1914;
    float _1950 = _1948 + 1.0;
    float _1952 = -_1936;
    float _1954 = _1952 + 1.0;
    float _1956 = fma(_1770, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _1958 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _1960 = _1958 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _1962 = _1936 * _1950;
    float _1964 = fma(_1942, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1966 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    bool _1968 = _1704 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1970 = isnan(_1704);
    bool _1972 = _1968 || _1970;
    bool _1974 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1976 = _1972 || _1974;
    float _1978 = float(_1976);
    float _1980 = _1782 * _1954;
    float _1982 = -_1782;
    float _1984 = _1982 + 1.0;
    float _1986 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _1988 = _1986 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _1990 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1992 = _1990 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1994 = _1978 * _1984;
    float _1996 = -_1978;
    float _1998 = _1996 + 1.0;
    float _2000 = fma(_1988, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2002 = fma(_1992, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2004 = _1824 * _1994;
    float _2006 = _1868 * _1994;
    float _2008 = _1816 * _1994;
    float _2010 = fma(_1960, _1856, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _2012 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2004);
    float _2014 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].y, _2006);
    float _2016 = fma(_1998, (*spvDescriptorSet0.vp_c9)._m0[167].z, _2008);
    float _2018 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2020 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2018;
    float _2022 = fma(_1848, _1980, _2012);
    float _2024 = fma(_1902, _1980, _2014);
    float _2026 = fma(_1830, _1980, _2016);
    float _2028 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2030 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2028;
    float _2032 = fma(_1964, _1962, _2022);
    float _2034 = fma(_1956, _1962, _2024);
    float _2036 = fma(_1966, _1962, _2026);
    float _2038 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _2040 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _2038;
    float _2042 = fma(_2002, _1946, _2032);
    float _2044 = fma(_2000, _1946, _2034);
    float _2046 = fma(_2010, _1946, _2036);
    float _2048 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2050 = _2048 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2052 = fma(_2020, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2054 = fma(_2030, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2056 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2058 = _2056 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2060 = fma(_2040, _1834, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _2062 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _2064 = _2062 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2066 = fma(_2050, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2068 = fma(_2058, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2070 = fma(_2052, _1944, _2042);
    float _2072 = fma(_2054, _1944, _2044);
    float _2074 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2076 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2080 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2078;
    float _2082 = fma(_2064, _1938, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _2084 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _2086 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _2084;
    float _2088 = fma(_2060, _1944, _2046);
    float _2090 = fma(_2076, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2092 = fma(_2080, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2094 = fma(_2066, _1920, _2070);
    float _2096 = fma(_2068, _1920, _2072);
    float _2098 = fma(_2086, _1882, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _2100 = fma(_2082, _1920, _2088);
    float _2102 = fma(_2090, _1896, _2094);
    float _2104 = fma(_2092, _1896, _2096);
    float _2106 = fma(_2098, _1896, _2100);
    float _2108 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2102);
    float _2110 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2104);
    float _2112 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[174].z, _2106);
    out.m_63.x = _2108;
    out.m_63.y = _2110;
    out.m_63.z = _2112;
    bool _2114 = !_1866;
    float _2116 = _2076;
    float _2118 = _2068;
    int _2120 = as_type<int>(_2046);
    int _2122 = as_type<int>(_2090);
    float _2124 = _2044;
    float _2126 = _1920;
    float _2128 = _2058;
    if (!_2114)
    {
        float _2130 = in.m_55.x;
        float _2132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2134 = _2130 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2136 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[14].z, _128);
        float _2138 = _2136 * _2132;
        float _2140 = floor(_2138);
        float _2142 = -_2140;
        float _2144 = _2138 + _2142;
        _154 = _2144;
    }
    float _2146 = _154;
    float _2148 = in.m_55.y;
    int _2150 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2152 = _2150 != 0;
    float _2154 = in.m_65.x;
    int _2156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2158 = _2156 != 0;
    int _2160 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2162 = _2160 != 0;
    float _2164 = _2064;
    float _2166 = _2154;
    if (_2152)
    {
        float _2168 = in.m_55.x;
        _2164 = _2168;
    }
    float _2170 = _2164;
    int _2172 = 0;
    if (_2152)
    {
        _2172 = 0;
    }
    int _2174 = _2172;
    float _2176 = _2032;
    int _2178 = _2174;
    if (_2152)
    {
        float _2180 = in.m_55.z;
        _2176 = _2180;
    }
    float _2182 = _2176;
    float _2184 = _2082;
    if (_2158)
    {
        float _2186 = in.m_55.x;
        _2184 = _2186;
    }
    float _2188 = _2184;
    float _2190 = _2148 * 2.0;
    int _2192 = as_type<int>(_2190);
    if (_2152)
    {
        _2116 = _2148;
    }
    float _2194 = _2116;
    float _2196 = _2112;
    float _2198 = _2194;
    if (_2162)
    {
        float _2200 = in.m_55.z;
        _2196 = _2200;
    }
    float _2202 = _2196;
    float _2204 = floor(_2190);
    float _2206 = _2170;
    if (_2152)
    {
        _2118 = _2170;
    }
    float _2208 = _2118;
    float _2210 = _2182;
    float _2212 = _2208;
    if (_2152)
    {
        _2120 = as_type<int>(_2182);
    }
    int _2214 = _2120;
    int _2216 = _2214;
    float _2218 = _2188;
    if (!_2152)
    {
        float _2220 = in.m_55.x;
        float _2222 = _2148 * 3.1415927410125732421875;
        float _2224 = in.m_55.z;
        float _2226 = _2222 * 0.15915493667125701904296875;
        float _2228 = _2226 * 6.283185482025146484375;
        float _2230 = sin(_2228);
        float _2232 = _2220 * 3.1415927410125732421875;
        float _2234 = _2232 * 0.15915493667125701904296875;
        float _2236 = _2224 * 3.1415927410125732421875;
        float _2238 = _2236 * 0.15915493667125701904296875;
        float _2240 = _2234 * 6.283185482025146484375;
        float _2242 = sin(_2240);
        float _2244 = _2238 * 6.283185482025146484375;
        float _2246 = sin(_2244);
        _2210 = _2224;
        _2206 = _2220;
        _2192 = as_type<int>(_2238);
        _2178 = 1;
        _2212 = _2242;
        _2198 = _2230;
        _2216 = as_type<int>(_2246);
    }
    float _2248 = _2210;
    float _2250 = _2206;
    int _2252 = _2192;
    int _2254 = _2178;
    float _2256 = _2212;
    float _2258 = _2198;
    int _2260 = _2216;
    float _2262 = _2248 * 2.0;
    bool _2264 = false;
    int _2266 = _2252;
    if (_2162)
    {
        bool _2268 = _2202 > 0.5;
        _2264 = _2268;
    }
    bool _2270 = _2264;
    float _2272 = _2250 * 2.0;
    int _2274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2276 = _2274 != 0;
    if (_2158)
    {
        float _2278 = -_2154;
        float _2280 = _2278 + 1.0;
        _2266 = as_type<int>(_2280);
    }
    int _2282 = _2266;
    int _2284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2286 = _2284 != 0;
    float _2288 = floor(_2262);
    bool _2290 = false;
    int _2292 = _2282;
    if (_2158)
    {
        bool _2294 = _2188 > 0.5;
        _2290 = _2294;
    }
    bool _2296 = _2290;
    if (_2162)
    {
        float _2298 = -_2154;
        float _2300 = _2298 + 1.0;
        _2122 = as_type<int>(_2300);
    }
    int _2302 = _2122;
    float _2304 = in.m_65.y;
    int _2306 = _2302;
    if (!_2158)
    {
        _2124 = _2154;
    }
    float _2308 = _2124;
    float _2310 = _382 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2312 = _2308;
    if (!_2162)
    {
        _2218 = _2154;
    }
    float _2314 = _2218;
    float _2316 = in.m_55.w;
    float _2318 = floor(_2272);
    float _2320 = _2314;
    if (_2158)
    {
        float _2322 = _2296 ? as_type<float>(_2282) : _2154;
        _2312 = _2322;
    }
    float _2324 = _2312;
    if (_2276)
    {
        float _2326 = -_2154;
        float _2328 = _2326 + 1.0;
        _2292 = as_type<int>(_2328);
    }
    int _2330 = _2292;
    int _2332 = _2330;
    if (_2162)
    {
        float _2334 = _2270 ? as_type<float>(_2302) : _2154;
        _2320 = _2334;
    }
    float _2336 = _2320;
    if (_2286)
    {
        float _2338 = -_2154;
        float _2340 = _2338 + 1.0;
        _2306 = as_type<int>(_2340);
    }
    int _2342 = _2306;
    bool _2344 = _2148 > 0.5;
    float _2346 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2310);
    if (!_2276)
    {
        _2126 = _2154;
    }
    float _2348 = _2126;
    float _2350 = _2348;
    if (!_2286)
    {
        _2128 = _2154;
    }
    float _2352 = _2128;
    float _2354 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2346);
    float _2356 = _2352;
    if (_2276)
    {
        float _2358 = _2344 ? as_type<float>(_2330) : _2154;
        _2350 = _2358;
    }
    float _2360 = _2350;
    int _2362 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2364 = _2362 != 0;
    float _2366 = _2354 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    if (_2286)
    {
        float _2368 = _2344 ? as_type<float>(_2342) : _2154;
        _2356 = _2368;
    }
    float _2370 = _2356;
    bool _2372 = _2288 >= 0.0;
    bool _2374 = isnan(_2288);
    bool _2376 = _2372 || _2374;
    bool _2378 = isnan(0.0);
    bool _2380 = _2376 || _2378;
    bool _2382 = _2204 > 0.0;
    float _2384 = -_2304;
    float _2386 = _2384 + 1.0;
    bool _2388 = _2318 >= 0.0;
    bool _2390 = isnan(_2318);
    bool _2392 = _2388 || _2390;
    bool _2394 = isnan(0.0);
    bool _2396 = _2392 || _2394;
    bool _2398 = _2204 >= 0.0;
    bool _2400 = isnan(_2204);
    bool _2402 = _2398 || _2400;
    bool _2404 = isnan(0.0);
    bool _2406 = _2402 || _2404;
    int _2408 = _2380 ? 0 : 1;
    if (_2364)
    {
        float _2410 = -_2154;
        float _2412 = _2410 + 1.0;
        _2332 = as_type<int>(_2412);
    }
    int _2414 = _2332;
    bool _2416 = _2288 > 0.0;
    int _2418 = _2396 ? 0 : 1;
    bool _2420 = _2318 > 0.0;
    int _2422 = _2406 ? 0 : 1;
    int _2424 = ~_2408;
    int _2426 = _2424 + 1;
    int _2428 = _2426 + 1;
    int _2430 = ~_2422;
    int _2432 = _2430 + 1;
    int _2434 = _2432 + 1;
    int _2436 = _2434;
    int _2438 = _2428;
    if (!_2382)
    {
        int _2440 = ~_2422;
        int _2442 = _2440 + 1;
        _2436 = _2442;
    }
    int _2444 = _2436;
    bool _2446 = _2248 > 0.5;
    if (_2364)
    {
        float _2448 = _2344 ? as_type<float>(_2414) : _2154;
        _2166 = _2448;
    }
    float _2450 = _2166;
    if (!_2416)
    {
        int _2452 = ~_2408;
        int _2454 = _2452 + 1;
        _2438 = _2454;
    }
    int _2456 = _2438;
    int _2458 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2460 = _2458 != 0;
    int _2462 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2464 = _2462 != 0;
    int _2466 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2468 = _2466 != 0;
    int _2470 = _2446 ? as_type<int>(_2386) : as_type<int>(_2304);
    int _2472 = ~_2418;
    int _2474 = _2472 + 1;
    int _2476 = _2474 + 1;
    int _2478 = _2476;
    if (!_2420)
    {
        int _2480 = ~_2418;
        int _2482 = _2480 + 1;
        _2478 = _2482;
    }
    int _2484 = _2478;
    float _2486 = _2468 ? as_type<float>(_2470) : _2304;
    int _2488 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2490 = _2488 != 0;
    int _2492 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2494 = _2492 != 0;
    int _2496 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2498 = _2496 != 0;
    float _2500 = in.m_67.x;
    float _2502 = in.m_67.y;
    float _2504 = in.m_67.z;
    bool _2506 = !_2490;
    int _2508 = _2506 ? 0 : 1;
    float _2510 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2512 = _2510 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2514 = !_2494;
    int _2516 = _2514 ? 0 : 1;
    float _2518 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2520 = _2518 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    int _2522 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2524 = _2522 != 0;
    int _2526 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2528 = _2526 != 0;
    float _2530 = _382 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2532 = _382 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2534 = 1.0 / _2512;
    float _2536 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2532);
    float _2538 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2540 = _2538 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2544 = _2542 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2546 = 1.0 / _2520;
    int _2548 = _2344 ? as_type<int>(_2386) : as_type<int>(_2304);
    float _2550 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2504);
    bool _2552 = _2316 > 0.5;
    float _2554 = fma(_388, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2530);
    float _2556 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2558 = _2556 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2560 = 1.0 / _2540;
    float _2562 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2564 = _2148 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2566 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2554);
    float _2568 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2570 = _2568 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _2572 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _2574 = _2572 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2576 = fma(_2564, -2.0, _2562);
    float _2578 = 1.0 / _2544;
    float _2580 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _2582 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _2580;
    float _2584 = _2574 * _2534;
    float _2586 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2588 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _2586;
    float _2590 = _2582 * _2546;
    float _2592 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _2594 = _2592 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _2596 = 1.0 / _2558;
    float _2598 = _2588 * _2560;
    float _2600 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _2602 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _2600;
    float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2606 = _2604 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2608 = fma(_406, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2536);
    float _2610 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2500);
    bool _2612 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _2614 = isnan(_2146);
    bool _2616 = _2612 || _2614;
    bool _2618 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _2620 = _2616 || _2618;
    float _2622 = float(_2620);
    float _2624 = 1.0 / _2570;
    float _2626 = _2594 * _2578;
    float _2628 = (*spvDescriptorSet0.vp_c9)._m0[193].x + (-1.0);
    float _2630 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2502);
    bool _2632 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _2634 = isnan(_2146);
    bool _2636 = _2632 || _2634;
    bool _2638 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _2640 = _2636 || _2638;
    float _2642 = float(_2640);
    float _2644 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2646 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _2644;
    float _2648 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2650 = log2(_2648);
    float _2652 = _2602 * _2596;
    float _2654 = -_2642;
    float _2656 = _2654 + 1.0;
    float _2658 = _2460 ? as_type<float>(_2548) : _2304;
    float _2660 = _2566 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2662 = _2608 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2664 = -(*spvDescriptorSet0.vp_c10)._m0[13].z;
    float _2666 = _2664 + 1.0;
    float _2668 = 1.0 / _2606;
    float _2670 = _2646 * _2624;
    float _2672 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2674 = _2146 + _2672;
    float _2676 = _2666 * 0.2000000476837158203125;
    float _2678 = fma(_2590, _2674, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _2680 = fma(_648, _2676, _648);
    float _2682 = _128 * _2650;
    float _2684 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _2686 = _2684 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _2688 = fma(_650, _2676, _650);
    float _2690 = fma(_652, _2676, _652);
    float _2692 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2694 = _2146 + _2692;
    bool _2696 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _2698 = isnan(_2146);
    bool _2700 = _2696 || _2698;
    bool _2702 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _2704 = _2700 || _2702;
    float _2706 = float(_2704);
    float _2708 = exp2(_2682);
    bool _2710 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _2712 = isnan(_2146);
    bool _2714 = _2710 || _2712;
    bool _2716 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _2718 = _2714 || _2716;
    float _2720 = float(_2718);
    float _2722 = _2686 * _2668;
    float _2724 = fma(_2652, _2694, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _2726 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2728 = _2146 + _2726;
    bool _2730 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _2732 = isnan(_2146);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _2738 = _2734 || _2736;
    float _2740 = float(_2738);
    float _2742 = -_2706;
    float _2744 = _2742 + 1.0;
    float _2746 = precise::max((*spvDescriptorSet0.vp_c7)._m0[0].x, -0.20000000298023223876953125);
    float _2748 = fma(_2584, _2728, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _2750 = -_2720;
    float _2752 = _2750 + 1.0;
    float _2754 = _2740 * _2744;
    float _2756 = precise::min(_2746, 1.5);
    float _2758 = -_2740;
    float _2760 = _2758 + 1.0;
    float _2762 = _2706 * _2752;
    bool _2764 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _2766 = isnan(_2146);
    bool _2768 = _2764 || _2766;
    bool _2770 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _2772 = _2768 || _2770;
    float _2774 = float(_2772);
    float _2776 = -_2708;
    float _2778 = _2776 + 1.0;
    float _2780 = fma(_2756, _2628, 1.0);
    float _2782 = _2622 * _2760;
    bool _2784 = !_2498;
    int _2786 = _2784 ? 0 : 1;
    float _2788 = -_2622;
    float _2790 = _2788 + 1.0;
    bool _2792 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2794 = isnan(0.0);
    bool _2796 = _2792 || _2794;
    bool _2798 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2800 = _2796 || _2798;
    float _2802 = -_2774;
    float _2804 = _2802 + 1.0;
    bool _2806 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _2808 = isnan(_2146);
    bool _2810 = _2806 || _2808;
    bool _2812 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _2814 = _2810 || _2812;
    float _2816 = float(_2814);
    float _2818 = _2774 * _2790;
    float _2820 = _2800 ? _2778 : 0.0;
    float _2822 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2824 = 1.0 + _2822;
    float _2826 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2828 = _2146 + _2826;
    float _2830 = _2816 * _2804;
    float _2832 = -_2816;
    float _2834 = _2832 + 1.0;
    bool _2836 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2838 = isnan(1.0);
    bool _2840 = _2836 || _2838;
    bool _2842 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2844 = _2840 || _2842;
    float _2846 = fma(_2626, _2828, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _2848 = 1.0 / _2824;
    float _2850 = _2642 * _2834;
    float _2852 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _2854 = _2146 + _2852;
    bool _2856 = _2146 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _2858 = isnan(_2146);
    bool _2860 = _2856 || _2858;
    bool _2862 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _2864 = _2860 || _2862;
    float _2866 = float(_2864);
    float _2868 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2870 = _2146 + _2868;
    float _2872 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _2874 = _2146 + _2872;
    float _2876 = fma(_2670, _2854, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _2878 = _2680 * _2780;
    float _2880 = _2688 * _2780;
    float _2882 = _2690 * _2780;
    int _2884 = abs(_2508);
    float _2886 = _2866 * _2656;
    float _2888 = -_2866;
    float _2890 = _2888 + 1.0;
    int _2892 = abs(_2786);
    float _2894 = fma(_2598, _2870, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _2896 = _2678 * _2886;
    float _2898 = _2820 * _2848;
    float _2900 = _2878 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2902 = _2880 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2904 = float(_2456);
    float _2906 = fma(_2890, (*spvDescriptorSet0.vp_c9)._m0[175].x, _2896);
    bool _2908 = !_2844;
    float _2910 = _2908 ? _128 : _2898;
    float _2912 = _2902 * _2630;
    bool _2914 = _2254 != 1;
    float _2916 = _2900 * _2610;
    int _2918 = abs(_2516);
    float _2920 = in.m_69.x;
    float _2922 = in.m_69.y;
    float _2924 = in.m_69.z;
    float _2926 = float(_2884);
    float _2928 = _2148 + _2248;
    float _2930 = _2148 + _2250;
    float _2932 = _2928 + (-1.0);
    float _2934 = float(_2484);
    float _2936 = _2926 * _2904;
    float _2938 = float(_2918);
    float _2940 = _2930 + (-1.0);
    float _2942 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2944 = float(_2444);
    float _2946 = fma(_2932, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2948 = float(_2892);
    float _2950 = _2936 * (-2.0);
    float _2952 = _2938 * _2934;
    float _2954 = fma(_2940, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2956 = _2948 * _2944;
    float _2958 = _2250 + (-0.5);
    float _2960 = _2952 * (-2.0);
    float _2962 = fma(_2954, _2950, _2954);
    float _2964 = fma(_2950, _2920, _2920);
    float _2966 = _2148 + (-0.5);
    float _2968 = fma(_2960, _2922, _2922);
    float _2970 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2972 = fma(_2958, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2964);
    float _2974 = fma(_2946, _2960, _2946);
    float _2976 = _2250 + _2248;
    float _2978 = fma(_2148, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2970);
    float _2980 = fma(_2910, _2962, _2972);
    float _2982 = _2882 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2984 = fma(_2966, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2968);
    float _2986 = _2980 * 0.15915493667125701904296875;
    float _2988 = _2976 + (-1.0);
    float _2990 = _2956 * (-2.0);
    float _2992 = _2982 * _2550;
    float _2994 = fma(_2910, _2974, _2984);
    float _2996 = fma(_2988, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2998 = fma(_2990, _2924, _2924);
    float _3000 = _2248 + (-0.5);
    float _3002 = fma(_2996, _2990, _2996);
    float _3004 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3006 = fma(_3000, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2998);
    float _3008 = _2942 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    float _3012 = fma(_2250, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3004);
    float _3014 = fma(_2910, _3002, _3006);
    float _3016 = _2250 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3018 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3020 = fma(_3008, _2324, -0.5);
    float _3022 = _3014 * 0.15915493667125701904296875;
    float _3024 = _2994 * 0.15915493667125701904296875;
    float _3026 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3028 = fma(_2748, _2850, _2906);
    float _3030 = _2256 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3032 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3034 = _2258 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3036 = _2986 * 6.283185482025146484375;
    float _3038 = sin(_3036);
    float _3040 = _3010 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _3042 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3044 = -_3032;
    float _3046 = fma(_3030, 2.0, _3044);
    float _3048 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3050 = fma(_3040, _2370, -0.5);
    float _3052 = fma(_3034, -2.0, _3042);
    float _3054 = _2986 * 6.283185482025146484375;
    float _3056 = cos(_3054);
    float _3058 = _3026 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3060 = fma(_2256, (*spvDescriptorSet0.vp_c9)._m0[93].z, _3048);
    float _3062 = fma(_2724, _2830, _3028);
    bool _3064 = !_2914;
    float _3066 = _3064 ? _2258 : _2256;
    float _3068 = fma(_3058, _2450, -0.5);
    bool _3070 = !_2914;
    float _3072 = _3070 ? as_type<float>(_2260) : _2258;
    float _3074 = fma(_2846, _2818, _3062);
    float _3076 = _3024 * 6.283185482025146484375;
    float _3078 = sin(_3076);
    float _3080 = -_3018;
    float _3082 = fma(_3016, 2.0, _3080);
    float _3084 = -_128;
    float _3086 = fma(_3084, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3046);
    float _3088 = fma(_2894, _2782, _3074);
    float _3090 = fma(_2722, _2874, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3092 = _3022 * 6.283185482025146484375;
    float _3094 = cos(_3092);
    float _3096 = _3024 * 6.283185482025146484375;
    float _3098 = cos(_3096);
    float _3100 = _3038 * _3078;
    float _3102 = _3056 * _3078;
    float _3104 = _3022 * 6.283185482025146484375;
    float _3106 = sin(_3104);
    float _3108 = _3094 * _2912;
    float _3110 = _3078 * _3094;
    float _3112 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3114 = _3056 * _3108;
    float _3116 = fma(_2258, (*spvDescriptorSet0.vp_c9)._m0[93].w, _3112);
    float _3118 = _3056 * _3098;
    float _3120 = _3098 * _3094;
    float _3122 = _3038 * _3098;
    float _3124 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _3126 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3060);
    float _3128 = fma(_3106, _3118, _3100);
    float _3130 = -_2912;
    float _3132 = _3106 * _3130;
    float _3134 = -_3102;
    float _3136 = fma(_3106, _3122, _3134);
    float _3138 = -_3122;
    float _3140 = fma(_3106, _3102, _3138);
    float _3142 = fma(_3128, _2916, _3114);
    float _3144 = fma(_3120, _2916, _3132);
    float _3146 = fma(_3106, _3100, _3118);
    float _3148 = _3038 * _3108;
    float _3150 = fma(_3140, _2992, _3142);
    float _3152 = fma(_3110, _2992, _3144);
    float _3154 = _2524 ? as_type<float>(_2470) : _2304;
    float _3156 = fma(_3136, _2916, _3148);
    float _3158 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3160 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3162 = _3124 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3164 = fma(_3146, _2992, _3156);
    float _3166 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3158);
    float _3168 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3160);
    float _3170 = fma(_3162, _2658, -0.5);
    int _3172 = _2552 ? as_type<int>(_2386) : as_type<int>(_2304);
    float _3174 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3166);
    float _3176 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3168);
    float _3178 = _2528 ? as_type<float>(_2470) : _2304;
    float _3180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _3182 = _3174 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3184 = _3176 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3186 = _2464 ? as_type<float>(_3172) : _2304;
    float _3188 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2978);
    float _3190 = _2660 + _3182;
    float _3192 = _2662 + _3184;
    float _3194 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3012);
    float _3196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    float _3198 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3200 = _3190 + _3198;
    float _3202 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3204 = _3192 + _3202;
    float _3206 = -_128;
    float _3208 = fma(_3206, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3082);
    float _3210 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2576);
    float _3212 = _3200 * _3200;
    float _3214 = _3204 * _3204;
    float _3216 = fma(_3194, _3020, _3208);
    float _3218 = -_3210;
    float _3220 = fma(_3188, _3170, _3218);
    float _3222 = _3212 + _3214;
    float _3224 = _3180 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _3226 = fma(_3126, _3050, _3086);
    float _3228 = sqrt(_3222);
    float _3230 = fma(_3224, _3154, -0.5);
    float _3232 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3234 = _3150 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3236 = _3196 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    float _3238 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3240 = fma(_3152, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3234);
    float _3242 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3244 = fma(_3236, _3178, -0.5);
    float _3246 = fma(_3066, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3238);
    float _3248 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3250 = _3066 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3252 = fma(_3164, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3240);
    float _3254 = _3072 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3256 = fma(_3072, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3248);
    bool _3258 = _3228 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _3262 = -_3232;
    float _3264 = fma(_3250, 2.0, _3262);
    float _3266 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3116);
    float _3268 = _3252 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3270 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3052);
    float _3272 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _3274 = _2366 + _3268;
    float _3276 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _3278 = -_3270;
    float _3280 = fma(_3266, _3230, _3278);
    float _3282 = _3074;
    float _3284 = _3214;
    float _3286 = _3212;
    float _3288 = _3190;
    float _3290 = _3192;
    if (!_3258)
    {
        _3282 = _3214;
    }
    float _3292 = _3282;
    float _3294 = _3292;
    if (!_3258)
    {
        _3284 = _3212;
    }
    float _3296 = _3284;
    float _3298 = fma(_3254, -2.0, _3276);
    float _3300 = _3296;
    if (!_3258)
    {
        _3286 = _3274;
    }
    float _3302 = _3286;
    bool _3304 = !_3258;
    float _3306 = _3302;
    if (!_3304)
    {
        float _3308 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3310 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3312 = _3228 + _3310;
        float _3314 = rsqrt(_3222);
        float _3316 = _3312 * _3308;
        float _3318 = _3274 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3320 = _3316 * 0.15915493667125701904296875;
        float _3322 = _3320 * 6.283185482025146484375;
        float _3324 = sin(_3322);
        float _3326 = _3320 * 6.283185482025146484375;
        float _3328 = cos(_3326);
        float _3330 = fma(_3324, _3318, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3332 = _3314 * _3330;
        float _3334 = _3328 + (-1.0);
        float _3336 = fma(_3200, _3332, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3338 = fma(_3204, _3332, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3340 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3342 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3344 = _3336 + _3342;
        float _3346 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3348 = _3338 + _3346;
        float _3350 = fma(_3274, _3328, _3340);
        float _3352 = _3344 * _3344;
        float _3354 = _3348 * _3348;
        _3306 = _3350;
        _3300 = _3352;
        _3294 = _3354;
        _3288 = _3336;
        _3290 = _3338;
    }
    float _3356 = _3306;
    float _3358 = _3300;
    float _3360 = _3294;
    float _3362 = _3288;
    float _3364 = _3290;
    float _3366 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3368 = _3356 + _3366;
    float _3370 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3372 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3246);
    float _3374 = -_128;
    float _3376 = fma(_3374, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3264);
    float _3378 = fma(_3368, _3368, _3358);
    float _3380 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3256);
    float _3382 = fma(_128, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3298);
    float _3384 = fma(_3090, _2754, _3088);
    float _3386 = _3378 + _3360;
    float _3388 = fma(_3372, _3068, _3376);
    float _3390 = _2360 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3392 = _2486 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3394 = _2336 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3396 = _3186 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3398 = sqrt(_3386);
    float _3400 = -_3382;
    float _3402 = fma(_3380, _3244, _3400);
    float _3404 = fma(_2876, _2762, _3384);
    float _3406 = _3392 * _3370;
    float _3408 = _3394 * _3242;
    float _3410 = _3396 * _3260;
    float _3412 = _3390 * _3272;
    float _3414 = _3226 + 0.5;
    float _3416 = _3216 + 0.5;
    float _3418 = _3220 + 0.5;
    float _3420 = _3280 + 0.5;
    float _3422 = _3388 + 0.5;
    float _3424 = _3402 + 0.5;
    float _3426 = fma(_2720, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3404);
    out.m_71.x = _3416;
    out.m_71.y = _3418;
    out.m_71.z = _3408;
    out.m_71.w = _3410;
    bool _3428 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3430 = isnan(_3398);
    bool _3432 = _3428 || _3430;
    bool _3434 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3436 = _3432 || _3434;
    out.m_73.x = _3412;
    out.m_73.y = _3406;
    out.m_75.x = _3414;
    out.m_75.y = _3420;
    out.m_77.x = _3422;
    out.m_77.y = _3424;
    float _3438 = _3390;
    float _3440 = _3416;
    float _3442 = _3418;
    if (!_3436)
    {
        _3438 = 1.0;
    }
    float _3444 = _3438;
    out.m_79.x = _3426;
    bool _3446 = !_3436;
    float _3448 = _3444;
    if (!_3446)
    {
        bool _3450 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3452 = isnan(_3398);
        bool _3454 = _3450 || _3452;
        bool _3456 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3458 = _3454 || _3456;
        if (!_3458)
        {
            float _3460 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3462 = _3398 + _3460;
            float _3464 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3466 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3464;
            float _3468 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3470 = _3468 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3472 = 1.0 / _3466;
            float _3474 = _3462 * _3472;
            float _3476 = fma(_3474, _3470, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3448 = _3476;
            _3478 = true;
        }
        else
        {
            bool _3480 = _3398 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3482 = isnan(_3398);
            bool _3484 = _3480 || _3482;
            bool _3486 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3488 = _3484 || _3486;
            if (!_3488)
            {
                float _3490 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3492 = _3398 + _3490;
                float _3494 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3496 = _3494 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3498 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3500 = _3498 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3502 = 1.0 / _3496;
                float _3504 = _3492 * _3502;
                float _3506 = fma(_3504, _3500, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3448 = _3506;
                _3478 = true;
            }
            else
            {
                _3448 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3478 = false;
    float _3508 = _3448;
    float _3510 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3512 = _3356 + _3510;
    float _3514 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3516 = _3362 + _3514;
    float _3518 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3520 = _3364 + _3518;
    float _3522 = fma(_3512, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3524 = fma(_3516, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3526 = fma(_3520, _3508, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3528 = -_2366;
    float _3530 = _3528 + _3522;
    float _3532 = -_2660;
    float _3534 = _3532 + _3524;
    float _3536 = -_2662;
    float _3538 = _3536 + _3526;
    float _3540 = _3530 * _3530;
    float _3542 = fma(_3534, _3534, _3540);
    float _3544 = fma(_3538, _3538, _3542);
    float _3546 = sqrt(_3544);
    bool _3548 = _3546 > 0.0;
    bool _3550 = !_3548;
    float _3552 = _3546;
    float _3554 = _3524;
    float _3556 = _3522;
    float _3558 = _3526;
    float _3560 = _3546;
    if (!_3550)
    {
        bool _3562 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _3564 = _3408;
        if (_3562)
        {
            float _3566 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _3564 = _3566;
        }
        float _3568 = _3564;
        if (_3562)
        {
            float _3570 = _408 * _3568;
            _3440 = _3570;
        }
        float _3572 = _3440;
        float _3574 = _3572;
        if (_3562)
        {
            float _3576 = _410 * _3568;
            _3442 = _3576;
        }
        float _3578 = _3442;
        float _3580 = _3578;
        if (_3562)
        {
            float _3582 = _412 * _3568;
            _3552 = _3582;
        }
        float _3584 = _3552;
        float _3586 = _3584;
        if (!_3562)
        {
            float _3588 = _128 + 1.0;
            float _3590 = _3588;
            if (!_174)
            {
                float _3592 = _3588 * _3588;
                float _3594 = _3592 * 0.5;
                _416 = _3594;
            }
            float _3596 = _416;
            float _3598 = _3596;
            if (!_174)
            {
                float _3600 = _3596 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3598 = _3600;
            }
            float _3602 = _3598;
            bool _3604 = !_174;
            float _3606 = _3602;
            if (!_3604)
            {
                float _3608 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3610 = log2(_3608);
                float _3612 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3614 = _3612 + 1.0;
                float _3616 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3618 = _3610 * _3588;
                float _3620 = 1.0 / _3614;
                float _3622 = _3616 * 0.693147182464599609375;
                float _3624 = exp2(_3618);
                float _3626 = 1.0 / _3622;
                float _3628 = _3624 + (-1.0);
                float _3630 = -_3628;
                float _3632 = fma(_3630, _3626, _3588);
                float _3634 = _3632 * _3620;
                float _3636 = _3634 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _3606 = _3636;
            }
            float _3638 = _3606;
            float _3640 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _3642 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _3644 = !_174;
            if (!_3644)
            {
                float _3646 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _3648 = log2(_3646);
                float _3650 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _3652 = _3650 + 1.0;
                float _3654 = 1.0 / _3652;
                float _3656 = _3648 * _3588;
                float _3658 = exp2(_3656);
                float _3660 = -_3658;
                float _3662 = _3660 + 1.0;
                float _3664 = _3662 * _3654;
                _3590 = _3664;
            }
            float _3666 = _3590;
            float _3668 = fma(_3666, _178, _3642);
            float _3670 = fma(_3666, _176, _3640);
            float _3672 = _3638 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _3674 = -_370;
            float _3676 = _3674 + _3668;
            float _3678 = -_374;
            float _3680 = _3678 + _3670;
            float _3682 = fma(_3666, _180, _3672);
            float _3684 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _3686 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _3688 = _3676 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _3690 = -_376;
            float _3692 = _3690 + _3682;
            float _3694 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3684);
            float _3696 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3686);
            float _3698 = fma(_3680, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3688);
            float _3700 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3694);
            float _3702 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3696);
            float _3704 = fma(_3692, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3698);
            _418 = _3702;
            _420 = _3700;
            _422 = _3704;
            _3574 = _3700;
            _3580 = _3702;
            _3586 = _3704;
        }
        float _3706 = _418;
        float _3708 = _420;
        float _3710 = _422;
        float _3712 = _3574;
        float _3714 = _3580;
        float _3716 = _3586;
        float _3718 = _3706 * _3706;
        float _3720 = rsqrt(_3544);
        float _3722 = fma(_3708, _3708, _3718);
        float _3724 = fma(_3710, _3710, _3722);
        float _3726 = sqrt(_3724);
        float _3728 = _3534 * _3720;
        float _3730 = _3530 * _3720;
        float _3732 = _3538 * _3720;
        bool _3734 = _3726 > 0.0;
        bool _3736 = !_3734;
        _424 = _3724;
        _426 = _3708;
        _3560 = _3716;
        if (!_3736)
        {
            float _3738 = rsqrt(_3724);
            float _3740 = _3738 * _3706;
            float _3742 = _3738 * _3708;
            float _3744 = _3738 * _3710;
            float _3746 = _3730 * _3740;
            float _3748 = fma(_3728, _3742, _3746);
            float _3750 = fma(_3732, _3744, _3748);
            float _3752 = _3750 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3754 = fma(_3712, _3752, _3524);
            float _3756 = fma(_3714, _3752, _3522);
            float _3758 = fma(_3716, _3752, _3526);
            _3554 = _3754;
            _3556 = _3756;
            _3558 = _3758;
        }
    }
    float _3760 = _3554;
    float _3762 = _3556;
    float _3764 = _3558;
    float _3766 = _424;
    float _3768 = _426;
    float _3770 = _3560;
    float _3772 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3774 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3772);
    float _3776 = _2366 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _3778 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3780 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3782 = _3778 || _3780;
    bool _3784 = isnan(0.5);
    bool _3786 = _3782 || _3784;
    float _3788 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3774);
    float _3790 = fma(_2660, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3776);
    float _3792 = _3788 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3794 = fma(_2662, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3790);
    bool _3796 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3798 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3800 = _3796 || _3798;
    bool _3802 = isnan(0.5);
    bool _3804 = _3800 || _3802;
    float _3806 = 1.0 / _3792;
    float _3808 = _3794 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3810 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _3812 = _3788;
    float _3814 = _3808;
    float _3816 = _3762;
    float _3818 = _3766;
    float _3820 = _3768;
    float _3822 = _3770;
    if (_3786)
    {
        _3810 = _3760;
    }
    float _3824 = _3810;
    float _3826 = _3808 + _3792;
    float _3828 = _3824;
    if (_3786)
    {
        _3812 = _3762;
    }
    float _3830 = _3812;
    float _3832 = _3830;
    if (_3786)
    {
        _3814 = _3764;
    }
    float _3834 = _3814;
    float _3836 = _3834;
    float _3838 = _3806;
    if (!_3786)
    {
        float _3840 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3842 = _2366 + _3840;
        float _3844 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3846 = _2660 + _3844;
        float _3848 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3850 = -_2662;
        float _3852 = _3850 + _3764;
        float _3854 = _3842 * _3842;
        float _3856 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3858 = _2662 + _3856;
        float _3860 = fma(_3846, _3846, _3854);
        float _3862 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3864 = fma(_3858, _3858, _3860);
        float _3866 = sqrt(_3864);
        float _3868 = _3848 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3870 = precise::min(_3866, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _3872 = _3870 * _3862;
        float _3874 = -_2660;
        float _3876 = _3874 + _3760;
        float _3878 = _3868 * _3872;
        float _3880 = -_2366;
        float _3882 = _3880 + _3762;
        float _3884 = fma(_3876, _3878, _2660);
        float _3886 = fma(_3882, _3878, _2366);
        float _3888 = fma(_3852, _3878, _2662);
        _3832 = _3886;
        _3828 = _3884;
        _3836 = _3888;
    }
    float _3890 = _3832;
    float _3892 = _3828;
    float _3894 = _3836;
    if (_3804)
    {
        _3816 = 1.0;
    }
    float _3896 = _3816;
    float _3898 = _3826 * _3806;
    float _3900 = _3898 * 0.5;
    float _3902 = _3896;
    if (!_3804)
    {
        float _3904 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _3906 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3908 = fma(_3900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3906);
        float _3910 = _3904 * 0.15915493667125701904296875;
        float _3912 = _3910 * 6.283185482025146484375;
        float _3914 = cos(_3912);
        float _3916 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _3918 = _3916 * 0.15915493667125701904296875;
        float _3920 = _3910 * 6.283185482025146484375;
        float _3922 = sin(_3920);
        float _3924 = 1.0 / _3914;
        float _3926 = _3918 * 6.283185482025146484375;
        float _3928 = cos(_3926);
        float _3930 = _3922 * _3924;
        float _3932 = 1.0 / _3908;
        float _3934 = _3928 * _3930;
        float _3936 = _3918 * 6.283185482025146484375;
        float _3938 = sin(_3936);
        float _3940 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3942 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3940;
        float _3944 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3946 = _3932 * _3944;
        float _3948 = 1.0 / _3934;
        float _3950 = 1.0 / _3942;
        float _3952 = _3938 * _3948;
        float _3954 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3956 = fma(_3952, _3946, _3954);
        float _3958 = _3956 * _3950;
        float _3960 = precise::clamp(_3958, 0.0, 1.0);
        _3818 = _3950;
        _3838 = _3918;
        _3902 = _3960;
    }
    float _3962 = _3818;
    float _3964 = _3838;
    float _3966 = _3902;
    float _3968 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3970 = _3890 + _3968;
    float _3972 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3974 = _3892 + _3972;
    float _3976 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3978 = _3894 + _3976;
    float _3980 = _3970 * _3970;
    float _3982 = fma(_3974, _3974, _3980);
    float _3984 = fma(_3978, _3978, _3982);
    float _3986 = rsqrt(_3984);
    float _3988 = _3986 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3990 = _3974 * _3988;
    float _3992 = _3978 * _3988;
    float _3994 = _3990 * _3990;
    float _3996 = _3992 * _3992;
    float _3998 = _3994 + _3996;
    float _4000 = sqrt(_3998);
    bool _4002 = _4000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4006 = _4000 + _4004;
    float _4008 = _3978;
    float _4010 = _3964;
    float _4012 = _4006;
    float _4014 = _3990;
    if (_4002)
    {
        float _4016 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4008 = _4016;
    }
    float _4018 = _4008;
    if (_4002)
    {
        float _4020 = rsqrt(_3998);
        _4010 = _4020;
    }
    float _4022 = _4010;
    float _4024 = _4022;
    if (_4002)
    {
        float _4026 = _4006 * _4018;
        _4012 = _4026;
    }
    float _4028 = _4012;
    if (_4002)
    {
        float _4030 = _4028 * 0.15915493667125701904296875;
        _3820 = _4030;
    }
    float _4032 = _3820;
    float _4034 = _3986;
    if (_4002)
    {
        float _4036 = _4032 * 6.283185482025146484375;
        float _4038 = sin(_4036);
        _4034 = _4038;
    }
    float _4040 = _4034;
    float _4042 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4044 = precise::max(0.0, _4042);
    float _4046 = _3962;
    float _4048 = _4044;
    float _4050 = _4042;
    if (_4002)
    {
        float _4052 = _4032 * 6.283185482025146484375;
        float _4054 = cos(_4052);
        _4046 = _4054;
    }
    float _4056 = _4046;
    float _4058 = -_3988;
    float _4060 = -_4044;
    float _4062 = fma(_3970, _4058, _4060);
    float _4064 = _4062;
    if (_4002)
    {
        float _4066 = _4062 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4048 = _4066;
    }
    float _4068 = _4048;
    float _4070 = sqrt(_3984);
    float _4072 = _4040;
    float _4074 = _4068;
    if (_4002)
    {
        float _4076 = fma(_4040, _4068, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4072 = _4076;
    }
    float _4078 = _4072;
    float _4080 = _4078;
    if (!_4002)
    {
        _4074 = _3994;
    }
    float _4082 = _4074;
    float _4084 = _4082;
    if (_4002)
    {
        float _4086 = _4056 + (-1.0);
        _4050 = _4086;
    }
    float _4088 = _4050;
    float _4090 = _4088;
    if (_4002)
    {
        float _4092 = _4022 * _4078;
        _3822 = _4092;
    }
    float _4094 = _3822;
    if (!_4002)
    {
        _4080 = _4062;
    }
    float _4096 = _4080;
    float _4098 = _4096;
    if (_4002)
    {
        float _4100 = _4088 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4024 = _4100;
    }
    float _4102 = _4024;
    if (_4002)
    {
        float _4104 = _3990 * _4094;
        _4014 = _4104;
    }
    float _4106 = _4014;
    if (!_4002)
    {
        _4090 = _3992;
    }
    float _4108 = _4090;
    float _4110 = _4108;
    if (_4002)
    {
        float _4112 = _3992 * _4094;
        _4110 = _4112;
    }
    float _4114 = _4110;
    if (_4002)
    {
        float _4116 = fma(_4062, _4056, _4102);
        _4098 = _4116;
    }
    float _4118 = _4098;
    if (_4002)
    {
        float _4120 = _4106 * _4106;
        _4084 = _4120;
    }
    float _4122 = _4084;
    if (!_4002)
    {
        _4064 = _3996;
    }
    float _4124 = _4064;
    float _4126 = _4124;
    if (_4002)
    {
        float _4128 = _4114 * _4114;
        _4126 = _4128;
    }
    float _4130 = _4126;
    float _4132 = fma(_4118, _4118, _4122);
    float _4134 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4136 = _4132 + _4130;
    float _4138 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4142 = fma(_4070, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4140);
    float _4144 = precise::clamp(_4142, 0.0, 1.0);
    float _4146 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4148 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4138);
    float _4150 = rsqrt(_4136);
    float _4152 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4154 = -_4144;
    float _4156 = _4154 + 1.0;
    float _4158 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4148);
    float _4160 = _3890 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4162 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4152);
    float _4164 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4146);
    float _4166 = _4158 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4168 = fma(_3892, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4160);
    float _4170 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4162);
    float _4172 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4164);
    float _4174 = _4166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4176 = abs(_4156);
    float _4178 = log2(_4176);
    float _4180 = _4170 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4182 = fma(_3894, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4168);
    float _4184 = -_4174;
    float _4186 = fma(_4184, _4134, 1.0);
    float _4188 = _4150 * _4106;
    float _4190 = _4172 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4192 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4194 = _4150 * _4118;
    float _4196 = _4188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4198 = _4150 * _4114;
    float _4200 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4192);
    float _4202 = _4182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4204 = -_4196;
    float _4206 = fma(_4194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4204);
    float _4208 = log2(_4186);
    float _4210 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4200);
    float _4212 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4214 = -_4198;
    float _4216 = fma(_4214, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4206);
    float _4218 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4220 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4210);
    float _4222 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4224 = fma(_4216, -0.5, 0.5);
    float _4226 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4212);
    float _4228 = 1.0 / _4220;
    float _4230 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4222);
    float _4232 = fma(_4216, 0.5, 0.5);
    float _4234 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4226);
    float _4236 = _4194 + 1.0;
    float _4238 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4230);
    float _4240 = fma(_4232, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4242 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4234);
    float _4244 = exp2(_4218);
    float _4246 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4238);
    float _4248 = fma(_4232, _4240, -0.212114393711090087890625);
    float _4250 = _4208 * 0.693147182464599609375;
    float _4252 = fma(_4232, _4248, 1.570728778839111328125);
    float _4254 = sqrt(_4224);
    float _4256 = _4242 * _4228;
    float _4258 = _4246 * _4228;
    float _4260 = fma(_4256, 0.5, 0.5);
    float _4262 = fma(_4258, -0.5, 0.5);
    float _4264 = -_4194;
    float _4266 = fma(_4244, _4236, _4264);
    float _4268 = _4250 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4270 = fma(_4266, 0.5, 0.5);
    float _4272 = _4254 * 0.636619746685028076171875;
    float3 _11105 = float3(_4260, _4262, _4268);
    float _4274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11105, float3(0.0), isnan(_11105)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11105, float3(0.0), isnan(_11105)), level(0.0)).x;
    float3 _11116 = float3(_4260, _4262, _4268);
    float4 _4277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11116, float3(0.0), isnan(_11116)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11116, float3(0.0), isnan(_11116)), level(0.0)).xyzw;
    float _4279 = _4277.x;
    float _4281 = _4277.y;
    float _4283 = _4277.z;
    float _4285 = _4277.w;
    float _4287 = -_4252;
    float _4289 = fma(_4272, _4287, 1.0);
    float2 _11138 = float2(_4289, _4270);
    float3 _4293 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11138, float2(0.0), isnan(_11138)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11138, float2(0.0), isnan(_11138)), level(0.0)).xyz;
    float _4295 = _4293.x;
    float _4297 = _4293.y;
    float _4299 = _4293.z;
    float _4301 = _4178 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4303 = _4180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4305 = _4220 * 0.5;
    bool _4307 = _3966 > 0.0;
    bool _4309 = isnan(_3966);
    bool _4311 = _4307 || _4309;
    bool _4313 = isnan(0.0);
    bool _4315 = _4311 || _4313;
    float _4317 = _3966 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4319 = fma(_4190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4303);
    float _4321 = exp2(_4301);
    float _4323 = fma(_4246, -0.5, _4305);
    float _4325 = fma(_4166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4319);
    out.m_47.x = _4317;
    float _4327 = fma(_4202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4325);
    float _4329 = _4242 + _4220;
    float _4331 = _4327 + _4220;
    float _4333 = _4329 * 0.5;
    out.gl_Position.x = _4242;
    out.gl_Position.y = _4246;
    out.gl_Position.z = _4327;
    out.gl_Position.w = _4220;
    float _4335 = _4331 * 0.5;
    float _4337 = -_4321;
    float _4339 = _4337 + 1.0;
    float _4341 = _4339 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_81.x = _4333;
    out.m_81.y = _4323;
    out.m_81.z = _4335;
    out.m_81.w = _4220;
    float _4343 = _4341 * _4274;
    float _4345 = -_4341;
    float _4347 = _4345 + 1.0;
    float _4349 = _4285 * _4343;
    float _4351 = _4285 * _4347;
    float _4353 = _4299 * _4343;
    float _4355 = fma(_4295, _4349, _4279);
    float _4357 = fma(_4297, _4349, _4281);
    float _4359 = fma(_4285, _4353, _4283);
    out.m_83.x = _4355;
    out.m_83.y = _4357;
    out.m_83.z = _4359;
    out.m_83.w = _4351;
    if (_4315)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _4361 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4361;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

