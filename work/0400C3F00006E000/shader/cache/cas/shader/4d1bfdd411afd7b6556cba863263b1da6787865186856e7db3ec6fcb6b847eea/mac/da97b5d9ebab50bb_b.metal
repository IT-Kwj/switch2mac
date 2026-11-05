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
    float4 m_57 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_53 [[user(locn3)]];
    float4 m_73 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_69 [[user(locn8)]];
    float4 m_63 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_65 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _722 = false;
    bool _626 = false;
    bool _454 = false;
    bool _294 = false;
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
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_110);
        out.gl_Position.z = _1606;
    }
    if (!_100)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _112 = in.m_47.w;
    float _114 = float(_96);
    float _116 = in.m_49.x;
    float _118 = in.m_49.y;
    float _120 = -_112;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_112);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    out.m_51.x = _116;
    bool _134 = _122 >= _114;
    bool _136 = !_132;
    bool _138 = _134 || _136;
    float _140 = 1.0 / _114;
    out.m_51.y = _118;
    float _142 = _112;
    if (_138)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _146 = 0;
    if (_138)
    {
        float _148 = _144 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    float _152 = _122 * _140;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1683 = as_type<float>(_150);
        out.gl_Position.z = _1683;
    }
    out.m_53.x = _152;
    if (_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_55.w;
    float _156 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = exp2(_210);
        float _214 = _208 * 0.693147182464599609375;
        float _216 = 1.0 / _214;
        float _218 = 1.0 / _206;
        float _220 = _212 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _216, _156);
        float _226 = _224 * _218;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _292;
    if (!_276)
    {
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _116 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        _292 = _152;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _336;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _368 = 1.0 / _332;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _316 * _354;
    float _378 = _300 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = fma(_364, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _388 * _370;
    float _396 = _390 * _370;
    float _398 = _392 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _416 = fma(_402, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_416, _356, _412);
    float _426 = fma(_418, _356, _414);
    float _428 = fma(_420, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_366;
    float _452;
    if (!_436)
    {
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _440 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        _452 = _152;
    }
    _454 = false;
    float _456 = _452;
    float _458 = in.m_55.x;
    float _460 = in.m_55.y;
    float _462 = in.m_55.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _466 = _456 + _464;
    bool _468 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _470 = isnan(_456);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = 1.0 / _486;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _492 = 1.0 / _482;
    float _494 = _434 * _462;
    float _496 = _432 * _460;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _500 = _456 + _498;
    bool _502 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _504 = isnan(_456);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _430 * _458;
    bool _516 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _518 = isnan(_456);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = _500 * _488;
    float _530 = _466 * _492;
    float _532 = -_478;
    float _534 = _532 + 1.0;
    float _536 = -_526;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _540;
    float _544 = _526 * _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _550;
    float _554 = _512 * _538;
    float _556 = fma(_542, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _558 = fma(_548, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _560 = fma(_552, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _562 = -_512;
    float _564 = _562 + 1.0;
    float _566 = _556 * _554;
    float _568 = _558 * _554;
    float _570 = _560 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].x, _568);
    float _586 = fma(_574, _528, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _588 = fma(_578, _528, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _590 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].y, _570);
    float _592 = fma(_582, _528, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _594 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _596 = fma(_586, _544, _584);
    float _598 = fma(_588, _544, _590);
    float _600 = fma(_592, _544, _594);
    float _602 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].x, _596);
    float _604 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].y, _598);
    float _606 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].z, _600);
    bool _608 = !_490;
    float _624;
    if (!_608)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _612 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        _624 = _152;
    }
    _626 = false;
    float _628 = _624;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _628 + _630;
    bool _634 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = isnan(_628);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _650 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _652 = isnan(_628);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _662;
    float _666 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = -_644;
    float _670 = _668 + 1.0;
    bool _672 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _674 = 1.0 / _648;
    float _676 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _660 * _670;
    float _680 = -_660;
    float _682 = _680 + 1.0;
    float _684 = _664 * _674;
    float _686 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_684, _632, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _688 * _678;
    float _694 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _696 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[115].x, _692);
    float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[116].x, _696);
    float _702 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _676;
    out.m_57.y = _698;
    out.m_57.z = _690;
    out.m_57.w = _702;
    bool _704 = !_672;
    float _720;
    if (!_704)
    {
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _708 = _116 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        _720 = _152;
    }
    _722 = false;
    float _724 = _720;
    float _726 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _730 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _736 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _728);
    float _738 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _740 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _734);
    float _744 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _736);
    float _746 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _738);
    float _748 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _752 = _744 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _754 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _750 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _752 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _754 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _758 * _774;
    float _778 = _762 * _774;
    float _780 = _766 * _774;
    float _782 = -_776;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _786 = -_778;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _762);
    float _790 = -_780;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _794 = _784 * _784;
    float _796 = fma(_788, _788, _794);
    float _798 = in.m_59.x;
    float _800 = in.m_59.y;
    float _802 = in.m_59.z;
    float _804 = fma(_792, _792, _796);
    float _806 = sqrt(_804);
    float _808 = _774 * _806;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _800);
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _798);
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _802);
    float _816 = _732 * _808;
    float _818 = _740 * _808;
    float _820 = _748 * _808;
    float _822 = _816 * _810;
    float _824 = _818 * _812;
    float _826 = _820 * _814;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[10].x, _828);
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[8].x, _830);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].z, _832);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].z, _834);
    float _840 = _754 + _836;
    float _842 = _752 + _838;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _840 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _850 = _842 + _848;
    float _852 = _846 * _846;
    float _854 = fma(_850, _850, _852);
    float _856 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _858 = sqrt(_854);
    float _860 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[9].x, _856);
    float _862 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].z, _860);
    float _864 = _750 + _862;
    bool _866 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _838;
    float _870 = _860;
    float _872 = _842;
    float _874 = _850;
    if (!_866)
    {
        _868 = _840;
    }
    float _876 = _868;
    float _878 = _876;
    if (!_866)
    {
        _870 = _864;
    }
    float _880 = _870;
    bool _882 = !_866;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _858 + _888;
        float _892 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_854);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _914 = fma(_864, _902, _910);
        float _916 = _894 * _912;
        float _918 = fma(_850, _916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_846, _916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _914;
        _872 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _872;
    float _926 = _878;
    float _928 = -_776;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _922);
    float _932 = -_778;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _936 = -_780;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _946 = _934 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _950 = _938 + _948;
    float _952 = _942 * _942;
    float _954 = fma(_946, _946, _952);
    float _956 = fma(_950, _950, _954);
    float _958 = rsqrt(_956);
    float _960 = _958 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _962 = _946 * _960;
    float _964 = _950 * _960;
    float _966 = _962 * _962;
    float _968 = _964 * _964;
    float _970 = _966 + _968;
    float _972 = sqrt(_970);
    bool _974 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _972 + _976;
    float _980 = _950;
    float _982 = _970;
    float _984 = _978;
    float _986 = _960;
    if (_974)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _980 = _988;
    }
    float _990 = _980;
    if (_974)
    {
        float _992 = rsqrt(_970);
        _982 = _992;
    }
    float _994 = _982;
    if (_974)
    {
        float _996 = _978 * _990;
        _984 = _996;
    }
    float _998 = _984;
    if (_974)
    {
        float _1000 = _998 * 0.15915493667125701904296875;
        _874 = _1000;
    }
    float _1002 = _874;
    float _1004 = _952;
    if (_974)
    {
        float _1006 = _1002 * 6.283185482025146484375;
        float _1008 = sin(_1006);
        _1004 = _1008;
    }
    float _1010 = _1004;
    float _1012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1014 = precise::max(0.0, _1012);
    float _1016 = _958;
    float _1018 = _1014;
    float _1020 = _1012;
    if (_974)
    {
        float _1022 = _1002 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        _1016 = _1024;
    }
    float _1026 = _1016;
    float _1028 = -_960;
    float _1030 = -_1014;
    float _1032 = fma(_942, _1028, _1030);
    float _1034 = _1032;
    if (!_974)
    {
        _1018 = _962;
    }
    float _1036 = _1018;
    float _1038 = _1036;
    if (_974)
    {
        float _1040 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1020 = _1040;
    }
    float _1042 = _1020;
    float _1044 = _1010;
    float _1046 = _1042;
    if (_974)
    {
        float _1048 = fma(_1010, _1042, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1044 = _1048;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    float _1054 = _1026;
    if (_974)
    {
        float _1056 = _1026 + (-1.0);
        _1046 = _1056;
    }
    float _1058 = _1046;
    float _1060 = 0.0;
    float _1062 = _1058;
    if (_974)
    {
        float _1064 = _994 * _1050;
        _1060 = _1064;
    }
    float _1066 = _1060;
    if (!_974)
    {
        _1052 = _966;
    }
    float _1068 = _1052;
    float _1070 = sqrt(_956);
    float _1072 = _1068;
    if (_974)
    {
        float _1074 = _1058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _986 = _1074;
    }
    float _1076 = _986;
    if (_974)
    {
        float _1078 = _962 * _1066;
        _1038 = _1078;
    }
    float _1080 = _1038;
    if (!_974)
    {
        _1062 = _964;
    }
    float _1082 = _1062;
    float _1084 = _1082;
    if (_974)
    {
        float _1086 = _964 * _1066;
        _1084 = _1086;
    }
    float _1088 = _1084;
    if (_974)
    {
        float _1090 = fma(_1032, _1026, _1076);
        _1034 = _1090;
    }
    float _1092 = _1034;
    if (_974)
    {
        float _1094 = _1080 * _1080;
        _1072 = _1094;
    }
    float _1096 = _1072;
    if (!_974)
    {
        _1054 = _968;
    }
    float _1098 = _1054;
    float _1100 = _1098;
    if (_974)
    {
        float _1102 = _1088 * _1088;
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = fma(_1092, _1092, _1096);
    float _1108 = _1106 + _1104;
    float _1110 = _930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1114 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1112);
    float _1116 = precise::clamp(_1114, 0.0, 1.0);
    float _1118 = _930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = rsqrt(_1108);
    float _1122 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1110);
    float _1124 = -_1116;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1132 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1122);
    float _1134 = _930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1128);
    float _1138 = abs(_1126);
    float _1140 = log2(_1138);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1144 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1146 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1148 = _930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1152 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1144);
    float _1154 = _1120 * _1080;
    float _1156 = -_1150;
    float _1158 = fma(_1156, _1130, 1.0);
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1164 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1166 = _1120 * _1092;
    float _1168 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1170 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1162);
    float _1172 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1174 = _1120 * _1088;
    float _1176 = -_1168;
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1176);
    float _1180 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = -_1174;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1178);
    float _1190 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1180);
    float _1194 = exp2(_1184);
    float _1196 = fma(_1188, -0.5, 0.5);
    float _1198 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1202 = fma(_1188, 0.5, 0.5);
    float _1204 = _1166 + 1.0;
    float _1206 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1200);
    float _1210 = log2(_1158);
    float _1212 = fma(_1202, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1214 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1208);
    float _1218 = fma(_1202, _1212, -0.212114393711090087890625);
    float _1220 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1222 = 1.0 / _1192;
    float _1224 = -_1166;
    float _1226 = fma(_1194, _1204, _1224);
    float _1228 = fma(_1202, _1218, 1.570728778839111328125);
    float _1230 = fma(_1226, 0.5, 0.5);
    float _1232 = sqrt(_1196);
    float _1234 = _1210 * 0.693147182464599609375;
    float _1236 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1238 = _1216 * _1222;
    float _1240 = _1220 * _1222;
    float _1242 = fma(_1238, 0.5, 0.5);
    float _1244 = fma(_1240, -0.5, 0.5);
    float _1246 = _1232 * 0.636619746685028076171875;
    float3 _3500 = float3(_1242, _1244, _1236);
    float _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3500, float3(0.0), isnan(_3500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3500, float3(0.0), isnan(_3500)), level(0.0)).x;
    float3 _3511 = float3(_1242, _1244, _1236);
    float4 _1251 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3511, float3(0.0), isnan(_3511)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3511, float3(0.0), isnan(_3511)), level(0.0)).xyzw;
    float _1253 = _1251.x;
    float _1255 = _1251.y;
    float _1257 = _1251.z;
    float _1259 = _1251.w;
    float _1261 = -_1228;
    float _1263 = fma(_1246, _1261, 1.0);
    float2 _3533 = float2(_1263, _1230);
    float3 _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3533, float2(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3533, float2(0.0), isnan(_3533)), level(0.0)).xyz;
    float _1269 = _1267.x;
    float _1271 = _1267.y;
    float _1273 = _1267.z;
    float _1275 = in.m_61.y;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1279 = in.m_49.z;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1291 = _1289 != 0;
    float _1293 = 1.0 / _1283;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _934;
    out.m_63.y = _930;
    out.m_63.z = _938;
    float _1301 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1305 = _1303 != 0;
    float _1307 = 1.0 / _1287;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1313 = in.m_61.x;
    float _1315 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1317 = -_1275;
    float _1319 = _1317 + 1.0;
    float _1321 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1301);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1325;
    bool _1329 = _1279 > 0.5;
    float _1331 = _1311 * _1293;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1335 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1337 = isnan(_724);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1343 = _1339 || _1341;
    float _1345 = float(_1343);
    float _1347 = exp2(_1315);
    float _1349 = _1275;
    float _1351 = _1319;
    float _1353 = _1279;
    if (_1291)
    {
        float _1355 = _1329 ? _1319 : _1275;
        _1349 = _1355;
    }
    float _1357 = _1349;
    float _1359 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1333);
    if (_1297)
    {
        _1351 = _116;
    }
    float _1361 = _1351;
    float _1363 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1365 = _1361;
    if (!_1297)
    {
        _1365 = _1279;
    }
    float _1367 = _1365;
    float _1369 = _1327 * _1307;
    bool _1371 = _118 > 0.5;
    bool _1373 = _1371 && _1305;
    float _1375 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1323);
    if (_1297)
    {
        _1353 = _118;
    }
    float _1377 = _1353;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1381 = _724 + _1379;
    float _1383 = _1377;
    if (!_1297)
    {
        _1383 = _116;
    }
    float _1385 = _1383;
    float _1387 = fma(_1363, _1357, -0.5);
    bool _1389 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1391 = isnan(_724);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = fma(_1369, _1381, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1403 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1405 = isnan(_724);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1411 = _1407 || _1409;
    float _1413 = float(_1411);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1417 = _724 + _1415;
    float _1419 = 0.0;
    float _1421 = _1313;
    if (_1305)
    {
        _1419 = _1313;
    }
    float _1423 = _1419;
    float _1425 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1427 = -_1413;
    float _1429 = _1427 + 1.0;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1433 = _1423;
    if (_1373)
    {
        float _1435 = -_1423;
        float _1437 = _1435 + 1.0;
        _1433 = _1437;
    }
    float _1439 = _1433;
    float _1441 = fma(_1331, _1417, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1443 = _1345 * _1429;
    float _1445 = -_1345;
    float _1447 = _1445 + 1.0;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1305)
    {
        _1421 = _1439;
    }
    float _1451 = _1421;
    float _1453 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1359);
    float _1455 = _1399 * _1447;
    float _1457 = -_1399;
    float _1459 = _1457 + 1.0;
    float _1461 = -_1449;
    float _1463 = fma(_1425, 2.0, _1461);
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1467 = _1401 * _1455;
    float _1469 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1471 = in.m_65.w;
    float _1473 = -_122;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1463);
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1467);
    float _1479 = fma(_1469, -2.0, _1465);
    float _1481 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1375);
    float _1483 = -_1347;
    float _1485 = _1483 + 1.0;
    float _1487 = fma(_1441, _1443, _1477);
    float _1489 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1479);
    float _1491 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1495 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1487);
    float _1497 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1321);
    float _1499 = -_1489;
    float _1501 = fma(_1453, _1387, _1499);
    float _1503 = -_778;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _1507 = fma(_1491, _1451, -0.5);
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1511 = _1497 + _1509;
    float _1513 = _1501 + 0.5;
    float _1515 = -_776;
    float _1517 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1519 = -_780;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1523 = _1192 + _1511;
    float _1525 = fma(_1481, _1507, _1475);
    float _1527 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1529 = _1523 * 0.5;
    out.m_67.w = _1471;
    float _1531 = _1525 + 0.5;
    float _1533 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1531;
    out.m_69.y = _1513;
    out.m_71.w = _1527;
    out.m_73.x = _1505;
    out.m_73.y = _1517;
    out.m_73.z = _1521;
    out.gl_Position.x = _1216;
    out.gl_Position.y = _1220;
    out.gl_Position.z = _1511;
    out.gl_Position.w = _1192;
    out.m_75.z = _1529;
    out.m_75.w = _1192;
    out.m_45.x = _1533;
    float _1535 = _1493 * _1248;
    float _1537 = -_1493;
    float _1539 = _1537 + 1.0;
    float _1541 = _1259 * _1535;
    float _1543 = _1259 * _1539;
    float _1545 = _1273 * _1535;
    float _1547 = fma(_1269, _1541, _1253);
    float _1549 = fma(_1271, _1541, _1255);
    float _1551 = fma(_1259, _1545, _1257);
    out.m_77.x = _1547;
    out.m_77.y = _1549;
    out.m_77.z = _1551;
    out.m_77.w = _1543;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _722 = false;
    bool _626 = false;
    bool _454 = false;
    bool _294 = false;
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
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_110);
        out.gl_Position.z = _1606;
    }
    if (!_100)
    {
        return out;
    }
    float _112 = in.m_47.w;
    float _114 = float(_96);
    float _116 = in.m_49.x;
    float _118 = in.m_49.y;
    float _120 = -_112;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_112);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    out.m_51.x = _116;
    bool _134 = _122 >= _114;
    bool _136 = !_132;
    bool _138 = _134 || _136;
    float _140 = 1.0 / _114;
    out.m_51.y = _118;
    float _142 = _112;
    if (_138)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _146 = 0;
    if (_138)
    {
        float _148 = _144 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    float _152 = _122 * _140;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1683 = as_type<float>(_150);
        out.gl_Position.z = _1683;
    }
    out.m_53.x = _152;
    if (_138)
    {
        return out;
    }
    float _154 = in.m_55.w;
    float _156 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = exp2(_210);
        float _214 = _208 * 0.693147182464599609375;
        float _216 = 1.0 / _214;
        float _218 = 1.0 / _206;
        float _220 = _212 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _216, _156);
        float _226 = _224 * _218;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _292;
    if (!_276)
    {
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _116 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        _292 = _152;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _336;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _368 = 1.0 / _332;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _316 * _354;
    float _378 = _300 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = fma(_364, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _388 * _370;
    float _396 = _390 * _370;
    float _398 = _392 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _416 = fma(_402, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_416, _356, _412);
    float _426 = fma(_418, _356, _414);
    float _428 = fma(_420, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_366;
    float _452;
    if (!_436)
    {
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _440 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        _452 = _152;
    }
    _454 = false;
    float _456 = _452;
    float _458 = in.m_55.x;
    float _460 = in.m_55.y;
    float _462 = in.m_55.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _466 = _456 + _464;
    bool _468 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _470 = isnan(_456);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = 1.0 / _486;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _492 = 1.0 / _482;
    float _494 = _434 * _462;
    float _496 = _432 * _460;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _500 = _456 + _498;
    bool _502 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _504 = isnan(_456);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _430 * _458;
    bool _516 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _518 = isnan(_456);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = _500 * _488;
    float _530 = _466 * _492;
    float _532 = -_478;
    float _534 = _532 + 1.0;
    float _536 = -_526;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _540;
    float _544 = _526 * _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _550;
    float _554 = _512 * _538;
    float _556 = fma(_542, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _558 = fma(_548, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _560 = fma(_552, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _562 = -_512;
    float _564 = _562 + 1.0;
    float _566 = _556 * _554;
    float _568 = _558 * _554;
    float _570 = _560 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].x, _568);
    float _586 = fma(_574, _528, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _588 = fma(_578, _528, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _590 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].y, _570);
    float _592 = fma(_582, _528, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _594 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _596 = fma(_586, _544, _584);
    float _598 = fma(_588, _544, _590);
    float _600 = fma(_592, _544, _594);
    float _602 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].x, _596);
    float _604 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].y, _598);
    float _606 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].z, _600);
    bool _608 = !_490;
    float _624;
    if (!_608)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _612 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        _624 = _152;
    }
    _626 = false;
    float _628 = _624;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _628 + _630;
    bool _634 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = isnan(_628);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _650 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _652 = isnan(_628);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _662;
    float _666 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = -_644;
    float _670 = _668 + 1.0;
    bool _672 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _674 = 1.0 / _648;
    float _676 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _660 * _670;
    float _680 = -_660;
    float _682 = _680 + 1.0;
    float _684 = _664 * _674;
    float _686 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_684, _632, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _688 * _678;
    float _694 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _696 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[115].x, _692);
    float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[116].x, _696);
    float _702 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _676;
    out.m_57.y = _698;
    out.m_57.z = _690;
    out.m_57.w = _702;
    bool _704 = !_672;
    float _720;
    if (!_704)
    {
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _708 = _116 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        _720 = _152;
    }
    _722 = false;
    float _724 = _720;
    float _726 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _730 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _736 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _728);
    float _738 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _740 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _734);
    float _744 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _736);
    float _746 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _738);
    float _748 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _752 = _744 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _754 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _750 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _752 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _754 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _758 * _774;
    float _778 = _762 * _774;
    float _780 = _766 * _774;
    float _782 = -_776;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _786 = -_778;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _762);
    float _790 = -_780;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _794 = _784 * _784;
    float _796 = fma(_788, _788, _794);
    float _798 = in.m_59.x;
    float _800 = in.m_59.y;
    float _802 = in.m_59.z;
    float _804 = fma(_792, _792, _796);
    float _806 = sqrt(_804);
    float _808 = _774 * _806;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _800);
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _798);
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _802);
    float _816 = _732 * _808;
    float _818 = _740 * _808;
    float _820 = _748 * _808;
    float _822 = _816 * _810;
    float _824 = _818 * _812;
    float _826 = _820 * _814;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[10].x, _828);
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[8].x, _830);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].z, _832);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].z, _834);
    float _840 = _754 + _836;
    float _842 = _752 + _838;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _840 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _850 = _842 + _848;
    float _852 = _846 * _846;
    float _854 = fma(_850, _850, _852);
    float _856 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _858 = sqrt(_854);
    float _860 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[9].x, _856);
    float _862 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].z, _860);
    float _864 = _750 + _862;
    bool _866 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _838;
    float _870 = _860;
    float _872 = _842;
    float _874 = _850;
    if (!_866)
    {
        _868 = _840;
    }
    float _876 = _868;
    float _878 = _876;
    if (!_866)
    {
        _870 = _864;
    }
    float _880 = _870;
    bool _882 = !_866;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _858 + _888;
        float _892 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_854);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _914 = fma(_864, _902, _910);
        float _916 = _894 * _912;
        float _918 = fma(_850, _916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_846, _916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _914;
        _872 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _872;
    float _926 = _878;
    float _928 = -_776;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _922);
    float _932 = -_778;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _936 = -_780;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _946 = _934 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _950 = _938 + _948;
    float _952 = _942 * _942;
    float _954 = fma(_946, _946, _952);
    float _956 = fma(_950, _950, _954);
    float _958 = rsqrt(_956);
    float _960 = _958 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _962 = _946 * _960;
    float _964 = _950 * _960;
    float _966 = _962 * _962;
    float _968 = _964 * _964;
    float _970 = _966 + _968;
    float _972 = sqrt(_970);
    bool _974 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _972 + _976;
    float _980 = _950;
    float _982 = _970;
    float _984 = _978;
    float _986 = _960;
    if (_974)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _980 = _988;
    }
    float _990 = _980;
    if (_974)
    {
        float _992 = rsqrt(_970);
        _982 = _992;
    }
    float _994 = _982;
    if (_974)
    {
        float _996 = _978 * _990;
        _984 = _996;
    }
    float _998 = _984;
    if (_974)
    {
        float _1000 = _998 * 0.15915493667125701904296875;
        _874 = _1000;
    }
    float _1002 = _874;
    float _1004 = _952;
    if (_974)
    {
        float _1006 = _1002 * 6.283185482025146484375;
        float _1008 = sin(_1006);
        _1004 = _1008;
    }
    float _1010 = _1004;
    float _1012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1014 = precise::max(0.0, _1012);
    float _1016 = _958;
    float _1018 = _1014;
    float _1020 = _1012;
    if (_974)
    {
        float _1022 = _1002 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        _1016 = _1024;
    }
    float _1026 = _1016;
    float _1028 = -_960;
    float _1030 = -_1014;
    float _1032 = fma(_942, _1028, _1030);
    float _1034 = _1032;
    if (!_974)
    {
        _1018 = _962;
    }
    float _1036 = _1018;
    float _1038 = _1036;
    if (_974)
    {
        float _1040 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1020 = _1040;
    }
    float _1042 = _1020;
    float _1044 = _1010;
    float _1046 = _1042;
    if (_974)
    {
        float _1048 = fma(_1010, _1042, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1044 = _1048;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    float _1054 = _1026;
    if (_974)
    {
        float _1056 = _1026 + (-1.0);
        _1046 = _1056;
    }
    float _1058 = _1046;
    float _1060 = 0.0;
    float _1062 = _1058;
    if (_974)
    {
        float _1064 = _994 * _1050;
        _1060 = _1064;
    }
    float _1066 = _1060;
    if (!_974)
    {
        _1052 = _966;
    }
    float _1068 = _1052;
    float _1070 = sqrt(_956);
    float _1072 = _1068;
    if (_974)
    {
        float _1074 = _1058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _986 = _1074;
    }
    float _1076 = _986;
    if (_974)
    {
        float _1078 = _962 * _1066;
        _1038 = _1078;
    }
    float _1080 = _1038;
    if (!_974)
    {
        _1062 = _964;
    }
    float _1082 = _1062;
    float _1084 = _1082;
    if (_974)
    {
        float _1086 = _964 * _1066;
        _1084 = _1086;
    }
    float _1088 = _1084;
    if (_974)
    {
        float _1090 = fma(_1032, _1026, _1076);
        _1034 = _1090;
    }
    float _1092 = _1034;
    if (_974)
    {
        float _1094 = _1080 * _1080;
        _1072 = _1094;
    }
    float _1096 = _1072;
    if (!_974)
    {
        _1054 = _968;
    }
    float _1098 = _1054;
    float _1100 = _1098;
    if (_974)
    {
        float _1102 = _1088 * _1088;
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = fma(_1092, _1092, _1096);
    float _1108 = _1106 + _1104;
    float _1110 = _930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1114 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1112);
    float _1116 = precise::clamp(_1114, 0.0, 1.0);
    float _1118 = _930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = rsqrt(_1108);
    float _1122 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1110);
    float _1124 = -_1116;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1132 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1122);
    float _1134 = _930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1128);
    float _1138 = abs(_1126);
    float _1140 = log2(_1138);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1144 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1146 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1148 = _930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1152 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1144);
    float _1154 = _1120 * _1080;
    float _1156 = -_1150;
    float _1158 = fma(_1156, _1130, 1.0);
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1164 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1166 = _1120 * _1092;
    float _1168 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1170 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1162);
    float _1172 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1174 = _1120 * _1088;
    float _1176 = -_1168;
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1176);
    float _1180 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = -_1174;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1178);
    float _1190 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1180);
    float _1194 = exp2(_1184);
    float _1196 = fma(_1188, -0.5, 0.5);
    float _1198 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1202 = fma(_1188, 0.5, 0.5);
    float _1204 = _1166 + 1.0;
    float _1206 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1200);
    float _1210 = log2(_1158);
    float _1212 = fma(_1202, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1214 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1208);
    float _1218 = fma(_1202, _1212, -0.212114393711090087890625);
    float _1220 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1222 = 1.0 / _1192;
    float _1224 = -_1166;
    float _1226 = fma(_1194, _1204, _1224);
    float _1228 = fma(_1202, _1218, 1.570728778839111328125);
    float _1230 = fma(_1226, 0.5, 0.5);
    float _1232 = sqrt(_1196);
    float _1234 = _1210 * 0.693147182464599609375;
    float _1236 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1238 = _1216 * _1222;
    float _1240 = _1220 * _1222;
    float _1242 = fma(_1238, 0.5, 0.5);
    float _1244 = fma(_1240, -0.5, 0.5);
    float _1246 = _1232 * 0.636619746685028076171875;
    float3 _3500 = float3(_1242, _1244, _1236);
    float _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3500, float3(0.0), isnan(_3500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3500, float3(0.0), isnan(_3500)), level(0.0)).x;
    float3 _3511 = float3(_1242, _1244, _1236);
    float4 _1251 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3511, float3(0.0), isnan(_3511)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3511, float3(0.0), isnan(_3511)), level(0.0)).xyzw;
    float _1253 = _1251.x;
    float _1255 = _1251.y;
    float _1257 = _1251.z;
    float _1259 = _1251.w;
    float _1261 = -_1228;
    float _1263 = fma(_1246, _1261, 1.0);
    float2 _3533 = float2(_1263, _1230);
    float3 _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3533, float2(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3533, float2(0.0), isnan(_3533)), level(0.0)).xyz;
    float _1269 = _1267.x;
    float _1271 = _1267.y;
    float _1273 = _1267.z;
    float _1275 = in.m_61.y;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1279 = in.m_49.z;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1291 = _1289 != 0;
    float _1293 = 1.0 / _1283;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _934;
    out.m_63.y = _930;
    out.m_63.z = _938;
    float _1301 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1305 = _1303 != 0;
    float _1307 = 1.0 / _1287;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1313 = in.m_61.x;
    float _1315 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1317 = -_1275;
    float _1319 = _1317 + 1.0;
    float _1321 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1301);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1325;
    bool _1329 = _1279 > 0.5;
    float _1331 = _1311 * _1293;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1335 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1337 = isnan(_724);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1343 = _1339 || _1341;
    float _1345 = float(_1343);
    float _1347 = exp2(_1315);
    float _1349 = _1275;
    float _1351 = _1319;
    float _1353 = _1279;
    if (_1291)
    {
        float _1355 = _1329 ? _1319 : _1275;
        _1349 = _1355;
    }
    float _1357 = _1349;
    float _1359 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1333);
    if (_1297)
    {
        _1351 = _116;
    }
    float _1361 = _1351;
    float _1363 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1365 = _1361;
    if (!_1297)
    {
        _1365 = _1279;
    }
    float _1367 = _1365;
    float _1369 = _1327 * _1307;
    bool _1371 = _118 > 0.5;
    bool _1373 = _1371 && _1305;
    float _1375 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1323);
    if (_1297)
    {
        _1353 = _118;
    }
    float _1377 = _1353;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1381 = _724 + _1379;
    float _1383 = _1377;
    if (!_1297)
    {
        _1383 = _116;
    }
    float _1385 = _1383;
    float _1387 = fma(_1363, _1357, -0.5);
    bool _1389 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1391 = isnan(_724);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = fma(_1369, _1381, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1403 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1405 = isnan(_724);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1411 = _1407 || _1409;
    float _1413 = float(_1411);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1417 = _724 + _1415;
    float _1419 = 0.0;
    float _1421 = _1313;
    if (_1305)
    {
        _1419 = _1313;
    }
    float _1423 = _1419;
    float _1425 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1427 = -_1413;
    float _1429 = _1427 + 1.0;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1433 = _1423;
    if (_1373)
    {
        float _1435 = -_1423;
        float _1437 = _1435 + 1.0;
        _1433 = _1437;
    }
    float _1439 = _1433;
    float _1441 = fma(_1331, _1417, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1443 = _1345 * _1429;
    float _1445 = -_1345;
    float _1447 = _1445 + 1.0;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1305)
    {
        _1421 = _1439;
    }
    float _1451 = _1421;
    float _1453 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1359);
    float _1455 = _1399 * _1447;
    float _1457 = -_1399;
    float _1459 = _1457 + 1.0;
    float _1461 = -_1449;
    float _1463 = fma(_1425, 2.0, _1461);
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1467 = _1401 * _1455;
    float _1469 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1471 = in.m_65.w;
    float _1473 = -_122;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1463);
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1467);
    float _1479 = fma(_1469, -2.0, _1465);
    float _1481 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1375);
    float _1483 = -_1347;
    float _1485 = _1483 + 1.0;
    float _1487 = fma(_1441, _1443, _1477);
    float _1489 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1479);
    float _1491 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1495 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1487);
    float _1497 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1321);
    float _1499 = -_1489;
    float _1501 = fma(_1453, _1387, _1499);
    float _1503 = -_778;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _1507 = fma(_1491, _1451, -0.5);
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1511 = _1497 + _1509;
    float _1513 = _1501 + 0.5;
    float _1515 = -_776;
    float _1517 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1519 = -_780;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1523 = _1192 + _1511;
    float _1525 = fma(_1481, _1507, _1475);
    float _1527 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1529 = _1523 * 0.5;
    out.m_67.w = _1471;
    float _1531 = _1525 + 0.5;
    float _1533 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1531;
    out.m_69.y = _1513;
    out.m_71.w = _1527;
    out.m_73.x = _1505;
    out.m_73.y = _1517;
    out.m_73.z = _1521;
    out.gl_Position.x = _1216;
    out.gl_Position.y = _1220;
    out.gl_Position.z = _1511;
    out.gl_Position.w = _1192;
    out.m_75.z = _1529;
    out.m_75.w = _1192;
    out.m_45.x = _1533;
    float _1535 = _1493 * _1248;
    float _1537 = -_1493;
    float _1539 = _1537 + 1.0;
    float _1541 = _1259 * _1535;
    float _1543 = _1259 * _1539;
    float _1545 = _1273 * _1535;
    float _1547 = fma(_1269, _1541, _1253);
    float _1549 = fma(_1271, _1541, _1255);
    float _1551 = fma(_1259, _1545, _1257);
    out.m_77.x = _1547;
    out.m_77.y = _1549;
    out.m_77.z = _1551;
    out.m_77.w = _1543;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _722 = false;
    bool _626 = false;
    bool _454 = false;
    bool _294 = false;
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
    if (!_100)
    {
        out.m_45.x = 0.0;
    }
    int _106 = 0;
    if (!_100)
    {
        float _108 = _104 * 5.0;
        _106 = as_type<int>(_108);
    }
    int _110 = _106;
    if (!_100)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1606 = as_type<float>(_110);
        out.gl_Position.z = _1606;
    }
    if (!_100)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _112 = in.m_47.w;
    float _114 = float(_96);
    float _116 = in.m_49.x;
    float _118 = in.m_49.y;
    float _120 = -_112;
    float _122 = _120 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_112);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    out.m_51.x = _116;
    bool _134 = _122 >= _114;
    bool _136 = !_132;
    bool _138 = _134 || _136;
    float _140 = 1.0 / _114;
    out.m_51.y = _118;
    float _142 = _112;
    if (_138)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_138)
    {
        out.m_45.x = 0.0;
    }
    int _146 = 0;
    if (_138)
    {
        float _148 = _144 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    float _152 = _122 * _140;
    if (_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1683 = as_type<float>(_150);
        out.gl_Position.z = _1683;
    }
    out.m_53.x = _152;
    if (_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_55.w;
    float _156 = _122 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _158 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _160 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = in.m_47.x;
    float _170 = in.m_47.y;
    float _172 = in.m_47.z;
    float _174 = in.m_42.x;
    float _176 = in.m_42.y;
    float _178 = in.m_42.z;
    float _180 = 0.0;
    float _182 = _156;
    if (!_166)
    {
        float _184 = _156 * _156;
        float _186 = _184 * 0.5;
        _180 = _186;
    }
    float _188 = _180;
    float _190 = _188;
    if (!_166)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_166;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _156 * _202;
        float _212 = exp2(_210);
        float _214 = _208 * 0.693147182464599609375;
        float _216 = 1.0 / _214;
        float _218 = 1.0 / _206;
        float _220 = _212 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _216, _156);
        float _226 = _224 * _218;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_166;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _156 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = fma(_254, _168, _258);
    float _266 = fma(_254, _170, _260);
    float _268 = fma(_254, _172, _262);
    float _270 = fma(_264, _154, _174);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
    bool _276 = !_256;
    float _292;
    if (!_276)
    {
        float _278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _280 = _116 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _282 = fma(_280, (*spvDescriptorSet0.vp_c9)._m0[12].x, _122);
        float _284 = _282 * _278;
        float _286 = floor(_284);
        float _288 = -_286;
        float _290 = _284 + _288;
        _292 = _290;
        _294 = true;
    }
    else
    {
        _292 = _152;
    }
    _294 = false;
    float _296 = _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _300 = _296 + _298;
    bool _302 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _304 = isnan(_296);
    bool _306 = _302 || _304;
    bool _308 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _310 = _306 || _308;
    float _312 = float(_310);
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _296 + _314;
    bool _318 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _320 = isnan(_296);
    bool _322 = _318 || _320;
    bool _324 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _326 = _322 || _324;
    float _328 = float(_326);
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _338 = _296 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _340 = isnan(_296);
    bool _342 = _338 || _340;
    bool _344 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _346 = _342 || _344;
    float _348 = float(_346);
    float _350 = -_312;
    float _352 = _350 + 1.0;
    float _354 = 1.0 / _336;
    float _356 = _348 * _352;
    float _358 = -_348;
    float _360 = _358 + 1.0;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _362;
    bool _366 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _368 = 1.0 / _332;
    float _370 = _328 * _360;
    float _372 = -_328;
    float _374 = _372 + 1.0;
    float _376 = _316 * _354;
    float _378 = _300 * _368;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _380;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _384;
    float _388 = fma(_364, _378, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _390 = fma(_382, _378, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _392 = fma(_386, _378, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _394 = _388 * _370;
    float _396 = _390 * _370;
    float _398 = _392 * _370;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _402 = _400 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _394);
    float _414 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _396);
    float _416 = fma(_402, _376, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = fma(_406, _376, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _376, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _398);
    float _424 = fma(_416, _356, _412);
    float _426 = fma(_418, _356, _414);
    float _428 = fma(_420, _356, _422);
    float _430 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].x, _424);
    float _432 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].y, _426);
    float _434 = fma(_312, (*spvDescriptorSet0.vp_c9)._m0[145].z, _428);
    bool _436 = !_366;
    float _452;
    if (!_436)
    {
        float _438 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _440 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _442 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[11].x, _122);
        float _444 = _442 * _438;
        float _446 = floor(_444);
        float _448 = -_446;
        float _450 = _444 + _448;
        _452 = _450;
        _454 = true;
    }
    else
    {
        _452 = _152;
    }
    _454 = false;
    float _456 = _452;
    float _458 = in.m_55.x;
    float _460 = in.m_55.y;
    float _462 = in.m_55.z;
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _466 = _456 + _464;
    bool _468 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _470 = isnan(_456);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _480;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _488 = 1.0 / _486;
    bool _490 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _492 = 1.0 / _482;
    float _494 = _434 * _462;
    float _496 = _432 * _460;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _500 = _456 + _498;
    bool _502 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _504 = isnan(_456);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = _430 * _458;
    bool _516 = _456 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _518 = isnan(_456);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = _500 * _488;
    float _530 = _466 * _492;
    float _532 = -_478;
    float _534 = _532 + 1.0;
    float _536 = -_526;
    float _538 = _536 + 1.0;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _540;
    float _544 = _526 * _534;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _548 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _546;
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _552 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _550;
    float _554 = _512 * _538;
    float _556 = fma(_542, _530, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _558 = fma(_548, _530, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _560 = fma(_552, _530, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _562 = -_512;
    float _564 = _562 + 1.0;
    float _566 = _556 * _554;
    float _568 = _558 * _554;
    float _570 = _560 * _554;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _574 = _572 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _582 = _580 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _584 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].x, _568);
    float _586 = fma(_574, _528, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _588 = fma(_578, _528, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _590 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].y, _570);
    float _592 = fma(_582, _528, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _594 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[107].z, _566);
    float _596 = fma(_586, _544, _584);
    float _598 = fma(_588, _544, _590);
    float _600 = fma(_592, _544, _594);
    float _602 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].x, _596);
    float _604 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].y, _598);
    float _606 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[109].z, _600);
    bool _608 = !_490;
    float _624;
    if (!_608)
    {
        float _610 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _612 = _116 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _614 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[11].y, _122);
        float _616 = _614 * _610;
        float _618 = floor(_616);
        float _620 = -_618;
        float _622 = _616 + _620;
        _624 = _622;
        _626 = true;
    }
    else
    {
        _624 = _152;
    }
    _626 = false;
    float _628 = _624;
    float _630 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _632 = _628 + _630;
    bool _634 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _636 = isnan(_628);
    bool _638 = _634 || _636;
    bool _640 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _642 = _638 || _640;
    float _644 = float(_642);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _650 = _628 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _652 = isnan(_628);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _662;
    float _666 = _602 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _668 = -_644;
    float _670 = _668 + 1.0;
    bool _672 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _674 = 1.0 / _648;
    float _676 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _678 = _660 * _670;
    float _680 = -_660;
    float _682 = _680 + 1.0;
    float _684 = _664 * _674;
    float _686 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = fma(_684, _632, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _690 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _688 * _678;
    float _694 = _604 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _696 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[115].x, _692);
    float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _700 = fma(_644, (*spvDescriptorSet0.vp_c9)._m0[116].x, _696);
    float _702 = _700 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _676;
    out.m_57.y = _698;
    out.m_57.z = _690;
    out.m_57.w = _702;
    bool _704 = !_672;
    float _720;
    if (!_704)
    {
        float _706 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _708 = _116 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _710 = fma(_708, (*spvDescriptorSet0.vp_c9)._m0[11].w, _122);
        float _712 = _710 * _706;
        float _714 = floor(_712);
        float _716 = -_714;
        float _718 = _712 + _716;
        _720 = _718;
        _722 = true;
    }
    else
    {
        _720 = _152;
    }
    _722 = false;
    float _724 = _720;
    float _726 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _728 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _730 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _732 = _496 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _734 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[5].x, _726);
    float _736 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[4].x, _728);
    float _738 = fma(_270, (*spvDescriptorSet0.vp_c10)._m0[6].x, _730);
    float _740 = _514 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _742 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].z, _734);
    float _744 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].z, _736);
    float _746 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].z, _738);
    float _748 = _494 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _750 = _742 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _752 = _744 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _754 = _746 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _756 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _758 = _750 + _756;
    float _760 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _762 = _752 + _760;
    float _764 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _766 = _754 + _764;
    float _768 = _758 * _758;
    float _770 = fma(_762, _762, _768);
    float _772 = fma(_766, _766, _770);
    float _774 = rsqrt(_772);
    float _776 = _758 * _774;
    float _778 = _762 * _774;
    float _780 = _766 * _774;
    float _782 = -_776;
    float _784 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[18].w, _758);
    float _786 = -_778;
    float _788 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[18].w, _762);
    float _790 = -_780;
    float _792 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[18].w, _766);
    float _794 = _784 * _784;
    float _796 = fma(_788, _788, _794);
    float _798 = in.m_59.x;
    float _800 = in.m_59.y;
    float _802 = in.m_59.z;
    float _804 = fma(_792, _792, _796);
    float _806 = sqrt(_804);
    float _808 = _774 * _806;
    float _810 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _800);
    float _812 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _798);
    float _814 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _802);
    float _816 = _732 * _808;
    float _818 = _740 * _808;
    float _820 = _748 * _808;
    float _822 = _816 * _810;
    float _824 = _818 * _812;
    float _826 = _820 * _814;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _830 = _822 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _832 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[10].x, _828);
    float _834 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[8].x, _830);
    float _836 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[10].z, _832);
    float _838 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[8].z, _834);
    float _840 = _754 + _836;
    float _842 = _752 + _838;
    float _844 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _846 = _840 + _844;
    float _848 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _850 = _842 + _848;
    float _852 = _846 * _846;
    float _854 = fma(_850, _850, _852);
    float _856 = _822 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _858 = sqrt(_854);
    float _860 = fma(_824, (*spvDescriptorSet0.vp_c10)._m0[9].x, _856);
    float _862 = fma(_826, (*spvDescriptorSet0.vp_c10)._m0[9].z, _860);
    float _864 = _750 + _862;
    bool _866 = _858 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _868 = _838;
    float _870 = _860;
    float _872 = _842;
    float _874 = _850;
    if (!_866)
    {
        _868 = _840;
    }
    float _876 = _868;
    float _878 = _876;
    if (!_866)
    {
        _870 = _864;
    }
    float _880 = _870;
    bool _882 = !_866;
    float _884 = _880;
    if (!_882)
    {
        float _886 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _888 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _890 = _858 + _888;
        float _892 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _894 = rsqrt(_854);
        float _896 = _890 * _886;
        float _898 = _896 * 0.15915493667125701904296875;
        float _900 = _898 * 6.283185482025146484375;
        float _902 = cos(_900);
        float _904 = _898 * 6.283185482025146484375;
        float _906 = sin(_904);
        float _908 = _902 + (-1.0);
        float _910 = _908 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _912 = fma(_906, _892, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _914 = fma(_864, _902, _910);
        float _916 = _894 * _912;
        float _918 = fma(_850, _916, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _920 = fma(_846, _916, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _884 = _914;
        _872 = _918;
        _878 = _920;
    }
    float _922 = _884;
    float _924 = _872;
    float _926 = _878;
    float _928 = -_776;
    float _930 = fma(_928, (*spvDescriptorSet0.vp_c9)._m0[18].w, _922);
    float _932 = -_778;
    float _934 = fma(_932, (*spvDescriptorSet0.vp_c9)._m0[18].w, _924);
    float _936 = -_780;
    float _938 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[18].w, _926);
    float _940 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _942 = _930 + _940;
    float _944 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _946 = _934 + _944;
    float _948 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _950 = _938 + _948;
    float _952 = _942 * _942;
    float _954 = fma(_946, _946, _952);
    float _956 = fma(_950, _950, _954);
    float _958 = rsqrt(_956);
    float _960 = _958 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _962 = _946 * _960;
    float _964 = _950 * _960;
    float _966 = _962 * _962;
    float _968 = _964 * _964;
    float _970 = _966 + _968;
    float _972 = sqrt(_970);
    bool _974 = _972 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _976 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _978 = _972 + _976;
    float _980 = _950;
    float _982 = _970;
    float _984 = _978;
    float _986 = _960;
    if (_974)
    {
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _980 = _988;
    }
    float _990 = _980;
    if (_974)
    {
        float _992 = rsqrt(_970);
        _982 = _992;
    }
    float _994 = _982;
    if (_974)
    {
        float _996 = _978 * _990;
        _984 = _996;
    }
    float _998 = _984;
    if (_974)
    {
        float _1000 = _998 * 0.15915493667125701904296875;
        _874 = _1000;
    }
    float _1002 = _874;
    float _1004 = _952;
    if (_974)
    {
        float _1006 = _1002 * 6.283185482025146484375;
        float _1008 = sin(_1006);
        _1004 = _1008;
    }
    float _1010 = _1004;
    float _1012 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1014 = precise::max(0.0, _1012);
    float _1016 = _958;
    float _1018 = _1014;
    float _1020 = _1012;
    if (_974)
    {
        float _1022 = _1002 * 6.283185482025146484375;
        float _1024 = cos(_1022);
        _1016 = _1024;
    }
    float _1026 = _1016;
    float _1028 = -_960;
    float _1030 = -_1014;
    float _1032 = fma(_942, _1028, _1030);
    float _1034 = _1032;
    if (!_974)
    {
        _1018 = _962;
    }
    float _1036 = _1018;
    float _1038 = _1036;
    if (_974)
    {
        float _1040 = _1032 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1020 = _1040;
    }
    float _1042 = _1020;
    float _1044 = _1010;
    float _1046 = _1042;
    if (_974)
    {
        float _1048 = fma(_1010, _1042, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1044 = _1048;
    }
    float _1050 = _1044;
    float _1052 = _1050;
    float _1054 = _1026;
    if (_974)
    {
        float _1056 = _1026 + (-1.0);
        _1046 = _1056;
    }
    float _1058 = _1046;
    float _1060 = 0.0;
    float _1062 = _1058;
    if (_974)
    {
        float _1064 = _994 * _1050;
        _1060 = _1064;
    }
    float _1066 = _1060;
    if (!_974)
    {
        _1052 = _966;
    }
    float _1068 = _1052;
    float _1070 = sqrt(_956);
    float _1072 = _1068;
    if (_974)
    {
        float _1074 = _1058 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _986 = _1074;
    }
    float _1076 = _986;
    if (_974)
    {
        float _1078 = _962 * _1066;
        _1038 = _1078;
    }
    float _1080 = _1038;
    if (!_974)
    {
        _1062 = _964;
    }
    float _1082 = _1062;
    float _1084 = _1082;
    if (_974)
    {
        float _1086 = _964 * _1066;
        _1084 = _1086;
    }
    float _1088 = _1084;
    if (_974)
    {
        float _1090 = fma(_1032, _1026, _1076);
        _1034 = _1090;
    }
    float _1092 = _1034;
    if (_974)
    {
        float _1094 = _1080 * _1080;
        _1072 = _1094;
    }
    float _1096 = _1072;
    if (!_974)
    {
        _1054 = _968;
    }
    float _1098 = _1054;
    float _1100 = _1098;
    if (_974)
    {
        float _1102 = _1088 * _1088;
        _1100 = _1102;
    }
    float _1104 = _1100;
    float _1106 = fma(_1092, _1092, _1096);
    float _1108 = _1106 + _1104;
    float _1110 = _930 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1114 = fma(_1070, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1112);
    float _1116 = precise::clamp(_1114, 0.0, 1.0);
    float _1118 = _930 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1120 = rsqrt(_1108);
    float _1122 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1110);
    float _1124 = -_1116;
    float _1126 = _1124 + 1.0;
    float _1128 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1118);
    float _1130 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1132 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1122);
    float _1134 = _930 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1136 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1128);
    float _1138 = abs(_1126);
    float _1140 = log2(_1138);
    float _1142 = _1132 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1144 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1134);
    float _1146 = _1136 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1148 = _930 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1150 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1152 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1144);
    float _1154 = _1120 * _1080;
    float _1156 = -_1150;
    float _1158 = fma(_1156, _1130, 1.0);
    float _1160 = _1152 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1162 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1164 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1148);
    float _1166 = _1120 * _1092;
    float _1168 = _1154 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1170 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1162);
    float _1172 = fma(_938, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1164);
    float _1174 = _1120 * _1088;
    float _1176 = -_1168;
    float _1178 = fma(_1166, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1176);
    float _1180 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1170);
    float _1182 = _1172 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1184 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1186 = -_1174;
    float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1178);
    float _1190 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1192 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1180);
    float _1194 = exp2(_1184);
    float _1196 = fma(_1188, -0.5, 0.5);
    float _1198 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1200 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1190);
    float _1202 = fma(_1188, 0.5, 0.5);
    float _1204 = _1166 + 1.0;
    float _1206 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1198);
    float _1208 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1200);
    float _1210 = log2(_1158);
    float _1212 = fma(_1202, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1214 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1206);
    float _1216 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1208);
    float _1218 = fma(_1202, _1212, -0.212114393711090087890625);
    float _1220 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1214);
    float _1222 = 1.0 / _1192;
    float _1224 = -_1166;
    float _1226 = fma(_1194, _1204, _1224);
    float _1228 = fma(_1202, _1218, 1.570728778839111328125);
    float _1230 = fma(_1226, 0.5, 0.5);
    float _1232 = sqrt(_1196);
    float _1234 = _1210 * 0.693147182464599609375;
    float _1236 = _1234 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1238 = _1216 * _1222;
    float _1240 = _1220 * _1222;
    float _1242 = fma(_1238, 0.5, 0.5);
    float _1244 = fma(_1240, -0.5, 0.5);
    float _1246 = _1232 * 0.636619746685028076171875;
    float3 _3500 = float3(_1242, _1244, _1236);
    float _1248 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3500, float3(0.0), isnan(_3500)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3500, float3(0.0), isnan(_3500)), level(0.0)).x;
    float3 _3511 = float3(_1242, _1244, _1236);
    float4 _1251 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3511, float3(0.0), isnan(_3511)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3511, float3(0.0), isnan(_3511)), level(0.0)).xyzw;
    float _1253 = _1251.x;
    float _1255 = _1251.y;
    float _1257 = _1251.z;
    float _1259 = _1251.w;
    float _1261 = -_1228;
    float _1263 = fma(_1246, _1261, 1.0);
    float2 _3533 = float2(_1263, _1230);
    float3 _1267 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3533, float2(0.0), isnan(_3533)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3533, float2(0.0), isnan(_3533)), level(0.0)).xyz;
    float _1269 = _1267.x;
    float _1271 = _1267.y;
    float _1273 = _1267.z;
    float _1275 = in.m_61.y;
    float _1277 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1279 = in.m_49.z;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1287 = _1285 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1291 = _1289 != 0;
    float _1293 = 1.0 / _1283;
    int _1295 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1297 = _1295 != 0;
    float _1299 = _1146 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_63.x = _934;
    out.m_63.y = _930;
    out.m_63.z = _938;
    float _1301 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1299);
    int _1303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1305 = _1303 != 0;
    float _1307 = 1.0 / _1287;
    float _1309 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1311 = _1309 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1313 = in.m_61.x;
    float _1315 = _1140 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1317 = -_1275;
    float _1319 = _1317 + 1.0;
    float _1321 = fma(_1142, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1301);
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1327 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1325;
    bool _1329 = _1279 > 0.5;
    float _1331 = _1311 * _1293;
    float _1333 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _1335 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1337 = isnan(_724);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1343 = _1339 || _1341;
    float _1345 = float(_1343);
    float _1347 = exp2(_1315);
    float _1349 = _1275;
    float _1351 = _1319;
    float _1353 = _1279;
    if (_1291)
    {
        float _1355 = _1329 ? _1319 : _1275;
        _1349 = _1355;
    }
    float _1357 = _1349;
    float _1359 = fma(_118, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1333);
    if (_1297)
    {
        _1351 = _116;
    }
    float _1361 = _1351;
    float _1363 = _1277 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1365 = _1361;
    if (!_1297)
    {
        _1365 = _1279;
    }
    float _1367 = _1365;
    float _1369 = _1327 * _1307;
    bool _1371 = _118 > 0.5;
    bool _1373 = _1371 && _1305;
    float _1375 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1323);
    if (_1297)
    {
        _1353 = _118;
    }
    float _1377 = _1353;
    float _1379 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1381 = _724 + _1379;
    float _1383 = _1377;
    if (!_1297)
    {
        _1383 = _116;
    }
    float _1385 = _1383;
    float _1387 = fma(_1363, _1357, -0.5);
    bool _1389 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1391 = isnan(_724);
    bool _1393 = _1389 || _1391;
    bool _1395 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1397 = _1393 || _1395;
    float _1399 = float(_1397);
    float _1401 = fma(_1369, _1381, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1403 = _724 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1405 = isnan(_724);
    bool _1407 = _1403 || _1405;
    bool _1409 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1411 = _1407 || _1409;
    float _1413 = float(_1411);
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1417 = _724 + _1415;
    float _1419 = 0.0;
    float _1421 = _1313;
    if (_1305)
    {
        _1419 = _1313;
    }
    float _1423 = _1419;
    float _1425 = _1367 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1427 = -_1413;
    float _1429 = _1427 + 1.0;
    float _1431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1433 = _1423;
    if (_1373)
    {
        float _1435 = -_1423;
        float _1437 = _1435 + 1.0;
        _1433 = _1437;
    }
    float _1439 = _1433;
    float _1441 = fma(_1331, _1417, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1443 = _1345 * _1429;
    float _1445 = -_1345;
    float _1447 = _1445 + 1.0;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (_1305)
    {
        _1421 = _1439;
    }
    float _1451 = _1421;
    float _1453 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1359);
    float _1455 = _1399 * _1447;
    float _1457 = -_1399;
    float _1459 = _1457 + 1.0;
    float _1461 = -_1449;
    float _1463 = fma(_1425, 2.0, _1461);
    float _1465 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1467 = _1401 * _1455;
    float _1469 = _1385 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1471 = in.m_65.w;
    float _1473 = -_122;
    float _1475 = fma(_1473, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1463);
    float _1477 = fma(_1459, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1467);
    float _1479 = fma(_1469, -2.0, _1465);
    float _1481 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1375);
    float _1483 = -_1347;
    float _1485 = _1483 + 1.0;
    float _1487 = fma(_1441, _1443, _1477);
    float _1489 = fma(_122, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1479);
    float _1491 = _1431 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1493 = _1485 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1495 = fma(_1413, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1487);
    float _1497 = fma(_1182, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1321);
    float _1499 = -_1489;
    float _1501 = fma(_1453, _1387, _1499);
    float _1503 = -_778;
    float _1505 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[18].w, _752);
    float _1507 = fma(_1491, _1451, -0.5);
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _1511 = _1497 + _1509;
    float _1513 = _1501 + 0.5;
    float _1515 = -_776;
    float _1517 = fma(_1515, (*spvDescriptorSet0.vp_c9)._m0[18].w, _750);
    float _1519 = -_780;
    float _1521 = fma(_1519, (*spvDescriptorSet0.vp_c9)._m0[18].w, _754);
    float _1523 = _1192 + _1511;
    float _1525 = fma(_1481, _1507, _1475);
    float _1527 = _1495 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1529 = _1523 * 0.5;
    out.m_67.w = _1471;
    float _1531 = _1525 + 0.5;
    float _1533 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_69.x = _1531;
    out.m_69.y = _1513;
    out.m_71.w = _1527;
    out.m_73.x = _1505;
    out.m_73.y = _1517;
    out.m_73.z = _1521;
    out.gl_Position.x = _1216;
    out.gl_Position.y = _1220;
    out.gl_Position.z = _1511;
    out.gl_Position.w = _1192;
    out.m_75.z = _1529;
    out.m_75.w = _1192;
    out.m_45.x = _1533;
    float _1535 = _1493 * _1248;
    float _1537 = -_1493;
    float _1539 = _1537 + 1.0;
    float _1541 = _1259 * _1535;
    float _1543 = _1259 * _1539;
    float _1545 = _1273 * _1535;
    float _1547 = fma(_1269, _1541, _1253);
    float _1549 = fma(_1271, _1541, _1255);
    float _1551 = fma(_1259, _1545, _1257);
    out.m_77.x = _1547;
    out.m_77.y = _1549;
    out.m_77.z = _1551;
    out.m_77.w = _1543;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

