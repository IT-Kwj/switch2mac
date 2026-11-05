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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
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
    float4 m_75 [[user(locn0)]];
    float4 m_79 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_49 [[user(locn4)]];
    float4 m_67 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_65 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_57 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_59 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = in.m_46.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1761 = as_type<float>(_120);
        out.gl_Position.z = _1761;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _124 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_97);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_102);
    bool _136 = _106 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _122 = as_type<int>(_146);
    }
    int _148 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1817 = as_type<float>(_148);
        out.gl_Position.z = _1817;
    }
    if (_140)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = in.m_53.z;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = in.m_55.x;
    float _162 = in.m_55.y;
    float _164 = in.m_55.z;
    float _166 = in.m_55.w;
    float _168 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _172 = _170 != 0;
    float _174 = in.m_57.w;
    int _176 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _178 = _176 != 0;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _184 = _182 != 0;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = _158 * _156;
    float _192 = in.m_57.x;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _204 = _150 * _164;
    float _206 = _152 * _160;
    float _208 = in.m_63.w;
    bool _210 = _174 > 0.5;
    float _212 = -_204;
    float _214 = fma(_154, _160, _212);
    float _216 = in.m_63.x;
    float _218 = in.m_63.y;
    float _220 = in.m_63.z;
    float _222 = _154 * _162;
    int _224 = as_type<int>(_154);
    float _226 = _186;
    float _228 = _194;
    if (_172)
    {
        float _230 = -_186;
        float _232 = _230 + 1.0;
        _224 = as_type<int>(_232);
    }
    int _234 = _224;
    float _236 = -_206;
    float _238 = fma(_162, _150, _236);
    float _240 = 0.0;
    if (!_172)
    {
        _240 = _186;
    }
    float _242 = _240;
    float _244 = -_222;
    float _246 = fma(_164, _152, _244);
    float _248 = -_188;
    float _250 = _248 + 1.0;
    float _252 = in.m_57.y;
    float _254 = _214 * _166;
    bool _256 = false;
    float _258 = _242;
    float _260 = _188;
    float _262 = _250;
    float _264 = _254;
    if (_172)
    {
        bool _266 = _192 > 0.5;
        _256 = _266;
    }
    bool _268 = _256;
    float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _272 = _210 ? as_type<int>(_250) : as_type<int>(_188);
    float _274 = _246 * _166;
    if (_172)
    {
        float _276 = _268 ? as_type<float>(_234) : _186;
        _258 = _276;
    }
    float _278 = _258;
    float _280 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[20].x, _190);
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _284 = _282 != 0;
    float _286 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[88].z, _202);
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _290 = _288 != 0;
    float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _304 = _302 != 0;
    float _306 = _238 * _166;
    float _308 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = in.m_57.z;
    float _312 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = _192 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _316 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = -_180;
    float _320 = fma(_314, 2.0, _318);
    float _322 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _324 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _322;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _328 = _252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _330 = _290 ? as_type<float>(_272) : _188;
    float _332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _198);
    bool _334 = _252 > 0.5;
    float _336 = _324 * _324;
    float _338 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _340 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _338;
    float _342 = fma(_328, -2.0, _326);
    float _344 = _270 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _346 = _334 ? as_type<int>(_250) : as_type<int>(_188);
    float _348 = fma(_340, _340, _336);
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _200);
    float _352 = fma(_330, _344, -0.5);
    float _354 = _300 ? as_type<float>(_346) : _188;
    float _356 = _292 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _358 = _326;
    float _360 = _336;
    bool _362 = _300;
    float _364 = _348;
    float _366 = _306;
    if (!_184)
    {
        _358 = _310;
    }
    float _368 = _358;
    float _370 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _342);
    float _372 = fma(_356, _354, -0.5);
    float _374 = _368;
    int _376 = as_type<int>(_370);
    if (!_184)
    {
        _360 = _368;
    }
    float _378 = _360;
    float _380 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _194);
    int _382 = as_type<int>(_380);
    float _384 = _378;
    if (_284)
    {
        bool _386 = _310 > 0.5;
        _362 = _386;
    }
    bool _388 = _362;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_184)
    {
        _374 = _310;
    }
    float _392 = _374;
    float _394 = floor(_280);
    float _396 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[78].z, _390);
    float _398 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _400 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _398;
    float _402 = 0.0;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (!_184)
    {
        _402 = _252;
    }
    float _406 = _402;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _196);
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _412 = 0.0;
    float _414 = _406;
    if (!_284)
    {
        _412 = _186;
    }
    float _416 = _412;
    float _418 = fma(_400, _400, _348);
    float _420 = _416;
    if (!_184)
    {
        _404 = _406;
    }
    float _422 = _404;
    float _424 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[88].w, _410);
    float _426 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _380);
    float _428 = _422;
    if (_284)
    {
        float _430 = -_186;
        float _432 = _430 + 1.0;
        _382 = as_type<int>(_432);
    }
    int _434 = _382;
    if (!_184)
    {
        _364 = _378;
    }
    float _436 = _364;
    float _438 = -_370;
    float _440 = fma(_426, _372, _438);
    float _442 = _436;
    float _444 = _440;
    if (_296)
    {
        float _446 = -_186;
        float _448 = _446 + 1.0;
        _376 = as_type<int>(_448);
    }
    int _450 = _376;
    if (_284)
    {
        float _452 = _388 ? as_type<float>(_434) : _186;
        _420 = _452;
    }
    float _454 = _420;
    if (_184)
    {
        _414 = _252;
    }
    float _456 = _414;
    float _458 = _456;
    if (_184)
    {
        _384 = _392;
    }
    float _460 = _384;
    float _462 = in.m_44.x;
    float _464 = in.m_44.y;
    float _466 = in.m_44.z;
    bool _468 = _392 > 0.5;
    if (_296)
    {
        float _470 = _334 ? as_type<float>(_450) : _186;
        _226 = _470;
    }
    float _472 = _226;
    float _474 = in.m_46.x;
    float _476 = in.m_46.y;
    float _478 = in.m_46.z;
    bool _480 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _484 = _480 || _482;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    float _490 = 0.0;
    if (!_184)
    {
        _490 = _192;
    }
    float _492 = _490;
    float _494 = _492;
    if (_184)
    {
        _228 = _192;
    }
    float _496 = _228;
    float _498 = _496;
    if (_184)
    {
        _494 = _460;
    }
    float _500 = _494;
    if (!_184)
    {
        _498 = _460;
    }
    float _502 = _498;
    float _504 = sqrt(_418);
    float _506 = 0.0;
    if (!_184)
    {
        _506 = _422;
    }
    float _508 = _506;
    float _510 = 0.0;
    float _512 = _508;
    if (!_488)
    {
        float _514 = _168 * _168;
        float _516 = _514 * 0.5;
        _510 = _516;
    }
    float _518 = _510;
    float _520 = _518;
    if (_184)
    {
        _428 = _192;
    }
    float _522 = _428;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _526 = _524;
    if (_304)
    {
        float _528 = _468 ? _250 : _188;
        _260 = _528;
    }
    float _530 = _260;
    if (!_488)
    {
        float _532 = _518 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _520 = _532;
    }
    float _534 = _520;
    float _536 = _534;
    if (_184)
    {
        _262 = _456;
    }
    float _538 = _262;
    float _540 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[83].z, _524);
    float _542 = _538;
    if (!_184)
    {
        _526 = _436;
    }
    float _544 = _526;
    float _546 = _544;
    if (_184)
    {
        _512 = _192;
    }
    float _548 = _512;
    if (!_184)
    {
        _542 = _192;
    }
    float _550 = _542;
    float _552 = -_394;
    float _554 = _280 + _552;
    if (_184)
    {
        _442 = _456;
    }
    float _556 = _442;
    float _558 = _280 * 6.283185482025146484375;
    if (_184)
    {
        _546 = _456;
    }
    float _560 = _546;
    if (!_488)
    {
        _458 = _168;
    }
    float _562 = _458;
    bool _564 = !_488;
    float _566 = _562;
    if (!_564)
    {
        float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _570 = log2(_568);
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _574 = _572 + 1.0;
        float _576 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _578 = _168 * _570;
        float _580 = 1.0 / _574;
        float _582 = _576 * 0.693147182464599609375;
        float _584 = exp2(_578);
        float _586 = 1.0 / _582;
        float _588 = _584 + (-1.0);
        float _590 = -_588;
        float _592 = fma(_590, _586, _168);
        float _594 = _592 * _580;
        float _596 = _594 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _536 = _596;
    }
    float _598 = _536;
    bool _600 = !_488;
    if (!_600)
    {
        float _602 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _604 = log2(_602);
        float _606 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _608 = _606 + 1.0;
        float _610 = 1.0 / _608;
        float _612 = _168 * _604;
        float _614 = exp2(_612);
        float _616 = -_614;
        float _618 = _616 + 1.0;
        float _620 = _618 * _610;
        _566 = _620;
    }
    float _622 = _566;
    float _624 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _626 = _558 * 0.15915493667125701904296875;
    float _628 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _630 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _632 = fma(_622, _476, _624);
    float _634 = fma(_622, _474, _628);
    float _636 = _626 * 6.283185482025146484375;
    float _638 = cos(_636);
    float _640 = fma(_632, _208, _464);
    float _642 = fma(_622, _478, _630);
    float _644 = fma(_634, _208, _462);
    float _646 = fma(_504, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _648 = _640 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _650 = fma(_642, _208, _466);
    float _652 = _640 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[5].x, _648);
    float _658 = _640 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[4].x, _652);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[5].z, _656);
    bool _664 = _554 < 0.5;
    float _666 = float(_664);
    float _668 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _672 = fma(_638, 0.5, 0.5);
    float _674 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    float _676 = _662 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _678 = -_554;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = -_666;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _686 = -_672;
    float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _692 = _674 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = -_676;
    float _696 = _694 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _700 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _702 = -_692;
    float _704 = _702 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _706 = _696 * _696;
    float _708 = fma(_698, _278, -0.5);
    float _710 = -_700;
    float _712 = _710 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _716 = fma(_704, _704, _706);
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _720 = fma(_714, _454, -0.5);
    float _722 = fma(_712, _712, _716);
    float _724 = _548 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _726 = _560 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _734 = _732 != 0;
    float _736 = rsqrt(_722);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _740 = !_178;
    int _742 = _740 ? 0 : 1;
    float _744 = -_738;
    float _746 = fma(_724, 2.0, _744);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = _718 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _752 = abs(_742);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _756 = !_730;
    int _758 = _756 ? 0 : 1;
    float _760 = fma(_750, _472, -0.5);
    bool _762 = !_734;
    int _764 = _762 ? 0 : 1;
    float _766 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[84].z, _754);
    int _768 = abs(_758);
    float _770 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    float _772 = _704 * _736;
    float _774 = float(_752);
    float _776 = _712 * _736;
    float _778 = _696 * _736;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _782 = _772 * _780;
    float _784 = float(_768);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _788 = _776 * _786;
    int _790 = abs(_764);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _794 = -_782;
    float _796 = fma(_776, _792, _794);
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _802 = _778 * _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _806 = -_788;
    float _808 = fma(_778, _804, _806);
    float _810 = _796 * _796;
    float _812 = abs(_680);
    float _814 = _784 * _812;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _818 = -_802;
    float _820 = fma(_772, _816, _818);
    float _822 = precise::max(_646, 1.0);
    float _824 = fma(_808, _808, _810);
    float _826 = fma(_774, _688, _814);
    float _828 = float(_790);
    float _830 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _766);
    float _832 = fma(_820, _820, _824);
    float _834 = abs(_684);
    float _836 = fma(_828, _834, _826);
    float _838 = -_106;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[76].x, _320);
    float _842 = _798 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _844 = rsqrt(_832);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _848 = fma(_842, _530, -0.5);
    float _850 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _396);
    float _852 = _836 * _308;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _856 = _502 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _858 = fma(_850, _708, _840);
    float _860 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _862 = fma(_726, -2.0, _846);
    float _864 = -_854;
    float _866 = fma(_856, 2.0, _864);
    float _868 = _836 * _312;
    float _870 = _836 * _316;
    float _872 = _408 * _860;
    float _874 = _796 * _844;
    float _876 = _808 * _844;
    float _878 = _820 * _844;
    float _880 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = _776 * _874;
    float _884 = _778 * _876;
    float _886 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _888 = _332 * _880;
    float _890 = -_882;
    float _892 = fma(_778, _878, _890);
    float _894 = -_884;
    float _896 = fma(_772, _874, _894);
    float _898 = _350 * _886;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _902 = _888 * _892;
    float _904 = _888 * _896;
    float _906 = _830 * (-0.15915493667125701904296875);
    float _908 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _424);
    float _910 = fma(_872, _876, _902);
    float _912 = fma(_872, _878, _904);
    float _914 = precise::min(_822, 1.89999997615814208984375);
    float _916 = _550 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _918 = fma(_898, _772, _910);
    float _920 = fma(_898, _776, _912);
    float _922 = _906 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = fma(_916, -2.0, _900);
    float _928 = fma(_918, _914, _692);
    float _930 = fma(_920, _914, _700);
    float _932 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _540);
    float _934 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _926);
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _928 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _930 + _940;
    float _944 = _906 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _286);
    float _950 = _938 * _938;
    float _952 = _942 * _942;
    float _954 = -_106;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[86].x, _866);
    float _958 = -_934;
    float _960 = fma(_908, _848, _958);
    float _962 = -_106;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[81].x, _746);
    float _966 = _950 + _952;
    float _968 = _772 * _878;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _676 + _970;
    float _974 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _770);
    float _976 = sqrt(_966);
    float _978 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _862);
    float _980 = fma(_948, _760, _956);
    float _982 = _924 * _352;
    float _984 = -_968;
    float _986 = fma(_776, _876, _984);
    float _988 = _946 * _352;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _692 + _990;
    float _994 = _972 * _972;
    float _996 = -_982;
    float _998 = fma(_946, _720, _996);
    float _1000 = _888 * _986;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1004 = _700 + _1002;
    float _1006 = fma(_992, _992, _994);
    float _1008 = fma(_924, _720, _988);
    float _1010 = fma(_872, _874, _1000);
    float _1012 = fma(_932, _998, _964);
    float _1014 = fma(_1004, _1004, _1006);
    bool _1016 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = fma(_898, _778, _1010);
    float _1020 = -_978;
    float _1022 = fma(_974, _1008, _1020);
    float _1024 = rsqrt(_1014);
    float _1026 = _254 * _892;
    float _1028 = fma(_1018, _914, _676);
    float _1030 = _254 * _986;
    float _1032 = _254 * _896;
    float _1034 = _892 * _162;
    float _1036 = _986 * _162;
    float _1038 = _896 * _162;
    float _1040 = _950;
    float _1042 = _952;
    float _1044 = _928;
    float _1046 = _930;
    if (!_1016)
    {
        _264 = _1028;
    }
    float _1048 = _264;
    bool _1050 = !_1016;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _976 + _1056;
        float _1060 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = rsqrt(_966);
        float _1064 = _1058 * _1054;
        float _1066 = _1064 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1062 * _1076;
        float _1080 = _1074 + (-1.0);
        float _1082 = fma(_938, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1084 = fma(_942, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1086 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1090 = _1082 + _1088;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1094 = _1084 + _1092;
        float _1096 = fma(_1028, _1074, _1086);
        float _1098 = _1090 * _1090;
        float _1100 = _1094 * _1094;
        _1052 = _1096;
        _1040 = _1098;
        _1042 = _1100;
        _1044 = _1082;
        _1046 = _1084;
    }
    float _1102 = _1052;
    float _1104 = _1040;
    float _1106 = _1042;
    float _1108 = _1044;
    float _1110 = _1046;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1114 = _1102 + _1112;
    float _1116 = fma(_274, _876, _1026);
    float _1118 = fma(_274, _878, _1032);
    float _1120 = fma(_874, _160, _1036);
    float _1122 = fma(_1114, _1114, _1104);
    float _1124 = fma(_876, _160, _1034);
    float _1126 = fma(_274, _874, _1030);
    float _1128 = fma(_878, _160, _1038);
    float _1130 = _1122 + _1106;
    float _1132 = fma(_772, _164, _1124);
    float _1134 = _1004 * _1024;
    float _1136 = fma(_306, _772, _1116);
    float _1138 = fma(_778, _164, _1120);
    float _1140 = _992 * _1024;
    float _1142 = sqrt(_1130);
    float _1144 = _972 * _1024;
    float _1146 = fma(_306, _778, _1126);
    float _1148 = fma(_306, _776, _1118);
    float _1150 = _440 + 0.5;
    float _1152 = _858 + 0.5;
    float _1154 = _980 + 0.5;
    float _1156 = _960 + 0.5;
    float _1158 = _1012 + 0.5;
    float _1160 = _1022 + 0.5;
    float _1162 = fma(_776, _164, _1128);
    out.m_65.x = _1140;
    out.m_65.y = _1144;
    out.m_65.z = _1134;
    out.m_67.x = _1154;
    out.m_67.y = _1156;
    bool _1164 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1166 = isnan(_1142);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1172 = _1168 || _1170;
    out.m_69.x = _1152;
    out.m_69.y = _1150;
    out.m_69.z = _1158;
    out.m_69.w = _1160;
    out.m_71.x = _1136;
    out.m_71.y = _1146;
    out.m_71.z = _1148;
    out.m_73.x = _1132;
    out.m_73.y = _1138;
    out.m_73.z = _1162;
    float _1174 = _1146;
    if (!_1172)
    {
        _366 = 1.0;
    }
    float _1176 = _366;
    bool _1178 = !_1172;
    float _1180 = _1176;
    if (!_1178)
    {
        bool _1182 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1184 = isnan(_1142);
        bool _1186 = _1182 || _1184;
        bool _1188 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1190 = _1186 || _1188;
        if (!_1190)
        {
            float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1194 = _1142 + _1192;
            float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1198 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1196;
            float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1202 = _1200 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1204 = 1.0 / _1198;
            float _1206 = _1194 * _1204;
            float _1208 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1180 = _1208;
            _1210 = true;
        }
        else
        {
            bool _1212 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1214 = isnan(_1142);
            bool _1216 = _1212 || _1214;
            bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1220 = _1216 || _1218;
            if (!_1220)
            {
                float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1224 = _1142 + _1222;
                float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1228 = _1226 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1232 = _1230 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1234 = 1.0 / _1228;
                float _1236 = _1224 * _1234;
                float _1238 = fma(_1236, _1232, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1180 = _1238;
                _1210 = true;
            }
            else
            {
                _1180 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1210 = false;
    float _1240 = _1180;
    float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1244 = _1108 + _1242;
    float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1248 = _1110 + _1246;
    bool _1250 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1262 = _1102 + _1260;
    float _1264 = fma(_1244, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1266 = fma(_1248, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1268 = fma(_1262, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1270 = _1248;
    float _1272 = _1240;
    float _1274 = _1268;
    if (_1258)
    {
        _1270 = _1264;
    }
    float _1276 = _1270;
    float _1278 = _1276;
    if (_1258)
    {
        _1272 = _1266;
    }
    float _1280 = _1272;
    float _1282 = _1280;
    if (!_1258)
    {
        float _1284 = sqrt(_1014);
        float _1286 = -_676;
        float _1288 = _1286 + _1268;
        float _1290 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1294 = precise::min(_1284, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1296 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1298 = _1294 * _1292;
        float _1300 = -_692;
        float _1302 = _1300 + _1264;
        float _1304 = _1296 * _1298;
        float _1306 = -_700;
        float _1308 = _1306 + _1266;
        float _1310 = fma(_1302, _1304, _692);
        float _1312 = fma(_1288, _1304, _676);
        float _1314 = fma(_1308, _1304, _700);
        _1274 = _1312;
        _1278 = _1310;
        _1282 = _1314;
    }
    float _1316 = _1274;
    float _1318 = _1278;
    float _1320 = _1282;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = _1316 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = _1318 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1320 + _1330;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = _1324 * _1324;
    float _1338 = fma(_1328, _1328, _1336);
    float _1340 = fma(_1332, _1332, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1346 = _1328 * _1344;
    float _1348 = _1332 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 + _1352;
    float _1356 = sqrt(_1354);
    bool _1358 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = _1356 + _1360;
    float _1364 = _1332;
    float _1366 = _1362;
    float _1368 = _1336;
    float _1370 = _1334;
    float _1372 = _1346;
    float _1374 = _1324;
    if (_1358)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1376;
    }
    float _1378 = _1364;
    if (_1358)
    {
        float _1380 = _1362 * _1378;
        _1366 = _1380;
    }
    float _1382 = _1366;
    if (_1358)
    {
        float _1384 = _1382 * 0.15915493667125701904296875;
        _1368 = _1384;
    }
    float _1386 = _1368;
    float _1388 = precise::max(0.0, _1334);
    float _1390 = _1388;
    if (_1358)
    {
        float _1392 = rsqrt(_1354);
        _1370 = _1392;
    }
    float _1394 = _1370;
    float _1396 = -_1344;
    float _1398 = -_1388;
    float _1400 = fma(_1324, _1396, _1398);
    float _1402 = _1394;
    if (_1358)
    {
        float _1404 = _1400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1390 = _1404;
    }
    float _1406 = _1390;
    float _1408 = _1378;
    float _1410 = _1406;
    if (_1358)
    {
        float _1412 = _1386 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = _1342;
    if (_1358)
    {
        float _1420 = _1386 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = _1416;
    if (_1358)
    {
        float _1428 = fma(_1416, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _444 = _1428;
    }
    float _1430 = _444;
    float _1432 = sqrt(_1340);
    if (!_1358)
    {
        _1426 = _1348;
    }
    float _1434 = _1426;
    float _1436 = _1434;
    if (_1358)
    {
        float _1438 = _1394 * _1430;
        _1174 = _1438;
    }
    float _1440 = _1174;
    if (!_1358)
    {
        _1402 = _1400;
    }
    float _1442 = _1402;
    float _1444 = _1442;
    if (_1358)
    {
        float _1446 = _1424 + (-1.0);
        _1410 = _1446;
    }
    float _1448 = _1410;
    float _1450 = _1448;
    if (_1358)
    {
        float _1452 = _1346 * _1440;
        _1372 = _1452;
    }
    float _1454 = _1372;
    if (_1358)
    {
        float _1456 = _1348 * _1440;
        _1436 = _1456;
    }
    float _1458 = _1436;
    float _1460 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1358)
    {
        float _1462 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1462;
    }
    float _1464 = _1374;
    float _1466 = _1464;
    if (!_1358)
    {
        _1450 = _1350;
    }
    float _1468 = _1450;
    float _1470 = _1468;
    if (_1358)
    {
        float _1472 = _1454 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (_1358)
    {
        float _1476 = fma(_1400, _1424, _1464);
        _1444 = _1476;
    }
    float _1478 = _1444;
    if (!_1358)
    {
        _1466 = _1352;
    }
    float _1480 = _1466;
    float _1482 = _1480;
    if (_1358)
    {
        float _1484 = _1458 * _1458;
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = fma(_1478, _1478, _1474);
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1492 = _1488 + _1486;
    float _1494 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1498 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1496);
    float _1500 = precise::clamp(_1498, 0.0, 1.0);
    float _1502 = rsqrt(_1492);
    float _1504 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1494);
    float _1506 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1508 = -_1500;
    float _1510 = _1508 + 1.0;
    float _1512 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1514 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1504);
    float _1516 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1506);
    float _1518 = abs(_1510);
    float _1520 = log2(_1518);
    float _1522 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1512);
    float _1524 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1526 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1460);
    float _1528 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1530 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1522);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1534 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1526);
    float _1536 = _1502 * _1454;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1502 * _1478;
    float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = -_1538;
    float _1550 = fma(_1548, _1490, 1.0);
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1554 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1556 = _1502 * _1458;
    float _1558 = -_1546;
    float _1560 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1558);
    float _1562 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1552);
    float _1566 = log2(_1550);
    float _1568 = -_1556;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1560);
    float _1572 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1574 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1564);
    float _1576 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1570, -0.5, 0.5);
    float _1580 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1572);
    float _1582 = fma(_1570, 0.5, 0.5);
    float _1584 = exp2(_1554);
    float _1586 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1588 = _1544 + 1.0;
    float _1590 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1592 = fma(_1582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1586);
    float _1596 = 1.0 / _1574;
    float _1598 = _1566 * 0.693147182464599609375;
    float _1600 = sqrt(_1578);
    float _1602 = -_1544;
    float _1604 = fma(_1584, _1588, _1602);
    float _1606 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1590);
    float _1608 = fma(_1582, _1592, -0.212114393711090087890625);
    float _1610 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1594);
    float _1612 = fma(_1604, 0.5, 0.5);
    float _1614 = fma(_1582, _1608, 1.570728778839111328125);
    float _1616 = _1606 * _1596;
    float _1618 = _1610 * _1596;
    float _1620 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1622 = fma(_1616, 0.5, 0.5);
    float _1624 = fma(_1618, -0.5, 0.5);
    float _1626 = _1600 * 0.636619746685028076171875;
    float3 _4256 = float3(_1622, _1624, _1620);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4256, float3(0.0), isnan(_4256)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4256, float3(0.0), isnan(_4256)), level(0.0)).x;
    float3 _4267 = float3(_1622, _1624, _1620);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4267, float3(0.0), isnan(_4267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4267, float3(0.0), isnan(_4267)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = -_1614;
    float _1643 = fma(_1626, _1641, 1.0);
    float2 _4289 = float2(_1643, _1612);
    float3 _1647 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4289, float2(0.0), isnan(_4289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4289, float2(0.0), isnan(_4289)), level(0.0)).xyz;
    float _1649 = _1647.x;
    float _1651 = _1647.y;
    float _1653 = _1647.z;
    float _1655 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _692;
    out.m_75.y = _676;
    out.m_75.z = _700;
    float _1659 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1661 = exp2(_1655);
    float _1663 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1665 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1663);
    float _1667 = _1665 + _1574;
    float _1669 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1606;
    out.gl_Position.y = _1610;
    out.gl_Position.z = _1665;
    out.gl_Position.w = _1574;
    float _1671 = _1667 * 0.5;
    float _1673 = -_1661;
    float _1675 = _1673 + 1.0;
    out.m_77.w = _1669;
    float _1677 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _1671;
    out.m_79.w = _1574;
    out.m_51.x = 1.0;
    float _1679 = _1677 * _1628;
    float _1681 = -_1677;
    float _1683 = _1681 + 1.0;
    float _1685 = _1639 * _1679;
    float _1687 = _1653 * _1679;
    float _1689 = fma(_1649, _1685, _1633);
    float _1691 = fma(_1651, _1685, _1635);
    float _1693 = _1639 * _1683;
    float _1695 = fma(_1639, _1687, _1637);
    out.m_81.x = _1689;
    out.m_81.y = _1691;
    out.m_81.z = _1695;
    out.m_81.w = _1693;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = in.m_46.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1761 = as_type<float>(_120);
        out.gl_Position.z = _1761;
    }
    if (!_110)
    {
        return out;
    }
    bool _124 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_97);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_102);
    bool _136 = _106 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _122 = as_type<int>(_146);
    }
    int _148 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1817 = as_type<float>(_148);
        out.gl_Position.z = _1817;
    }
    if (_140)
    {
        return out;
    }
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = in.m_53.z;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = in.m_55.x;
    float _162 = in.m_55.y;
    float _164 = in.m_55.z;
    float _166 = in.m_55.w;
    float _168 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _172 = _170 != 0;
    float _174 = in.m_57.w;
    int _176 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _178 = _176 != 0;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _184 = _182 != 0;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = _158 * _156;
    float _192 = in.m_57.x;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _204 = _150 * _164;
    float _206 = _152 * _160;
    float _208 = in.m_63.w;
    bool _210 = _174 > 0.5;
    float _212 = -_204;
    float _214 = fma(_154, _160, _212);
    float _216 = in.m_63.x;
    float _218 = in.m_63.y;
    float _220 = in.m_63.z;
    float _222 = _154 * _162;
    int _224 = as_type<int>(_154);
    float _226 = _186;
    float _228 = _194;
    if (_172)
    {
        float _230 = -_186;
        float _232 = _230 + 1.0;
        _224 = as_type<int>(_232);
    }
    int _234 = _224;
    float _236 = -_206;
    float _238 = fma(_162, _150, _236);
    float _240 = 0.0;
    if (!_172)
    {
        _240 = _186;
    }
    float _242 = _240;
    float _244 = -_222;
    float _246 = fma(_164, _152, _244);
    float _248 = -_188;
    float _250 = _248 + 1.0;
    float _252 = in.m_57.y;
    float _254 = _214 * _166;
    bool _256 = false;
    float _258 = _242;
    float _260 = _188;
    float _262 = _250;
    float _264 = _254;
    if (_172)
    {
        bool _266 = _192 > 0.5;
        _256 = _266;
    }
    bool _268 = _256;
    float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _272 = _210 ? as_type<int>(_250) : as_type<int>(_188);
    float _274 = _246 * _166;
    if (_172)
    {
        float _276 = _268 ? as_type<float>(_234) : _186;
        _258 = _276;
    }
    float _278 = _258;
    float _280 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[20].x, _190);
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _284 = _282 != 0;
    float _286 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[88].z, _202);
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _290 = _288 != 0;
    float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _304 = _302 != 0;
    float _306 = _238 * _166;
    float _308 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = in.m_57.z;
    float _312 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = _192 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _316 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = -_180;
    float _320 = fma(_314, 2.0, _318);
    float _322 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _324 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _322;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _328 = _252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _330 = _290 ? as_type<float>(_272) : _188;
    float _332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _198);
    bool _334 = _252 > 0.5;
    float _336 = _324 * _324;
    float _338 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _340 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _338;
    float _342 = fma(_328, -2.0, _326);
    float _344 = _270 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _346 = _334 ? as_type<int>(_250) : as_type<int>(_188);
    float _348 = fma(_340, _340, _336);
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _200);
    float _352 = fma(_330, _344, -0.5);
    float _354 = _300 ? as_type<float>(_346) : _188;
    float _356 = _292 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _358 = _326;
    float _360 = _336;
    bool _362 = _300;
    float _364 = _348;
    float _366 = _306;
    if (!_184)
    {
        _358 = _310;
    }
    float _368 = _358;
    float _370 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _342);
    float _372 = fma(_356, _354, -0.5);
    float _374 = _368;
    int _376 = as_type<int>(_370);
    if (!_184)
    {
        _360 = _368;
    }
    float _378 = _360;
    float _380 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _194);
    int _382 = as_type<int>(_380);
    float _384 = _378;
    if (_284)
    {
        bool _386 = _310 > 0.5;
        _362 = _386;
    }
    bool _388 = _362;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_184)
    {
        _374 = _310;
    }
    float _392 = _374;
    float _394 = floor(_280);
    float _396 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[78].z, _390);
    float _398 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _400 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _398;
    float _402 = 0.0;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (!_184)
    {
        _402 = _252;
    }
    float _406 = _402;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _196);
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _412 = 0.0;
    float _414 = _406;
    if (!_284)
    {
        _412 = _186;
    }
    float _416 = _412;
    float _418 = fma(_400, _400, _348);
    float _420 = _416;
    if (!_184)
    {
        _404 = _406;
    }
    float _422 = _404;
    float _424 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[88].w, _410);
    float _426 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _380);
    float _428 = _422;
    if (_284)
    {
        float _430 = -_186;
        float _432 = _430 + 1.0;
        _382 = as_type<int>(_432);
    }
    int _434 = _382;
    if (!_184)
    {
        _364 = _378;
    }
    float _436 = _364;
    float _438 = -_370;
    float _440 = fma(_426, _372, _438);
    float _442 = _436;
    float _444 = _440;
    if (_296)
    {
        float _446 = -_186;
        float _448 = _446 + 1.0;
        _376 = as_type<int>(_448);
    }
    int _450 = _376;
    if (_284)
    {
        float _452 = _388 ? as_type<float>(_434) : _186;
        _420 = _452;
    }
    float _454 = _420;
    if (_184)
    {
        _414 = _252;
    }
    float _456 = _414;
    float _458 = _456;
    if (_184)
    {
        _384 = _392;
    }
    float _460 = _384;
    float _462 = in.m_44.x;
    float _464 = in.m_44.y;
    float _466 = in.m_44.z;
    bool _468 = _392 > 0.5;
    if (_296)
    {
        float _470 = _334 ? as_type<float>(_450) : _186;
        _226 = _470;
    }
    float _472 = _226;
    float _474 = in.m_46.x;
    float _476 = in.m_46.y;
    float _478 = in.m_46.z;
    bool _480 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _484 = _480 || _482;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    float _490 = 0.0;
    if (!_184)
    {
        _490 = _192;
    }
    float _492 = _490;
    float _494 = _492;
    if (_184)
    {
        _228 = _192;
    }
    float _496 = _228;
    float _498 = _496;
    if (_184)
    {
        _494 = _460;
    }
    float _500 = _494;
    if (!_184)
    {
        _498 = _460;
    }
    float _502 = _498;
    float _504 = sqrt(_418);
    float _506 = 0.0;
    if (!_184)
    {
        _506 = _422;
    }
    float _508 = _506;
    float _510 = 0.0;
    float _512 = _508;
    if (!_488)
    {
        float _514 = _168 * _168;
        float _516 = _514 * 0.5;
        _510 = _516;
    }
    float _518 = _510;
    float _520 = _518;
    if (_184)
    {
        _428 = _192;
    }
    float _522 = _428;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _526 = _524;
    if (_304)
    {
        float _528 = _468 ? _250 : _188;
        _260 = _528;
    }
    float _530 = _260;
    if (!_488)
    {
        float _532 = _518 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _520 = _532;
    }
    float _534 = _520;
    float _536 = _534;
    if (_184)
    {
        _262 = _456;
    }
    float _538 = _262;
    float _540 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[83].z, _524);
    float _542 = _538;
    if (!_184)
    {
        _526 = _436;
    }
    float _544 = _526;
    float _546 = _544;
    if (_184)
    {
        _512 = _192;
    }
    float _548 = _512;
    if (!_184)
    {
        _542 = _192;
    }
    float _550 = _542;
    float _552 = -_394;
    float _554 = _280 + _552;
    if (_184)
    {
        _442 = _456;
    }
    float _556 = _442;
    float _558 = _280 * 6.283185482025146484375;
    if (_184)
    {
        _546 = _456;
    }
    float _560 = _546;
    if (!_488)
    {
        _458 = _168;
    }
    float _562 = _458;
    bool _564 = !_488;
    float _566 = _562;
    if (!_564)
    {
        float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _570 = log2(_568);
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _574 = _572 + 1.0;
        float _576 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _578 = _168 * _570;
        float _580 = 1.0 / _574;
        float _582 = _576 * 0.693147182464599609375;
        float _584 = exp2(_578);
        float _586 = 1.0 / _582;
        float _588 = _584 + (-1.0);
        float _590 = -_588;
        float _592 = fma(_590, _586, _168);
        float _594 = _592 * _580;
        float _596 = _594 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _536 = _596;
    }
    float _598 = _536;
    bool _600 = !_488;
    if (!_600)
    {
        float _602 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _604 = log2(_602);
        float _606 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _608 = _606 + 1.0;
        float _610 = 1.0 / _608;
        float _612 = _168 * _604;
        float _614 = exp2(_612);
        float _616 = -_614;
        float _618 = _616 + 1.0;
        float _620 = _618 * _610;
        _566 = _620;
    }
    float _622 = _566;
    float _624 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _626 = _558 * 0.15915493667125701904296875;
    float _628 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _630 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _632 = fma(_622, _476, _624);
    float _634 = fma(_622, _474, _628);
    float _636 = _626 * 6.283185482025146484375;
    float _638 = cos(_636);
    float _640 = fma(_632, _208, _464);
    float _642 = fma(_622, _478, _630);
    float _644 = fma(_634, _208, _462);
    float _646 = fma(_504, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _648 = _640 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _650 = fma(_642, _208, _466);
    float _652 = _640 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[5].x, _648);
    float _658 = _640 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[4].x, _652);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[5].z, _656);
    bool _664 = _554 < 0.5;
    float _666 = float(_664);
    float _668 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _672 = fma(_638, 0.5, 0.5);
    float _674 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    float _676 = _662 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _678 = -_554;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = -_666;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _686 = -_672;
    float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _692 = _674 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = -_676;
    float _696 = _694 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _700 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _702 = -_692;
    float _704 = _702 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _706 = _696 * _696;
    float _708 = fma(_698, _278, -0.5);
    float _710 = -_700;
    float _712 = _710 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _716 = fma(_704, _704, _706);
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _720 = fma(_714, _454, -0.5);
    float _722 = fma(_712, _712, _716);
    float _724 = _548 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _726 = _560 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _734 = _732 != 0;
    float _736 = rsqrt(_722);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _740 = !_178;
    int _742 = _740 ? 0 : 1;
    float _744 = -_738;
    float _746 = fma(_724, 2.0, _744);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = _718 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _752 = abs(_742);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _756 = !_730;
    int _758 = _756 ? 0 : 1;
    float _760 = fma(_750, _472, -0.5);
    bool _762 = !_734;
    int _764 = _762 ? 0 : 1;
    float _766 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[84].z, _754);
    int _768 = abs(_758);
    float _770 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    float _772 = _704 * _736;
    float _774 = float(_752);
    float _776 = _712 * _736;
    float _778 = _696 * _736;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _782 = _772 * _780;
    float _784 = float(_768);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _788 = _776 * _786;
    int _790 = abs(_764);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _794 = -_782;
    float _796 = fma(_776, _792, _794);
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _802 = _778 * _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _806 = -_788;
    float _808 = fma(_778, _804, _806);
    float _810 = _796 * _796;
    float _812 = abs(_680);
    float _814 = _784 * _812;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _818 = -_802;
    float _820 = fma(_772, _816, _818);
    float _822 = precise::max(_646, 1.0);
    float _824 = fma(_808, _808, _810);
    float _826 = fma(_774, _688, _814);
    float _828 = float(_790);
    float _830 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _766);
    float _832 = fma(_820, _820, _824);
    float _834 = abs(_684);
    float _836 = fma(_828, _834, _826);
    float _838 = -_106;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[76].x, _320);
    float _842 = _798 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _844 = rsqrt(_832);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _848 = fma(_842, _530, -0.5);
    float _850 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _396);
    float _852 = _836 * _308;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _856 = _502 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _858 = fma(_850, _708, _840);
    float _860 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _862 = fma(_726, -2.0, _846);
    float _864 = -_854;
    float _866 = fma(_856, 2.0, _864);
    float _868 = _836 * _312;
    float _870 = _836 * _316;
    float _872 = _408 * _860;
    float _874 = _796 * _844;
    float _876 = _808 * _844;
    float _878 = _820 * _844;
    float _880 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = _776 * _874;
    float _884 = _778 * _876;
    float _886 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _888 = _332 * _880;
    float _890 = -_882;
    float _892 = fma(_778, _878, _890);
    float _894 = -_884;
    float _896 = fma(_772, _874, _894);
    float _898 = _350 * _886;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _902 = _888 * _892;
    float _904 = _888 * _896;
    float _906 = _830 * (-0.15915493667125701904296875);
    float _908 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _424);
    float _910 = fma(_872, _876, _902);
    float _912 = fma(_872, _878, _904);
    float _914 = precise::min(_822, 1.89999997615814208984375);
    float _916 = _550 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _918 = fma(_898, _772, _910);
    float _920 = fma(_898, _776, _912);
    float _922 = _906 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = fma(_916, -2.0, _900);
    float _928 = fma(_918, _914, _692);
    float _930 = fma(_920, _914, _700);
    float _932 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _540);
    float _934 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _926);
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _928 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _930 + _940;
    float _944 = _906 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _286);
    float _950 = _938 * _938;
    float _952 = _942 * _942;
    float _954 = -_106;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[86].x, _866);
    float _958 = -_934;
    float _960 = fma(_908, _848, _958);
    float _962 = -_106;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[81].x, _746);
    float _966 = _950 + _952;
    float _968 = _772 * _878;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _676 + _970;
    float _974 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _770);
    float _976 = sqrt(_966);
    float _978 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _862);
    float _980 = fma(_948, _760, _956);
    float _982 = _924 * _352;
    float _984 = -_968;
    float _986 = fma(_776, _876, _984);
    float _988 = _946 * _352;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _692 + _990;
    float _994 = _972 * _972;
    float _996 = -_982;
    float _998 = fma(_946, _720, _996);
    float _1000 = _888 * _986;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1004 = _700 + _1002;
    float _1006 = fma(_992, _992, _994);
    float _1008 = fma(_924, _720, _988);
    float _1010 = fma(_872, _874, _1000);
    float _1012 = fma(_932, _998, _964);
    float _1014 = fma(_1004, _1004, _1006);
    bool _1016 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = fma(_898, _778, _1010);
    float _1020 = -_978;
    float _1022 = fma(_974, _1008, _1020);
    float _1024 = rsqrt(_1014);
    float _1026 = _254 * _892;
    float _1028 = fma(_1018, _914, _676);
    float _1030 = _254 * _986;
    float _1032 = _254 * _896;
    float _1034 = _892 * _162;
    float _1036 = _986 * _162;
    float _1038 = _896 * _162;
    float _1040 = _950;
    float _1042 = _952;
    float _1044 = _928;
    float _1046 = _930;
    if (!_1016)
    {
        _264 = _1028;
    }
    float _1048 = _264;
    bool _1050 = !_1016;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _976 + _1056;
        float _1060 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = rsqrt(_966);
        float _1064 = _1058 * _1054;
        float _1066 = _1064 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1062 * _1076;
        float _1080 = _1074 + (-1.0);
        float _1082 = fma(_938, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1084 = fma(_942, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1086 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1090 = _1082 + _1088;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1094 = _1084 + _1092;
        float _1096 = fma(_1028, _1074, _1086);
        float _1098 = _1090 * _1090;
        float _1100 = _1094 * _1094;
        _1052 = _1096;
        _1040 = _1098;
        _1042 = _1100;
        _1044 = _1082;
        _1046 = _1084;
    }
    float _1102 = _1052;
    float _1104 = _1040;
    float _1106 = _1042;
    float _1108 = _1044;
    float _1110 = _1046;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1114 = _1102 + _1112;
    float _1116 = fma(_274, _876, _1026);
    float _1118 = fma(_274, _878, _1032);
    float _1120 = fma(_874, _160, _1036);
    float _1122 = fma(_1114, _1114, _1104);
    float _1124 = fma(_876, _160, _1034);
    float _1126 = fma(_274, _874, _1030);
    float _1128 = fma(_878, _160, _1038);
    float _1130 = _1122 + _1106;
    float _1132 = fma(_772, _164, _1124);
    float _1134 = _1004 * _1024;
    float _1136 = fma(_306, _772, _1116);
    float _1138 = fma(_778, _164, _1120);
    float _1140 = _992 * _1024;
    float _1142 = sqrt(_1130);
    float _1144 = _972 * _1024;
    float _1146 = fma(_306, _778, _1126);
    float _1148 = fma(_306, _776, _1118);
    float _1150 = _440 + 0.5;
    float _1152 = _858 + 0.5;
    float _1154 = _980 + 0.5;
    float _1156 = _960 + 0.5;
    float _1158 = _1012 + 0.5;
    float _1160 = _1022 + 0.5;
    float _1162 = fma(_776, _164, _1128);
    out.m_65.x = _1140;
    out.m_65.y = _1144;
    out.m_65.z = _1134;
    out.m_67.x = _1154;
    out.m_67.y = _1156;
    bool _1164 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1166 = isnan(_1142);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1172 = _1168 || _1170;
    out.m_69.x = _1152;
    out.m_69.y = _1150;
    out.m_69.z = _1158;
    out.m_69.w = _1160;
    out.m_71.x = _1136;
    out.m_71.y = _1146;
    out.m_71.z = _1148;
    out.m_73.x = _1132;
    out.m_73.y = _1138;
    out.m_73.z = _1162;
    float _1174 = _1146;
    if (!_1172)
    {
        _366 = 1.0;
    }
    float _1176 = _366;
    bool _1178 = !_1172;
    float _1180 = _1176;
    if (!_1178)
    {
        bool _1182 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1184 = isnan(_1142);
        bool _1186 = _1182 || _1184;
        bool _1188 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1190 = _1186 || _1188;
        if (!_1190)
        {
            float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1194 = _1142 + _1192;
            float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1198 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1196;
            float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1202 = _1200 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1204 = 1.0 / _1198;
            float _1206 = _1194 * _1204;
            float _1208 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1180 = _1208;
            _1210 = true;
        }
        else
        {
            bool _1212 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1214 = isnan(_1142);
            bool _1216 = _1212 || _1214;
            bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1220 = _1216 || _1218;
            if (!_1220)
            {
                float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1224 = _1142 + _1222;
                float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1228 = _1226 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1232 = _1230 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1234 = 1.0 / _1228;
                float _1236 = _1224 * _1234;
                float _1238 = fma(_1236, _1232, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1180 = _1238;
                _1210 = true;
            }
            else
            {
                _1180 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1210 = false;
    float _1240 = _1180;
    float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1244 = _1108 + _1242;
    float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1248 = _1110 + _1246;
    bool _1250 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1262 = _1102 + _1260;
    float _1264 = fma(_1244, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1266 = fma(_1248, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1268 = fma(_1262, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1270 = _1248;
    float _1272 = _1240;
    float _1274 = _1268;
    if (_1258)
    {
        _1270 = _1264;
    }
    float _1276 = _1270;
    float _1278 = _1276;
    if (_1258)
    {
        _1272 = _1266;
    }
    float _1280 = _1272;
    float _1282 = _1280;
    if (!_1258)
    {
        float _1284 = sqrt(_1014);
        float _1286 = -_676;
        float _1288 = _1286 + _1268;
        float _1290 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1294 = precise::min(_1284, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1296 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1298 = _1294 * _1292;
        float _1300 = -_692;
        float _1302 = _1300 + _1264;
        float _1304 = _1296 * _1298;
        float _1306 = -_700;
        float _1308 = _1306 + _1266;
        float _1310 = fma(_1302, _1304, _692);
        float _1312 = fma(_1288, _1304, _676);
        float _1314 = fma(_1308, _1304, _700);
        _1274 = _1312;
        _1278 = _1310;
        _1282 = _1314;
    }
    float _1316 = _1274;
    float _1318 = _1278;
    float _1320 = _1282;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = _1316 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = _1318 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1320 + _1330;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = _1324 * _1324;
    float _1338 = fma(_1328, _1328, _1336);
    float _1340 = fma(_1332, _1332, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1346 = _1328 * _1344;
    float _1348 = _1332 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 + _1352;
    float _1356 = sqrt(_1354);
    bool _1358 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = _1356 + _1360;
    float _1364 = _1332;
    float _1366 = _1362;
    float _1368 = _1336;
    float _1370 = _1334;
    float _1372 = _1346;
    float _1374 = _1324;
    if (_1358)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1376;
    }
    float _1378 = _1364;
    if (_1358)
    {
        float _1380 = _1362 * _1378;
        _1366 = _1380;
    }
    float _1382 = _1366;
    if (_1358)
    {
        float _1384 = _1382 * 0.15915493667125701904296875;
        _1368 = _1384;
    }
    float _1386 = _1368;
    float _1388 = precise::max(0.0, _1334);
    float _1390 = _1388;
    if (_1358)
    {
        float _1392 = rsqrt(_1354);
        _1370 = _1392;
    }
    float _1394 = _1370;
    float _1396 = -_1344;
    float _1398 = -_1388;
    float _1400 = fma(_1324, _1396, _1398);
    float _1402 = _1394;
    if (_1358)
    {
        float _1404 = _1400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1390 = _1404;
    }
    float _1406 = _1390;
    float _1408 = _1378;
    float _1410 = _1406;
    if (_1358)
    {
        float _1412 = _1386 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = _1342;
    if (_1358)
    {
        float _1420 = _1386 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = _1416;
    if (_1358)
    {
        float _1428 = fma(_1416, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _444 = _1428;
    }
    float _1430 = _444;
    float _1432 = sqrt(_1340);
    if (!_1358)
    {
        _1426 = _1348;
    }
    float _1434 = _1426;
    float _1436 = _1434;
    if (_1358)
    {
        float _1438 = _1394 * _1430;
        _1174 = _1438;
    }
    float _1440 = _1174;
    if (!_1358)
    {
        _1402 = _1400;
    }
    float _1442 = _1402;
    float _1444 = _1442;
    if (_1358)
    {
        float _1446 = _1424 + (-1.0);
        _1410 = _1446;
    }
    float _1448 = _1410;
    float _1450 = _1448;
    if (_1358)
    {
        float _1452 = _1346 * _1440;
        _1372 = _1452;
    }
    float _1454 = _1372;
    if (_1358)
    {
        float _1456 = _1348 * _1440;
        _1436 = _1456;
    }
    float _1458 = _1436;
    float _1460 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1358)
    {
        float _1462 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1462;
    }
    float _1464 = _1374;
    float _1466 = _1464;
    if (!_1358)
    {
        _1450 = _1350;
    }
    float _1468 = _1450;
    float _1470 = _1468;
    if (_1358)
    {
        float _1472 = _1454 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (_1358)
    {
        float _1476 = fma(_1400, _1424, _1464);
        _1444 = _1476;
    }
    float _1478 = _1444;
    if (!_1358)
    {
        _1466 = _1352;
    }
    float _1480 = _1466;
    float _1482 = _1480;
    if (_1358)
    {
        float _1484 = _1458 * _1458;
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = fma(_1478, _1478, _1474);
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1492 = _1488 + _1486;
    float _1494 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1498 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1496);
    float _1500 = precise::clamp(_1498, 0.0, 1.0);
    float _1502 = rsqrt(_1492);
    float _1504 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1494);
    float _1506 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1508 = -_1500;
    float _1510 = _1508 + 1.0;
    float _1512 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1514 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1504);
    float _1516 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1506);
    float _1518 = abs(_1510);
    float _1520 = log2(_1518);
    float _1522 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1512);
    float _1524 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1526 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1460);
    float _1528 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1530 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1522);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1534 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1526);
    float _1536 = _1502 * _1454;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1502 * _1478;
    float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = -_1538;
    float _1550 = fma(_1548, _1490, 1.0);
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1554 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1556 = _1502 * _1458;
    float _1558 = -_1546;
    float _1560 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1558);
    float _1562 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1552);
    float _1566 = log2(_1550);
    float _1568 = -_1556;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1560);
    float _1572 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1574 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1564);
    float _1576 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1570, -0.5, 0.5);
    float _1580 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1572);
    float _1582 = fma(_1570, 0.5, 0.5);
    float _1584 = exp2(_1554);
    float _1586 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1588 = _1544 + 1.0;
    float _1590 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1592 = fma(_1582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1586);
    float _1596 = 1.0 / _1574;
    float _1598 = _1566 * 0.693147182464599609375;
    float _1600 = sqrt(_1578);
    float _1602 = -_1544;
    float _1604 = fma(_1584, _1588, _1602);
    float _1606 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1590);
    float _1608 = fma(_1582, _1592, -0.212114393711090087890625);
    float _1610 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1594);
    float _1612 = fma(_1604, 0.5, 0.5);
    float _1614 = fma(_1582, _1608, 1.570728778839111328125);
    float _1616 = _1606 * _1596;
    float _1618 = _1610 * _1596;
    float _1620 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1622 = fma(_1616, 0.5, 0.5);
    float _1624 = fma(_1618, -0.5, 0.5);
    float _1626 = _1600 * 0.636619746685028076171875;
    float3 _4256 = float3(_1622, _1624, _1620);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4256, float3(0.0), isnan(_4256)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4256, float3(0.0), isnan(_4256)), level(0.0)).x;
    float3 _4267 = float3(_1622, _1624, _1620);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4267, float3(0.0), isnan(_4267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4267, float3(0.0), isnan(_4267)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = -_1614;
    float _1643 = fma(_1626, _1641, 1.0);
    float2 _4289 = float2(_1643, _1612);
    float3 _1647 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4289, float2(0.0), isnan(_4289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4289, float2(0.0), isnan(_4289)), level(0.0)).xyz;
    float _1649 = _1647.x;
    float _1651 = _1647.y;
    float _1653 = _1647.z;
    float _1655 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _692;
    out.m_75.y = _676;
    out.m_75.z = _700;
    float _1659 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1661 = exp2(_1655);
    float _1663 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1665 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1663);
    float _1667 = _1665 + _1574;
    float _1669 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1606;
    out.gl_Position.y = _1610;
    out.gl_Position.z = _1665;
    out.gl_Position.w = _1574;
    float _1671 = _1667 * 0.5;
    float _1673 = -_1661;
    float _1675 = _1673 + 1.0;
    out.m_77.w = _1669;
    float _1677 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _1671;
    out.m_79.w = _1574;
    out.m_51.x = 1.0;
    float _1679 = _1677 * _1628;
    float _1681 = -_1677;
    float _1683 = _1681 + 1.0;
    float _1685 = _1639 * _1679;
    float _1687 = _1653 * _1679;
    float _1689 = fma(_1649, _1685, _1633);
    float _1691 = fma(_1651, _1685, _1635);
    float _1693 = _1639 * _1683;
    float _1695 = fma(_1639, _1687, _1637);
    out.m_81.x = _1689;
    out.m_81.y = _1691;
    out.m_81.z = _1695;
    out.m_81.w = _1693;
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
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1210 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _95 = in.m_44.w;
    float _97 = in.m_46.w;
    float _99 = trunc(_95);
    int _102 = int(_99);
    float _104 = -_97;
    float _106 = _104 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _106;
    bool _110 = _102 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _116 = 0;
    if (!_110)
    {
        float _118 = _114 * 5.0;
        _116 = as_type<int>(_118);
    }
    int _120 = _116;
    int _122 = _120;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1761 = as_type<float>(_120);
        out.gl_Position.z = _1761;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _124 = _97 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _126 = isnan(_97);
    bool _128 = _124 || _126;
    bool _130 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _132 = _128 || _130;
    float _134 = float(_102);
    bool _136 = _106 >= _134;
    bool _138 = !_132;
    bool _140 = _136 || _138;
    float _142 = _134;
    if (_140)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _144 = _142;
    if (_140)
    {
        out.m_51.x = 0.0;
    }
    if (_140)
    {
        float _146 = _144 * 5.0;
        _122 = as_type<int>(_146);
    }
    int _148 = _122;
    if (_140)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1817 = as_type<float>(_148);
        out.gl_Position.z = _1817;
    }
    if (_140)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_53.x;
    float _152 = in.m_53.y;
    float _154 = in.m_53.z;
    float _156 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _158 = _106 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _160 = in.m_55.x;
    float _162 = in.m_55.y;
    float _164 = in.m_55.z;
    float _166 = in.m_55.w;
    float _168 = _106 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    int _170 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y);
    bool _172 = _170 != 0;
    float _174 = in.m_57.w;
    int _176 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _178 = _176 != 0;
    float _180 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _182 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _184 = _182 != 0;
    float _186 = in.m_59.x;
    float _188 = in.m_59.y;
    float _190 = _158 * _156;
    float _192 = in.m_57.x;
    float _194 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _196 = in.m_61.x;
    float _198 = in.m_61.y;
    float _200 = in.m_61.z;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _204 = _150 * _164;
    float _206 = _152 * _160;
    float _208 = in.m_63.w;
    bool _210 = _174 > 0.5;
    float _212 = -_204;
    float _214 = fma(_154, _160, _212);
    float _216 = in.m_63.x;
    float _218 = in.m_63.y;
    float _220 = in.m_63.z;
    float _222 = _154 * _162;
    int _224 = as_type<int>(_154);
    float _226 = _186;
    float _228 = _194;
    if (_172)
    {
        float _230 = -_186;
        float _232 = _230 + 1.0;
        _224 = as_type<int>(_232);
    }
    int _234 = _224;
    float _236 = -_206;
    float _238 = fma(_162, _150, _236);
    float _240 = 0.0;
    if (!_172)
    {
        _240 = _186;
    }
    float _242 = _240;
    float _244 = -_222;
    float _246 = fma(_164, _152, _244);
    float _248 = -_188;
    float _250 = _248 + 1.0;
    float _252 = in.m_57.y;
    float _254 = _214 * _166;
    bool _256 = false;
    float _258 = _242;
    float _260 = _188;
    float _262 = _250;
    float _264 = _254;
    if (_172)
    {
        bool _266 = _192 > 0.5;
        _256 = _266;
    }
    bool _268 = _256;
    float _270 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _272 = _210 ? as_type<int>(_250) : as_type<int>(_188);
    float _274 = _246 * _166;
    if (_172)
    {
        float _276 = _268 ? as_type<float>(_234) : _186;
        _258 = _276;
    }
    float _278 = _258;
    float _280 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[20].x, _190);
    int _282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _284 = _282 != 0;
    float _286 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[88].z, _202);
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _290 = _288 != 0;
    float _292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _296 = _294 != 0;
    int _298 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _300 = _298 != 0;
    int _302 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _304 = _302 != 0;
    float _306 = _238 * _166;
    float _308 = _216 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _310 = in.m_57.z;
    float _312 = _218 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _314 = _192 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _316 = _220 * (*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = -_180;
    float _320 = fma(_314, 2.0, _318);
    float _322 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _324 = (*spvDescriptorSet0.vp_c8)._m0[29].y + _322;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _328 = _252 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _330 = _290 ? as_type<float>(_272) : _188;
    float _332 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _198);
    bool _334 = _252 > 0.5;
    float _336 = _324 * _324;
    float _338 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _340 = (*spvDescriptorSet0.vp_c8)._m0[29].x + _338;
    float _342 = fma(_328, -2.0, _326);
    float _344 = _270 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _346 = _334 ? as_type<int>(_250) : as_type<int>(_188);
    float _348 = fma(_340, _340, _336);
    float _350 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _200);
    float _352 = fma(_330, _344, -0.5);
    float _354 = _300 ? as_type<float>(_346) : _188;
    float _356 = _292 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _358 = _326;
    float _360 = _336;
    bool _362 = _300;
    float _364 = _348;
    float _366 = _306;
    if (!_184)
    {
        _358 = _310;
    }
    float _368 = _358;
    float _370 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[76].y, _342);
    float _372 = fma(_356, _354, -0.5);
    float _374 = _368;
    int _376 = as_type<int>(_370);
    if (!_184)
    {
        _360 = _368;
    }
    float _378 = _360;
    float _380 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[78].w, _194);
    int _382 = as_type<int>(_380);
    float _384 = _378;
    if (_284)
    {
        bool _386 = _310 > 0.5;
        _362 = _386;
    }
    bool _388 = _362;
    float _390 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_184)
    {
        _374 = _310;
    }
    float _392 = _374;
    float _394 = floor(_280);
    float _396 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[78].z, _390);
    float _398 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _400 = (*spvDescriptorSet0.vp_c8)._m0[29].z + _398;
    float _402 = 0.0;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[88].w;
    if (!_184)
    {
        _402 = _252;
    }
    float _406 = _402;
    float _408 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _196);
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _412 = 0.0;
    float _414 = _406;
    if (!_284)
    {
        _412 = _186;
    }
    float _416 = _412;
    float _418 = fma(_400, _400, _348);
    float _420 = _416;
    if (!_184)
    {
        _404 = _406;
    }
    float _422 = _404;
    float _424 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[88].w, _410);
    float _426 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].w, _380);
    float _428 = _422;
    if (_284)
    {
        float _430 = -_186;
        float _432 = _430 + 1.0;
        _382 = as_type<int>(_432);
    }
    int _434 = _382;
    if (!_184)
    {
        _364 = _378;
    }
    float _436 = _364;
    float _438 = -_370;
    float _440 = fma(_426, _372, _438);
    float _442 = _436;
    float _444 = _440;
    if (_296)
    {
        float _446 = -_186;
        float _448 = _446 + 1.0;
        _376 = as_type<int>(_448);
    }
    int _450 = _376;
    if (_284)
    {
        float _452 = _388 ? as_type<float>(_434) : _186;
        _420 = _452;
    }
    float _454 = _420;
    if (_184)
    {
        _414 = _252;
    }
    float _456 = _414;
    float _458 = _456;
    if (_184)
    {
        _384 = _392;
    }
    float _460 = _384;
    float _462 = in.m_44.x;
    float _464 = in.m_44.y;
    float _466 = in.m_44.z;
    bool _468 = _392 > 0.5;
    if (_296)
    {
        float _470 = _334 ? as_type<float>(_450) : _186;
        _226 = _470;
    }
    float _472 = _226;
    float _474 = in.m_46.x;
    float _476 = in.m_46.y;
    float _478 = in.m_46.z;
    bool _480 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _484 = _480 || _482;
    bool _486 = isnan(1.0);
    bool _488 = _484 || _486;
    float _490 = 0.0;
    if (!_184)
    {
        _490 = _192;
    }
    float _492 = _490;
    float _494 = _492;
    if (_184)
    {
        _228 = _192;
    }
    float _496 = _228;
    float _498 = _496;
    if (_184)
    {
        _494 = _460;
    }
    float _500 = _494;
    if (!_184)
    {
        _498 = _460;
    }
    float _502 = _498;
    float _504 = sqrt(_418);
    float _506 = 0.0;
    if (!_184)
    {
        _506 = _422;
    }
    float _508 = _506;
    float _510 = 0.0;
    float _512 = _508;
    if (!_488)
    {
        float _514 = _168 * _168;
        float _516 = _514 * 0.5;
        _510 = _516;
    }
    float _518 = _510;
    float _520 = _518;
    if (_184)
    {
        _428 = _192;
    }
    float _522 = _428;
    float _524 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _526 = _524;
    if (_304)
    {
        float _528 = _468 ? _250 : _188;
        _260 = _528;
    }
    float _530 = _260;
    if (!_488)
    {
        float _532 = _518 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _520 = _532;
    }
    float _534 = _520;
    float _536 = _534;
    if (_184)
    {
        _262 = _456;
    }
    float _538 = _262;
    float _540 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[83].z, _524);
    float _542 = _538;
    if (!_184)
    {
        _526 = _436;
    }
    float _544 = _526;
    float _546 = _544;
    if (_184)
    {
        _512 = _192;
    }
    float _548 = _512;
    if (!_184)
    {
        _542 = _192;
    }
    float _550 = _542;
    float _552 = -_394;
    float _554 = _280 + _552;
    if (_184)
    {
        _442 = _456;
    }
    float _556 = _442;
    float _558 = _280 * 6.283185482025146484375;
    if (_184)
    {
        _546 = _456;
    }
    float _560 = _546;
    if (!_488)
    {
        _458 = _168;
    }
    float _562 = _458;
    bool _564 = !_488;
    float _566 = _562;
    if (!_564)
    {
        float _568 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _570 = log2(_568);
        float _572 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _574 = _572 + 1.0;
        float _576 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _578 = _168 * _570;
        float _580 = 1.0 / _574;
        float _582 = _576 * 0.693147182464599609375;
        float _584 = exp2(_578);
        float _586 = 1.0 / _582;
        float _588 = _584 + (-1.0);
        float _590 = -_588;
        float _592 = fma(_590, _586, _168);
        float _594 = _592 * _580;
        float _596 = _594 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _536 = _596;
    }
    float _598 = _536;
    bool _600 = !_488;
    if (!_600)
    {
        float _602 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _604 = log2(_602);
        float _606 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _608 = _606 + 1.0;
        float _610 = 1.0 / _608;
        float _612 = _168 * _604;
        float _614 = exp2(_612);
        float _616 = -_614;
        float _618 = _616 + 1.0;
        float _620 = _618 * _610;
        _566 = _620;
    }
    float _622 = _566;
    float _624 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _626 = _558 * 0.15915493667125701904296875;
    float _628 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _630 = _598 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _632 = fma(_622, _476, _624);
    float _634 = fma(_622, _474, _628);
    float _636 = _626 * 6.283185482025146484375;
    float _638 = cos(_636);
    float _640 = fma(_632, _208, _464);
    float _642 = fma(_622, _478, _630);
    float _644 = fma(_634, _208, _462);
    float _646 = fma(_504, 0.02249999903142452239990234375, 0.550000011920928955078125);
    float _648 = _640 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _650 = fma(_642, _208, _466);
    float _652 = _640 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _654 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _656 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[5].x, _648);
    float _658 = _640 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _660 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[4].x, _652);
    float _662 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[5].z, _656);
    bool _664 = _554 < 0.5;
    float _666 = float(_664);
    float _668 = fma(_644, (*spvDescriptorSet0.vp_c10)._m0[6].x, _658);
    float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _672 = fma(_638, 0.5, 0.5);
    float _674 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[4].z, _660);
    float _676 = _662 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _678 = -_554;
    float _680 = fma(_678, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _682 = -_666;
    float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _686 = -_672;
    float _688 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _690 = fma(_650, (*spvDescriptorSet0.vp_c10)._m0[6].z, _668);
    float _692 = _674 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _694 = -_676;
    float _696 = _694 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _698 = _654 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _700 = _690 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _702 = -_692;
    float _704 = _702 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _706 = _696 * _696;
    float _708 = fma(_698, _278, -0.5);
    float _710 = -_700;
    float _712 = _710 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _670 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _716 = fma(_704, _704, _706);
    float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _720 = fma(_714, _454, -0.5);
    float _722 = fma(_712, _712, _716);
    float _724 = _548 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _726 = _560 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _734 = _732 != 0;
    float _736 = rsqrt(_722);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _740 = !_178;
    int _742 = _740 ? 0 : 1;
    float _744 = -_738;
    float _746 = fma(_724, 2.0, _744);
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _750 = _718 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _752 = abs(_742);
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    bool _756 = !_730;
    int _758 = _756 ? 0 : 1;
    float _760 = fma(_750, _472, -0.5);
    bool _762 = !_734;
    int _764 = _762 ? 0 : 1;
    float _766 = fma(_500, (*spvDescriptorSet0.vp_c9)._m0[84].z, _754);
    int _768 = abs(_758);
    float _770 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[83].w, _748);
    float _772 = _704 * _736;
    float _774 = float(_752);
    float _776 = _712 * _736;
    float _778 = _696 * _736;
    float _780 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _782 = _772 * _780;
    float _784 = float(_768);
    float _786 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _788 = _776 * _786;
    int _790 = abs(_764);
    float _792 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _794 = -_782;
    float _796 = fma(_776, _792, _794);
    float _798 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _800 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _802 = _778 * _800;
    float _804 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _806 = -_788;
    float _808 = fma(_778, _804, _806);
    float _810 = _796 * _796;
    float _812 = abs(_680);
    float _814 = _784 * _812;
    float _816 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _818 = -_802;
    float _820 = fma(_772, _816, _818);
    float _822 = precise::max(_646, 1.0);
    float _824 = fma(_808, _808, _810);
    float _826 = fma(_774, _688, _814);
    float _828 = float(_790);
    float _830 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[84].x, _766);
    float _832 = fma(_820, _820, _824);
    float _834 = abs(_684);
    float _836 = fma(_828, _834, _826);
    float _838 = -_106;
    float _840 = fma(_838, (*spvDescriptorSet0.vp_c9)._m0[76].x, _320);
    float _842 = _798 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _844 = rsqrt(_832);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _848 = fma(_842, _530, -0.5);
    float _850 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[77].z, _396);
    float _852 = _836 * _308;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _856 = _502 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _858 = fma(_850, _708, _840);
    float _860 = _852 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _862 = fma(_726, -2.0, _846);
    float _864 = -_854;
    float _866 = fma(_856, 2.0, _864);
    float _868 = _836 * _312;
    float _870 = _836 * _316;
    float _872 = _408 * _860;
    float _874 = _796 * _844;
    float _876 = _808 * _844;
    float _878 = _820 * _844;
    float _880 = _868 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _882 = _776 * _874;
    float _884 = _778 * _876;
    float _886 = _870 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _888 = _332 * _880;
    float _890 = -_882;
    float _892 = fma(_778, _878, _890);
    float _894 = -_884;
    float _896 = fma(_772, _874, _894);
    float _898 = _350 * _886;
    float _900 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _902 = _888 * _892;
    float _904 = _888 * _896;
    float _906 = _830 * (-0.15915493667125701904296875);
    float _908 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].w, _424);
    float _910 = fma(_872, _876, _902);
    float _912 = fma(_872, _878, _904);
    float _914 = precise::min(_822, 1.89999997615814208984375);
    float _916 = _550 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _918 = fma(_898, _772, _910);
    float _920 = fma(_898, _776, _912);
    float _922 = _906 * 6.283185482025146484375;
    float _924 = sin(_922);
    float _926 = fma(_916, -2.0, _900);
    float _928 = fma(_918, _914, _692);
    float _930 = fma(_920, _914, _700);
    float _932 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].z, _540);
    float _934 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[86].y, _926);
    float _936 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _938 = _928 + _936;
    float _940 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _942 = _930 + _940;
    float _944 = _906 * 6.283185482025146484375;
    float _946 = cos(_944);
    float _948 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[87].z, _286);
    float _950 = _938 * _938;
    float _952 = _942 * _942;
    float _954 = -_106;
    float _956 = fma(_954, (*spvDescriptorSet0.vp_c9)._m0[86].x, _866);
    float _958 = -_934;
    float _960 = fma(_908, _848, _958);
    float _962 = -_106;
    float _964 = fma(_962, (*spvDescriptorSet0.vp_c9)._m0[81].x, _746);
    float _966 = _950 + _952;
    float _968 = _772 * _878;
    float _970 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _972 = _676 + _970;
    float _974 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[82].w, _770);
    float _976 = sqrt(_966);
    float _978 = fma(_106, (*spvDescriptorSet0.vp_c9)._m0[81].y, _862);
    float _980 = fma(_948, _760, _956);
    float _982 = _924 * _352;
    float _984 = -_968;
    float _986 = fma(_776, _876, _984);
    float _988 = _946 * _352;
    float _990 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _992 = _692 + _990;
    float _994 = _972 * _972;
    float _996 = -_982;
    float _998 = fma(_946, _720, _996);
    float _1000 = _888 * _986;
    float _1002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1004 = _700 + _1002;
    float _1006 = fma(_992, _992, _994);
    float _1008 = fma(_924, _720, _988);
    float _1010 = fma(_872, _874, _1000);
    float _1012 = fma(_932, _998, _964);
    float _1014 = fma(_1004, _1004, _1006);
    bool _1016 = _976 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1018 = fma(_898, _778, _1010);
    float _1020 = -_978;
    float _1022 = fma(_974, _1008, _1020);
    float _1024 = rsqrt(_1014);
    float _1026 = _254 * _892;
    float _1028 = fma(_1018, _914, _676);
    float _1030 = _254 * _986;
    float _1032 = _254 * _896;
    float _1034 = _892 * _162;
    float _1036 = _986 * _162;
    float _1038 = _896 * _162;
    float _1040 = _950;
    float _1042 = _952;
    float _1044 = _928;
    float _1046 = _930;
    if (!_1016)
    {
        _264 = _1028;
    }
    float _1048 = _264;
    bool _1050 = !_1016;
    float _1052 = _1048;
    if (!_1050)
    {
        float _1054 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1056 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1058 = _976 + _1056;
        float _1060 = _1028 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = rsqrt(_966);
        float _1064 = _1058 * _1054;
        float _1066 = _1064 * 0.15915493667125701904296875;
        float _1068 = _1066 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 * 6.283185482025146484375;
        float _1074 = cos(_1072);
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = _1062 * _1076;
        float _1080 = _1074 + (-1.0);
        float _1082 = fma(_938, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1084 = fma(_942, _1078, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1086 = _1080 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1088 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1090 = _1082 + _1088;
        float _1092 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1094 = _1084 + _1092;
        float _1096 = fma(_1028, _1074, _1086);
        float _1098 = _1090 * _1090;
        float _1100 = _1094 * _1094;
        _1052 = _1096;
        _1040 = _1098;
        _1042 = _1100;
        _1044 = _1082;
        _1046 = _1084;
    }
    float _1102 = _1052;
    float _1104 = _1040;
    float _1106 = _1042;
    float _1108 = _1044;
    float _1110 = _1046;
    float _1112 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1114 = _1102 + _1112;
    float _1116 = fma(_274, _876, _1026);
    float _1118 = fma(_274, _878, _1032);
    float _1120 = fma(_874, _160, _1036);
    float _1122 = fma(_1114, _1114, _1104);
    float _1124 = fma(_876, _160, _1034);
    float _1126 = fma(_274, _874, _1030);
    float _1128 = fma(_878, _160, _1038);
    float _1130 = _1122 + _1106;
    float _1132 = fma(_772, _164, _1124);
    float _1134 = _1004 * _1024;
    float _1136 = fma(_306, _772, _1116);
    float _1138 = fma(_778, _164, _1120);
    float _1140 = _992 * _1024;
    float _1142 = sqrt(_1130);
    float _1144 = _972 * _1024;
    float _1146 = fma(_306, _778, _1126);
    float _1148 = fma(_306, _776, _1118);
    float _1150 = _440 + 0.5;
    float _1152 = _858 + 0.5;
    float _1154 = _980 + 0.5;
    float _1156 = _960 + 0.5;
    float _1158 = _1012 + 0.5;
    float _1160 = _1022 + 0.5;
    float _1162 = fma(_776, _164, _1128);
    out.m_65.x = _1140;
    out.m_65.y = _1144;
    out.m_65.z = _1134;
    out.m_67.x = _1154;
    out.m_67.y = _1156;
    bool _1164 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1166 = isnan(_1142);
    bool _1168 = _1164 || _1166;
    bool _1170 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1172 = _1168 || _1170;
    out.m_69.x = _1152;
    out.m_69.y = _1150;
    out.m_69.z = _1158;
    out.m_69.w = _1160;
    out.m_71.x = _1136;
    out.m_71.y = _1146;
    out.m_71.z = _1148;
    out.m_73.x = _1132;
    out.m_73.y = _1138;
    out.m_73.z = _1162;
    float _1174 = _1146;
    if (!_1172)
    {
        _366 = 1.0;
    }
    float _1176 = _366;
    bool _1178 = !_1172;
    float _1180 = _1176;
    if (!_1178)
    {
        bool _1182 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1184 = isnan(_1142);
        bool _1186 = _1182 || _1184;
        bool _1188 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1190 = _1186 || _1188;
        if (!_1190)
        {
            float _1192 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1194 = _1142 + _1192;
            float _1196 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1198 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1196;
            float _1200 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1202 = _1200 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1204 = 1.0 / _1198;
            float _1206 = _1194 * _1204;
            float _1208 = fma(_1206, _1202, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1180 = _1208;
            _1210 = true;
        }
        else
        {
            bool _1212 = _1142 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1214 = isnan(_1142);
            bool _1216 = _1212 || _1214;
            bool _1218 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1220 = _1216 || _1218;
            if (!_1220)
            {
                float _1222 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1224 = _1142 + _1222;
                float _1226 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1228 = _1226 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1230 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1232 = _1230 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1234 = 1.0 / _1228;
                float _1236 = _1224 * _1234;
                float _1238 = fma(_1236, _1232, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1180 = _1238;
                _1210 = true;
            }
            else
            {
                _1180 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1210 = false;
    float _1240 = _1180;
    float _1242 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1244 = _1108 + _1242;
    float _1246 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1248 = _1110 + _1246;
    bool _1250 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1252 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.5);
    bool _1258 = _1254 || _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1262 = _1102 + _1260;
    float _1264 = fma(_1244, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1266 = fma(_1248, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1268 = fma(_1262, _1240, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1270 = _1248;
    float _1272 = _1240;
    float _1274 = _1268;
    if (_1258)
    {
        _1270 = _1264;
    }
    float _1276 = _1270;
    float _1278 = _1276;
    if (_1258)
    {
        _1272 = _1266;
    }
    float _1280 = _1272;
    float _1282 = _1280;
    if (!_1258)
    {
        float _1284 = sqrt(_1014);
        float _1286 = -_676;
        float _1288 = _1286 + _1268;
        float _1290 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1292 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1294 = precise::min(_1284, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1296 = _1290 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1298 = _1294 * _1292;
        float _1300 = -_692;
        float _1302 = _1300 + _1264;
        float _1304 = _1296 * _1298;
        float _1306 = -_700;
        float _1308 = _1306 + _1266;
        float _1310 = fma(_1302, _1304, _692);
        float _1312 = fma(_1288, _1304, _676);
        float _1314 = fma(_1308, _1304, _700);
        _1274 = _1312;
        _1278 = _1310;
        _1282 = _1314;
    }
    float _1316 = _1274;
    float _1318 = _1278;
    float _1320 = _1282;
    float _1322 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1324 = _1316 + _1322;
    float _1326 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1328 = _1318 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1332 = _1320 + _1330;
    float _1334 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1336 = _1324 * _1324;
    float _1338 = fma(_1328, _1328, _1336);
    float _1340 = fma(_1332, _1332, _1338);
    float _1342 = rsqrt(_1340);
    float _1344 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1346 = _1328 * _1344;
    float _1348 = _1332 * _1344;
    float _1350 = _1346 * _1346;
    float _1352 = _1348 * _1348;
    float _1354 = _1350 + _1352;
    float _1356 = sqrt(_1354);
    bool _1358 = _1356 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1362 = _1356 + _1360;
    float _1364 = _1332;
    float _1366 = _1362;
    float _1368 = _1336;
    float _1370 = _1334;
    float _1372 = _1346;
    float _1374 = _1324;
    if (_1358)
    {
        float _1376 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1364 = _1376;
    }
    float _1378 = _1364;
    if (_1358)
    {
        float _1380 = _1362 * _1378;
        _1366 = _1380;
    }
    float _1382 = _1366;
    if (_1358)
    {
        float _1384 = _1382 * 0.15915493667125701904296875;
        _1368 = _1384;
    }
    float _1386 = _1368;
    float _1388 = precise::max(0.0, _1334);
    float _1390 = _1388;
    if (_1358)
    {
        float _1392 = rsqrt(_1354);
        _1370 = _1392;
    }
    float _1394 = _1370;
    float _1396 = -_1344;
    float _1398 = -_1388;
    float _1400 = fma(_1324, _1396, _1398);
    float _1402 = _1394;
    if (_1358)
    {
        float _1404 = _1400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1390 = _1404;
    }
    float _1406 = _1390;
    float _1408 = _1378;
    float _1410 = _1406;
    if (_1358)
    {
        float _1412 = _1386 * 6.283185482025146484375;
        float _1414 = sin(_1412);
        _1408 = _1414;
    }
    float _1416 = _1408;
    float _1418 = _1342;
    if (_1358)
    {
        float _1420 = _1386 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = _1416;
    if (_1358)
    {
        float _1428 = fma(_1416, _1406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _444 = _1428;
    }
    float _1430 = _444;
    float _1432 = sqrt(_1340);
    if (!_1358)
    {
        _1426 = _1348;
    }
    float _1434 = _1426;
    float _1436 = _1434;
    if (_1358)
    {
        float _1438 = _1394 * _1430;
        _1174 = _1438;
    }
    float _1440 = _1174;
    if (!_1358)
    {
        _1402 = _1400;
    }
    float _1442 = _1402;
    float _1444 = _1442;
    if (_1358)
    {
        float _1446 = _1424 + (-1.0);
        _1410 = _1446;
    }
    float _1448 = _1410;
    float _1450 = _1448;
    if (_1358)
    {
        float _1452 = _1346 * _1440;
        _1372 = _1452;
    }
    float _1454 = _1372;
    if (_1358)
    {
        float _1456 = _1348 * _1440;
        _1436 = _1456;
    }
    float _1458 = _1436;
    float _1460 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    if (_1358)
    {
        float _1462 = _1448 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1374 = _1462;
    }
    float _1464 = _1374;
    float _1466 = _1464;
    if (!_1358)
    {
        _1450 = _1350;
    }
    float _1468 = _1450;
    float _1470 = _1468;
    if (_1358)
    {
        float _1472 = _1454 * _1454;
        _1470 = _1472;
    }
    float _1474 = _1470;
    if (_1358)
    {
        float _1476 = fma(_1400, _1424, _1464);
        _1444 = _1476;
    }
    float _1478 = _1444;
    if (!_1358)
    {
        _1466 = _1352;
    }
    float _1480 = _1466;
    float _1482 = _1480;
    if (_1358)
    {
        float _1484 = _1458 * _1458;
        _1482 = _1484;
    }
    float _1486 = _1482;
    float _1488 = fma(_1478, _1478, _1474);
    float _1490 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1492 = _1488 + _1486;
    float _1494 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1496 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1498 = fma(_1432, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1496);
    float _1500 = precise::clamp(_1498, 0.0, 1.0);
    float _1502 = rsqrt(_1492);
    float _1504 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1494);
    float _1506 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1508 = -_1500;
    float _1510 = _1508 + 1.0;
    float _1512 = _1316 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1514 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1504);
    float _1516 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1506);
    float _1518 = abs(_1510);
    float _1520 = log2(_1518);
    float _1522 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1512);
    float _1524 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1516);
    float _1526 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1460);
    float _1528 = _1514 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1530 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1522);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1534 = fma(_1320, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1526);
    float _1536 = _1502 * _1454;
    float _1538 = _1528 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1540 = _1530 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1542 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1544 = _1502 * _1478;
    float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1548 = -_1538;
    float _1550 = fma(_1548, _1490, 1.0);
    float _1552 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1542);
    float _1554 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1556 = _1502 * _1458;
    float _1558 = -_1546;
    float _1560 = fma(_1544, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1558);
    float _1562 = _1534 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1564 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1552);
    float _1566 = log2(_1550);
    float _1568 = -_1556;
    float _1570 = fma(_1568, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1560);
    float _1572 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1574 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1564);
    float _1576 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1578 = fma(_1570, -0.5, 0.5);
    float _1580 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1572);
    float _1582 = fma(_1570, 0.5, 0.5);
    float _1584 = exp2(_1554);
    float _1586 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1576);
    float _1588 = _1544 + 1.0;
    float _1590 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1580);
    float _1592 = fma(_1582, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1594 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1586);
    float _1596 = 1.0 / _1574;
    float _1598 = _1566 * 0.693147182464599609375;
    float _1600 = sqrt(_1578);
    float _1602 = -_1544;
    float _1604 = fma(_1584, _1588, _1602);
    float _1606 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1590);
    float _1608 = fma(_1582, _1592, -0.212114393711090087890625);
    float _1610 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1594);
    float _1612 = fma(_1604, 0.5, 0.5);
    float _1614 = fma(_1582, _1608, 1.570728778839111328125);
    float _1616 = _1606 * _1596;
    float _1618 = _1610 * _1596;
    float _1620 = _1598 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1622 = fma(_1616, 0.5, 0.5);
    float _1624 = fma(_1618, -0.5, 0.5);
    float _1626 = _1600 * 0.636619746685028076171875;
    float3 _4256 = float3(_1622, _1624, _1620);
    float _1628 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4256, float3(0.0), isnan(_4256)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4256, float3(0.0), isnan(_4256)), level(0.0)).x;
    float3 _4267 = float3(_1622, _1624, _1620);
    float4 _1631 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4267, float3(0.0), isnan(_4267)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4267, float3(0.0), isnan(_4267)), level(0.0)).xyzw;
    float _1633 = _1631.x;
    float _1635 = _1631.y;
    float _1637 = _1631.z;
    float _1639 = _1631.w;
    float _1641 = -_1614;
    float _1643 = fma(_1626, _1641, 1.0);
    float2 _4289 = float2(_1643, _1612);
    float3 _1647 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4289, float2(0.0), isnan(_4289)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4289, float2(0.0), isnan(_4289)), level(0.0)).xyz;
    float _1649 = _1647.x;
    float _1651 = _1647.y;
    float _1653 = _1647.z;
    float _1655 = _1520 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1532 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_75.x = _692;
    out.m_75.y = _676;
    out.m_75.z = _700;
    float _1659 = fma(_1540, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1661 = exp2(_1655);
    float _1663 = fma(_1528, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1659);
    float _1665 = fma(_1562, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1663);
    float _1667 = _1665 + _1574;
    float _1669 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.gl_Position.x = _1606;
    out.gl_Position.y = _1610;
    out.gl_Position.z = _1665;
    out.gl_Position.w = _1574;
    float _1671 = _1667 * 0.5;
    float _1673 = -_1661;
    float _1675 = _1673 + 1.0;
    out.m_77.w = _1669;
    float _1677 = _1675 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_79.z = _1671;
    out.m_79.w = _1574;
    out.m_51.x = 1.0;
    float _1679 = _1677 * _1628;
    float _1681 = -_1677;
    float _1683 = _1681 + 1.0;
    float _1685 = _1639 * _1679;
    float _1687 = _1653 * _1679;
    float _1689 = fma(_1649, _1685, _1633);
    float _1691 = fma(_1651, _1685, _1635);
    float _1693 = _1639 * _1683;
    float _1695 = fma(_1639, _1687, _1637);
    out.m_81.x = _1689;
    out.m_81.y = _1691;
    out.m_81.z = _1695;
    out.m_81.w = _1693;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

