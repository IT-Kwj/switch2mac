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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _3292 = as_type<float>(_120);
        out.gl_Position.z = _3292;
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
        float _3355 = as_type<float>(_152);
        out.gl_Position.z = _3355;
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
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _156;
    float _266 = fma(_254, _170, _258);
    float _268 = fma(_254, _172, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
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
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _354 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _356 = isnan(_300);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = 1.0 / _324;
    float _368 = _344 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _372 = _300 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = _300 + _374;
    bool _378 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _380 = isnan(_300);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_348, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = 1.0 / _320;
    float _398 = _372 * _336;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _402 = _300 + _400;
    float _404 = -_364;
    float _406 = _404 + 1.0;
    float _408 = fma(_352, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _410;
    float _414 = 1.0 / _330;
    float _416 = _304 * _366;
    bool _418 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _420 = isnan(_300);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = fma(_432, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = 1.0 / _334;
    float _450 = _308 * _396;
    bool _452 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _454 = isnan(_300);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = fma(_436, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _466 = fma(_444, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = 1.0 / _340;
    float _472 = _376 * _414;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _476 = _300 + _474;
    float _478 = _402 * _448;
    float _480 = -_428;
    float _482 = _480 + 1.0;
    float _484 = -_462;
    float _486 = _484 + 1.0;
    float _488 = _462 * _482;
    bool _490 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _492 = isnan(_300);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _388 * _486;
    float _504 = _476 * _470;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _514 = -_388;
    float _516 = _514 + 1.0;
    float _518 = -_500;
    float _520 = _518 + 1.0;
    float _522 = fma(_508, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = fma(_512, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _526 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _528 = isnan(_300);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = _500 * _516;
    bool _540 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _542 = isnan(_300);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    bool _552 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_300);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _536 * _520;
    float _566 = fma(_394, _450, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _568 = -_536;
    float _570 = _568 + 1.0;
    float _572 = -_550;
    float _574 = _572 + 1.0;
    float _576 = _562 * _406;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    float _582 = _550 * _570;
    float _584 = _364 * _574;
    float _586 = _522 * _576;
    float _588 = _446 * _576;
    float _590 = fma(_412, _450, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _596 = _390 * _576;
    float _598 = fma(_440, _450, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _588);
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _610 = fma(_594, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _612 = fma(_602, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _614 = fma(_524, _584, _604);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_464, _584, _606);
    float _630 = fma(_408, _584, _608);
    float _632 = fma(_618, _472, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _472, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _472, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = fma(_566, _582, _614);
    float _640 = fma(_590, _582, _628);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = fma(_598, _582, _630);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_466, _564, _638);
    float _658 = fma(_610, _564, _640);
    float _660 = fma(_612, _564, _646);
    float _662 = fma(_644, _478, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _664 = fma(_650, _478, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _666 = fma(_654, _478, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _668 = fma(_632, _538, _656);
    float _670 = in.m_55.x;
    float _672 = in.m_55.y;
    float _674 = in.m_55.z;
    float _676 = fma(_634, _538, _658);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _686;
    float _690 = fma(_636, _538, _660);
    float _692 = fma(_680, _504, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _504, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_662, _502, _668);
    float _698 = fma(_664, _502, _676);
    float _700 = fma(_688, _504, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _702 = fma(_666, _502, _690);
    float _704 = fma(_692, _488, _696);
    float _706 = fma(_694, _488, _698);
    float _708 = fma(_700, _488, _702);
    float _710 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _720 = _710 * _670;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _724 = _712 * _672;
    float _726 = _714 * _674;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _736 = !_468;
    float _752;
    if (!_736)
    {
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _740 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
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
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _770 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _772 = isnan(_756);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = 1.0 / _760;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _792 = -_780;
    float _794 = _792 + 1.0;
    bool _796 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _798 = isnan(_756);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    bool _808 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _810 = isnan(_756);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _764;
    bool _822 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _824 = 1.0 / _768;
    float _826 = _786 * _782;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _828;
    bool _832 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _834 = isnan(_756);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _790 * _820;
    bool _846 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _848 = isnan(_756);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_856;
    float _860 = _858 + 1.0;
    float _862 = _830 * _824;
    float _864 = _842 * _794;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    float _870 = _806 * _860;
    float _872 = -_806;
    float _874 = _872 + 1.0;
    float _876 = _856 * _868;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _886 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _888 = isnan(_756);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _818 * _874;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _756 + _900;
    float _904 = 1.0 / _884;
    float _906 = -_818;
    float _908 = _906 + 1.0;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _914 = fma(_826, _902, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _756 + _916;
    float _920 = 1.0 / _880;
    float _922 = _896 * _908;
    float _924 = -_896;
    float _926 = _924 + 1.0;
    float _928 = fma(_844, _918, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _756 + _930;
    float _934 = _914 * _922;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _944 = 1.0 / _912;
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[131].x, _934);
    float _948 = fma(_862, _932, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _950 = _942 * _904;
    bool _952 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _954 = isnan(_756);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = fma(_928, _898, _946);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _970 = _938 * _920;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _974 = _756 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _978 = _756 + _976;
    float _980 = fma(_950, _974, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _982 = fma(_948, _870, _964);
    float _984 = fma(_970, _978, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _986 = _968 * _944;
    float _988 = -_962;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _994 = _756 + _992;
    float _996 = fma(_980, _876, _982);
    float _998 = _780 * _990;
    float _1000 = fma(_986, _994, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1002 = fma(_984, _864, _996);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1006 = fma(_1000, _998, _1002);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1014 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[137].x, _1006);
    float _1016 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1022 = !_822;
    if (!_1022)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1026 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _280 = _1036;
    }
    float _1038 = _280;
    float _1040 = in.m_57.x;
    float _1042 = in.m_57.y;
    float _1044 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1046 = log2(_1044);
    float _1048 = _102 * 0.039999999105930328369140625;
    float _1050 = _136 * 2.0;
    float _1052 = in.m_51.y;
    float _1054 = _144 * 6.283185482025146484375;
    float _1056 = _1048 * 0.15915493667125701904296875;
    float _1058 = _132 * 2.0;
    float _1060 = floor(_1050);
    float _1062 = floor(_1058);
    float _1064 = _102 * _1046;
    float _1066 = fma(_102, 0.010999999940395355224609375, _1054);
    float _1068 = _1066 * 0.15915493667125701904296875;
    float _1070 = abs(_1040);
    float _1072 = abs(_1042);
    float _1074 = precise::max(_1070, _1072);
    float _1076 = _1040 * 0.0625;
    float _1078 = _1056 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    bool _1082 = _1060 >= 0.0;
    bool _1084 = isnan(_1060);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = _1052 * 6.283185482025146484375;
    bool _1094 = _1074 >= 16.0;
    float _1096 = _1042 * 0.0625;
    float _1098 = _1052 * 2.0;
    float _1100 = fma(_102, 0.007000000216066837310791015625, _1092);
    float _1102 = _1094 ? _1076 : _1040;
    float _1104 = _1068 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    float _1108 = _1094 ? _1096 : _1042;
    float _1110 = _1100 * 0.15915493667125701904296875;
    float _1112 = abs(_1102);
    bool _1114 = _1112 == 0.0;
    float _1116 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1118 = abs(_1108);
    bool _1120 = _1118 != 0.0;
    bool _1122 = isnan(_1118);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = _1060 > 0.0;
    float _1132 = floor(_1098);
    float _1134 = abs(_1102);
    bool _1136 = _1134 == 0.0;
    bool _1138 = !_1128;
    bool _1140 = _1136 && _1138;
    float _1142 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1144 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1116);
    float _1146 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1148 = _1110 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    bool _1152 = false;
    if (_1140)
    {
        bool _1154 = as_type<int>(_1102) >= 0;
        _1152 = _1154;
    }
    bool _1156 = _1152;
    float _1158 = exp2(_1064);
    int _1160 = 0;
    int _1162 = _1156 ? (-1) : 0;
    if (_1140)
    {
        int _1164 = _1156 ? 0 : 1078530011;
        _1160 = _1164;
    }
    int _1166 = _1160;
    float _1168 = _132 + _136;
    float _1170 = _1168 + (-1.0);
    float _1172 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1142);
    float _1174 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1146);
    float _1176 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1178 = _1170;
    int _1180 = _1166;
    if (_1140)
    {
        int _1182 = int(0x80000000) & as_type<int>(_1108);
        int _1184 = _1166 | _1182;
        _1178 = as_type<float>(_1184);
    }
    float _1186 = _1178;
    bool _1188 = !_1128;
    bool _1190 = _1188 && _1114;
    float _1192 = _1186;
    float _1194 = _1186;
    if (!_1190)
    {
        float _1196 = abs(_1108);
        bool _1198 = _1196 != as_type<float>(0x7f800000u /* inf */);
        bool _1200 = isnan(_1196);
        bool _1202 = _1198 || _1200;
        bool _1204 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1206 = _1202 || _1204;
        float _1208 = abs(_1102);
        bool _1210 = _1208 == as_type<float>(0x7f800000u /* inf */);
        float _1212 = abs(_1102);
        bool _1214 = _1212 == as_type<float>(0x7f800000u /* inf */);
        bool _1216 = !_1206;
        bool _1218 = _1214 && _1216;
        if (_1218)
        {
            bool _1220 = as_type<int>(_1102) >= 0;
            _1162 = _1220 ? (-1) : 0;
        }
        int _1222 = _1162;
        if (_1218)
        {
            _1180 = 1075235812;
        }
        int _1224 = _1180;
        int _1226 = _1224;
        if (_1218)
        {
            int _1228 = ~_1222;
            int _1230 = (_1228 != 0) ? _1224 : 1061752795;
            _1226 = _1230;
        }
        int _1232 = _1226;
        if (_1218)
        {
            int _1234 = int(0x80000000) & as_type<int>(_1108);
            int _1236 = _1232 | _1234;
            _1192 = as_type<float>(_1236);
        }
        float _1238 = _1192;
        bool _1240 = !_1206;
        bool _1242 = _1240 && _1210;
        _1194 = _1238;
        if (!_1242)
        {
            float _1244 = abs(_1108);
            float _1246 = abs(_1102);
            float _1248 = precise::max(_1244, _1246);
            float _1250 = abs(_1108);
            float _1252 = abs(_1102);
            float _1254 = precise::min(_1250, _1252);
            float _1256 = 1.0 / _1248;
            float _1258 = abs(_1108);
            float _1260 = abs(_1102);
            bool _1262 = _1258 > _1260;
            bool _1264 = as_type<int>(_1102) >= 0;
            float _1266 = _1254 * _1256;
            float _1268 = _1266 * _1266;
            float _1270 = _1268 + 11.33538818359375;
            float _1272 = fma(_1268, _1270, 28.84246826171875);
            float _1274 = fma(_1268, _1272, 19.6966705322265625);
            float _1276 = fma(_1268, -0.82336294651031494140625, -5.674867153167724609375);
            float _1278 = fma(_1268, _1276, -6.565555095672607421875);
            float _1280 = 1.0 / _1274;
            float _1282 = _1268 * _1278;
            float _1284 = abs(_1108);
            float _1286 = abs(_1102);
            float _1288 = _1284 + _1286;
            int _1290 = as_type<int>(_1108) & int(0x80000000);
            float _1292 = _1266 * _1282;
            bool _1294 = _1288 > as_type<float>(0x7f800000u /* inf */);
            bool _1296 = isnan(_1288);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1302 = _1298 || _1300;
            float _1304 = fma(_1292, _1280, _1266);
            float _1306 = _1304;
            _1194 = _1288;
            if (_1262)
            {
                float _1308 = -_1304;
                float _1310 = _1308 + 1.57079637050628662109375;
                _1306 = _1310;
            }
            float _1312 = _1306;
            int _1314 = as_type<int>(_1312);
            if (!_1264)
            {
                float _1316 = -_1312;
                float _1318 = _1316 + 3.1415927410125732421875;
                _1314 = as_type<int>(_1318);
            }
            int _1320 = _1314;
            if (!_1302)
            {
                int _1322 = _1290 | _1320;
                _1194 = as_type<float>(_1322);
            }
        }
    }
    float _1324 = _1194;
    float _1326 = _132 + _1052;
    float _1328 = abs(_1150);
    float _1330 = log2(_1328);
    float _1332 = _136 + _1052;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1336 = _1326 + (-1.0);
    float _1338 = _1332 + (-1.0);
    float _1340 = abs(_1106);
    float _1342 = log2(_1340);
    float _1344 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1334);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1350 = _1090 ? 0 : 1;
    float _1352 = fma(_1080, 9.0, _102);
    float _1354 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1144);
    bool _1356 = _1062 > 0.0;
    float _1358 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1174);
    int _1360 = ~_1350;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1344);
    bool _1368 = _1062 >= 0.0;
    bool _1370 = isnan(_1062);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = -_1158;
    float _1380 = _1378 + 1.0;
    int _1382 = _1364;
    if (!_1130)
    {
        int _1384 = ~_1350;
        int _1386 = _1384 + 1;
        _1382 = _1386;
    }
    int _1388 = _1382;
    float _1390 = _1330 * 120.0;
    float _1392 = _1352 * 0.20999999344348907470703125;
    bool _1394 = _1132 > 0.0;
    float _1396 = _1352 * (-0.1599999964237213134765625);
    bool _1398 = _1132 >= 0.0;
    bool _1400 = isnan(_1132);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1410 = 1.0 + _1408;
    float _1412 = _1342 * 80.0;
    int _1414 = _1376 ? 0 : 1;
    float _1416 = fma(_1324, 5.00000095367431640625, _1392);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1428 = _1426 != 0;
    float _1430 = fma(_1324, 4.000000476837158203125, _1396);
    int _1432 = ~_1414;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _1416 * 0.15915493667125701904296875;
    int _1440 = _1436;
    bool _1442 = _1406;
    if (!_1356)
    {
        int _1444 = ~_1414;
        int _1446 = _1444 + 1;
        _1440 = _1446;
    }
    int _1448 = _1440;
    float _1450 = _1430 * 0.15915493667125701904296875;
    bool _1452 = !_1420;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = 1.0 / _1410;
    float _1458 = _1354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1460 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1462 = abs(_1454);
    float _1464 = float(_1388);
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    bool _1470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1478 = _1474 || _1476;
    float _1480 = exp2(_1412);
    float _1482 = float(_1462);
    float _1484 = _1478 ? _1380 : 0.0;
    int _1486 = _1406 ? 0 : 1;
    float _1488 = _1482 * _1464;
    float _1490 = exp2(_1390);
    int _1492 = ~_1486;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    float _1498 = _1488 * (-2.0);
    int _1500 = _1496;
    if (!_1394)
    {
        int _1502 = ~_1486;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    float _1508 = fma(_1346, _1498, _1346);
    bool _1510 = !_1428;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = _1438 * 6.283185482025146484375;
    float _1516 = sin(_1514);
    bool _1518 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1520 = isnan(1.0);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1526 = _1522 || _1524;
    int _1528 = abs(_1512);
    float _1530 = _1450 * 6.283185482025146484375;
    float _1532 = sin(_1530);
    float _1534 = -_1460;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = abs(_1468);
    float _1540 = abs(_1536);
    float _1542 = precise::max(_1538, _1540);
    float _1544 = rsqrt(_1366);
    float _1546 = _1484 * _1456;
    float _1548 = _1480 + _1490;
    float _1550 = _132 + (-0.5);
    bool _1552 = _1542 >= 16.0;
    float _1554 = float(_1506);
    float _1556 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1558 = _1516 + _1532;
    bool _1560 = !_1424;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = in.m_59.x;
    float _1566 = in.m_59.y;
    float _1568 = in.m_59.z;
    float _1570 = float(_1528);
    float _1572 = precise::max(_1558, -2.0);
    int _1574 = abs(_1562);
    float _1576 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1578 = precise::min(_1572, 2.0);
    float _1580 = _1570 * _1554;
    float _1582 = float(_1574);
    float _1584 = _1576 * (-0.15915493667125701904296875);
    float _1586 = float(_1448);
    float _1588 = fma(_1578, 0.25, 0.5);
    float _1590 = _1580 * (-2.0);
    bool _1592 = !_1526;
    float _1594 = _1592 ? _102 : _1546;
    float _1596 = _1584 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = _1582 * _1586;
    float _1602 = _1588 * 0.07999999821186065673828125;
    float _1604 = _136 + (-0.5);
    float _1606 = fma(_1176, _1590, _1176);
    float _1608 = _1600 * (-2.0);
    float _1610 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1612 = _1604 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1614 = fma(_1594, _1508, _1556);
    float _1616 = fma(_1348, _1608, _1348);
    float _1618 = fma(_1042, _1610, _1566);
    float _1620 = _1052 * (-0.87964594364166259765625);
    float _1622 = fma(_1594, _1606, _1612);
    float _1624 = _102 * (-0.17000000178813934326171875);
    float _1626 = _132 * 6.283185482025146484375;
    float _1628 = fma(_1618, 9.0, _1620);
    float _1630 = _1622 * 0.15915493667125701904296875;
    float _1632 = fma(_1618, 16.0, _1624);
    float _1634 = _1584 * 6.283185482025146484375;
    float _1636 = cos(_1634);
    float _1638 = _1614 * 0.15915493667125701904296875;
    float _1640 = _1052 + (-0.5);
    float _1642 = _1632 + _1626;
    float _1644 = _1092 + _1628;
    float _1646 = _1536;
    if (_1552)
    {
        float _1648 = _1536 * 0.0625;
        _1646 = _1648;
    }
    float _1650 = _1646;
    float _1652 = fma(_1040, _1610, _1564);
    float _1654 = _1642 * 0.15915493667125701904296875;
    float _1656 = _1638 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = _1468 * 0.0625;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1664 = _1644 * 0.15915493667125701904296875;
    float _1666 = abs(_1650);
    bool _1668 = _1666 == 0.0;
    float _1670 = _1552 ? _1660 : _1468;
    float _1672 = fma(_1594, _1616, _1662);
    float _1674 = _1638 * 6.283185482025146484375;
    float _1676 = cos(_1674);
    float _1678 = abs(_1670);
    bool _1680 = _1678 != 0.0;
    bool _1682 = isnan(_1678);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = fma(_1618, 0.5, 0.5);
    float _1692 = precise::clamp(_1690, 0.0, 1.0);
    float _1694 = abs(_1650);
    bool _1696 = _1694 == 0.0;
    bool _1698 = !_1688;
    bool _1700 = _1696 && _1698;
    float _1702 = _1654 * 6.283185482025146484375;
    float _1704 = sin(_1702);
    float _1706 = _102 * (-0.37000000476837158203125);
    float _1708 = fma(_1692, -2.0, 3.0);
    float _1710 = fma(_1618, 0.58823525905609130859375, 0.411764681339263916015625);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = fma(_1618, 5.0, _1706);
    float _1716 = fma(_1712, -2.0, 3.0);
    float _1718 = _1630 * 6.283185482025146484375;
    float _1720 = sin(_1718);
    float _1722 = _1714 + _1054;
    int _1724 = as_type<int>(_1708);
    float _1726 = 0.58823525905609130859375;
    if (_1700)
    {
        bool _1728 = as_type<int>(_1650) >= 0;
        _1442 = _1728;
    }
    bool _1730 = _1442;
    float _1732 = _1722 * 0.15915493667125701904296875;
    float _1734 = _1692 * _1692;
    float _1736 = _1664 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = _1704 * 0.064000003039836883544921875;
    float _1742 = _1708 * _1734;
    int _1744 = _1730 ? (-1) : 0;
    if (_1700)
    {
        int _1746 = _1730 ? 0 : 1078530011;
        _1724 = _1746;
    }
    int _1748 = _1724;
    float _1750 = _1712 * _1712;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _1754 = _1748;
    if (_1700)
    {
        int _1756 = int(0x80000000) & as_type<int>(_1670);
        int _1758 = _1748 | _1756;
        _1726 = as_type<float>(_1758);
    }
    float _1760 = _1726;
    float _1762 = _1732 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    bool _1766 = !_1688;
    bool _1768 = _1766 && _1668;
    float _1770 = _1760;
    float _1772 = _1760;
    if (!_1768)
    {
        float _1774 = abs(_1670);
        bool _1776 = _1774 != as_type<float>(0x7f800000u /* inf */);
        bool _1778 = isnan(_1774);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1784 = _1780 || _1782;
        float _1786 = abs(_1650);
        bool _1788 = _1786 == as_type<float>(0x7f800000u /* inf */);
        float _1790 = abs(_1650);
        bool _1792 = _1790 == as_type<float>(0x7f800000u /* inf */);
        bool _1794 = !_1784;
        bool _1796 = _1792 && _1794;
        if (_1796)
        {
            bool _1798 = as_type<int>(_1650) >= 0;
            _1744 = _1798 ? (-1) : 0;
        }
        int _1800 = _1744;
        if (_1796)
        {
            _1754 = 1075235812;
        }
        int _1802 = _1754;
        int _1804 = _1802;
        if (_1796)
        {
            int _1806 = ~_1800;
            int _1808 = (_1806 != 0) ? _1802 : 1061752795;
            _1804 = _1808;
        }
        int _1810 = _1804;
        if (_1796)
        {
            int _1812 = int(0x80000000) & as_type<int>(_1670);
            int _1814 = _1810 | _1812;
            _1770 = as_type<float>(_1814);
        }
        float _1816 = _1770;
        bool _1818 = !_1784;
        bool _1820 = _1818 && _1788;
        _1772 = _1816;
        if (!_1820)
        {
            float _1822 = abs(_1670);
            float _1824 = abs(_1650);
            float _1826 = precise::max(_1822, _1824);
            float _1828 = abs(_1670);
            float _1830 = abs(_1650);
            float _1832 = precise::min(_1828, _1830);
            float _1834 = 1.0 / _1826;
            float _1836 = abs(_1670);
            float _1838 = abs(_1650);
            bool _1840 = _1836 > _1838;
            bool _1842 = as_type<int>(_1650) >= 0;
            float _1844 = _1832 * _1834;
            float _1846 = _1844 * _1844;
            float _1848 = _1846 + 11.33538818359375;
            float _1850 = fma(_1846, _1848, 28.84246826171875);
            float _1852 = fma(_1846, _1850, 19.6966705322265625);
            float _1854 = fma(_1846, -0.82336294651031494140625, -5.674867153167724609375);
            float _1856 = fma(_1846, _1854, -6.565555095672607421875);
            float _1858 = 1.0 / _1852;
            float _1860 = _1846 * _1856;
            float _1862 = abs(_1670);
            float _1864 = abs(_1650);
            float _1866 = _1862 + _1864;
            int _1868 = as_type<int>(_1670) & int(0x80000000);
            float _1870 = _1844 * _1860;
            bool _1872 = _1866 > as_type<float>(0x7f800000u /* inf */);
            bool _1874 = isnan(_1866);
            bool _1876 = _1872 || _1874;
            bool _1878 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1880 = _1876 || _1878;
            float _1882 = fma(_1870, _1858, _1844);
            float _1884 = _1882;
            _1772 = _1866;
            if (_1840)
            {
                float _1886 = -_1882;
                float _1888 = _1886 + 1.57079637050628662109375;
                _1884 = _1888;
            }
            float _1890 = _1884;
            int _1892 = as_type<int>(_1890);
            if (!_1842)
            {
                float _1894 = -_1890;
                float _1896 = _1894 + 3.1415927410125732421875;
                _1892 = as_type<int>(_1896);
            }
            int _1898 = _1892;
            if (!_1880)
            {
                int _1900 = _1868 | _1898;
                _1772 = as_type<float>(_1900);
            }
        }
    }
    float _1902 = _1772;
    float _1904 = _1764 * _1548;
    float _1906 = fma(_1740, _1752, _1652);
    float _1908 = _1738 * 0.07299999892711639404296875;
    float _1910 = -_1902;
    float _1912 = _1672 + _1910;
    float _1914 = _1716 * _1750;
    float _1916 = _1904 * 0.180000007152557373046875;
    float _1918 = _136 * 6.283185482025146484375;
    float _1920 = fma(_1908, _1752, _1906);
    float _1922 = _1912 * 0.15915493667125701904296875;
    float _1924 = _1916 * _1914;
    float _1926 = fma(_102, 0.310000002384185791015625, _1918);
    float _1928 = _1598 * _1568;
    float _1930 = _1618 + 0.20000000298023223876953125;
    float _1932 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1920);
    float _1934 = _1630 * 6.283185482025146484375;
    float _1936 = cos(_1934);
    float _1938 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1940 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1932);
    float _1944 = fma(_102, 0.10999999940395355224609375, _1626);
    float _1946 = _1636 * _1568;
    float _1948 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1940);
    float _1950 = _1922 * 6.283185482025146484375;
    float _1952 = sin(_1950);
    float _1954 = -_1928;
    float _1956 = fma(_1636, _1930, _1954);
    float _1958 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1960 = _1942 * _1938;
    float _1962 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1964 = _1956 + (-0.20000000298023223876953125);
    float _1966 = _1926 * 0.15915493667125701904296875;
    float _1968 = fma(_1598, _1930, _1946);
    float _1970 = _1922 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1964);
    float _1976 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1172);
    float _1978 = _1958 * _1974;
    float _1980 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1968);
    float _1982 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1948);
    float _1984 = _1966 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    float _1988 = _1944 * 0.15915493667125701904296875;
    float _1990 = _1658 * _1952;
    float _1992 = _1936 * _1978;
    float _1994 = _1676 * _1952;
    float _1996 = _1980 * _1962;
    float _1998 = -_1978;
    float _2000 = _1720 * _1998;
    float _2002 = _1676 * _1992;
    float _2004 = _1676 * _1972;
    float _2006 = _1658 * _1972;
    float _2008 = 1.0 / _1958;
    float _2010 = _1658 * _1992;
    float _2012 = fma(_1720, _2004, _1990);
    float _2014 = -_1994;
    float _2016 = fma(_1720, _2006, _2014);
    float _2018 = fma(_1720, _1990, _2004);
    float _2020 = _1972 * _1936;
    float _2022 = fma(_2012, _1960, _2002);
    float _2024 = -_2006;
    float _2026 = fma(_1720, _1994, _2024);
    float _2028 = sqrt(_1982);
    float _2030 = fma(_1986, 0.12999999523162841796875, 1.0);
    float _2032 = fma(_2016, _1960, _2010);
    float _2034 = fma(_2026, _1996, _2022);
    float _2036 = _1976 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2038 = _1952 * _1936;
    float _2040 = fma(_2020, _1960, _2000);
    float _2042 = fma(_2018, _1996, _2032);
    float _2044 = _1988 * 6.283185482025146484375;
    float _2046 = sin(_2044);
    float _2048 = _2036 + _2034;
    float _2050 = fma(_2038, _1996, _2040);
    float _2052 = _1460 + _2042;
    float _2054 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2056 = _2048 + _2054;
    float _2058 = _1458 + _2050;
    float _2060 = _2028 * 0.64999997615814208984375;
    float _2062 = _2056 * _2008;
    float _2064 = fma(_2062, _2062, _2062);
    float _2066 = fma(_2046, 0.300000011920928955078125, _2030);
    float _2068 = _2064 * _2060;
    float _2070 = _2066 * _2068;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2052);
    float _2074 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2058);
    float _2076 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2048);
    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2080 = _2072 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2084 = _2074 + _2082;
    float _2086 = _2080 * _2080;
    float _2088 = fma(_2084, _2084, _2086);
    float _2090 = sqrt(_2088);
    bool _2092 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan(0.5);
    bool _2100 = _2096 || _2098;
    bool _2102 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2106 = _1996;
    float _2108 = _2074;
    float _2110 = _2080;
    float _2112 = _2088;
    float _2114 = _1994;
    float _2116 = _1992;
    float _2118 = (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_2102)
    {
        _2104 = _2072;
    }
    float _2120 = _2104;
    float _2122 = _2120;
    if (!_2102)
    {
        _2106 = _2076;
    }
    float _2124 = _2106;
    bool _2126 = !_2102;
    float _2128 = _2124;
    if (!_2126)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2134 = _2090 + _2132;
        float _2136 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2138 = _2134 * _2130;
        float _2140 = rsqrt(_2088);
        float _2142 = _2138 * 0.15915493667125701904296875;
        float _2144 = _2142 * 6.283185482025146484375;
        float _2146 = sin(_2144);
        float _2148 = _2142 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = fma(_2146, _2136, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2154 = _2140 * _2152;
        float _2156 = _2150 + (-1.0);
        float _2158 = fma(_2084, _2154, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2160 = fma(_2080, _2154, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2164 = fma(_2076, _2150, _2162);
        _2128 = _2164;
        _2108 = _2158;
        _2122 = _2160;
    }
    float _2166 = _2128;
    float _2168 = _2108;
    float _2170 = _2122;
    float _2172 = _2166;
    float _2174 = _2168;
    float _2176 = _2170;
    if (!_2100)
    {
        float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2180 = _2036 + _2178;
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2184 = -_2036;
        float _2186 = _2184 + _2166;
        float _2188 = _2180 * _2180;
        float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2192 = _1460 + _2190;
        float _2194 = fma(_1468, _1468, _2188);
        float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2198 = fma(_2192, _2192, _2194);
        float _2200 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2202 = sqrt(_2198);
        float _2204 = -_1458;
        float _2206 = _2204 + _2168;
        float _2208 = precise::min(_2202, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2210 = _2208 * _2196;
        float _2212 = _2200 * _2210;
        float _2214 = -_1460;
        float _2216 = _2214 + _2170;
        float _2218 = fma(_2206, _2212, _1458);
        float _2220 = fma(_2186, _2212, _2036);
        float _2222 = fma(_2216, _2212, _1460);
        _2172 = _2220;
        _2174 = _2218;
        _2176 = _2222;
        _2110 = _2212;
    }
    float _2224 = _2172;
    float _2226 = _2174;
    float _2228 = _2176;
    float _2230 = _2110;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = _2224 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = _2226 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2228 + _2240;
    float _2244 = _2234 * _2234;
    float _2246 = fma(_2238, _2238, _2244);
    float _2248 = fma(_2242, _2242, _2246);
    float _2250 = rsqrt(_2248);
    float _2252 = sqrt(_2248);
    float _2254 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2256 = _2238 * _2254;
    float _2258 = _2242 * _2254;
    float _2260 = _2256 * _2256;
    float _2262 = _2258 * _2258;
    float _2264 = _2260 + _2262;
    float _2266 = sqrt(_2264);
    bool _2268 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = _2266 + _2270;
    float _2274 = _2242;
    float _2276 = _2230;
    float _2278 = _2272;
    float _2280 = _2234;
    if (_2268)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2274 = _2282;
    }
    float _2284 = _2274;
    if (_2268)
    {
        float _2286 = rsqrt(_2264);
        _2276 = _2286;
    }
    float _2288 = _2276;
    float _2290 = _2288;
    if (_2268)
    {
        float _2292 = _2272 * _2284;
        _2278 = _2292;
    }
    float _2294 = _2278;
    if (_2268)
    {
        float _2296 = _2294 * 0.15915493667125701904296875;
        _2112 = _2296;
    }
    float _2298 = _2112;
    float _2300 = _2250;
    if (_2268)
    {
        float _2302 = _2298 * 6.283185482025146484375;
        float _2304 = sin(_2302);
        _2300 = _2304;
    }
    float _2306 = _2300;
    float _2308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2310 = precise::max(0.0, _2308);
    float _2312 = _2246;
    float _2314 = _2310;
    float _2316 = _2308;
    if (_2268)
    {
        float _2318 = _2298 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        _2312 = _2320;
    }
    float _2322 = _2312;
    float _2324 = -_2254;
    float _2326 = -_2310;
    float _2328 = fma(_2234, _2324, _2326);
    if (!_2268)
    {
        _2314 = _2256;
    }
    float _2330 = _2314;
    float _2332 = _2330;
    if (_2268)
    {
        float _2334 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2316 = _2334;
    }
    float _2336 = _2316;
    float _2338 = _2306;
    float _2340 = _2336;
    if (_2268)
    {
        float _2342 = fma(_2306, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2280 = _2342;
    }
    float _2344 = _2280;
    float _2346 = _2344;
    if (!_2268)
    {
        _2338 = _2260;
    }
    float _2348 = _2338;
    float _2350 = _2348;
    float _2352 = _2322;
    if (_2268)
    {
        float _2354 = _2322 + (-1.0);
        _2340 = _2354;
    }
    float _2356 = _2340;
    float _2358 = _2356;
    if (_2268)
    {
        float _2360 = _2288 * _2344;
        _2114 = _2360;
    }
    float _2362 = _2114;
    if (!_2268)
    {
        _2346 = _2328;
    }
    float _2364 = _2346;
    float _2366 = _2364;
    if (_2268)
    {
        float _2368 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2290 = _2368;
    }
    float _2370 = _2290;
    if (_2268)
    {
        float _2372 = _2256 * _2362;
        _2332 = _2372;
    }
    float _2374 = _2332;
    if (!_2268)
    {
        _2358 = _2258;
    }
    float _2376 = _2358;
    float _2378 = _2376;
    if (_2268)
    {
        float _2380 = _2258 * _2362;
        _2378 = _2380;
    }
    float _2382 = _2378;
    if (_2268)
    {
        float _2384 = fma(_2328, _2322, _2370);
        _2366 = _2384;
    }
    float _2386 = _2366;
    if (_2268)
    {
        float _2388 = _2374 * _2374;
        _2350 = _2388;
    }
    float _2390 = _2350;
    if (!_2268)
    {
        _2352 = _2262;
    }
    float _2392 = _2352;
    float _2394 = _2392;
    if (_2268)
    {
        float _2396 = _2382 * _2382;
        _2394 = _2396;
    }
    float _2398 = _2394;
    float _2400 = fma(_2386, _2386, _2390);
    float _2402 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2404 = _2400 + _2398;
    float _2406 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2402);
    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2410 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2408);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2416 = rsqrt(_2404);
    float _2418 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2406);
    float _2420 = -_2412;
    float _2422 = _2420 + 1.0;
    float _2424 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2426 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2414);
    float _2428 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2430 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2432 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2424);
    float _2434 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2426);
    float _2436 = abs(_2422);
    float _2438 = log2(_2436);
    float _2440 = _2418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2442 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2432);
    float _2444 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2430);
    float _2448 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2450 = _2442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2452 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2454 = _2416 * _2374;
    float _2456 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2446);
    float _2458 = -_2448;
    float _2460 = fma(_2458, _2428, 1.0);
    float _2462 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2452);
    float _2464 = _2416 * _2386;
    float _2466 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2468 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2470 = _2416 * _2382;
    float _2472 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2474 = -_2466;
    float _2476 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2474);
    float _2478 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2462);
    float _2480 = log2(_2460);
    float _2482 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2484 = -_2470;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2476);
    float _2488 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2478);
    float _2490 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2492 = fma(_2486, -0.5, 0.5);
    float _2494 = fma(_2486, 0.5, 0.5);
    float _2496 = exp2(_2472);
    float _2498 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2490);
    float _2500 = _2464 + 1.0;
    float _2502 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2498);
    float _2504 = 1.0 / _2488;
    float _2506 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2482);
    float _2508 = fma(_2494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2510 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2512 = _2480 * 0.693147182464599609375;
    float _2514 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2506);
    float _2516 = fma(_2494, _2508, -0.212114393711090087890625);
    float _2518 = sqrt(_2492);
    float _2520 = -_2464;
    float _2522 = fma(_2496, _2500, _2520);
    float _2524 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2514);
    float _2526 = fma(_2494, _2516, 1.570728778839111328125);
    float _2528 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2530 = fma(_2522, 0.5, 0.5);
    float _2532 = _2510 * _2504;
    float _2534 = _2524 * _2504;
    float _2536 = fma(_2532, 0.5, 0.5);
    float _2538 = fma(_2534, -0.5, 0.5);
    float _2540 = _2518 * 0.636619746685028076171875;
    float3 _7030 = float3(_2536, _2538, _2528);
    float _2542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7030, float3(0.0), isnan(_7030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7030, float3(0.0), isnan(_7030)), level(0.0)).x;
    float _2544 = -_2526;
    float _2546 = fma(_2540, _2544, 1.0);
    float3 _7046 = float3(_2536, _2538, _2528);
    float4 _2549 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7046, float3(0.0), isnan(_7046)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7046, float3(0.0), isnan(_7046)), level(0.0)).xyzw;
    float _2551 = _2549.x;
    float _2553 = _2549.y;
    float _2555 = _2549.z;
    float _2557 = _2549.w;
    float2 _7063 = float2(_2546, _2530);
    float3 _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7063, float2(0.0), isnan(_7063)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7063, float2(0.0), isnan(_7063)), level(0.0)).xyz;
    float _2563 = _2561.x;
    float _2565 = _2561.y;
    float _2567 = _2561.z;
    float _2569 = in.m_61.y;
    float _2571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2573 = _144 > 0.5;
    out.m_63.x = _1010;
    out.m_63.y = _1016;
    out.m_63.z = _1018;
    out.m_63.w = _1020;
    float _2575 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _730;
    out.m_65.y = _732;
    out.m_65.z = _734;
    out.m_65.w = _728;
    int _2577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2579 = _2577 != 0;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2587 = _2585 != 0;
    float _2589 = exp2(_2575);
    bool _2591 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.5);
    bool _2599 = _2595 || _2597;
    out.m_67.x = _1932;
    out.m_67.y = _1964;
    out.m_67.z = _1968;
    float _2601 = _2571 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2603 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2607 = 1.0 / _2583;
    float _2609 = -_2569;
    float _2611 = _2609 + 1.0;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2615 = -_2605;
    float _2617 = fma(_2603, 2.0, _2615);
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _2619 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2627 = _2625 != 0;
    float _2629 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2631 = _2629 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2633 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2635 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2623);
    bool _2637 = _2573;
    float _2639 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _2641 = _2569;
    if (!_2579)
    {
        _2116 = _1052;
    }
    float _2643 = _2116;
    float _2645 = fma(_2633, -2.0, _2613);
    int _2647 = _2573 ? as_type<int>(_2611) : as_type<int>(_2569);
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2651 = _2649 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2653 = 1.0 / _2631;
    float _2655 = _2643;
    if (_2587)
    {
        bool _2657 = _132 > 0.5;
        _2637 = _2657;
    }
    bool _2659 = _2637;
    float _2661 = -_102;
    float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2617);
    if (_2579)
    {
        _2655 = _132;
    }
    float _2665 = _2655;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2669 = _2667 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2677 = _2675 != 0;
    float _2679 = -_2589;
    float _2681 = _2679 + 1.0;
    float _2683 = 1.0 / _2673;
    float _2685 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2689 = _2687 != 0;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2693 = _2677 ? as_type<float>(_2647) : _2569;
    bool _2695 = _2677;
    if (_2627)
    {
        bool _2697 = _136 > 0.5;
        _2695 = _2697;
    }
    bool _2699 = _2695;
    float _2701 = 1.0 / _2669;
    if (!_2579)
    {
        _2639 = _136;
    }
    float _2703 = _2639;
    float _2705 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2691);
    float _2707 = _2703;
    if (!_2579)
    {
        _2118 = _136;
    }
    float _2709 = _2118;
    float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2711;
    float _2715 = _2709;
    if (_2579)
    {
        _2707 = _1052;
    }
    float _2717 = _2707;
    float _2719 = fma(_2693, _2601, -0.5);
    if (_2579)
    {
        _2715 = _1052;
    }
    float _2721 = _2715;
    float _2723 = 1.0 / _2651;
    float _2725 = _2713 * _2607;
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2729 = _2727 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2731 = _1052 > 0.5;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2733;
    float _2737 = 1.0 / _2621;
    float _2739 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2743 = _2729 * _2653;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2749;
    float _2753 = _2735 * _2701;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2757 = _2755 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2759 = _2747 * _2683;
    float _2761 = 1.0 / _2741;
    float _2763 = _2751 * _2723;
    float _2765 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2767 = _1038 + _2765;
    float _2769 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2771 = _1038 + _2769;
    float _2773 = fma(_2763, _2767, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2775 = fma(_2725, _2771, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2779 = _1038 + _2777;
    float _2781 = _2757 * _2737;
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2785 = _1038 + _2783;
    bool _2787 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2789 = isnan(_1038);
    bool _2791 = _2787 || _2789;
    bool _2793 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2795 = _2791 || _2793;
    float _2797 = float(_2795);
    float _2799 = fma(_2753, _2779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2801 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2803 = isnan(_1038);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2809 = _2805 || _2807;
    float _2811 = float(_2809);
    float _2813 = fma(_2781, _2785, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2815 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2817 = isnan(_1038);
    bool _2819 = _2815 || _2817;
    bool _2821 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2823 = _2819 || _2821;
    float _2825 = float(_2823);
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2827;
    float _2831 = -_2797;
    float _2833 = _2831 + 1.0;
    bool _2835 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2837 = isnan(_1038);
    bool _2839 = _2835 || _2837;
    bool _2841 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2843 = _2839 || _2841;
    float _2845 = float(_2843);
    float _2847 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2849 = _1038 + _2847;
    float _2851 = _2829 * _2761;
    float _2853 = -_2811;
    float _2855 = _2853 + 1.0;
    float _2857 = _2825 * _2833;
    float _2859 = -_2825;
    float _2861 = _2859 + 1.0;
    bool _2863 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2865 = isnan(_1038);
    bool _2867 = _2863 || _2865;
    bool _2869 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2871 = _2867 || _2869;
    float _2873 = float(_2871);
    float _2875 = -_2845;
    float _2877 = _2875 + 1.0;
    float _2879 = fma(_2743, _2849, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2881 = _2797 * _2855;
    float _2883 = _2845 * _2861;
    bool _2885 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2887 = isnan(_1038);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2893 = _2889 || _2891;
    float _2895 = float(_2893);
    float _2897 = _2873 * _2877;
    float _2899 = -_2873;
    float _2901 = _2899 + 1.0;
    float _2903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2905 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2907 = isnan(_1038);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2913 = _2909 || _2911;
    float _2915 = float(_2913);
    float _2917 = -_2895;
    float _2919 = _2917 + 1.0;
    float _2921 = _2881;
    if (_2689)
    {
        float _2923 = _2731 ? _2611 : _2569;
        _2641 = _2923;
    }
    float _2925 = _2641;
    float _2927 = _2895 * _2901;
    float _2929 = _2915 * _2919;
    bool _2931 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2933 = isnan(_1038);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2939 = _2935 || _2937;
    float _2941 = float(_2939);
    float _2943 = -_2915;
    float _2945 = _2943 + 1.0;
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2949 = _1038 + _2947;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2953 = _2941 * _2945;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2957 = _1038 + _2955;
    float _2959 = fma(_2851, _2949, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2961 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2951);
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2965 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2967 = _2775 * _2953;
    float _2969 = _2903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2971 = fma(_2665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2963);
    float _2973 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2965);
    float _2975 = _2717 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2977 = fma(_2969, _2925, -0.5);
    float _2979 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2981 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2973);
    float _2983 = in.m_61.x;
    float _2985 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2979);
    float _2987 = _2981 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2989 = -_2941;
    float _2991 = _2989 + 1.0;
    float _2993 = _2665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2995 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2985);
    float _2997 = 1.0 / _2987;
    float _2999 = fma(_2991, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2967);
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3003 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3005 = _2995;
    int _3007 = as_type<int>(_2975);
    float _3009 = _2957;
    if (!_2599)
    {
        _3005 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3011 = _3005;
    float _3013 = fma(_2879, _2929, _2999);
    float _3015 = _3003 + _2987;
    float _3017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3019 = fma(_2773, _2927, _3013);
    float _3021 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2705);
    float _3023 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2645);
    float _3025 = _3013;
    float _3027 = _3023;
    if (!_2599)
    {
        _3025 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3029 = _3025;
    float _3031 = fma(_2813, _2897, _3019);
    float _3033 = -_3001;
    float _3035 = fma(_2993, 2.0, _3033);
    float _3037 = -_3023;
    float _3039 = fma(_3021, _2977, _3037);
    float _3041 = _3015 * _2997;
    float _3043 = _3041 * 0.5;
    float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3049 = fma(_2799, _2883, _3031);
    float _3051 = _3031;
    if (!_2599)
    {
        float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3055 = fma(_3043, _3011, _3053);
        _3027 = _3055;
    }
    float _3057 = _3027;
    if (!_2599)
    {
        float _3059 = -_3029;
        float _3061 = _3059 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3051 = _3061;
    }
    float _3063 = _3051;
    float _3065 = fma(_2975, -2.0, _3047);
    float _3067 = _2983;
    if (_2587)
    {
        float _3069 = -_2983;
        float _3071 = _3069 + 1.0;
        _3007 = as_type<int>(_3071);
    }
    int _3073 = _3007;
    int _3075 = 0;
    if (_2627)
    {
        float _3077 = -_2983;
        float _3079 = _3077 + 1.0;
        _3075 = as_type<int>(_3079);
    }
    int _3081 = _3075;
    float _3083 = _3019;
    if (!_2599)
    {
        float _3085 = 1.0 / _3057;
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2635);
    float _3091 = fma(_2759, _2957, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3093 = in.m_57.w;
    if (!_2587)
    {
        _3009 = _2983;
    }
    float _3095 = _3009;
    float _3097 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3099 = _3095;
    if (_2587)
    {
        float _3101 = _2659 ? as_type<float>(_3073) : _2983;
        _3099 = _3101;
    }
    float _3103 = _3099;
    float _3105 = fma(_3091, _2857, _3049);
    float _3107 = _3063;
    if (!_2599)
    {
        float _3109 = 1.0 / _3063;
        _3107 = _3109;
    }
    float _3111 = _3107;
    if (_2627)
    {
        float _3113 = _2699 ? as_type<float>(_3081) : _2983;
        _3067 = _3113;
    }
    float _3115 = _3067;
    float _3117 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3119 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2971);
    float _3121 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2961);
    float _3123 = -_102;
    float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3035);
    float _3127 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3129 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3065);
    float _3131 = fma(_3097, _3103, -0.5);
    float _3133 = fma(_3117, _3115, -0.5);
    float _3135 = fma(_2959, _2881, _3105);
    float _3137 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3127);
    float _3139 = _3129;
    if (!_2599)
    {
        float _3141 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3143 = -_3029;
        float _3145 = fma(_3087, _3141, _3143);
        _2921 = _3145;
    }
    float _3147 = _2921;
    float _3149 = -_3129;
    float _3151 = fma(_3121, _2719, _3149);
    float _3153 = fma(_3089, _3131, _2663);
    float _3155 = fma(_3119, _3133, _3125);
    if (_2599)
    {
        _3139 = 1.0;
    }
    float _3157 = _3139;
    float _3159 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3137);
    float _3161 = _3157;
    if (!_2599)
    {
        float _3163 = _3147 * _3111;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        _3161 = _3165;
    }
    float _3167 = _3161;
    float _3169 = _3039 + 0.5;
    float _3171 = _3151 + 0.5;
    float _3173 = _3153 + 0.5;
    float _3175 = _3155 + 0.5;
    float _3177 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3159);
    float _3179 = fma(_2811, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3135);
    bool _3181 = _3167 > 0.0;
    bool _3183 = isnan(_3167);
    bool _3185 = _3181 || _3183;
    bool _3187 = isnan(0.0);
    bool _3189 = _3185 || _3187;
    float _3191 = _2510 + _2488;
    out.m_69.x = _3173;
    out.m_69.y = _3169;
    out.m_69.z = _3175;
    out.m_69.w = _3171;
    float _3193 = _3167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3195 = _2488 * 0.5;
    float _3197 = _3177 + _2488;
    out.m_71.w = _3093;
    float _3199 = _3197 * 0.5;
    out.m_73.x = _3179;
    float _3201 = _3191 * 0.5;
    float _3203 = fma(_2524, -0.5, _3195);
    float _3205 = _3193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2524;
    out.gl_Position.z = _3177;
    out.gl_Position.w = _2488;
    out.m_75.x = _3201;
    out.m_75.y = _3203;
    out.m_75.z = _3199;
    out.m_75.w = _2488;
    out.m_49.x = _3205;
    float _3207 = _2685 * _2542;
    float _3209 = -_2685;
    float _3211 = _3209 + 1.0;
    float _3213 = _2557 * _3207;
    float _3215 = _2557 * _3211;
    float _3217 = _2567 * _3207;
    float _3219 = fma(_2563, _3213, _2551);
    float _3221 = fma(_2565, _3213, _2553);
    float _3223 = fma(_2557, _3217, _2555);
    out.m_77.x = _3219;
    out.m_77.y = _3221;
    out.m_77.z = _3223;
    out.m_77.w = _3215;
    if (_3189)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3225 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3225;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _3292 = as_type<float>(_120);
        out.gl_Position.z = _3292;
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
        float _3355 = as_type<float>(_152);
        out.gl_Position.z = _3355;
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
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _156;
    float _266 = fma(_254, _170, _258);
    float _268 = fma(_254, _172, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
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
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _354 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _356 = isnan(_300);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = 1.0 / _324;
    float _368 = _344 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _372 = _300 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = _300 + _374;
    bool _378 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _380 = isnan(_300);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_348, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = 1.0 / _320;
    float _398 = _372 * _336;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _402 = _300 + _400;
    float _404 = -_364;
    float _406 = _404 + 1.0;
    float _408 = fma(_352, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _410;
    float _414 = 1.0 / _330;
    float _416 = _304 * _366;
    bool _418 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _420 = isnan(_300);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = fma(_432, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = 1.0 / _334;
    float _450 = _308 * _396;
    bool _452 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _454 = isnan(_300);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = fma(_436, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _466 = fma(_444, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = 1.0 / _340;
    float _472 = _376 * _414;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _476 = _300 + _474;
    float _478 = _402 * _448;
    float _480 = -_428;
    float _482 = _480 + 1.0;
    float _484 = -_462;
    float _486 = _484 + 1.0;
    float _488 = _462 * _482;
    bool _490 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _492 = isnan(_300);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _388 * _486;
    float _504 = _476 * _470;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _514 = -_388;
    float _516 = _514 + 1.0;
    float _518 = -_500;
    float _520 = _518 + 1.0;
    float _522 = fma(_508, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = fma(_512, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _526 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _528 = isnan(_300);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = _500 * _516;
    bool _540 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _542 = isnan(_300);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    bool _552 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_300);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _536 * _520;
    float _566 = fma(_394, _450, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _568 = -_536;
    float _570 = _568 + 1.0;
    float _572 = -_550;
    float _574 = _572 + 1.0;
    float _576 = _562 * _406;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    float _582 = _550 * _570;
    float _584 = _364 * _574;
    float _586 = _522 * _576;
    float _588 = _446 * _576;
    float _590 = fma(_412, _450, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _596 = _390 * _576;
    float _598 = fma(_440, _450, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _588);
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _610 = fma(_594, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _612 = fma(_602, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _614 = fma(_524, _584, _604);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_464, _584, _606);
    float _630 = fma(_408, _584, _608);
    float _632 = fma(_618, _472, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _472, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _472, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = fma(_566, _582, _614);
    float _640 = fma(_590, _582, _628);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = fma(_598, _582, _630);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_466, _564, _638);
    float _658 = fma(_610, _564, _640);
    float _660 = fma(_612, _564, _646);
    float _662 = fma(_644, _478, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _664 = fma(_650, _478, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _666 = fma(_654, _478, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _668 = fma(_632, _538, _656);
    float _670 = in.m_55.x;
    float _672 = in.m_55.y;
    float _674 = in.m_55.z;
    float _676 = fma(_634, _538, _658);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _686;
    float _690 = fma(_636, _538, _660);
    float _692 = fma(_680, _504, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _504, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_662, _502, _668);
    float _698 = fma(_664, _502, _676);
    float _700 = fma(_688, _504, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _702 = fma(_666, _502, _690);
    float _704 = fma(_692, _488, _696);
    float _706 = fma(_694, _488, _698);
    float _708 = fma(_700, _488, _702);
    float _710 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _720 = _710 * _670;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _724 = _712 * _672;
    float _726 = _714 * _674;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _736 = !_468;
    float _752;
    if (!_736)
    {
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _740 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
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
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _770 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _772 = isnan(_756);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = 1.0 / _760;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _792 = -_780;
    float _794 = _792 + 1.0;
    bool _796 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _798 = isnan(_756);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    bool _808 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _810 = isnan(_756);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _764;
    bool _822 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _824 = 1.0 / _768;
    float _826 = _786 * _782;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _828;
    bool _832 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _834 = isnan(_756);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _790 * _820;
    bool _846 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _848 = isnan(_756);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_856;
    float _860 = _858 + 1.0;
    float _862 = _830 * _824;
    float _864 = _842 * _794;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    float _870 = _806 * _860;
    float _872 = -_806;
    float _874 = _872 + 1.0;
    float _876 = _856 * _868;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _886 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _888 = isnan(_756);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _818 * _874;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _756 + _900;
    float _904 = 1.0 / _884;
    float _906 = -_818;
    float _908 = _906 + 1.0;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _914 = fma(_826, _902, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _756 + _916;
    float _920 = 1.0 / _880;
    float _922 = _896 * _908;
    float _924 = -_896;
    float _926 = _924 + 1.0;
    float _928 = fma(_844, _918, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _756 + _930;
    float _934 = _914 * _922;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _944 = 1.0 / _912;
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[131].x, _934);
    float _948 = fma(_862, _932, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _950 = _942 * _904;
    bool _952 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _954 = isnan(_756);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = fma(_928, _898, _946);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _970 = _938 * _920;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _974 = _756 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _978 = _756 + _976;
    float _980 = fma(_950, _974, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _982 = fma(_948, _870, _964);
    float _984 = fma(_970, _978, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _986 = _968 * _944;
    float _988 = -_962;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _994 = _756 + _992;
    float _996 = fma(_980, _876, _982);
    float _998 = _780 * _990;
    float _1000 = fma(_986, _994, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1002 = fma(_984, _864, _996);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1006 = fma(_1000, _998, _1002);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1014 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[137].x, _1006);
    float _1016 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1022 = !_822;
    if (!_1022)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1026 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _280 = _1036;
    }
    float _1038 = _280;
    float _1040 = in.m_57.x;
    float _1042 = in.m_57.y;
    float _1044 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1046 = log2(_1044);
    float _1048 = _102 * 0.039999999105930328369140625;
    float _1050 = _136 * 2.0;
    float _1052 = in.m_51.y;
    float _1054 = _144 * 6.283185482025146484375;
    float _1056 = _1048 * 0.15915493667125701904296875;
    float _1058 = _132 * 2.0;
    float _1060 = floor(_1050);
    float _1062 = floor(_1058);
    float _1064 = _102 * _1046;
    float _1066 = fma(_102, 0.010999999940395355224609375, _1054);
    float _1068 = _1066 * 0.15915493667125701904296875;
    float _1070 = abs(_1040);
    float _1072 = abs(_1042);
    float _1074 = precise::max(_1070, _1072);
    float _1076 = _1040 * 0.0625;
    float _1078 = _1056 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    bool _1082 = _1060 >= 0.0;
    bool _1084 = isnan(_1060);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = _1052 * 6.283185482025146484375;
    bool _1094 = _1074 >= 16.0;
    float _1096 = _1042 * 0.0625;
    float _1098 = _1052 * 2.0;
    float _1100 = fma(_102, 0.007000000216066837310791015625, _1092);
    float _1102 = _1094 ? _1076 : _1040;
    float _1104 = _1068 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    float _1108 = _1094 ? _1096 : _1042;
    float _1110 = _1100 * 0.15915493667125701904296875;
    float _1112 = abs(_1102);
    bool _1114 = _1112 == 0.0;
    float _1116 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1118 = abs(_1108);
    bool _1120 = _1118 != 0.0;
    bool _1122 = isnan(_1118);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = _1060 > 0.0;
    float _1132 = floor(_1098);
    float _1134 = abs(_1102);
    bool _1136 = _1134 == 0.0;
    bool _1138 = !_1128;
    bool _1140 = _1136 && _1138;
    float _1142 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1144 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1116);
    float _1146 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1148 = _1110 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    bool _1152 = false;
    if (_1140)
    {
        bool _1154 = as_type<int>(_1102) >= 0;
        _1152 = _1154;
    }
    bool _1156 = _1152;
    float _1158 = exp2(_1064);
    int _1160 = 0;
    int _1162 = _1156 ? (-1) : 0;
    if (_1140)
    {
        int _1164 = _1156 ? 0 : 1078530011;
        _1160 = _1164;
    }
    int _1166 = _1160;
    float _1168 = _132 + _136;
    float _1170 = _1168 + (-1.0);
    float _1172 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1142);
    float _1174 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1146);
    float _1176 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1178 = _1170;
    int _1180 = _1166;
    if (_1140)
    {
        int _1182 = int(0x80000000) & as_type<int>(_1108);
        int _1184 = _1166 | _1182;
        _1178 = as_type<float>(_1184);
    }
    float _1186 = _1178;
    bool _1188 = !_1128;
    bool _1190 = _1188 && _1114;
    float _1192 = _1186;
    float _1194 = _1186;
    if (!_1190)
    {
        float _1196 = abs(_1108);
        bool _1198 = _1196 != as_type<float>(0x7f800000u /* inf */);
        bool _1200 = isnan(_1196);
        bool _1202 = _1198 || _1200;
        bool _1204 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1206 = _1202 || _1204;
        float _1208 = abs(_1102);
        bool _1210 = _1208 == as_type<float>(0x7f800000u /* inf */);
        float _1212 = abs(_1102);
        bool _1214 = _1212 == as_type<float>(0x7f800000u /* inf */);
        bool _1216 = !_1206;
        bool _1218 = _1214 && _1216;
        if (_1218)
        {
            bool _1220 = as_type<int>(_1102) >= 0;
            _1162 = _1220 ? (-1) : 0;
        }
        int _1222 = _1162;
        if (_1218)
        {
            _1180 = 1075235812;
        }
        int _1224 = _1180;
        int _1226 = _1224;
        if (_1218)
        {
            int _1228 = ~_1222;
            int _1230 = (_1228 != 0) ? _1224 : 1061752795;
            _1226 = _1230;
        }
        int _1232 = _1226;
        if (_1218)
        {
            int _1234 = int(0x80000000) & as_type<int>(_1108);
            int _1236 = _1232 | _1234;
            _1192 = as_type<float>(_1236);
        }
        float _1238 = _1192;
        bool _1240 = !_1206;
        bool _1242 = _1240 && _1210;
        _1194 = _1238;
        if (!_1242)
        {
            float _1244 = abs(_1108);
            float _1246 = abs(_1102);
            float _1248 = precise::max(_1244, _1246);
            float _1250 = abs(_1108);
            float _1252 = abs(_1102);
            float _1254 = precise::min(_1250, _1252);
            float _1256 = 1.0 / _1248;
            float _1258 = abs(_1108);
            float _1260 = abs(_1102);
            bool _1262 = _1258 > _1260;
            bool _1264 = as_type<int>(_1102) >= 0;
            float _1266 = _1254 * _1256;
            float _1268 = _1266 * _1266;
            float _1270 = _1268 + 11.33538818359375;
            float _1272 = fma(_1268, _1270, 28.84246826171875);
            float _1274 = fma(_1268, _1272, 19.6966705322265625);
            float _1276 = fma(_1268, -0.82336294651031494140625, -5.674867153167724609375);
            float _1278 = fma(_1268, _1276, -6.565555095672607421875);
            float _1280 = 1.0 / _1274;
            float _1282 = _1268 * _1278;
            float _1284 = abs(_1108);
            float _1286 = abs(_1102);
            float _1288 = _1284 + _1286;
            int _1290 = as_type<int>(_1108) & int(0x80000000);
            float _1292 = _1266 * _1282;
            bool _1294 = _1288 > as_type<float>(0x7f800000u /* inf */);
            bool _1296 = isnan(_1288);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1302 = _1298 || _1300;
            float _1304 = fma(_1292, _1280, _1266);
            float _1306 = _1304;
            _1194 = _1288;
            if (_1262)
            {
                float _1308 = -_1304;
                float _1310 = _1308 + 1.57079637050628662109375;
                _1306 = _1310;
            }
            float _1312 = _1306;
            int _1314 = as_type<int>(_1312);
            if (!_1264)
            {
                float _1316 = -_1312;
                float _1318 = _1316 + 3.1415927410125732421875;
                _1314 = as_type<int>(_1318);
            }
            int _1320 = _1314;
            if (!_1302)
            {
                int _1322 = _1290 | _1320;
                _1194 = as_type<float>(_1322);
            }
        }
    }
    float _1324 = _1194;
    float _1326 = _132 + _1052;
    float _1328 = abs(_1150);
    float _1330 = log2(_1328);
    float _1332 = _136 + _1052;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1336 = _1326 + (-1.0);
    float _1338 = _1332 + (-1.0);
    float _1340 = abs(_1106);
    float _1342 = log2(_1340);
    float _1344 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1334);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1350 = _1090 ? 0 : 1;
    float _1352 = fma(_1080, 9.0, _102);
    float _1354 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1144);
    bool _1356 = _1062 > 0.0;
    float _1358 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1174);
    int _1360 = ~_1350;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1344);
    bool _1368 = _1062 >= 0.0;
    bool _1370 = isnan(_1062);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = -_1158;
    float _1380 = _1378 + 1.0;
    int _1382 = _1364;
    if (!_1130)
    {
        int _1384 = ~_1350;
        int _1386 = _1384 + 1;
        _1382 = _1386;
    }
    int _1388 = _1382;
    float _1390 = _1330 * 120.0;
    float _1392 = _1352 * 0.20999999344348907470703125;
    bool _1394 = _1132 > 0.0;
    float _1396 = _1352 * (-0.1599999964237213134765625);
    bool _1398 = _1132 >= 0.0;
    bool _1400 = isnan(_1132);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1410 = 1.0 + _1408;
    float _1412 = _1342 * 80.0;
    int _1414 = _1376 ? 0 : 1;
    float _1416 = fma(_1324, 5.00000095367431640625, _1392);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1428 = _1426 != 0;
    float _1430 = fma(_1324, 4.000000476837158203125, _1396);
    int _1432 = ~_1414;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _1416 * 0.15915493667125701904296875;
    int _1440 = _1436;
    bool _1442 = _1406;
    if (!_1356)
    {
        int _1444 = ~_1414;
        int _1446 = _1444 + 1;
        _1440 = _1446;
    }
    int _1448 = _1440;
    float _1450 = _1430 * 0.15915493667125701904296875;
    bool _1452 = !_1420;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = 1.0 / _1410;
    float _1458 = _1354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1460 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1462 = abs(_1454);
    float _1464 = float(_1388);
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    bool _1470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1478 = _1474 || _1476;
    float _1480 = exp2(_1412);
    float _1482 = float(_1462);
    float _1484 = _1478 ? _1380 : 0.0;
    int _1486 = _1406 ? 0 : 1;
    float _1488 = _1482 * _1464;
    float _1490 = exp2(_1390);
    int _1492 = ~_1486;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    float _1498 = _1488 * (-2.0);
    int _1500 = _1496;
    if (!_1394)
    {
        int _1502 = ~_1486;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    float _1508 = fma(_1346, _1498, _1346);
    bool _1510 = !_1428;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = _1438 * 6.283185482025146484375;
    float _1516 = sin(_1514);
    bool _1518 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1520 = isnan(1.0);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1526 = _1522 || _1524;
    int _1528 = abs(_1512);
    float _1530 = _1450 * 6.283185482025146484375;
    float _1532 = sin(_1530);
    float _1534 = -_1460;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = abs(_1468);
    float _1540 = abs(_1536);
    float _1542 = precise::max(_1538, _1540);
    float _1544 = rsqrt(_1366);
    float _1546 = _1484 * _1456;
    float _1548 = _1480 + _1490;
    float _1550 = _132 + (-0.5);
    bool _1552 = _1542 >= 16.0;
    float _1554 = float(_1506);
    float _1556 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1558 = _1516 + _1532;
    bool _1560 = !_1424;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = in.m_59.x;
    float _1566 = in.m_59.y;
    float _1568 = in.m_59.z;
    float _1570 = float(_1528);
    float _1572 = precise::max(_1558, -2.0);
    int _1574 = abs(_1562);
    float _1576 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1578 = precise::min(_1572, 2.0);
    float _1580 = _1570 * _1554;
    float _1582 = float(_1574);
    float _1584 = _1576 * (-0.15915493667125701904296875);
    float _1586 = float(_1448);
    float _1588 = fma(_1578, 0.25, 0.5);
    float _1590 = _1580 * (-2.0);
    bool _1592 = !_1526;
    float _1594 = _1592 ? _102 : _1546;
    float _1596 = _1584 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = _1582 * _1586;
    float _1602 = _1588 * 0.07999999821186065673828125;
    float _1604 = _136 + (-0.5);
    float _1606 = fma(_1176, _1590, _1176);
    float _1608 = _1600 * (-2.0);
    float _1610 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1612 = _1604 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1614 = fma(_1594, _1508, _1556);
    float _1616 = fma(_1348, _1608, _1348);
    float _1618 = fma(_1042, _1610, _1566);
    float _1620 = _1052 * (-0.87964594364166259765625);
    float _1622 = fma(_1594, _1606, _1612);
    float _1624 = _102 * (-0.17000000178813934326171875);
    float _1626 = _132 * 6.283185482025146484375;
    float _1628 = fma(_1618, 9.0, _1620);
    float _1630 = _1622 * 0.15915493667125701904296875;
    float _1632 = fma(_1618, 16.0, _1624);
    float _1634 = _1584 * 6.283185482025146484375;
    float _1636 = cos(_1634);
    float _1638 = _1614 * 0.15915493667125701904296875;
    float _1640 = _1052 + (-0.5);
    float _1642 = _1632 + _1626;
    float _1644 = _1092 + _1628;
    float _1646 = _1536;
    if (_1552)
    {
        float _1648 = _1536 * 0.0625;
        _1646 = _1648;
    }
    float _1650 = _1646;
    float _1652 = fma(_1040, _1610, _1564);
    float _1654 = _1642 * 0.15915493667125701904296875;
    float _1656 = _1638 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = _1468 * 0.0625;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1664 = _1644 * 0.15915493667125701904296875;
    float _1666 = abs(_1650);
    bool _1668 = _1666 == 0.0;
    float _1670 = _1552 ? _1660 : _1468;
    float _1672 = fma(_1594, _1616, _1662);
    float _1674 = _1638 * 6.283185482025146484375;
    float _1676 = cos(_1674);
    float _1678 = abs(_1670);
    bool _1680 = _1678 != 0.0;
    bool _1682 = isnan(_1678);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = fma(_1618, 0.5, 0.5);
    float _1692 = precise::clamp(_1690, 0.0, 1.0);
    float _1694 = abs(_1650);
    bool _1696 = _1694 == 0.0;
    bool _1698 = !_1688;
    bool _1700 = _1696 && _1698;
    float _1702 = _1654 * 6.283185482025146484375;
    float _1704 = sin(_1702);
    float _1706 = _102 * (-0.37000000476837158203125);
    float _1708 = fma(_1692, -2.0, 3.0);
    float _1710 = fma(_1618, 0.58823525905609130859375, 0.411764681339263916015625);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = fma(_1618, 5.0, _1706);
    float _1716 = fma(_1712, -2.0, 3.0);
    float _1718 = _1630 * 6.283185482025146484375;
    float _1720 = sin(_1718);
    float _1722 = _1714 + _1054;
    int _1724 = as_type<int>(_1708);
    float _1726 = 0.58823525905609130859375;
    if (_1700)
    {
        bool _1728 = as_type<int>(_1650) >= 0;
        _1442 = _1728;
    }
    bool _1730 = _1442;
    float _1732 = _1722 * 0.15915493667125701904296875;
    float _1734 = _1692 * _1692;
    float _1736 = _1664 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = _1704 * 0.064000003039836883544921875;
    float _1742 = _1708 * _1734;
    int _1744 = _1730 ? (-1) : 0;
    if (_1700)
    {
        int _1746 = _1730 ? 0 : 1078530011;
        _1724 = _1746;
    }
    int _1748 = _1724;
    float _1750 = _1712 * _1712;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _1754 = _1748;
    if (_1700)
    {
        int _1756 = int(0x80000000) & as_type<int>(_1670);
        int _1758 = _1748 | _1756;
        _1726 = as_type<float>(_1758);
    }
    float _1760 = _1726;
    float _1762 = _1732 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    bool _1766 = !_1688;
    bool _1768 = _1766 && _1668;
    float _1770 = _1760;
    float _1772 = _1760;
    if (!_1768)
    {
        float _1774 = abs(_1670);
        bool _1776 = _1774 != as_type<float>(0x7f800000u /* inf */);
        bool _1778 = isnan(_1774);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1784 = _1780 || _1782;
        float _1786 = abs(_1650);
        bool _1788 = _1786 == as_type<float>(0x7f800000u /* inf */);
        float _1790 = abs(_1650);
        bool _1792 = _1790 == as_type<float>(0x7f800000u /* inf */);
        bool _1794 = !_1784;
        bool _1796 = _1792 && _1794;
        if (_1796)
        {
            bool _1798 = as_type<int>(_1650) >= 0;
            _1744 = _1798 ? (-1) : 0;
        }
        int _1800 = _1744;
        if (_1796)
        {
            _1754 = 1075235812;
        }
        int _1802 = _1754;
        int _1804 = _1802;
        if (_1796)
        {
            int _1806 = ~_1800;
            int _1808 = (_1806 != 0) ? _1802 : 1061752795;
            _1804 = _1808;
        }
        int _1810 = _1804;
        if (_1796)
        {
            int _1812 = int(0x80000000) & as_type<int>(_1670);
            int _1814 = _1810 | _1812;
            _1770 = as_type<float>(_1814);
        }
        float _1816 = _1770;
        bool _1818 = !_1784;
        bool _1820 = _1818 && _1788;
        _1772 = _1816;
        if (!_1820)
        {
            float _1822 = abs(_1670);
            float _1824 = abs(_1650);
            float _1826 = precise::max(_1822, _1824);
            float _1828 = abs(_1670);
            float _1830 = abs(_1650);
            float _1832 = precise::min(_1828, _1830);
            float _1834 = 1.0 / _1826;
            float _1836 = abs(_1670);
            float _1838 = abs(_1650);
            bool _1840 = _1836 > _1838;
            bool _1842 = as_type<int>(_1650) >= 0;
            float _1844 = _1832 * _1834;
            float _1846 = _1844 * _1844;
            float _1848 = _1846 + 11.33538818359375;
            float _1850 = fma(_1846, _1848, 28.84246826171875);
            float _1852 = fma(_1846, _1850, 19.6966705322265625);
            float _1854 = fma(_1846, -0.82336294651031494140625, -5.674867153167724609375);
            float _1856 = fma(_1846, _1854, -6.565555095672607421875);
            float _1858 = 1.0 / _1852;
            float _1860 = _1846 * _1856;
            float _1862 = abs(_1670);
            float _1864 = abs(_1650);
            float _1866 = _1862 + _1864;
            int _1868 = as_type<int>(_1670) & int(0x80000000);
            float _1870 = _1844 * _1860;
            bool _1872 = _1866 > as_type<float>(0x7f800000u /* inf */);
            bool _1874 = isnan(_1866);
            bool _1876 = _1872 || _1874;
            bool _1878 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1880 = _1876 || _1878;
            float _1882 = fma(_1870, _1858, _1844);
            float _1884 = _1882;
            _1772 = _1866;
            if (_1840)
            {
                float _1886 = -_1882;
                float _1888 = _1886 + 1.57079637050628662109375;
                _1884 = _1888;
            }
            float _1890 = _1884;
            int _1892 = as_type<int>(_1890);
            if (!_1842)
            {
                float _1894 = -_1890;
                float _1896 = _1894 + 3.1415927410125732421875;
                _1892 = as_type<int>(_1896);
            }
            int _1898 = _1892;
            if (!_1880)
            {
                int _1900 = _1868 | _1898;
                _1772 = as_type<float>(_1900);
            }
        }
    }
    float _1902 = _1772;
    float _1904 = _1764 * _1548;
    float _1906 = fma(_1740, _1752, _1652);
    float _1908 = _1738 * 0.07299999892711639404296875;
    float _1910 = -_1902;
    float _1912 = _1672 + _1910;
    float _1914 = _1716 * _1750;
    float _1916 = _1904 * 0.180000007152557373046875;
    float _1918 = _136 * 6.283185482025146484375;
    float _1920 = fma(_1908, _1752, _1906);
    float _1922 = _1912 * 0.15915493667125701904296875;
    float _1924 = _1916 * _1914;
    float _1926 = fma(_102, 0.310000002384185791015625, _1918);
    float _1928 = _1598 * _1568;
    float _1930 = _1618 + 0.20000000298023223876953125;
    float _1932 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1920);
    float _1934 = _1630 * 6.283185482025146484375;
    float _1936 = cos(_1934);
    float _1938 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1940 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1932);
    float _1944 = fma(_102, 0.10999999940395355224609375, _1626);
    float _1946 = _1636 * _1568;
    float _1948 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1940);
    float _1950 = _1922 * 6.283185482025146484375;
    float _1952 = sin(_1950);
    float _1954 = -_1928;
    float _1956 = fma(_1636, _1930, _1954);
    float _1958 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1960 = _1942 * _1938;
    float _1962 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1964 = _1956 + (-0.20000000298023223876953125);
    float _1966 = _1926 * 0.15915493667125701904296875;
    float _1968 = fma(_1598, _1930, _1946);
    float _1970 = _1922 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1964);
    float _1976 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1172);
    float _1978 = _1958 * _1974;
    float _1980 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1968);
    float _1982 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1948);
    float _1984 = _1966 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    float _1988 = _1944 * 0.15915493667125701904296875;
    float _1990 = _1658 * _1952;
    float _1992 = _1936 * _1978;
    float _1994 = _1676 * _1952;
    float _1996 = _1980 * _1962;
    float _1998 = -_1978;
    float _2000 = _1720 * _1998;
    float _2002 = _1676 * _1992;
    float _2004 = _1676 * _1972;
    float _2006 = _1658 * _1972;
    float _2008 = 1.0 / _1958;
    float _2010 = _1658 * _1992;
    float _2012 = fma(_1720, _2004, _1990);
    float _2014 = -_1994;
    float _2016 = fma(_1720, _2006, _2014);
    float _2018 = fma(_1720, _1990, _2004);
    float _2020 = _1972 * _1936;
    float _2022 = fma(_2012, _1960, _2002);
    float _2024 = -_2006;
    float _2026 = fma(_1720, _1994, _2024);
    float _2028 = sqrt(_1982);
    float _2030 = fma(_1986, 0.12999999523162841796875, 1.0);
    float _2032 = fma(_2016, _1960, _2010);
    float _2034 = fma(_2026, _1996, _2022);
    float _2036 = _1976 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2038 = _1952 * _1936;
    float _2040 = fma(_2020, _1960, _2000);
    float _2042 = fma(_2018, _1996, _2032);
    float _2044 = _1988 * 6.283185482025146484375;
    float _2046 = sin(_2044);
    float _2048 = _2036 + _2034;
    float _2050 = fma(_2038, _1996, _2040);
    float _2052 = _1460 + _2042;
    float _2054 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2056 = _2048 + _2054;
    float _2058 = _1458 + _2050;
    float _2060 = _2028 * 0.64999997615814208984375;
    float _2062 = _2056 * _2008;
    float _2064 = fma(_2062, _2062, _2062);
    float _2066 = fma(_2046, 0.300000011920928955078125, _2030);
    float _2068 = _2064 * _2060;
    float _2070 = _2066 * _2068;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2052);
    float _2074 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2058);
    float _2076 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2048);
    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2080 = _2072 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2084 = _2074 + _2082;
    float _2086 = _2080 * _2080;
    float _2088 = fma(_2084, _2084, _2086);
    float _2090 = sqrt(_2088);
    bool _2092 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan(0.5);
    bool _2100 = _2096 || _2098;
    bool _2102 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2106 = _1996;
    float _2108 = _2074;
    float _2110 = _2080;
    float _2112 = _2088;
    float _2114 = _1994;
    float _2116 = _1992;
    float _2118 = (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_2102)
    {
        _2104 = _2072;
    }
    float _2120 = _2104;
    float _2122 = _2120;
    if (!_2102)
    {
        _2106 = _2076;
    }
    float _2124 = _2106;
    bool _2126 = !_2102;
    float _2128 = _2124;
    if (!_2126)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2134 = _2090 + _2132;
        float _2136 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2138 = _2134 * _2130;
        float _2140 = rsqrt(_2088);
        float _2142 = _2138 * 0.15915493667125701904296875;
        float _2144 = _2142 * 6.283185482025146484375;
        float _2146 = sin(_2144);
        float _2148 = _2142 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = fma(_2146, _2136, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2154 = _2140 * _2152;
        float _2156 = _2150 + (-1.0);
        float _2158 = fma(_2084, _2154, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2160 = fma(_2080, _2154, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2164 = fma(_2076, _2150, _2162);
        _2128 = _2164;
        _2108 = _2158;
        _2122 = _2160;
    }
    float _2166 = _2128;
    float _2168 = _2108;
    float _2170 = _2122;
    float _2172 = _2166;
    float _2174 = _2168;
    float _2176 = _2170;
    if (!_2100)
    {
        float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2180 = _2036 + _2178;
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2184 = -_2036;
        float _2186 = _2184 + _2166;
        float _2188 = _2180 * _2180;
        float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2192 = _1460 + _2190;
        float _2194 = fma(_1468, _1468, _2188);
        float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2198 = fma(_2192, _2192, _2194);
        float _2200 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2202 = sqrt(_2198);
        float _2204 = -_1458;
        float _2206 = _2204 + _2168;
        float _2208 = precise::min(_2202, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2210 = _2208 * _2196;
        float _2212 = _2200 * _2210;
        float _2214 = -_1460;
        float _2216 = _2214 + _2170;
        float _2218 = fma(_2206, _2212, _1458);
        float _2220 = fma(_2186, _2212, _2036);
        float _2222 = fma(_2216, _2212, _1460);
        _2172 = _2220;
        _2174 = _2218;
        _2176 = _2222;
        _2110 = _2212;
    }
    float _2224 = _2172;
    float _2226 = _2174;
    float _2228 = _2176;
    float _2230 = _2110;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = _2224 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = _2226 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2228 + _2240;
    float _2244 = _2234 * _2234;
    float _2246 = fma(_2238, _2238, _2244);
    float _2248 = fma(_2242, _2242, _2246);
    float _2250 = rsqrt(_2248);
    float _2252 = sqrt(_2248);
    float _2254 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2256 = _2238 * _2254;
    float _2258 = _2242 * _2254;
    float _2260 = _2256 * _2256;
    float _2262 = _2258 * _2258;
    float _2264 = _2260 + _2262;
    float _2266 = sqrt(_2264);
    bool _2268 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = _2266 + _2270;
    float _2274 = _2242;
    float _2276 = _2230;
    float _2278 = _2272;
    float _2280 = _2234;
    if (_2268)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2274 = _2282;
    }
    float _2284 = _2274;
    if (_2268)
    {
        float _2286 = rsqrt(_2264);
        _2276 = _2286;
    }
    float _2288 = _2276;
    float _2290 = _2288;
    if (_2268)
    {
        float _2292 = _2272 * _2284;
        _2278 = _2292;
    }
    float _2294 = _2278;
    if (_2268)
    {
        float _2296 = _2294 * 0.15915493667125701904296875;
        _2112 = _2296;
    }
    float _2298 = _2112;
    float _2300 = _2250;
    if (_2268)
    {
        float _2302 = _2298 * 6.283185482025146484375;
        float _2304 = sin(_2302);
        _2300 = _2304;
    }
    float _2306 = _2300;
    float _2308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2310 = precise::max(0.0, _2308);
    float _2312 = _2246;
    float _2314 = _2310;
    float _2316 = _2308;
    if (_2268)
    {
        float _2318 = _2298 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        _2312 = _2320;
    }
    float _2322 = _2312;
    float _2324 = -_2254;
    float _2326 = -_2310;
    float _2328 = fma(_2234, _2324, _2326);
    if (!_2268)
    {
        _2314 = _2256;
    }
    float _2330 = _2314;
    float _2332 = _2330;
    if (_2268)
    {
        float _2334 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2316 = _2334;
    }
    float _2336 = _2316;
    float _2338 = _2306;
    float _2340 = _2336;
    if (_2268)
    {
        float _2342 = fma(_2306, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2280 = _2342;
    }
    float _2344 = _2280;
    float _2346 = _2344;
    if (!_2268)
    {
        _2338 = _2260;
    }
    float _2348 = _2338;
    float _2350 = _2348;
    float _2352 = _2322;
    if (_2268)
    {
        float _2354 = _2322 + (-1.0);
        _2340 = _2354;
    }
    float _2356 = _2340;
    float _2358 = _2356;
    if (_2268)
    {
        float _2360 = _2288 * _2344;
        _2114 = _2360;
    }
    float _2362 = _2114;
    if (!_2268)
    {
        _2346 = _2328;
    }
    float _2364 = _2346;
    float _2366 = _2364;
    if (_2268)
    {
        float _2368 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2290 = _2368;
    }
    float _2370 = _2290;
    if (_2268)
    {
        float _2372 = _2256 * _2362;
        _2332 = _2372;
    }
    float _2374 = _2332;
    if (!_2268)
    {
        _2358 = _2258;
    }
    float _2376 = _2358;
    float _2378 = _2376;
    if (_2268)
    {
        float _2380 = _2258 * _2362;
        _2378 = _2380;
    }
    float _2382 = _2378;
    if (_2268)
    {
        float _2384 = fma(_2328, _2322, _2370);
        _2366 = _2384;
    }
    float _2386 = _2366;
    if (_2268)
    {
        float _2388 = _2374 * _2374;
        _2350 = _2388;
    }
    float _2390 = _2350;
    if (!_2268)
    {
        _2352 = _2262;
    }
    float _2392 = _2352;
    float _2394 = _2392;
    if (_2268)
    {
        float _2396 = _2382 * _2382;
        _2394 = _2396;
    }
    float _2398 = _2394;
    float _2400 = fma(_2386, _2386, _2390);
    float _2402 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2404 = _2400 + _2398;
    float _2406 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2402);
    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2410 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2408);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2416 = rsqrt(_2404);
    float _2418 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2406);
    float _2420 = -_2412;
    float _2422 = _2420 + 1.0;
    float _2424 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2426 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2414);
    float _2428 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2430 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2432 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2424);
    float _2434 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2426);
    float _2436 = abs(_2422);
    float _2438 = log2(_2436);
    float _2440 = _2418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2442 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2432);
    float _2444 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2430);
    float _2448 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2450 = _2442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2452 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2454 = _2416 * _2374;
    float _2456 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2446);
    float _2458 = -_2448;
    float _2460 = fma(_2458, _2428, 1.0);
    float _2462 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2452);
    float _2464 = _2416 * _2386;
    float _2466 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2468 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2470 = _2416 * _2382;
    float _2472 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2474 = -_2466;
    float _2476 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2474);
    float _2478 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2462);
    float _2480 = log2(_2460);
    float _2482 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2484 = -_2470;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2476);
    float _2488 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2478);
    float _2490 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2492 = fma(_2486, -0.5, 0.5);
    float _2494 = fma(_2486, 0.5, 0.5);
    float _2496 = exp2(_2472);
    float _2498 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2490);
    float _2500 = _2464 + 1.0;
    float _2502 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2498);
    float _2504 = 1.0 / _2488;
    float _2506 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2482);
    float _2508 = fma(_2494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2510 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2512 = _2480 * 0.693147182464599609375;
    float _2514 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2506);
    float _2516 = fma(_2494, _2508, -0.212114393711090087890625);
    float _2518 = sqrt(_2492);
    float _2520 = -_2464;
    float _2522 = fma(_2496, _2500, _2520);
    float _2524 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2514);
    float _2526 = fma(_2494, _2516, 1.570728778839111328125);
    float _2528 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2530 = fma(_2522, 0.5, 0.5);
    float _2532 = _2510 * _2504;
    float _2534 = _2524 * _2504;
    float _2536 = fma(_2532, 0.5, 0.5);
    float _2538 = fma(_2534, -0.5, 0.5);
    float _2540 = _2518 * 0.636619746685028076171875;
    float3 _7030 = float3(_2536, _2538, _2528);
    float _2542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7030, float3(0.0), isnan(_7030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7030, float3(0.0), isnan(_7030)), level(0.0)).x;
    float _2544 = -_2526;
    float _2546 = fma(_2540, _2544, 1.0);
    float3 _7046 = float3(_2536, _2538, _2528);
    float4 _2549 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7046, float3(0.0), isnan(_7046)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7046, float3(0.0), isnan(_7046)), level(0.0)).xyzw;
    float _2551 = _2549.x;
    float _2553 = _2549.y;
    float _2555 = _2549.z;
    float _2557 = _2549.w;
    float2 _7063 = float2(_2546, _2530);
    float3 _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7063, float2(0.0), isnan(_7063)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7063, float2(0.0), isnan(_7063)), level(0.0)).xyz;
    float _2563 = _2561.x;
    float _2565 = _2561.y;
    float _2567 = _2561.z;
    float _2569 = in.m_61.y;
    float _2571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2573 = _144 > 0.5;
    out.m_63.x = _1010;
    out.m_63.y = _1016;
    out.m_63.z = _1018;
    out.m_63.w = _1020;
    float _2575 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _730;
    out.m_65.y = _732;
    out.m_65.z = _734;
    out.m_65.w = _728;
    int _2577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2579 = _2577 != 0;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2587 = _2585 != 0;
    float _2589 = exp2(_2575);
    bool _2591 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.5);
    bool _2599 = _2595 || _2597;
    out.m_67.x = _1932;
    out.m_67.y = _1964;
    out.m_67.z = _1968;
    float _2601 = _2571 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2603 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2607 = 1.0 / _2583;
    float _2609 = -_2569;
    float _2611 = _2609 + 1.0;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2615 = -_2605;
    float _2617 = fma(_2603, 2.0, _2615);
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _2619 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2627 = _2625 != 0;
    float _2629 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2631 = _2629 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2633 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2635 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2623);
    bool _2637 = _2573;
    float _2639 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _2641 = _2569;
    if (!_2579)
    {
        _2116 = _1052;
    }
    float _2643 = _2116;
    float _2645 = fma(_2633, -2.0, _2613);
    int _2647 = _2573 ? as_type<int>(_2611) : as_type<int>(_2569);
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2651 = _2649 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2653 = 1.0 / _2631;
    float _2655 = _2643;
    if (_2587)
    {
        bool _2657 = _132 > 0.5;
        _2637 = _2657;
    }
    bool _2659 = _2637;
    float _2661 = -_102;
    float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2617);
    if (_2579)
    {
        _2655 = _132;
    }
    float _2665 = _2655;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2669 = _2667 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2677 = _2675 != 0;
    float _2679 = -_2589;
    float _2681 = _2679 + 1.0;
    float _2683 = 1.0 / _2673;
    float _2685 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2689 = _2687 != 0;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2693 = _2677 ? as_type<float>(_2647) : _2569;
    bool _2695 = _2677;
    if (_2627)
    {
        bool _2697 = _136 > 0.5;
        _2695 = _2697;
    }
    bool _2699 = _2695;
    float _2701 = 1.0 / _2669;
    if (!_2579)
    {
        _2639 = _136;
    }
    float _2703 = _2639;
    float _2705 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2691);
    float _2707 = _2703;
    if (!_2579)
    {
        _2118 = _136;
    }
    float _2709 = _2118;
    float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2711;
    float _2715 = _2709;
    if (_2579)
    {
        _2707 = _1052;
    }
    float _2717 = _2707;
    float _2719 = fma(_2693, _2601, -0.5);
    if (_2579)
    {
        _2715 = _1052;
    }
    float _2721 = _2715;
    float _2723 = 1.0 / _2651;
    float _2725 = _2713 * _2607;
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2729 = _2727 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2731 = _1052 > 0.5;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2733;
    float _2737 = 1.0 / _2621;
    float _2739 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2743 = _2729 * _2653;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2749;
    float _2753 = _2735 * _2701;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2757 = _2755 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2759 = _2747 * _2683;
    float _2761 = 1.0 / _2741;
    float _2763 = _2751 * _2723;
    float _2765 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2767 = _1038 + _2765;
    float _2769 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2771 = _1038 + _2769;
    float _2773 = fma(_2763, _2767, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2775 = fma(_2725, _2771, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2779 = _1038 + _2777;
    float _2781 = _2757 * _2737;
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2785 = _1038 + _2783;
    bool _2787 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2789 = isnan(_1038);
    bool _2791 = _2787 || _2789;
    bool _2793 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2795 = _2791 || _2793;
    float _2797 = float(_2795);
    float _2799 = fma(_2753, _2779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2801 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2803 = isnan(_1038);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2809 = _2805 || _2807;
    float _2811 = float(_2809);
    float _2813 = fma(_2781, _2785, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2815 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2817 = isnan(_1038);
    bool _2819 = _2815 || _2817;
    bool _2821 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2823 = _2819 || _2821;
    float _2825 = float(_2823);
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2827;
    float _2831 = -_2797;
    float _2833 = _2831 + 1.0;
    bool _2835 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2837 = isnan(_1038);
    bool _2839 = _2835 || _2837;
    bool _2841 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2843 = _2839 || _2841;
    float _2845 = float(_2843);
    float _2847 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2849 = _1038 + _2847;
    float _2851 = _2829 * _2761;
    float _2853 = -_2811;
    float _2855 = _2853 + 1.0;
    float _2857 = _2825 * _2833;
    float _2859 = -_2825;
    float _2861 = _2859 + 1.0;
    bool _2863 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2865 = isnan(_1038);
    bool _2867 = _2863 || _2865;
    bool _2869 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2871 = _2867 || _2869;
    float _2873 = float(_2871);
    float _2875 = -_2845;
    float _2877 = _2875 + 1.0;
    float _2879 = fma(_2743, _2849, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2881 = _2797 * _2855;
    float _2883 = _2845 * _2861;
    bool _2885 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2887 = isnan(_1038);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2893 = _2889 || _2891;
    float _2895 = float(_2893);
    float _2897 = _2873 * _2877;
    float _2899 = -_2873;
    float _2901 = _2899 + 1.0;
    float _2903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2905 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2907 = isnan(_1038);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2913 = _2909 || _2911;
    float _2915 = float(_2913);
    float _2917 = -_2895;
    float _2919 = _2917 + 1.0;
    float _2921 = _2881;
    if (_2689)
    {
        float _2923 = _2731 ? _2611 : _2569;
        _2641 = _2923;
    }
    float _2925 = _2641;
    float _2927 = _2895 * _2901;
    float _2929 = _2915 * _2919;
    bool _2931 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2933 = isnan(_1038);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2939 = _2935 || _2937;
    float _2941 = float(_2939);
    float _2943 = -_2915;
    float _2945 = _2943 + 1.0;
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2949 = _1038 + _2947;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2953 = _2941 * _2945;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2957 = _1038 + _2955;
    float _2959 = fma(_2851, _2949, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2961 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2951);
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2965 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2967 = _2775 * _2953;
    float _2969 = _2903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2971 = fma(_2665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2963);
    float _2973 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2965);
    float _2975 = _2717 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2977 = fma(_2969, _2925, -0.5);
    float _2979 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2981 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2973);
    float _2983 = in.m_61.x;
    float _2985 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2979);
    float _2987 = _2981 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2989 = -_2941;
    float _2991 = _2989 + 1.0;
    float _2993 = _2665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2995 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2985);
    float _2997 = 1.0 / _2987;
    float _2999 = fma(_2991, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2967);
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3003 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3005 = _2995;
    int _3007 = as_type<int>(_2975);
    float _3009 = _2957;
    if (!_2599)
    {
        _3005 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3011 = _3005;
    float _3013 = fma(_2879, _2929, _2999);
    float _3015 = _3003 + _2987;
    float _3017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3019 = fma(_2773, _2927, _3013);
    float _3021 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2705);
    float _3023 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2645);
    float _3025 = _3013;
    float _3027 = _3023;
    if (!_2599)
    {
        _3025 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3029 = _3025;
    float _3031 = fma(_2813, _2897, _3019);
    float _3033 = -_3001;
    float _3035 = fma(_2993, 2.0, _3033);
    float _3037 = -_3023;
    float _3039 = fma(_3021, _2977, _3037);
    float _3041 = _3015 * _2997;
    float _3043 = _3041 * 0.5;
    float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3049 = fma(_2799, _2883, _3031);
    float _3051 = _3031;
    if (!_2599)
    {
        float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3055 = fma(_3043, _3011, _3053);
        _3027 = _3055;
    }
    float _3057 = _3027;
    if (!_2599)
    {
        float _3059 = -_3029;
        float _3061 = _3059 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3051 = _3061;
    }
    float _3063 = _3051;
    float _3065 = fma(_2975, -2.0, _3047);
    float _3067 = _2983;
    if (_2587)
    {
        float _3069 = -_2983;
        float _3071 = _3069 + 1.0;
        _3007 = as_type<int>(_3071);
    }
    int _3073 = _3007;
    int _3075 = 0;
    if (_2627)
    {
        float _3077 = -_2983;
        float _3079 = _3077 + 1.0;
        _3075 = as_type<int>(_3079);
    }
    int _3081 = _3075;
    float _3083 = _3019;
    if (!_2599)
    {
        float _3085 = 1.0 / _3057;
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2635);
    float _3091 = fma(_2759, _2957, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3093 = in.m_57.w;
    if (!_2587)
    {
        _3009 = _2983;
    }
    float _3095 = _3009;
    float _3097 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3099 = _3095;
    if (_2587)
    {
        float _3101 = _2659 ? as_type<float>(_3073) : _2983;
        _3099 = _3101;
    }
    float _3103 = _3099;
    float _3105 = fma(_3091, _2857, _3049);
    float _3107 = _3063;
    if (!_2599)
    {
        float _3109 = 1.0 / _3063;
        _3107 = _3109;
    }
    float _3111 = _3107;
    if (_2627)
    {
        float _3113 = _2699 ? as_type<float>(_3081) : _2983;
        _3067 = _3113;
    }
    float _3115 = _3067;
    float _3117 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3119 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2971);
    float _3121 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2961);
    float _3123 = -_102;
    float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3035);
    float _3127 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3129 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3065);
    float _3131 = fma(_3097, _3103, -0.5);
    float _3133 = fma(_3117, _3115, -0.5);
    float _3135 = fma(_2959, _2881, _3105);
    float _3137 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3127);
    float _3139 = _3129;
    if (!_2599)
    {
        float _3141 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3143 = -_3029;
        float _3145 = fma(_3087, _3141, _3143);
        _2921 = _3145;
    }
    float _3147 = _2921;
    float _3149 = -_3129;
    float _3151 = fma(_3121, _2719, _3149);
    float _3153 = fma(_3089, _3131, _2663);
    float _3155 = fma(_3119, _3133, _3125);
    if (_2599)
    {
        _3139 = 1.0;
    }
    float _3157 = _3139;
    float _3159 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3137);
    float _3161 = _3157;
    if (!_2599)
    {
        float _3163 = _3147 * _3111;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        _3161 = _3165;
    }
    float _3167 = _3161;
    float _3169 = _3039 + 0.5;
    float _3171 = _3151 + 0.5;
    float _3173 = _3153 + 0.5;
    float _3175 = _3155 + 0.5;
    float _3177 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3159);
    float _3179 = fma(_2811, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3135);
    bool _3181 = _3167 > 0.0;
    bool _3183 = isnan(_3167);
    bool _3185 = _3181 || _3183;
    bool _3187 = isnan(0.0);
    bool _3189 = _3185 || _3187;
    float _3191 = _2510 + _2488;
    out.m_69.x = _3173;
    out.m_69.y = _3169;
    out.m_69.z = _3175;
    out.m_69.w = _3171;
    float _3193 = _3167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3195 = _2488 * 0.5;
    float _3197 = _3177 + _2488;
    out.m_71.w = _3093;
    float _3199 = _3197 * 0.5;
    out.m_73.x = _3179;
    float _3201 = _3191 * 0.5;
    float _3203 = fma(_2524, -0.5, _3195);
    float _3205 = _3193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2524;
    out.gl_Position.z = _3177;
    out.gl_Position.w = _2488;
    out.m_75.x = _3201;
    out.m_75.y = _3203;
    out.m_75.z = _3199;
    out.m_75.w = _2488;
    out.m_49.x = _3205;
    float _3207 = _2685 * _2542;
    float _3209 = -_2685;
    float _3211 = _3209 + 1.0;
    float _3213 = _2557 * _3207;
    float _3215 = _2557 * _3211;
    float _3217 = _2567 * _3207;
    float _3219 = fma(_2563, _3213, _2551);
    float _3221 = fma(_2565, _3213, _2553);
    float _3223 = fma(_2557, _3217, _2555);
    out.m_77.x = _3219;
    out.m_77.y = _3221;
    out.m_77.z = _3223;
    out.m_77.w = _3215;
    if (_3189)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3225 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3225;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
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
        float _3292 = as_type<float>(_120);
        out.gl_Position.z = _3292;
    }
    if (!_106)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _3355 = as_type<float>(_152);
        out.gl_Position.z = _3355;
    }
    out.m_53.z = _136;
    out.m_53.w = _144;
    if (_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _258 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _260 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _262 = _230 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _264 = _102 * _156;
    float _266 = fma(_254, _170, _258);
    float _268 = fma(_254, _172, _260);
    float _270 = fma(_254, _174, _262);
    float _272 = fma(_266, _154, _176);
    float _274 = fma(_268, _154, _178);
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
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _352 = _350 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _354 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _356 = isnan(_300);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = 1.0 / _324;
    float _368 = _344 * _326;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _372 = _300 + _370;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _376 = _300 + _374;
    bool _378 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _380 = isnan(_300);
    bool _382 = _378 || _380;
    bool _384 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _386 = _382 || _384;
    float _388 = float(_386);
    float _390 = fma(_348, _368, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _394 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _392;
    float _396 = 1.0 / _320;
    float _398 = _372 * _336;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _402 = _300 + _400;
    float _404 = -_364;
    float _406 = _404 + 1.0;
    float _408 = fma(_352, _398, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _410;
    float _414 = 1.0 / _330;
    float _416 = _304 * _366;
    bool _418 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _420 = isnan(_300);
    bool _422 = _418 || _420;
    bool _424 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _426 = _422 || _424;
    float _428 = float(_426);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _438;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _444 = _442 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _446 = fma(_432, _368, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _448 = 1.0 / _334;
    float _450 = _308 * _396;
    bool _452 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _454 = isnan(_300);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = fma(_436, _398, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _466 = fma(_444, _416, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    bool _468 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _470 = 1.0 / _340;
    float _472 = _376 * _414;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _476 = _300 + _474;
    float _478 = _402 * _448;
    float _480 = -_428;
    float _482 = _480 + 1.0;
    float _484 = -_462;
    float _486 = _484 + 1.0;
    float _488 = _462 * _482;
    bool _490 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _492 = isnan(_300);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = _388 * _486;
    float _504 = _476 * _470;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _508 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _514 = -_388;
    float _516 = _514 + 1.0;
    float _518 = -_500;
    float _520 = _518 + 1.0;
    float _522 = fma(_508, _368, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _524 = fma(_512, _398, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _526 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _528 = isnan(_300);
    bool _530 = _526 || _528;
    bool _532 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _534 = _530 || _532;
    float _536 = float(_534);
    float _538 = _500 * _516;
    bool _540 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _542 = isnan(_300);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    bool _552 = _300 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _554 = isnan(_300);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = _536 * _520;
    float _566 = fma(_394, _450, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _568 = -_536;
    float _570 = _568 + 1.0;
    float _572 = -_550;
    float _574 = _572 + 1.0;
    float _576 = _562 * _406;
    float _578 = -_562;
    float _580 = _578 + 1.0;
    float _582 = _550 * _570;
    float _584 = _364 * _574;
    float _586 = _522 * _576;
    float _588 = _446 * _576;
    float _590 = fma(_412, _450, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _592 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _594 = _592 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _596 = _390 * _576;
    float _598 = fma(_440, _450, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _604 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].x, _586);
    float _606 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].y, _588);
    float _608 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[143].z, _596);
    float _610 = fma(_594, _416, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _612 = fma(_602, _416, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _614 = fma(_524, _584, _604);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _618 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _616;
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _620;
    float _624 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _626 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _624;
    float _628 = fma(_464, _584, _606);
    float _630 = fma(_408, _584, _608);
    float _632 = fma(_618, _472, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _634 = fma(_622, _472, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _636 = fma(_626, _472, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _638 = fma(_566, _582, _614);
    float _640 = fma(_590, _582, _628);
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _644 = _642 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _646 = fma(_598, _582, _630);
    float _648 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _650 = _648 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _654 = _652 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _656 = fma(_466, _564, _638);
    float _658 = fma(_610, _564, _640);
    float _660 = fma(_612, _564, _646);
    float _662 = fma(_644, _478, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _664 = fma(_650, _478, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _666 = fma(_654, _478, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _668 = fma(_632, _538, _656);
    float _670 = in.m_55.x;
    float _672 = in.m_55.y;
    float _674 = in.m_55.z;
    float _676 = fma(_634, _538, _658);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _678;
    float _682 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _682;
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _688 = (*spvDescriptorSet0.vp_c9)._m0[150].z + _686;
    float _690 = fma(_636, _538, _660);
    float _692 = fma(_680, _504, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _694 = fma(_684, _504, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _696 = fma(_662, _502, _668);
    float _698 = fma(_664, _502, _676);
    float _700 = fma(_688, _504, (*spvDescriptorSet0.vp_c9)._m0[149].z);
    float _702 = fma(_666, _502, _690);
    float _704 = fma(_692, _488, _696);
    float _706 = fma(_694, _488, _698);
    float _708 = fma(_700, _488, _702);
    float _710 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].x, _704);
    float _712 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].y, _706);
    float _714 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[150].z, _708);
    float _716 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _718 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _720 = _710 * _670;
    float _722 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _724 = _712 * _672;
    float _726 = _714 * _674;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _730 = _722 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _732 = _718 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _734 = _716 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _736 = !_468;
    float _752;
    if (!_736)
    {
        float _738 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _740 = _132 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _742 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[11].w, _102);
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
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _760 = _758 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _766 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _768 = _766 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _770 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[136].w;
    bool _772 = isnan(_756);
    bool _774 = _770 || _772;
    bool _776 = isnan((*spvDescriptorSet0.vp_c9)._m0[136].w);
    bool _778 = _774 || _776;
    float _780 = float(_778);
    float _782 = 1.0 / _760;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _784;
    float _788 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _790 = _788 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _792 = -_780;
    float _794 = _792 + 1.0;
    bool _796 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _798 = isnan(_756);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    bool _808 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _810 = isnan(_756);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _764;
    bool _822 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _824 = 1.0 / _768;
    float _826 = _786 * _782;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _828;
    bool _832 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _834 = isnan(_756);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[135].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = _790 * _820;
    bool _846 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _848 = isnan(_756);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -_856;
    float _860 = _858 + 1.0;
    float _862 = _830 * _824;
    float _864 = _842 * _794;
    float _866 = -_842;
    float _868 = _866 + 1.0;
    float _870 = _806 * _860;
    float _872 = -_806;
    float _874 = _872 + 1.0;
    float _876 = _856 * _868;
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _880 = _878 + (*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _882 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _884 = _882 + (*spvDescriptorSet0.vp_c9)._m0[135].w;
    bool _886 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _888 = isnan(_756);
    bool _890 = _886 || _888;
    bool _892 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _894 = _890 || _892;
    float _896 = float(_894);
    float _898 = _818 * _874;
    float _900 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _902 = _756 + _900;
    float _904 = 1.0 / _884;
    float _906 = -_818;
    float _908 = _906 + 1.0;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _912 = _910 + (*spvDescriptorSet0.vp_c9)._m0[137].w;
    float _914 = fma(_826, _902, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _918 = _756 + _916;
    float _920 = 1.0 / _880;
    float _922 = _896 * _908;
    float _924 = -_896;
    float _926 = _924 + 1.0;
    float _928 = fma(_844, _918, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _932 = _756 + _930;
    float _934 = _914 * _922;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[136].x + _936;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[134].x;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[135].x;
    float _944 = 1.0 / _912;
    float _946 = fma(_926, (*spvDescriptorSet0.vp_c9)._m0[131].x, _934);
    float _948 = fma(_862, _932, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _950 = _942 * _904;
    bool _952 = _756 >= (*spvDescriptorSet0.vp_c9)._m0[137].w;
    bool _954 = isnan(_756);
    bool _956 = _952 || _954;
    bool _958 = isnan((*spvDescriptorSet0.vp_c9)._m0[137].w);
    bool _960 = _956 || _958;
    float _962 = float(_960);
    float _964 = fma(_928, _898, _946);
    float _966 = -(*spvDescriptorSet0.vp_c9)._m0[136].x;
    float _968 = _966 + (*spvDescriptorSet0.vp_c9)._m0[137].x;
    float _970 = _938 * _920;
    float _972 = -(*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _974 = _756 + _972;
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[135].w;
    float _978 = _756 + _976;
    float _980 = fma(_950, _974, (*spvDescriptorSet0.vp_c9)._m0[134].x);
    float _982 = fma(_948, _870, _964);
    float _984 = fma(_970, _978, (*spvDescriptorSet0.vp_c9)._m0[135].x);
    float _986 = _968 * _944;
    float _988 = -_962;
    float _990 = _988 + 1.0;
    float _992 = -(*spvDescriptorSet0.vp_c9)._m0[136].w;
    float _994 = _756 + _992;
    float _996 = fma(_980, _876, _982);
    float _998 = _780 * _990;
    float _1000 = fma(_986, _994, (*spvDescriptorSet0.vp_c9)._m0[136].x);
    float _1002 = fma(_984, _864, _996);
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1006 = fma(_1000, _998, _1002);
    float _1008 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1010 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1014 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[137].x, _1006);
    float _1016 = _1008 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _1012 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _1014 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1022 = !_822;
    if (!_1022)
    {
        float _1024 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1026 = _132 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1028 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[14].x, _102);
        float _1030 = _1028 * _1024;
        float _1032 = floor(_1030);
        float _1034 = -_1032;
        float _1036 = _1030 + _1034;
        _280 = _1036;
    }
    float _1038 = _280;
    float _1040 = in.m_57.x;
    float _1042 = in.m_57.y;
    float _1044 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1046 = log2(_1044);
    float _1048 = _102 * 0.039999999105930328369140625;
    float _1050 = _136 * 2.0;
    float _1052 = in.m_51.y;
    float _1054 = _144 * 6.283185482025146484375;
    float _1056 = _1048 * 0.15915493667125701904296875;
    float _1058 = _132 * 2.0;
    float _1060 = floor(_1050);
    float _1062 = floor(_1058);
    float _1064 = _102 * _1046;
    float _1066 = fma(_102, 0.010999999940395355224609375, _1054);
    float _1068 = _1066 * 0.15915493667125701904296875;
    float _1070 = abs(_1040);
    float _1072 = abs(_1042);
    float _1074 = precise::max(_1070, _1072);
    float _1076 = _1040 * 0.0625;
    float _1078 = _1056 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    bool _1082 = _1060 >= 0.0;
    bool _1084 = isnan(_1060);
    bool _1086 = _1082 || _1084;
    bool _1088 = isnan(0.0);
    bool _1090 = _1086 || _1088;
    float _1092 = _1052 * 6.283185482025146484375;
    bool _1094 = _1074 >= 16.0;
    float _1096 = _1042 * 0.0625;
    float _1098 = _1052 * 2.0;
    float _1100 = fma(_102, 0.007000000216066837310791015625, _1092);
    float _1102 = _1094 ? _1076 : _1040;
    float _1104 = _1068 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    float _1108 = _1094 ? _1096 : _1042;
    float _1110 = _1100 * 0.15915493667125701904296875;
    float _1112 = abs(_1102);
    bool _1114 = _1112 == 0.0;
    float _1116 = _274 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1118 = abs(_1108);
    bool _1120 = _1118 != 0.0;
    bool _1122 = isnan(_1118);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = _1060 > 0.0;
    float _1132 = floor(_1098);
    float _1134 = abs(_1102);
    bool _1136 = _1134 == 0.0;
    bool _1138 = !_1128;
    bool _1140 = _1136 && _1138;
    float _1142 = _274 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1144 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1116);
    float _1146 = _274 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1148 = _1110 * 6.283185482025146484375;
    float _1150 = sin(_1148);
    bool _1152 = false;
    if (_1140)
    {
        bool _1154 = as_type<int>(_1102) >= 0;
        _1152 = _1154;
    }
    bool _1156 = _1152;
    float _1158 = exp2(_1064);
    int _1160 = 0;
    int _1162 = _1156 ? (-1) : 0;
    if (_1140)
    {
        int _1164 = _1156 ? 0 : 1078530011;
        _1160 = _1164;
    }
    int _1166 = _1160;
    float _1168 = _132 + _136;
    float _1170 = _1168 + (-1.0);
    float _1172 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1142);
    float _1174 = fma(_272, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1146);
    float _1176 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1178 = _1170;
    int _1180 = _1166;
    if (_1140)
    {
        int _1182 = int(0x80000000) & as_type<int>(_1108);
        int _1184 = _1166 | _1182;
        _1178 = as_type<float>(_1184);
    }
    float _1186 = _1178;
    bool _1188 = !_1128;
    bool _1190 = _1188 && _1114;
    float _1192 = _1186;
    float _1194 = _1186;
    if (!_1190)
    {
        float _1196 = abs(_1108);
        bool _1198 = _1196 != as_type<float>(0x7f800000u /* inf */);
        bool _1200 = isnan(_1196);
        bool _1202 = _1198 || _1200;
        bool _1204 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1206 = _1202 || _1204;
        float _1208 = abs(_1102);
        bool _1210 = _1208 == as_type<float>(0x7f800000u /* inf */);
        float _1212 = abs(_1102);
        bool _1214 = _1212 == as_type<float>(0x7f800000u /* inf */);
        bool _1216 = !_1206;
        bool _1218 = _1214 && _1216;
        if (_1218)
        {
            bool _1220 = as_type<int>(_1102) >= 0;
            _1162 = _1220 ? (-1) : 0;
        }
        int _1222 = _1162;
        if (_1218)
        {
            _1180 = 1075235812;
        }
        int _1224 = _1180;
        int _1226 = _1224;
        if (_1218)
        {
            int _1228 = ~_1222;
            int _1230 = (_1228 != 0) ? _1224 : 1061752795;
            _1226 = _1230;
        }
        int _1232 = _1226;
        if (_1218)
        {
            int _1234 = int(0x80000000) & as_type<int>(_1108);
            int _1236 = _1232 | _1234;
            _1192 = as_type<float>(_1236);
        }
        float _1238 = _1192;
        bool _1240 = !_1206;
        bool _1242 = _1240 && _1210;
        _1194 = _1238;
        if (!_1242)
        {
            float _1244 = abs(_1108);
            float _1246 = abs(_1102);
            float _1248 = precise::max(_1244, _1246);
            float _1250 = abs(_1108);
            float _1252 = abs(_1102);
            float _1254 = precise::min(_1250, _1252);
            float _1256 = 1.0 / _1248;
            float _1258 = abs(_1108);
            float _1260 = abs(_1102);
            bool _1262 = _1258 > _1260;
            bool _1264 = as_type<int>(_1102) >= 0;
            float _1266 = _1254 * _1256;
            float _1268 = _1266 * _1266;
            float _1270 = _1268 + 11.33538818359375;
            float _1272 = fma(_1268, _1270, 28.84246826171875);
            float _1274 = fma(_1268, _1272, 19.6966705322265625);
            float _1276 = fma(_1268, -0.82336294651031494140625, -5.674867153167724609375);
            float _1278 = fma(_1268, _1276, -6.565555095672607421875);
            float _1280 = 1.0 / _1274;
            float _1282 = _1268 * _1278;
            float _1284 = abs(_1108);
            float _1286 = abs(_1102);
            float _1288 = _1284 + _1286;
            int _1290 = as_type<int>(_1108) & int(0x80000000);
            float _1292 = _1266 * _1282;
            bool _1294 = _1288 > as_type<float>(0x7f800000u /* inf */);
            bool _1296 = isnan(_1288);
            bool _1298 = _1294 || _1296;
            bool _1300 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1302 = _1298 || _1300;
            float _1304 = fma(_1292, _1280, _1266);
            float _1306 = _1304;
            _1194 = _1288;
            if (_1262)
            {
                float _1308 = -_1304;
                float _1310 = _1308 + 1.57079637050628662109375;
                _1306 = _1310;
            }
            float _1312 = _1306;
            int _1314 = as_type<int>(_1312);
            if (!_1264)
            {
                float _1316 = -_1312;
                float _1318 = _1316 + 3.1415927410125732421875;
                _1314 = as_type<int>(_1318);
            }
            int _1320 = _1314;
            if (!_1302)
            {
                int _1322 = _1290 | _1320;
                _1194 = as_type<float>(_1322);
            }
        }
    }
    float _1324 = _1194;
    float _1326 = _132 + _1052;
    float _1328 = abs(_1150);
    float _1330 = log2(_1328);
    float _1332 = _136 + _1052;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[28].y * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1336 = _1326 + (-1.0);
    float _1338 = _1332 + (-1.0);
    float _1340 = abs(_1106);
    float _1342 = log2(_1340);
    float _1344 = fma((*spvDescriptorSet0.vp_c8)._m0[28].x, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1334);
    float _1346 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1348 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1350 = _1090 ? 0 : 1;
    float _1352 = fma(_1080, 9.0, _102);
    float _1354 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1144);
    bool _1356 = _1062 > 0.0;
    float _1358 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1174);
    int _1360 = ~_1350;
    int _1362 = _1360 + 1;
    int _1364 = _1362 + 1;
    float _1366 = fma((*spvDescriptorSet0.vp_c8)._m0[28].z, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1344);
    bool _1368 = _1062 >= 0.0;
    bool _1370 = isnan(_1062);
    bool _1372 = _1368 || _1370;
    bool _1374 = isnan(0.0);
    bool _1376 = _1372 || _1374;
    float _1378 = -_1158;
    float _1380 = _1378 + 1.0;
    int _1382 = _1364;
    if (!_1130)
    {
        int _1384 = ~_1350;
        int _1386 = _1384 + 1;
        _1382 = _1386;
    }
    int _1388 = _1382;
    float _1390 = _1330 * 120.0;
    float _1392 = _1352 * 0.20999999344348907470703125;
    bool _1394 = _1132 > 0.0;
    float _1396 = _1352 * (-0.1599999964237213134765625);
    bool _1398 = _1132 >= 0.0;
    bool _1400 = isnan(_1132);
    bool _1402 = _1398 || _1400;
    bool _1404 = isnan(0.0);
    bool _1406 = _1402 || _1404;
    float _1408 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1410 = 1.0 + _1408;
    float _1412 = _1342 * 80.0;
    int _1414 = _1376 ? 0 : 1;
    float _1416 = fma(_1324, 5.00000095367431640625, _1392);
    int _1418 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1420 = _1418 != 0;
    int _1422 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1424 = _1422 != 0;
    int _1426 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1428 = _1426 != 0;
    float _1430 = fma(_1324, 4.000000476837158203125, _1396);
    int _1432 = ~_1414;
    int _1434 = _1432 + 1;
    int _1436 = _1434 + 1;
    float _1438 = _1416 * 0.15915493667125701904296875;
    int _1440 = _1436;
    bool _1442 = _1406;
    if (!_1356)
    {
        int _1444 = ~_1414;
        int _1446 = _1444 + 1;
        _1440 = _1446;
    }
    int _1448 = _1440;
    float _1450 = _1430 * 0.15915493667125701904296875;
    bool _1452 = !_1420;
    int _1454 = _1452 ? 0 : 1;
    float _1456 = 1.0 / _1410;
    float _1458 = _1354 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1460 = _1358 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1462 = abs(_1454);
    float _1464 = float(_1388);
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1458 + _1466;
    bool _1470 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1472 = isnan(0.0);
    bool _1474 = _1470 || _1472;
    bool _1476 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1478 = _1474 || _1476;
    float _1480 = exp2(_1412);
    float _1482 = float(_1462);
    float _1484 = _1478 ? _1380 : 0.0;
    int _1486 = _1406 ? 0 : 1;
    float _1488 = _1482 * _1464;
    float _1490 = exp2(_1390);
    int _1492 = ~_1486;
    int _1494 = _1492 + 1;
    int _1496 = _1494 + 1;
    float _1498 = _1488 * (-2.0);
    int _1500 = _1496;
    if (!_1394)
    {
        int _1502 = ~_1486;
        int _1504 = _1502 + 1;
        _1500 = _1504;
    }
    int _1506 = _1500;
    float _1508 = fma(_1346, _1498, _1346);
    bool _1510 = !_1428;
    int _1512 = _1510 ? 0 : 1;
    float _1514 = _1438 * 6.283185482025146484375;
    float _1516 = sin(_1514);
    bool _1518 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1520 = isnan(1.0);
    bool _1522 = _1518 || _1520;
    bool _1524 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1526 = _1522 || _1524;
    int _1528 = abs(_1512);
    float _1530 = _1450 * 6.283185482025146484375;
    float _1532 = sin(_1530);
    float _1534 = -_1460;
    float _1536 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1538 = abs(_1468);
    float _1540 = abs(_1536);
    float _1542 = precise::max(_1538, _1540);
    float _1544 = rsqrt(_1366);
    float _1546 = _1484 * _1456;
    float _1548 = _1480 + _1490;
    float _1550 = _132 + (-0.5);
    bool _1552 = _1542 >= 16.0;
    float _1554 = float(_1506);
    float _1556 = _1550 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1558 = _1516 + _1532;
    bool _1560 = !_1424;
    int _1562 = _1560 ? 0 : 1;
    float _1564 = in.m_59.x;
    float _1566 = in.m_59.y;
    float _1568 = in.m_59.z;
    float _1570 = float(_1528);
    float _1572 = precise::max(_1558, -2.0);
    int _1574 = abs(_1562);
    float _1576 = _1544 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1578 = precise::min(_1572, 2.0);
    float _1580 = _1570 * _1554;
    float _1582 = float(_1574);
    float _1584 = _1576 * (-0.15915493667125701904296875);
    float _1586 = float(_1448);
    float _1588 = fma(_1578, 0.25, 0.5);
    float _1590 = _1580 * (-2.0);
    bool _1592 = !_1526;
    float _1594 = _1592 ? _102 : _1546;
    float _1596 = _1584 * 6.283185482025146484375;
    float _1598 = sin(_1596);
    float _1600 = _1582 * _1586;
    float _1602 = _1588 * 0.07999999821186065673828125;
    float _1604 = _136 + (-0.5);
    float _1606 = fma(_1176, _1590, _1176);
    float _1608 = _1600 * (-2.0);
    float _1610 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1612 = _1604 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    float _1614 = fma(_1594, _1508, _1556);
    float _1616 = fma(_1348, _1608, _1348);
    float _1618 = fma(_1042, _1610, _1566);
    float _1620 = _1052 * (-0.87964594364166259765625);
    float _1622 = fma(_1594, _1606, _1612);
    float _1624 = _102 * (-0.17000000178813934326171875);
    float _1626 = _132 * 6.283185482025146484375;
    float _1628 = fma(_1618, 9.0, _1620);
    float _1630 = _1622 * 0.15915493667125701904296875;
    float _1632 = fma(_1618, 16.0, _1624);
    float _1634 = _1584 * 6.283185482025146484375;
    float _1636 = cos(_1634);
    float _1638 = _1614 * 0.15915493667125701904296875;
    float _1640 = _1052 + (-0.5);
    float _1642 = _1632 + _1626;
    float _1644 = _1092 + _1628;
    float _1646 = _1536;
    if (_1552)
    {
        float _1648 = _1536 * 0.0625;
        _1646 = _1648;
    }
    float _1650 = _1646;
    float _1652 = fma(_1040, _1610, _1564);
    float _1654 = _1642 * 0.15915493667125701904296875;
    float _1656 = _1638 * 6.283185482025146484375;
    float _1658 = sin(_1656);
    float _1660 = _1468 * 0.0625;
    float _1662 = _1640 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1664 = _1644 * 0.15915493667125701904296875;
    float _1666 = abs(_1650);
    bool _1668 = _1666 == 0.0;
    float _1670 = _1552 ? _1660 : _1468;
    float _1672 = fma(_1594, _1616, _1662);
    float _1674 = _1638 * 6.283185482025146484375;
    float _1676 = cos(_1674);
    float _1678 = abs(_1670);
    bool _1680 = _1678 != 0.0;
    bool _1682 = isnan(_1678);
    bool _1684 = _1680 || _1682;
    bool _1686 = isnan(0.0);
    bool _1688 = _1684 || _1686;
    float _1690 = fma(_1618, 0.5, 0.5);
    float _1692 = precise::clamp(_1690, 0.0, 1.0);
    float _1694 = abs(_1650);
    bool _1696 = _1694 == 0.0;
    bool _1698 = !_1688;
    bool _1700 = _1696 && _1698;
    float _1702 = _1654 * 6.283185482025146484375;
    float _1704 = sin(_1702);
    float _1706 = _102 * (-0.37000000476837158203125);
    float _1708 = fma(_1692, -2.0, 3.0);
    float _1710 = fma(_1618, 0.58823525905609130859375, 0.411764681339263916015625);
    float _1712 = precise::clamp(_1710, 0.0, 1.0);
    float _1714 = fma(_1618, 5.0, _1706);
    float _1716 = fma(_1712, -2.0, 3.0);
    float _1718 = _1630 * 6.283185482025146484375;
    float _1720 = sin(_1718);
    float _1722 = _1714 + _1054;
    int _1724 = as_type<int>(_1708);
    float _1726 = 0.58823525905609130859375;
    if (_1700)
    {
        bool _1728 = as_type<int>(_1650) >= 0;
        _1442 = _1728;
    }
    bool _1730 = _1442;
    float _1732 = _1722 * 0.15915493667125701904296875;
    float _1734 = _1692 * _1692;
    float _1736 = _1664 * 6.283185482025146484375;
    float _1738 = sin(_1736);
    float _1740 = _1704 * 0.064000003039836883544921875;
    float _1742 = _1708 * _1734;
    int _1744 = _1730 ? (-1) : 0;
    if (_1700)
    {
        int _1746 = _1730 ? 0 : 1078530011;
        _1724 = _1746;
    }
    int _1748 = _1724;
    float _1750 = _1712 * _1712;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    int _1754 = _1748;
    if (_1700)
    {
        int _1756 = int(0x80000000) & as_type<int>(_1670);
        int _1758 = _1748 | _1756;
        _1726 = as_type<float>(_1758);
    }
    float _1760 = _1726;
    float _1762 = _1732 * 6.283185482025146484375;
    float _1764 = sin(_1762);
    bool _1766 = !_1688;
    bool _1768 = _1766 && _1668;
    float _1770 = _1760;
    float _1772 = _1760;
    if (!_1768)
    {
        float _1774 = abs(_1670);
        bool _1776 = _1774 != as_type<float>(0x7f800000u /* inf */);
        bool _1778 = isnan(_1774);
        bool _1780 = _1776 || _1778;
        bool _1782 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1784 = _1780 || _1782;
        float _1786 = abs(_1650);
        bool _1788 = _1786 == as_type<float>(0x7f800000u /* inf */);
        float _1790 = abs(_1650);
        bool _1792 = _1790 == as_type<float>(0x7f800000u /* inf */);
        bool _1794 = !_1784;
        bool _1796 = _1792 && _1794;
        if (_1796)
        {
            bool _1798 = as_type<int>(_1650) >= 0;
            _1744 = _1798 ? (-1) : 0;
        }
        int _1800 = _1744;
        if (_1796)
        {
            _1754 = 1075235812;
        }
        int _1802 = _1754;
        int _1804 = _1802;
        if (_1796)
        {
            int _1806 = ~_1800;
            int _1808 = (_1806 != 0) ? _1802 : 1061752795;
            _1804 = _1808;
        }
        int _1810 = _1804;
        if (_1796)
        {
            int _1812 = int(0x80000000) & as_type<int>(_1670);
            int _1814 = _1810 | _1812;
            _1770 = as_type<float>(_1814);
        }
        float _1816 = _1770;
        bool _1818 = !_1784;
        bool _1820 = _1818 && _1788;
        _1772 = _1816;
        if (!_1820)
        {
            float _1822 = abs(_1670);
            float _1824 = abs(_1650);
            float _1826 = precise::max(_1822, _1824);
            float _1828 = abs(_1670);
            float _1830 = abs(_1650);
            float _1832 = precise::min(_1828, _1830);
            float _1834 = 1.0 / _1826;
            float _1836 = abs(_1670);
            float _1838 = abs(_1650);
            bool _1840 = _1836 > _1838;
            bool _1842 = as_type<int>(_1650) >= 0;
            float _1844 = _1832 * _1834;
            float _1846 = _1844 * _1844;
            float _1848 = _1846 + 11.33538818359375;
            float _1850 = fma(_1846, _1848, 28.84246826171875);
            float _1852 = fma(_1846, _1850, 19.6966705322265625);
            float _1854 = fma(_1846, -0.82336294651031494140625, -5.674867153167724609375);
            float _1856 = fma(_1846, _1854, -6.565555095672607421875);
            float _1858 = 1.0 / _1852;
            float _1860 = _1846 * _1856;
            float _1862 = abs(_1670);
            float _1864 = abs(_1650);
            float _1866 = _1862 + _1864;
            int _1868 = as_type<int>(_1670) & int(0x80000000);
            float _1870 = _1844 * _1860;
            bool _1872 = _1866 > as_type<float>(0x7f800000u /* inf */);
            bool _1874 = isnan(_1866);
            bool _1876 = _1872 || _1874;
            bool _1878 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1880 = _1876 || _1878;
            float _1882 = fma(_1870, _1858, _1844);
            float _1884 = _1882;
            _1772 = _1866;
            if (_1840)
            {
                float _1886 = -_1882;
                float _1888 = _1886 + 1.57079637050628662109375;
                _1884 = _1888;
            }
            float _1890 = _1884;
            int _1892 = as_type<int>(_1890);
            if (!_1842)
            {
                float _1894 = -_1890;
                float _1896 = _1894 + 3.1415927410125732421875;
                _1892 = as_type<int>(_1896);
            }
            int _1898 = _1892;
            if (!_1880)
            {
                int _1900 = _1868 | _1898;
                _1772 = as_type<float>(_1900);
            }
        }
    }
    float _1902 = _1772;
    float _1904 = _1764 * _1548;
    float _1906 = fma(_1740, _1752, _1652);
    float _1908 = _1738 * 0.07299999892711639404296875;
    float _1910 = -_1902;
    float _1912 = _1672 + _1910;
    float _1914 = _1716 * _1750;
    float _1916 = _1904 * 0.180000007152557373046875;
    float _1918 = _136 * 6.283185482025146484375;
    float _1920 = fma(_1908, _1752, _1906);
    float _1922 = _1912 * 0.15915493667125701904296875;
    float _1924 = _1916 * _1914;
    float _1926 = fma(_102, 0.310000002384185791015625, _1918);
    float _1928 = _1598 * _1568;
    float _1930 = _1618 + 0.20000000298023223876953125;
    float _1932 = fma(_1924, (*spvDescriptorSet0.vp_c9)._m0[191].x, _1920);
    float _1934 = _1630 * 6.283185482025146484375;
    float _1936 = cos(_1934);
    float _1938 = _720 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1940 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1942 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1932);
    float _1944 = fma(_102, 0.10999999940395355224609375, _1626);
    float _1946 = _1636 * _1568;
    float _1948 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _1940);
    float _1950 = _1922 * 6.283185482025146484375;
    float _1952 = sin(_1950);
    float _1954 = -_1928;
    float _1956 = fma(_1636, _1930, _1954);
    float _1958 = _724 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1960 = _1942 * _1938;
    float _1962 = _726 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1964 = _1956 + (-0.20000000298023223876953125);
    float _1966 = _1926 * 0.15915493667125701904296875;
    float _1968 = fma(_1598, _1930, _1946);
    float _1970 = _1922 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1964);
    float _1976 = fma(_276, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1172);
    float _1978 = _1958 * _1974;
    float _1980 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1968);
    float _1982 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _1948);
    float _1984 = _1966 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    float _1988 = _1944 * 0.15915493667125701904296875;
    float _1990 = _1658 * _1952;
    float _1992 = _1936 * _1978;
    float _1994 = _1676 * _1952;
    float _1996 = _1980 * _1962;
    float _1998 = -_1978;
    float _2000 = _1720 * _1998;
    float _2002 = _1676 * _1992;
    float _2004 = _1676 * _1972;
    float _2006 = _1658 * _1972;
    float _2008 = 1.0 / _1958;
    float _2010 = _1658 * _1992;
    float _2012 = fma(_1720, _2004, _1990);
    float _2014 = -_1994;
    float _2016 = fma(_1720, _2006, _2014);
    float _2018 = fma(_1720, _1990, _2004);
    float _2020 = _1972 * _1936;
    float _2022 = fma(_2012, _1960, _2002);
    float _2024 = -_2006;
    float _2026 = fma(_1720, _1994, _2024);
    float _2028 = sqrt(_1982);
    float _2030 = fma(_1986, 0.12999999523162841796875, 1.0);
    float _2032 = fma(_2016, _1960, _2010);
    float _2034 = fma(_2026, _1996, _2022);
    float _2036 = _1976 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2038 = _1952 * _1936;
    float _2040 = fma(_2020, _1960, _2000);
    float _2042 = fma(_2018, _1996, _2032);
    float _2044 = _1988 * 6.283185482025146484375;
    float _2046 = sin(_2044);
    float _2048 = _2036 + _2034;
    float _2050 = fma(_2038, _1996, _2040);
    float _2052 = _1460 + _2042;
    float _2054 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2056 = _2048 + _2054;
    float _2058 = _1458 + _2050;
    float _2060 = _2028 * 0.64999997615814208984375;
    float _2062 = _2056 * _2008;
    float _2064 = fma(_2062, _2062, _2062);
    float _2066 = fma(_2046, 0.300000011920928955078125, _2030);
    float _2068 = _2064 * _2060;
    float _2070 = _2066 * _2068;
    float _2072 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].z, _2052);
    float _2074 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].x, _2058);
    float _2076 = fma(_2070, (*spvDescriptorSet0.vp_c8)._m0[32].y, _2048);
    float _2078 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2080 = _2072 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2084 = _2074 + _2082;
    float _2086 = _2080 * _2080;
    float _2088 = fma(_2084, _2084, _2086);
    float _2090 = sqrt(_2088);
    bool _2092 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan(0.5);
    bool _2100 = _2096 || _2098;
    bool _2102 = _2090 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2104 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _2106 = _1996;
    float _2108 = _2074;
    float _2110 = _2080;
    float _2112 = _2088;
    float _2114 = _1994;
    float _2116 = _1992;
    float _2118 = (*spvDescriptorSet0.vp_c10)._m0[6].y;
    if (!_2102)
    {
        _2104 = _2072;
    }
    float _2120 = _2104;
    float _2122 = _2120;
    if (!_2102)
    {
        _2106 = _2076;
    }
    float _2124 = _2106;
    bool _2126 = !_2102;
    float _2128 = _2124;
    if (!_2126)
    {
        float _2130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2132 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2134 = _2090 + _2132;
        float _2136 = _2076 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2138 = _2134 * _2130;
        float _2140 = rsqrt(_2088);
        float _2142 = _2138 * 0.15915493667125701904296875;
        float _2144 = _2142 * 6.283185482025146484375;
        float _2146 = sin(_2144);
        float _2148 = _2142 * 6.283185482025146484375;
        float _2150 = cos(_2148);
        float _2152 = fma(_2146, _2136, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2154 = _2140 * _2152;
        float _2156 = _2150 + (-1.0);
        float _2158 = fma(_2084, _2154, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2160 = fma(_2080, _2154, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2162 = _2156 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2164 = fma(_2076, _2150, _2162);
        _2128 = _2164;
        _2108 = _2158;
        _2122 = _2160;
    }
    float _2166 = _2128;
    float _2168 = _2108;
    float _2170 = _2122;
    float _2172 = _2166;
    float _2174 = _2168;
    float _2176 = _2170;
    if (!_2100)
    {
        float _2178 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2180 = _2036 + _2178;
        float _2182 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2184 = -_2036;
        float _2186 = _2184 + _2166;
        float _2188 = _2180 * _2180;
        float _2190 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2192 = _1460 + _2190;
        float _2194 = fma(_1468, _1468, _2188);
        float _2196 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2198 = fma(_2192, _2192, _2194);
        float _2200 = _2182 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2202 = sqrt(_2198);
        float _2204 = -_1458;
        float _2206 = _2204 + _2168;
        float _2208 = precise::min(_2202, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2210 = _2208 * _2196;
        float _2212 = _2200 * _2210;
        float _2214 = -_1460;
        float _2216 = _2214 + _2170;
        float _2218 = fma(_2206, _2212, _1458);
        float _2220 = fma(_2186, _2212, _2036);
        float _2222 = fma(_2216, _2212, _1460);
        _2172 = _2220;
        _2174 = _2218;
        _2176 = _2222;
        _2110 = _2212;
    }
    float _2224 = _2172;
    float _2226 = _2174;
    float _2228 = _2176;
    float _2230 = _2110;
    float _2232 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2234 = _2224 + _2232;
    float _2236 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2238 = _2226 + _2236;
    float _2240 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2242 = _2228 + _2240;
    float _2244 = _2234 * _2234;
    float _2246 = fma(_2238, _2238, _2244);
    float _2248 = fma(_2242, _2242, _2246);
    float _2250 = rsqrt(_2248);
    float _2252 = sqrt(_2248);
    float _2254 = _2250 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2256 = _2238 * _2254;
    float _2258 = _2242 * _2254;
    float _2260 = _2256 * _2256;
    float _2262 = _2258 * _2258;
    float _2264 = _2260 + _2262;
    float _2266 = sqrt(_2264);
    bool _2268 = _2266 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2270 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2272 = _2266 + _2270;
    float _2274 = _2242;
    float _2276 = _2230;
    float _2278 = _2272;
    float _2280 = _2234;
    if (_2268)
    {
        float _2282 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2274 = _2282;
    }
    float _2284 = _2274;
    if (_2268)
    {
        float _2286 = rsqrt(_2264);
        _2276 = _2286;
    }
    float _2288 = _2276;
    float _2290 = _2288;
    if (_2268)
    {
        float _2292 = _2272 * _2284;
        _2278 = _2292;
    }
    float _2294 = _2278;
    if (_2268)
    {
        float _2296 = _2294 * 0.15915493667125701904296875;
        _2112 = _2296;
    }
    float _2298 = _2112;
    float _2300 = _2250;
    if (_2268)
    {
        float _2302 = _2298 * 6.283185482025146484375;
        float _2304 = sin(_2302);
        _2300 = _2304;
    }
    float _2306 = _2300;
    float _2308 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2310 = precise::max(0.0, _2308);
    float _2312 = _2246;
    float _2314 = _2310;
    float _2316 = _2308;
    if (_2268)
    {
        float _2318 = _2298 * 6.283185482025146484375;
        float _2320 = cos(_2318);
        _2312 = _2320;
    }
    float _2322 = _2312;
    float _2324 = -_2254;
    float _2326 = -_2310;
    float _2328 = fma(_2234, _2324, _2326);
    if (!_2268)
    {
        _2314 = _2256;
    }
    float _2330 = _2314;
    float _2332 = _2330;
    if (_2268)
    {
        float _2334 = _2328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2316 = _2334;
    }
    float _2336 = _2316;
    float _2338 = _2306;
    float _2340 = _2336;
    if (_2268)
    {
        float _2342 = fma(_2306, _2336, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2280 = _2342;
    }
    float _2344 = _2280;
    float _2346 = _2344;
    if (!_2268)
    {
        _2338 = _2260;
    }
    float _2348 = _2338;
    float _2350 = _2348;
    float _2352 = _2322;
    if (_2268)
    {
        float _2354 = _2322 + (-1.0);
        _2340 = _2354;
    }
    float _2356 = _2340;
    float _2358 = _2356;
    if (_2268)
    {
        float _2360 = _2288 * _2344;
        _2114 = _2360;
    }
    float _2362 = _2114;
    if (!_2268)
    {
        _2346 = _2328;
    }
    float _2364 = _2346;
    float _2366 = _2364;
    if (_2268)
    {
        float _2368 = _2356 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2290 = _2368;
    }
    float _2370 = _2290;
    if (_2268)
    {
        float _2372 = _2256 * _2362;
        _2332 = _2372;
    }
    float _2374 = _2332;
    if (!_2268)
    {
        _2358 = _2258;
    }
    float _2376 = _2358;
    float _2378 = _2376;
    if (_2268)
    {
        float _2380 = _2258 * _2362;
        _2378 = _2380;
    }
    float _2382 = _2378;
    if (_2268)
    {
        float _2384 = fma(_2328, _2322, _2370);
        _2366 = _2384;
    }
    float _2386 = _2366;
    if (_2268)
    {
        float _2388 = _2374 * _2374;
        _2350 = _2388;
    }
    float _2390 = _2350;
    if (!_2268)
    {
        _2352 = _2262;
    }
    float _2392 = _2352;
    float _2394 = _2392;
    if (_2268)
    {
        float _2396 = _2382 * _2382;
        _2394 = _2396;
    }
    float _2398 = _2394;
    float _2400 = fma(_2386, _2386, _2390);
    float _2402 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2404 = _2400 + _2398;
    float _2406 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2402);
    float _2408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2410 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2408);
    float _2412 = precise::clamp(_2410, 0.0, 1.0);
    float _2414 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2416 = rsqrt(_2404);
    float _2418 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2406);
    float _2420 = -_2412;
    float _2422 = _2420 + 1.0;
    float _2424 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2426 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2414);
    float _2428 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2430 = _2224 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2432 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2424);
    float _2434 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2426);
    float _2436 = abs(_2422);
    float _2438 = log2(_2436);
    float _2440 = _2418 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2442 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2432);
    float _2444 = _2434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2446 = fma(_2226, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2430);
    float _2448 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2450 = _2442 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2452 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2454 = _2416 * _2374;
    float _2456 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2446);
    float _2458 = -_2448;
    float _2460 = fma(_2458, _2428, 1.0);
    float _2462 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2452);
    float _2464 = _2416 * _2386;
    float _2466 = _2454 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2468 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2470 = _2416 * _2382;
    float _2472 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2474 = -_2466;
    float _2476 = fma(_2464, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2474);
    float _2478 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2462);
    float _2480 = log2(_2460);
    float _2482 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2484 = -_2470;
    float _2486 = fma(_2484, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2476);
    float _2488 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2478);
    float _2490 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2492 = fma(_2486, -0.5, 0.5);
    float _2494 = fma(_2486, 0.5, 0.5);
    float _2496 = exp2(_2472);
    float _2498 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2490);
    float _2500 = _2464 + 1.0;
    float _2502 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2498);
    float _2504 = 1.0 / _2488;
    float _2506 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2482);
    float _2508 = fma(_2494, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2510 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2502);
    float _2512 = _2480 * 0.693147182464599609375;
    float _2514 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2506);
    float _2516 = fma(_2494, _2508, -0.212114393711090087890625);
    float _2518 = sqrt(_2492);
    float _2520 = -_2464;
    float _2522 = fma(_2496, _2500, _2520);
    float _2524 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2514);
    float _2526 = fma(_2494, _2516, 1.570728778839111328125);
    float _2528 = _2512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2530 = fma(_2522, 0.5, 0.5);
    float _2532 = _2510 * _2504;
    float _2534 = _2524 * _2504;
    float _2536 = fma(_2532, 0.5, 0.5);
    float _2538 = fma(_2534, -0.5, 0.5);
    float _2540 = _2518 * 0.636619746685028076171875;
    float3 _7030 = float3(_2536, _2538, _2528);
    float _2542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7030, float3(0.0), isnan(_7030)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7030, float3(0.0), isnan(_7030)), level(0.0)).x;
    float _2544 = -_2526;
    float _2546 = fma(_2540, _2544, 1.0);
    float3 _7046 = float3(_2536, _2538, _2528);
    float4 _2549 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7046, float3(0.0), isnan(_7046)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7046, float3(0.0), isnan(_7046)), level(0.0)).xyzw;
    float _2551 = _2549.x;
    float _2553 = _2549.y;
    float _2555 = _2549.z;
    float _2557 = _2549.w;
    float2 _7063 = float2(_2546, _2530);
    float3 _2561 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7063, float2(0.0), isnan(_7063)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7063, float2(0.0), isnan(_7063)), level(0.0)).xyz;
    float _2563 = _2561.x;
    float _2565 = _2561.y;
    float _2567 = _2561.z;
    float _2569 = in.m_61.y;
    float _2571 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _2573 = _144 > 0.5;
    out.m_63.x = _1010;
    out.m_63.y = _1016;
    out.m_63.z = _1018;
    out.m_63.w = _1020;
    float _2575 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_65.x = _730;
    out.m_65.y = _732;
    out.m_65.z = _734;
    out.m_65.w = _728;
    int _2577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2579 = _2577 != 0;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2583 = _2581 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2587 = _2585 != 0;
    float _2589 = exp2(_2575);
    bool _2591 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2593 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2595 = _2591 || _2593;
    bool _2597 = isnan(0.5);
    bool _2599 = _2595 || _2597;
    out.m_67.x = _1932;
    out.m_67.y = _1964;
    out.m_67.z = _1968;
    float _2601 = _2571 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2603 = _132 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2605 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2607 = 1.0 / _2583;
    float _2609 = -_2569;
    float _2611 = _2609 + 1.0;
    float _2613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2615 = -_2605;
    float _2617 = fma(_2603, 2.0, _2615);
    float _2619 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2621 = _2619 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2627 = _2625 != 0;
    float _2629 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2631 = _2629 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2633 = _1052 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2635 = fma(_132, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2623);
    bool _2637 = _2573;
    float _2639 = (*spvDescriptorSet0.vp_c9)._m0[7].y;
    float _2641 = _2569;
    if (!_2579)
    {
        _2116 = _1052;
    }
    float _2643 = _2116;
    float _2645 = fma(_2633, -2.0, _2613);
    int _2647 = _2573 ? as_type<int>(_2611) : as_type<int>(_2569);
    float _2649 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2651 = _2649 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2653 = 1.0 / _2631;
    float _2655 = _2643;
    if (_2587)
    {
        bool _2657 = _132 > 0.5;
        _2637 = _2657;
    }
    bool _2659 = _2637;
    float _2661 = -_102;
    float _2663 = fma(_2661, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2617);
    if (_2579)
    {
        _2655 = _132;
    }
    float _2665 = _2655;
    float _2667 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2669 = _2667 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2671 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2673 = _2671 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _2675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2677 = _2675 != 0;
    float _2679 = -_2589;
    float _2681 = _2679 + 1.0;
    float _2683 = 1.0 / _2673;
    float _2685 = _2681 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2689 = _2687 != 0;
    float _2691 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2693 = _2677 ? as_type<float>(_2647) : _2569;
    bool _2695 = _2677;
    if (_2627)
    {
        bool _2697 = _136 > 0.5;
        _2695 = _2697;
    }
    bool _2699 = _2695;
    float _2701 = 1.0 / _2669;
    if (!_2579)
    {
        _2639 = _136;
    }
    float _2703 = _2639;
    float _2705 = fma(_1052, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2691);
    float _2707 = _2703;
    if (!_2579)
    {
        _2118 = _136;
    }
    float _2709 = _2118;
    float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2713 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2711;
    float _2715 = _2709;
    if (_2579)
    {
        _2707 = _1052;
    }
    float _2717 = _2707;
    float _2719 = fma(_2693, _2601, -0.5);
    if (_2579)
    {
        _2715 = _1052;
    }
    float _2721 = _2715;
    float _2723 = 1.0 / _2651;
    float _2725 = _2713 * _2607;
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2729 = _2727 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    bool _2731 = _1052 > 0.5;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2735 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2733;
    float _2737 = 1.0 / _2621;
    float _2739 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2741 = _2739 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2743 = _2729 * _2653;
    float _2745 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2747 = _2745 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2751 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2749;
    float _2753 = _2735 * _2701;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2757 = _2755 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2759 = _2747 * _2683;
    float _2761 = 1.0 / _2741;
    float _2763 = _2751 * _2723;
    float _2765 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2767 = _1038 + _2765;
    float _2769 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2771 = _1038 + _2769;
    float _2773 = fma(_2763, _2767, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2775 = fma(_2725, _2771, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2779 = _1038 + _2777;
    float _2781 = _2757 * _2737;
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2785 = _1038 + _2783;
    bool _2787 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2789 = isnan(_1038);
    bool _2791 = _2787 || _2789;
    bool _2793 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2795 = _2791 || _2793;
    float _2797 = float(_2795);
    float _2799 = fma(_2753, _2779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _2801 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2803 = isnan(_1038);
    bool _2805 = _2801 || _2803;
    bool _2807 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2809 = _2805 || _2807;
    float _2811 = float(_2809);
    float _2813 = fma(_2781, _2785, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2815 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2817 = isnan(_1038);
    bool _2819 = _2815 || _2817;
    bool _2821 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2823 = _2819 || _2821;
    float _2825 = float(_2823);
    float _2827 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2827;
    float _2831 = -_2797;
    float _2833 = _2831 + 1.0;
    bool _2835 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2837 = isnan(_1038);
    bool _2839 = _2835 || _2837;
    bool _2841 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2843 = _2839 || _2841;
    float _2845 = float(_2843);
    float _2847 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2849 = _1038 + _2847;
    float _2851 = _2829 * _2761;
    float _2853 = -_2811;
    float _2855 = _2853 + 1.0;
    float _2857 = _2825 * _2833;
    float _2859 = -_2825;
    float _2861 = _2859 + 1.0;
    bool _2863 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2865 = isnan(_1038);
    bool _2867 = _2863 || _2865;
    bool _2869 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2871 = _2867 || _2869;
    float _2873 = float(_2871);
    float _2875 = -_2845;
    float _2877 = _2875 + 1.0;
    float _2879 = fma(_2743, _2849, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2881 = _2797 * _2855;
    float _2883 = _2845 * _2861;
    bool _2885 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2887 = isnan(_1038);
    bool _2889 = _2885 || _2887;
    bool _2891 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2893 = _2889 || _2891;
    float _2895 = float(_2893);
    float _2897 = _2873 * _2877;
    float _2899 = -_2873;
    float _2901 = _2899 + 1.0;
    float _2903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2905 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2907 = isnan(_1038);
    bool _2909 = _2905 || _2907;
    bool _2911 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2913 = _2909 || _2911;
    float _2915 = float(_2913);
    float _2917 = -_2895;
    float _2919 = _2917 + 1.0;
    float _2921 = _2881;
    if (_2689)
    {
        float _2923 = _2731 ? _2611 : _2569;
        _2641 = _2923;
    }
    float _2925 = _2641;
    float _2927 = _2895 * _2901;
    float _2929 = _2915 * _2919;
    bool _2931 = _1038 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2933 = isnan(_1038);
    bool _2935 = _2931 || _2933;
    bool _2937 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2939 = _2935 || _2937;
    float _2941 = float(_2939);
    float _2943 = -_2915;
    float _2945 = _2943 + 1.0;
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2949 = _1038 + _2947;
    float _2951 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2953 = _2941 * _2945;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2957 = _1038 + _2955;
    float _2959 = fma(_2851, _2949, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2961 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2951);
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2965 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2967 = _2775 * _2953;
    float _2969 = _2903 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2971 = fma(_2665, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2963);
    float _2973 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2965);
    float _2975 = _2717 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2977 = fma(_2969, _2925, -0.5);
    float _2979 = _2036 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2981 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2973);
    float _2983 = in.m_61.x;
    float _2985 = fma(_1458, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2979);
    float _2987 = _2981 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2989 = -_2941;
    float _2991 = _2989 + 1.0;
    float _2993 = _2665 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2995 = fma(_1460, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2985);
    float _2997 = 1.0 / _2987;
    float _2999 = fma(_2991, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2967);
    float _3001 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3003 = _2995 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3005 = _2995;
    int _3007 = as_type<int>(_2975);
    float _3009 = _2957;
    if (!_2599)
    {
        _3005 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3011 = _3005;
    float _3013 = fma(_2879, _2929, _2999);
    float _3015 = _3003 + _2987;
    float _3017 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _3019 = fma(_2773, _2927, _3013);
    float _3021 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2705);
    float _3023 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2645);
    float _3025 = _3013;
    float _3027 = _3023;
    if (!_2599)
    {
        _3025 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3029 = _3025;
    float _3031 = fma(_2813, _2897, _3019);
    float _3033 = -_3001;
    float _3035 = fma(_2993, 2.0, _3033);
    float _3037 = -_3023;
    float _3039 = fma(_3021, _2977, _3037);
    float _3041 = _3015 * _2997;
    float _3043 = _3041 * 0.5;
    float _3045 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _3049 = fma(_2799, _2883, _3031);
    float _3051 = _3031;
    if (!_2599)
    {
        float _3053 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3055 = fma(_3043, _3011, _3053);
        _3027 = _3055;
    }
    float _3057 = _3027;
    if (!_2599)
    {
        float _3059 = -_3029;
        float _3061 = _3059 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3051 = _3061;
    }
    float _3063 = _3051;
    float _3065 = fma(_2975, -2.0, _3047);
    float _3067 = _2983;
    if (_2587)
    {
        float _3069 = -_2983;
        float _3071 = _3069 + 1.0;
        _3007 = as_type<int>(_3071);
    }
    int _3073 = _3007;
    int _3075 = 0;
    if (_2627)
    {
        float _3077 = -_2983;
        float _3079 = _3077 + 1.0;
        _3075 = as_type<int>(_3079);
    }
    int _3081 = _3075;
    float _3083 = _3019;
    if (!_2599)
    {
        float _3085 = 1.0 / _3057;
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2635);
    float _3091 = fma(_2759, _2957, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _3093 = in.m_57.w;
    if (!_2587)
    {
        _3009 = _2983;
    }
    float _3095 = _3009;
    float _3097 = _3017 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _3099 = _3095;
    if (_2587)
    {
        float _3101 = _2659 ? as_type<float>(_3073) : _2983;
        _3099 = _3101;
    }
    float _3103 = _3099;
    float _3105 = fma(_3091, _2857, _3049);
    float _3107 = _3063;
    if (!_2599)
    {
        float _3109 = 1.0 / _3063;
        _3107 = _3109;
    }
    float _3111 = _3107;
    if (_2627)
    {
        float _3113 = _2699 ? as_type<float>(_3081) : _2983;
        _3067 = _3113;
    }
    float _3115 = _3067;
    float _3117 = _3045 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3119 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2971);
    float _3121 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2961);
    float _3123 = -_102;
    float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3035);
    float _3127 = _2444 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3129 = fma(_102, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3065);
    float _3131 = fma(_3097, _3103, -0.5);
    float _3133 = fma(_3117, _3115, -0.5);
    float _3135 = fma(_2959, _2881, _3105);
    float _3137 = fma(_2450, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3127);
    float _3139 = _3129;
    if (!_2599)
    {
        float _3141 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3143 = -_3029;
        float _3145 = fma(_3087, _3141, _3143);
        _2921 = _3145;
    }
    float _3147 = _2921;
    float _3149 = -_3129;
    float _3151 = fma(_3121, _2719, _3149);
    float _3153 = fma(_3089, _3131, _2663);
    float _3155 = fma(_3119, _3133, _3125);
    if (_2599)
    {
        _3139 = 1.0;
    }
    float _3157 = _3139;
    float _3159 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3137);
    float _3161 = _3157;
    if (!_2599)
    {
        float _3163 = _3147 * _3111;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        _3161 = _3165;
    }
    float _3167 = _3161;
    float _3169 = _3039 + 0.5;
    float _3171 = _3151 + 0.5;
    float _3173 = _3153 + 0.5;
    float _3175 = _3155 + 0.5;
    float _3177 = fma(_2468, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3159);
    float _3179 = fma(_2811, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3135);
    bool _3181 = _3167 > 0.0;
    bool _3183 = isnan(_3167);
    bool _3185 = _3181 || _3183;
    bool _3187 = isnan(0.0);
    bool _3189 = _3185 || _3187;
    float _3191 = _2510 + _2488;
    out.m_69.x = _3173;
    out.m_69.y = _3169;
    out.m_69.z = _3175;
    out.m_69.w = _3171;
    float _3193 = _3167 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3195 = _2488 * 0.5;
    float _3197 = _3177 + _2488;
    out.m_71.w = _3093;
    float _3199 = _3197 * 0.5;
    out.m_73.x = _3179;
    float _3201 = _3191 * 0.5;
    float _3203 = fma(_2524, -0.5, _3195);
    float _3205 = _3193 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _2510;
    out.gl_Position.y = _2524;
    out.gl_Position.z = _3177;
    out.gl_Position.w = _2488;
    out.m_75.x = _3201;
    out.m_75.y = _3203;
    out.m_75.z = _3199;
    out.m_75.w = _2488;
    out.m_49.x = _3205;
    float _3207 = _2685 * _2542;
    float _3209 = -_2685;
    float _3211 = _3209 + 1.0;
    float _3213 = _2557 * _3207;
    float _3215 = _2557 * _3211;
    float _3217 = _2567 * _3207;
    float _3219 = fma(_2563, _3213, _2551);
    float _3221 = fma(_2565, _3213, _2553);
    float _3223 = fma(_2557, _3217, _2555);
    out.m_77.x = _3219;
    out.m_77.y = _3221;
    out.m_77.z = _3223;
    out.m_77.w = _3215;
    if (_3189)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3225 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3225;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

