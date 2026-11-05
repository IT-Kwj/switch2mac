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
    float4 m_63 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_69 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_67 [[user(locn7)]];
    float4 m_47 [[user(locn8)]];
    float4 m_73 [[user(locn9)]];
    float4 m_77 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_42 [[attribute(2)]];
    float4 m_44 [[attribute(3)]];
    float4 m_59 [[attribute(5)]];
    float4 m_51 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_61 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1076 = false;
    bool _754 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    float _112 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3614 = as_type<float>(_120);
        out.gl_Position.z = _3614;
    }
    if (!_106)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_98);
    float _136 = in.m_51.z;
    bool _138 = _102 >= _134;
    bool _140 = !_130;
    bool _142 = _138 || _140;
    float _144 = in.m_51.w;
    if (_142)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _110;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    int _148 = 0;
    if (_142)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    out.m_53.x = _132;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3677 = as_type<float>(_152);
        out.gl_Position.z = _3677;
    }
    out.m_53.z = _136;
    out.m_53.w = _144;
    if (_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_55.w;
    float _156 = 1.0 / _134;
    float _158 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = _158;
    if (!_168)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _112 = _186;
    }
    float _188 = _112;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_168;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _158 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _158);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_168;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _158 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _156;
    float _266 = fma(_254, _172, _258);
    float _268 = fma(_254, _170, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _154, _178);
    float _274 = fma(_268, _154, _176);
    float _276 = fma(_270, _154, _180);
    bool _278 = !_256;
    float _280 = _264;
    float _296;
    if (!_278)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _264;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _336 = 1.0 / _316;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = _300 + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = 1.0 / _324;
    float _356 = _344 * _326;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _360 = _300 + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _364 = _300 + _362;
    bool _366 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_300);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = fma(_348, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    bool _384 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_300);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _320;
    float _398 = _360 * _336;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _402 = _300 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = fma(_352, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _410 = -_394;
    float _412 = _410 + 1.0;
    float _414 = 1.0 / _330;
    float _416 = _304 * _354;
    bool _418 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _420 = isnan(_300);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _444 = fma(_432, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = 1.0 / _334;
    float _448 = _308 * _396;
    bool _450 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _452 = isnan(_300);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = fma(_436, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _464 = 1.0 / _340;
    float _466 = _364 * _414;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _470 = _300 + _468;
    float _472 = _402 * _446;
    float _474 = -_428;
    float _476 = _474 + 1.0;
    float _478 = -_460;
    float _480 = _478 + 1.0;
    float _482 = _460 * _476;
    bool _484 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _486 = isnan(_300);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _376 * _480;
    float _498 = _470 * _464;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -_376;
    float _510 = _508 + 1.0;
    float _512 = -_494;
    float _514 = _512 + 1.0;
    float _516 = fma(_502, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _518 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_300);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = fma(_506, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _532 = _494 * _510;
    bool _534 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _536 = isnan(_300);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = _528 * _514;
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = fma(_382, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _554 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_300);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -_544;
    float _568 = _566 + 1.0;
    float _570 = _544 * _550;
    float _572 = fma(_406, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _574 = fma(_440, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _576 = _564 * _412;
    float _578 = -_564;
    float _580 = _578 + 1.0;
    float _582 = _394 * _568;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = _516 * _576;
    float _590 = _378 * _576;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _600 = _444 * _576;
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _588);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _590);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _608 = fma(_586, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _610 = fma(_594, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _612 = fma(_598, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _614 = fma(_530, _582, _602);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_408, _582, _604);
    float _630 = fma(_462, _582, _606);
    float _632 = fma(_618, _466, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _466, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _466, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = fma(_552, _570, _614);
    float _644 = fma(_572, _570, _628);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _654 = fma(_574, _570, _630);
    float _656 = fma(_640, _472, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _658 = fma(_648, _472, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _660 = fma(_652, _472, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _662 = fma(_608, _546, _642);
    float _664 = fma(_610, _546, _644);
    float _666 = fma(_612, _546, _654);
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_634, _532, _664);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _676;
    float _680 = fma(_632, _532, _662);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = fma(_636, _532, _666);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _688;
    float _692 = fma(_678, _498, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _498, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_656, _496, _680);
    float _698 = fma(_690, _498, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _700 = fma(_658, _496, _674);
    float _702 = fma(_660, _496, _686);
    float _704 = fma(_692, _482, _696);
    float _706 = fma(_694, _482, _700);
    float _708 = fma(_698, _482, _702);
    float _710 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    float _720 = _714 * _672;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _730 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _736 = !_442;
    float _752;
    if (!_736)
    {
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _740 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _744 = _742 * _738;
        float _746 = floor(_744);
        float _748 = -_746;
        float _750 = _744 + _748;
        _752 = _750;
        _754 = true;
    }
    else
    {
        _752 = _264;
    }
    _754 = false;
    float _756 = _752;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _760 = _756 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _764 = _756 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _782 = 1.0 / _768;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _784;
    float _788 = 1.0 / _780;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _792 = _756 + _790;
    bool _794 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _796 = isnan(_756);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    bool _806 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _808 = isnan(_756);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = 1.0 / _776;
    float _820 = _792 * _782;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _824 = _756 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _826;
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _832 = fma(_828, _820, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _834 = 1.0 / _772;
    float _836 = _824 * _788;
    bool _838 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _840 = isnan(_756);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    bool _850 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _852 = isnan(_756);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -_848;
    float _864 = _862 + 1.0;
    float _866 = 1.0 / _786;
    float _868 = _760 * _818;
    bool _870 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _872 = isnan(_756);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_860;
    float _884 = _882 + 1.0;
    float _886 = -_880;
    float _888 = _886 + 1.0;
    float _890 = _764 * _834;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _894 = _756 + _892;
    float _896 = _880 * _864;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _898;
    float _902 = _804 * _888;
    float _904 = -_804;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _912 = fma(_900, _820, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _914 = _894 * _866;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _916;
    float _920 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _922 = fma(_918, _820, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _924 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _926 = isnan(_756);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _860 * _906;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _946 = _816 * _884;
    float _948 = -_816;
    float _950 = _948 + 1.0;
    float _952 = fma(_940, _890, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _954 = fma(_944, _890, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _956 = _934 * _950;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _958;
    float _962 = -_934;
    float _964 = _962 + 1.0;
    float _966 = _922 * _956;
    float _968 = _832 * _956;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _974;
    float _978 = _912 * _956;
    float _980 = fma(_960, _868, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _982 = fma(_972, _868, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _984 = fma(_976, _868, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].x, _966);
    float _988 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].y, _968);
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].z, _978);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _996 = fma(_954, _946, _986);
    float _998 = fma(_920, _946, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1004 = fma(_982, _936, _996);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1010 = fma(_952, _946, _990);
    float _1012 = fma(_994, _836, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1014 = fma(_984, _936, _998);
    float _1016 = fma(_1002, _836, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1022;
    float _1026 = fma(_1008, _836, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_980, _936, _1010);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1030;
    float _1034 = fma(_1012, _902, _1004);
    float _1036 = fma(_1020, _914, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1038 = fma(_1024, _914, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1040 = fma(_1016, _902, _1014);
    float _1042 = fma(_1032, _914, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1044 = fma(_1026, _902, _1028);
    float _1046 = fma(_1036, _896, _1034);
    float _1048 = fma(_1038, _896, _1040);
    float _1050 = fma(_1042, _896, _1044);
    float _1052 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1046);
    float _1054 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1048);
    float _1056 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1050);
    bool _1058 = !_830;
    float _1074;
    if (!_1058)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1062 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _1066 = _1064 * _1060;
        float _1068 = floor(_1066);
        float _1070 = -_1068;
        float _1072 = _1066 + _1070;
        _1074 = _1072;
        _1076 = true;
    }
    else
    {
        _1074 = _264;
    }
    _1076 = false;
    float _1078 = _1074;
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1082 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1092 = 1.0 / _1086;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1098;
    bool _1102 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1104 = isnan(_1078);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1118 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1120 = isnan(_1078);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = 1.0 / _1090;
    bool _1132 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1134 = isnan(_1078);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1112;
    float _1146 = _1144 + 1.0;
    float _1148 = -_1128;
    float _1150 = _1148 + 1.0;
    float _1152 = -_1142;
    float _1154 = _1152 + 1.0;
    bool _1156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1158 = 1.0 / _1096;
    float _1160 = _1100 * _1092;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1162;
    float _1166 = _1164 * _1130;
    float _1168 = _1142 * _1146;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1174 = 1.0 / _1172;
    float _1176 = _1116 * _1158;
    bool _1178 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_1078);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1194 = _1188 * _1154;
    float _1196 = -_1188;
    float _1198 = _1196 + 1.0;
    bool _1200 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1202 = isnan(_1078);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = 1.0 / _1192;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1216 = _1078 + _1214;
    float _1218 = _1128 * _1198;
    bool _1220 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1222 = isnan(_1078);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1210;
    float _1234 = _1232 + 1.0;
    float _1236 = _1210 * _1150;
    float _1238 = fma(_1160, _1216, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1244 = _1230 * _1234;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1248 = _1078 + _1246;
    float _1250 = -_1230;
    float _1252 = _1250 + 1.0;
    float _1254 = 1.0 / _1242;
    float _1256 = _1238 * _1244;
    float _1258 = fma(_1176, _1248, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1270 = _1078 + _1268;
    float _1272 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1256);
    float _1274 = _1262 * _1212;
    float _1276 = _1266 * _1174;
    float _1278 = fma(_1166, _1270, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1280 = fma(_1258, _1236, _1272);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1284 = _1078 + _1282;
    bool _1286 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _1288 = isnan(_1078);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1304 = _1078 + _1302;
    float _1306 = fma(_1276, _1284, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1308 = fma(_1278, _1218, _1280);
    float _1310 = _1300 * _1254;
    float _1312 = fma(_1274, _1304, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _1314 = -_1296;
    float _1316 = _1314 + 1.0;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1320 = _1078 + _1318;
    float _1322 = fma(_1306, _1194, _1308);
    float _1324 = _1112 * _1316;
    float _1326 = fma(_1310, _1320, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1328 = fma(_1312, _1168, _1322);
    float _1330 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1332 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = fma(_1326, _1324, _1328);
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[137].x, _1336);
    float _1342 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1344 = !_1156;
    if (!_1344)
    {
        float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1348 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _1352 = _1350 * _1346;
        float _1354 = floor(_1352);
        float _1356 = -_1354;
        float _1358 = _1352 + _1356;
        _280 = _1358;
    }
    float _1360 = _280;
    float _1362 = in.m_57.x;
    float _1364 = in.m_57.y;
    float _1366 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1368 = log2(_1366);
    float _1370 = _102 * 0.039999999105930328369140625;
    float _1372 = _136 * 2.0;
    float _1374 = in.m_51.y;
    float _1376 = _144 * 6.283185482025146484375;
    float _1378 = _1370 * 0.15915493667125701904296875;
    float _1380 = _132 * 2.0;
    float _1382 = _132 + _136;
    float _1384 = floor(_1372);
    float _1386 = _1382 + (-1.0);
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1390 = floor(_1380);
    float _1392 = fma(_102, 0.010999999940395355224609375, _1376);
    float _1394 = _1392 * 0.15915493667125701904296875;
    float _1396 = abs(_1362);
    float _1398 = abs(_1364);
    float _1400 = precise::max(_1396, _1398);
    float _1402 = _1364 * 0.0625;
    float _1404 = _1362 * 0.0625;
    float _1406 = _1378 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    bool _1410 = _1400 >= 16.0;
    float _1412 = _102 * _1368;
    float _1414 = _1374 * 6.283185482025146484375;
    float _1416 = _1374 * 2.0;
    float _1418 = _1410 ? _1402 : _1364;
    float _1420 = _1410 ? _1404 : _1362;
    float _1422 = fma(_102, 0.007000000216066837310791015625, _1414);
    float _1424 = abs(_1418);
    bool _1426 = _1424 != 0.0;
    bool _1428 = isnan(_1424);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    float _1436 = floor(_1416);
    float _1438 = abs(_1420);
    bool _1440 = _1438 == 0.0;
    float _1442 = _1422 * 0.15915493667125701904296875;
    float _1444 = abs(_1420);
    bool _1446 = _1444 == 0.0;
    bool _1448 = !_1434;
    bool _1450 = _1446 && _1448;
    float _1452 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1454 = _1384 > 0.0;
    bool _1456 = _1384 >= 0.0;
    bool _1458 = isnan(_1384);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = exp2(_1412);
    float _1468 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1470 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1472 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1452);
    float _1474 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1468);
    float _1476 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1470);
    float _1478 = _1394 * 6.283185482025146484375;
    float _1480 = sin(_1478);
    bool _1482 = false;
    int _1484 = as_type<int>(_1382);
    if (_1450)
    {
        bool _1486 = as_type<int>(_1420) >= 0;
        _1482 = _1486;
    }
    bool _1488 = _1482;
    int _1490 = _1488 ? (-1) : 0;
    if (_1450)
    {
        int _1492 = _1488 ? 0 : 1078530011;
        _1484 = _1492;
    }
    int _1494 = _1484;
    float _1496 = _1442 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    int _1500 = _1494;
    if (_1450)
    {
        int _1502 = int(0x80000000) & as_type<int>(_1418);
        int _1504 = _1494 | _1502;
        _1500 = _1504;
    }
    int _1506 = _1500;
    bool _1508 = !_1434;
    bool _1510 = _1508 && _1440;
    int _1512 = _1506;
    float _1514 = as_type<float>(_1506);
    if (!_1510)
    {
        float _1516 = abs(_1418);
        bool _1518 = _1516 != as_type<float>(0x7f800000u /* inf */);
        bool _1520 = isnan(_1516);
        bool _1522 = _1518 || _1520;
        bool _1524 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1526 = _1522 || _1524;
        float _1528 = abs(_1420);
        bool _1530 = _1528 == as_type<float>(0x7f800000u /* inf */);
        float _1532 = abs(_1420);
        bool _1534 = _1532 == as_type<float>(0x7f800000u /* inf */);
        bool _1536 = !_1526;
        bool _1538 = _1534 && _1536;
        if (_1538)
        {
            bool _1540 = as_type<int>(_1420) >= 0;
            _1490 = _1540 ? (-1) : 0;
        }
        int _1542 = _1490;
        if (_1538)
        {
            _1512 = 1075235812;
        }
        int _1544 = _1512;
        int _1546 = _1544;
        if (_1538)
        {
            int _1548 = ~_1542;
            int _1550 = (_1548 != 0) ? _1544 : 1061752795;
            _1546 = _1550;
        }
        int _1552 = _1546;
        float _1554 = as_type<float>(_1552);
        if (_1538)
        {
            int _1556 = int(0x80000000) & as_type<int>(_1418);
            int _1558 = _1552 | _1556;
            _1554 = as_type<float>(_1558);
        }
        float _1560 = _1554;
        bool _1562 = !_1526;
        bool _1564 = _1562 && _1530;
        _1514 = _1560;
        if (!_1564)
        {
            float _1566 = abs(_1418);
            float _1568 = abs(_1420);
            float _1570 = precise::max(_1566, _1568);
            float _1572 = abs(_1418);
            float _1574 = abs(_1420);
            float _1576 = precise::min(_1572, _1574);
            float _1578 = 1.0 / _1570;
            float _1580 = abs(_1418);
            float _1582 = abs(_1420);
            bool _1584 = _1580 > _1582;
            bool _1586 = as_type<int>(_1420) >= 0;
            float _1588 = _1576 * _1578;
            float _1590 = _1588 * _1588;
            float _1592 = _1590 + 11.33538818359375;
            float _1594 = fma(_1590, _1592, 28.84246826171875);
            float _1596 = fma(_1590, _1594, 19.6966705322265625);
            float _1598 = fma(_1590, -0.82336294651031494140625, -5.674867153167724609375);
            float _1600 = fma(_1590, _1598, -6.565555095672607421875);
            float _1602 = 1.0 / _1596;
            float _1604 = _1590 * _1600;
            float _1606 = abs(_1418);
            float _1608 = abs(_1420);
            float _1610 = _1606 + _1608;
            int _1612 = as_type<int>(_1418) & int(0x80000000);
            float _1614 = _1588 * _1604;
            bool _1616 = _1610 > as_type<float>(0x7f800000u /* inf */);
            bool _1618 = isnan(_1610);
            bool _1620 = _1616 || _1618;
            bool _1622 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1624 = _1620 || _1622;
            float _1626 = fma(_1614, _1602, _1588);
            float _1628 = _1626;
            _1514 = _1610;
            if (_1584)
            {
                float _1630 = -_1626;
                float _1632 = _1630 + 1.57079637050628662109375;
                _1628 = _1632;
            }
            float _1634 = _1628;
            int _1636 = as_type<int>(_1634);
            if (!_1586)
            {
                float _1638 = -_1634;
                float _1640 = _1638 + 3.1415927410125732421875;
                _1636 = as_type<int>(_1640);
            }
            int _1642 = _1636;
            if (!_1624)
            {
                int _1644 = _1612 | _1642;
                _1514 = as_type<float>(_1644);
            }
        }
    }
    float _1646 = _1514;
    float _1648 = _132 + _1374;
    float _1650 = abs(_1498);
    float _1652 = log2(_1650);
    float _1654 = _136 + _1374;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1658 = _1648 + (-1.0);
    float _1660 = _1654 + (-1.0);
    float _1662 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1656);
    float _1664 = abs(_1480);
    float _1666 = log2(_1664);
    float _1668 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1672 = _1464 ? 0 : 1;
    float _1674 = fma(_1408, 9.0, _102);
    bool _1676 = _1390 > 0.0;
    float _1678 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1474);
    int _1688 = _1684;
    if (!_1454)
    {
        int _1690 = ~_1672;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    float _1696 = _1652 * 120.0;
    bool _1698 = _1390 >= 0.0;
    bool _1700 = isnan(_1390);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(0.0);
    bool _1706 = _1702 || _1704;
    float _1708 = _1674 * 0.20999999344348907470703125;
    float _1710 = _1674 * (-0.1599999964237213134765625);
    bool _1712 = _1436 > 0.0;
    float _1714 = fma(_1646, 5.00000095367431640625, _1708);
    float _1716 = _1666 * 80.0;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1720 = 1.0 + _1718;
    float _1722 = fma(_1646, 4.000000476837158203125, _1710);
    bool _1724 = _1436 >= 0.0;
    bool _1726 = isnan(_1436);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    float _1734 = _1714 * 0.15915493667125701904296875;
    float _1736 = _1722 * 0.15915493667125701904296875;
    float _1738 = 1.0 / _1720;
    int _1740 = _1706 ? 0 : 1;
    float _1742 = _1678 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1746 = _1744 != 0;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1750 = _1748 != 0;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1754 = _1752 != 0;
    float _1756 = -_1466;
    float _1758 = _1756 + 1.0;
    float _1760 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1662);
    bool _1762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1764 = isnan(0.0);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1770 = _1766 || _1768;
    float _1772 = exp2(_1716);
    bool _1774 = !_1746;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = ~_1740;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    int _1784 = abs(_1776);
    float _1786 = -_1742;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1790 = _1782;
    float _1792 = _1788;
    bool _1794 = _1732;
    if (!_1676)
    {
        int _1796 = ~_1740;
        int _1798 = _1796 + 1;
        _1790 = _1798;
    }
    int _1800 = _1790;
    float _1802 = exp2(_1696);
    float _1804 = _1686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1806 = _1770 ? _1758 : 0.0;
    float _1808 = float(_1694);
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1812 = _1804 + _1810;
    float _1814 = float(_1784);
    float _1816 = _1806 * _1738;
    float _1818 = _1734 * 6.283185482025146484375;
    float _1820 = sin(_1818);
    int _1822 = _1732 ? 0 : 1;
    float _1824 = _1814 * _1808;
    float _1826 = abs(_1812);
    float _1828 = abs(_1788);
    float _1830 = precise::max(_1826, _1828);
    int _1832 = ~_1822;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    float _1838 = _1824 * (-2.0);
    float _1840 = _1736 * 6.283185482025146484375;
    float _1842 = sin(_1840);
    float _1844 = _1772 + _1802;
    int _1846 = _1836;
    if (!_1712)
    {
        int _1848 = ~_1822;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    float _1854 = fma(_1668, _1838, _1668);
    bool _1856 = _1830 >= 16.0;
    bool _1858 = !_1754;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = rsqrt(_1760);
    float _1864 = float(_1852);
    bool _1866 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1868 = isnan(1.0);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1874 = _1870 || _1872;
    float _1876 = _1820 + _1842;
    float _1878 = _132 + (-0.5);
    float _1880 = in.m_59.x;
    float _1882 = in.m_59.y;
    float _1884 = in.m_59.z;
    bool _1886 = !_1874;
    float _1888 = _1886 ? _102 : _1816;
    if (_1856)
    {
        float _1890 = _1788 * 0.0625;
        _1792 = _1890;
    }
    float _1892 = _1792;
    float _1894 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _1896 = !_1750;
    int _1898 = _1896 ? 0 : 1;
    float _1900 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1902 = precise::max(_1876, -2.0);
    float _1904 = fma(_1888, _1854, _1894);
    int _1906 = abs(_1898);
    float _1908 = _1900 * (-0.15915493667125701904296875);
    int _1910 = abs(_1860);
    float _1912 = _1904 * 0.15915493667125701904296875;
    float _1914 = float(_1800);
    float _1916 = _1908 * 6.283185482025146484375;
    float _1918 = cos(_1916);
    float _1920 = precise::min(_1902, 2.0);
    float _1922 = float(_1906);
    float _1924 = float(_1910);
    float _1926 = fma(_1920, 0.25, 0.5);
    float _1928 = _1908 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    float _1932 = _1922 * _1914;
    float _1934 = abs(_1892);
    bool _1936 = _1934 == 0.0;
    float _1938 = _1926 * 0.07999999821186065673828125;
    float _1940 = _1924 * _1864;
    float _1942 = _136 + (-0.5);
    float _1944 = _1932 * (-2.0);
    float _1946 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1948 = _1940 * (-2.0);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1952 = fma(_1670, _1944, _1670);
    float _1954 = fma(_1364, _1946, _1882);
    float _1956 = _102 * (-0.17000000178813934326171875);
    float _1958 = fma(_1388, _1948, _1388);
    float _1960 = _132 * 6.283185482025146484375;
    float _1962 = _1374 * (-0.87964594364166259765625);
    float _1964 = fma(_1954, 16.0, _1956);
    float _1966 = fma(_1888, _1958, _1950);
    float _1968 = _1812 * 0.0625;
    float _1970 = _1374 + (-0.5);
    float _1972 = _1964 + _1960;
    float _1974 = fma(_1954, 9.0, _1962);
    float _1976 = _1966 * 0.15915493667125701904296875;
    float _1978 = _1912 * 6.283185482025146484375;
    float _1980 = sin(_1978);
    float _1982 = _1856 ? _1968 : _1812;
    float _1984 = _1972 * 0.15915493667125701904296875;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1988 = _1414 + _1974;
    float _1990 = abs(_1982);
    bool _1992 = _1990 != 0.0;
    bool _1994 = isnan(_1990);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan(0.0);
    bool _2000 = _1996 || _1998;
    float _2002 = fma(_1362, _1946, _1880);
    float _2004 = fma(_1888, _1952, _1986);
    float _2006 = _1912 * 6.283185482025146484375;
    float _2008 = cos(_2006);
    float _2010 = _1988 * 0.15915493667125701904296875;
    float _2012 = abs(_1892);
    bool _2014 = _2012 == 0.0;
    bool _2016 = !_2000;
    bool _2018 = _2014 && _2016;
    float _2020 = fma(_1954, 0.5, 0.5);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1984 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    float _2028 = _102 * (-0.37000000476837158203125);
    float _2030 = fma(_2022, -2.0, 3.0);
    float _2032 = fma(_1954, 0.58823525905609130859375, 0.411764681339263916015625);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = fma(_1954, 5.0, _2028);
    float _2038 = fma(_2034, -2.0, 3.0);
    float _2040 = _1976 * 6.283185482025146484375;
    float _2042 = sin(_2040);
    float _2044 = _2036 + _1376;
    int _2046 = as_type<int>(_2030);
    float _2048 = 0.58823525905609130859375;
    if (_2018)
    {
        bool _2050 = as_type<int>(_1892) >= 0;
        _1794 = _2050;
    }
    bool _2052 = _1794;
    float _2054 = _2044 * 0.15915493667125701904296875;
    float _2056 = _2022 * _2022;
    float _2058 = _2010 * 6.283185482025146484375;
    float _2060 = sin(_2058);
    float _2062 = _2026 * 0.064000003039836883544921875;
    float _2064 = _2030 * _2056;
    int _2066 = _2052 ? (-1) : 0;
    if (_2018)
    {
        int _2068 = _2052 ? 0 : 1078530011;
        _2046 = _2068;
    }
    int _2070 = _2046;
    float _2072 = _2034 * _2034;
    float _2074 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _2076 = _2070;
    if (_2018)
    {
        int _2078 = int(0x80000000) & as_type<int>(_1982);
        int _2080 = _2070 | _2078;
        _2048 = as_type<float>(_2080);
    }
    float _2082 = _2048;
    float _2084 = _2054 * 6.283185482025146484375;
    float _2086 = sin(_2084);
    bool _2088 = !_2000;
    bool _2090 = _2088 && _1936;
    float _2092 = _2082;
    float _2094 = _2082;
    if (!_2090)
    {
        float _2096 = abs(_1982);
        bool _2098 = _2096 != as_type<float>(0x7f800000u /* inf */);
        bool _2100 = isnan(_2096);
        bool _2102 = _2098 || _2100;
        bool _2104 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2106 = _2102 || _2104;
        float _2108 = abs(_1892);
        bool _2110 = _2108 == as_type<float>(0x7f800000u /* inf */);
        float _2112 = abs(_1892);
        bool _2114 = _2112 == as_type<float>(0x7f800000u /* inf */);
        bool _2116 = !_2106;
        bool _2118 = _2114 && _2116;
        if (_2118)
        {
            bool _2120 = as_type<int>(_1892) >= 0;
            _2066 = _2120 ? (-1) : 0;
        }
        int _2122 = _2066;
        if (_2118)
        {
            _2076 = 1075235812;
        }
        int _2124 = _2076;
        int _2126 = _2124;
        if (_2118)
        {
            int _2128 = ~_2122;
            int _2130 = (_2128 != 0) ? _2124 : 1061752795;
            _2126 = _2130;
        }
        int _2132 = _2126;
        if (_2118)
        {
            int _2134 = int(0x80000000) & as_type<int>(_1982);
            int _2136 = _2132 | _2134;
            _2092 = as_type<float>(_2136);
        }
        float _2138 = _2092;
        bool _2140 = !_2106;
        bool _2142 = _2140 && _2110;
        _2094 = _2138;
        if (!_2142)
        {
            float _2144 = abs(_1982);
            float _2146 = abs(_1892);
            float _2148 = precise::max(_2144, _2146);
            float _2150 = abs(_1982);
            float _2152 = abs(_1892);
            float _2154 = precise::min(_2150, _2152);
            float _2156 = 1.0 / _2148;
            float _2158 = abs(_1982);
            float _2160 = abs(_1892);
            bool _2162 = _2158 > _2160;
            bool _2164 = as_type<int>(_1892) >= 0;
            float _2166 = _2154 * _2156;
            float _2168 = _2166 * _2166;
            float _2170 = _2168 + 11.33538818359375;
            float _2172 = fma(_2168, _2170, 28.84246826171875);
            float _2174 = fma(_2168, _2172, 19.6966705322265625);
            float _2176 = fma(_2168, -0.82336294651031494140625, -5.674867153167724609375);
            float _2178 = fma(_2168, _2176, -6.565555095672607421875);
            float _2180 = 1.0 / _2174;
            float _2182 = _2168 * _2178;
            float _2184 = abs(_1982);
            float _2186 = abs(_1892);
            float _2188 = _2184 + _2186;
            int _2190 = as_type<int>(_1982) & int(0x80000000);
            float _2192 = _2166 * _2182;
            bool _2194 = _2188 > as_type<float>(0x7f800000u /* inf */);
            bool _2196 = isnan(_2188);
            bool _2198 = _2194 || _2196;
            bool _2200 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2202 = _2198 || _2200;
            float _2204 = fma(_2192, _2180, _2166);
            float _2206 = _2204;
            _2094 = _2188;
            if (_2162)
            {
                float _2208 = -_2204;
                float _2210 = _2208 + 1.57079637050628662109375;
                _2206 = _2210;
            }
            float _2212 = _2206;
            int _2214 = as_type<int>(_2212);
            if (!_2164)
            {
                float _2216 = -_2212;
                float _2218 = _2216 + 3.1415927410125732421875;
                _2214 = as_type<int>(_2218);
            }
            int _2220 = _2214;
            if (!_2202)
            {
                int _2222 = _2190 | _2220;
                _2094 = as_type<float>(_2222);
            }
        }
    }
    float _2224 = _2094;
    float _2226 = fma(_2062, _2074, _2002);
    float _2228 = _2060 * 0.07299999892711639404296875;
    float _2230 = _2086 * _1844;
    float _2232 = _2038 * _2072;
    float _2234 = fma(_2228, _2074, _2226);
    float _2236 = _2230 * 0.180000007152557373046875;
    float _2238 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2240 = -_2224;
    float _2242 = _2004 + _2240;
    float _2244 = _1954 + 0.20000000298023223876953125;
    float _2246 = _2236 * _2232;
    float _2248 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2238);
    float _2250 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2252 = _2242 * 0.15915493667125701904296875;
    float _2254 = _1930 * _1884;
    float _2256 = _1976 * 6.283185482025146484375;
    float _2258 = cos(_2256);
    float _2260 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[191].x, _2234);
    float _2262 = _136 * 6.283185482025146484375;
    float _2264 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2266 = _1918 * _1884;
    float _2268 = fma(_102, 0.10999999940395355224609375, _1960);
    float _2270 = fma(_102, 0.310000002384185791015625, _2262);
    float _2272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2260);
    float _2274 = _2252 * 6.283185482025146484375;
    float _2276 = sin(_2274);
    float _2278 = -_2254;
    float _2280 = fma(_1918, _2244, _2278);
    float _2282 = _2270 * 0.15915493667125701904296875;
    float _2284 = fma(_1930, _2244, _2266);
    float _2286 = _2272 * _2250;
    float _2288 = _2280 + (-0.20000000298023223876953125);
    float _2290 = _2268 * 0.15915493667125701904296875;
    float _2292 = _2252 * 6.283185482025146484375;
    float _2294 = cos(_2292);
    float _2296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2288);
    float _2298 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1472);
    float _2300 = _1980 * _2276;
    float _2302 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2304 = _2264 * _2296;
    float _2306 = _2282 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2284);
    float _2312 = _2008 * _2276;
    float _2314 = _2258 * _2304;
    float _2316 = _2008 * _2294;
    float _2318 = _1980 * _2294;
    float _2320 = _2310 * _2302;
    float _2322 = 1.0 / _2264;
    float _2324 = fma(_2042, _2316, _2300);
    float _2326 = _2008 * _2314;
    float _2328 = -_2318;
    float _2330 = fma(_2042, _2312, _2328);
    float _2332 = fma(_2042, _2300, _2316);
    float _2334 = fma(_2324, _2286, _2326);
    float _2336 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2248);
    float _2338 = _2290 * 6.283185482025146484375;
    float _2340 = sin(_2338);
    float _2342 = fma(_2308, 0.12999999523162841796875, 1.0);
    float _2344 = fma(_2330, _2320, _2334);
    float _2346 = _2298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2348 = -_2312;
    float _2350 = fma(_2042, _2318, _2348);
    float _2352 = _1980 * _2314;
    float _2354 = -_2304;
    float _2356 = _2042 * _2354;
    float _2358 = _2346 + _2344;
    float _2360 = sqrt(_2336);
    float _2362 = fma(_2350, _2286, _2352);
    float _2364 = _2294 * _2258;
    float _2366 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2368 = _2358 + _2366;
    float _2370 = _2276 * _2258;
    float _2372 = fma(_2332, _2320, _2362);
    float _2374 = fma(_2364, _2286, _2356);
    float _2376 = _2368 * _2322;
    float _2378 = fma(_2340, 0.300000011920928955078125, _2342);
    float _2380 = _1742 + _2372;
    float _2382 = fma(_2370, _2320, _2374);
    float _2384 = fma(_2376, _2376, _2376);
    float _2386 = _1804 + _2382;
    float _2388 = _2360 * 0.64999997615814208984375;
    float _2390 = _2384 * _2388;
    float _2392 = _2378 * _2390;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2380);
    float _2396 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2386);
    float _2398 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2358);
    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2402 = _2394 + _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2406 = _2396 + _2404;
    float _2408 = _2402 * _2402;
    float _2410 = fma(_2406, _2406, _2408);
    float _2412 = sqrt(_2410);
    bool _2414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan(0.5);
    bool _2422 = _2418 || _2420;
    bool _2424 = _2412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2426 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2428 = _2358;
    float _2430 = _2396;
    float _2432 = _2402;
    float _2434 = _2316;
    float _2436 = _2322;
    float _2438 = _2314;
    if (!_2424)
    {
        _2426 = _2396;
    }
    float _2440 = _2426;
    float _2442 = _2440;
    if (!_2424)
    {
        _2428 = _2394;
    }
    float _2444 = _2428;
    float _2446 = _2444;
    if (!_2424)
    {
        _2430 = _2398;
    }
    float _2448 = _2430;
    bool _2450 = !_2424;
    float _2452 = _2448;
    if (!_2450)
    {
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2458 = _2412 + _2456;
        float _2460 = _2398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2462 = rsqrt(_2410);
        float _2464 = _2458 * _2454;
        float _2466 = _2464 * 0.15915493667125701904296875;
        float _2468 = _2466 * 6.283185482025146484375;
        float _2470 = sin(_2468);
        float _2472 = _2466 * 6.283185482025146484375;
        float _2474 = cos(_2472);
        float _2476 = fma(_2470, _2460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2478 = _2462 * _2476;
        float _2480 = _2474 + (-1.0);
        float _2482 = fma(_2406, _2478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2484 = fma(_2402, _2478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2488 = fma(_2398, _2474, _2486);
        _2452 = _2488;
        _2442 = _2482;
        _2446 = _2484;
    }
    float _2490 = _2452;
    float _2492 = _2442;
    float _2494 = _2446;
    float _2496 = _2490;
    float _2498 = _2492;
    float _2500 = _2494;
    if (!_2422)
    {
        float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2504 = _2346 + _2502;
        float _2506 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2508 = -_2346;
        float _2510 = _2508 + _2490;
        float _2512 = _2504 * _2504;
        float _2514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2516 = _1742 + _2514;
        float _2518 = fma(_1812, _1812, _2512);
        float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2522 = fma(_2516, _2516, _2518);
        float _2524 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2526 = sqrt(_2522);
        float _2528 = -_1804;
        float _2530 = _2528 + _2492;
        float _2532 = precise::min(_2526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2534 = _2532 * _2520;
        float _2536 = _2524 * _2534;
        float _2538 = -_1742;
        float _2540 = _2538 + _2494;
        float _2542 = fma(_2530, _2536, _1804);
        float _2544 = fma(_2510, _2536, _2346);
        float _2546 = fma(_2540, _2536, _1742);
        _2496 = _2544;
        _2498 = _2542;
        _2500 = _2546;
    }
    float _2548 = _2496;
    float _2550 = _2498;
    float _2552 = _2500;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2556 = _2548 + _2554;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2560 = _2550 + _2558;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2552 + _2562;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = sqrt(_2570);
    float _2576 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2578 = _2560 * _2576;
    float _2580 = _2564 * _2576;
    float _2582 = _2578 * _2578;
    float _2584 = _2580 * _2580;
    float _2586 = _2582 + _2584;
    float _2588 = sqrt(_2586);
    bool _2590 = _2588 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2594 = _2588 + _2592;
    float _2596 = _2568;
    float _2598 = _2586;
    float _2600 = _2594;
    float _2602 = _2556;
    if (_2590)
    {
        float _2604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2596 = _2604;
    }
    float _2606 = _2596;
    if (_2590)
    {
        float _2608 = rsqrt(_2586);
        _2598 = _2608;
    }
    float _2610 = _2598;
    float _2612 = _2610;
    if (_2590)
    {
        float _2614 = _2594 * _2606;
        _2600 = _2614;
    }
    float _2616 = _2600;
    if (_2590)
    {
        float _2618 = _2616 * 0.15915493667125701904296875;
        _2432 = _2618;
    }
    float _2620 = _2432;
    float _2622 = _2564;
    float _2624 = _2620;
    if (_2590)
    {
        float _2626 = _2620 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2622 = _2628;
    }
    float _2630 = _2622;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2634 = precise::max(0.0, _2632);
    float _2636 = _2606;
    float _2638 = _2634;
    if (_2590)
    {
        float _2640 = _2620 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        _2636 = _2642;
    }
    float _2644 = _2636;
    float _2646 = -_2576;
    float _2648 = -_2634;
    float _2650 = fma(_2556, _2646, _2648);
    if (_2590)
    {
        float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2602 = _2652;
    }
    float _2654 = _2602;
    float _2656 = _2654;
    float _2658 = _2630;
    if (_2590)
    {
        float _2660 = fma(_2630, _2654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2656 = _2660;
    }
    float _2662 = _2656;
    float _2664 = _2662;
    if (!_2590)
    {
        _2658 = _2578;
    }
    float _2666 = _2658;
    float _2668 = _2666;
    float _2670 = _2644;
    if (_2590)
    {
        float _2672 = _2644 + (-1.0);
        _2638 = _2672;
    }
    float _2674 = _2638;
    float _2676 = _2674;
    if (_2590)
    {
        float _2678 = _2610 * _2662;
        _2434 = _2678;
    }
    float _2680 = _2434;
    if (!_2590)
    {
        _2664 = _2650;
    }
    float _2682 = _2664;
    float _2684 = _2682;
    if (_2590)
    {
        float _2686 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2624 = _2686;
    }
    float _2688 = _2624;
    if (_2590)
    {
        float _2690 = _2578 * _2680;
        _2668 = _2690;
    }
    float _2692 = _2668;
    if (!_2590)
    {
        _2676 = _2580;
    }
    float _2694 = _2676;
    float _2696 = _2694;
    if (_2590)
    {
        float _2698 = _2580 * _2680;
        _2696 = _2698;
    }
    float _2700 = _2696;
    if (!_2590)
    {
        _2612 = _2582;
    }
    float _2702 = _2612;
    float _2704 = _2702;
    if (_2590)
    {
        float _2706 = fma(_2650, _2644, _2688);
        _2684 = _2706;
    }
    float _2708 = _2684;
    if (_2590)
    {
        float _2710 = _2692 * _2692;
        _2704 = _2710;
    }
    float _2712 = _2704;
    if (!_2590)
    {
        _2670 = _2584;
    }
    float _2714 = _2670;
    float _2716 = _2714;
    if (_2590)
    {
        float _2718 = _2700 * _2700;
        _2716 = _2718;
    }
    float _2720 = _2716;
    float _2722 = fma(_2708, _2708, _2712);
    float _2724 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2726 = _2722 + _2720;
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2730 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2728);
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2724);
    float _2736 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2738 = rsqrt(_2726);
    float _2740 = -_2732;
    float _2742 = _2740 + 1.0;
    float _2744 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2746 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2734);
    float _2748 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2750 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2736);
    float _2752 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2754 = _2746 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2756 = abs(_2742);
    float _2758 = log2(_2756);
    float _2760 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2748);
    float _2762 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2750);
    float _2764 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2752);
    float _2766 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2768 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2760);
    float _2770 = _2762 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2772 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2764);
    float _2774 = _2738 * _2692;
    float _2776 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2778 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2780 = _2738 * _2708;
    float _2782 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2784 = _2738 * _2700;
    float _2786 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2778);
    float _2788 = -_2766;
    float _2790 = fma(_2788, _2744, 1.0);
    float _2792 = -_2782;
    float _2794 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2792);
    float _2796 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2798 = _2772 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2800 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2786);
    float _2802 = -_2784;
    float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2794);
    float _2806 = exp2(_2796);
    float _2808 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2810 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2800);
    float _2812 = fma(_2804, -0.5, 0.5);
    float _2814 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2816 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2808);
    float _2818 = fma(_2804, 0.5, 0.5);
    float _2820 = _2780 + 1.0;
    float _2822 = log2(_2790);
    float _2824 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2814);
    float _2826 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2816);
    float _2828 = fma(_2818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2830 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2824);
    float _2832 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2826);
    float _2834 = fma(_2818, _2828, -0.212114393711090087890625);
    float _2836 = 1.0 / _2810;
    float _2838 = -_2780;
    float _2840 = fma(_2806, _2820, _2838);
    float _2842 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2830);
    float _2844 = fma(_2818, _2834, 1.570728778839111328125);
    float _2846 = sqrt(_2812);
    float _2848 = _2822 * 0.693147182464599609375;
    float _2850 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2852 = fma(_2840, 0.5, 0.5);
    float _2854 = _2832 * _2836;
    float _2856 = _2842 * _2836;
    float _2858 = fma(_2854, 0.5, 0.5);
    float _2860 = fma(_2856, -0.5, 0.5);
    float _2862 = _2846 * 0.636619746685028076171875;
    float _2864 = -_2844;
    float _2866 = fma(_2862, _2864, 1.0);
    float3 _7898 = float3(_2858, _2860, _2850);
    float _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7898, float3(0.0), isnan(_7898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7898, float3(0.0), isnan(_7898)), level(0.0)).x;
    float3 _7909 = float3(_2858, _2860, _2850);
    float4 _2871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7909, float3(0.0), isnan(_7909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7909, float3(0.0), isnan(_7909)), level(0.0)).xyzw;
    float _2873 = _2871.x;
    float _2875 = _2871.y;
    float _2877 = _2871.z;
    float _2879 = _2871.w;
    float2 _7926 = float2(_2866, _2852);
    float3 _2883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7926, float2(0.0), isnan(_7926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7926, float2(0.0), isnan(_7926)), level(0.0)).xyz;
    float _2885 = _2883.x;
    float _2887 = _2883.y;
    float _2889 = _2883.z;
    float _2891 = in.m_61.y;
    float _2893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2895 = _144 > 0.5;
    out.m_63.x = _730;
    out.m_63.y = _732;
    out.m_63.z = _734;
    out.m_63.w = _722;
    float _2897 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _1332;
    out.m_65.y = _1334;
    out.m_65.z = _1338;
    out.m_65.w = _1342;
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2901 = _2899 != 0;
    float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2909 = _2907 != 0;
    float _2911 = exp2(_2897);
    bool _2913 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2915 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2917 = _2913 || _2915;
    bool _2919 = isnan(0.5);
    bool _2921 = _2917 || _2919;
    out.m_67.x = _2260;
    out.m_67.y = _2288;
    out.m_67.z = _2284;
    float _2923 = _2893 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2925 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2929 = 1.0 / _2905;
    float _2931 = -_2891;
    float _2933 = _2931 + 1.0;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2937 = -_2927;
    float _2939 = fma(_2925, 2.0, _2937);
    float _2941 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2943 = _2941 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2949 = _2947 != 0;
    float _2951 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2953 = _2951 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2955 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2957 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2945);
    bool _2959 = _2895;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _2963 = _2891;
    if (!_2901)
    {
        _2436 = _1374;
    }
    float _2965 = _2436;
    float _2967 = fma(_2955, -2.0, _2935);
    int _2969 = _2895 ? as_type<int>(_2933) : as_type<int>(_2891);
    float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2973 = _2971 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2975 = 1.0 / _2953;
    float _2977 = _2965;
    if (_2909)
    {
        bool _2979 = _132 > 0.5;
        _2959 = _2979;
    }
    bool _2981 = _2959;
    float _2983 = -_102;
    float _2985 = fma(_2983, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2939);
    if (_2901)
    {
        _2977 = _132;
    }
    float _2987 = _2977;
    float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2991 = _2989 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2995 = _2993 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2999 = _2997 != 0;
    float _3001 = -_2911;
    float _3003 = _3001 + 1.0;
    float _3005 = 1.0 / _2995;
    float _3007 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3011 = _3009 != 0;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3015 = _2999 ? as_type<float>(_2969) : _2891;
    bool _3017 = _2999;
    if (_2949)
    {
        bool _3019 = _136 > 0.5;
        _3017 = _3019;
    }
    bool _3021 = _3017;
    float _3023 = 1.0 / _2991;
    if (!_2901)
    {
        _2961 = _136;
    }
    float _3025 = _2961;
    float _3027 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3013);
    float _3029 = _3025;
    if (!_2901)
    {
        _2438 = _136;
    }
    float _3031 = _2438;
    float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3033;
    float _3037 = _3031;
    if (_2901)
    {
        _3029 = _1374;
    }
    float _3039 = _3029;
    float _3041 = fma(_3015, _2923, -0.5);
    if (_2901)
    {
        _3037 = _1374;
    }
    float _3043 = _3037;
    float _3045 = 1.0 / _2973;
    float _3047 = _3035 * _2929;
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3051 = _3049 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _3053 = _1374 > 0.5;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3057 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3055;
    float _3059 = 1.0 / _2943;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3063 = _3061 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3065 = _3051 * _2975;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3071 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3073 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3071;
    float _3075 = _3057 * _3023;
    float _3077 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3079 = _3077 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3081 = _3069 * _3005;
    float _3083 = 1.0 / _3063;
    float _3085 = _3073 * _3045;
    float _3087 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3089 = _1360 + _3087;
    float _3091 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3093 = _1360 + _3091;
    float _3095 = fma(_3085, _3089, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3097 = fma(_3047, _3093, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3099 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3101 = _1360 + _3099;
    float _3103 = _3079 * _3059;
    float _3105 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3107 = _1360 + _3105;
    bool _3109 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3111 = isnan(_1360);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3117 = _3113 || _3115;
    float _3119 = float(_3117);
    float _3121 = fma(_3075, _3101, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _3123 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3125 = isnan(_1360);
    bool _3127 = _3123 || _3125;
    bool _3129 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3131 = _3127 || _3129;
    float _3133 = float(_3131);
    float _3135 = fma(_3103, _3107, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _3137 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3139 = isnan(_1360);
    bool _3141 = _3137 || _3139;
    bool _3143 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3145 = _3141 || _3143;
    float _3147 = float(_3145);
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3149;
    float _3153 = -_3119;
    float _3155 = _3153 + 1.0;
    bool _3157 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3159 = isnan(_1360);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3165 = _3161 || _3163;
    float _3167 = float(_3165);
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3171 = _1360 + _3169;
    float _3173 = _3151 * _3083;
    float _3175 = -_3133;
    float _3177 = _3175 + 1.0;
    float _3179 = _3147 * _3155;
    float _3181 = -_3147;
    float _3183 = _3181 + 1.0;
    bool _3185 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3187 = isnan(_1360);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3193 = _3189 || _3191;
    float _3195 = float(_3193);
    float _3197 = -_3167;
    float _3199 = _3197 + 1.0;
    float _3201 = fma(_3065, _3171, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3203 = _3119 * _3177;
    float _3205 = _3167 * _3183;
    bool _3207 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3209 = isnan(_1360);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = _3195 * _3199;
    float _3221 = -_3195;
    float _3223 = _3221 + 1.0;
    float _3225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3227 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3229 = isnan(_1360);
    bool _3231 = _3227 || _3229;
    bool _3233 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3235 = _3231 || _3233;
    float _3237 = float(_3235);
    float _3239 = -_3217;
    float _3241 = _3239 + 1.0;
    float _3243 = _3203;
    if (_3011)
    {
        float _3245 = _3053 ? _2933 : _2891;
        _2963 = _3245;
    }
    float _3247 = _2963;
    float _3249 = _3217 * _3223;
    float _3251 = _3237 * _3241;
    bool _3253 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3255 = isnan(_1360);
    bool _3257 = _3253 || _3255;
    bool _3259 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3261 = _3257 || _3259;
    float _3263 = float(_3261);
    float _3265 = -_3237;
    float _3267 = _3265 + 1.0;
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3271 = _1360 + _3269;
    float _3273 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3275 = _3263 * _3267;
    float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3279 = _1360 + _3277;
    float _3281 = fma(_3173, _3271, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3283 = fma(_3043, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3273);
    float _3285 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3287 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3289 = _3097 * _3275;
    float _3291 = _3225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3293 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3285);
    float _3295 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3287);
    float _3297 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3299 = fma(_3291, _3247, -0.5);
    float _3301 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3303 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3295);
    float _3305 = in.m_61.x;
    float _3307 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3301);
    float _3309 = _3303 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3311 = -_3263;
    float _3313 = _3311 + 1.0;
    float _3315 = _2987 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3317 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3307);
    float _3319 = 1.0 / _3309;
    float _3321 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3289);
    float _3323 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3325 = _3317 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3327 = _3317;
    int _3329 = as_type<int>(_3297);
    float _3331 = _3279;
    if (!_2921)
    {
        _3327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3333 = _3327;
    float _3335 = fma(_3201, _3251, _3321);
    float _3337 = _3325 + _3309;
    float _3339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3341 = fma(_3095, _3249, _3335);
    float _3343 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3027);
    float _3345 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2967);
    float _3347 = _3335;
    float _3349 = _3345;
    if (!_2921)
    {
        _3347 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3351 = _3347;
    float _3353 = fma(_3135, _3219, _3341);
    float _3355 = -_3323;
    float _3357 = fma(_3315, 2.0, _3355);
    float _3359 = -_3345;
    float _3361 = fma(_3343, _3299, _3359);
    float _3363 = _3337 * _3319;
    float _3365 = _3363 * 0.5;
    float _3367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3371 = fma(_3121, _3205, _3353);
    float _3373 = _3353;
    if (!_2921)
    {
        float _3375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3377 = fma(_3365, _3333, _3375);
        _3349 = _3377;
    }
    float _3379 = _3349;
    if (!_2921)
    {
        float _3381 = -_3351;
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3373 = _3383;
    }
    float _3385 = _3373;
    float _3387 = fma(_3297, -2.0, _3369);
    float _3389 = _3305;
    if (_2909)
    {
        float _3391 = -_3305;
        float _3393 = _3391 + 1.0;
        _3329 = as_type<int>(_3393);
    }
    int _3395 = _3329;
    int _3397 = 0;
    if (_2949)
    {
        float _3399 = -_3305;
        float _3401 = _3399 + 1.0;
        _3397 = as_type<int>(_3401);
    }
    int _3403 = _3397;
    float _3405 = _3341;
    if (!_2921)
    {
        float _3407 = 1.0 / _3379;
        _3405 = _3407;
    }
    float _3409 = _3405;
    float _3411 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2957);
    float _3413 = fma(_3081, _3279, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3415 = in.m_57.w;
    if (!_2909)
    {
        _3331 = _3305;
    }
    float _3417 = _3331;
    float _3419 = _3339 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3421 = _3417;
    if (_2909)
    {
        float _3423 = _2981 ? as_type<float>(_3395) : _3305;
        _3421 = _3423;
    }
    float _3425 = _3421;
    float _3427 = fma(_3413, _3179, _3371);
    float _3429 = _3385;
    if (!_2921)
    {
        float _3431 = 1.0 / _3385;
        _3429 = _3431;
    }
    float _3433 = _3429;
    if (_2949)
    {
        float _3435 = _3021 ? as_type<float>(_3403) : _3305;
        _3389 = _3435;
    }
    float _3437 = _3389;
    float _3439 = _3367 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3441 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3293);
    float _3443 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3283);
    float _3445 = -_102;
    float _3447 = fma(_3445, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3357);
    float _3449 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3387);
    float _3453 = fma(_3419, _3425, -0.5);
    float _3455 = fma(_3439, _3437, -0.5);
    float _3457 = fma(_3281, _3203, _3427);
    float _3459 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3461 = _3451;
    if (!_2921)
    {
        float _3463 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3465 = -_3351;
        float _3467 = fma(_3409, _3463, _3465);
        _3243 = _3467;
    }
    float _3469 = _3243;
    float _3471 = -_3451;
    float _3473 = fma(_3443, _3041, _3471);
    float _3475 = fma(_3411, _3453, _2985);
    float _3477 = fma(_3441, _3455, _3447);
    if (_2921)
    {
        _3461 = 1.0;
    }
    float _3479 = _3461;
    float _3481 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3459);
    float _3483 = _3479;
    if (!_2921)
    {
        float _3485 = _3469 * _3433;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        _3483 = _3487;
    }
    float _3489 = _3483;
    float _3491 = _3361 + 0.5;
    float _3493 = _3473 + 0.5;
    float _3495 = _3475 + 0.5;
    float _3497 = _3477 + 0.5;
    float _3499 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3481);
    float _3501 = fma(_3133, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3457);
    bool _3503 = _3489 > 0.0;
    bool _3505 = isnan(_3489);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _2832 + _2810;
    out.m_69.x = _3495;
    out.m_69.y = _3491;
    out.m_69.z = _3497;
    out.m_69.w = _3493;
    float _3515 = _3489 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3517 = _2810 * 0.5;
    float _3519 = _3499 + _2810;
    out.m_71.w = _3415;
    float _3521 = _3519 * 0.5;
    out.m_73.x = _3501;
    float _3523 = _3513 * 0.5;
    float _3525 = fma(_2842, -0.5, _3517);
    float _3527 = _3515 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2832;
    out.gl_Position.y = _2842;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _2810;
    out.m_75.x = _3523;
    out.m_75.y = _3525;
    out.m_75.z = _3521;
    out.m_75.w = _2810;
    out.m_49.x = _3527;
    float _3529 = _3007 * _2868;
    float _3531 = -_3007;
    float _3533 = _3531 + 1.0;
    float _3535 = _2879 * _3529;
    float _3537 = _2889 * _3529;
    float _3539 = _2879 * _3533;
    float _3541 = fma(_2885, _3535, _2873);
    float _3543 = fma(_2887, _3535, _2875);
    float _3545 = fma(_2879, _3537, _2877);
    out.m_77.x = _3541;
    out.m_77.y = _3543;
    out.m_77.z = _3545;
    out.m_77.w = _3539;
    if (_3511)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3547;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1076 = false;
    bool _754 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    float _112 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3614 = as_type<float>(_120);
        out.gl_Position.z = _3614;
    }
    if (!_106)
    {
        return out;
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_98);
    float _136 = in.m_51.z;
    bool _138 = _102 >= _134;
    bool _140 = !_130;
    bool _142 = _138 || _140;
    float _144 = in.m_51.w;
    if (_142)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _110;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    int _148 = 0;
    if (_142)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    out.m_53.x = _132;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3677 = as_type<float>(_152);
        out.gl_Position.z = _3677;
    }
    out.m_53.z = _136;
    out.m_53.w = _144;
    if (_142)
    {
        return out;
    }
    float _154 = in.m_55.w;
    float _156 = 1.0 / _134;
    float _158 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = _158;
    if (!_168)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _112 = _186;
    }
    float _188 = _112;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_168;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _158 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _158);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_168;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _158 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _156;
    float _266 = fma(_254, _172, _258);
    float _268 = fma(_254, _170, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _154, _178);
    float _274 = fma(_268, _154, _176);
    float _276 = fma(_270, _154, _180);
    bool _278 = !_256;
    float _280 = _264;
    float _296;
    if (!_278)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _264;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _336 = 1.0 / _316;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = _300 + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = 1.0 / _324;
    float _356 = _344 * _326;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _360 = _300 + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _364 = _300 + _362;
    bool _366 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_300);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = fma(_348, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    bool _384 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_300);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _320;
    float _398 = _360 * _336;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _402 = _300 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = fma(_352, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _410 = -_394;
    float _412 = _410 + 1.0;
    float _414 = 1.0 / _330;
    float _416 = _304 * _354;
    bool _418 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _420 = isnan(_300);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _444 = fma(_432, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = 1.0 / _334;
    float _448 = _308 * _396;
    bool _450 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _452 = isnan(_300);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = fma(_436, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _464 = 1.0 / _340;
    float _466 = _364 * _414;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _470 = _300 + _468;
    float _472 = _402 * _446;
    float _474 = -_428;
    float _476 = _474 + 1.0;
    float _478 = -_460;
    float _480 = _478 + 1.0;
    float _482 = _460 * _476;
    bool _484 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _486 = isnan(_300);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _376 * _480;
    float _498 = _470 * _464;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -_376;
    float _510 = _508 + 1.0;
    float _512 = -_494;
    float _514 = _512 + 1.0;
    float _516 = fma(_502, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _518 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_300);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = fma(_506, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _532 = _494 * _510;
    bool _534 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _536 = isnan(_300);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = _528 * _514;
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = fma(_382, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _554 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_300);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -_544;
    float _568 = _566 + 1.0;
    float _570 = _544 * _550;
    float _572 = fma(_406, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _574 = fma(_440, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _576 = _564 * _412;
    float _578 = -_564;
    float _580 = _578 + 1.0;
    float _582 = _394 * _568;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = _516 * _576;
    float _590 = _378 * _576;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _600 = _444 * _576;
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _588);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _590);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _608 = fma(_586, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _610 = fma(_594, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _612 = fma(_598, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _614 = fma(_530, _582, _602);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_408, _582, _604);
    float _630 = fma(_462, _582, _606);
    float _632 = fma(_618, _466, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _466, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _466, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = fma(_552, _570, _614);
    float _644 = fma(_572, _570, _628);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _654 = fma(_574, _570, _630);
    float _656 = fma(_640, _472, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _658 = fma(_648, _472, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _660 = fma(_652, _472, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _662 = fma(_608, _546, _642);
    float _664 = fma(_610, _546, _644);
    float _666 = fma(_612, _546, _654);
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_634, _532, _664);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _676;
    float _680 = fma(_632, _532, _662);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = fma(_636, _532, _666);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _688;
    float _692 = fma(_678, _498, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _498, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_656, _496, _680);
    float _698 = fma(_690, _498, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _700 = fma(_658, _496, _674);
    float _702 = fma(_660, _496, _686);
    float _704 = fma(_692, _482, _696);
    float _706 = fma(_694, _482, _700);
    float _708 = fma(_698, _482, _702);
    float _710 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    float _720 = _714 * _672;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _730 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _736 = !_442;
    float _752;
    if (!_736)
    {
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _740 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _744 = _742 * _738;
        float _746 = floor(_744);
        float _748 = -_746;
        float _750 = _744 + _748;
        _752 = _750;
        _754 = true;
    }
    else
    {
        _752 = _264;
    }
    _754 = false;
    float _756 = _752;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _760 = _756 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _764 = _756 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _782 = 1.0 / _768;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _784;
    float _788 = 1.0 / _780;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _792 = _756 + _790;
    bool _794 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _796 = isnan(_756);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    bool _806 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _808 = isnan(_756);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = 1.0 / _776;
    float _820 = _792 * _782;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _824 = _756 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _826;
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _832 = fma(_828, _820, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _834 = 1.0 / _772;
    float _836 = _824 * _788;
    bool _838 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _840 = isnan(_756);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    bool _850 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _852 = isnan(_756);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -_848;
    float _864 = _862 + 1.0;
    float _866 = 1.0 / _786;
    float _868 = _760 * _818;
    bool _870 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _872 = isnan(_756);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_860;
    float _884 = _882 + 1.0;
    float _886 = -_880;
    float _888 = _886 + 1.0;
    float _890 = _764 * _834;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _894 = _756 + _892;
    float _896 = _880 * _864;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _898;
    float _902 = _804 * _888;
    float _904 = -_804;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _912 = fma(_900, _820, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _914 = _894 * _866;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _916;
    float _920 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _922 = fma(_918, _820, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _924 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _926 = isnan(_756);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _860 * _906;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _946 = _816 * _884;
    float _948 = -_816;
    float _950 = _948 + 1.0;
    float _952 = fma(_940, _890, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _954 = fma(_944, _890, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _956 = _934 * _950;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _958;
    float _962 = -_934;
    float _964 = _962 + 1.0;
    float _966 = _922 * _956;
    float _968 = _832 * _956;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _974;
    float _978 = _912 * _956;
    float _980 = fma(_960, _868, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _982 = fma(_972, _868, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _984 = fma(_976, _868, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].x, _966);
    float _988 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].y, _968);
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].z, _978);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _996 = fma(_954, _946, _986);
    float _998 = fma(_920, _946, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1004 = fma(_982, _936, _996);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1010 = fma(_952, _946, _990);
    float _1012 = fma(_994, _836, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1014 = fma(_984, _936, _998);
    float _1016 = fma(_1002, _836, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1022;
    float _1026 = fma(_1008, _836, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_980, _936, _1010);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1030;
    float _1034 = fma(_1012, _902, _1004);
    float _1036 = fma(_1020, _914, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1038 = fma(_1024, _914, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1040 = fma(_1016, _902, _1014);
    float _1042 = fma(_1032, _914, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1044 = fma(_1026, _902, _1028);
    float _1046 = fma(_1036, _896, _1034);
    float _1048 = fma(_1038, _896, _1040);
    float _1050 = fma(_1042, _896, _1044);
    float _1052 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1046);
    float _1054 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1048);
    float _1056 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1050);
    bool _1058 = !_830;
    float _1074;
    if (!_1058)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1062 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _1066 = _1064 * _1060;
        float _1068 = floor(_1066);
        float _1070 = -_1068;
        float _1072 = _1066 + _1070;
        _1074 = _1072;
        _1076 = true;
    }
    else
    {
        _1074 = _264;
    }
    _1076 = false;
    float _1078 = _1074;
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1082 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1092 = 1.0 / _1086;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1098;
    bool _1102 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1104 = isnan(_1078);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1118 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1120 = isnan(_1078);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = 1.0 / _1090;
    bool _1132 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1134 = isnan(_1078);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1112;
    float _1146 = _1144 + 1.0;
    float _1148 = -_1128;
    float _1150 = _1148 + 1.0;
    float _1152 = -_1142;
    float _1154 = _1152 + 1.0;
    bool _1156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1158 = 1.0 / _1096;
    float _1160 = _1100 * _1092;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1162;
    float _1166 = _1164 * _1130;
    float _1168 = _1142 * _1146;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1174 = 1.0 / _1172;
    float _1176 = _1116 * _1158;
    bool _1178 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_1078);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1194 = _1188 * _1154;
    float _1196 = -_1188;
    float _1198 = _1196 + 1.0;
    bool _1200 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1202 = isnan(_1078);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = 1.0 / _1192;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1216 = _1078 + _1214;
    float _1218 = _1128 * _1198;
    bool _1220 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1222 = isnan(_1078);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1210;
    float _1234 = _1232 + 1.0;
    float _1236 = _1210 * _1150;
    float _1238 = fma(_1160, _1216, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1244 = _1230 * _1234;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1248 = _1078 + _1246;
    float _1250 = -_1230;
    float _1252 = _1250 + 1.0;
    float _1254 = 1.0 / _1242;
    float _1256 = _1238 * _1244;
    float _1258 = fma(_1176, _1248, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1270 = _1078 + _1268;
    float _1272 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1256);
    float _1274 = _1262 * _1212;
    float _1276 = _1266 * _1174;
    float _1278 = fma(_1166, _1270, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1280 = fma(_1258, _1236, _1272);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1284 = _1078 + _1282;
    bool _1286 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _1288 = isnan(_1078);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1304 = _1078 + _1302;
    float _1306 = fma(_1276, _1284, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1308 = fma(_1278, _1218, _1280);
    float _1310 = _1300 * _1254;
    float _1312 = fma(_1274, _1304, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _1314 = -_1296;
    float _1316 = _1314 + 1.0;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1320 = _1078 + _1318;
    float _1322 = fma(_1306, _1194, _1308);
    float _1324 = _1112 * _1316;
    float _1326 = fma(_1310, _1320, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1328 = fma(_1312, _1168, _1322);
    float _1330 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1332 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = fma(_1326, _1324, _1328);
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[137].x, _1336);
    float _1342 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1344 = !_1156;
    if (!_1344)
    {
        float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1348 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _1352 = _1350 * _1346;
        float _1354 = floor(_1352);
        float _1356 = -_1354;
        float _1358 = _1352 + _1356;
        _280 = _1358;
    }
    float _1360 = _280;
    float _1362 = in.m_57.x;
    float _1364 = in.m_57.y;
    float _1366 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1368 = log2(_1366);
    float _1370 = _102 * 0.039999999105930328369140625;
    float _1372 = _136 * 2.0;
    float _1374 = in.m_51.y;
    float _1376 = _144 * 6.283185482025146484375;
    float _1378 = _1370 * 0.15915493667125701904296875;
    float _1380 = _132 * 2.0;
    float _1382 = _132 + _136;
    float _1384 = floor(_1372);
    float _1386 = _1382 + (-1.0);
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1390 = floor(_1380);
    float _1392 = fma(_102, 0.010999999940395355224609375, _1376);
    float _1394 = _1392 * 0.15915493667125701904296875;
    float _1396 = abs(_1362);
    float _1398 = abs(_1364);
    float _1400 = precise::max(_1396, _1398);
    float _1402 = _1364 * 0.0625;
    float _1404 = _1362 * 0.0625;
    float _1406 = _1378 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    bool _1410 = _1400 >= 16.0;
    float _1412 = _102 * _1368;
    float _1414 = _1374 * 6.283185482025146484375;
    float _1416 = _1374 * 2.0;
    float _1418 = _1410 ? _1402 : _1364;
    float _1420 = _1410 ? _1404 : _1362;
    float _1422 = fma(_102, 0.007000000216066837310791015625, _1414);
    float _1424 = abs(_1418);
    bool _1426 = _1424 != 0.0;
    bool _1428 = isnan(_1424);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    float _1436 = floor(_1416);
    float _1438 = abs(_1420);
    bool _1440 = _1438 == 0.0;
    float _1442 = _1422 * 0.15915493667125701904296875;
    float _1444 = abs(_1420);
    bool _1446 = _1444 == 0.0;
    bool _1448 = !_1434;
    bool _1450 = _1446 && _1448;
    float _1452 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1454 = _1384 > 0.0;
    bool _1456 = _1384 >= 0.0;
    bool _1458 = isnan(_1384);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = exp2(_1412);
    float _1468 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1470 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1472 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1452);
    float _1474 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1468);
    float _1476 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1470);
    float _1478 = _1394 * 6.283185482025146484375;
    float _1480 = sin(_1478);
    bool _1482 = false;
    int _1484 = as_type<int>(_1382);
    if (_1450)
    {
        bool _1486 = as_type<int>(_1420) >= 0;
        _1482 = _1486;
    }
    bool _1488 = _1482;
    int _1490 = _1488 ? (-1) : 0;
    if (_1450)
    {
        int _1492 = _1488 ? 0 : 1078530011;
        _1484 = _1492;
    }
    int _1494 = _1484;
    float _1496 = _1442 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    int _1500 = _1494;
    if (_1450)
    {
        int _1502 = int(0x80000000) & as_type<int>(_1418);
        int _1504 = _1494 | _1502;
        _1500 = _1504;
    }
    int _1506 = _1500;
    bool _1508 = !_1434;
    bool _1510 = _1508 && _1440;
    int _1512 = _1506;
    float _1514 = as_type<float>(_1506);
    if (!_1510)
    {
        float _1516 = abs(_1418);
        bool _1518 = _1516 != as_type<float>(0x7f800000u /* inf */);
        bool _1520 = isnan(_1516);
        bool _1522 = _1518 || _1520;
        bool _1524 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1526 = _1522 || _1524;
        float _1528 = abs(_1420);
        bool _1530 = _1528 == as_type<float>(0x7f800000u /* inf */);
        float _1532 = abs(_1420);
        bool _1534 = _1532 == as_type<float>(0x7f800000u /* inf */);
        bool _1536 = !_1526;
        bool _1538 = _1534 && _1536;
        if (_1538)
        {
            bool _1540 = as_type<int>(_1420) >= 0;
            _1490 = _1540 ? (-1) : 0;
        }
        int _1542 = _1490;
        if (_1538)
        {
            _1512 = 1075235812;
        }
        int _1544 = _1512;
        int _1546 = _1544;
        if (_1538)
        {
            int _1548 = ~_1542;
            int _1550 = (_1548 != 0) ? _1544 : 1061752795;
            _1546 = _1550;
        }
        int _1552 = _1546;
        float _1554 = as_type<float>(_1552);
        if (_1538)
        {
            int _1556 = int(0x80000000) & as_type<int>(_1418);
            int _1558 = _1552 | _1556;
            _1554 = as_type<float>(_1558);
        }
        float _1560 = _1554;
        bool _1562 = !_1526;
        bool _1564 = _1562 && _1530;
        _1514 = _1560;
        if (!_1564)
        {
            float _1566 = abs(_1418);
            float _1568 = abs(_1420);
            float _1570 = precise::max(_1566, _1568);
            float _1572 = abs(_1418);
            float _1574 = abs(_1420);
            float _1576 = precise::min(_1572, _1574);
            float _1578 = 1.0 / _1570;
            float _1580 = abs(_1418);
            float _1582 = abs(_1420);
            bool _1584 = _1580 > _1582;
            bool _1586 = as_type<int>(_1420) >= 0;
            float _1588 = _1576 * _1578;
            float _1590 = _1588 * _1588;
            float _1592 = _1590 + 11.33538818359375;
            float _1594 = fma(_1590, _1592, 28.84246826171875);
            float _1596 = fma(_1590, _1594, 19.6966705322265625);
            float _1598 = fma(_1590, -0.82336294651031494140625, -5.674867153167724609375);
            float _1600 = fma(_1590, _1598, -6.565555095672607421875);
            float _1602 = 1.0 / _1596;
            float _1604 = _1590 * _1600;
            float _1606 = abs(_1418);
            float _1608 = abs(_1420);
            float _1610 = _1606 + _1608;
            int _1612 = as_type<int>(_1418) & int(0x80000000);
            float _1614 = _1588 * _1604;
            bool _1616 = _1610 > as_type<float>(0x7f800000u /* inf */);
            bool _1618 = isnan(_1610);
            bool _1620 = _1616 || _1618;
            bool _1622 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1624 = _1620 || _1622;
            float _1626 = fma(_1614, _1602, _1588);
            float _1628 = _1626;
            _1514 = _1610;
            if (_1584)
            {
                float _1630 = -_1626;
                float _1632 = _1630 + 1.57079637050628662109375;
                _1628 = _1632;
            }
            float _1634 = _1628;
            int _1636 = as_type<int>(_1634);
            if (!_1586)
            {
                float _1638 = -_1634;
                float _1640 = _1638 + 3.1415927410125732421875;
                _1636 = as_type<int>(_1640);
            }
            int _1642 = _1636;
            if (!_1624)
            {
                int _1644 = _1612 | _1642;
                _1514 = as_type<float>(_1644);
            }
        }
    }
    float _1646 = _1514;
    float _1648 = _132 + _1374;
    float _1650 = abs(_1498);
    float _1652 = log2(_1650);
    float _1654 = _136 + _1374;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1658 = _1648 + (-1.0);
    float _1660 = _1654 + (-1.0);
    float _1662 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1656);
    float _1664 = abs(_1480);
    float _1666 = log2(_1664);
    float _1668 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1672 = _1464 ? 0 : 1;
    float _1674 = fma(_1408, 9.0, _102);
    bool _1676 = _1390 > 0.0;
    float _1678 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1474);
    int _1688 = _1684;
    if (!_1454)
    {
        int _1690 = ~_1672;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    float _1696 = _1652 * 120.0;
    bool _1698 = _1390 >= 0.0;
    bool _1700 = isnan(_1390);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(0.0);
    bool _1706 = _1702 || _1704;
    float _1708 = _1674 * 0.20999999344348907470703125;
    float _1710 = _1674 * (-0.1599999964237213134765625);
    bool _1712 = _1436 > 0.0;
    float _1714 = fma(_1646, 5.00000095367431640625, _1708);
    float _1716 = _1666 * 80.0;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1720 = 1.0 + _1718;
    float _1722 = fma(_1646, 4.000000476837158203125, _1710);
    bool _1724 = _1436 >= 0.0;
    bool _1726 = isnan(_1436);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    float _1734 = _1714 * 0.15915493667125701904296875;
    float _1736 = _1722 * 0.15915493667125701904296875;
    float _1738 = 1.0 / _1720;
    int _1740 = _1706 ? 0 : 1;
    float _1742 = _1678 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1746 = _1744 != 0;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1750 = _1748 != 0;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1754 = _1752 != 0;
    float _1756 = -_1466;
    float _1758 = _1756 + 1.0;
    float _1760 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1662);
    bool _1762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1764 = isnan(0.0);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1770 = _1766 || _1768;
    float _1772 = exp2(_1716);
    bool _1774 = !_1746;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = ~_1740;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    int _1784 = abs(_1776);
    float _1786 = -_1742;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1790 = _1782;
    float _1792 = _1788;
    bool _1794 = _1732;
    if (!_1676)
    {
        int _1796 = ~_1740;
        int _1798 = _1796 + 1;
        _1790 = _1798;
    }
    int _1800 = _1790;
    float _1802 = exp2(_1696);
    float _1804 = _1686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1806 = _1770 ? _1758 : 0.0;
    float _1808 = float(_1694);
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1812 = _1804 + _1810;
    float _1814 = float(_1784);
    float _1816 = _1806 * _1738;
    float _1818 = _1734 * 6.283185482025146484375;
    float _1820 = sin(_1818);
    int _1822 = _1732 ? 0 : 1;
    float _1824 = _1814 * _1808;
    float _1826 = abs(_1812);
    float _1828 = abs(_1788);
    float _1830 = precise::max(_1826, _1828);
    int _1832 = ~_1822;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    float _1838 = _1824 * (-2.0);
    float _1840 = _1736 * 6.283185482025146484375;
    float _1842 = sin(_1840);
    float _1844 = _1772 + _1802;
    int _1846 = _1836;
    if (!_1712)
    {
        int _1848 = ~_1822;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    float _1854 = fma(_1668, _1838, _1668);
    bool _1856 = _1830 >= 16.0;
    bool _1858 = !_1754;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = rsqrt(_1760);
    float _1864 = float(_1852);
    bool _1866 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1868 = isnan(1.0);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1874 = _1870 || _1872;
    float _1876 = _1820 + _1842;
    float _1878 = _132 + (-0.5);
    float _1880 = in.m_59.x;
    float _1882 = in.m_59.y;
    float _1884 = in.m_59.z;
    bool _1886 = !_1874;
    float _1888 = _1886 ? _102 : _1816;
    if (_1856)
    {
        float _1890 = _1788 * 0.0625;
        _1792 = _1890;
    }
    float _1892 = _1792;
    float _1894 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _1896 = !_1750;
    int _1898 = _1896 ? 0 : 1;
    float _1900 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1902 = precise::max(_1876, -2.0);
    float _1904 = fma(_1888, _1854, _1894);
    int _1906 = abs(_1898);
    float _1908 = _1900 * (-0.15915493667125701904296875);
    int _1910 = abs(_1860);
    float _1912 = _1904 * 0.15915493667125701904296875;
    float _1914 = float(_1800);
    float _1916 = _1908 * 6.283185482025146484375;
    float _1918 = cos(_1916);
    float _1920 = precise::min(_1902, 2.0);
    float _1922 = float(_1906);
    float _1924 = float(_1910);
    float _1926 = fma(_1920, 0.25, 0.5);
    float _1928 = _1908 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    float _1932 = _1922 * _1914;
    float _1934 = abs(_1892);
    bool _1936 = _1934 == 0.0;
    float _1938 = _1926 * 0.07999999821186065673828125;
    float _1940 = _1924 * _1864;
    float _1942 = _136 + (-0.5);
    float _1944 = _1932 * (-2.0);
    float _1946 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1948 = _1940 * (-2.0);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1952 = fma(_1670, _1944, _1670);
    float _1954 = fma(_1364, _1946, _1882);
    float _1956 = _102 * (-0.17000000178813934326171875);
    float _1958 = fma(_1388, _1948, _1388);
    float _1960 = _132 * 6.283185482025146484375;
    float _1962 = _1374 * (-0.87964594364166259765625);
    float _1964 = fma(_1954, 16.0, _1956);
    float _1966 = fma(_1888, _1958, _1950);
    float _1968 = _1812 * 0.0625;
    float _1970 = _1374 + (-0.5);
    float _1972 = _1964 + _1960;
    float _1974 = fma(_1954, 9.0, _1962);
    float _1976 = _1966 * 0.15915493667125701904296875;
    float _1978 = _1912 * 6.283185482025146484375;
    float _1980 = sin(_1978);
    float _1982 = _1856 ? _1968 : _1812;
    float _1984 = _1972 * 0.15915493667125701904296875;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1988 = _1414 + _1974;
    float _1990 = abs(_1982);
    bool _1992 = _1990 != 0.0;
    bool _1994 = isnan(_1990);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan(0.0);
    bool _2000 = _1996 || _1998;
    float _2002 = fma(_1362, _1946, _1880);
    float _2004 = fma(_1888, _1952, _1986);
    float _2006 = _1912 * 6.283185482025146484375;
    float _2008 = cos(_2006);
    float _2010 = _1988 * 0.15915493667125701904296875;
    float _2012 = abs(_1892);
    bool _2014 = _2012 == 0.0;
    bool _2016 = !_2000;
    bool _2018 = _2014 && _2016;
    float _2020 = fma(_1954, 0.5, 0.5);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1984 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    float _2028 = _102 * (-0.37000000476837158203125);
    float _2030 = fma(_2022, -2.0, 3.0);
    float _2032 = fma(_1954, 0.58823525905609130859375, 0.411764681339263916015625);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = fma(_1954, 5.0, _2028);
    float _2038 = fma(_2034, -2.0, 3.0);
    float _2040 = _1976 * 6.283185482025146484375;
    float _2042 = sin(_2040);
    float _2044 = _2036 + _1376;
    int _2046 = as_type<int>(_2030);
    float _2048 = 0.58823525905609130859375;
    if (_2018)
    {
        bool _2050 = as_type<int>(_1892) >= 0;
        _1794 = _2050;
    }
    bool _2052 = _1794;
    float _2054 = _2044 * 0.15915493667125701904296875;
    float _2056 = _2022 * _2022;
    float _2058 = _2010 * 6.283185482025146484375;
    float _2060 = sin(_2058);
    float _2062 = _2026 * 0.064000003039836883544921875;
    float _2064 = _2030 * _2056;
    int _2066 = _2052 ? (-1) : 0;
    if (_2018)
    {
        int _2068 = _2052 ? 0 : 1078530011;
        _2046 = _2068;
    }
    int _2070 = _2046;
    float _2072 = _2034 * _2034;
    float _2074 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _2076 = _2070;
    if (_2018)
    {
        int _2078 = int(0x80000000) & as_type<int>(_1982);
        int _2080 = _2070 | _2078;
        _2048 = as_type<float>(_2080);
    }
    float _2082 = _2048;
    float _2084 = _2054 * 6.283185482025146484375;
    float _2086 = sin(_2084);
    bool _2088 = !_2000;
    bool _2090 = _2088 && _1936;
    float _2092 = _2082;
    float _2094 = _2082;
    if (!_2090)
    {
        float _2096 = abs(_1982);
        bool _2098 = _2096 != as_type<float>(0x7f800000u /* inf */);
        bool _2100 = isnan(_2096);
        bool _2102 = _2098 || _2100;
        bool _2104 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2106 = _2102 || _2104;
        float _2108 = abs(_1892);
        bool _2110 = _2108 == as_type<float>(0x7f800000u /* inf */);
        float _2112 = abs(_1892);
        bool _2114 = _2112 == as_type<float>(0x7f800000u /* inf */);
        bool _2116 = !_2106;
        bool _2118 = _2114 && _2116;
        if (_2118)
        {
            bool _2120 = as_type<int>(_1892) >= 0;
            _2066 = _2120 ? (-1) : 0;
        }
        int _2122 = _2066;
        if (_2118)
        {
            _2076 = 1075235812;
        }
        int _2124 = _2076;
        int _2126 = _2124;
        if (_2118)
        {
            int _2128 = ~_2122;
            int _2130 = (_2128 != 0) ? _2124 : 1061752795;
            _2126 = _2130;
        }
        int _2132 = _2126;
        if (_2118)
        {
            int _2134 = int(0x80000000) & as_type<int>(_1982);
            int _2136 = _2132 | _2134;
            _2092 = as_type<float>(_2136);
        }
        float _2138 = _2092;
        bool _2140 = !_2106;
        bool _2142 = _2140 && _2110;
        _2094 = _2138;
        if (!_2142)
        {
            float _2144 = abs(_1982);
            float _2146 = abs(_1892);
            float _2148 = precise::max(_2144, _2146);
            float _2150 = abs(_1982);
            float _2152 = abs(_1892);
            float _2154 = precise::min(_2150, _2152);
            float _2156 = 1.0 / _2148;
            float _2158 = abs(_1982);
            float _2160 = abs(_1892);
            bool _2162 = _2158 > _2160;
            bool _2164 = as_type<int>(_1892) >= 0;
            float _2166 = _2154 * _2156;
            float _2168 = _2166 * _2166;
            float _2170 = _2168 + 11.33538818359375;
            float _2172 = fma(_2168, _2170, 28.84246826171875);
            float _2174 = fma(_2168, _2172, 19.6966705322265625);
            float _2176 = fma(_2168, -0.82336294651031494140625, -5.674867153167724609375);
            float _2178 = fma(_2168, _2176, -6.565555095672607421875);
            float _2180 = 1.0 / _2174;
            float _2182 = _2168 * _2178;
            float _2184 = abs(_1982);
            float _2186 = abs(_1892);
            float _2188 = _2184 + _2186;
            int _2190 = as_type<int>(_1982) & int(0x80000000);
            float _2192 = _2166 * _2182;
            bool _2194 = _2188 > as_type<float>(0x7f800000u /* inf */);
            bool _2196 = isnan(_2188);
            bool _2198 = _2194 || _2196;
            bool _2200 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2202 = _2198 || _2200;
            float _2204 = fma(_2192, _2180, _2166);
            float _2206 = _2204;
            _2094 = _2188;
            if (_2162)
            {
                float _2208 = -_2204;
                float _2210 = _2208 + 1.57079637050628662109375;
                _2206 = _2210;
            }
            float _2212 = _2206;
            int _2214 = as_type<int>(_2212);
            if (!_2164)
            {
                float _2216 = -_2212;
                float _2218 = _2216 + 3.1415927410125732421875;
                _2214 = as_type<int>(_2218);
            }
            int _2220 = _2214;
            if (!_2202)
            {
                int _2222 = _2190 | _2220;
                _2094 = as_type<float>(_2222);
            }
        }
    }
    float _2224 = _2094;
    float _2226 = fma(_2062, _2074, _2002);
    float _2228 = _2060 * 0.07299999892711639404296875;
    float _2230 = _2086 * _1844;
    float _2232 = _2038 * _2072;
    float _2234 = fma(_2228, _2074, _2226);
    float _2236 = _2230 * 0.180000007152557373046875;
    float _2238 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2240 = -_2224;
    float _2242 = _2004 + _2240;
    float _2244 = _1954 + 0.20000000298023223876953125;
    float _2246 = _2236 * _2232;
    float _2248 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2238);
    float _2250 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2252 = _2242 * 0.15915493667125701904296875;
    float _2254 = _1930 * _1884;
    float _2256 = _1976 * 6.283185482025146484375;
    float _2258 = cos(_2256);
    float _2260 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[191].x, _2234);
    float _2262 = _136 * 6.283185482025146484375;
    float _2264 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2266 = _1918 * _1884;
    float _2268 = fma(_102, 0.10999999940395355224609375, _1960);
    float _2270 = fma(_102, 0.310000002384185791015625, _2262);
    float _2272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2260);
    float _2274 = _2252 * 6.283185482025146484375;
    float _2276 = sin(_2274);
    float _2278 = -_2254;
    float _2280 = fma(_1918, _2244, _2278);
    float _2282 = _2270 * 0.15915493667125701904296875;
    float _2284 = fma(_1930, _2244, _2266);
    float _2286 = _2272 * _2250;
    float _2288 = _2280 + (-0.20000000298023223876953125);
    float _2290 = _2268 * 0.15915493667125701904296875;
    float _2292 = _2252 * 6.283185482025146484375;
    float _2294 = cos(_2292);
    float _2296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2288);
    float _2298 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1472);
    float _2300 = _1980 * _2276;
    float _2302 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2304 = _2264 * _2296;
    float _2306 = _2282 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2284);
    float _2312 = _2008 * _2276;
    float _2314 = _2258 * _2304;
    float _2316 = _2008 * _2294;
    float _2318 = _1980 * _2294;
    float _2320 = _2310 * _2302;
    float _2322 = 1.0 / _2264;
    float _2324 = fma(_2042, _2316, _2300);
    float _2326 = _2008 * _2314;
    float _2328 = -_2318;
    float _2330 = fma(_2042, _2312, _2328);
    float _2332 = fma(_2042, _2300, _2316);
    float _2334 = fma(_2324, _2286, _2326);
    float _2336 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2248);
    float _2338 = _2290 * 6.283185482025146484375;
    float _2340 = sin(_2338);
    float _2342 = fma(_2308, 0.12999999523162841796875, 1.0);
    float _2344 = fma(_2330, _2320, _2334);
    float _2346 = _2298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2348 = -_2312;
    float _2350 = fma(_2042, _2318, _2348);
    float _2352 = _1980 * _2314;
    float _2354 = -_2304;
    float _2356 = _2042 * _2354;
    float _2358 = _2346 + _2344;
    float _2360 = sqrt(_2336);
    float _2362 = fma(_2350, _2286, _2352);
    float _2364 = _2294 * _2258;
    float _2366 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2368 = _2358 + _2366;
    float _2370 = _2276 * _2258;
    float _2372 = fma(_2332, _2320, _2362);
    float _2374 = fma(_2364, _2286, _2356);
    float _2376 = _2368 * _2322;
    float _2378 = fma(_2340, 0.300000011920928955078125, _2342);
    float _2380 = _1742 + _2372;
    float _2382 = fma(_2370, _2320, _2374);
    float _2384 = fma(_2376, _2376, _2376);
    float _2386 = _1804 + _2382;
    float _2388 = _2360 * 0.64999997615814208984375;
    float _2390 = _2384 * _2388;
    float _2392 = _2378 * _2390;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2380);
    float _2396 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2386);
    float _2398 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2358);
    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2402 = _2394 + _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2406 = _2396 + _2404;
    float _2408 = _2402 * _2402;
    float _2410 = fma(_2406, _2406, _2408);
    float _2412 = sqrt(_2410);
    bool _2414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan(0.5);
    bool _2422 = _2418 || _2420;
    bool _2424 = _2412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2426 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2428 = _2358;
    float _2430 = _2396;
    float _2432 = _2402;
    float _2434 = _2316;
    float _2436 = _2322;
    float _2438 = _2314;
    if (!_2424)
    {
        _2426 = _2396;
    }
    float _2440 = _2426;
    float _2442 = _2440;
    if (!_2424)
    {
        _2428 = _2394;
    }
    float _2444 = _2428;
    float _2446 = _2444;
    if (!_2424)
    {
        _2430 = _2398;
    }
    float _2448 = _2430;
    bool _2450 = !_2424;
    float _2452 = _2448;
    if (!_2450)
    {
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2458 = _2412 + _2456;
        float _2460 = _2398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2462 = rsqrt(_2410);
        float _2464 = _2458 * _2454;
        float _2466 = _2464 * 0.15915493667125701904296875;
        float _2468 = _2466 * 6.283185482025146484375;
        float _2470 = sin(_2468);
        float _2472 = _2466 * 6.283185482025146484375;
        float _2474 = cos(_2472);
        float _2476 = fma(_2470, _2460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2478 = _2462 * _2476;
        float _2480 = _2474 + (-1.0);
        float _2482 = fma(_2406, _2478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2484 = fma(_2402, _2478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2488 = fma(_2398, _2474, _2486);
        _2452 = _2488;
        _2442 = _2482;
        _2446 = _2484;
    }
    float _2490 = _2452;
    float _2492 = _2442;
    float _2494 = _2446;
    float _2496 = _2490;
    float _2498 = _2492;
    float _2500 = _2494;
    if (!_2422)
    {
        float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2504 = _2346 + _2502;
        float _2506 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2508 = -_2346;
        float _2510 = _2508 + _2490;
        float _2512 = _2504 * _2504;
        float _2514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2516 = _1742 + _2514;
        float _2518 = fma(_1812, _1812, _2512);
        float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2522 = fma(_2516, _2516, _2518);
        float _2524 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2526 = sqrt(_2522);
        float _2528 = -_1804;
        float _2530 = _2528 + _2492;
        float _2532 = precise::min(_2526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2534 = _2532 * _2520;
        float _2536 = _2524 * _2534;
        float _2538 = -_1742;
        float _2540 = _2538 + _2494;
        float _2542 = fma(_2530, _2536, _1804);
        float _2544 = fma(_2510, _2536, _2346);
        float _2546 = fma(_2540, _2536, _1742);
        _2496 = _2544;
        _2498 = _2542;
        _2500 = _2546;
    }
    float _2548 = _2496;
    float _2550 = _2498;
    float _2552 = _2500;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2556 = _2548 + _2554;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2560 = _2550 + _2558;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2552 + _2562;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = sqrt(_2570);
    float _2576 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2578 = _2560 * _2576;
    float _2580 = _2564 * _2576;
    float _2582 = _2578 * _2578;
    float _2584 = _2580 * _2580;
    float _2586 = _2582 + _2584;
    float _2588 = sqrt(_2586);
    bool _2590 = _2588 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2594 = _2588 + _2592;
    float _2596 = _2568;
    float _2598 = _2586;
    float _2600 = _2594;
    float _2602 = _2556;
    if (_2590)
    {
        float _2604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2596 = _2604;
    }
    float _2606 = _2596;
    if (_2590)
    {
        float _2608 = rsqrt(_2586);
        _2598 = _2608;
    }
    float _2610 = _2598;
    float _2612 = _2610;
    if (_2590)
    {
        float _2614 = _2594 * _2606;
        _2600 = _2614;
    }
    float _2616 = _2600;
    if (_2590)
    {
        float _2618 = _2616 * 0.15915493667125701904296875;
        _2432 = _2618;
    }
    float _2620 = _2432;
    float _2622 = _2564;
    float _2624 = _2620;
    if (_2590)
    {
        float _2626 = _2620 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2622 = _2628;
    }
    float _2630 = _2622;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2634 = precise::max(0.0, _2632);
    float _2636 = _2606;
    float _2638 = _2634;
    if (_2590)
    {
        float _2640 = _2620 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        _2636 = _2642;
    }
    float _2644 = _2636;
    float _2646 = -_2576;
    float _2648 = -_2634;
    float _2650 = fma(_2556, _2646, _2648);
    if (_2590)
    {
        float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2602 = _2652;
    }
    float _2654 = _2602;
    float _2656 = _2654;
    float _2658 = _2630;
    if (_2590)
    {
        float _2660 = fma(_2630, _2654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2656 = _2660;
    }
    float _2662 = _2656;
    float _2664 = _2662;
    if (!_2590)
    {
        _2658 = _2578;
    }
    float _2666 = _2658;
    float _2668 = _2666;
    float _2670 = _2644;
    if (_2590)
    {
        float _2672 = _2644 + (-1.0);
        _2638 = _2672;
    }
    float _2674 = _2638;
    float _2676 = _2674;
    if (_2590)
    {
        float _2678 = _2610 * _2662;
        _2434 = _2678;
    }
    float _2680 = _2434;
    if (!_2590)
    {
        _2664 = _2650;
    }
    float _2682 = _2664;
    float _2684 = _2682;
    if (_2590)
    {
        float _2686 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2624 = _2686;
    }
    float _2688 = _2624;
    if (_2590)
    {
        float _2690 = _2578 * _2680;
        _2668 = _2690;
    }
    float _2692 = _2668;
    if (!_2590)
    {
        _2676 = _2580;
    }
    float _2694 = _2676;
    float _2696 = _2694;
    if (_2590)
    {
        float _2698 = _2580 * _2680;
        _2696 = _2698;
    }
    float _2700 = _2696;
    if (!_2590)
    {
        _2612 = _2582;
    }
    float _2702 = _2612;
    float _2704 = _2702;
    if (_2590)
    {
        float _2706 = fma(_2650, _2644, _2688);
        _2684 = _2706;
    }
    float _2708 = _2684;
    if (_2590)
    {
        float _2710 = _2692 * _2692;
        _2704 = _2710;
    }
    float _2712 = _2704;
    if (!_2590)
    {
        _2670 = _2584;
    }
    float _2714 = _2670;
    float _2716 = _2714;
    if (_2590)
    {
        float _2718 = _2700 * _2700;
        _2716 = _2718;
    }
    float _2720 = _2716;
    float _2722 = fma(_2708, _2708, _2712);
    float _2724 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2726 = _2722 + _2720;
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2730 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2728);
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2724);
    float _2736 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2738 = rsqrt(_2726);
    float _2740 = -_2732;
    float _2742 = _2740 + 1.0;
    float _2744 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2746 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2734);
    float _2748 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2750 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2736);
    float _2752 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2754 = _2746 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2756 = abs(_2742);
    float _2758 = log2(_2756);
    float _2760 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2748);
    float _2762 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2750);
    float _2764 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2752);
    float _2766 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2768 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2760);
    float _2770 = _2762 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2772 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2764);
    float _2774 = _2738 * _2692;
    float _2776 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2778 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2780 = _2738 * _2708;
    float _2782 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2784 = _2738 * _2700;
    float _2786 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2778);
    float _2788 = -_2766;
    float _2790 = fma(_2788, _2744, 1.0);
    float _2792 = -_2782;
    float _2794 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2792);
    float _2796 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2798 = _2772 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2800 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2786);
    float _2802 = -_2784;
    float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2794);
    float _2806 = exp2(_2796);
    float _2808 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2810 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2800);
    float _2812 = fma(_2804, -0.5, 0.5);
    float _2814 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2816 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2808);
    float _2818 = fma(_2804, 0.5, 0.5);
    float _2820 = _2780 + 1.0;
    float _2822 = log2(_2790);
    float _2824 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2814);
    float _2826 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2816);
    float _2828 = fma(_2818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2830 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2824);
    float _2832 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2826);
    float _2834 = fma(_2818, _2828, -0.212114393711090087890625);
    float _2836 = 1.0 / _2810;
    float _2838 = -_2780;
    float _2840 = fma(_2806, _2820, _2838);
    float _2842 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2830);
    float _2844 = fma(_2818, _2834, 1.570728778839111328125);
    float _2846 = sqrt(_2812);
    float _2848 = _2822 * 0.693147182464599609375;
    float _2850 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2852 = fma(_2840, 0.5, 0.5);
    float _2854 = _2832 * _2836;
    float _2856 = _2842 * _2836;
    float _2858 = fma(_2854, 0.5, 0.5);
    float _2860 = fma(_2856, -0.5, 0.5);
    float _2862 = _2846 * 0.636619746685028076171875;
    float _2864 = -_2844;
    float _2866 = fma(_2862, _2864, 1.0);
    float3 _7898 = float3(_2858, _2860, _2850);
    float _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7898, float3(0.0), isnan(_7898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7898, float3(0.0), isnan(_7898)), level(0.0)).x;
    float3 _7909 = float3(_2858, _2860, _2850);
    float4 _2871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7909, float3(0.0), isnan(_7909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7909, float3(0.0), isnan(_7909)), level(0.0)).xyzw;
    float _2873 = _2871.x;
    float _2875 = _2871.y;
    float _2877 = _2871.z;
    float _2879 = _2871.w;
    float2 _7926 = float2(_2866, _2852);
    float3 _2883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7926, float2(0.0), isnan(_7926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7926, float2(0.0), isnan(_7926)), level(0.0)).xyz;
    float _2885 = _2883.x;
    float _2887 = _2883.y;
    float _2889 = _2883.z;
    float _2891 = in.m_61.y;
    float _2893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2895 = _144 > 0.5;
    out.m_63.x = _730;
    out.m_63.y = _732;
    out.m_63.z = _734;
    out.m_63.w = _722;
    float _2897 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _1332;
    out.m_65.y = _1334;
    out.m_65.z = _1338;
    out.m_65.w = _1342;
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2901 = _2899 != 0;
    float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2909 = _2907 != 0;
    float _2911 = exp2(_2897);
    bool _2913 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2915 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2917 = _2913 || _2915;
    bool _2919 = isnan(0.5);
    bool _2921 = _2917 || _2919;
    out.m_67.x = _2260;
    out.m_67.y = _2288;
    out.m_67.z = _2284;
    float _2923 = _2893 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2925 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2929 = 1.0 / _2905;
    float _2931 = -_2891;
    float _2933 = _2931 + 1.0;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2937 = -_2927;
    float _2939 = fma(_2925, 2.0, _2937);
    float _2941 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2943 = _2941 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2949 = _2947 != 0;
    float _2951 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2953 = _2951 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2955 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2957 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2945);
    bool _2959 = _2895;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _2963 = _2891;
    if (!_2901)
    {
        _2436 = _1374;
    }
    float _2965 = _2436;
    float _2967 = fma(_2955, -2.0, _2935);
    int _2969 = _2895 ? as_type<int>(_2933) : as_type<int>(_2891);
    float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2973 = _2971 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2975 = 1.0 / _2953;
    float _2977 = _2965;
    if (_2909)
    {
        bool _2979 = _132 > 0.5;
        _2959 = _2979;
    }
    bool _2981 = _2959;
    float _2983 = -_102;
    float _2985 = fma(_2983, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2939);
    if (_2901)
    {
        _2977 = _132;
    }
    float _2987 = _2977;
    float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2991 = _2989 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2995 = _2993 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2999 = _2997 != 0;
    float _3001 = -_2911;
    float _3003 = _3001 + 1.0;
    float _3005 = 1.0 / _2995;
    float _3007 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3011 = _3009 != 0;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3015 = _2999 ? as_type<float>(_2969) : _2891;
    bool _3017 = _2999;
    if (_2949)
    {
        bool _3019 = _136 > 0.5;
        _3017 = _3019;
    }
    bool _3021 = _3017;
    float _3023 = 1.0 / _2991;
    if (!_2901)
    {
        _2961 = _136;
    }
    float _3025 = _2961;
    float _3027 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3013);
    float _3029 = _3025;
    if (!_2901)
    {
        _2438 = _136;
    }
    float _3031 = _2438;
    float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3033;
    float _3037 = _3031;
    if (_2901)
    {
        _3029 = _1374;
    }
    float _3039 = _3029;
    float _3041 = fma(_3015, _2923, -0.5);
    if (_2901)
    {
        _3037 = _1374;
    }
    float _3043 = _3037;
    float _3045 = 1.0 / _2973;
    float _3047 = _3035 * _2929;
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3051 = _3049 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _3053 = _1374 > 0.5;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3057 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3055;
    float _3059 = 1.0 / _2943;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3063 = _3061 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3065 = _3051 * _2975;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3071 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3073 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3071;
    float _3075 = _3057 * _3023;
    float _3077 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3079 = _3077 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3081 = _3069 * _3005;
    float _3083 = 1.0 / _3063;
    float _3085 = _3073 * _3045;
    float _3087 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3089 = _1360 + _3087;
    float _3091 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3093 = _1360 + _3091;
    float _3095 = fma(_3085, _3089, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3097 = fma(_3047, _3093, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3099 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3101 = _1360 + _3099;
    float _3103 = _3079 * _3059;
    float _3105 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3107 = _1360 + _3105;
    bool _3109 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3111 = isnan(_1360);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3117 = _3113 || _3115;
    float _3119 = float(_3117);
    float _3121 = fma(_3075, _3101, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _3123 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3125 = isnan(_1360);
    bool _3127 = _3123 || _3125;
    bool _3129 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3131 = _3127 || _3129;
    float _3133 = float(_3131);
    float _3135 = fma(_3103, _3107, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _3137 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3139 = isnan(_1360);
    bool _3141 = _3137 || _3139;
    bool _3143 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3145 = _3141 || _3143;
    float _3147 = float(_3145);
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3149;
    float _3153 = -_3119;
    float _3155 = _3153 + 1.0;
    bool _3157 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3159 = isnan(_1360);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3165 = _3161 || _3163;
    float _3167 = float(_3165);
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3171 = _1360 + _3169;
    float _3173 = _3151 * _3083;
    float _3175 = -_3133;
    float _3177 = _3175 + 1.0;
    float _3179 = _3147 * _3155;
    float _3181 = -_3147;
    float _3183 = _3181 + 1.0;
    bool _3185 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3187 = isnan(_1360);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3193 = _3189 || _3191;
    float _3195 = float(_3193);
    float _3197 = -_3167;
    float _3199 = _3197 + 1.0;
    float _3201 = fma(_3065, _3171, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3203 = _3119 * _3177;
    float _3205 = _3167 * _3183;
    bool _3207 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3209 = isnan(_1360);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = _3195 * _3199;
    float _3221 = -_3195;
    float _3223 = _3221 + 1.0;
    float _3225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3227 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3229 = isnan(_1360);
    bool _3231 = _3227 || _3229;
    bool _3233 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3235 = _3231 || _3233;
    float _3237 = float(_3235);
    float _3239 = -_3217;
    float _3241 = _3239 + 1.0;
    float _3243 = _3203;
    if (_3011)
    {
        float _3245 = _3053 ? _2933 : _2891;
        _2963 = _3245;
    }
    float _3247 = _2963;
    float _3249 = _3217 * _3223;
    float _3251 = _3237 * _3241;
    bool _3253 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3255 = isnan(_1360);
    bool _3257 = _3253 || _3255;
    bool _3259 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3261 = _3257 || _3259;
    float _3263 = float(_3261);
    float _3265 = -_3237;
    float _3267 = _3265 + 1.0;
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3271 = _1360 + _3269;
    float _3273 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3275 = _3263 * _3267;
    float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3279 = _1360 + _3277;
    float _3281 = fma(_3173, _3271, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3283 = fma(_3043, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3273);
    float _3285 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3287 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3289 = _3097 * _3275;
    float _3291 = _3225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3293 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3285);
    float _3295 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3287);
    float _3297 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3299 = fma(_3291, _3247, -0.5);
    float _3301 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3303 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3295);
    float _3305 = in.m_61.x;
    float _3307 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3301);
    float _3309 = _3303 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3311 = -_3263;
    float _3313 = _3311 + 1.0;
    float _3315 = _2987 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3317 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3307);
    float _3319 = 1.0 / _3309;
    float _3321 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3289);
    float _3323 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3325 = _3317 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3327 = _3317;
    int _3329 = as_type<int>(_3297);
    float _3331 = _3279;
    if (!_2921)
    {
        _3327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3333 = _3327;
    float _3335 = fma(_3201, _3251, _3321);
    float _3337 = _3325 + _3309;
    float _3339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3341 = fma(_3095, _3249, _3335);
    float _3343 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3027);
    float _3345 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2967);
    float _3347 = _3335;
    float _3349 = _3345;
    if (!_2921)
    {
        _3347 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3351 = _3347;
    float _3353 = fma(_3135, _3219, _3341);
    float _3355 = -_3323;
    float _3357 = fma(_3315, 2.0, _3355);
    float _3359 = -_3345;
    float _3361 = fma(_3343, _3299, _3359);
    float _3363 = _3337 * _3319;
    float _3365 = _3363 * 0.5;
    float _3367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3371 = fma(_3121, _3205, _3353);
    float _3373 = _3353;
    if (!_2921)
    {
        float _3375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3377 = fma(_3365, _3333, _3375);
        _3349 = _3377;
    }
    float _3379 = _3349;
    if (!_2921)
    {
        float _3381 = -_3351;
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3373 = _3383;
    }
    float _3385 = _3373;
    float _3387 = fma(_3297, -2.0, _3369);
    float _3389 = _3305;
    if (_2909)
    {
        float _3391 = -_3305;
        float _3393 = _3391 + 1.0;
        _3329 = as_type<int>(_3393);
    }
    int _3395 = _3329;
    int _3397 = 0;
    if (_2949)
    {
        float _3399 = -_3305;
        float _3401 = _3399 + 1.0;
        _3397 = as_type<int>(_3401);
    }
    int _3403 = _3397;
    float _3405 = _3341;
    if (!_2921)
    {
        float _3407 = 1.0 / _3379;
        _3405 = _3407;
    }
    float _3409 = _3405;
    float _3411 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2957);
    float _3413 = fma(_3081, _3279, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3415 = in.m_57.w;
    if (!_2909)
    {
        _3331 = _3305;
    }
    float _3417 = _3331;
    float _3419 = _3339 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3421 = _3417;
    if (_2909)
    {
        float _3423 = _2981 ? as_type<float>(_3395) : _3305;
        _3421 = _3423;
    }
    float _3425 = _3421;
    float _3427 = fma(_3413, _3179, _3371);
    float _3429 = _3385;
    if (!_2921)
    {
        float _3431 = 1.0 / _3385;
        _3429 = _3431;
    }
    float _3433 = _3429;
    if (_2949)
    {
        float _3435 = _3021 ? as_type<float>(_3403) : _3305;
        _3389 = _3435;
    }
    float _3437 = _3389;
    float _3439 = _3367 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3441 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3293);
    float _3443 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3283);
    float _3445 = -_102;
    float _3447 = fma(_3445, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3357);
    float _3449 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3387);
    float _3453 = fma(_3419, _3425, -0.5);
    float _3455 = fma(_3439, _3437, -0.5);
    float _3457 = fma(_3281, _3203, _3427);
    float _3459 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3461 = _3451;
    if (!_2921)
    {
        float _3463 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3465 = -_3351;
        float _3467 = fma(_3409, _3463, _3465);
        _3243 = _3467;
    }
    float _3469 = _3243;
    float _3471 = -_3451;
    float _3473 = fma(_3443, _3041, _3471);
    float _3475 = fma(_3411, _3453, _2985);
    float _3477 = fma(_3441, _3455, _3447);
    if (_2921)
    {
        _3461 = 1.0;
    }
    float _3479 = _3461;
    float _3481 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3459);
    float _3483 = _3479;
    if (!_2921)
    {
        float _3485 = _3469 * _3433;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        _3483 = _3487;
    }
    float _3489 = _3483;
    float _3491 = _3361 + 0.5;
    float _3493 = _3473 + 0.5;
    float _3495 = _3475 + 0.5;
    float _3497 = _3477 + 0.5;
    float _3499 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3481);
    float _3501 = fma(_3133, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3457);
    bool _3503 = _3489 > 0.0;
    bool _3505 = isnan(_3489);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _2832 + _2810;
    out.m_69.x = _3495;
    out.m_69.y = _3491;
    out.m_69.z = _3497;
    out.m_69.w = _3493;
    float _3515 = _3489 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3517 = _2810 * 0.5;
    float _3519 = _3499 + _2810;
    out.m_71.w = _3415;
    float _3521 = _3519 * 0.5;
    out.m_73.x = _3501;
    float _3523 = _3513 * 0.5;
    float _3525 = fma(_2842, -0.5, _3517);
    float _3527 = _3515 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2832;
    out.gl_Position.y = _2842;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _2810;
    out.m_75.x = _3523;
    out.m_75.y = _3525;
    out.m_75.z = _3521;
    out.m_75.w = _2810;
    out.m_49.x = _3527;
    float _3529 = _3007 * _2868;
    float _3531 = -_3007;
    float _3533 = _3531 + 1.0;
    float _3535 = _2879 * _3529;
    float _3537 = _2889 * _3529;
    float _3539 = _2879 * _3533;
    float _3541 = fma(_2885, _3535, _2873);
    float _3543 = fma(_2887, _3535, _2875);
    float _3545 = fma(_2879, _3537, _2877);
    out.m_77.x = _3541;
    out.m_77.y = _3543;
    out.m_77.z = _3545;
    out.m_77.w = _3539;
    if (_3511)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3547;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1076 = false;
    bool _754 = false;
    bool _298 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _91 = in.m_42.w;
    float _93 = in.m_44.w;
    float _95 = trunc(_91);
    int _98 = int(_95);
    float _100 = -_93;
    float _102 = _100 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _102;
    bool _106 = _98 >= 1;
    float _108 = 0.0;
    float _110 = as_type<float>(_98);
    float _112 = 0.0;
    if (!_106)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _108;
    if (!_106)
    {
        out.m_49.x = 0.0;
    }
    int _116 = 0;
    if (!_106)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    if (!_106)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3614 = as_type<float>(_120);
        out.gl_Position.z = _3614;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _122 = _93 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _124 = isnan(_93);
    bool _126 = _122 || _124;
    bool _128 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _130 = _126 || _128;
    float _132 = in.m_51.x;
    float _134 = float(_98);
    float _136 = in.m_51.z;
    bool _138 = _102 >= _134;
    bool _140 = !_130;
    bool _142 = _138 || _140;
    float _144 = in.m_51.w;
    if (_142)
    {
        _110 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _110;
    if (_142)
    {
        out.m_49.x = 0.0;
    }
    int _148 = 0;
    if (_142)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    out.m_53.x = _132;
    if (_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3677 = as_type<float>(_152);
        out.gl_Position.z = _3677;
    }
    out.m_53.z = _136;
    out.m_53.w = _144;
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_55.w;
    float _156 = 1.0 / _134;
    float _158 = _102 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _160 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _162 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _164 = _160 || _162;
    bool _166 = isnan(1.0);
    bool _168 = _164 || _166;
    float _170 = in.m_44.x;
    float _172 = in.m_44.y;
    float _174 = in.m_44.z;
    float _176 = in.m_42.x;
    float _178 = in.m_42.y;
    float _180 = in.m_42.z;
    float _182 = _158;
    if (!_168)
    {
        float _184 = _158 * _158;
        float _186 = _184 * 0.5;
        _112 = _186;
    }
    float _188 = _112;
    float _190 = _188;
    if (!_168)
    {
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _190 = _192;
    }
    float _194 = _190;
    bool _196 = !_168;
    float _198 = _194;
    if (!_196)
    {
        float _200 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _202 = log2(_200);
        float _204 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _206 = _204 + 1.0;
        float _208 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _210 = _158 * _202;
        float _212 = 1.0 / _206;
        float _214 = _208 * 0.693147182464599609375;
        float _216 = exp2(_210);
        float _218 = 1.0 / _214;
        float _220 = _216 + (-1.0);
        float _222 = -_220;
        float _224 = fma(_222, _218, _158);
        float _226 = _224 * _212;
        float _228 = _226 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _198 = _228;
    }
    float _230 = _198;
    bool _232 = !_168;
    if (!_232)
    {
        float _234 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _236 = log2(_234);
        float _238 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _240 = _238 + 1.0;
        float _242 = 1.0 / _240;
        float _244 = _158 * _236;
        float _246 = exp2(_244);
        float _248 = -_246;
        float _250 = _248 + 1.0;
        float _252 = _250 * _242;
        _182 = _252;
    }
    float _254 = _182;
    bool _256 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _156;
    float _266 = fma(_254, _172, _258);
    float _268 = fma(_254, _170, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _154, _178);
    float _274 = fma(_268, _154, _176);
    float _276 = fma(_270, _154, _180);
    bool _278 = !_256;
    float _280 = _264;
    float _296;
    if (!_278)
    {
        float _282 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _284 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _286 = fma(_284, (*spvDescriptorSet0.vp_c9)._m0[12].x, _102);
        float _288 = _286 * _282;
        float _290 = floor(_288);
        float _292 = -_290;
        float _294 = _288 + _292;
        _296 = _294;
        _298 = true;
    }
    else
    {
        _296 = _264;
    }
    _298 = false;
    float _300 = _296;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _304 = _300 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _308 = _300 + _306;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _312 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _310;
    float _314 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _316 = _314 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _326 = 1.0 / _312;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _336 = 1.0 / _316;
    float _338 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _340 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _338;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _344 = _300 + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = 1.0 / _324;
    float _356 = _344 * _326;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _360 = _300 + _358;
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _364 = _300 + _362;
    bool _366 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_300);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = fma(_348, _356, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _380;
    bool _384 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_300);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = 1.0 / _320;
    float _398 = _360 * _336;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _402 = _300 + _400;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _406 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _404;
    float _408 = fma(_352, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _410 = -_394;
    float _412 = _410 + 1.0;
    float _414 = 1.0 / _330;
    float _416 = _304 * _354;
    bool _418 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _420 = isnan(_300);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    bool _442 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _444 = fma(_432, _356, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = 1.0 / _334;
    float _448 = _308 * _396;
    bool _450 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _452 = isnan(_300);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = fma(_436, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _464 = 1.0 / _340;
    float _466 = _364 * _414;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _470 = _300 + _468;
    float _472 = _402 * _446;
    float _474 = -_428;
    float _476 = _474 + 1.0;
    float _478 = -_460;
    float _480 = _478 + 1.0;
    float _482 = _460 * _476;
    bool _484 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _486 = isnan(_300);
    bool _488 = _484 || _486;
    bool _490 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _492 = _488 || _490;
    float _494 = float(_492);
    float _496 = _376 * _480;
    float _498 = _470 * _464;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _500;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _508 = -_376;
    float _510 = _508 + 1.0;
    float _512 = -_494;
    float _514 = _512 + 1.0;
    float _516 = fma(_502, _356, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _518 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _520 = isnan(_300);
    bool _522 = _518 || _520;
    bool _524 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _526 = _522 || _524;
    float _528 = float(_526);
    float _530 = fma(_506, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _532 = _494 * _510;
    bool _534 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _536 = isnan(_300);
    bool _538 = _534 || _536;
    bool _540 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _542 = _538 || _540;
    float _544 = float(_542);
    float _546 = _528 * _514;
    float _548 = -_528;
    float _550 = _548 + 1.0;
    float _552 = fma(_382, _448, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    bool _554 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _556 = isnan(_300);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -_544;
    float _568 = _566 + 1.0;
    float _570 = _544 * _550;
    float _572 = fma(_406, _448, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _574 = fma(_440, _448, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _576 = _564 * _412;
    float _578 = -_564;
    float _580 = _578 + 1.0;
    float _582 = _394 * _568;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _586 = _584 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _588 = _516 * _576;
    float _590 = _378 * _576;
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _598 = _596 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _600 = _444 * _576;
    float _602 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _588);
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _590);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _600);
    float _608 = fma(_586, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _610 = fma(_594, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _612 = fma(_598, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _614 = fma(_530, _582, _602);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_408, _582, _604);
    float _630 = fma(_462, _582, _606);
    float _632 = fma(_618, _466, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _466, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _466, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _640 = _638 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _642 = fma(_552, _570, _614);
    float _644 = fma(_572, _570, _628);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _652 = _650 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _654 = fma(_574, _570, _630);
    float _656 = fma(_640, _472, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _658 = fma(_648, _472, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _660 = fma(_652, _472, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _662 = fma(_608, _546, _642);
    float _664 = fma(_610, _546, _644);
    float _666 = fma(_612, _546, _654);
    float _668 = in.m_55.x;
    float _670 = in.m_55.y;
    float _672 = in.m_55.z;
    float _674 = fma(_634, _532, _664);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _676;
    float _680 = fma(_632, _532, _662);
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = fma(_636, _532, _666);
    float _688 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _688;
    float _692 = fma(_678, _498, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _498, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_656, _496, _680);
    float _698 = fma(_690, _498, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _700 = fma(_658, _496, _674);
    float _702 = fma(_660, _496, _686);
    float _704 = fma(_692, _482, _696);
    float _706 = fma(_694, _482, _700);
    float _708 = fma(_698, _482, _702);
    float _710 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = _710 * _668;
    float _718 = _712 * _670;
    float _720 = _714 * _672;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _726 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _730 = _724 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _726 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _728 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _736 = !_442;
    float _752;
    if (!_736)
    {
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _740 = _132 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[11].z, _102);
        float _744 = _742 * _738;
        float _746 = floor(_744);
        float _748 = -_746;
        float _750 = _744 + _748;
        _752 = _750;
        _754 = true;
    }
    else
    {
        _752 = _264;
    }
    _754 = false;
    float _756 = _752;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _760 = _756 + _758;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _764 = _756 + _762;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _768 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _766;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _774 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _776 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _774;
    float _778 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _780 = _778 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _782 = 1.0 / _768;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[128].w + _784;
    float _788 = 1.0 / _780;
    float _790 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _792 = _756 + _790;
    bool _794 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _796 = isnan(_756);
    bool _798 = _794 || _796;
    bool _800 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _802 = _798 || _800;
    float _804 = float(_802);
    bool _806 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _808 = isnan(_756);
    bool _810 = _806 || _808;
    bool _812 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _814 = _810 || _812;
    float _816 = float(_814);
    float _818 = 1.0 / _776;
    float _820 = _792 * _782;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _824 = _756 + _822;
    float _826 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _828 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _826;
    bool _830 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _832 = fma(_828, _820, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _834 = 1.0 / _772;
    float _836 = _824 * _788;
    bool _838 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[128].w;
    bool _840 = isnan(_756);
    bool _842 = _838 || _840;
    bool _844 = isnan((*spvDescriptorSet0.vp_c9)._m0[128].w);
    bool _846 = _842 || _844;
    float _848 = float(_846);
    bool _850 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _852 = isnan(_756);
    bool _854 = _850 || _852;
    bool _856 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _858 = _854 || _856;
    float _860 = float(_858);
    float _862 = -_848;
    float _864 = _862 + 1.0;
    float _866 = 1.0 / _786;
    float _868 = _760 * _818;
    bool _870 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _872 = isnan(_756);
    bool _874 = _870 || _872;
    bool _876 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _878 = _874 || _876;
    float _880 = float(_878);
    float _882 = -_860;
    float _884 = _882 + 1.0;
    float _886 = -_880;
    float _888 = _886 + 1.0;
    float _890 = _764 * _834;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _894 = _756 + _892;
    float _896 = _880 * _864;
    float _898 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _898;
    float _902 = _804 * _888;
    float _904 = -_804;
    float _906 = _904 + 1.0;
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _912 = fma(_900, _820, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _914 = _894 * _866;
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _916;
    float _920 = fma(_910, _890, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _922 = fma(_918, _820, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    bool _924 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _926 = isnan(_756);
    bool _928 = _924 || _926;
    bool _930 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _932 = _928 || _930;
    float _934 = float(_932);
    float _936 = _860 * _906;
    float _938 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _940 = _938 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _942 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _944 = _942 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _946 = _816 * _884;
    float _948 = -_816;
    float _950 = _948 + 1.0;
    float _952 = fma(_940, _890, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _954 = fma(_944, _890, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _956 = _934 * _950;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _958;
    float _962 = -_934;
    float _964 = _962 + 1.0;
    float _966 = _922 * _956;
    float _968 = _832 * _956;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _970;
    float _974 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _976 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _974;
    float _978 = _912 * _956;
    float _980 = fma(_960, _868, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _982 = fma(_972, _868, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _984 = fma(_976, _868, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _986 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].x, _966);
    float _988 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].y, _968);
    float _990 = fma(_964, (*spvDescriptorSet0.vp_c9)._m0[123].z, _978);
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _994 = _992 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _996 = fma(_954, _946, _986);
    float _998 = fma(_920, _946, _988);
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1004 = fma(_982, _936, _996);
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1008 = _1006 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1010 = fma(_952, _946, _990);
    float _1012 = fma(_994, _836, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1014 = fma(_984, _936, _998);
    float _1016 = fma(_1002, _836, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[128].x + _1018;
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1024 = (*spvDescriptorSet0.vp_c9)._m0[128].y + _1022;
    float _1026 = fma(_1008, _836, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1028 = fma(_980, _936, _1010);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1032 = (*spvDescriptorSet0.vp_c9)._m0[128].z + _1030;
    float _1034 = fma(_1012, _902, _1004);
    float _1036 = fma(_1020, _914, (*spvDescriptorSet0.vp_c9)._m0[127].x);
    float _1038 = fma(_1024, _914, (*spvDescriptorSet0.vp_c9)._m0[127].y);
    float _1040 = fma(_1016, _902, _1014);
    float _1042 = fma(_1032, _914, (*spvDescriptorSet0.vp_c9)._m0[127].z);
    float _1044 = fma(_1026, _902, _1028);
    float _1046 = fma(_1036, _896, _1034);
    float _1048 = fma(_1038, _896, _1040);
    float _1050 = fma(_1042, _896, _1044);
    float _1052 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].x, _1046);
    float _1054 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].y, _1048);
    float _1056 = fma(_848, (*spvDescriptorSet0.vp_c9)._m0[128].z, _1050);
    bool _1058 = !_830;
    float _1074;
    if (!_1058)
    {
        float _1060 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1062 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1064 = fma(_1062, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
        float _1066 = _1064 * _1060;
        float _1068 = floor(_1066);
        float _1070 = -_1068;
        float _1072 = _1066 + _1070;
        _1074 = _1072;
        _1076 = true;
    }
    else
    {
        _1074 = _264;
    }
    _1076 = false;
    float _1078 = _1074;
    float _1080 = _1052 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1082 = _1054 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1090 = _1088 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1092 = 1.0 / _1086;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1098 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1098;
    bool _1102 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _1104 = isnan(_1078);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _1110 = _1106 || _1108;
    float _1112 = float(_1110);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1116 = _1114 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1118 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1120 = isnan(_1078);
    bool _1122 = _1118 || _1120;
    bool _1124 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1126 = _1122 || _1124;
    float _1128 = float(_1126);
    float _1130 = 1.0 / _1090;
    bool _1132 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _1134 = isnan(_1078);
    bool _1136 = _1132 || _1134;
    bool _1138 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _1140 = _1136 || _1138;
    float _1142 = float(_1140);
    float _1144 = -_1112;
    float _1146 = _1144 + 1.0;
    float _1148 = -_1128;
    float _1150 = _1148 + 1.0;
    float _1152 = -_1142;
    float _1154 = _1152 + 1.0;
    bool _1156 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1158 = 1.0 / _1096;
    float _1160 = _1100 * _1092;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1164 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1162;
    float _1166 = _1164 * _1130;
    float _1168 = _1142 * _1146;
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1172 = _1170 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1174 = 1.0 / _1172;
    float _1176 = _1116 * _1158;
    bool _1178 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1180 = isnan(_1078);
    bool _1182 = _1178 || _1180;
    bool _1184 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1186 = _1182 || _1184;
    float _1188 = float(_1186);
    float _1190 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1192 = _1190 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1194 = _1188 * _1154;
    float _1196 = -_1188;
    float _1198 = _1196 + 1.0;
    bool _1200 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1202 = isnan(_1078);
    bool _1204 = _1200 || _1202;
    bool _1206 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1208 = _1204 || _1206;
    float _1210 = float(_1208);
    float _1212 = 1.0 / _1192;
    float _1214 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1216 = _1078 + _1214;
    float _1218 = _1128 * _1198;
    bool _1220 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1222 = isnan(_1078);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = -_1210;
    float _1234 = _1232 + 1.0;
    float _1236 = _1210 * _1150;
    float _1238 = fma(_1160, _1216, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1240 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1242 = _1240 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _1244 = _1230 * _1234;
    float _1246 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1248 = _1078 + _1246;
    float _1250 = -_1230;
    float _1252 = _1250 + 1.0;
    float _1254 = 1.0 / _1242;
    float _1256 = _1238 * _1244;
    float _1258 = fma(_1176, _1248, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1260 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1262 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _1260;
    float _1264 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _1266 = _1264 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _1268 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1270 = _1078 + _1268;
    float _1272 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1256);
    float _1274 = _1262 * _1212;
    float _1276 = _1266 * _1174;
    float _1278 = fma(_1166, _1270, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _1280 = fma(_1258, _1236, _1272);
    float _1282 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1284 = _1078 + _1282;
    bool _1286 = _1078 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _1288 = isnan(_1078);
    bool _1290 = _1286 || _1288;
    bool _1292 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _1294 = _1290 || _1292;
    float _1296 = float(_1294);
    float _1298 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _1300 = _1298 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _1304 = _1078 + _1302;
    float _1306 = fma(_1276, _1284, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _1308 = fma(_1278, _1218, _1280);
    float _1310 = _1300 * _1254;
    float _1312 = fma(_1274, _1304, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _1314 = -_1296;
    float _1316 = _1314 + 1.0;
    float _1318 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _1320 = _1078 + _1318;
    float _1322 = fma(_1306, _1194, _1308);
    float _1324 = _1112 * _1316;
    float _1326 = fma(_1310, _1320, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1328 = fma(_1312, _1168, _1322);
    float _1330 = _1056 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1332 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1334 = _1082 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1336 = fma(_1326, _1324, _1328);
    float _1338 = _1330 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1340 = fma(_1296, (*spvDescriptorSet0.vp_c9)._m0[137].x, _1336);
    float _1342 = _1340 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1344 = !_1156;
    if (!_1344)
    {
        float _1346 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1348 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1350 = fma(_1348, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _1352 = _1350 * _1346;
        float _1354 = floor(_1352);
        float _1356 = -_1354;
        float _1358 = _1352 + _1356;
        _280 = _1358;
    }
    float _1360 = _280;
    float _1362 = in.m_57.x;
    float _1364 = in.m_57.y;
    float _1366 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1368 = log2(_1366);
    float _1370 = _102 * 0.039999999105930328369140625;
    float _1372 = _136 * 2.0;
    float _1374 = in.m_51.y;
    float _1376 = _144 * 6.283185482025146484375;
    float _1378 = _1370 * 0.15915493667125701904296875;
    float _1380 = _132 * 2.0;
    float _1382 = _132 + _136;
    float _1384 = floor(_1372);
    float _1386 = _1382 + (-1.0);
    float _1388 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1390 = floor(_1380);
    float _1392 = fma(_102, 0.010999999940395355224609375, _1376);
    float _1394 = _1392 * 0.15915493667125701904296875;
    float _1396 = abs(_1362);
    float _1398 = abs(_1364);
    float _1400 = precise::max(_1396, _1398);
    float _1402 = _1364 * 0.0625;
    float _1404 = _1362 * 0.0625;
    float _1406 = _1378 * 6.283185482025146484375;
    float _1408 = sin(_1406);
    bool _1410 = _1400 >= 16.0;
    float _1412 = _102 * _1368;
    float _1414 = _1374 * 6.283185482025146484375;
    float _1416 = _1374 * 2.0;
    float _1418 = _1410 ? _1402 : _1364;
    float _1420 = _1410 ? _1404 : _1362;
    float _1422 = fma(_102, 0.007000000216066837310791015625, _1414);
    float _1424 = abs(_1418);
    bool _1426 = _1424 != 0.0;
    bool _1428 = isnan(_1424);
    bool _1430 = _1426 || _1428;
    bool _1432 = isnan(0.0);
    bool _1434 = _1430 || _1432;
    float _1436 = floor(_1416);
    float _1438 = abs(_1420);
    bool _1440 = _1438 == 0.0;
    float _1442 = _1422 * 0.15915493667125701904296875;
    float _1444 = abs(_1420);
    bool _1446 = _1444 == 0.0;
    bool _1448 = !_1434;
    bool _1450 = _1446 && _1448;
    float _1452 = _272 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _1454 = _1384 > 0.0;
    bool _1456 = _1384 >= 0.0;
    bool _1458 = isnan(_1384);
    bool _1460 = _1456 || _1458;
    bool _1462 = isnan(0.0);
    bool _1464 = _1460 || _1462;
    float _1466 = exp2(_1412);
    float _1468 = _272 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1470 = _272 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1472 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1452);
    float _1474 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1468);
    float _1476 = fma(_274, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1470);
    float _1478 = _1394 * 6.283185482025146484375;
    float _1480 = sin(_1478);
    bool _1482 = false;
    int _1484 = as_type<int>(_1382);
    if (_1450)
    {
        bool _1486 = as_type<int>(_1420) >= 0;
        _1482 = _1486;
    }
    bool _1488 = _1482;
    int _1490 = _1488 ? (-1) : 0;
    if (_1450)
    {
        int _1492 = _1488 ? 0 : 1078530011;
        _1484 = _1492;
    }
    int _1494 = _1484;
    float _1496 = _1442 * 6.283185482025146484375;
    float _1498 = sin(_1496);
    int _1500 = _1494;
    if (_1450)
    {
        int _1502 = int(0x80000000) & as_type<int>(_1418);
        int _1504 = _1494 | _1502;
        _1500 = _1504;
    }
    int _1506 = _1500;
    bool _1508 = !_1434;
    bool _1510 = _1508 && _1440;
    int _1512 = _1506;
    float _1514 = as_type<float>(_1506);
    if (!_1510)
    {
        float _1516 = abs(_1418);
        bool _1518 = _1516 != as_type<float>(0x7f800000u /* inf */);
        bool _1520 = isnan(_1516);
        bool _1522 = _1518 || _1520;
        bool _1524 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1526 = _1522 || _1524;
        float _1528 = abs(_1420);
        bool _1530 = _1528 == as_type<float>(0x7f800000u /* inf */);
        float _1532 = abs(_1420);
        bool _1534 = _1532 == as_type<float>(0x7f800000u /* inf */);
        bool _1536 = !_1526;
        bool _1538 = _1534 && _1536;
        if (_1538)
        {
            bool _1540 = as_type<int>(_1420) >= 0;
            _1490 = _1540 ? (-1) : 0;
        }
        int _1542 = _1490;
        if (_1538)
        {
            _1512 = 1075235812;
        }
        int _1544 = _1512;
        int _1546 = _1544;
        if (_1538)
        {
            int _1548 = ~_1542;
            int _1550 = (_1548 != 0) ? _1544 : 1061752795;
            _1546 = _1550;
        }
        int _1552 = _1546;
        float _1554 = as_type<float>(_1552);
        if (_1538)
        {
            int _1556 = int(0x80000000) & as_type<int>(_1418);
            int _1558 = _1552 | _1556;
            _1554 = as_type<float>(_1558);
        }
        float _1560 = _1554;
        bool _1562 = !_1526;
        bool _1564 = _1562 && _1530;
        _1514 = _1560;
        if (!_1564)
        {
            float _1566 = abs(_1418);
            float _1568 = abs(_1420);
            float _1570 = precise::max(_1566, _1568);
            float _1572 = abs(_1418);
            float _1574 = abs(_1420);
            float _1576 = precise::min(_1572, _1574);
            float _1578 = 1.0 / _1570;
            float _1580 = abs(_1418);
            float _1582 = abs(_1420);
            bool _1584 = _1580 > _1582;
            bool _1586 = as_type<int>(_1420) >= 0;
            float _1588 = _1576 * _1578;
            float _1590 = _1588 * _1588;
            float _1592 = _1590 + 11.33538818359375;
            float _1594 = fma(_1590, _1592, 28.84246826171875);
            float _1596 = fma(_1590, _1594, 19.6966705322265625);
            float _1598 = fma(_1590, -0.82336294651031494140625, -5.674867153167724609375);
            float _1600 = fma(_1590, _1598, -6.565555095672607421875);
            float _1602 = 1.0 / _1596;
            float _1604 = _1590 * _1600;
            float _1606 = abs(_1418);
            float _1608 = abs(_1420);
            float _1610 = _1606 + _1608;
            int _1612 = as_type<int>(_1418) & int(0x80000000);
            float _1614 = _1588 * _1604;
            bool _1616 = _1610 > as_type<float>(0x7f800000u /* inf */);
            bool _1618 = isnan(_1610);
            bool _1620 = _1616 || _1618;
            bool _1622 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1624 = _1620 || _1622;
            float _1626 = fma(_1614, _1602, _1588);
            float _1628 = _1626;
            _1514 = _1610;
            if (_1584)
            {
                float _1630 = -_1626;
                float _1632 = _1630 + 1.57079637050628662109375;
                _1628 = _1632;
            }
            float _1634 = _1628;
            int _1636 = as_type<int>(_1634);
            if (!_1586)
            {
                float _1638 = -_1634;
                float _1640 = _1638 + 3.1415927410125732421875;
                _1636 = as_type<int>(_1640);
            }
            int _1642 = _1636;
            if (!_1624)
            {
                int _1644 = _1612 | _1642;
                _1514 = as_type<float>(_1644);
            }
        }
    }
    float _1646 = _1514;
    float _1648 = _132 + _1374;
    float _1650 = abs(_1498);
    float _1652 = log2(_1650);
    float _1654 = _136 + _1374;
    float _1656 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1658 = _1648 + (-1.0);
    float _1660 = _1654 + (-1.0);
    float _1662 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1656);
    float _1664 = abs(_1480);
    float _1666 = log2(_1664);
    float _1668 = fma(_1658, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1670 = fma(_1660, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1672 = _1464 ? 0 : 1;
    float _1674 = fma(_1408, 9.0, _102);
    bool _1676 = _1390 > 0.0;
    float _1678 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1476);
    int _1680 = ~_1672;
    int _1682 = _1680 + 1;
    int _1684 = _1682 + 1;
    float _1686 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1474);
    int _1688 = _1684;
    if (!_1454)
    {
        int _1690 = ~_1672;
        int _1692 = _1690 + 1;
        _1688 = _1692;
    }
    int _1694 = _1688;
    float _1696 = _1652 * 120.0;
    bool _1698 = _1390 >= 0.0;
    bool _1700 = isnan(_1390);
    bool _1702 = _1698 || _1700;
    bool _1704 = isnan(0.0);
    bool _1706 = _1702 || _1704;
    float _1708 = _1674 * 0.20999999344348907470703125;
    float _1710 = _1674 * (-0.1599999964237213134765625);
    bool _1712 = _1436 > 0.0;
    float _1714 = fma(_1646, 5.00000095367431640625, _1708);
    float _1716 = _1666 * 80.0;
    float _1718 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1720 = 1.0 + _1718;
    float _1722 = fma(_1646, 4.000000476837158203125, _1710);
    bool _1724 = _1436 >= 0.0;
    bool _1726 = isnan(_1436);
    bool _1728 = _1724 || _1726;
    bool _1730 = isnan(0.0);
    bool _1732 = _1728 || _1730;
    float _1734 = _1714 * 0.15915493667125701904296875;
    float _1736 = _1722 * 0.15915493667125701904296875;
    float _1738 = 1.0 / _1720;
    int _1740 = _1706 ? 0 : 1;
    float _1742 = _1678 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1746 = _1744 != 0;
    int _1748 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1750 = _1748 != 0;
    int _1752 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1754 = _1752 != 0;
    float _1756 = -_1466;
    float _1758 = _1756 + 1.0;
    float _1760 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1662);
    bool _1762 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1764 = isnan(0.0);
    bool _1766 = _1762 || _1764;
    bool _1768 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1770 = _1766 || _1768;
    float _1772 = exp2(_1716);
    bool _1774 = !_1746;
    int _1776 = _1774 ? 0 : 1;
    int _1778 = ~_1740;
    int _1780 = _1778 + 1;
    int _1782 = _1780 + 1;
    int _1784 = abs(_1776);
    float _1786 = -_1742;
    float _1788 = _1786 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    int _1790 = _1782;
    float _1792 = _1788;
    bool _1794 = _1732;
    if (!_1676)
    {
        int _1796 = ~_1740;
        int _1798 = _1796 + 1;
        _1790 = _1798;
    }
    int _1800 = _1790;
    float _1802 = exp2(_1696);
    float _1804 = _1686 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1806 = _1770 ? _1758 : 0.0;
    float _1808 = float(_1694);
    float _1810 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1812 = _1804 + _1810;
    float _1814 = float(_1784);
    float _1816 = _1806 * _1738;
    float _1818 = _1734 * 6.283185482025146484375;
    float _1820 = sin(_1818);
    int _1822 = _1732 ? 0 : 1;
    float _1824 = _1814 * _1808;
    float _1826 = abs(_1812);
    float _1828 = abs(_1788);
    float _1830 = precise::max(_1826, _1828);
    int _1832 = ~_1822;
    int _1834 = _1832 + 1;
    int _1836 = _1834 + 1;
    float _1838 = _1824 * (-2.0);
    float _1840 = _1736 * 6.283185482025146484375;
    float _1842 = sin(_1840);
    float _1844 = _1772 + _1802;
    int _1846 = _1836;
    if (!_1712)
    {
        int _1848 = ~_1822;
        int _1850 = _1848 + 1;
        _1846 = _1850;
    }
    int _1852 = _1846;
    float _1854 = fma(_1668, _1838, _1668);
    bool _1856 = _1830 >= 16.0;
    bool _1858 = !_1754;
    int _1860 = _1858 ? 0 : 1;
    float _1862 = rsqrt(_1760);
    float _1864 = float(_1852);
    bool _1866 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1868 = isnan(1.0);
    bool _1870 = _1866 || _1868;
    bool _1872 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1874 = _1870 || _1872;
    float _1876 = _1820 + _1842;
    float _1878 = _132 + (-0.5);
    float _1880 = in.m_59.x;
    float _1882 = in.m_59.y;
    float _1884 = in.m_59.z;
    bool _1886 = !_1874;
    float _1888 = _1886 ? _102 : _1816;
    if (_1856)
    {
        float _1890 = _1788 * 0.0625;
        _1792 = _1890;
    }
    float _1892 = _1792;
    float _1894 = _1878 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    bool _1896 = !_1750;
    int _1898 = _1896 ? 0 : 1;
    float _1900 = _1862 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1902 = precise::max(_1876, -2.0);
    float _1904 = fma(_1888, _1854, _1894);
    int _1906 = abs(_1898);
    float _1908 = _1900 * (-0.15915493667125701904296875);
    int _1910 = abs(_1860);
    float _1912 = _1904 * 0.15915493667125701904296875;
    float _1914 = float(_1800);
    float _1916 = _1908 * 6.283185482025146484375;
    float _1918 = cos(_1916);
    float _1920 = precise::min(_1902, 2.0);
    float _1922 = float(_1906);
    float _1924 = float(_1910);
    float _1926 = fma(_1920, 0.25, 0.5);
    float _1928 = _1908 * 6.283185482025146484375;
    float _1930 = sin(_1928);
    float _1932 = _1922 * _1914;
    float _1934 = abs(_1892);
    bool _1936 = _1934 == 0.0;
    float _1938 = _1926 * 0.07999999821186065673828125;
    float _1940 = _1924 * _1864;
    float _1942 = _136 + (-0.5);
    float _1944 = _1932 * (-2.0);
    float _1946 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1948 = _1940 * (-2.0);
    float _1950 = _1942 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1952 = fma(_1670, _1944, _1670);
    float _1954 = fma(_1364, _1946, _1882);
    float _1956 = _102 * (-0.17000000178813934326171875);
    float _1958 = fma(_1388, _1948, _1388);
    float _1960 = _132 * 6.283185482025146484375;
    float _1962 = _1374 * (-0.87964594364166259765625);
    float _1964 = fma(_1954, 16.0, _1956);
    float _1966 = fma(_1888, _1958, _1950);
    float _1968 = _1812 * 0.0625;
    float _1970 = _1374 + (-0.5);
    float _1972 = _1964 + _1960;
    float _1974 = fma(_1954, 9.0, _1962);
    float _1976 = _1966 * 0.15915493667125701904296875;
    float _1978 = _1912 * 6.283185482025146484375;
    float _1980 = sin(_1978);
    float _1982 = _1856 ? _1968 : _1812;
    float _1984 = _1972 * 0.15915493667125701904296875;
    float _1986 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1988 = _1414 + _1974;
    float _1990 = abs(_1982);
    bool _1992 = _1990 != 0.0;
    bool _1994 = isnan(_1990);
    bool _1996 = _1992 || _1994;
    bool _1998 = isnan(0.0);
    bool _2000 = _1996 || _1998;
    float _2002 = fma(_1362, _1946, _1880);
    float _2004 = fma(_1888, _1952, _1986);
    float _2006 = _1912 * 6.283185482025146484375;
    float _2008 = cos(_2006);
    float _2010 = _1988 * 0.15915493667125701904296875;
    float _2012 = abs(_1892);
    bool _2014 = _2012 == 0.0;
    bool _2016 = !_2000;
    bool _2018 = _2014 && _2016;
    float _2020 = fma(_1954, 0.5, 0.5);
    float _2022 = precise::clamp(_2020, 0.0, 1.0);
    float _2024 = _1984 * 6.283185482025146484375;
    float _2026 = sin(_2024);
    float _2028 = _102 * (-0.37000000476837158203125);
    float _2030 = fma(_2022, -2.0, 3.0);
    float _2032 = fma(_1954, 0.58823525905609130859375, 0.411764681339263916015625);
    float _2034 = precise::clamp(_2032, 0.0, 1.0);
    float _2036 = fma(_1954, 5.0, _2028);
    float _2038 = fma(_2034, -2.0, 3.0);
    float _2040 = _1976 * 6.283185482025146484375;
    float _2042 = sin(_2040);
    float _2044 = _2036 + _1376;
    int _2046 = as_type<int>(_2030);
    float _2048 = 0.58823525905609130859375;
    if (_2018)
    {
        bool _2050 = as_type<int>(_1892) >= 0;
        _1794 = _2050;
    }
    bool _2052 = _1794;
    float _2054 = _2044 * 0.15915493667125701904296875;
    float _2056 = _2022 * _2022;
    float _2058 = _2010 * 6.283185482025146484375;
    float _2060 = sin(_2058);
    float _2062 = _2026 * 0.064000003039836883544921875;
    float _2064 = _2030 * _2056;
    int _2066 = _2052 ? (-1) : 0;
    if (_2018)
    {
        int _2068 = _2052 ? 0 : 1078530011;
        _2046 = _2068;
    }
    int _2070 = _2046;
    float _2072 = _2034 * _2034;
    float _2074 = _2064 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _2076 = _2070;
    if (_2018)
    {
        int _2078 = int(0x80000000) & as_type<int>(_1982);
        int _2080 = _2070 | _2078;
        _2048 = as_type<float>(_2080);
    }
    float _2082 = _2048;
    float _2084 = _2054 * 6.283185482025146484375;
    float _2086 = sin(_2084);
    bool _2088 = !_2000;
    bool _2090 = _2088 && _1936;
    float _2092 = _2082;
    float _2094 = _2082;
    if (!_2090)
    {
        float _2096 = abs(_1982);
        bool _2098 = _2096 != as_type<float>(0x7f800000u /* inf */);
        bool _2100 = isnan(_2096);
        bool _2102 = _2098 || _2100;
        bool _2104 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _2106 = _2102 || _2104;
        float _2108 = abs(_1892);
        bool _2110 = _2108 == as_type<float>(0x7f800000u /* inf */);
        float _2112 = abs(_1892);
        bool _2114 = _2112 == as_type<float>(0x7f800000u /* inf */);
        bool _2116 = !_2106;
        bool _2118 = _2114 && _2116;
        if (_2118)
        {
            bool _2120 = as_type<int>(_1892) >= 0;
            _2066 = _2120 ? (-1) : 0;
        }
        int _2122 = _2066;
        if (_2118)
        {
            _2076 = 1075235812;
        }
        int _2124 = _2076;
        int _2126 = _2124;
        if (_2118)
        {
            int _2128 = ~_2122;
            int _2130 = (_2128 != 0) ? _2124 : 1061752795;
            _2126 = _2130;
        }
        int _2132 = _2126;
        if (_2118)
        {
            int _2134 = int(0x80000000) & as_type<int>(_1982);
            int _2136 = _2132 | _2134;
            _2092 = as_type<float>(_2136);
        }
        float _2138 = _2092;
        bool _2140 = !_2106;
        bool _2142 = _2140 && _2110;
        _2094 = _2138;
        if (!_2142)
        {
            float _2144 = abs(_1982);
            float _2146 = abs(_1892);
            float _2148 = precise::max(_2144, _2146);
            float _2150 = abs(_1982);
            float _2152 = abs(_1892);
            float _2154 = precise::min(_2150, _2152);
            float _2156 = 1.0 / _2148;
            float _2158 = abs(_1982);
            float _2160 = abs(_1892);
            bool _2162 = _2158 > _2160;
            bool _2164 = as_type<int>(_1892) >= 0;
            float _2166 = _2154 * _2156;
            float _2168 = _2166 * _2166;
            float _2170 = _2168 + 11.33538818359375;
            float _2172 = fma(_2168, _2170, 28.84246826171875);
            float _2174 = fma(_2168, _2172, 19.6966705322265625);
            float _2176 = fma(_2168, -0.82336294651031494140625, -5.674867153167724609375);
            float _2178 = fma(_2168, _2176, -6.565555095672607421875);
            float _2180 = 1.0 / _2174;
            float _2182 = _2168 * _2178;
            float _2184 = abs(_1982);
            float _2186 = abs(_1892);
            float _2188 = _2184 + _2186;
            int _2190 = as_type<int>(_1982) & int(0x80000000);
            float _2192 = _2166 * _2182;
            bool _2194 = _2188 > as_type<float>(0x7f800000u /* inf */);
            bool _2196 = isnan(_2188);
            bool _2198 = _2194 || _2196;
            bool _2200 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _2202 = _2198 || _2200;
            float _2204 = fma(_2192, _2180, _2166);
            float _2206 = _2204;
            _2094 = _2188;
            if (_2162)
            {
                float _2208 = -_2204;
                float _2210 = _2208 + 1.57079637050628662109375;
                _2206 = _2210;
            }
            float _2212 = _2206;
            int _2214 = as_type<int>(_2212);
            if (!_2164)
            {
                float _2216 = -_2212;
                float _2218 = _2216 + 3.1415927410125732421875;
                _2214 = as_type<int>(_2218);
            }
            int _2220 = _2214;
            if (!_2202)
            {
                int _2222 = _2190 | _2220;
                _2094 = as_type<float>(_2222);
            }
        }
    }
    float _2224 = _2094;
    float _2226 = fma(_2062, _2074, _2002);
    float _2228 = _2060 * 0.07299999892711639404296875;
    float _2230 = _2086 * _1844;
    float _2232 = _2038 * _2072;
    float _2234 = fma(_2228, _2074, _2226);
    float _2236 = _2230 * 0.180000007152557373046875;
    float _2238 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2240 = -_2224;
    float _2242 = _2004 + _2240;
    float _2244 = _1954 + 0.20000000298023223876953125;
    float _2246 = _2236 * _2232;
    float _2248 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _2238);
    float _2250 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2252 = _2242 * 0.15915493667125701904296875;
    float _2254 = _1930 * _1884;
    float _2256 = _1976 * 6.283185482025146484375;
    float _2258 = cos(_2256);
    float _2260 = fma(_2246, (*spvDescriptorSet0.vp_c9)._m0[191].x, _2234);
    float _2262 = _136 * 6.283185482025146484375;
    float _2264 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2266 = _1918 * _1884;
    float _2268 = fma(_102, 0.10999999940395355224609375, _1960);
    float _2270 = fma(_102, 0.310000002384185791015625, _2262);
    float _2272 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2260);
    float _2274 = _2252 * 6.283185482025146484375;
    float _2276 = sin(_2274);
    float _2278 = -_2254;
    float _2280 = fma(_1918, _2244, _2278);
    float _2282 = _2270 * 0.15915493667125701904296875;
    float _2284 = fma(_1930, _2244, _2266);
    float _2286 = _2272 * _2250;
    float _2288 = _2280 + (-0.20000000298023223876953125);
    float _2290 = _2268 * 0.15915493667125701904296875;
    float _2292 = _2252 * 6.283185482025146484375;
    float _2294 = cos(_2292);
    float _2296 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2288);
    float _2298 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1472);
    float _2300 = _1980 * _2276;
    float _2302 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2304 = _2264 * _2296;
    float _2306 = _2282 * 6.283185482025146484375;
    float _2308 = sin(_2306);
    float _2310 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2284);
    float _2312 = _2008 * _2276;
    float _2314 = _2258 * _2304;
    float _2316 = _2008 * _2294;
    float _2318 = _1980 * _2294;
    float _2320 = _2310 * _2302;
    float _2322 = 1.0 / _2264;
    float _2324 = fma(_2042, _2316, _2300);
    float _2326 = _2008 * _2314;
    float _2328 = -_2318;
    float _2330 = fma(_2042, _2312, _2328);
    float _2332 = fma(_2042, _2300, _2316);
    float _2334 = fma(_2324, _2286, _2326);
    float _2336 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _2248);
    float _2338 = _2290 * 6.283185482025146484375;
    float _2340 = sin(_2338);
    float _2342 = fma(_2308, 0.12999999523162841796875, 1.0);
    float _2344 = fma(_2330, _2320, _2334);
    float _2346 = _2298 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2348 = -_2312;
    float _2350 = fma(_2042, _2318, _2348);
    float _2352 = _1980 * _2314;
    float _2354 = -_2304;
    float _2356 = _2042 * _2354;
    float _2358 = _2346 + _2344;
    float _2360 = sqrt(_2336);
    float _2362 = fma(_2350, _2286, _2352);
    float _2364 = _2294 * _2258;
    float _2366 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2368 = _2358 + _2366;
    float _2370 = _2276 * _2258;
    float _2372 = fma(_2332, _2320, _2362);
    float _2374 = fma(_2364, _2286, _2356);
    float _2376 = _2368 * _2322;
    float _2378 = fma(_2340, 0.300000011920928955078125, _2342);
    float _2380 = _1742 + _2372;
    float _2382 = fma(_2370, _2320, _2374);
    float _2384 = fma(_2376, _2376, _2376);
    float _2386 = _1804 + _2382;
    float _2388 = _2360 * 0.64999997615814208984375;
    float _2390 = _2384 * _2388;
    float _2392 = _2378 * _2390;
    float _2394 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2380);
    float _2396 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2386);
    float _2398 = fma(_2392, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2358);
    float _2400 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2402 = _2394 + _2400;
    float _2404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2406 = _2396 + _2404;
    float _2408 = _2402 * _2402;
    float _2410 = fma(_2406, _2406, _2408);
    float _2412 = sqrt(_2410);
    bool _2414 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2416 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2418 = _2414 || _2416;
    bool _2420 = isnan(0.5);
    bool _2422 = _2418 || _2420;
    bool _2424 = _2412 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2426 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2428 = _2358;
    float _2430 = _2396;
    float _2432 = _2402;
    float _2434 = _2316;
    float _2436 = _2322;
    float _2438 = _2314;
    if (!_2424)
    {
        _2426 = _2396;
    }
    float _2440 = _2426;
    float _2442 = _2440;
    if (!_2424)
    {
        _2428 = _2394;
    }
    float _2444 = _2428;
    float _2446 = _2444;
    if (!_2424)
    {
        _2430 = _2398;
    }
    float _2448 = _2430;
    bool _2450 = !_2424;
    float _2452 = _2448;
    if (!_2450)
    {
        float _2454 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2458 = _2412 + _2456;
        float _2460 = _2398 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2462 = rsqrt(_2410);
        float _2464 = _2458 * _2454;
        float _2466 = _2464 * 0.15915493667125701904296875;
        float _2468 = _2466 * 6.283185482025146484375;
        float _2470 = sin(_2468);
        float _2472 = _2466 * 6.283185482025146484375;
        float _2474 = cos(_2472);
        float _2476 = fma(_2470, _2460, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2478 = _2462 * _2476;
        float _2480 = _2474 + (-1.0);
        float _2482 = fma(_2406, _2478, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2484 = fma(_2402, _2478, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2486 = _2480 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2488 = fma(_2398, _2474, _2486);
        _2452 = _2488;
        _2442 = _2482;
        _2446 = _2484;
    }
    float _2490 = _2452;
    float _2492 = _2442;
    float _2494 = _2446;
    float _2496 = _2490;
    float _2498 = _2492;
    float _2500 = _2494;
    if (!_2422)
    {
        float _2502 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2504 = _2346 + _2502;
        float _2506 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2508 = -_2346;
        float _2510 = _2508 + _2490;
        float _2512 = _2504 * _2504;
        float _2514 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2516 = _1742 + _2514;
        float _2518 = fma(_1812, _1812, _2512);
        float _2520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2522 = fma(_2516, _2516, _2518);
        float _2524 = _2506 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2526 = sqrt(_2522);
        float _2528 = -_1804;
        float _2530 = _2528 + _2492;
        float _2532 = precise::min(_2526, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2534 = _2532 * _2520;
        float _2536 = _2524 * _2534;
        float _2538 = -_1742;
        float _2540 = _2538 + _2494;
        float _2542 = fma(_2530, _2536, _1804);
        float _2544 = fma(_2510, _2536, _2346);
        float _2546 = fma(_2540, _2536, _1742);
        _2496 = _2544;
        _2498 = _2542;
        _2500 = _2546;
    }
    float _2548 = _2496;
    float _2550 = _2498;
    float _2552 = _2500;
    float _2554 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2556 = _2548 + _2554;
    float _2558 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2560 = _2550 + _2558;
    float _2562 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2564 = _2552 + _2562;
    float _2566 = _2556 * _2556;
    float _2568 = fma(_2560, _2560, _2566);
    float _2570 = fma(_2564, _2564, _2568);
    float _2572 = rsqrt(_2570);
    float _2574 = sqrt(_2570);
    float _2576 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2578 = _2560 * _2576;
    float _2580 = _2564 * _2576;
    float _2582 = _2578 * _2578;
    float _2584 = _2580 * _2580;
    float _2586 = _2582 + _2584;
    float _2588 = sqrt(_2586);
    bool _2590 = _2588 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2592 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2594 = _2588 + _2592;
    float _2596 = _2568;
    float _2598 = _2586;
    float _2600 = _2594;
    float _2602 = _2556;
    if (_2590)
    {
        float _2604 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2596 = _2604;
    }
    float _2606 = _2596;
    if (_2590)
    {
        float _2608 = rsqrt(_2586);
        _2598 = _2608;
    }
    float _2610 = _2598;
    float _2612 = _2610;
    if (_2590)
    {
        float _2614 = _2594 * _2606;
        _2600 = _2614;
    }
    float _2616 = _2600;
    if (_2590)
    {
        float _2618 = _2616 * 0.15915493667125701904296875;
        _2432 = _2618;
    }
    float _2620 = _2432;
    float _2622 = _2564;
    float _2624 = _2620;
    if (_2590)
    {
        float _2626 = _2620 * 6.283185482025146484375;
        float _2628 = sin(_2626);
        _2622 = _2628;
    }
    float _2630 = _2622;
    float _2632 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2634 = precise::max(0.0, _2632);
    float _2636 = _2606;
    float _2638 = _2634;
    if (_2590)
    {
        float _2640 = _2620 * 6.283185482025146484375;
        float _2642 = cos(_2640);
        _2636 = _2642;
    }
    float _2644 = _2636;
    float _2646 = -_2576;
    float _2648 = -_2634;
    float _2650 = fma(_2556, _2646, _2648);
    if (_2590)
    {
        float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2602 = _2652;
    }
    float _2654 = _2602;
    float _2656 = _2654;
    float _2658 = _2630;
    if (_2590)
    {
        float _2660 = fma(_2630, _2654, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2656 = _2660;
    }
    float _2662 = _2656;
    float _2664 = _2662;
    if (!_2590)
    {
        _2658 = _2578;
    }
    float _2666 = _2658;
    float _2668 = _2666;
    float _2670 = _2644;
    if (_2590)
    {
        float _2672 = _2644 + (-1.0);
        _2638 = _2672;
    }
    float _2674 = _2638;
    float _2676 = _2674;
    if (_2590)
    {
        float _2678 = _2610 * _2662;
        _2434 = _2678;
    }
    float _2680 = _2434;
    if (!_2590)
    {
        _2664 = _2650;
    }
    float _2682 = _2664;
    float _2684 = _2682;
    if (_2590)
    {
        float _2686 = _2674 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2624 = _2686;
    }
    float _2688 = _2624;
    if (_2590)
    {
        float _2690 = _2578 * _2680;
        _2668 = _2690;
    }
    float _2692 = _2668;
    if (!_2590)
    {
        _2676 = _2580;
    }
    float _2694 = _2676;
    float _2696 = _2694;
    if (_2590)
    {
        float _2698 = _2580 * _2680;
        _2696 = _2698;
    }
    float _2700 = _2696;
    if (!_2590)
    {
        _2612 = _2582;
    }
    float _2702 = _2612;
    float _2704 = _2702;
    if (_2590)
    {
        float _2706 = fma(_2650, _2644, _2688);
        _2684 = _2706;
    }
    float _2708 = _2684;
    if (_2590)
    {
        float _2710 = _2692 * _2692;
        _2704 = _2710;
    }
    float _2712 = _2704;
    if (!_2590)
    {
        _2670 = _2584;
    }
    float _2714 = _2670;
    float _2716 = _2714;
    if (_2590)
    {
        float _2718 = _2700 * _2700;
        _2716 = _2718;
    }
    float _2720 = _2716;
    float _2722 = fma(_2708, _2708, _2712);
    float _2724 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2726 = _2722 + _2720;
    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2730 = fma(_2574, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2728);
    float _2732 = precise::clamp(_2730, 0.0, 1.0);
    float _2734 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2724);
    float _2736 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2738 = rsqrt(_2726);
    float _2740 = -_2732;
    float _2742 = _2740 + 1.0;
    float _2744 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2746 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2734);
    float _2748 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2750 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2736);
    float _2752 = _2548 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2754 = _2746 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2756 = abs(_2742);
    float _2758 = log2(_2756);
    float _2760 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2748);
    float _2762 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2750);
    float _2764 = fma(_2550, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2752);
    float _2766 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2768 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2760);
    float _2770 = _2762 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2772 = fma(_2552, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2764);
    float _2774 = _2738 * _2692;
    float _2776 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2778 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2780 = _2738 * _2708;
    float _2782 = _2774 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2784 = _2738 * _2700;
    float _2786 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2778);
    float _2788 = -_2766;
    float _2790 = fma(_2788, _2744, 1.0);
    float _2792 = -_2782;
    float _2794 = fma(_2780, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2792);
    float _2796 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2798 = _2772 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2800 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2786);
    float _2802 = -_2784;
    float _2804 = fma(_2802, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2794);
    float _2806 = exp2(_2796);
    float _2808 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2810 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2800);
    float _2812 = fma(_2804, -0.5, 0.5);
    float _2814 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2816 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2808);
    float _2818 = fma(_2804, 0.5, 0.5);
    float _2820 = _2780 + 1.0;
    float _2822 = log2(_2790);
    float _2824 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2814);
    float _2826 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2816);
    float _2828 = fma(_2818, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2830 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2824);
    float _2832 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2826);
    float _2834 = fma(_2818, _2828, -0.212114393711090087890625);
    float _2836 = 1.0 / _2810;
    float _2838 = -_2780;
    float _2840 = fma(_2806, _2820, _2838);
    float _2842 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2830);
    float _2844 = fma(_2818, _2834, 1.570728778839111328125);
    float _2846 = sqrt(_2812);
    float _2848 = _2822 * 0.693147182464599609375;
    float _2850 = _2848 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2852 = fma(_2840, 0.5, 0.5);
    float _2854 = _2832 * _2836;
    float _2856 = _2842 * _2836;
    float _2858 = fma(_2854, 0.5, 0.5);
    float _2860 = fma(_2856, -0.5, 0.5);
    float _2862 = _2846 * 0.636619746685028076171875;
    float _2864 = -_2844;
    float _2866 = fma(_2862, _2864, 1.0);
    float3 _7898 = float3(_2858, _2860, _2850);
    float _2868 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7898, float3(0.0), isnan(_7898)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7898, float3(0.0), isnan(_7898)), level(0.0)).x;
    float3 _7909 = float3(_2858, _2860, _2850);
    float4 _2871 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7909, float3(0.0), isnan(_7909)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7909, float3(0.0), isnan(_7909)), level(0.0)).xyzw;
    float _2873 = _2871.x;
    float _2875 = _2871.y;
    float _2877 = _2871.z;
    float _2879 = _2871.w;
    float2 _7926 = float2(_2866, _2852);
    float3 _2883 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7926, float2(0.0), isnan(_7926)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7926, float2(0.0), isnan(_7926)), level(0.0)).xyz;
    float _2885 = _2883.x;
    float _2887 = _2883.y;
    float _2889 = _2883.z;
    float _2891 = in.m_61.y;
    float _2893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2895 = _144 > 0.5;
    out.m_63.x = _730;
    out.m_63.y = _732;
    out.m_63.z = _734;
    out.m_63.w = _722;
    float _2897 = _2758 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _1332;
    out.m_65.y = _1334;
    out.m_65.z = _1338;
    out.m_65.w = _1342;
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2901 = _2899 != 0;
    float _2903 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2905 = _2903 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2909 = _2907 != 0;
    float _2911 = exp2(_2897);
    bool _2913 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2915 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2917 = _2913 || _2915;
    bool _2919 = isnan(0.5);
    bool _2921 = _2917 || _2919;
    out.m_67.x = _2260;
    out.m_67.y = _2288;
    out.m_67.z = _2284;
    float _2923 = _2893 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2925 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2929 = 1.0 / _2905;
    float _2931 = -_2891;
    float _2933 = _2931 + 1.0;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2937 = -_2927;
    float _2939 = fma(_2925, 2.0, _2937);
    float _2941 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2943 = _2941 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2949 = _2947 != 0;
    float _2951 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2953 = _2951 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2955 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2957 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2945);
    bool _2959 = _2895;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _2963 = _2891;
    if (!_2901)
    {
        _2436 = _1374;
    }
    float _2965 = _2436;
    float _2967 = fma(_2955, -2.0, _2935);
    int _2969 = _2895 ? as_type<int>(_2933) : as_type<int>(_2891);
    float _2971 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2973 = _2971 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2975 = 1.0 / _2953;
    float _2977 = _2965;
    if (_2909)
    {
        bool _2979 = _132 > 0.5;
        _2959 = _2979;
    }
    bool _2981 = _2959;
    float _2983 = -_102;
    float _2985 = fma(_2983, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2939);
    if (_2901)
    {
        _2977 = _132;
    }
    float _2987 = _2977;
    float _2989 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2991 = _2989 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2995 = _2993 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2999 = _2997 != 0;
    float _3001 = -_2911;
    float _3003 = _3001 + 1.0;
    float _3005 = 1.0 / _2995;
    float _3007 = _3003 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _3009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _3011 = _3009 != 0;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3015 = _2999 ? as_type<float>(_2969) : _2891;
    bool _3017 = _2999;
    if (_2949)
    {
        bool _3019 = _136 > 0.5;
        _3017 = _3019;
    }
    bool _3021 = _3017;
    float _3023 = 1.0 / _2991;
    if (!_2901)
    {
        _2961 = _136;
    }
    float _3025 = _2961;
    float _3027 = fma(_1374, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3013);
    float _3029 = _3025;
    if (!_2901)
    {
        _2438 = _136;
    }
    float _3031 = _2438;
    float _3033 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _3033;
    float _3037 = _3031;
    if (_2901)
    {
        _3029 = _1374;
    }
    float _3039 = _3029;
    float _3041 = fma(_3015, _2923, -0.5);
    if (_2901)
    {
        _3037 = _1374;
    }
    float _3043 = _3037;
    float _3045 = 1.0 / _2973;
    float _3047 = _3035 * _2929;
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _3051 = _3049 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _3053 = _1374 > 0.5;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3057 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _3055;
    float _3059 = 1.0 / _2943;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3063 = _3061 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _3065 = _3051 * _2975;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3071 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _3073 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _3071;
    float _3075 = _3057 * _3023;
    float _3077 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _3079 = _3077 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _3081 = _3069 * _3005;
    float _3083 = 1.0 / _3063;
    float _3085 = _3073 * _3045;
    float _3087 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _3089 = _1360 + _3087;
    float _3091 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _3093 = _1360 + _3091;
    float _3095 = fma(_3085, _3089, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _3097 = fma(_3047, _3093, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _3099 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _3101 = _1360 + _3099;
    float _3103 = _3079 * _3059;
    float _3105 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _3107 = _1360 + _3105;
    bool _3109 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _3111 = isnan(_1360);
    bool _3113 = _3109 || _3111;
    bool _3115 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _3117 = _3113 || _3115;
    float _3119 = float(_3117);
    float _3121 = fma(_3075, _3101, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _3123 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _3125 = isnan(_1360);
    bool _3127 = _3123 || _3125;
    bool _3129 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _3131 = _3127 || _3129;
    float _3133 = float(_3131);
    float _3135 = fma(_3103, _3107, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _3137 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _3139 = isnan(_1360);
    bool _3141 = _3137 || _3139;
    bool _3143 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _3145 = _3141 || _3143;
    float _3147 = float(_3145);
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _3149;
    float _3153 = -_3119;
    float _3155 = _3153 + 1.0;
    bool _3157 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _3159 = isnan(_1360);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _3165 = _3161 || _3163;
    float _3167 = float(_3165);
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _3171 = _1360 + _3169;
    float _3173 = _3151 * _3083;
    float _3175 = -_3133;
    float _3177 = _3175 + 1.0;
    float _3179 = _3147 * _3155;
    float _3181 = -_3147;
    float _3183 = _3181 + 1.0;
    bool _3185 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _3187 = isnan(_1360);
    bool _3189 = _3185 || _3187;
    bool _3191 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _3193 = _3189 || _3191;
    float _3195 = float(_3193);
    float _3197 = -_3167;
    float _3199 = _3197 + 1.0;
    float _3201 = fma(_3065, _3171, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _3203 = _3119 * _3177;
    float _3205 = _3167 * _3183;
    bool _3207 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _3209 = isnan(_1360);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = _3195 * _3199;
    float _3221 = -_3195;
    float _3223 = _3221 + 1.0;
    float _3225 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3227 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _3229 = isnan(_1360);
    bool _3231 = _3227 || _3229;
    bool _3233 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _3235 = _3231 || _3233;
    float _3237 = float(_3235);
    float _3239 = -_3217;
    float _3241 = _3239 + 1.0;
    float _3243 = _3203;
    if (_3011)
    {
        float _3245 = _3053 ? _2933 : _2891;
        _2963 = _3245;
    }
    float _3247 = _2963;
    float _3249 = _3217 * _3223;
    float _3251 = _3237 * _3241;
    bool _3253 = _1360 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _3255 = isnan(_1360);
    bool _3257 = _3253 || _3255;
    bool _3259 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _3261 = _3257 || _3259;
    float _3263 = float(_3261);
    float _3265 = -_3237;
    float _3267 = _3265 + 1.0;
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _3271 = _1360 + _3269;
    float _3273 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3275 = _3263 * _3267;
    float _3277 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _3279 = _1360 + _3277;
    float _3281 = fma(_3173, _3271, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _3283 = fma(_3043, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3273);
    float _3285 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3287 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3289 = _3097 * _3275;
    float _3291 = _3225 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _3293 = fma(_2987, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3285);
    float _3295 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3287);
    float _3297 = _3039 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3299 = fma(_3291, _3247, -0.5);
    float _3301 = _2346 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3303 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3295);
    float _3305 = in.m_61.x;
    float _3307 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3301);
    float _3309 = _3303 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3311 = -_3263;
    float _3313 = _3311 + 1.0;
    float _3315 = _2987 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3317 = fma(_1742, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3307);
    float _3319 = 1.0 / _3309;
    float _3321 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[159].x, _3289);
    float _3323 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3325 = _3317 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3327 = _3317;
    int _3329 = as_type<int>(_3297);
    float _3331 = _3279;
    if (!_2921)
    {
        _3327 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3333 = _3327;
    float _3335 = fma(_3201, _3251, _3321);
    float _3337 = _3325 + _3309;
    float _3339 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3341 = fma(_3095, _3249, _3335);
    float _3343 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3027);
    float _3345 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2967);
    float _3347 = _3335;
    float _3349 = _3345;
    if (!_2921)
    {
        _3347 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3351 = _3347;
    float _3353 = fma(_3135, _3219, _3341);
    float _3355 = -_3323;
    float _3357 = fma(_3315, 2.0, _3355);
    float _3359 = -_3345;
    float _3361 = fma(_3343, _3299, _3359);
    float _3363 = _3337 * _3319;
    float _3365 = _3363 * 0.5;
    float _3367 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3371 = fma(_3121, _3205, _3353);
    float _3373 = _3353;
    if (!_2921)
    {
        float _3375 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3377 = fma(_3365, _3333, _3375);
        _3349 = _3377;
    }
    float _3379 = _3349;
    if (!_2921)
    {
        float _3381 = -_3351;
        float _3383 = _3381 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3373 = _3383;
    }
    float _3385 = _3373;
    float _3387 = fma(_3297, -2.0, _3369);
    float _3389 = _3305;
    if (_2909)
    {
        float _3391 = -_3305;
        float _3393 = _3391 + 1.0;
        _3329 = as_type<int>(_3393);
    }
    int _3395 = _3329;
    int _3397 = 0;
    if (_2949)
    {
        float _3399 = -_3305;
        float _3401 = _3399 + 1.0;
        _3397 = as_type<int>(_3401);
    }
    int _3403 = _3397;
    float _3405 = _3341;
    if (!_2921)
    {
        float _3407 = 1.0 / _3379;
        _3405 = _3407;
    }
    float _3409 = _3405;
    float _3411 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2957);
    float _3413 = fma(_3081, _3279, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3415 = in.m_57.w;
    if (!_2909)
    {
        _3331 = _3305;
    }
    float _3417 = _3331;
    float _3419 = _3339 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3421 = _3417;
    if (_2909)
    {
        float _3423 = _2981 ? as_type<float>(_3395) : _3305;
        _3421 = _3423;
    }
    float _3425 = _3421;
    float _3427 = fma(_3413, _3179, _3371);
    float _3429 = _3385;
    if (!_2921)
    {
        float _3431 = 1.0 / _3385;
        _3429 = _3431;
    }
    float _3433 = _3429;
    if (_2949)
    {
        float _3435 = _3021 ? as_type<float>(_3403) : _3305;
        _3389 = _3435;
    }
    float _3437 = _3389;
    float _3439 = _3367 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3441 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3293);
    float _3443 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3283);
    float _3445 = -_102;
    float _3447 = fma(_3445, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3357);
    float _3449 = _2770 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3451 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3387);
    float _3453 = fma(_3419, _3425, -0.5);
    float _3455 = fma(_3439, _3437, -0.5);
    float _3457 = fma(_3281, _3203, _3427);
    float _3459 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3449);
    float _3461 = _3451;
    if (!_2921)
    {
        float _3463 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3465 = -_3351;
        float _3467 = fma(_3409, _3463, _3465);
        _3243 = _3467;
    }
    float _3469 = _3243;
    float _3471 = -_3451;
    float _3473 = fma(_3443, _3041, _3471);
    float _3475 = fma(_3411, _3453, _2985);
    float _3477 = fma(_3441, _3455, _3447);
    if (_2921)
    {
        _3461 = 1.0;
    }
    float _3479 = _3461;
    float _3481 = fma(_2754, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3459);
    float _3483 = _3479;
    if (!_2921)
    {
        float _3485 = _3469 * _3433;
        float _3487 = precise::clamp(_3485, 0.0, 1.0);
        _3483 = _3487;
    }
    float _3489 = _3483;
    float _3491 = _3361 + 0.5;
    float _3493 = _3473 + 0.5;
    float _3495 = _3475 + 0.5;
    float _3497 = _3477 + 0.5;
    float _3499 = fma(_2798, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3481);
    float _3501 = fma(_3133, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3457);
    bool _3503 = _3489 > 0.0;
    bool _3505 = isnan(_3489);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _2832 + _2810;
    out.m_69.x = _3495;
    out.m_69.y = _3491;
    out.m_69.z = _3497;
    out.m_69.w = _3493;
    float _3515 = _3489 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3517 = _2810 * 0.5;
    float _3519 = _3499 + _2810;
    out.m_71.w = _3415;
    float _3521 = _3519 * 0.5;
    out.m_73.x = _3501;
    float _3523 = _3513 * 0.5;
    float _3525 = fma(_2842, -0.5, _3517);
    float _3527 = _3515 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2832;
    out.gl_Position.y = _2842;
    out.gl_Position.z = _3499;
    out.gl_Position.w = _2810;
    out.m_75.x = _3523;
    out.m_75.y = _3525;
    out.m_75.z = _3521;
    out.m_75.w = _2810;
    out.m_49.x = _3527;
    float _3529 = _3007 * _2868;
    float _3531 = -_3007;
    float _3533 = _3531 + 1.0;
    float _3535 = _2879 * _3529;
    float _3537 = _2889 * _3529;
    float _3539 = _2879 * _3533;
    float _3541 = fma(_2885, _3535, _2873);
    float _3543 = fma(_2887, _3535, _2875);
    float _3545 = fma(_2879, _3537, _2877);
    out.m_77.x = _3541;
    out.m_77.y = _3543;
    out.m_77.z = _3545;
    out.m_77.w = _3539;
    if (_3511)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3547 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3547;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

